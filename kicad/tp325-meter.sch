EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "Power Designs TP325 Digital Meter"
Date "2021-04-29"
Rev "A"
Comp ""
Comment1 "amosborne/tp325-meter"
Comment2 "2021-04-29"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L tp325-meter:Resistor R1
U 1 1 60903B8A
P 8000 5600
F 0 "R1" V 8050 5700 50  0000 L CNN
F 1 "180" V 8050 5500 50  0000 R CNN
F 2 "" V 8040 5590 50  0001 C CNN
F 3 "~" H 8000 5600 50  0001 C CNN
	1    8000 5600
	0    -1   -1   0   
$EndComp
$Comp
L tp325-meter:SA56-21SRWA U1
U 1 1 60914073
P 9250 2250
F 0 "U1" H 9450 2550 50  0000 C CNN
F 1 "SA56-21SRWA" H 9250 1950 50  0000 C CNN
F 2 "" H 8910 1850 50  0001 C CNN
F 3 "https://www.kingbrightusa.com/images/catalog/SPEC/SA56-21SRWA.pdf" H 8910 1850 50  0001 C CNN
	1    9250 2250
	1    0    0    -1  
$EndComp
$Comp
L tp325-meter:Resistor R2
U 1 1 6095CA25
P 8000 5700
F 0 "R2" V 8050 5800 50  0000 L CNN
F 1 "180" V 8050 5600 50  0000 R CNN
F 2 "" V 8040 5690 50  0001 C CNN
F 3 "~" H 8000 5700 50  0001 C CNN
	1    8000 5700
	0    -1   -1   0   
$EndComp
$Comp
L tp325-meter:Resistor R3
U 1 1 6095D73C
P 8000 5800
F 0 "R3" V 8050 5900 50  0000 L CNN
F 1 "180" V 8050 5700 50  0000 R CNN
F 2 "" V 8040 5790 50  0001 C CNN
F 3 "~" H 8000 5800 50  0001 C CNN
	1    8000 5800
	0    -1   -1   0   
$EndComp
$Comp
L tp325-meter:Resistor R4
U 1 1 6095D9FA
P 8000 5900
F 0 "R4" V 8050 6000 50  0000 L CNN
F 1 "180" V 8050 5800 50  0000 R CNN
F 2 "" V 8040 5890 50  0001 C CNN
F 3 "~" H 8000 5900 50  0001 C CNN
	1    8000 5900
	0    -1   -1   0   
$EndComp
$Comp
L tp325-meter:Resistor R5
U 1 1 6095DD0B
P 8000 6000
F 0 "R5" V 8050 6100 50  0000 L CNN
F 1 "180" V 8050 5900 50  0000 R CNN
F 2 "" V 8040 5990 50  0001 C CNN
F 3 "~" H 8000 6000 50  0001 C CNN
	1    8000 6000
	0    -1   -1   0   
$EndComp
$Comp
L tp325-meter:Resistor R6
U 1 1 60961F70
P 8000 6100
F 0 "R6" V 8050 6200 50  0000 L CNN
F 1 "180" V 8050 6000 50  0000 R CNN
F 2 "" V 8040 6090 50  0001 C CNN
F 3 "~" H 8000 6100 50  0001 C CNN
	1    8000 6100
	0    -1   -1   0   
$EndComp
$Comp
L tp325-meter:Resistor R8
U 1 1 609626CB
P 8000 6200
F 0 "R8" V 8050 6300 50  0000 L CNN
F 1 "180" V 8050 6100 50  0000 R CNN
F 2 "" V 8040 6190 50  0001 C CNN
F 3 "~" H 8000 6200 50  0001 C CNN
	1    8000 6200
	0    -1   -1   0   
$EndComp
$Comp
L tp325-meter:Resistor R7
U 1 1 609C79A7
P 10100 2700
F 0 "R7" H 10250 2750 50  0000 C CNN
F 1 "270" H 10250 2650 50  0000 C CNN
F 2 "" V 10140 2690 50  0001 C CNN
F 3 "~" H 10100 2700 50  0001 C CNN
	1    10100 2700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 609CF5FD
P 10100 2950
F 0 "#PWR012" H 10100 2700 50  0001 C CNN
F 1 "GND" H 10250 2900 50  0000 C CNN
F 2 "" H 10100 2950 50  0001 C CNN
F 3 "" H 10100 2950 50  0001 C CNN
	1    10100 2950
	1    0    0    -1  
$EndComp
$Comp
L tp325-meter:SN74LS47N U2
U 1 1 608F7529
P 7100 5950
F 0 "U2" H 6750 6450 50  0000 L CNN
F 1 "SN74LS47N" H 6750 5450 50  0000 L CNN
F 2 "" H 6350 5550 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74ls47.pdf" H 6350 5550 50  0001 C CNN
	1    7100 5950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 609667E5
P 7600 6400
F 0 "#PWR013" H 7600 6150 50  0001 C CNN
F 1 "GND" H 7600 6250 50  0000 C CNN
F 2 "" H 7600 6400 50  0001 C CNN
F 3 "" H 7600 6400 50  0001 C CNN
	1    7600 6400
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR05
U 1 1 6096F987
P 6550 5500
F 0 "#PWR05" H 6550 5350 50  0001 C CNN
F 1 "+5V" H 6550 5650 50  0000 C CNN
F 2 "" H 6550 5500 50  0001 C CNN
F 3 "" H 6550 5500 50  0001 C CNN
	1    6550 5500
	1    0    0    -1  
