EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:arduino
LIBS:HydroMonitor
LIBS:AC_control-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Conn_WallSocket J1
U 1 1 5B1561FF
P 1150 2600
F 0 "J1" H 1200 2775 50  0000 C BNN
F 1 "AC in" V 1350 2600 50  0000 C BNN
F 2 "HydroMonitor:TerminalBlock_KF129_P5.08mm" H 750 2600 50  0001 C CNN
F 3 "" H 750 2600 50  0001 C CNN
	1    1150 2600
	-1   0    0    1   
$EndComp
$Comp
L Conn_WallSocket J2
U 1 1 5B15623F
P 1150 3600
F 0 "J2" H 1200 3775 50  0000 C BNN
F 1 "AC out" V 1350 3600 50  0000 C BNN
F 2 "HydroMonitor:TerminalBlock_KF129_P5.08mm" H 750 3600 50  0001 C CNN
F 3 "" H 750 3600 50  0001 C CNN
	1    1150 3600
	-1   0    0    1   
$EndComp
$Comp
L R R2
U 1 1 5B156431
P 3650 2500
F 0 "R2" V 3730 2500 50  0000 C CNN
F 1 "2k2" V 3650 2500 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3580 2500 50  0001 C CNN
F 3 "" H 3650 2500 50  0001 C CNN
	1    3650 2500
	0    1    1    0   
$EndComp
$Comp
L C C1
U 1 1 5B156485
P 3250 2500
F 0 "C1" H 3275 2600 50  0000 L CNN
F 1 "47nF" H 3275 2400 50  0000 L CNN
F 2 "Capacitors_THT:C_Rect_L18.0mm_W5.0mm_P15.00mm_FKS3_FKP3" H 3288 2350 50  0001 C CNN
F 3 "" H 3250 2500 50  0001 C CNN
	1    3250 2500
	0    1    1    0   
$EndComp
$Comp
L R R1
U 1 1 5B1565BA
P 4600 2250
F 0 "R1" V 4680 2250 50  0000 C CNN
F 1 "10k" V 4600 2250 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4530 2250 50  0001 C CNN
F 3 "" H 4600 2250 50  0001 C CNN
	1    4600 2250
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR01
U 1 1 5B1565ED
P 4600 2000
F 0 "#PWR01" H 4600 1850 50  0001 C CNN
F 1 "VCC" H 4600 2150 50  0000 C CNN
F 2 "" H 4600 2000 50  0001 C CNN
F 3 "" H 4600 2000 50  0001 C CNN
	1    4600 2000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 5B15664D
P 4600 2800
F 0 "#PWR02" H 4600 2550 50  0001 C CNN
F 1 "GND" H 4600 2650 50  0000 C CNN
F 2 "" H 4600 2800 50  0001 C CNN
F 3 "" H 4600 2800 50  0001 C CNN
	1    4600 2800
	1    0    0    -1  
$EndComp
$Comp
L MOC3010M U2
U 1 1 5B156E6B
P 4200 3450
F 0 "U2" H 3990 3640 50  0000 L CNN
F 1 "MOC3010M" H 4200 3650 50  0000 L CNN
F 2 "Housings_DIP:DIP-6_W7.62mm" H 4000 3250 50  0001 L CIN
F 3 "" H 4175 3450 50  0001 L CNN
	1    4200 3450
	-1   0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 5B157021
P 3600 3550
F 0 "R4" V 3680 3550 50  0000 C CNN
F 1 "220R" V 3600 3550 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3530 3550 50  0001 C CNN
F 3 "" H 3600 3550 50  0001 C CNN
	1    3600 3550
	0    1    1    0   
$EndComp
$Comp
L R R3
U 1 1 5B1572F3
P 4750 3350
F 0 "R3" V 4830 3350 50  0000 C CNN
F 1 "470R" V 4750 3350 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4680 3350 50  0001 C CNN
F 3 "" H 4750 3350 50  0001 C CNN
	1    4750 3350
	0    1    1    0   
$EndComp
$Comp
L GND #PWR03
U 1 1 5B157416
P 4600 3650
F 0 "#PWR03" H 4600 3400 50  0001 C CNN
F 1 "GND" H 4600 3500 50  0000 C CNN
F 2 "" H 4600 3650 50  0001 C CNN
F 3 "" H 4600 3650 50  0001 C CNN
	1    4600 3650
	1    0    0    -1  
$EndComp
Text Notes 1350 1550 0    60   ~ 0
C1: X2 rated (line voltage rated; fails close; requires fuse)\n
$Comp
L Conn_01x04 J3
U 1 1 5B1580BF
P 5600 2800
F 0 "J3" H 5600 3000 50  0000 C CNN
F 1 "OUTPUT" H 5600 2500 50  0000 C CNN
F 2 "Connectors_JST:JST_XH_B04B-XH-A_04x2.50mm_Straight" H 5600 2800 50  0001 C CNN
F 3 "" H 5600 2800 50  0001 C CNN
	1    5600 2800
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR04
U 1 1 5B15813F
P 5300 2600
F 0 "#PWR04" H 5300 2450 50  0001 C CNN
F 1 "VCC" H 5300 2750 50  0000 C CNN
F 2 "" H 5300 2600 50  0001 C CNN
F 3 "" H 5300 2600 50  0001 C CNN
	1    5300 2600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 5B15816B
