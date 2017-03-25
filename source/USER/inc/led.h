#ifndef __LED_H
#define __LED_H

#include "stm8s.h"

enum LedEnum {
    LED_UP,
    LED_DN,
    LED_S1,
    LED_S2,
    LED_COUNT
};
	  
void LedInit(void);
void LedOn(int index);
void LedOff(int index);

#endif /* __LED_H */