$EndComp
Text Notes 7800 6800 0    50   ~ 0
2.3V (Vdrop) = 5V (Vcc) - 1.8V (Vf) - 0.4V (Vo)\n12.8mA (Ion) = 2.3V (Vdrop) / 180R\n11.9mA (Idp) = 3.2V / 270R
Text Notes 7800 6500 0    50   Italic 0
Calculate the LED current limiting resistors:
Text Notes 7800 7000 0    50   Italic 0
Persistent decimal point designed\nfor use with 6V/5A channel.
$Comp
L tp325-meter:Capacitor-Nonpolar C2
U 1 1 60A3B87F
P 6550 6200
F 0 "C2" H 6450 6250 50  0000 R CNN
F 1 "0.1u" H 6450 6150 50  0000 R CNN
F 2 "" H 6550 6200 50  0001 C CNN
F 3 "~" H 6550 6200 50  0001 C CNN
	1    6550 6200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 60A42009
P 6550 6400
F 0 "#PWR08" H 6550 6150 50  0001 C CNN
F 1 "GND" H 6550 6250 50  0000 C CNN
F 2 "" H 6550 6400 50  0001 C CNN
F 3 "" H 6550 6400 50  0001 C CNN
	1    6550 6400
	-1   0    0    -1  
$EndComp
NoConn ~ 6650 6300
NoConn ~ 6650 6200
NoConn ~ 6650 6100
Wire Wire Line
	9300 2900 9300 2850
Wire Wire Line
	9200 2850 9200 2900
Wire Wire Line
	9200 2850 9300 2850
Wire Wire Line
	9300 3900 9300 3850
Wire Wire Line
	9200 3850 9200 3900
Wire Wire Line
	9200 3850 9300 3850
$Comp
L tp325-meter:SA56-21SRWA U9
U 1 1 6099C9BE
P 9250 4250
F 0 "U9" H 9400 4550 50  0000 L CNN
F 1 "SA56-21SRWA" H 9250 3950 50  0000 C CNN
F 2 "" H 8910 3850 50  0001 C CNN
F 3 "https://www.kingbrightusa.com/images/catalog/SPEC/SA56-21SRWA.pdf" H 8910 3850 50  0001 C CNN
	1    9250 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 4900 9300 4850
Wire Wire Line
	9200 4850 9200 4900
Wire Wire Line
	9200 4850 9300 4850
NoConn ~ 9600 4450
NoConn ~ 9600 5450
$Comp
L tp325-meter:SN74HC595N U3
U 1 1 60A126CE
P 5500 6100
F 0 "U3" H 5250 6650 50  0000 C CNN
F 1 "SN74HC595N" H 5450 5550 50  0000 C CNN
F 2 "" H 4000 7000 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 4000 7000 50  0001 C CNN
	1    5500 6100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR04
U 1 1 60AA1486
P 4900 5600
F 0 "#PWR04" H 4900 5450 50  0001 C CNN
F 1 "+5V" H 4900 5750 50  0000 C CNN
F 2 "" H 4900 5600 50  0001 C CNN
F 3 "" H 4900 5600 50  0001 C CNN
	1    4900 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 2550 4750 2450
Wire Wire Line
	4750 2450 4950 2450
$Comp
L tp325-meter:Capacitor-Nonpolar C1
U 1 1 60F1E7DF
P 3500 1350
F 0 "C1" V 3450 1300 50  0000 R CNN
F 1 "0.1u" V 3550 1300 50  0000 R CNN
F 2 "" H 3500 1350 50  0001 C CNN
F 3 "~" H 3500 1350 50  0001 C CNN
	1    3500 1350
	0    1    1    0   
$EndComp
Wire Wire Line
	3950 1600 4050 1600
Wire Wire Line
	4050 1350 3600 1350
Wire Wire Line
	3050 1600 2950 1600
Wire Wire Line
	2950 1350 2950 1600
Wire Wire Line
	2950 1350 3400 1350
$Comp
L power:GND #PWR07
U 1 1 60F585AC
P 4050 1250
F 0 "#PWR07" H 4050 1000 50  0001 C CNN
F 1 "GND" H 4050 1100 50  0000 C CNN
F 2 "" H 4050 1250 50  0001 C CNN
F 3 "" H 4050 1250 50  0001 C CNN
	1    4050 1250
	1    0    0    1   
$EndComp
Wire Wire Line
	4050 1250 4050 1350
Connection ~ 4050 1350
Wire Wire Line
	4050 1350 4050 1600
Wire Wire Line
	2950 1250 2950 1350
Connection ~ 2950 1350
$Comp
L power:+3V3 #PWR06
U 1 1 60F86A15
P 2950 1250
F 0 "#PWR06" H 2950 1100 50  0001 C CNN
F 1 "+3V3" H 2950 1400 50  0000 C CNN
F 2 "" H 2950 1250 50  0001 C CNN
F 3 "" H 2950 1250 50  0001 C CNN
	1    2950 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 60AE422E
P 4900 6600
F 0 "#PWR014" H 4900 6350 50  0001 C CNN
F 1 "GND" H 4900 6450 50  0000 C CNN
F 2 "" H 4900 6600 50  0001 C CNN
F 3 "" H 4900 6600 50  0001 C CNN
	1    4900 6600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3950 1800 4950 1800
Text Label 4300 2700 2    50   ~ 0
SBWTCK
Text Label 2700 2700 0    50   ~ 0
SBWTDIO
Wire Wire Line
	2700 2700 3050 2700
