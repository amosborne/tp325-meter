#include <msp430.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>
#include <lookup.h>

static void init_gpio();
static void init_clock();
static void init_timer();
static void init_adc();

#define SER BIT0
#define RCLK BIT1
#define SRCLK BIT2

#define CLOCK_FREQ 8  // MHz
#define SYSTEM_TICK 20  // us
#define SYSTEM_ISR_TIMER SYSTEM_TICK * CLOCK_FREQ - 1

#define DISPLAY_FREQ 100  // Hz
#define DISPLAY_TICK 1000000 / DISPLAY_FREQ / SYSTEM_TICK / 4

#define UPDATE_FREQ 5  // Hz
#define UPDATE_TICK 1000000 / SYSTEM_TICK / UPDATE_FREQ

#define MOVAVEN 13  // number of readings to average
#define DEADBAND 3  // digits
#define OFFSET 15  // mV

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
    BCSCTL1 = CALBC1_8MHZ | DIVA_2; // select frequency, ALCK = MCLK/4
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
    int i;
    for (i = (MOVAVEN - 2); i >= 0; --i) {
        readings[i + 1] = readings[i];
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

    int i;
    if (update_tick == UPDATE_TICK) {
        update_tick = 0;

        // insertion sort and take median
        unsigned int sorted_readings[MOVAVEN] = {0};
        int j, k;
        for (i = 0; i <= (MOVAVEN - 1); ++i) {
            if (i == 0) {
                sorted_readings[0] = readings[0];
                continue;
            }
            for (j = 0; j <= (i - 1); ++j) {
                if (readings[i] <= sorted_readings[j]) {
                    for (k = i; k > j; --k) {
                        sorted_readings[k] = sorted_readings[k - 1];
                    }
                    sorted_readings[j] = readings[i];
                    break;
                }
                if (j == (i - 1)) sorted_readings[i] = readings[i];
            }
        }
        unsigned int this_reading = sorted_readings[MOVAVEN / 2];
        if (abs((int) this_reading - (int) update_reading) > DEADBAND) {
            update_reading = this_reading;
        }
    }

    // compute the display description byte
    unsigned int segment = 1 << display_digit;  // segment to update
    unsigned int calibrated_reading = OFFSET;
    unsigned int convert_reading = update_reading;
    while (convert_reading >= ADC_LOOKUP_SIZE) {
        calibrated_reading += ADC_LOOKUP[ADC_LOOKUP_SIZE - 1];
        convert_reading -= ADC_LOOKUP_SIZE;
    }
    calibrated_reading += ADC_LOOKUP[convert_reading];

    unsigned int base = 1;
    for (i = (4 - display_digit); i > 0; --i) { base = base * 10; }
    unsigned int overbase = calibrated_reading / base;
    unsigned int cutoff = overbase * base;
    unsigned int val = calibrated_reading - cutoff;
    for (i = (3 - display_digit); i > 0; --i) { val = val / 10; }  // value to display
    uint8_t byte = (val << 4) | segment;

    // write to the display
    for (i = 0; i < 8; ++i) {
        P1OUT &= ~SRCLK;
        if ((byte >> i) & BIT0) { P1OUT |= SER; }
        else { P1OUT &= ~SER; }
        P1OUT |= SRCLK;
    }
    P1OUT |= RCLK;
    P1OUT ^= RCLK;

    // update the display digit
    display_digit += 1;
    if (display_digit > 3) { display_digit = 0; }
}
