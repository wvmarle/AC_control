// Please note:
// SYNC_PIN (receiving the peak transition pulse) must be conneted to a pin in PORTD, i.e. one of the digital pins 2-7.
// GATE_PIN can be connected to any digital or analog pin (except A6/A7).
// This library uses pin change interrupt on PORTD. This will cause problems if used with another library that tries to use
// the same interrupt vector (PCINT2_vect).
// This library uses Timer1 and timer interrupts.
// This library supports only one AC control unit per Arduino.

#include "AC_control.h"

const byte SYNC_PIN = 6;                            // The synchronisation signal: peak detection.
const byte GATE_PIN = 5;                            // The TRIAC gate.

ACControl acMotor;

void setup() {
  acMotor.begin(SYNC_PIN, GATE_PIN);
  acMotor.setPower(60);                             // Set power level to 60% - fractions are allowed.
}

void loop() {
}