Wire Wire Line
	3950 2700 4300 2700
Text Label 2700 1800 0    50   ~ 0
RX
Text Label 2700 1900 0    50   ~ 0
TX
Text Label 2700 2000 0    50   ~ 0
ADC
Wire Wire Line
	2700 2000 3050 2000
Wire Wire Line
	2700 1900 3050 1900
Wire Wire Line
	2700 1800 3050 1800
NoConn ~ 3950 2300
NoConn ~ 3050 2500
NoConn ~ 3050 2400
NoConn ~ 3050 2300
NoConn ~ 3050 2200
NoConn ~ 3050 2100
NoConn ~ 3950 2500
NoConn ~ 5900 6500
Text Label 900  1250 0    50   ~ 0
RX
Wire Wire Line
	900  1250 1250 1250
Text Label 900  1350 0    50   ~ 0
TX
Wire Wire Line
	900  1350 1250 1350
Text Label 2100 1250 2    50   ~ 0
SBWTCK
Wire Wire Line
	1750 1250 2100 1250
Text Label 2100 1350 2    50   ~ 0
SBWTDIO
Wire Wire Line
	2100 1350 1750 1350
Wire Wire Line
	1750 1150 2000 1150
Wire Wire Line
	1000 1150 1250 1150
$Comp
L tp325-meter:2x3-Male-Header J1
U 1 1 6121422E
P 1450 1250
F 0 "J1" H 1500 950 50  0000 C CNN
F 1 "2x3-Male-Header" H 1500 1050 50  0000 C CNN
F 2 "" H 1450 1250 50  0001 C CNN
F 3 "~" H 1450 1250 50  0001 C CNN
	1    1450 1250
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR01
U 1 1 6127A5BD
P 1000 1050
F 0 "#PWR01" H 1000 900 50  0001 C CNN
F 1 "+3V3" H 1000 1200 50  0000 C CNN
F 2 "" H 1000 1050 50  0001 C CNN
F 3 "" H 1000 1050 50  0001 C CNN
	1    1000 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 1050 1000 1150
$Comp
L power:GND #PWR02
U 1 1 612AE68E
P 2000 1050
F 0 "#PWR02" H 2000 800 50  0001 C CNN
F 1 "GND" H 2000 900 50  0000 C CNN
F 2 "" H 2000 1050 50  0001 C CNN
F 3 "" H 2000 1050 50  0001 C CNN
	1    2000 1050
	1    0    0    1   
$EndComp
Wire Wire Line
	2000 1050 2000 1150
$Comp
L tp325-meter:MSP430G2152IN2 U4
U 1 1 612FA194
P 3500 2150
F 0 "U4" H 3500 1350 50  0000 C CNN
F 1 "MSP430G2152IN2" H 3500 1450 50  0000 C CNN
F 2 "" H 3050 2000 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/msp430g2152.pdf" H 3050 2000 50  0001 C CNN
	1    3500 2150
	1    0    0    -1  
$EndComp
Text Notes 3600 7500 0    50   ~ 0
72R Meter Sense Voltages Relative to DC-\nVoltage Mode (6V): Vdiff=72mV, Vcmn=5.96V\nCurrent Mode (6V/6A): Vdiff=74mV, Vcmn=6.04V\n\nFirst-Stage Buffer to Eliminate Common-Mode\nSecond-Stage Gain of 38 for 2.75V Full-Scale
$Comp
L tp325-meter:LM324KN U12
U 1 1 61331506
P 1150 7250
F 0 "U12" H 1150 6950 50  0000 C CNN
F 1 "LM324KN" H 1150 7050 50  0000 C CNN
F 2 "" H 1100 7150 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/lm324k.pdf" H 1100 7150 50  0001 C CNN
	1    1150 7250
	1    0    0    -1  
$EndComp
$Comp
L tp325-meter:LM324KN U12
U 2 1 61332702
P 2050 5750
F 0 "U12" H 2300 5600 50  0000 C CNN
F 1 "LM324KN" H 2250 5500 50  0000 C CNN
F 2 "" H 2000 5650 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/lm324k.pdf" H 2000 5650 50  0001 C CNN
	2    2050 5750
	1    0    0    1   
$EndComp
$Comp
L tp325-meter:LM324KN U12
U 3 1 61333E70
P 2800 5850
F 0 "U12" H 3050 6000 50  0000 C CNN
F 1 "LM324KN" H 3000 6100 50  0000 C CNN
F 2 "" H 2750 5750 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/lm324k.pdf" H 2750 5750 50  0001 C CNN
	3    2800 5850
	1    0    0    -1  
$EndComp
$Comp
L tp325-meter:LM324KN U12
U 4 1 613357F6
P 2100 7250
F 0 "U12" H 2400 7400 50  0000 C CNN
F 1 "LM324KN" H 2350 7500 50  0000 C CNN
F 2 "" H 2050 7150 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/lm324k.pdf" H 2050 7150 50  0001 C CNN
	4    2100 7250
	1    0    0    -1  
$EndComp
$Comp
L tp325-meter:LM324KN U12
U 5 1 613373AB
P 3050 7250
F 0 "U12" H 3350 7400 50  0000 C CNN
F 1 "LM324KN" H 3300 7500 50  0000 C CNN
F 2 "" H 3000 7150 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/lm324k.pdf" H 3000 7150 50  0001 C CNN
	5    3050 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR036
