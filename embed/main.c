#include <msp430.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <lookup.h>

static void init_gpio();
static void init_clock();
static void init_timer();
static void init_adc();

static unsigned int calibrated_reading();
static unsigned int median_reading(unsigned int *);

static void display_reading(unsigned int);
static uint8_t reading2byte(unsigned int);
static void byte2display(uint8_t byte);
const unsigned int BASE[] = {10000, 1000, 100, 10, 1};

#define SER BIT0
#define RCLK BIT1
#define SRCLK BIT2

#define CLOCK_FREQ 8  // MHz
#define SYSTEM_TICK 20  // us
#define SYSTEM_ISR_TIMER SYSTEM_TICK * CLOCK_FREQ - 1  // counts

#define DISPLAY_FREQ 100  // Hz
#define DISPLAY_TICK 1000000 / DISPLAY_FREQ / SYSTEM_TICK / 4  // counts

#define UPDATE_FREQ 2  // Hz
#define UPDATE_TICK 1000000 / SYSTEM_TICK / UPDATE_FREQ  // counts

#define MOVAVEN 9  // number of readings to average

unsigned int readings[MOVAVEN];  // array of readings, first element latest
unsigned int display_digit;  // display digit to update
unsigned int update_reading;  // reading to be displayed
unsigned int display_tick;
unsigned int update_tick;

void main(void)
{
	WDTCTL = WDTPW | WDTHOLD;  // stop watchdog timer

	init_gpio();
	init_clock();
	init_timer();
	init_adc();

	_low_power_mode_1();

	while(true) {
	    continue;
	}
}

void init_gpio()
{
    P1DIR = 0xFF;  // set all port 1 to output
    P1OUT = 0;  // set all port 1 outputs to low
    P2OUT = 0;  // set all port 2 outputs to low
    P2DIR = 0xFF;  // set all port 2 to output
}

void init_clock()
{
    DCOCTL = CALDCO_8MHZ;  // select frequency range
    BCSCTL1 = CALBC1_8MHZ | DIVA_1; // select frequency, ALCK = MCLK/2
}

void init_timer()
{
    TACCR0 = 0;  // stop timer
    TACCTL0 |= CCIE;  // enable timer interrupt
    TACTL = TASSEL_2 + MC_1; // set source to SMCLK, up-mode
    _enable_interrupt();  // enable global interrupts
    TACCR0 = SYSTEM_ISR_TIMER;  // set accumulation threshold
}

void init_adc()
{
    ADC10CTL0 = MSC | ADC10ON | ADC10IE;  // adc on, continously read
    ADC10CTL1 = INCH_5 | ADC10SSEL_1 | CONSEQ_2;  // read A5 (P1.5), use ACLK
    ADC10AE0 = BIT5;  // enable A5 analog input
    ADC10CTL0 |= ENC | ADC10SC;  // start conversion
}

#pragma vector = ADC10_VECTOR
interrupt void read_adc(void)
{
    unsigned int i;
    for (i = (MOVAVEN - 1); i; --i) {
        readings[i] = readings[i - 1];
    }
    readings[0] = ADC10MEM;
}

#pragma vector = TIMER0_A0_VECTOR
interrupt void update_display(void)
{
    // update the tick counters
    display_tick += 1;
    update_tick += 1;
    if (display_tick < DISPLAY_TICK) return;
    else display_tick = 0;

    // get the calibrated reading to be displayed
    if (update_tick == UPDATE_TICK) {
        update_tick = 0;
        update_reading = calibrated_reading();
    }

    // write the reading to the display for the current display digit
    display_reading(update_reading);

    // update the display digit
    display_digit = (display_digit + 1) & 0x3;
}

unsigned int median_reading(unsigned int * copy_readings)
{
    // bubble sort algorithm (see wikipedia)
    unsigned int i, tmp, newn, n = MOVAVEN;
    while (n > 1) {
        newn = 0;
        for (i = 1; i < n; ++i) {
            if (copy_readings[i - 1] > copy_readings[i]) {
                tmp = copy_readings[i - 1];
                copy_readings[i - 1] = copy_readings[i];
                copy_readings[i] = tmp;
                newn = i;
            }
        }
        n = newn;
    }
    return copy_readings[MOVAVEN / 2];
}

unsigned int calibrated_reading()
{
    unsigned int copy_readings[MOVAVEN] = {};
    memcpy(copy_readings, readings, sizeof(unsigned int) * MOVAVEN);
    unsigned int reading = median_reading(copy_readings);

    unsigned int leftover = reading & 0xF;  // mask last 4 bits
    unsigned int index = reading >> 4;  // lookup table index
    unsigned int lookup = ADC_LOOKUP[index];

    unsigned int slope;
    if (index) { slope = (lookup - ADC_LOOKUP[index - 1]); }
    else { slope = ADC_LOOKUP[index + 1] - lookup; }

    return ((slope * leftover) >> 4) + lookup;
}

uint8_t reading2byte(unsigned int reading)
{
    unsigned int overflow = ((reading / BASE[display_digit]) * BASE[display_digit]);
    uint8_t value = (reading - overflow) / BASE[display_digit + 1];
    uint8_t segment = (1 << display_digit);
    return (value << 4) | segment;
}

void byte2display(uint8_t byte)
{
    unsigned int i;
    for (i = 8; i; --i) {
        P1OUT &= ~SRCLK;  // SRCLK LOW
        if ((byte >> (8 - i)) & BIT0) { P1OUT |= SER; }  // SER HIGH
        else { P1OUT &= ~SER; }  // SER LOW
        P1OUT |= SRCLK;  // SRCLK HIGH
    }
    P1OUT |= RCLK;  // RCLK HIGH
    P1OUT ^= RCLK;  // RCLK LOW
}

void display_reading(unsigned int reading)
{
    uint8_t byte = reading2byte(reading);
    byte2display(byte);
}
