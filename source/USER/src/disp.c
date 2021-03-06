
#include "disp.h"
#include "font.h"

#define UP   				GPIO_PIN_4  //LE  锁存输出允许位
#define DN   				GPIO_PIN_5  //LE
#define PIN_SDI     GPIO_PIN_7
#define PIN_CLK     GPIO_PIN_6
//#define POWER       GPIO_PIN_2  //OE
//#define ROLL_LINES (6 * 2 -1) 

static const GPIO_Pin_TypeDef RowLck_Pin[] = {GPIO_PIN_0, GPIO_PIN_1 ,GPIO_PIN_2 , GPIO_PIN_3 , GPIO_PIN_7 , GPIO_PIN_6 , GPIO_PIN_5 ,  GPIO_PIN_4 ,  GPIO_PIN_0};
static const GPIO_TypeDef* RowLck_Gpio[] = {GPIOB, GPIOB, GPIOB, GPIOB, GPIOB, GPIOB, GPIOB, GPIOB, GPIOD};

//变量声明
static uint8_t Brightness = 0;
static uint8_t floor, mode= ROLL_NONE, flash_n;
static uint16_t act_row;
static uint8_t msg_index, left_bit= 0;
//函数声明
static void SendData(uint16_t value, GPIO_Pin_TypeDef data_place);

/* 设置模式 */
void SetMode(uint8_t index) {
		mode= index;
}
/* 获取模式 */
uint8_t GetMode(void) {
		return mode;
}
/* 设置楼层 */
void SetFloor(uint8_t index) {
		floor= index;
}
/* 设置超载等信息 */
void SetMsg(uint8_t index) {
		msg_index= index;
}
/* 设置左移bit */
void SetLeftBit(uint8_t index) {
		left_bit= index;
}
/* 设置闪烁计数器 */
void SetFlashCounter(uint8_t index) {
		flash_n= index;
}
/* 设置向上滚动的实际行 */
void SetUpRow(uint16_t index) {
		act_row= index;
}
/* 设置亮度, 0=最暗, 9=最亮 */
void SetBrightness(uint8_t value) {
    if(value > 9) {
        Brightness = 9;
    }
    else {
        Brightness = value;
    }
}

/* 显示初始化 */
void DispInit(void) {
		uint8_t i;
		
		//初始化 行 且设初始值为高电平
		for(i= 0; i<9; i++) {
				GPIO_Init(RowLck_Gpio[i], RowLck_Pin[i], GPIO_MODE_OUT_PP_LOW_FAST);
				GPIO_WriteHigh(RowLck_Gpio[i], RowLck_Pin[i]);       //因为三极管 所以是低电平点亮
		}
		//初始化 列
		GPIO_Init(GPIOC, UP | DN | PIN_SDI | PIN_CLK, GPIO_MODE_OUT_PP_LOW_FAST);    //  |power
		GPIO_WriteLow(GPIOC, UP);
		GPIO_WriteLow(GPIOC, DN);
    GPIO_WriteLow(GPIOC, PIN_CLK);
    GPIO_WriteLow(GPIOC, PIN_SDI);
		//GPIO_WriteLow(GPIOC, POWER);   //默认电源打开
    SendData(0, UP);
		SendData(0, DN);
}