U 1 1 6133C12A
P 1500 7400
F 0 "#PWR036" H 1500 7150 50  0001 C CNN
F 1 "GND" H 1500 7250 50  0000 C CNN
F 2 "" H 1500 7400 50  0001 C CNN
F 3 "" H 1500 7400 50  0001 C CNN
	1    1500 7400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1400 7300 1500 7300
$Comp
L power:+5V #PWR035
U 1 1 6136167C
P 1500 7100
F 0 "#PWR035" H 1500 6950 50  0001 C CNN
F 1 "+5V" H 1500 7250 50  0000 C CNN
F 2 "" H 1500 7100 50  0001 C CNN
F 3 "" H 1500 7100 50  0001 C CNN
	1    1500 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 7200 1500 7200
Wire Wire Line
	1500 7200 1500 7100
$Comp
L power:GND #PWR037
U 1 1 61375CE8
P 1800 7400
F 0 "#PWR037" H 1800 7150 50  0001 C CNN
F 1 "GND" H 1800 7250 50  0000 C CNN
F 2 "" H 1800 7400 50  0001 C CNN
F 3 "" H 1800 7400 50  0001 C CNN
	1    1800 7400
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR038
U 1 1 61388D0C
P 2750 7400
F 0 "#PWR038" H 2750 7150 50  0001 C CNN
F 1 "GND" H 2750 7250 50  0000 C CNN
F 2 "" H 2750 7400 50  0001 C CNN
F 3 "" H 2750 7400 50  0001 C CNN
	1    2750 7400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1800 7400 1800 7350
Wire Wire Line
	1800 7350 1900 7350
Wire Wire Line
	1900 7150 1800 7150
Wire Wire Line
	1800 7150 1800 7350
Connection ~ 1800 7350
Wire Wire Line
	2750 7400 2750 7350
Wire Wire Line
	2750 7350 2850 7350
Wire Wire Line
	2850 7150 2750 7150
Wire Wire Line
	2750 7150 2750 7350
Connection ~ 2750 7350
NoConn ~ 2450 7250
NoConn ~ 3400 7250
$Comp
L tp325-meter:Resistor R28
U 1 1 6141F7B0
P 1250 5600
F 0 "R28" H 1200 5550 50  0000 R CNN
F 1 "68" H 1200 5650 50  0000 R CNN
F 2 "" V 1290 5590 50  0001 C CNN
F 3 "~" H 1250 5600 50  0001 C CNN
	1    1250 5600
	1    0    0    1   
$EndComp
$Comp
L tp325-meter:Resistor R22
U 1 1 614203F2
P 1500 5050
F 0 "R22" V 1400 5050 50  0000 C CNN
F 1 "22k" V 1300 5050 50  0000 C CNN
F 2 "" V 1540 5040 50  0001 C CNN
F 3 "~" H 1500 5050 50  0001 C CNN
	1    1500 5050
	0    1    -1   0   
$EndComp
$Comp
L tp325-meter:Resistor R23
U 1 1 614330A0
P 2150 5050
F 0 "R23" V 2050 5050 50  0000 C CNN
F 1 "22k" V 1950 5050 50  0000 C CNN
F 2 "" V 2190 5040 50  0001 C CNN
F 3 "~" H 2150 5050 50  0001 C CNN
	1    2150 5050
	0    1    -1   0   
$EndComp
$Comp
L tp325-meter:Resistor R29
U 1 1 61445C19
P 1500 5850
F 0 "R29" V 1400 5850 50  0000 C CNN
F 1 "22k" V 1300 5850 50  0000 C CNN
F 2 "" V 1540 5840 50  0001 C CNN
F 3 "~" H 1500 5850 50  0001 C CNN
	1    1500 5850
	0    1    -1   0   
$EndComp
$Comp
L tp325-meter:Resistor R30
U 1 1 61458653
P 1750 6100
F 0 "R30" H 1818 6146 50  0000 L CNN
F 1 "22k" H 1818 6055 50  0000 L CNN
F 2 "" V 1790 6090 50  0001 C CNN
F 3 "~" H 1750 6100 50  0001 C CNN
	1    1750 6100
	1    0    0    -1  
$EndComp
$Comp
L tp325-meter:Resistor R26
U 1 1 6146B1F9
P 1250 5300
F 0 "R26" H 1200 5250 50  0000 R CNN
F 1 "4.7" H 1200 5350 50  0000 R CNN
F 2 "" V 1290 5290 50  0001 C CNN
F 3 "~" H 1250 5300 50  0001 C CNN
	1    1250 5300
	1    0    0    1   
$EndComp
Wire Wire Line
	1250 5750 1250 5850
Wire Wire Line
	1250 5050 1250 5150
Wire Wire Line
	1650 5050 1750 5050
Wire Wire Line
	1350 5050 1250 5050
Wire Wire Line
	1750 5050 2000 5050
Connection ~ 1750 5050
Wire Wire Line
	2300 5050 2500 5050
Wire Wire Line
	1250 5850 1350 5850
Wire Wire Line
	1650 5850 1750 5850
Wire Wire Line
	1850 5650 1750 5650
Wire Wire Line
	1750 5050 1750 5650
Wire Wire Line
	2500 5750 2400 5750
Wire Wire Line
	2500 5050 2500 5750
Wire Wire Line
	1750 5850 1750 5950
Connection ~ 1750 5850
Wire Wire Line
	1750 5850 1850 5850
