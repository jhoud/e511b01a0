#include "stm8s.h"
#include "disp.h"
#include "keyboard.h"
#include "led.h"
#include "can.h"

//#define LED_GPIO_PORT  (GPIOB)
//#define LED_GPIO_PINS  (GPIO_PIN_3 | GPIO_PIN_2 | GPIO_PIN_1 | GPIO_PIN_0)

void Delay (uint16_t nCount);
static void HSE_Clk_Init(void);
//static void Dog_INIT(void);
//static void Timer4_Init(void);
static void Tim2_Init(void);

main() {
    //uint8_t CanSent;
    //uint8_t TxData[8];

    HSE_Clk_Init();  //�ⲿ�����ʼ��
    //GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
    DispInit();
    //KeyboardInit();
		//LedInit();
    //Timer4_Init();
    Tim2_Init();   //�жϳ�ʼ��
    //CAN_Config();
    //CAN_ITConfig(CAN_IT_FMP, ENABLE);
    enableInterrupts();
    
    SetBrightness(3);
		SetMode(ROLL_NONE);
		//SetMode(ROLL_LEFT);
		//		SetMsg(ERR);
		//SetMode(ROLL_UP);
		//SetMode(ROLL_FLASH);

		
    while (1) {
			
				//can����
        /*CanSent = 0;  
        tmp = GetCan1();   //�����л����� �ø��м�����滻
        if(tmp != 0) {
            if(f1 != (tmp % 12)) {
                CanSent = 1;
                f1 = tmp % 12;
            }
        }  
        tmp = GetCan2();
        if(tmp != 0) {
            if(f2 != (tmp % 9)) {
                CanSent = 1;
                f2 = tmp % 9;
            }
        }  
        if(CanSent) {
            TxData[0] = f1;
            TxData[1] = f2;
            CAN_Transmit(0x00, CAN_Id_Standard, CAN_RTR_Data, 7, TxData);   // canID  ��ʾ����չλIDE  �����RTRr  ���ݳ���Dlc  ����
        }*/

				//�������� 
        /*if(0 ==mode) {
					  upanddown= 2;
            if(IsKeyPress(KEY_UP)) {
                if(!key_up) {
										key_up = 1;
										if(f1>=12) {
												f1 = 0;
										}
										else {
												f1++;
										}
								}
								LedOn(LED_UP); 
						}
						else {
								key_up = 0;
								LedOff(LED_UP); 
						}

						if(IsKeyPress(KEY_DN)) {
								if(!key_dn) {
										key_dn = 1;
										if(f2>=9) {
												f2 = 0;
										}
										else {
												f2++;
										}
								}
								LedOn(LED_DN); 
						}
						else {
								key_dn = 0;
								LedOff(LED_DN); 
						}

            						
						if(IsKeyPress(KEY_UP_3S)&&IsKeyPress(KEY_DN_3S)) {
			          mode= mode==0?1:0;
								f1= 0;
								f2= 1;
								LedOff(LED_DN);
								LedOff(LED_UP);
								for(i=0; i<10; i++) {
								    Delay(0xffff);
								}
						}	
						
						if(IsKeyPress(KEY_XO)) {
								LedOn(LED_S1); 
						}
						else {
								LedOff(LED_S1); 
						}

						if(IsKeyPress(KEY_SETUP)) {
								LedOn(LED_S2); 
						}
						else {
								LedOff(LED_S2); 
						}

			  }
				else if(1== mode) {
					  if(IsKeyPress(KEY_UP_3S)&&IsKeyPress(KEY_DN_3S)) {
			          mode= mode==0?1:0;
								f1= 1;
								f2= 0;
								LedOn(LED_DN);
								LedOn(LED_UP);
								for(i=0; i<10; i++) {
								    Delay(0xffff);
								}
						}	
						mcount++;
						if(mcount>=0x20){               //a8
								mcount=0;
								if((2== f1)&&(0== f2)) {    //�����ֵ ��Ϊ �ݼ�ģʽ
							      upanddown= 1;
										LedOn(LED_UP);
										LedOff(LED_DN);
								}
								if((0== f1)&&(1== f2)) {    //����Сֵ ��Ϊ ����ģʽ
									  upanddown= 0;
										LedOn(LED_DN);
										LedOff(LED_UP);
								}
								if(0== upanddown) {
										if(f2>= 9){
												f1++;										
										}
										if(f2>=9){
												f2=0;
										}
										else {
												f2++;												
										}
										
								}			
								if(1== upanddown) {									
										if(f2== 0){
												f1--;
										}
										if(f2== 0){
												f2= 9;
										}
										else {
												f2--;
										}										
								}							
						}
				}				
				*/
			  Delay(0xffff);
    }
}    