/* 字幕显示任务, 0.1ms任务 */
void TaskDisp(void) {
    static uint8_t row;         //  0~6 行  actrow实际显示的行
    static uint8_t scan_n;      //  0~9 扫描次数
    uint16_t font;              //  字符某行数据
    uint8_t i;
		uint32_t virtual_font;
		
    if(row>= 9) {
        row= 0;
    }

		if(0== scan_n) {            //亮度
				switch(mode) {
						case ROLL_NONE:
								// 取字模
								font = 0;	
								// 熄灭所有LED, 输出高电平
								for(i=0; i<9; i++) {
										GPIO_WriteHigh(RowLck_Gpio[i], RowLck_Pin[i]);
								}
								// 输出字模
								if(row<= 0) {					
										SendData(0, UP);	
										font = (uint16_t)fonts[floor][row*2+ 16];
										font = font<< 8;
										font|= (uint16_t)fonts[floor][row*2+ 16+ 1];
										SendData(font, DN);				
										GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);						
								}
								else if((row> 0) && (row< 8)){
										font = (uint16_t)fonts[floor][row*2- 2];
										font = font<< 8;
										font|= (uint16_t)fonts[floor][row*2- 1];
										SendData(font, UP);	
										font = (uint16_t)fonts[floor][row*2+ 16];
										font = font<< 8;
										font|= (uint16_t)fonts[floor][row*2+ 1+ 16];
										SendData(font, DN);
										GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);
								}
								else if(row>= 8){
										font = (uint16_t)fonts[floor][row*2- 2];
										font = font<< 8;
										font|= (uint16_t)fonts[floor][row*2- 1];
										SendData(font, UP);
										SendData(0, DN);
										GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);	
								}
								break;
						case ROLL_LEFT:
								font = 0;	
								for(i=0; i<9; i++) {
										GPIO_WriteHigh(RowLck_Gpio[i], RowLck_Pin[i]);
								}
								// 输出字模
								if(row<= 0) {					
										SendData(0, UP);	
										virtual_font = (uint32_t)fonts_left[msg_index][16];
										virtual_font = virtual_font<< 8;
										virtual_font|= (uint32_t)fonts_left[msg_index][17];
										virtual_font = virtual_font<< 8;
										virtual_font|= (uint32_t)fonts_left[msg_index+ 1][16];
										virtual_font = virtual_font<< 8;
										virtual_font|= (uint32_t)fonts_left[msg_index+ 1][17];
										if(left_bit<17) {
												font= (uint16_t)((virtual_font&(0xffff0000>>left_bit))>>(16- left_bit));
										}
										else {
												font= (uint16_t)((virtual_font&(0xffff0000>>left_bit))<<(left_bit- 16));
										}
										SendData(font, DN);				
										GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);						
								}
								else if((row> 0) && (row< 8)){
										virtual_font = (uint32_t)fonts_left[msg_index][row*2- 2];
										virtual_font = virtual_font<< 8;
										virtual_font|= (uint32_t)fonts_left[msg_index][row*2- 1];
										virtual_font = virtual_font<< 8;
										virtual_font|= (uint32_t)fonts_left[msg_index+ 1][row*2- 2];
										virtual_font = virtual_font<< 8;
										virtual_font|= (uint32_t)fonts_left[msg_index+ 1][row*2- 1];
										if(left_bit<17) {
												font= (uint16_t)((virtual_font&(0xffff0000>>left_bit))>>(16- left_bit));
										}
										else {
												font= (uint16_t)((virtual_font&(0xffff0000>>left_bit))<<(left_bit- 16));
										}
										SendData(font, UP);	
										virtual_font = (uint32_t)fonts_left[msg_index][row*2+ 16];
										virtual_font = virtual_font<< 8;
										virtual_font|= (uint32_t)fonts_left[msg_index][row*2+ 1+ 16];
										virtual_font = virtual_font<< 8;
										virtual_font|= (uint32_t)fonts_left[msg_index+ 1][row*2+ 16];
										virtual_font = virtual_font<< 8;
										virtual_font|= (uint32_t)fonts_left[msg_index+ 1][row*2+ 1+ 16];
										if(left_bit<17) {
												font= (uint16_t)((virtual_font&(0xffff0000>>left_bit))>>(16- left_bit));
										}
										else {
												font= (uint16_t)((virtual_font&(0xffff0000>>left_bit))<<(left_bit- 16));
										}
										SendData(font, DN);
										GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);
								}
								else if(row>= 8){
										virtual_font = (uint32_t)fonts_left[msg_index][14];
										virtual_font = virtual_font<< 8;
										virtual_font|= (uint32_t)fonts_left[msg_index][15];
										virtual_font = virtual_font<< 8;
										virtual_font|= (uint32_t)fonts_left[msg_index+ 1][14];
										virtual_font = virtual_font<< 8;
										virtual_font|= (uint32_t)fonts_left[msg_index+ 1][15];
										if(left_bit<17) {
												font= (uint16_t)((virtual_font&(0xffff0000>>left_bit))>>(16- left_bit));
										}
										else {
												font= (uint16_t)((virtual_font&(0xffff0000>>left_bit))<<(left_bit- 16));
										}
										SendData(font, UP);
										SendData(0, DN);
										GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);	
								}
								break;
						case ROLL_FLASH:
								if((0== flash_n)|| (2== flash_n)|| (4== flash_n)) {
										font = 0;	
										for(i=0; i<9; i++) {
												GPIO_WriteHigh(RowLck_Gpio[i], RowLck_Pin[i]);
										}
										// 输出字模
										if(row<= 0) {					
												SendData(0x7ffe, UP);	
												font = (uint16_t)fonts_flash[floor][row*2+ 16];
												font = font<< 8;
												font|= (uint16_t)fonts_flash[floor][row*2+ 16+ 1];
												SendData(font, DN);				
												GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);						
										}
										else if((row> 0) && (row< 8)){
												font = (uint16_t)fonts_flash[floor][row*2- 2];
												font = font<< 8;
												font|= (uint16_t)fonts_flash[floor][row*2- 1];
												SendData(font, UP);	
												font = (uint16_t)fonts_flash[floor][row*2+ 16];
												font = font<< 8;
												font|= (uint16_t)fonts_flash[floor][row*2+ 1+ 16];
												SendData(font, DN);
												GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);
										}
										else if(row>= 8){
												font = (uint16_t)fonts_flash[floor][row*2- 2];
												font = font<< 8;
												font|= (uint16_t)fonts_flash[floor][row*2- 1];
												SendData(font, UP);
												SendData(0x7ffe, DN);
												GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);	
										}
								}
								else if((1== flash_n)|| (3== flash_n)|| (5== flash_n)){
										font = 0;	
										for(i=0; i<9; i++) {
												GPIO_WriteHigh(RowLck_Gpio[i], RowLck_Pin[i]);
										}
										// 输出字模
										if(row<= 0) {					
												SendData(0, UP);	
												font = (uint16_t)fonts[floor][row*2+ 16];
												font = font<< 8;
												font|= (uint16_t)fonts[floor][row*2+ 16+ 1];
												SendData(font, DN);				
												GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);						
										}
										else if((row> 0) && (row< 8)){
												font = (uint16_t)fonts[floor][row*2- 2];
												font = font<< 8;
												font|= (uint16_t)fonts[floor][row*2- 1];
												SendData(font, UP);	
												font = (uint16_t)fonts[floor][row*2+ 16];
												font = font<< 8;
												font|= (uint16_t)fonts[floor][row*2+ 1+ 16];
												SendData(font, DN);
												GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);
										}
										else if(row>= 8){
												font = (uint16_t)fonts[floor][row*2- 2];
												font = font<< 8;
												font|= (uint16_t)fonts[floor][row*2- 1];
												SendData(font, UP);
												SendData(0, DN);
												GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);	
										}
								}								
								break;
						case ROLL_UP:
								// 取字模
								font = 0;	
								// 熄灭所有LED, 输出高电平
								for(i=0; i<9; i++) {
										GPIO_WriteHigh(RowLck_Gpio[i], RowLck_Pin[i]);
								}
								// 输出字模
								if(row<= 0) {					
										SendData(0, UP);	
										font = (uint16_t)fonts_up[act_row+ 16];
										font = font<< 8;
										font|= (uint16_t)fonts_up[act_row+ 17];
										SendData(font, DN);				
										GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);						
								}
								else if((row> 0) && (row< 8)){
										font = (uint16_t)fonts_up[act_row+ row*2- 2];
										font = font<< 8;
										font|= (uint16_t)fonts_up[act_row+ row*2- 1];
										SendData(font, UP);	
										font = (uint16_t)fonts_up[act_row+ row*2+ 16];
										font = font<< 8;
										font|= (uint16_t)fonts_up[act_row+ row*2+ 17];
										SendData(font, DN);
										GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);
								}
								else if(row>= 8){
										font = (uint16_t)fonts_up[act_row+ 14];
										font = font<< 8;
										font|= (uint16_t)fonts_up[act_row+ 15];
										SendData(font, UP);
										SendData(0, DN);
										GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);	
								}
								break;
						default:
								break;
				}
		}
		
    if(scan_n > Brightness) {  //控制亮度 大于亮度值就熄灭  以保持亮度  实际上是 显示次数用来控制显示亮度
        // 熄灭所有LED, 输出高电平
				for(i=0; i<9; i++) {
					GPIO_WriteHigh(RowLck_Gpio[i], RowLck_Pin[i]);
				}
    }

    if(scan_n >= 10) {
        scan_n = 0;
				flash_n++;
        row++;          // 下一行
    }
    else {
        scan_n++;
    }
} 