$Comp
L power:GND #PWR032
U 1 1 61619741
P 1750 6250
F 0 "#PWR032" H 1750 6000 50  0001 C CNN
F 1 "GND" H 1750 6100 50  0000 C CNN
F 2 "" H 1750 6250 50  0001 C CNN
F 3 "" H 1750 6250 50  0001 C CNN
	1    1750 6250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2600 5750 2500 5750
Connection ~ 2500 5750
$Comp
L tp325-meter:Resistor R34
U 1 1 6166E449
P 2500 6400
F 0 "R34" H 2450 6450 50  0000 R CNN
F 1 "1.5k" H 2450 6350 50  0000 R CNN
F 2 "" V 2540 6390 50  0001 C CNN
F 3 "~" H 2500 6400 50  0001 C CNN
	1    2500 6400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR033
U 1 1 6166E453
P 2500 6550
F 0 "#PWR033" H 2500 6300 50  0001 C CNN
F 1 "GND" H 2500 6400 50  0000 C CNN
F 2 "" H 2500 6550 50  0001 C CNN
F 3 "" H 2500 6550 50  0001 C CNN
	1    2500 6550
	-1   0    0    -1  
$EndComp
$Comp
L tp325-meter:Resistor R31
U 1 1 616845E9
P 2900 6150
F 0 "R31" V 2800 6150 50  0000 C CNN
F 1 "56k" V 2700 6150 50  0000 C CNN
F 2 "" V 2940 6140 50  0001 C CNN
F 3 "~" H 2900 6150 50  0001 C CNN
	1    2900 6150
	0    1    -1   0   
$EndComp
Wire Wire Line
	3050 6150 3250 6150
Wire Wire Line
	3250 6150 3250 5850
Wire Wire Line
	3250 5850 3150 5850
Wire Wire Line
	2750 6150 2500 6150
Wire Wire Line
	2500 6150 2500 5950
Wire Wire Line
	2500 5950 2600 5950
Wire Wire Line
	2500 6250 2500 6150
Connection ~ 2500 6150
Text Label 3450 5850 2    50   ~ 0
ADC
Connection ~ 3250 5850
Wire Wire Line
	3250 5850 3450 5850
$Comp
L tp325-meter:2x3-Male-Header J2
U 1 1 617558D2
P 1450 2000
F 0 "J2" H 1500 1700 50  0000 C CNN
F 1 "2x3-Male-Header" H 1500 1800 50  0000 C CNN
F 2 "" H 1450 2000 50  0001 C CNN
F 3 "~" H 1450 2000 50  0001 C CNN
	1    1450 2000
	1    0    0    -1  
$EndComp
Text Label 950  5850 0    50   ~ 0
MTRIN
Text Label 950  5050 0    50   ~ 0
MTROUT
Wire Wire Line
	950  5050 1250 5050
Connection ~ 1250 5050
Wire Wire Line
	950  5850 1250 5850
Connection ~ 1250 5850
Text Label 900  2000 0    50   ~ 0
MTRIN
Text Label 900  2100 0    50   ~ 0
MTROUT
Wire Wire Line
	1250 2000 900  2000
Wire Wire Line
	1250 2100 900  2100
$Comp
L power:GND #PWR011
U 1 1 61880D01
P 2000 1800
F 0 "#PWR011" H 2000 1550 50  0001 C CNN
F 1 "GND" H 2000 1650 50  0000 C CNN
F 2 "" H 2000 1800 50  0001 C CNN
F 3 "" H 2000 1800 50  0001 C CNN
	1    2000 1800
	1    0    0    1   
$EndComp
Wire Wire Line
	2000 1800 2000 1900
Wire Wire Line
	2000 1900 1900 1900
$Comp
L power:+15V #PWR010
U 1 1 618CA692
P 1000 1800
F 0 "#PWR010" H 1000 1650 50  0001 C CNN
F 1 "+15V" H 1000 1950 50  0000 C CNN
F 2 "" H 1000 1800 50  0001 C CNN
F 3 "" H 1000 1800 50  0001 C CNN
	1    1000 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 1900 1000 1800
Wire Wire Line
	3950 1900 4300 1900
Wire Wire Line
	4300 2000 3950 2000
Wire Wire Line
	3950 2100 4300 2100
Wire Wire Line
	4300 2200 3950 2200
Text Label 4300 1900 2    50   ~ 0
SRCLK
Text Label 4300 2000 2    50   ~ 0
RCLK
Text Label 4300 2100 2    50   ~ 0
~SRCLR
Text Label 4300 2200 2    50   ~ 0
~OE
Text Label 4600 1950 0    50   ~ 0
SRCLK
Text Label 4600 2050 0    50   ~ 0
RCLK
Text Label 4600 2150 0    50   ~ 0
~SRCLR
Text Label 4600 2250 0    50   ~ 0
~OE
Wire Wire Line
	4600 1950 4950 1950
Wire Wire Line
	4600 2050 4950 2050
Wire Wire Line
	4600 2150 4950 2150
Wire Wire Line
	4600 2250 4950 2250
Wire Wire Line
	1500 7400 1500 7300
NoConn ~ 1750 2000
NoConn ~ 1750 2100
Wire Wire Line
	1250 1900 1100 1900
$Comp
L power:PWR_FLAG #FLG02
U 1 1 61C059E6
P 1900 1800
F 0 "#FLG02" H 1900 1875 50  0001 C CNN
F 1 "PWR_FLAG" H 1900 1950 50  0001 C CNN
F 2 "" H 1900 1800 50  0001 C CNN
F 3 "~" H 1900 1800 50  0001 C CNN
	1    1900 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 1800 1900 1900
