#include <msp430.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <lookup.h>

static void init_gpio();
static void init_clock();
static void init_timer();
static void init_adc();

static unsigned int find_median(unsigned int *);
static void write_to_display(unsigned int, unsigned int);

const unsigned int BASE[] = {10000, 1000, 100, 10, 1};

#define WINDOW_SIZE 15
#define DEADBAND 8

// SHIFT REGISTER BIT ALIASES
#define   SER BIT0
#define  RCLK BIT1
#define SRCLK BIT2

// FREQUENCIES
#define  SYSTEM_TICK  20  //  us
#define   CLOCK_FREQ   8  // MHz
#define DISPLAY_FREQ 100  //  Hz
#define     ADC_FREQ  50  //  Hz
#define  UPDATE_FREQ   6  //  Hz

// COUNTERS and INTERRUPT FLAGS
#define  SYSTEM_TIMER SYSTEM_TICK * CLOCK_FREQ
#define DISPLAY_TIMER 1000000 / DISPLAY_FREQ / SYSTEM_TICK / 4
#define     ADC_TIMER 1000000 /     ADC_FREQ / SYSTEM_TICK
#define  UPDATE_TIMER 1000000 /  UPDATE_FREQ / SYSTEM_TICK

volatile unsigned int display_tick;
volatile unsigned int     adc_tick;
volatile unsigned int  update_tick;

volatile bool display_flag;
volatile bool     adc_flag;
volatile bool   shift_flag;
volatile bool  update_flag;

// MAIN LOOP
void main(void)
{
	WDTCTL = WDTPW | WDTHOLD;                 // stop watchdog timer

	init_gpio();
	init_clock();
	init_adc();
	init_timer();

	unsigned int i = 0;                       // general purpose counter

	unsigned int display_digit   = 0;         // display digit to cycle
	unsigned int display_reading = 0;         // reading to be displayed

	unsigned int readings[WINDOW_SIZE] = {};  // most recent adc readings
	unsigned int   sorted[WINDOW_SIZE] = {};  // most recent adc readings, sorted
	unsigned int  median_reading = 0;         // median of recent adc readings
	unsigned int updated_reading = 0;         // up-to-date calibrated reading

	unsigned int leftover, index, lookup, slope, calibrated;

	while(true) {

	    if (display_flag) {
	        // reset the flag
	        display_flag = false;

	        // update the display reading at the start of each cycle
	        if (~display_digit) { display_reading = updated_reading; }

	        // output the display reading
	        write_to_display(display_reading, display_digit);

	        // update the display digit
	        display_digit = (display_digit + 1) & 0x3;
	    }

	    if (adc_flag) {
	        // reset the flag
	        adc_flag = false;

            // execute a new adc conversion
	        ADC10CTL0 |= ADC10SC;
	    }

	    if (shift_flag) {
	        // reset the flag
	        shift_flag = false;

	        // copy adc readings over by one
            for (i = (WINDOW_SIZE - 1); i; --i) {
                readings[i] = readings[i - 1];
            }

            // insert the new adc reading
            readings[0] = ADC10MEM;
	    }

	    if (update_flag) {
	        // reset the flag
	        update_flag = false;

	        // compute the median adc reading
	        memcpy(sorted, readings, sizeof(unsigned int) * WINDOW_SIZE);
	        median_reading = find_median(sorted);

	        // perform calibration and update
	        leftover = median_reading & 0x1F;  // mask last 4 bits
	        index = median_reading >> 5;       // lookup table index
	        lookup = ADC_LOOKUP[index];

	        if (index) { slope = (lookup - ADC_LOOKUP[index - 1]); }
	        else { slope = ADC_LOOKUP[index + 1] - lookup; }

	        calibrated = ((slope * leftover) >> 5) + lookup;
	        if (abs((int) calibrated - (int) updated_reading) > DEADBAND) {
	            updated_reading = calibrated;
	        }
	    }

	}
}

// INITIALIZATION ROUTINES: GPIO, CLOCK, ADC, TIMER/INTERRUPTS
void init_gpio()
{
    P1DIR = 0xFF;  // set all port 1 to output
    P1OUT = 0;     // set all port 1 outputs to low
    P2DIR = 0xFF;  // set all port 2 to output
    P2OUT = 0;     // set all port 2 outputs to low
}

void init_clock()
{
    DCOCTL = CALDCO_8MHZ;            // select frequency range
    BCSCTL1 = CALBC1_8MHZ | DIVA_0;  // select frequency, ALCK = MCLK
}

void init_adc()
{
    ADC10CTL1 = INCH_5 | ADC10SSEL_1;     // read A5 (P1.5) once, use ACLK
    ADC10AE0 = BIT5;                      // enable A5 analog input
    ADC10CTL0 = ADC10ON | ADC10IE | ENC;  // adc on, interrupt enabled
}

void init_timer()
{
    TACCR0 = 0;               // stop timer
    TACCTL0 |= CCIE;          // enable timer interrupt
    TACTL = TASSEL_2 + MC_1;  // set source to SMCLK, up-mode
    TACCR0 = SYSTEM_TIMER;    // set accumulation threshold
    _enable_interrupt();      // enable global interrupts
}

// INTERRUPT ROUTINES: ADC READ, INCREMENT COUNTERS
#pragma vector = ADC10_VECTOR
interrupt void read_adc(void)
{
    shift_flag = true;
}

#pragma vector = TIMER0_A0_VECTOR
interrupt void increment_counters(void)
{
    if (display_tick < DISPLAY_TIMER) {
        display_tick += 1;
    } else {
        display_tick = 0;
        display_flag = true;
    }

    if (adc_tick < ADC_TIMER) {
        adc_tick += 1;
    } else {
        adc_tick = 0;
        adc_flag = true;
    }

    if (update_tick < UPDATE_TIMER) {
        update_tick += 1;
    } else {
        update_tick = 0;
        update_flag = true;
    }
}

// HELPER ROUTINES: FIND ARRAY MEDIAN, WRITE TO DISPLAY
unsigned int find_median(unsigned int * readings)
{
    // bubble sort algorithm (see wikipedia)
    unsigned int i, tmp, newn, n = WINDOW_SIZE;
    while (n > 1) {
        newn = 0;
        for (i = 1; i < n; ++i) {
            if (readings[i - 1] > readings[i]) {
                tmp = readings[i - 1];
                readings[i - 1] = readings[i];
                readings[i] = tmp;
                newn = i;
            }
        }
        n = newn;
    }
    return readings[WINDOW_SIZE / 2];
}

void write_to_display(unsigned int reading, unsigned int digit)
{
    // compute the byte to send to the shift register
    unsigned int overflow = ((reading / BASE[digit]) * BASE[digit]);
    uint8_t value = (reading - overflow) / BASE[digit + 1];
    uint8_t segment = (1 << digit);
    uint8_t byte = (value << 4) | segment;

    // send the byte to the shift register
    unsigned int i;
    for (i = 8; i; --i) {
        P1OUT &= ~SRCLK;  // SRCLK LOW
        if ((byte >> (8 - i)) & BIT0) {
            P1OUT |= SER;
        } else {
            P1OUT &= ~SER;
        }                 // SER HIGH OR LOW
        P1OUT |= SRCLK;   // SRCLK HIGH
    }
    P1OUT |= RCLK;        // RCLK HIGH
    P1OUT ^= RCLK;        // RCLK LOW
}
