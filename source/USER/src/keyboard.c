#include "keyboard.h"

static const GPIO_Pin_TypeDef Keyboards_Pin[KEY_COUNT] = {GPIO_PIN_1 , GPIO_PIN_2 , GPIO_PIN_3};
//static const GPIO_TypeDef* Keyboards_Gpio[KEY_COUNT] = {GPIOE , GPIOD , GPIOC};

static uint8_t KeyboardStatus;
static uint16_t KeyboardCnt[KEY_COUNT];

static void SetKeyPress(int key);
static void ClrKeyPress(int key);

/* 键盘初始化 */
void KeyboardInit(void) {
    uint8_t i;
		for(i= 0; i<3; i++) {
				GPIO_Init(GPIOC, Keyboards_Pin[i], GPIO_MODE_IN_PU_NO_IT);
		}
    for(i=0; i<KEY_COUNT; i++) {
        KeyboardCnt[i] = 1;
    }
}

int IsKeyPress(int key) {
    if(KeyboardStatus & (1U << key)) {
        return 1;
    }
    return 0;
}

/* 键盘任务, 20ms任务 */
void TaskKeyboard(void) {                  //中断处理函数之一
    uint8_t i;

    for(i=0; i<KEY_COUNT; i++) {
        if(!GPIO_ReadInputPin(GPIOC, Keyboards_Pin[i])) {   //按键低电平有效
						if (KeyboardCnt[i] >= 2) {               //用于去抖
                SetKeyPress(i);
						}  
						if(KeyboardCnt[i] != (uint16_t) 0xffff) { //(uint8_t)0xff
                KeyboardCnt[i]++;                  //计数器
						}
						//if(KeyboardCnt[i] >= (uint16_t) 0x0050) {
					   //   SetKeyPress(i+5);
						//}
				}
				else {
						if (KeyboardCnt[i] == 0) {
                ClrKeyPress(i);  
								//if(0== i) {
								//    ClrKeyPress(i+5);
								//}
								//if(1== i) {
								//		ClrKeyPress(i+5);
								//}
						}  
						else if(KeyboardCnt[i] >=2 ){
                KeyboardCnt[i] = 1;
						}
						else {
                KeyboardCnt[i]--;
						}    
        }
    } 
}

static void SetKeyPress(int key) {
    KeyboardStatus |= (1U << key);
}

static void ClrKeyPress(int key) {
    KeyboardStatus &= ~(1U << key);
}

