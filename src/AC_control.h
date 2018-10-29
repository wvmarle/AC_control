#ifndef AC_CONTROL
#define AC_CONTROL

#include <Arduino.h>

//Enable one of the two; depending on your locality.
#define F50HZ
//#define F60HZ

/*
50 Hz: 10 ms per half cycle = 2,500 clock ticks.
60 Hz: 8.333 ms per half cycle = 2,083 clock ticks.

Peak detector's pulse has a finite length; falling edge is 3,840 µs before the zero crossing.
50 Hz: 960 clock ticks delay  (detemined experimentally to be 940 clock ticks; 120µs added to allow for small fluctuation).
60 Hz: (960 / 2500 * 2083) = 800 ticks delay expected.
*/

#if ((defined(F50HZ) && defined(F60HZ)) || (!defined(F50HZ) && !defined(F60HZ)))
#error Select frequency 50HZ or 60HZ at the top of this file, as appropriate for your mains frequency.
#endif

const byte PULSE = 12;                              // Trigger pulse width (counts) - 48 us.

#ifdef F50HZ
const uint16_t ZC_DELAY = 960;                      // 4 us per clock tick; 3840 us delay between sync signal and zero crossing.
const uint16_t MAX_PULSE_DELAY = 2460 - PULSE;      // 160 us before the next expected ZC the TRIAC pulse must be finished.
#endif

#ifdef F60HZ
const uint16_t ZC_DELAY = 800;                      // 4 us per clock tick; 3200 us delay between sync signal and zero crossing.
const uint16_t MAX_PULSE_DELAY = 2043 - PULSE;      // 160 us before the next expected ZC the TRIAC pulse must be finished.
#endif

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