Connection ~ 1900 1900
Wire Wire Line
	1900 1900 1750 1900
$Comp
L power:PWR_FLAG #FLG01
U 1 1 61C395A8
P 1100 1800
F 0 "#FLG01" H 1100 1875 50  0001 C CNN
F 1 "PWR_FLAG" H 1100 1950 50  0001 C CNN
F 2 "" H 1100 1800 50  0001 C CNN
F 3 "~" H 1100 1800 50  0001 C CNN
	1    1100 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 1800 1100 1900
Connection ~ 1100 1900
Wire Wire Line
	1100 1900 1000 1900
$Comp
L tp325-meter:LM317KN U7
U 1 1 61CBDC65
P 1700 3650
F 0 "U7" H 1700 3892 50  0000 C CNN
F 1 "LM317KN" H 1700 3801 50  0000 C CNN
F 2 "" H 1700 3900 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm317.pdf" H 1700 3650 50  0001 C CNN
	1    1700 3650
	1    0    0    -1  
$EndComp
$Comp
L tp325-meter:Capacitor-Nonpolar C5
U 1 1 61CC15F2
P 1300 4050
F 0 "C5" H 1400 4100 50  0000 L CNN
F 1 "0.1u" H 1400 4000 50  0000 L CNN
F 2 "" H 1300 4050 50  0001 C CNN
F 3 "~" H 1300 4050 50  0001 C CNN
	1    1300 4050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1300 3950 1300 3650
Wire Wire Line
	1300 3650 1400 3650
$Comp
L tp325-meter:Resistor R17
U 1 1 61CFC480
P 1700 4300
F 0 "R17" H 1768 4346 50  0000 L CNN
F 1 "820" H 1768 4255 50  0000 L CNN
F 2 "" V 1740 4290 50  0001 C CNN
F 3 "~" H 1700 4300 50  0001 C CNN
	1    1700 4300
	1    0    0    -1  
$EndComp
$Comp
L tp325-meter:Resistor R16
U 1 1 61CFD712
P 2100 3850
F 0 "R16" H 2168 3896 50  0000 L CNN
F 1 "270" H 2168 3805 50  0000 L CNN
F 2 "" V 2140 3840 50  0001 C CNN
F 3 "~" H 2100 3850 50  0001 C CNN
	1    2100 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 3650 2100 3650
Wire Wire Line
	2100 3650 2100 3700
Wire Wire Line
	1700 4450 1700 4500
Wire Wire Line
	1300 4500 1300 4150
Wire Wire Line
	1700 4500 1300 4500
Wire Wire Line
	1700 3950 1700 4050
Wire Wire Line
	2100 4000 2100 4050
Wire Wire Line
	2100 4050 1700 4050
Connection ~ 1700 4050
Wire Wire Line
	1700 4050 1700 4150
$Comp
L tp325-meter:Capacitor-Nonpolar C8
U 1 1 61E077D6
P 2100 4300
F 0 "C8" H 2192 4346 50  0000 L CNN
F 1 "10u" H 2192 4255 50  0000 L CNN
F 2 "" H 2100 4300 50  0001 C CNN
F 3 "~" H 2100 4300 50  0001 C CNN
	1    2100 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 4400 2100 4500
Wire Wire Line
	2100 4500 1700 4500
Connection ~ 1700 4500
Wire Wire Line
	2100 4050 2100 4200
Connection ~ 2100 4050
$Comp
L tp325-meter:Diode D2
U 1 1 61E9AEB0
P 2500 3850
F 0 "D2" V 2454 3930 50  0000 L CNN
F 1 "1N4001" V 2545 3930 50  0000 L CNN
F 2 "" H 2500 3675 50  0001 C CNN
F 3 "" H 2500 3850 50  0001 C CNN
	1    2500 3850
	0    1    1    0   
$EndComp
$Comp
L tp325-meter:Diode D1
U 1 1 61E9BDA7
P 1700 3250
F 0 "D1" H 1700 3467 50  0000 C CNN
F 1 "1N4001" H 1700 3376 50  0000 C CNN
F 2 "" H 1700 3075 50  0001 C CNN
F 3 "" H 1700 3250 50  0001 C CNN
	1    1700 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 3250 1300 3250
Wire Wire Line
	1300 3250 1300 3650
Connection ~ 1300 3650
Wire Wire Line
	1850 3250 2100 3250
Wire Wire Line
	2100 3250 2100 3650
Connection ~ 2100 3650
Wire Wire Line
	2100 3650 2500 3650
Wire Wire Line
	2500 3650 2500 3700
Wire Wire Line
	2500 4000 2500 4050
Wire Wire Line
	2500 4050 2100 4050
$Comp
L tp325-meter:Capacitor-Nonpolar C6
U 1 1 61F29243
P 3000 4050
F 0 "C6" H 3092 4096 50  0000 L CNN
F 1 "10u" H 3092 4005 50  0000 L CNN
F 2 "" H 3000 4050 50  0001 C CNN
F 3 "~" H 3000 4050 50  0001 C CNN
	1    3000 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 3650 2500 3650
Wire Wire Line
	3000 3650 3000 3950
Connection ~ 2500 3650
Wire Wire Line
	3000 4150 3000 4500
Wire Wire Line
	3000 4500 2100 4500
Connection ~ 2100 4500
$Comp
L power:+15V #PWR018
U 1 1 61F810BA
P 1000 3350
F 0 "#PWR018" H 1000 3200 50  0001 C CNN
F 1 "+15V" H 1000 3500 50  0000 C CNN
F 2 "" H 1000 3350 50  0001 C CNN
F 3 "" H 1000 3350 50  0001 C CNN
	1    1000 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 3350 1000 3650
