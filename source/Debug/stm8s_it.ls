   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  33                     ; 46 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  33                     ; 47 {
  34                     	switch	.text
  35  0000               f_NonHandledInterrupt:
  40                     ; 51 }
  43  0000 80            	iret
  65                     ; 59 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  65                     ; 60 {
  66                     	switch	.text
  67  0001               f_TRAP_IRQHandler:
  72                     ; 64 }
  75  0001 80            	iret
  97                     ; 70 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
  97                     ; 71 {
  98                     	switch	.text
  99  0002               f_TLI_IRQHandler:
 104                     ; 75 }
 107  0002 80            	iret
 129                     ; 82 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 129                     ; 83 {
 130                     	switch	.text
 131  0003               f_AWU_IRQHandler:
 136                     ; 87 }
 139  0003 80            	iret
 161                     ; 94 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 161                     ; 95 {
 162                     	switch	.text
 163  0004               f_CLK_IRQHandler:
 168                     ; 99 }
 171  0004 80            	iret
 194                     ; 106 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 194                     ; 107 {
 195                     	switch	.text
 196  0005               f_EXTI_PORTA_IRQHandler:
 201                     ; 111 }
 204  0005 80            	iret
 227                     ; 118 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 227                     ; 119 {
 228                     	switch	.text
 229  0006               f_EXTI_PORTB_IRQHandler:
 234                     ; 123 }
 237  0006 80            	iret
 260                     ; 130 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 260                     ; 131 {
 261                     	switch	.text
 262  0007               f_EXTI_PORTC_IRQHandler:
 267                     ; 135 }
 270  0007 80            	iret
 293                     ; 142 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 293                     ; 143 {
 294                     	switch	.text
 295  0008               f_EXTI_PORTD_IRQHandler:
 300                     ; 147 }
 303  0008 80            	iret
 326                     ; 154 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 326                     ; 155 {
 327                     	switch	.text
 328  0009               f_EXTI_PORTE_IRQHandler:
 333                     ; 159 }
 336  0009 80            	iret
 360                     ; 180  INTERRUPT_HANDLER(CAN_RX_IRQHandler, 8)
 360                     ; 181 {
 361                     	switch	.text
 362  000a               f_CAN_RX_IRQHandler:
 365  000a 3b0002        	push	c_x+2
 366  000d be00          	ldw	x,c_x
 367  000f 89            	pushw	x
 368  0010 3b0002        	push	c_y+2
 369  0013 be00          	ldw	x,c_y
 370  0015 89            	pushw	x
 373                     ; 185     CAN_Receive();
 375  0016 cd0000        	call	_CAN_Receive
 377                     ; 186     ReceiveCanData();
 379  0019 cd0000        	call	_ReceiveCanData
 381                     ; 189 }
 384  001c 85            	popw	x
 385  001d bf00          	ldw	c_y,x
 386  001f 320002        	pop	c_y+2
 387  0022 85            	popw	x
 388  0023 bf00          	ldw	c_x,x
 389  0025 320002        	pop	c_x+2
 390  0028 80            	iret
 412                     ; 196  INTERRUPT_HANDLER(CAN_TX_IRQHandler, 9)
 412                     ; 197 {
 413                     	switch	.text
 414  0029               f_CAN_TX_IRQHandler:
 419                     ; 201 }
 422  0029 80            	iret
 444                     ; 209 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 444                     ; 210 {
 445                     	switch	.text
 446  002a               f_SPI_IRQHandler:
 451                     ; 214 }
 454  002a 80            	iret
 477                     ; 221 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 477                     ; 222 {
 478                     	switch	.text
 479  002b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 484                     ; 226 }
 487  002b 80            	iret
 510                     ; 233 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 510                     ; 234 {
 511                     	switch	.text
 512  002c               f_TIM1_CAP_COM_IRQHandler:
 517                     ; 238 }
 520  002c 80            	iret
 522                     	bsct
 523  0000               L302_f_num:
 524  0000 00            	dc.b	0
 525                     	switch	.ubsct
 526  0000               L312_act_row:
 527  0000 0000          	ds.b	2
 528  0002               L112_left_bit:
 529  0002 00            	ds.b	1
 530  0003               L702_flash_n:
 531  0003 00            	ds.b	1
 532  0004               L512_counter2:
 533  0004 0000          	ds.b	2
 534  0006               L502_mode:
 535  0006 00            	ds.b	1
 621                     ; 270  INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 621                     ; 271 {
 622                     	switch	.text
 623  002d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 626  002d 3b0002        	push	c_x+2
 627  0030 be00          	ldw	x,c_x
 628  0032 89            	pushw	x
 629  0033 3b0002        	push	c_y+2
 630  0036 be00          	ldw	x,c_y
 631  0038 89            	pushw	x
 634                     ; 279 		SetFloor(f_num);
 636  0039 b600          	ld	a,L302_f_num
 637  003b cd0000        	call	_SetFloor
 639                     ; 280 		SetFlashCounter(flash_n);
 641  003e b603          	ld	a,L702_flash_n
 642  0040 cd0000        	call	_SetFlashCounter
 644                     ; 281 		SetLeftBit(left_bit);
 646  0043 b602          	ld	a,L112_left_bit
 647  0045 cd0000        	call	_SetLeftBit
 649                     ; 282 		SetUpRow(act_row);
 651  0048 be00          	ldw	x,L312_act_row
 652  004a cd0000        	call	_SetUpRow
 654                     ; 283 		TaskDisp();
 656  004d cd0000        	call	_TaskDisp
 658                     ; 284 		mode= GetMode();
 660  0050 cd0000        	call	_GetMode
 662  0053 b706          	ld	L502_mode,a
 663                     ; 292 		counter2++;
 665  0055 be04          	ldw	x,L512_counter2
 666  0057 1c0001        	addw	x,#1
 667  005a bf04          	ldw	L512_counter2,x
 668                     ; 293 		if(counter2>= 800) {    // 5000*0.1ms=500ms
 670  005c be04          	ldw	x,L512_counter2
 671  005e a30320        	cpw	x,#800
 672  0061 2569          	jrult	L372
 673                     ; 294 				counter2= 0;
 675  0063 5f            	clrw	x
 676  0064 bf04          	ldw	L512_counter2,x
 677                     ; 295 				switch(mode) {
 679  0066 b606          	ld	a,L502_mode
 681                     ; 332 						default:
 681                     ; 333 								break;
 682  0068 4d            	tnz	a
 683  0069 270b          	jreq	L712
 684  006b 4a            	dec	a
 685  006c 271b          	jreq	L122
 686  006e 4a            	dec	a
 687  006f 2746          	jreq	L522
 688  0071 4a            	dec	a
 689  0072 2726          	jreq	L322
 690  0074 2056          	jra	L372
 691  0076               L712:
 692                     ; 296 						case ROLL_NONE:
 692                     ; 297 								if(14== f_num) {
 694  0076 b600          	ld	a,L302_f_num
 695  0078 a10e          	cp	a,#14
 696  007a 2609          	jrne	L103
 697                     ; 298 										f_num= 0;
 699  007c 3f00          	clr	L302_f_num
 700                     ; 299 										SetMode(ROLL_LEFT);
 702  007e a601          	ld	a,#1
 703  0080 cd0000        	call	_SetMode
 706  0083 2047          	jra	L372
 707  0085               L103:
 708                     ; 302 										f_num++;
 710  0085 3c00          	inc	L302_f_num
 711  0087 2043          	jra	L372
 712  0089               L122:
 713                     ; 305 						case ROLL_LEFT:
 713                     ; 306 								left_bit++;
 715  0089 3c02          	inc	L112_left_bit
 716                     ; 307 								if(left_bit> 32) {
 718  008b b602          	ld	a,L112_left_bit
 719  008d a121          	cp	a,#33
 720  008f 253b          	jrult	L372
 721                     ; 308 										left_bit= 0;
 723  0091 3f02          	clr	L112_left_bit
 724                     ; 309 										SetMode(ROLL_FLASH);
 726  0093 a603          	ld	a,#3
 727  0095 cd0000        	call	_SetMode
 729  0098 2032          	jra	L372
 730  009a               L322:
 731                     ; 312 						case ROLL_FLASH:
 731                     ; 313 								flash_n++;
 733  009a 3c03          	inc	L702_flash_n
 734                     ; 314 								if(flash_n> 5) {
 736  009c b603          	ld	a,L702_flash_n
 737  009e a106          	cp	a,#6
 738  00a0 252a          	jrult	L372
 739                     ; 315 										flash_n= 0;
 741  00a2 3f03          	clr	L702_flash_n
 742                     ; 316 										if(14== f_num) {
 744  00a4 b600          	ld	a,L302_f_num
 745  00a6 a10e          	cp	a,#14
 746  00a8 2609          	jrne	L113
 747                     ; 317 												f_num= 0;
 749  00aa 3f00          	clr	L302_f_num
 750                     ; 318 												SetMode(ROLL_UP);
 752  00ac a602          	ld	a,#2
 753  00ae cd0000        	call	_SetMode
 756  00b1 2019          	jra	L372
 757  00b3               L113:
 758                     ; 321 												f_num++;
 760  00b3 3c00          	inc	L302_f_num
 761  00b5 2015          	jra	L372
 762  00b7               L522:
 763                     ; 325 						case ROLL_UP:
 763                     ; 326 								act_row+= 2;
 765  00b7 be00          	ldw	x,L312_act_row
 766  00b9 1c0002        	addw	x,#2
 767  00bc bf00          	ldw	L312_act_row,x
 768                     ; 327 								if(act_row>= 18*32) {
 770  00be be00          	ldw	x,L312_act_row
 771  00c0 a30240        	cpw	x,#576
 772  00c3 2507          	jrult	L372
 773                     ; 328 										act_row= 0;
 775  00c5 5f            	clrw	x
 776  00c6 bf00          	ldw	L312_act_row,x
 777                     ; 329 										SetMode(ROLL_NONE);
 779  00c8 4f            	clr	a
 780  00c9 cd0000        	call	_SetMode
 782  00cc               L722:
 783                     ; 332 						default:
 783                     ; 333 								break;
 785  00cc               L772:
 786  00cc               L372:
 787                     ; 337     TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
 789  00cc a601          	ld	a,#1
 790  00ce cd0000        	call	_TIM2_ClearITPendingBit
 792                     ; 338 }
 795  00d1 85            	popw	x
 796  00d2 bf00          	ldw	c_y,x
 797  00d4 320002        	pop	c_y+2
 798  00d7 85            	popw	x
 799  00d8 bf00          	ldw	c_x,x
 800  00da 320002        	pop	c_x+2
 801  00dd 80            	iret
 824                     ; 345  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 824                     ; 346 {
 825                     	switch	.text
 826  00de               f_TIM2_CAP_COM_IRQHandler:
 831                     ; 350 }
 834  00de 80            	iret
 857                     ; 360  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 857                     ; 361 {
 858                     	switch	.text
 859  00df               f_TIM3_UPD_OVF_BRK_IRQHandler:
 864                     ; 365 }
 867  00df 80            	iret
 890                     ; 372  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 890                     ; 373 {
 891                     	switch	.text
 892  00e0               f_TIM3_CAP_COM_IRQHandler:
 897                     ; 377 }
 900  00e0 80            	iret
 923                     ; 387  INTERRUPT_HANDLER(UART1_TX_IRQHandler, 17)
 923                     ; 388 {
 924                     	switch	.text
 925  00e1               f_UART1_TX_IRQHandler:
 930                     ; 392 }
 933  00e1 80            	iret
 956                     ; 399  INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 956                     ; 400 {
 957                     	switch	.text
 958  00e2               f_UART1_RX_IRQHandler:
 963                     ; 404 }
 966  00e2 80            	iret
 988                     ; 412 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 988                     ; 413 {
 989                     	switch	.text
 990  00e3               f_I2C_IRQHandler:
 995                     ; 417 }
 998  00e3 80            	iret
1021                     ; 451  INTERRUPT_HANDLER(UART3_TX_IRQHandler, 20)
1021                     ; 452 {
1022                     	switch	.text
1023  00e4               f_UART3_TX_IRQHandler:
1028                     ; 456   }
1031  00e4 80            	iret
1054                     ; 463  INTERRUPT_HANDLER(UART3_RX_IRQHandler, 21)
1054                     ; 464 {
1055                     	switch	.text
1056  00e5               f_UART3_RX_IRQHandler:
1061                     ; 468   }
1064  00e5 80            	iret
1086                     ; 477  INTERRUPT_HANDLER(ADC2_IRQHandler, 22)
1086                     ; 478 {
1087                     	switch	.text
1088  00e6               f_ADC2_IRQHandler:
1093                     ; 483     return;
1096  00e6 80            	iret
1098                     	switch	.ubsct
1099  0007               L724_counter:
1100  0007 0000          	ds.b	2
1134                     ; 521  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
1134                     ; 522 {
1135                     	switch	.text
1136  00e7               f_TIM4_UPD_OVF_IRQHandler:
1139  00e7 3b0002        	push	c_x+2
1140  00ea be00          	ldw	x,c_x
1141  00ec 89            	pushw	x
1142  00ed 3b0002        	push	c_y+2
1143  00f0 be00          	ldw	x,c_y
1144  00f2 89            	pushw	x
1147                     ; 528     if(counter<10000) {
1149  00f3 be07          	ldw	x,L724_counter
1150  00f5 a32710        	cpw	x,#10000
1151  00f8 2409          	jruge	L744
1152                     ; 529         ++counter;
1154  00fa be07          	ldw	x,L724_counter
1155  00fc 1c0001        	addw	x,#1
1156  00ff bf07          	ldw	L724_counter,x
1158  0101 2003          	jra	L154
1159  0103               L744:
1160                     ; 532         counter=0;
1162  0103 5f            	clrw	x
1163  0104 bf07          	ldw	L724_counter,x
1164  0106               L154:
1165                     ; 535     TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
1167  0106 a601          	ld	a,#1
1168  0108 cd0000        	call	_TIM4_ClearITPendingBit
1170                     ; 536 }
1173  010b 85            	popw	x
1174  010c bf00          	ldw	c_y,x
1175  010e 320002        	pop	c_y+2
1176  0111 85            	popw	x
1177  0112 bf00          	ldw	c_x,x
1178  0114 320002        	pop	c_x+2
1179  0117 80            	iret
1202                     ; 544 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
1202                     ; 545 {
1203                     	switch	.text
1204  0118               f_EEPROM_EEC_IRQHandler:
1209                     ; 549 }
1212  0118 80            	iret
1224                     	xref	_ReceiveCanData
1225                     	xref	_SetFlashCounter
1226                     	xref	_SetUpRow
1227                     	xref	_SetLeftBit
1228                     	xref	_SetFloor
1229                     	xref	_GetMode
1230                     	xref	_SetMode
1231                     	xref	_TaskDisp
1232                     	xdef	f_EEPROM_EEC_IRQHandler
1233                     	xdef	f_TIM4_UPD_OVF_IRQHandler
1234                     	xdef	f_ADC2_IRQHandler
1235                     	xdef	f_UART3_TX_IRQHandler
1236                     	xdef	f_UART3_RX_IRQHandler
1237                     	xdef	f_I2C_IRQHandler
1238                     	xdef	f_UART1_RX_IRQHandler
1239                     	xdef	f_UART1_TX_IRQHandler
1240                     	xdef	f_TIM3_CAP_COM_IRQHandler
1241                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
1242                     	xdef	f_TIM2_CAP_COM_IRQHandler
1243                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
1244                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
1245                     	xdef	f_TIM1_CAP_COM_IRQHandler
1246                     	xdef	f_SPI_IRQHandler
1247                     	xdef	f_CAN_TX_IRQHandler
1248                     	xdef	f_CAN_RX_IRQHandler
1249                     	xdef	f_EXTI_PORTE_IRQHandler
1250                     	xdef	f_EXTI_PORTD_IRQHandler
1251                     	xdef	f_EXTI_PORTC_IRQHandler
1252                     	xdef	f_EXTI_PORTB_IRQHandler
1253                     	xdef	f_EXTI_PORTA_IRQHandler
1254                     	xdef	f_CLK_IRQHandler
1255                     	xdef	f_AWU_IRQHandler
1256                     	xdef	f_TLI_IRQHandler
1257                     	xdef	f_TRAP_IRQHandler
1258                     	xdef	f_NonHandledInterrupt
1259                     	xref	_TIM4_ClearITPendingBit
1260                     	xref	_TIM2_ClearITPendingBit
1261                     	xref	_CAN_Receive
1262                     	xref.b	c_x
1263                     	xref.b	c_y
1282                     	end
