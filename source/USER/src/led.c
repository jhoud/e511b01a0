#include "led.h"

void LedInit(void) {
    GPIO_Init(GPIOC, GPIO_PIN_3 | GPIO_PIN_5 | GPIO_PIN_1, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_WriteLow(GPIOC, GPIO_PIN_3 | GPIO_PIN_5);
    GPIO_WriteHigh(GPIOC, GPIO_PIN_1);
    GPIO_Init(GPIOE, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST);
    GPIO_WriteHigh(GPIOE, GPIO_PIN_5);
}

void LedOn(int index) {
    switch(index) {
        case LED_UP:
            GPIO_WriteHigh(GPIOC, GPIO_PIN_3);
            break;
        case LED_DN:
            GPIO_WriteHigh(GPIOC, GPIO_PIN_5);
            break;
        case LED_S1:
            GPIO_WriteLow(GPIOC, GPIO_PIN_1);
            break;
        case LED_S2:
            GPIO_WriteLow(GPIOE, GPIO_PIN_5);
            break;
    }
}

void LedOff(int index) {
    switch(index) {
        case LED_UP:
            GPIO_WriteLow(GPIOC, GPIO_PIN_3);
            break;
        case LED_DN:
            GPIO_WriteLow(GPIOC, GPIO_PIN_5);
            break;
        case LED_S1:
            GPIO_WriteHigh(GPIOC, GPIO_PIN_1);
            break;
        case LED_S2:
            GPIO_WriteHigh(GPIOE, GPIO_PIN_5);
            break;
    }
}
