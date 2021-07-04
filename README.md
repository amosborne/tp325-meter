# tp325-meter
Refurbish a Power Designs TP325 triple output power supply with a digital meter.

## Demonstration Video

[Link](https://drive.google.com/file/d/1OvPalh1_EWo_ID4mvg1HP6uFQ4V9FpZM/view?usp=sharing)  to demonstration video, stored on Google Drive.

## Construction Pictures

![front panel](./docs/front-panel.png)
![protoboard 1](./docs/proto-1-markup.png)
![protoboard 2](./docs/proto-2-markup.png)
![protoboards 3 and 4](./docs/proto-34-markup.png)

## Operating Principle

- Electrical Schematic ([link](./kicad/tp325-meter.pdf))
- Microcontroller Code ([link](./embed/main.c))

5V and 3V3 power is derived from the TP325 channel-3 21mF capacitor following the transformer and rectifier diodes (typically 13V). A resistive divider and a bipolar transistor set the turn-on/off input voltage threshold, followed by a MOSFET to pull the 5V linear regulator low.

An MSP430 microcontroller drives a shift register with the inputs necessary to realize the proper numeric display. The first 4-bits drive the binary-to-decimal decoder and the second 4-bits drive the MOSFET used to multiplex the LED display anodes.

The TP325 output voltage/current is sensed by a current-sense instrumentation amplifier which is fed through a low-pass filter and into the microcontroller ADC.

The microcontroller is running at a clock speed of 8MHz, the ADC clock is 4MHz. The effective conversion rate is about 300KHz for the 10-bit ADC. The numeric output is updated at a 2Hz rate and is the median of the previous 9 ADC readings.

## Accuracy Result

The meter was calibrated against an Extech EX330 multimeter via a lookup table in the microcontroller software with a digital code-interval of 16. As can be seen by the chart below, the meter is just as reliable as the EX330 multimeter it was calibrated to.

![meter accuracy](./docs/meter-readout-accuracy.png)

## Lessons Learned

- Rather than using 4x single-digit 7-segment LED display, I should have purchased a 4-digit display to avoid having to tie them together by hand. Additionally, I should have purchased a common-cathode LED display in order to multiplex each digit with 1 MOSFET rather than 2.
- I initially tried to amplify the voltage sense signal with a generic op-amp (LM324) rather than an instrumentation amplifier. I was able to get reasonable common-mode rejection by hand selecting matching resistors for the input divider, but ultimately the generic op-amp did not have the common-mode range to operate near it's negative supply (ground).
- The chosen microcontroller only has 1kB of flash memory and 98% of it is currently utilized. With more memory I would have implemented a digital low-pass filter and a deadband on the numeric display to cut down further on the ADC reading noise.
- End-to-end accuracy and noise rejection would also be improved by the addition of a 12-bit ADC and a higher precision reference with which to calibrate it. I suspect the true accuracy of the current design is about 50mV, rendering the final digit of the display entirely useless. With these improvements the accuracy would certainly be below 10mV.
- Numeric display responsiveness would be improved with a faster microcontroller clock speed. The responsiveness clearly deteriorates as more readings are used to detect the median to be displayed. The clock speed cannot be driven much faster before the ADC reading begins to be impacted due to the minimum required rise time.