Wire Wire Line
	1000 3650 1300 3650
$Comp
L power:+5V #PWR019
U 1 1 61FBD348
P 3000 3350
F 0 "#PWR019" H 3000 3200 50  0001 C CNN
F 1 "+5V" H 3000 3500 50  0000 C CNN
F 2 "" H 3000 3350 50  0001 C CNN
F 3 "" H 3000 3350 50  0001 C CNN
	1    3000 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 3350 3000 3650
Connection ~ 3000 3650
$Comp
L tp325-meter:LF33CV U8
U 1 1 609B76D5
P 3500 3650
F 0 "U8" H 3500 3892 50  0000 C CNN
F 1 "LF33CV" H 3500 3801 50  0000 C CNN
F 2 "" H 3500 3875 50  0001 C CIN
F 3 "https://www.st.com/resource/en/datasheet/cd00000546.pdf" H 3500 3600 50  0001 C CNN
	1    3500 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 3650 3000 3650
Wire Wire Line
	3500 3950 3500 4500
Wire Wire Line
	3500 4500 3000 4500
Connection ~ 3000 4500
$Comp
L tp325-meter:Capacitor-Nonpolar C7
U 1 1 609F70CF
P 4000 4050
F 0 "C7" H 4092 4096 50  0000 L CNN
F 1 "2.2u" H 4092 4005 50  0000 L CNN
F 2 "" H 4000 4050 50  0001 C CNN
F 3 "~" H 4000 4050 50  0001 C CNN
	1    4000 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 4150 4000 4500
Wire Wire Line
	4000 4500 3500 4500
Connection ~ 3500 4500
Wire Wire Line
	3800 3650 4000 3650
Wire Wire Line
	4000 3650 4000 3950
$Comp
L power:+3V3 #PWR020
U 1 1 60A577F2
P 4000 3350
F 0 "#PWR020" H 4000 3200 50  0001 C CNN
F 1 "+3V3" H 4000 3500 50  0000 C CNN
F 2 "" H 4000 3350 50  0001 C CNN
F 3 "" H 4000 3350 50  0001 C CNN
	1    4000 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 3350 4000 3650
Connection ~ 4000 3650
$Comp
L power:GND #PWR0101
U 1 1 60A9873A
P 1000 4600
F 0 "#PWR0101" H 1000 4350 50  0001 C CNN
F 1 "GND" H 1000 4450 50  0000 C CNN
F 2 "" H 1000 4600 50  0001 C CNN
F 3 "" H 1000 4600 50  0001 C CNN
	1    1000 4600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1000 4600 1000 4500
Wire Wire Line
	1000 4500 1300 4500
Connection ~ 1300 4500
$Comp
L tp325-meter:SA56-21SRWA U13
U 1 1 609B4FEA
P 9250 5250
F 0 "U13" H 9350 5550 50  0000 L CNN
F 1 "SA56-21SRWA" H 9250 4950 50  0000 C CNN
F 2 "" H 8910 4850 50  0001 C CNN
F 3 "https://www.kingbrightusa.com/images/catalog/SPEC/SA56-21SRWA.pdf" H 8910 4850 50  0001 C CNN
	1    9250 5250
	1    0    0    -1  
$EndComp
NoConn ~ 9600 3450
$Comp
L tp325-meter:SA56-21SRWA U5
U 1 1 6097BE7C
P 9250 3250
F 0 "U5" H 9400 3550 50  0000 L CNN
F 1 "SA56-21SRWA" H 9250 2950 50  0000 C CNN
F 2 "" H 8910 2850 50  0001 C CNN
F 3 "https://www.kingbrightusa.com/images/catalog/SPEC/SA56-21SRWA.pdf" H 8910 2850 50  0001 C CNN
	1    9250 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 4150 10000 4150
Wire Wire Line
	10000 4150 10000 5150
Wire Wire Line
	9600 5150 10000 5150
Connection ~ 10000 5150
Wire Wire Line
	9600 4250 9900 4250
Wire Wire Line
	9900 4250 9900 5250
Wire Wire Line
	9600 5250 9900 5250
Connection ~ 9900 5250
Wire Wire Line
	9600 4350 9800 4350
Wire Wire Line
	9600 3150 10000 3150
Wire Wire Line
	10000 3150 10000 4150
Connection ~ 10000 4150
Wire Wire Line
	9600 3250 9900 3250
Wire Wire Line
	9900 3250 9900 4250
Connection ~ 9900 4250
Wire Wire Line
	9600 3350 9800 3350
Wire Wire Line
	9800 3350 9800 4350
Connection ~ 9800 4350
Wire Wire Line
	8900 3150 8500 3150
Wire Wire Line
	8500 3150 8500 4150
Wire Wire Line
	8900 3250 8600 3250
Wire Wire Line
	8600 3250 8600 4250
Wire Wire Line
	8900 3350 8700 3350
Wire Wire Line
	8700 3350 8700 4350
Wire Wire Line
	8900 3450 8800 3450
Wire Wire Line
	8800 3450 8800 4450
Wire Wire Line
	8900 5450 8800 5450
Connection ~ 8800 5450
Wire Wire Line
	8900 4450 8800 4450
Connection ~ 8800 4450
Wire Wire Line
	8800 4450 8800 5450
Wire Wire Line
	8900 4150 8500 4150
