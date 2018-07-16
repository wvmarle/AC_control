#include "AC_control.h"

// Pulse length: 1,800 us (according to scope).
// Rising edge is much slower than falling edge (10k too weak a pull-up??) so better use falling edge. Pulse length
// measured by Arduino is about 1480 us.
// Interrupt: should look for FALLING edge, which occurs 4,100 us before the zero crossing.
// Cut-off points for the phase cutting:
// ZC_DELAY: when the zero crossing happens; 940 ticks (3760 us) past the pulse gives full power to the motor (empericial).
// MAX_PULSE_DELAY: last moment the TRIAC may be fired; any later than this and the next cycle may be triggered so
//                  that gives 100% instead of 0% power.
// A ~150 us margin is needed due to inaccuracy from the peak detection - this is 1.5%.


ACControl::ACControl() {
  switchedOn = false;
  switchedOff = false;
}

void ACControl::begin(uint8_t sp, uint8_t gp) {
  syncPin = sp;
  gatePin = gp;
  pinMode(syncPin, INPUT_PULLUP);
  pinMode(gatePin, OUTPUT);

  // set up Timer1
  TIMSK1 = 0x06;                                    // Enable comparator A and overflow interrupts.
  TCCR1A = 0x00;                                    // Timer control registers set for
  TCCR1B = 0x00;                                    // normal operation, timer disabled.

  *digitalPinToPCMSK(syncPin) |= bit(digitalPinToPCMSKbit(syncPin)); // enable pin change interrupt
  PCIFR |= bit(digitalPinToPCICRbit(syncPin));     // clear any outstanding interrupt
  PCICR |= bit(digitalPinToPCICRbit(syncPin));     // enable interrupt for the group
}

void ACControl::setPower(float power) {
  if (power < 3) {
    off();
  }
  else if (power > 97) {
    on();
  }
  else {
    pulseDelay = (uint16_t)(100 - power) * 25;      // 25 pulses = 1% of power (10,000 us / 4 us/tick / 100% = 25)
    switchedOff = false;
    switchedOn = false;
  }
}

void ACControl::on() {
  doSwitchOn = true;                                // Set flag to switch on power at the next zero crossing.
}

void ACControl::off() {
  TCCR1B = 0x00;                                    // Disable timer to stop unintended triggers.
  digitalWrite(gatePin, LOW);                       // Switch off the gate.
  switchedOff = true;
}

// Interrupt Service Routines
ISR (PCINT2_vect) {                                 // Zero crossing is D6, PCINT2.
  ACControl::PCINT2_ISR();
}

void ACControl::PCINT2_ISR() {
  if (switchedOff == false && switchedOn == false) { // Make sure we're not switched off or on.
    if (digitalRead(syncPin) == LOW) {              // Falling edge.
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
  if (doSwitchOn) {                                 // Switch on at zero crossing.
    digitalWrite(gatePin, HIGH);                    // Switch on the TRIAC constantly.
    doSwitchOn = false;                             // Record it's done.
    switchedOn = true;                              // Record that we're now switched on.
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

// Redeclaration - needed to make this compile.
static uint8_t ACControl::syncPin;
static uint8_t ACControl::gatePin;
static volatile bool ACControl::peakDetected;
static volatile bool ACControl::gateOn;
static uint16_t ACControl::pulseDelay;
static volatile bool ACControl::doSwitchOn;
static volatile bool ACControl::switchedOn;
static bool ACControl::switchedOff;

