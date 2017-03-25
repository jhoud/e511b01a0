#include "can.h"

static uint8_t CanBuffer[8];
 
void CAN_Config(void) {     //can≈‰÷√
    CAN_InitStatus_TypeDef    status = CAN_InitStatus_Failed;
    
    /* Filter Parameters */
    CAN_FilterNumber_TypeDef  CAN_FilterNumber;
    FunctionalState           CAN_FilterActivation;
    CAN_FilterMode_TypeDef    CAN_FilterMode;
    CAN_FilterScale_TypeDef   CAN_FilterScale;
    uint8_t  CAN_FilterID1;
    uint8_t  CAN_FilterID2;
    uint8_t  CAN_FilterID3;
    uint8_t  CAN_FilterID4;
    uint8_t  CAN_FilterIDMask1;
    uint8_t  CAN_FilterIDMask2;
    uint8_t  CAN_FilterIDMask3;
    uint8_t  CAN_FilterIDMask4; 
    
    /* Init Parameters*/
    CAN_MasterCtrl_TypeDef    CAN_MasterCtrl;
    CAN_Mode_TypeDef          CAN_Mode;
    CAN_SynJumpWidth_TypeDef  CAN_SynJumpWidth;
    CAN_BitSeg1_TypeDef       CAN_BitSeg1;
    CAN_BitSeg2_TypeDef       CAN_BitSeg2;
//    CAN_ClockSource_TypeDef CAN_ClockSource;
    uint8_t  CAN_Prescaler;    
    
    /* CAN register init */
    CAN_DeInit();
      
    /* CAN  init */
    CAN_MasterCtrl = CAN_MasterCtrl_AllDisabled;
    CAN_Mode = CAN_Mode_Normal;
    // 16Mhz / (1 + 6 +7) / 20 = 57.14285714  kHz
    CAN_SynJumpWidth = CAN_SynJumpWidth_1TimeQuantum;
    CAN_BitSeg1 = CAN_BitSeg1_6TimeQuantum;
    CAN_BitSeg2 = CAN_BitSeg2_7TimeQuantum;
    CAN_Prescaler = 20;
    //CAN_SynJumpWidth = CAN_SynJumpWidth_1TimeQuantum;
    //CAN_BitSeg1 = CAN_BitSeg1_8TimeQuantum;
    //CAN_BitSeg2 = CAN_BitSeg2_7TimeQuantum;
    //CAN_Prescaler = 1;
    //CAN_ClockSource = CAN_ClockSource_Internal;
	  //CAN_ClockSource,
    status = CAN_Init(CAN_MasterCtrl,CAN_Mode,CAN_SynJumpWidth,CAN_BitSeg1,CAN_BitSeg2,CAN_Prescaler);

    /* CAN filter init */
    CAN_FilterNumber = 0;
    CAN_FilterActivation = ENABLE;
    CAN_FilterMode = CAN_FilterMode_IdMask;
    CAN_FilterScale = CAN_FilterScale_32Bit;
    CAN_FilterID1=0;  
    CAN_FilterID2=0;
    CAN_FilterID3=0;
    CAN_FilterID4=0;
    CAN_FilterIDMask1=0;
    CAN_FilterIDMask2=0;
    CAN_FilterIDMask3=0;
    CAN_FilterIDMask4=0;  
    CAN_FilterInit(CAN_FilterNumber, CAN_FilterActivation, CAN_FilterMode, CAN_FilterScale,CAN_FilterID1, CAN_FilterID2, CAN_FilterID3, CAN_FilterID4,CAN_FilterIDMask1, CAN_FilterIDMask2, CAN_FilterIDMask3, CAN_FilterIDMask4);
}

void ReceiveCanData(void) {    //can∑¢ÀÕ‘⁄main¿Ô
    uint8_t i;
    for(i=0; i<8; i++) {
        CanBuffer[i] = CAN_GetReceivedData(i);
    }
}

uint8_t GetCan1(void) {
    return CanBuffer[0];
}

uint8_t GetCan2(void) {
    return CanBuffer[1];
}

