#include <msp430.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

static void init_gpio();
static void init_clock();
static void init_timer();
static void init_adc();

#define CLOCK_FREQ 8  // MHz
#define SYSTEM_TICK 200  // us
#define SYSTEM_ISR_TIMER SYSTEM_TICK * CLOCK_FREQ - 1

#define DISPLAY_FREQ 250  // Hz
#define DISPLAY_TICK 1000000 / SYSTEM_TICK / DISPLAY_FREQ / 4

#define UPDATE_FREQ 2  // Hz
#define UPDATE_TICK 1000000 / SYSTEM_TICK / UPDATE_FREQ

#define DEADBAND 5  // bits
#define GAIN 6.33  // V/bit
#define OFFSET 5.6 // V

unsigned int display_digit;  // display digit to update
unsigned int last_reading;  // most recent adc result (digitally filtered)
unsigned int update_reading;  // reading to be displayed
unsigned int display_tick;
unsigned int update_tick;

void main(void)
{
	WDTCTL = WDTPW | WDTHOLD;  // stop watchdog timer

	display_digit = 0;
	last_reading = 0;
	display_tick = 0;
	update_tick = 0;

	init_gpio();
	init_clock();
	init_timer();
	init_adc();

	while(true) {
	    continue;
	}
}

void init_gpio()
{
    P1DIR = 0xFF;  // set all port 1 to output
    P2DIR = 0xFF;  // set all port 2 to output
    P3DIR = 0xFF;  // set all port 3 to output
    P1OUT = 0;  // set all port 1 outputs to low
    P2OUT = 0;  // set all port 2 outputs to low
    P3OUT = 0;  // set all port 3 outputs to low
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
    ADC10CTL0 = MSC | ADC10ON;  // adc on, continously read
    ADC10CTL1 = INCH_5 | ADC10SSEL_1 | CONSEQ_2;  // read A5 (P1.5), use ACLK
    ADC10AE0 = BIT5;  // enable A5 analog input
    ADC10CTL0 |= ENC | ADC10SC;  // start conversion
}

#pragma vector = TIMER0_A0_VECTOR
interrupt void update_display(void)
{
    // update the tick counters
    display_tick += 1;
    update_tick += 1;
    if (display_tick < DISPLAY_TICK) { return; }
    else { display_tick = 0; }

    // get the latest adc reading and low-pass filter
    last_reading = ADC10MEM;

    if (update_tick == UPDATE_TICK) {
        update_tick = 0;
        // apply the deadband
        unsigned int diff = abs((int) last_reading - (int) update_reading);
        if ( diff > DEADBAND) { update_reading = last_reading; }
    }

    unsigned int segment = 1 << display_digit;  // segment to update
    unsigned int calibrated_reading = GAIN * update_reading + OFFSET;

    unsigned int i;
    unsigned int base = 1;
    for (i = (4 - display_digit); i > 0; --i) { base = base * 10; }
    unsigned int overbase = calibrated_reading / base;
    unsigned int cutoff = overbase * base;
    unsigned int val = calibrated_reading - cutoff;
    for (i = (3 - display_digit); i > 0; --i) { val = val / 10; }  // value to display
    uint8_t byte = (segment << 4) | val;

    // write to the display
    P1OUT = (P1OUT & 0xF0) | (byte >> 4);
    P2OUT = (P2OUT & 0xF0) | (byte & 0x0F);

    // update the display digit
    display_digit += 1;
    if (display_digit > 3) { display_digit = 0; }
}
