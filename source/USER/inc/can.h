#ifndef __CAN_H
#define __CAN_H

#include "stm8s.h"

void CAN_Config(void);

void ReceiveCanData(void);

uint8_t GetCan1(void);

uint8_t GetCan2(void);

#endif /* __CAN_H */
