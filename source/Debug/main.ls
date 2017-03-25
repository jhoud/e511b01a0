   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  39                     ; 16 main() {
  41                     	switch	.text
  42  0000               _main:
  46                     ; 20     HSE_Clk_Init();  //外部晶振初始化
  48  0000 ad16          	call	L3_HSE_Clk_Init
  50                     ; 22     DispInit();
  52  0002 cd0000        	call	_DispInit
  54                     ; 26     Tim2_Init();   //中断初始吧
  56  0005 ad56          	call	L5_Tim2_Init
  58                     ; 29     enableInterrupts();
  61  0007 9a            rim
  63                     ; 31     SetBrightness(3);
  66  0008 a603          	ld	a,#3
  67  000a cd0000        	call	_SetBrightness
  69                     ; 32 		SetMode(ROLL_NONE);
  71  000d 4f            	clr	a
  72  000e cd0000        	call	_SetMode
  74  0011               L52:
  75                     ; 177 			  Delay(0xffff);
  77  0011 aeffff        	ldw	x,#65535
  78  0014 ad7e          	call	_Delay
  81  0016 20f9          	jra	L52
 110                     ; 182 static void HSE_Clk_Init(void) {
 111                     	switch	.text
 112  0018               L3_HSE_Clk_Init:
 116                     ; 183 		CLK_DeInit();                                       //  时钟变量初始化
 118  0018 cd0000        	call	_CLK_DeInit
 120                     ; 184     CLK_HSICmd(ENABLE);                                 //  内部晶振使能
 122  001b a601          	ld	a,#1
 123  001d cd0000        	call	_CLK_HSICmd
 126  0020               L34:
 127                     ; 185     while(SET != CLK_GetFlagStatus(CLK_FLAG_HSIRDY));   //  等待内部晶振稳定
 129  0020 ae0102        	ldw	x,#258
 130  0023 cd0000        	call	_CLK_GetFlagStatus
 132  0026 a101          	cp	a,#1
 133  0028 26f6          	jrne	L34
 134                     ; 186     CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);            //  CPU时钟预分频器, 1分频
 136  002a a680          	ld	a,#128
 137  002c cd0000        	call	_CLK_SYSCLKConfig
 139                     ; 187     CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);            //  内部时钟预分频器, 1分频
 141  002f 4f            	clr	a
 142  0030 cd0000        	call	_CLK_SYSCLKConfig
 144                     ; 188     CLK_ClockSwitchCmd(ENABLE);                         //  使能时钟切换功能
 146  0033 a601          	ld	a,#1
 147  0035 cd0000        	call	_CLK_ClockSwitchCmd
 149                     ; 190     CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO ,CLK_SOURCE_HSI ,DISABLE ,CLK_CURRENTCLOCKSTATE_ENABLE);
 151  0038 4b01          	push	#1
 152  003a 4b00          	push	#0
 153  003c ae00e1        	ldw	x,#225
 154  003f a601          	ld	a,#1
 155  0041 95            	ld	xh,a
 156  0042 cd0000        	call	_CLK_ClockSwitchConfig
 158  0045 85            	popw	x
 159                     ; 200 }
 162  0046 81            	ret
 190                     ; 202 static void Dog_Init(void) {
 191                     	switch	.text
 192  0047               L74_Dog_Init:
 196                     ; 203     IWDG_Enable();
 198  0047 cd0000        	call	_IWDG_Enable
 200                     ; 204     IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
 202  004a a655          	ld	a,#85
 203  004c cd0000        	call	_IWDG_WriteAccessCmd
 205                     ; 205     IWDG_SetPrescaler(IWDG_Prescaler_256);
 207  004f a606          	ld	a,#6
 208  0051 cd0000        	call	_IWDG_SetPrescaler
 210                     ; 206     IWDG_SetReload(0xff);   //IWDG_RLR= 0xff
 212  0054 a6ff          	ld	a,#255
 213  0056 cd0000        	call	_IWDG_SetReload
 215                     ; 207     IWDG_ReloadCounter();   //将用IWDG_RLR的数值0xff刷新计数器的内容从而避免产生看门狗复位 即喂狗
 217  0059 cd0000        	call	_IWDG_ReloadCounter
 219                     ; 208 }
 222  005c 81            	ret
 249                     ; 210 void Tim2_Init(void) {
 250                     	switch	.text
 251  005d               L5_Tim2_Init:
 255                     ; 211     TIM2_DeInit();
 257  005d cd0000        	call	_TIM2_DeInit
 259                     ; 212     TIM2_TimeBaseInit(TIM2_PRESCALER_16, 99);    //  16分频, 16分频, 赋计数器初 值 0.1ms进入一次中断
 261  0060 ae0063        	ldw	x,#99
 262  0063 89            	pushw	x
 263  0064 a604          	ld	a,#4
 264  0066 cd0000        	call	_TIM2_TimeBaseInit
 266  0069 85            	popw	x
 267                     ; 213     TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);       //  允许溢出中断
 269  006a ae0001        	ldw	x,#1
 270  006d a601          	ld	a,#1
 271  006f 95            	ld	xh,a
 272  0070 cd0000        	call	_TIM2_ITConfig
 274                     ; 214     TIM2_Cmd(ENABLE);                            //  使能TIM2计数
 276  0073 a601          	ld	a,#1
 277  0075 cd0000        	call	_TIM2_Cmd
 279                     ; 215 }
 282  0078 81            	ret
 309                     ; 217 void Timer4_Init(void) {
 310                     	switch	.text
 311  0079               _Timer4_Init:
 315                     ; 218     TIM4_DeInit();
 317  0079 cd0000        	call	_TIM4_DeInit
 319                     ; 219     TIM4_TimeBaseInit(TIM4_PRESCALER_128, 0x02);         // 128分频,  赋计数器初值
 321  007c ae0002        	ldw	x,#2
 322  007f a607          	ld	a,#7
 323  0081 95            	ld	xh,a
 324  0082 cd0000        	call	_TIM4_TimeBaseInit
 326                     ; 220     TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);              //  更新中断使能, 即溢出中断
 328  0085 ae0001        	ldw	x,#1
 329  0088 a601          	ld	a,#1
 330  008a 95            	ld	xh,a
 331  008b cd0000        	call	_TIM4_ITConfig
 333                     ; 221     TIM4_Cmd(ENABLE);
 335  008e a601          	ld	a,#1
 336  0090 cd0000        	call	_TIM4_Cmd
 338                     ; 222 }
 341  0093 81            	ret
 375                     ; 229 void Delay(uint16_t nCount){
 376                     	switch	.text
 377  0094               _Delay:
 379  0094 89            	pushw	x
 380       00000000      OFST:	set	0
 383  0095 2007          	jra	L121
 384  0097               L711:
 385                     ; 232       nCount--;
 387  0097 1e01          	ldw	x,(OFST+1,sp)
 388  0099 1d0001        	subw	x,#1
 389  009c 1f01          	ldw	(OFST+1,sp),x
 390  009e               L121:
 391                     ; 231      while (nCount != 0){
 393  009e 1e01          	ldw	x,(OFST+1,sp)
 394  00a0 26f5          	jrne	L711
 395                     ; 234 }
 398  00a2 85            	popw	x
 399  00a3 81            	ret
 434                     ; 245 void assert_failed(uint8_t* file, uint32_t line)
 434                     ; 246 {
 435                     	switch	.text
 436  00a4               _assert_failed:
 440  00a4               L341:
 441  00a4 20fe          	jra	L341
 454                     	xdef	_Timer4_Init
 455                     	xdef	_main
 456                     	xdef	_Delay
 457                     	xref	_SetBrightness
 458                     	xref	_SetMode
 459                     	xref	_DispInit
 460                     	xdef	_assert_failed
 461                     	xref	_TIM4_ITConfig
 462                     	xref	_TIM4_Cmd
 463                     	xref	_TIM4_TimeBaseInit
 464                     	xref	_TIM4_DeInit
 465                     	xref	_TIM2_ITConfig
 466                     	xref	_TIM2_Cmd
 467                     	xref	_TIM2_TimeBaseInit
 468                     	xref	_TIM2_DeInit
 469                     	xref	_IWDG_Enable
 470                     	xref	_IWDG_ReloadCounter
 471                     	xref	_IWDG_SetReload
 472                     	xref	_IWDG_SetPrescaler
 473                     	xref	_IWDG_WriteAccessCmd
 474                     	xref	_CLK_GetFlagStatus
 475                     	xref	_CLK_SYSCLKConfig
 476                     	xref	_CLK_ClockSwitchConfig
 477                     	xref	_CLK_ClockSwitchCmd
 478                     	xref	_CLK_HSICmd
 479                     	xref	_CLK_DeInit
 498                     	end