/* �ⲿ�����ʼ�� */
static void HSE_Clk_Init(void) {
		CLK_DeInit();                                       //  ʱ�ӱ�����ʼ��
    CLK_HSICmd(ENABLE);                                 //  �ڲ�����ʹ��
    while(SET != CLK_GetFlagStatus(CLK_FLAG_HSIRDY));   //  �ȴ��ڲ������ȶ�
    CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);            //  CPUʱ��Ԥ��Ƶ��, 1��Ƶ
    CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);            //  �ڲ�ʱ��Ԥ��Ƶ��, 1��Ƶ
    CLK_ClockSwitchCmd(ENABLE);                         //  ʹ��ʱ���л�����
                                                        //  �Զ��л�ģʽ, �л����ڲ�����, ��ֹ�л��ж�, ��ǰʱ��ʹ��
    CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO ,CLK_SOURCE_HSI ,DISABLE ,CLK_CURRENTCLOCKSTATE_ENABLE);
	/*
    CLK_DeInit();                                       //  ʱ�ӱ�����ʼ��
    CLK_HSECmd(ENABLE);                                 //  �ⲿ����ʹ��
    while(SET != CLK_GetFlagStatus(CLK_FLAG_HSERDY));   //  �ȴ��ⲿ�����ȶ�
    CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);            //  �ⲿʱ��Ԥ��Ƶ��,     1��Ƶ
    CLK_ClockSwitchCmd(ENABLE);                         //  ʹ��ʱ���л�����
                                                        //  �Զ��л�ģʽ, �л����ⲿ����, ��ֹ�л��ж�, ��ǰʱ��ʹ��
    CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO , CLK_SOURCE_HSE , DISABLE , CLK_CURRENTCLOCKSTATE_ENABLE);
		*/
}

static void Dog_Init(void) {
    IWDG_Enable();
    IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
    IWDG_SetPrescaler(IWDG_Prescaler_256);
    IWDG_SetReload(0xff);   //IWDG_RLR= 0xff
    IWDG_ReloadCounter();   //����IWDG_RLR����ֵ0xffˢ�¼����������ݴӶ�����������Ź���λ ��ι��
}

void Tim2_Init(void) {
    TIM2_DeInit();
    TIM2_TimeBaseInit(TIM2_PRESCALER_16, 99);    //  16��Ƶ, 16��Ƶ, ���������� ֵ 0.1ms����һ���ж�
    TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);       //  ��������ж�
    TIM2_Cmd(ENABLE);                            //  ʹ��TIM2����
}

void Timer4_Init(void) {
    TIM4_DeInit();
    TIM4_TimeBaseInit(TIM4_PRESCALER_128, 0x02);         // 128��Ƶ,  ����������ֵ
    TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);              //  �����ж�ʹ��, ������ж�
    TIM4_Cmd(ENABLE);
}

/**
  * @brief Delay
  * @param nCount
  * @retval None
  */
void Delay(uint16_t nCount){
  /* Decrement nCount value */
     while (nCount != 0){
      nCount--;
      }
}

#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif

