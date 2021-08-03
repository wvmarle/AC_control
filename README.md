# AC_control
Arduino library for AC phase controller with peak detection.

This library controls AC power through phase cutting, with a synchronisation signal based on peak detection rather than zero crossing detection. It makes use of pin change interrupts (on PORTD) and Timer1.

Please note:
SYNC_PIN (receiving the peak transition pulse) must be conneted to a pin in PORTD, i.e. one of the digital pins 2-7.
GATE_PIN can be connected to any digital or analog pin (except A6/A7).
This library uses pin change interrupt on PORTD. This will cause problems if used with another library that tries to use the same interrupt vector (PCINT2_vect).
This library uses Timer1 and timer interrupts.
This library supports only one AC control unit per Arduino.
It is currently limited to 50 Hz AC (this is a code limitation).

Phase cutting is an AC control technique using a TRIAC to control how much of the waveform is let through to the device. The later in the wave the TRIAC is switched on, the less power is transferred to the connected device.

Schematics
-

In the ./schematics folder are the complete schematics and PCB development files. 

The V1 PCB has been tested and was found to have some issues: the TRIAC was connected incorrectly, and an optocoupler footprint was wrong. These issues have been corrected in the development version in the root directory.

The schematic has been tested by reworking bits of the V1 PCB, but the redesigned PCB has not been tested as such.
