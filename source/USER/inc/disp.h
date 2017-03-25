#ifndef __DISP_H
#define __DISP_H

#include "stm8s.h"

//����ģʽ
typedef enum {
    ROLL_NONE,          /* û�ж��� */
    ROLL_LEFT,          /* �����ƶ� */
    ROLL_UP,          	/* �����ƶ� */
    ROLL_FLASH,         /* �������� */
    ROLL_HIDE           /* ���� */
} RollTypeEnum;

typedef enum {
    OVERLOAD,          /* ���� */
		//_OVERLOAD,
    CAUTION= 2,          /* ע�� */
    //_CAUTION,
		ERR= 4,         	/* ���� */
		//_ERR,
		MSG_COUNT
} Msg;

/* ��ʾ��ʼ�� */
void DispInit(void);
/* ��Ļ��ʾ����, 0.1ms���� */
void TaskDisp(void);
/* ����ģʽ */
void SetMode(uint8_t index);
/* ��ȡģʽ */
uint8_t GetMode(void);
/* ����¥�� */
void SetFloor(uint8_t index);
/* ���ó��ص���Ϣ */
void SetMsg(uint8_t index);
/* ��������bit */
void SetLeftBit(uint8_t index);
/* ��������, 0=�, 9=���� */
void SetBrightness(uint8_t value);
/* �������Ϲ�����ʵ���� */
void SetUpRow(uint16_t index);
/* ������˸������ */
void SetFlashCounter(uint8_t index);

#endif /* __DISP_H */
