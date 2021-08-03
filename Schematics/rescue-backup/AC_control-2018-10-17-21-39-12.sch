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
L GND #PWR01
U 1 1 5B15664D
P 4600 2800
F 0 "#PWR01" H 4600 2550 50  0001 C CNN
F 1 "GND" H 4600 2650 50  0000 C CNN
F 2 "" H 4600 2800 50  0001 C CNN
F 3 "" H 4600 2800 50  0001 C CNN
	1    4600 2800
	1    0    0    -1  
$EndComp
$Comp
L MOC3010M U2
U 1 1 5B156E6B
P 4200 3300
F 0 "U2" H 3990 3490 50  0000 L CNN
F 1 "MOC3010M" H 4200 3500 50  0000 L CNN
F 2 "Housings_DIP:DIP-6_W7.62mm" H 4000 3100 50  0001 L CIN
F 3 "" H 4175 3300 50  0001 L CNN
	1    4200 3300
	-1   0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 5B157021
P 3650 3400
F 0 "R4" V 3730 3400 50  0000 C CNN
F 1 "220R" V 3650 3400 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3580 3400 50  0001 C CNN
F 3 "" H 3650 3400 50  0001 C CNN
	1    3650 3400
	0    1    1    0   
$EndComp
$Comp
L R R3
U 1 1 5B1572F3
P 4750 3200
F 0 "R3" V 4830 3200 50  0000 C CNN
F 1 "470R" V 4750 3200 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4680 3200 50  0001 C CNN
F 3 "" H 4750 3200 50  0001 C CNN
	1    4750 3200
	0    1    1    0   
$EndComp
$Comp
L GND #PWR02
U 1 1 5B157416
P 4600 3500
F 0 "#PWR02" H 4600 3250 50  0001 C CNN
F 1 "GND" H 4600 3350 50  0000 C CNN
F 2 "" H 4600 3500 50  0001 C CNN
F 3 "" H 4600 3500 50  0001 C CNN
	1    4600 3500
	1    0    0    -1  
$EndComp
Text Notes 1700 2200 0    60   ~ 0
C1: X2 rated (line voltage rated; fails close; requires fuse)\n
Text Label 5400 2900 2    60   ~ 0
SYNC
Text Label 5400 3000 2    60   ~ 0
GATE
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
Text Notes 1300 4600 0    60   ~ 0
R5: makes for dI/dt < 50 A/µs.\nC2: 600V type. X2 rated: typcial 18 x 6-7.5 mm, 15 mm lead spacing.\nGood for up to 4A loads.\nSource: AN437 by STMicroelectronics NV\nNote: leaks about 10 mA through the capacitor!\nMust be placed as close as possible to the TRIAC.\n0.15 uF @ 50 Hz impedance just over 21k, 11 mA current.\nR5 dissipates <6 mW.
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
Text Notes 2200 3050 2    60   ~ 0
MPX154K305D 
Text Notes 2950 2400 0    60   ~ 0
MPX473K305D 
Text Notes 1300 2000 0    60   ~ 0
47 nF @ 50 Hz impedance 68k so about 3.3 mA RMS to opto.\nR2 dissipates about 24 mW.
NoConn ~ 4500 2500
$Comp
L H11AA1 U1
U 1 1 5B40635B
P 4200 2600
F 0 "U1" H 4000 2790 50  0000 L CNN
F 1 "H11AA1" H 4000 2400 50  0000 L CNN
F 2 "Housings_DIP:DIP-6_W7.62mm" H 4200 2300 50  0001 C CIN
F 3 "" H 4210 2600 50  0001 L CNN
	1    4200 2600
	1    0    0    -1  
$EndComp
$Comp
L BT136-600E D1
U 1 1 5B420F43
P 3050 3100
F 0 "D1" H 3175 3125 50  0000 L CNN
F 1 "BT136-600E" H 3175 3050 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 3150 2900 50  0001 C CNN
F 3 "" V 3050 3100 50  0001 C CNN
	1    3050 3100
	-1   0    0    -1  
$EndComp
Text Notes 1350 2500 0    60   ~ 0
Live
Text Notes 1350 2700 0    60   ~ 0
Neutral
Text Notes 1350 3500 0    60   ~ 0
Neutral
Text Notes 1350 3700 0    60   ~ 0
Live
Text Notes 650  2400 0    60   ~ 0
Symbol drawn reversed\nfor PCB design.
Text Label 5400 2800 2    60   ~ 0
GND
$Comp
L Conn_01x03 J3
U 1 1 5B45BBCF
P 5600 2900
F 0 "J3" H 5600 3100 50  0000 C CNN
F 1 "Conn_01x03" H 5600 2700 50  0000 C CNN
F 2 "Connectors_JST:JST_XH_B03B-XH-A_03x2.50mm_Straight" H 5600 2900 50  0001 C CNN
F 3 "" H 5600 2900 50  0001 C CNN
	1    5600 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 2600 4700 2900
Wire Wire Line
	4700 2900 5400 2900
Wire Wire Line
	5000 3000 5000 3200
Wire Wire Line
	5400 3000 5000 3000
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
Connection ~ 1400 2700
Wire Wire Line
	4500 2600 4700 2600
Wire Wire Line
	4500 2700 4600 2700
Wire Wire Line
	4600 2700 4600 2800
Wire Wire Line
	1350 3700 3050 3700
Wire Wire Line
	3050 3700 3050 3250
Wire Wire Line
	3900 3400 3800 3400
Wire Wire Line
	3050 2500 3050 2950
Connection ~ 3050 2500
Wire Wire Line
	4600 3200 4500 3200
Wire Wire Line
	4500 3400 4600 3400
Wire Wire Line
	4600 3400 4600 3500
Wire Wire Line
	5000 3200 4900 3200
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
Connection ~ 3050 2900
Wire Wire Line
	3500 3400 3450 3400
Wire Wire Line
	3450 3400 3450 2900
Wire Wire Line
	3450 2900 3050 2900
Wire Wire Line
	3200 3200 3900 3200
Wire Wire Line
	3800 2500 3900 2500
$EndSCHEMATC
