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

    HSE_Clk_Init();  //外部晶振初始化
    //GPIO_Init(LED_GPIO_PORT, (GPIO_Pin_TypeDef)LED_GPIO_PINS, GPIO_MODE_OUT_PP_LOW_FAST);
    DispInit();
    //KeyboardInit();
		//LedInit();
    //Timer4_Init();
    Tim2_Init();   //中断初始吧
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
			
				//can处理
        /*CanSent = 0;  
        tmp = GetCan1();   //数据切换过来 用个中间变量替换
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
            CAN_Transmit(0x00, CAN_Id_Standard, CAN_RTR_Data, 7, TxData);   // canID  标示符扩展位IDE  请求蜶TRr  数据长度Dlc  数据
        }*/

				//按键处理 
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
								if((2== f1)&&(0== f2)) {    //到最大值 设为 递减模式
							      upanddown= 1;
										LedOn(LED_UP);
										LedOff(LED_DN);
								}
								if((0== f1)&&(1== f2)) {    //到最小值 设为 递增模式
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

/* 外部晶振初始化 */
static void HSE_Clk_Init(void) {
		CLK_DeInit();                                       //  时钟变量初始化
    CLK_HSICmd(ENABLE);                                 //  内部晶振使能
    while(SET != CLK_GetFlagStatus(CLK_FLAG_HSIRDY));   //  等待内部晶振稳定
    CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);            //  CPU时钟预分频器, 1分频
    CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);            //  内部时钟预分频器, 1分频
    CLK_ClockSwitchCmd(ENABLE);                         //  使能时钟切换功能
                                                        //  自动切换模式, 切换到内部晶振, 禁止切换中断, 当前时钟使能
    CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO ,CLK_SOURCE_HSI ,DISABLE ,CLK_CURRENTCLOCKSTATE_ENABLE);
	/*
    CLK_DeInit();                                       //  时钟变量初始化
    CLK_HSECmd(ENABLE);                                 //  外部晶振使能
    while(SET != CLK_GetFlagStatus(CLK_FLAG_HSERDY));   //  等待外部晶振稳定
    CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);            //  外部时钟预分频器,     1分频
    CLK_ClockSwitchCmd(ENABLE);                         //  使能时钟切换功能
                                                        //  自动切换模式, 切换到外部晶振, 禁止切换中断, 当前时钟使能
    CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO , CLK_SOURCE_HSE , DISABLE , CLK_CURRENTCLOCKSTATE_ENABLE);
		*/
}

static void Dog_Init(void) {
    IWDG_Enable();
    IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
    IWDG_SetPrescaler(IWDG_Prescaler_256);
    IWDG_SetReload(0xff);   //IWDG_RLR= 0xff
    IWDG_ReloadCounter();   //将用IWDG_RLR的数值0xff刷新计数器的内容从而避免产生看门狗复位 即喂狗
}

void Tim2_Init(void) {
    TIM2_DeInit();
    TIM2_TimeBaseInit(TIM2_PRESCALER_16, 99);    //  16分频, 16分频, 赋计数器初 值 0.1ms进入一次中断
    TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);       //  允许溢出中断
    TIM2_Cmd(ENABLE);                            //  使能TIM2计数
}

void Timer4_Init(void) {
    TIM4_DeInit();
    TIM4_TimeBaseInit(TIM4_PRESCALER_128, 0x02);         // 128分频,  赋计数器初值
    TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);              //  更新中断使能, 即溢出中断
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

