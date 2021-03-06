#ifndef __DISP_H
#define __DISP_H

#include "stm8s.h"

//滚动模式
typedef enum {
    ROLL_NONE,          /* 没有动画 */
    ROLL_LEFT,          /* 向上移动 */
    ROLL_UP,          	/* 向下移动 */
    ROLL_FLASH,         /* 正常闪动 */
    ROLL_HIDE           /* 隐藏 */
} RollTypeEnum;

typedef enum {
    OVERLOAD,          /* 超载 */
		//_OVERLOAD,
    CAUTION= 2,          /* 注意 */
    //_CAUTION,
		ERR= 4,         	/* 故障 */
		//_ERR,
		MSG_COUNT
} Msg;

/* 显示初始化 */
void DispInit(void);
/* 字幕显示任务, 0.1ms任务 */
void TaskDisp(void);
/* 设置模式 */
void SetMode(uint8_t index);
/* 获取模式 */
uint8_t GetMode(void);
/* 设置楼层 */
void SetFloor(uint8_t index);
/* 设置超载等信息 */
void SetMsg(uint8_t index);
/* 设置左移bit */
void SetLeftBit(uint8_t index);
/* 设置亮度, 0=最暗, 9=最亮 */
void SetBrightness(uint8_t value);
/* 设置向上滚动的实际行 */
void SetUpRow(uint16_t index);
/* 设置闪烁计数器 */
void SetFlashCounter(uint8_t index);

#endif /* __DISP_H */
