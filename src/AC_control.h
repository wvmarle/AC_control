#ifndef AC_CONTROL
#define AC_CONTROL

#include <Arduino.h>


const uint16_t ZC_DELAY = 960;                      // 4 us per clock tick; 4100 us delay between sync signal and zero crossing.
const byte PULSE = 12;                              // Trigger pulse width (counts) - 48 us.
const uint16_t MAX_PULSE_DELAY = 2460 - PULSE;      // 160 us before the next expected ZC the TRIAC pulse must be finished.
enum switchStates {                                 // Various states the switching can be in:
  OFF,                                              // Fully off.
  ON,                                               // Fully on.
  NORMAL,                                           // Normal phase control.
  SWITCH_ON                                         // Switch on fully at next zero crossing.
};

class ACControl {
  public:
    ACControl();
    static void begin(uint8_t, uint8_t);
    static void setPower(float);
    static void on();
    static void off();
    
    // These must be public for the ISR to call.
    static void PCINT2_ISR();
    static void OCR1A_ISR();
    static void OCR1B_ISR();
  
  protected:
    static uint8_t syncPin;
    static uint8_t gatePin;
    static volatile bool peakDetected;
    static volatile bool gateOn;
    static uint16_t pulseDelay;
    static volatile uint8_t switchState;
};
#endif