Connection ~ 8500 4150
Wire Wire Line
	8500 4150 8500 5150
Wire Wire Line
	8900 4250 8600 4250
Connection ~ 8600 4250
Wire Wire Line
	8600 4250 8600 5250
Wire Wire Line
	8900 4350 8700 4350
Connection ~ 8700 4350
Wire Wire Line
	8700 4350 8700 5350
Wire Wire Line
	8900 5150 8500 5150
Connection ~ 8500 5150
Wire Wire Line
	8900 5250 8600 5250
Connection ~ 8600 5250
Wire Wire Line
	8900 5350 8700 5350
Connection ~ 8700 5350
Connection ~ 9200 4850
Connection ~ 9200 3850
Connection ~ 9200 2850
Wire Wire Line
	10000 2150 10000 3150
Connection ~ 10000 3150
Wire Wire Line
	9600 2150 10000 2150
Wire Wire Line
	9600 2250 9900 2250
Wire Wire Line
	9900 2250 9900 3250
Connection ~ 9900 3250
Wire Wire Line
	9600 2350 9800 2350
Wire Wire Line
	9800 2350 9800 3350
Connection ~ 9800 3350
Wire Wire Line
	8900 2450 8800 2450
Wire Wire Line
	8800 2450 8800 3450
Connection ~ 8800 3450
Wire Wire Line
	8900 2350 8700 2350
Wire Wire Line
	8700 2350 8700 3350
Connection ~ 8700 3350
Wire Wire Line
	8900 2250 8600 2250
Wire Wire Line
	8600 2250 8600 3250
Connection ~ 8600 3250
Wire Wire Line
	8900 2150 8500 2150
Wire Wire Line
	8500 2150 8500 3150
Connection ~ 8500 3150
Wire Wire Line
	10100 2550 10100 2450
Wire Wire Line
	10100 2950 10100 2850
Wire Wire Line
	8500 5600 8150 5600
Wire Wire Line
	8500 5150 8500 5600
Wire Wire Line
	8600 5700 8150 5700
Wire Wire Line
	8600 5250 8600 5700
Wire Wire Line
	8700 5800 8150 5800
Wire Wire Line
	8700 5350 8700 5800
Wire Wire Line
	8800 5900 8150 5900
Wire Wire Line
	8800 5450 8800 5900
Wire Wire Line
	9600 5350 9800 5350
Wire Wire Line
	9800 4350 9800 5350
Connection ~ 9800 5350
Wire Wire Line
	9800 6000 8150 6000
Wire Wire Line
	9800 5350 9800 6000
Wire Wire Line
	9900 6100 8150 6100
Wire Wire Line
	9900 5250 9900 6100
Wire Wire Line
	10000 6200 8150 6200
Wire Wire Line
	10000 5150 10000 6200
Wire Wire Line
	9300 1900 9300 1850
Wire Wire Line
	9300 1850 9200 1850
Wire Wire Line
	9200 1900 9200 1850
Connection ~ 9200 1850
Wire Wire Line
	7500 4850 9200 4850
Wire Wire Line
	7500 3850 9200 3850
Wire Wire Line
	7500 2850 9200 2850
Wire Wire Line
	7500 1850 9200 1850
Wire Notes Line
	7750 650  7750 7200
Text Notes 7850 1000 0    200  Italic 40
PROTOBOARD-4
Wire Wire Line
	10100 2450 9600 2450
Wire Wire Line
	7550 5600 7850 5600
Wire Wire Line
	7550 5700 7850 5700
Wire Wire Line
	7550 5800 7850 5800
Wire Wire Line
	7550 5900 7850 5900
Wire Wire Line
	7550 6000 7850 6000
Wire Wire Line
	7550 6100 7850 6100
Wire Wire Line
	7550 6200 7850 6200
Wire Wire Line
	6550 5600 6650 5600
Wire Wire Line
	7550 6300 7600 6300
Wire Wire Line
	7600 6300 7600 6400
Wire Wire Line
	6550 6400 6550 6300
Wire Wire Line
	6550 6100 6550 5600
Wire Wire Line
	6550 5600 6550 5500
Connection ~ 6550 5600
Wire Wire Line
	5100 6300 5000 6300
Wire Wire Line
	5000 6300 5000 6500
Wire Wire Line
	5000 6500 5100 6500
$Comp
L tp325-meter:Capacitor-Nonpolar C?
U 1 1 6166132D
P 4900 6400
F 0 "C?" H 4800 6450 50  0000 R CNN
F 1 "0.1u" H 4800 6350 50  0000 R CNN
F 2 "" H 4900 6400 50  0001 C CNN
F 3 "~" H 4900 6400 50  0001 C CNN
	1    4900 6400
	1    0    0    -1  
$EndComp
Connection ~ 5000 6500
Wire Wire Line
	4900 6500 5000 6500
Wire Wire Line
	4900 6300 4900 5900
Connection ~ 4900 5900
Wire Wire Line
	4900 5900 4900 5700
Wire Wire Line
	4900 5900 5100 5900
Wire Wire Line
	4900 5700 5100 5700
Wire Wire Line
	4900 6600 4900 6500
Connection ~ 4900 6500
Connection ~ 4900 5700
Wire Wire Line
	4900 5600 4900 5700
Wire Wire Line
	5900 5700 6650 5700
Wire Wire Line
	5900 5800 6650 5800
Wire Wire Line
	5900 5900 6650 5900
Wire Wire Line
	5900 6000 6650 6000
$EndSCHEMATC
