#include "AC_control.h"

ACControl::ACControl() {
  switchState = OFF;
}

void ACControl::begin(uint8_t sp, uint8_t gp) {     // sp = sync pin; gp = gate pin.

  // Set up the pins.
  syncPin = sp;
  gatePin = gp;
  pinMode(syncPin, INPUT_PULLUP);
  pinMode(gatePin, OUTPUT);

  // Set up Timer1.
  TIMSK1 = 0x06;                                    // Enable comparator A and comparator B interrupts.
  TCCR1A = 0x00;                                    // Timer control registers set for
  TCCR1B = 0x00;                                    // normal operation, timer disabled.

  // Set up the pin change interrupt.
  *digitalPinToPCMSK(syncPin) |= bit(digitalPinToPCMSKbit(syncPin)); // enable pin change interrupt
  PCIFR |= bit(digitalPinToPCICRbit(syncPin));      // clear any outstanding interrupt
  PCICR |= bit(digitalPinToPCICRbit(syncPin));      // enable interrupt for the group
}

// Set the power level from 0-100%.
// This actually sets the timer rather than the actual power so is not perfectly linear.
//
// Power >97% is switched fully on; power <3% is switched fully off. This to prevent glitches as we're 
// switching very close to the zero crossing.
// 
void ACControl::setPower(float power) {
  if (power < 3) {                                  // <3% power: switch off completely.
    off();
  }
  else if (power > 97) {                            // >97% power: switch on completely.
    on();
  }
  else {
#ifdef F50HZ
    pulseDelay = (uint16_t)(100 - power) * 25;      // 25 pulses = 1% of power (10,000 us / 4 us/tick / 100% = 25)
#endif

#ifdef F60HZ
    pulseDelay = (uint16_t)(100 - power) * 20.83;   // 20.83 pulses = 1% of power (8,333 us / 4 us/tick / 100% = 20.83)
#endif
    switchState = NORMAL;
  }
}

void ACControl::on() {                              // Switch power fully on.
  switchState = SWITCH_ON;                          // Switch on power at the next zero crossing.
}

void ACControl::off() {                             // Switch power fully off.
  TCCR1B = 0x00;                                    // Disable timer to stop unintended triggers.
  digitalWrite(gatePin, LOW);                       // Switch off the gate.
  switchState = OFF;                                // Set flag to record we're in power off mode now.
}

// Interrupt Service Routines
ISR (PCINT2_vect) {                                 // Peak detection pin - must be one of PORTD pins (digital pin 0-7).
  ACControl::PCINT2_ISR();
}

void ACControl::PCINT2_ISR() {
  if (switchState == NORMAL ||
      switchState == SWITCH_ON) {                   // Make sure we're not in full on or full off mode.
    if (digitalRead(syncPin) == LOW) {              // Falling edge detected.
      OCR1A = TCNT1 + ZC_DELAY;                     // Set the comparator A to ZC_DELAY from the current reading of the counter.
      TCCR1B = 0x03;                                // Start timer with divide by 64 input = 4 us per tick at 16 MHz.
      peakDetected = true;                          // We just detected a peak.
    }
  }
}

ISR(TIMER1_COMPA_vect) {                            // Comparator A match: zero crossing is now.
  ACControl::OCR1A_ISR();
}

void ACControl::OCR1A_ISR() {
  if (switchState == SWITCH_ON) {                    // Switch on at zero crossing.
    digitalWrite(gatePin, HIGH);                    // Switch on the TRIAC constantly.
    switchState = ON;                               // Record that we're now switched on.
    TCCR1B = 0x00;                                  // Disable timer; we just want to keep it on.
  }
  else {
    OCR1B = TCNT1 + pulseDelay;                     // Set the comparator B to start the TRIAC pulse at pulseDelay from now.
    peakDetected = false;                           // No peak yet within this switching cycle.
  }
}

ISR(TIMER1_COMPB_vect) {                            // Comparator B match: time to switch the TRIAC (on or off).
  ACControl::OCR1B_ISR();
}

void ACControl::OCR1B_ISR() {
  if (gateOn == false) {                            // Gate is off, so we have to switch on the TRIAC now.
    digitalWrite(gatePin, HIGH);                    // Set TRIAC gate to high.
    gateOn = true;                                  // Record TRIAC state.
    OCR1B += PULSE;                                 // When PULSE ticks passed, we have to come back and switch off the gate again.
  }
  else {
    digitalWrite(gatePin, LOW);                     // Set TRIAC gate to low.
    gateOn = false;                                 // Record TRIAC state.
    if (peakDetected ==  false) {                   // No peak detected yet, so we switched before the next peak.
      TCCR1B = 0x00;                                // Disable timer to stop unintended triggers.
    }
  }
}

// Redeclaration of the variables.
static uint8_t ACControl::syncPin;
static uint8_t ACControl::gatePin;
static volatile bool ACControl::peakDetected;
static volatile bool ACControl::gateOn;
static uint16_t ACControl::pulseDelay;
static volatile uint8_t ACControl::switchState;
