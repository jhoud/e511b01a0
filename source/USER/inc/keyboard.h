#ifndef __KEYBOARD_H
#define __KEYBOARD_H

#include "stm8s.h"

enum KeyboardEnum {
    KEY_A,
    KEY_B,
    KEY_Z,
		KEY_COUNT,
		KEY_A_3S,
		KEY_B_3S
};

/* 键盘初始化 */
void KeyboardInit(void);

/* 键盘任务, 20ms任务 */
void TaskKeyboard(void);

int IsKeyPress(int key);

#endif /* __KEYBOARD_H */