//模拟spi输出
static void SendData(uint16_t value, GPIO_Pin_TypeDef data_place) {
    uint8_t i;
			
		GPIO_WriteLow(GPIOC, data_place);
		GPIO_WriteLow(GPIOC, PIN_CLK);
		for(i=0; i<16; i++) {
				if(UP== data_place) {	
						if(value & 0x0001) {
								GPIO_WriteHigh(GPIOC, PIN_SDI);//因为低电平 点亮
						}
						else {
								GPIO_WriteLow(GPIOC, PIN_SDI);
						}
						GPIO_WriteHigh(GPIOC, PIN_CLK);   //数据移位发生在上升沿
						GPIO_WriteLow(GPIOC, PIN_CLK);
						value >>= 1;                      //value左移
				}
				else if(DN== data_place){
						if(value & 0x8000) {
								GPIO_WriteHigh(GPIOC, PIN_SDI);
						}
						else {
								GPIO_WriteLow(GPIOC, PIN_SDI);
						}
						GPIO_WriteHigh(GPIOC, PIN_CLK);   //数据移位发生在上升沿
						GPIO_WriteLow(GPIOC, PIN_CLK);
						value <<= 1;                      //value左移
				}
		}
		GPIO_WriteHigh(GPIOC, data_place);   			//输出锁存打开
		GPIO_WriteLow(GPIOC, data_place);
}