P 5300 3100
F 0 "#PWR05" H 5300 2850 50  0001 C CNN
F 1 "GND" H 5300 2950 50  0000 C CNN
F 2 "" H 5300 3100 50  0001 C CNN
F 3 "" H 5300 3100 50  0001 C CNN
	1    5300 3100
	1    0    0    -1  
$EndComp
Text Label 5400 2800 2    60   ~ 0
ZC
Text Label 5400 2900 2    60   ~ 0
SIGNAL
$Comp
L R R5
U 1 1 5B196E96
P 2300 3400
F 0 "R5" V 2380 3400 50  0000 C CNN
F 1 "47R" V 2300 3400 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2230 3400 50  0001 C CNN
F 3 "" H 2300 3400 50  0001 C CNN
	1    2300 3400
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 5B196E9C
P 2300 3000
F 0 "C2" H 2325 3100 50  0000 L CNN
F 1 "0.15µF" H 2325 2900 50  0000 L CNN
F 2 "Capacitors_THT:C_Rect_L18.0mm_W6.0mm_P15.00mm_FKS3_FKP3" H 2338 2850 50  0001 C CNN
F 3 "" H 2300 3000 50  0001 C CNN
	1    2300 3000
	-1   0    0    -1  
$EndComp
Text Notes 2150 2400 0    60   ~ 0
Snubber
Text Notes 1600 4950 0    60   ~ 0
R5: makes for dI/dt < 50 A/µs.\nC2: 600V type. X2 rated: typcial 18 x 6-7.5 mm, 15 mm lead spacing.\nGood for up to 4A loads.\nSource: AN437 by STMicroelectronics NV\nNote: leaks about 10 mA through the capacitor!\nMust be placed as close as possible to the TRIAC.
$Comp
L Fuse F1
U 1 1 5B197455
P 1800 2500
F 0 "F1" V 1880 2500 50  0000 C CNN
F 1 "4A slow" V 1725 2500 50  0000 C CNN
F 2 "HydroMonitor:PTF-78_fuseholder" V 1730 2500 50  0001 C CNN
F 3 "" H 1800 2500 50  0001 C CNN
	1    1800 2500
	0    1    1    0   
$EndComp
Wire Wire Line
	5000 2500 5000 2800
Wire Wire Line
	5000 2800 5400 2800
Wire Wire Line
	5000 2900 5000 3350
Wire Wire Line
	5400 2900 5000 2900
Wire Wire Line
	1950 2500 3100 2500
Wire Wire Line
	1650 2500 1350 2500
Wire Notes Line
	2150 3750 2150 2450
Wire Notes Line
	2550 3750 2150 3750
Wire Notes Line
	2550 2450 2550 3750
Wire Wire Line
	1350 2700 3900 2700
Wire Wire Line
	1400 2700 1400 3500
Wire Wire Line
	1400 3500 1350 3500
Wire Wire Line
	3400 2500 3500 2500
Wire Wire Line
	3800 2500 3900 2500
Connection ~ 1400 2700
Wire Wire Line
	4600 2000 4600 2100
Wire Wire Line
	4600 2400 4600 2500
Wire Wire Line
	4500 2500 5000 2500
Connection ~ 4600 2500
Wire Wire Line
	4500 2700 4600 2700
Wire Wire Line
	4600 2700 4600 2800
Wire Wire Line
	1350 3700 3050 3700
Wire Wire Line
	3050 3700 3050 3400
Wire Wire Line
	3900 3550 3750 3550
Wire Wire Line
	3900 3350 3200 3350
Wire Wire Line
	3050 2500 3050 3100
Connection ~ 3050 2500
Wire Wire Line
	4600 3350 4500 3350
Wire Wire Line
	4500 3550 4600 3550
Wire Wire Line
	4600 3550 4600 3650
Wire Wire Line
	5000 3350 4900 3350
Wire Wire Line
	5300 2600 5300 2700
Wire Wire Line
	5300 2700 5400 2700
Wire Wire Line
	5400 3000 5300 3000
Wire Wire Line
	5300 3000 5300 3100
Wire Wire Line
	2300 3250 2300 3150
Wire Wire Line
	2300 3550 2300 3700
Connection ~ 2300 3700
Wire Wire Line
	2300 2850 2300 2500
Connection ~ 2300 2500
Wire Notes Line
	2150 2450 2550 2450
Text Notes 1500 3050 0    60   ~ 0
MPX154K305D 
Text Notes 2950 2400 0    60   ~ 0
MPX473K305D 
$Comp
L PC3H4 U1
U 1 1 5B1564FE
P 4200 2600
F 0 "U1" H 4000 2800 50  0000 L CNN
F 1 "PC814" H 4200 2800 50  0000 L CNN
F 2 "Housings_DIP:DIP-4_W7.62mm" H 4000 2400 50  0001 L CIN
F 3 "" H 4225 2600 50  0001 L CNN
	1    4200 2600
	1    0    0    -1  
$EndComp
Text Notes 1600 2200 0    60   ~ 0
47 nF @ 50 Hz impedance 68k so about 3.3 mA RMS to opto.\nR2 dissipates about 24 mW.
$Comp
L BT136-600E D1
U 1 1 5B421622
P 3050 3250
F 0 "D1" H 3175 3275 50  0000 L CNN
F 1 "BT136-600E" H 3175 3200 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 3150 3050 50  0001 C CNN
F 3 "" V 3050 3250 50  0001 C CNN
	1    3050 3250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3450 3550 3400 3550
Wire Wire Line
	3400 3550 3400 3000
Wire Wire Line
	3400 3000 3050 3000
Connection ~ 3050 3000
$EndSCHEMATC
