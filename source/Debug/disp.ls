   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   4                     .const:	section	.text
   5  0000               L3_RowLck_Pin:
   6  0000 01            	dc.b	1
   7  0001 02            	dc.b	2
   8  0002 04            	dc.b	4
   9  0003 08            	dc.b	8
  10  0004 80            	dc.b	128
  11  0005 40            	dc.b	64
  12  0006 20            	dc.b	32
  13  0007 10            	dc.b	16
  14  0008 01            	dc.b	1
  15                     	bsct
  16  0000               L5_RowLck_Gpio:
  17  0000 5005          	dc.w	20485
  18  0002 5005          	dc.w	20485
  19  0004 5005          	dc.w	20485
  20  0006 5005          	dc.w	20485
  21  0008 5005          	dc.w	20485
  22  000a 5005          	dc.w	20485
  23  000c 5005          	dc.w	20485
  24  000e 5005          	dc.w	20485
  25  0010 500f          	dc.w	20495
  26  0012               L7_Brightness:
  27  0012 00            	dc.b	0
  28  0013               L31_mode:
  29  0013 00            	dc.b	0
  30  0014               L32_left_bit:
  31  0014 00            	dc.b	0
  72                     ; 24 void SetMode(uint8_t index) {
  74                     	switch	.text
  75  0000               _SetMode:
  79                     ; 25 		mode= index;
  81  0000 b713          	ld	L31_mode,a
  82                     ; 26 }
  85  0002 81            	ret
 109                     ; 28 uint8_t GetMode(void) {
 110                     	switch	.text
 111  0003               _GetMode:
 115                     ; 29 		return mode;
 117  0003 b613          	ld	a,L31_mode
 120  0005 81            	ret
 155                     ; 32 void SetFloor(uint8_t index) {
 156                     	switch	.text
 157  0006               _SetFloor:
 161                     ; 33 		floor= index;
 163  0006 b706          	ld	L11_floor,a
 164                     ; 34 }
 167  0008 81            	ret
 202                     ; 36 void SetMsg(uint8_t index) {
 203                     	switch	.text
 204  0009               _SetMsg:
 208                     ; 37 		msg_index= index;
 210  0009 b702          	ld	L12_msg_index,a
 211                     ; 38 }
 214  000b 81            	ret
 249                     ; 40 void SetLeftBit(uint8_t index) {
 250                     	switch	.text
 251  000c               _SetLeftBit:
 255                     ; 41 		left_bit= index;
 257  000c b714          	ld	L32_left_bit,a
 258                     ; 42 }
 261  000e 81            	ret
 296                     ; 44 void SetFlashCounter(uint8_t index) {
 297                     	switch	.text
 298  000f               _SetFlashCounter:
 302                     ; 45 		flash_n= index;
 304  000f b705          	ld	L51_flash_n,a
 305                     ; 46 }
 308  0011 81            	ret
 343                     ; 48 void SetUpRow(uint16_t index) {
 344                     	switch	.text
 345  0012               _SetUpRow:
 349                     ; 49 		act_row= index;
 351  0012 bf03          	ldw	L71_act_row,x
 352                     ; 50 }
 355  0014 81            	ret
 390                     ; 52 void SetBrightness(uint8_t value) {
 391                     	switch	.text
 392  0015               _SetBrightness:
 394  0015 88            	push	a
 395       00000000      OFST:	set	0
 398                     ; 53     if(value > 9) {
 400  0016 a10a          	cp	a,#10
 401  0018 2506          	jrult	L702
 402                     ; 54         Brightness = 9;
 404  001a 35090012      	mov	L7_Brightness,#9
 406  001e 2004          	jra	L112
 407  0020               L702:
 408                     ; 57         Brightness = value;
 410  0020 7b01          	ld	a,(OFST+1,sp)
 411  0022 b712          	ld	L7_Brightness,a
 412  0024               L112:
 413                     ; 59 }
 416  0024 84            	pop	a
 417  0025 81            	ret
 457                     ; 62 void DispInit(void) {
 458                     	switch	.text
 459  0026               _DispInit:
 461  0026 88            	push	a
 462       00000001      OFST:	set	1
 465                     ; 66 		for(i= 0; i<9; i++) {
 467  0027 0f01          	clr	(OFST+0,sp)
 468  0029               L132:
 469                     ; 67 				GPIO_Init(RowLck_Gpio[i], RowLck_Pin[i], GPIO_MODE_OUT_PP_LOW_FAST);
 471  0029 4be0          	push	#224
 472  002b 7b02          	ld	a,(OFST+1,sp)
 473  002d 5f            	clrw	x
 474  002e 97            	ld	xl,a
 475  002f d60000        	ld	a,(L3_RowLck_Pin,x)
 476  0032 88            	push	a
 477  0033 7b03          	ld	a,(OFST+2,sp)
 478  0035 5f            	clrw	x
 479  0036 97            	ld	xl,a
 480  0037 58            	sllw	x
 481  0038 ee00          	ldw	x,(L5_RowLck_Gpio,x)
 482  003a cd0000        	call	_GPIO_Init
 484  003d 85            	popw	x
 485                     ; 68 				GPIO_WriteHigh(RowLck_Gpio[i], RowLck_Pin[i]);       //因为三极管 所以是低电平点亮
 487  003e 7b01          	ld	a,(OFST+0,sp)
 488  0040 5f            	clrw	x
 489  0041 97            	ld	xl,a
 490  0042 d60000        	ld	a,(L3_RowLck_Pin,x)
 491  0045 88            	push	a
 492  0046 7b02          	ld	a,(OFST+1,sp)
 493  0048 5f            	clrw	x
 494  0049 97            	ld	xl,a
 495  004a 58            	sllw	x
 496  004b ee00          	ldw	x,(L5_RowLck_Gpio,x)
 497  004d cd0000        	call	_GPIO_WriteHigh
 499  0050 84            	pop	a
 500                     ; 66 		for(i= 0; i<9; i++) {
 502  0051 0c01          	inc	(OFST+0,sp)
 505  0053 7b01          	ld	a,(OFST+0,sp)
 506  0055 a109          	cp	a,#9
 507  0057 25d0          	jrult	L132
 508                     ; 71 		GPIO_Init(GPIOC, UP | DN | PIN_SDI | PIN_CLK, GPIO_MODE_OUT_PP_LOW_FAST);    //  |power
 510  0059 4be0          	push	#224
 511  005b 4bf0          	push	#240
 512  005d ae500a        	ldw	x,#20490
 513  0060 cd0000        	call	_GPIO_Init
 515  0063 85            	popw	x
 516                     ; 72 		GPIO_WriteLow(GPIOC, UP);
 518  0064 4b10          	push	#16
 519  0066 ae500a        	ldw	x,#20490
 520  0069 cd0000        	call	_GPIO_WriteLow
 522  006c 84            	pop	a
 523                     ; 73 		GPIO_WriteLow(GPIOC, DN);
 525  006d 4b20          	push	#32
 526  006f ae500a        	ldw	x,#20490
 527  0072 cd0000        	call	_GPIO_WriteLow
 529  0075 84            	pop	a
 530                     ; 74     GPIO_WriteLow(GPIOC, PIN_CLK);
 532  0076 4b40          	push	#64
 533  0078 ae500a        	ldw	x,#20490
 534  007b cd0000        	call	_GPIO_WriteLow
 536  007e 84            	pop	a
 537                     ; 75     GPIO_WriteLow(GPIOC, PIN_SDI);
 539  007f 4b80          	push	#128
 540  0081 ae500a        	ldw	x,#20490
 541  0084 cd0000        	call	_GPIO_WriteLow
 543  0087 84            	pop	a
 544                     ; 77     SendData(0, UP);
 546  0088 4b10          	push	#16
 547  008a 5f            	clrw	x
 548  008b cd0b91        	call	L52_SendData
 550  008e 84            	pop	a
 551                     ; 78 		SendData(0, DN);
 553  008f 4b20          	push	#32
 554  0091 5f            	clrw	x
 555  0092 cd0b91        	call	L52_SendData
 557  0095 84            	pop	a
 558                     ; 79 }
 561  0096 84            	pop	a
 562  0097 81            	ret
 565                     	switch	.ubsct
 566  0000               L732_row:
 567  0000 00            	ds.b	1
 568  0001               L142_scan_n:
 569  0001 00            	ds.b	1
 653                     ; 82 void TaskDisp(void) {
 654                     	switch	.text
 655  0098               _TaskDisp:
 657  0098 520b          	subw	sp,#11
 658       0000000b      OFST:	set	11
 661                     ; 89     if(row>= 9) {
 663  009a b600          	ld	a,L732_row
 664  009c a109          	cp	a,#9
 665  009e 2502          	jrult	L313
 666                     ; 90         row= 0;
 668  00a0 3f00          	clr	L732_row
 669  00a2               L313:
 670                     ; 93 		if(0== scan_n) {            //亮度
 672  00a2 3d01          	tnz	L142_scan_n
 673  00a4 2703          	jreq	L03
 674  00a6 cc0b5b        	jp	L513
 675  00a9               L03:
 676                     ; 94 				switch(mode) {
 678  00a9 b613          	ld	a,L31_mode
 680                     ; 311 						default:
 680                     ; 312 								break;
 681  00ab 4d            	tnz	a
 682  00ac 2716          	jreq	L342
 683  00ae 4a            	dec	a
 684  00af 2603          	jrne	L23
 685  00b1 cc0265        	jp	L542
 686  00b4               L23:
 687  00b4 4a            	dec	a
 688  00b5 2603          	jrne	L43
 689  00b7 cc0a1f        	jp	L152
 690  00ba               L43:
 691  00ba 4a            	dec	a
 692  00bb 2603          	jrne	L63
 693  00bd cc06b1        	jp	L742
 694  00c0               L63:
 695  00c0 ac5b0b5b      	jpf	L513
 696  00c4               L342:
 697                     ; 95 						case ROLL_NONE:
 697                     ; 96 								// 取字模
 697                     ; 97 								font = 0;	
 699  00c4 1e0a          	ldw	x,(OFST-1,sp)
 700                     ; 99 								for(i=0; i<9; i++) {
 702  00c6 0f09          	clr	(OFST-2,sp)
 703  00c8               L323:
 704                     ; 100 										GPIO_WriteHigh(RowLck_Gpio[i], RowLck_Pin[i]);
 706  00c8 7b09          	ld	a,(OFST-2,sp)
 707  00ca 5f            	clrw	x
 708  00cb 97            	ld	xl,a
 709  00cc d60000        	ld	a,(L3_RowLck_Pin,x)
 710  00cf 88            	push	a
 711  00d0 7b0a          	ld	a,(OFST-1,sp)
 712  00d2 5f            	clrw	x
 713  00d3 97            	ld	xl,a
 714  00d4 58            	sllw	x
 715  00d5 ee00          	ldw	x,(L5_RowLck_Gpio,x)
 716  00d7 cd0000        	call	_GPIO_WriteHigh
 718  00da 84            	pop	a
 719                     ; 99 								for(i=0; i<9; i++) {
 721  00db 0c09          	inc	(OFST-2,sp)
 724  00dd 7b09          	ld	a,(OFST-2,sp)
 725  00df a109          	cp	a,#9
 726  00e1 25e5          	jrult	L323
 727                     ; 103 								if(row<= 0) {					
 729  00e3 3d00          	tnz	L732_row
 730  00e5 2661          	jrne	L133
 731                     ; 104 										SendData(0, UP);	
 733  00e7 4b10          	push	#16
 734  00e9 5f            	clrw	x
 735  00ea cd0b91        	call	L52_SendData
 737  00ed 84            	pop	a
 738                     ; 105 										font = (uint16_t)fonts[floor][row*2+ 16];
 740  00ee b600          	ld	a,L732_row
 741  00f0 5f            	clrw	x
 742  00f1 97            	ld	xl,a
 743  00f2 58            	sllw	x
 744  00f3 1f03          	ldw	(OFST-8,sp),x
 745  00f5 b606          	ld	a,L11_floor
 746  00f7 97            	ld	xl,a
 747  00f8 a620          	ld	a,#32
 748  00fa 42            	mul	x,a
 749  00fb 72fb03        	addw	x,(OFST-8,sp)
 750  00fe d60010        	ld	a,(_fonts+16,x)
 751  0101 5f            	clrw	x
 752  0102 97            	ld	xl,a
 753  0103 1f0a          	ldw	(OFST-1,sp),x
 754                     ; 106 										font = font<< 8;
 756  0105 7b0b          	ld	a,(OFST+0,sp)
 757  0107 6b0a          	ld	(OFST-1,sp),a
 758  0109 0f0b          	clr	(OFST+0,sp)
 759                     ; 107 										font|= (uint16_t)fonts[floor][row*2+ 16+ 1];
 761  010b b600          	ld	a,L732_row
 762  010d 5f            	clrw	x
 763  010e 97            	ld	xl,a
 764  010f 58            	sllw	x
 765  0110 1f03          	ldw	(OFST-8,sp),x
 766  0112 b606          	ld	a,L11_floor
 767  0114 97            	ld	xl,a
 768  0115 a620          	ld	a,#32
 769  0117 42            	mul	x,a
 770  0118 72fb03        	addw	x,(OFST-8,sp)
 771  011b d60011        	ld	a,(_fonts+17,x)
 772  011e 5f            	clrw	x
 773  011f 97            	ld	xl,a
 774  0120 01            	rrwa	x,a
 775  0121 1a0b          	or	a,(OFST+0,sp)
 776  0123 01            	rrwa	x,a
 777  0124 1a0a          	or	a,(OFST-1,sp)
 778  0126 01            	rrwa	x,a
 779  0127 1f0a          	ldw	(OFST-1,sp),x
 780                     ; 108 										SendData(font, DN);				
 782  0129 4b20          	push	#32
 783  012b 1e0b          	ldw	x,(OFST+0,sp)
 784  012d cd0b91        	call	L52_SendData
 786  0130 84            	pop	a
 787                     ; 109 										GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);						
 789  0131 b600          	ld	a,L732_row
 790  0133 5f            	clrw	x
 791  0134 97            	ld	xl,a
 792  0135 d60000        	ld	a,(L3_RowLck_Pin,x)
 793  0138 88            	push	a
 794  0139 b600          	ld	a,L732_row
 795  013b 5f            	clrw	x
 796  013c 97            	ld	xl,a
 797  013d 58            	sllw	x
 798  013e ee00          	ldw	x,(L5_RowLck_Gpio,x)
 799  0140 cd0000        	call	_GPIO_WriteLow
 801  0143 84            	pop	a
 803  0144 ac5b0b5b      	jpf	L513
 804  0148               L133:
 805                     ; 111 								else if((row> 0) && (row< 8)){
 807  0148 3d00          	tnz	L732_row
 808  014a 2603          	jrne	L04
 809  014c cc01f8        	jp	L533
 810  014f               L04:
 812  014f b600          	ld	a,L732_row
 813  0151 a108          	cp	a,#8
 814  0153 2503          	jrult	L24
 815  0155 cc01f8        	jp	L533
 816  0158               L24:
 817                     ; 112 										font = (uint16_t)fonts[floor][row*2- 2];
 819  0158 b600          	ld	a,L732_row
 820  015a 5f            	clrw	x
 821  015b 97            	ld	xl,a
 822  015c 58            	sllw	x
 823  015d 5a            	decw	x
 824  015e 5a            	decw	x
 825  015f 1f03          	ldw	(OFST-8,sp),x
 826  0161 b606          	ld	a,L11_floor
 827  0163 97            	ld	xl,a
 828  0164 a620          	ld	a,#32
 829  0166 42            	mul	x,a
 830  0167 72fb03        	addw	x,(OFST-8,sp)
 831  016a d60000        	ld	a,(_fonts,x)
 832  016d 5f            	clrw	x
 833  016e 97            	ld	xl,a
 834  016f 1f0a          	ldw	(OFST-1,sp),x
 835                     ; 113 										font = font<< 8;
 837  0171 7b0b          	ld	a,(OFST+0,sp)
 838  0173 6b0a          	ld	(OFST-1,sp),a
 839  0175 0f0b          	clr	(OFST+0,sp)
 840                     ; 114 										font|= (uint16_t)fonts[floor][row*2- 1];
 842  0177 b600          	ld	a,L732_row
 843  0179 5f            	clrw	x
 844  017a 97            	ld	xl,a
 845  017b 58            	sllw	x
 846  017c 5a            	decw	x
 847  017d 1f03          	ldw	(OFST-8,sp),x
 848  017f b606          	ld	a,L11_floor
 849  0181 97            	ld	xl,a
 850  0182 a620          	ld	a,#32
 851  0184 42            	mul	x,a
 852  0185 72fb03        	addw	x,(OFST-8,sp)
 853  0188 d60000        	ld	a,(_fonts,x)
 854  018b 5f            	clrw	x
 855  018c 97            	ld	xl,a
 856  018d 01            	rrwa	x,a
 857  018e 1a0b          	or	a,(OFST+0,sp)
 858  0190 01            	rrwa	x,a
 859  0191 1a0a          	or	a,(OFST-1,sp)
 860  0193 01            	rrwa	x,a
 861  0194 1f0a          	ldw	(OFST-1,sp),x
 862                     ; 115 										SendData(font, UP);	
 864  0196 4b10          	push	#16
 865  0198 1e0b          	ldw	x,(OFST+0,sp)
 866  019a cd0b91        	call	L52_SendData
 868  019d 84            	pop	a
 869                     ; 116 										font = (uint16_t)fonts[floor][row*2+ 16];
 871  019e b600          	ld	a,L732_row
 872  01a0 5f            	clrw	x
 873  01a1 97            	ld	xl,a
 874  01a2 58            	sllw	x
 875  01a3 1f03          	ldw	(OFST-8,sp),x
 876  01a5 b606          	ld	a,L11_floor
 877  01a7 97            	ld	xl,a
 878  01a8 a620          	ld	a,#32
 879  01aa 42            	mul	x,a
 880  01ab 72fb03        	addw	x,(OFST-8,sp)
 881  01ae d60010        	ld	a,(_fonts+16,x)
 882  01b1 5f            	clrw	x
 883  01b2 97            	ld	xl,a
 884  01b3 1f0a          	ldw	(OFST-1,sp),x
 885                     ; 117 										font = font<< 8;
 887  01b5 7b0b          	ld	a,(OFST+0,sp)
 888  01b7 6b0a          	ld	(OFST-1,sp),a
 889  01b9 0f0b          	clr	(OFST+0,sp)
 890                     ; 118 										font|= (uint16_t)fonts[floor][row*2+ 1+ 16];
 892  01bb b600          	ld	a,L732_row
 893  01bd 5f            	clrw	x
 894  01be 97            	ld	xl,a
 895  01bf 58            	sllw	x
 896  01c0 1f03          	ldw	(OFST-8,sp),x
 897  01c2 b606          	ld	a,L11_floor
 898  01c4 97            	ld	xl,a
 899  01c5 a620          	ld	a,#32
 900  01c7 42            	mul	x,a
 901  01c8 72fb03        	addw	x,(OFST-8,sp)
 902  01cb d60011        	ld	a,(_fonts+17,x)
 903  01ce 5f            	clrw	x
 904  01cf 97            	ld	xl,a
 905  01d0 01            	rrwa	x,a
 906  01d1 1a0b          	or	a,(OFST+0,sp)
 907  01d3 01            	rrwa	x,a
 908  01d4 1a0a          	or	a,(OFST-1,sp)
 909  01d6 01            	rrwa	x,a
 910  01d7 1f0a          	ldw	(OFST-1,sp),x
 911                     ; 119 										SendData(font, DN);
 913  01d9 4b20          	push	#32
 914  01db 1e0b          	ldw	x,(OFST+0,sp)
 915  01dd cd0b91        	call	L52_SendData
 917  01e0 84            	pop	a
 918                     ; 120 										GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);
 920  01e1 b600          	ld	a,L732_row
 921  01e3 5f            	clrw	x
 922  01e4 97            	ld	xl,a
 923  01e5 d60000        	ld	a,(L3_RowLck_Pin,x)
 924  01e8 88            	push	a
 925  01e9 b600          	ld	a,L732_row
 926  01eb 5f            	clrw	x
 927  01ec 97            	ld	xl,a
 928  01ed 58            	sllw	x
 929  01ee ee00          	ldw	x,(L5_RowLck_Gpio,x)
 930  01f0 cd0000        	call	_GPIO_WriteLow
 932  01f3 84            	pop	a
 934  01f4 ac5b0b5b      	jpf	L513
 935  01f8               L533:
 936                     ; 122 								else if(row>= 8){
 938  01f8 b600          	ld	a,L732_row
 939  01fa a108          	cp	a,#8
 940  01fc 2403          	jruge	L44
 941  01fe cc0b5b        	jp	L513
 942  0201               L44:
 943                     ; 123 										font = (uint16_t)fonts[floor][row*2- 2];
 945  0201 b600          	ld	a,L732_row
 946  0203 5f            	clrw	x
 947  0204 97            	ld	xl,a
 948  0205 58            	sllw	x
 949  0206 5a            	decw	x
 950  0207 5a            	decw	x
 951  0208 1f03          	ldw	(OFST-8,sp),x
 952  020a b606          	ld	a,L11_floor
 953  020c 97            	ld	xl,a
 954  020d a620          	ld	a,#32
 955  020f 42            	mul	x,a
 956  0210 72fb03        	addw	x,(OFST-8,sp)
 957  0213 d60000        	ld	a,(_fonts,x)
 958  0216 5f            	clrw	x
 959  0217 97            	ld	xl,a
 960  0218 1f0a          	ldw	(OFST-1,sp),x
 961                     ; 124 										font = font<< 8;
 963  021a 7b0b          	ld	a,(OFST+0,sp)
 964  021c 6b0a          	ld	(OFST-1,sp),a
 965  021e 0f0b          	clr	(OFST+0,sp)
 966                     ; 125 										font|= (uint16_t)fonts[floor][row*2- 1];
 968  0220 b600          	ld	a,L732_row
 969  0222 5f            	clrw	x
 970  0223 97            	ld	xl,a
 971  0224 58            	sllw	x
 972  0225 5a            	decw	x
 973  0226 1f03          	ldw	(OFST-8,sp),x
 974  0228 b606          	ld	a,L11_floor
 975  022a 97            	ld	xl,a
 976  022b a620          	ld	a,#32
 977  022d 42            	mul	x,a
 978  022e 72fb03        	addw	x,(OFST-8,sp)
 979  0231 d60000        	ld	a,(_fonts,x)
 980  0234 5f            	clrw	x
 981  0235 97            	ld	xl,a
 982  0236 01            	rrwa	x,a
 983  0237 1a0b          	or	a,(OFST+0,sp)
 984  0239 01            	rrwa	x,a
 985  023a 1a0a          	or	a,(OFST-1,sp)
 986  023c 01            	rrwa	x,a
 987  023d 1f0a          	ldw	(OFST-1,sp),x
 988                     ; 126 										SendData(font, UP);
 990  023f 4b10          	push	#16
 991  0241 1e0b          	ldw	x,(OFST+0,sp)
 992  0243 cd0b91        	call	L52_SendData
 994  0246 84            	pop	a
 995                     ; 127 										SendData(0, DN);
 997  0247 4b20          	push	#32
 998  0249 5f            	clrw	x
 999  024a cd0b91        	call	L52_SendData
1001  024d 84            	pop	a
1002                     ; 128 										GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);	
1004  024e b600          	ld	a,L732_row
1005  0250 5f            	clrw	x
1006  0251 97            	ld	xl,a
1007  0252 d60000        	ld	a,(L3_RowLck_Pin,x)
1008  0255 88            	push	a
1009  0256 b600          	ld	a,L732_row
1010  0258 5f            	clrw	x
1011  0259 97            	ld	xl,a
1012  025a 58            	sllw	x
1013  025b ee00          	ldw	x,(L5_RowLck_Gpio,x)
1014  025d cd0000        	call	_GPIO_WriteLow
1016  0260 84            	pop	a
1017  0261 ac5b0b5b      	jpf	L513
1018  0265               L542:
1019                     ; 131 						case ROLL_LEFT:
1019                     ; 132 								font = 0;	
1021  0265 1e0a          	ldw	x,(OFST-1,sp)
1022                     ; 133 								for(i=0; i<9; i++) {
1024  0267 0f09          	clr	(OFST-2,sp)
1025  0269               L343:
1026                     ; 134 										GPIO_WriteHigh(RowLck_Gpio[i], RowLck_Pin[i]);
1028  0269 7b09          	ld	a,(OFST-2,sp)
1029  026b 5f            	clrw	x
1030  026c 97            	ld	xl,a
1031  026d d60000        	ld	a,(L3_RowLck_Pin,x)
1032  0270 88            	push	a
1033  0271 7b0a          	ld	a,(OFST-1,sp)
1034  0273 5f            	clrw	x
1035  0274 97            	ld	xl,a
1036  0275 58            	sllw	x
1037  0276 ee00          	ldw	x,(L5_RowLck_Gpio,x)
1038  0278 cd0000        	call	_GPIO_WriteHigh
1040  027b 84            	pop	a
1041                     ; 133 								for(i=0; i<9; i++) {
1043  027c 0c09          	inc	(OFST-2,sp)
1046  027e 7b09          	ld	a,(OFST-2,sp)
1047  0280 a109          	cp	a,#9
1048  0282 25e5          	jrult	L343
1049                     ; 137 								if(row<= 0) {					
1051  0284 3d00          	tnz	L732_row
1052  0286 2703          	jreq	L64
1053  0288 cc0382        	jp	L153
1054  028b               L64:
1055                     ; 138 										SendData(0, UP);	
1057  028b 4b10          	push	#16
1058  028d 5f            	clrw	x
1059  028e cd0b91        	call	L52_SendData
1061  0291 84            	pop	a
1062                     ; 139 										virtual_font = (uint32_t)fonts_left[msg_index][16];
1064  0292 b602          	ld	a,L12_msg_index
1065  0294 97            	ld	xl,a
1066  0295 a620          	ld	a,#32
1067  0297 42            	mul	x,a
1068  0298 d60010        	ld	a,(_fonts_left+16,x)
1069  029b b703          	ld	c_lreg+3,a
1070  029d 3f02          	clr	c_lreg+2
1071  029f 3f01          	clr	c_lreg+1
1072  02a1 3f00          	clr	c_lreg
1073  02a3 96            	ldw	x,sp
1074  02a4 1c0005        	addw	x,#OFST-6
1075  02a7 cd0000        	call	c_rtol
1077                     ; 140 										virtual_font = virtual_font<< 8;
1079  02aa 96            	ldw	x,sp
1080  02ab 1c0005        	addw	x,#OFST-6
1081  02ae a608          	ld	a,#8
1082  02b0 cd0000        	call	c_lglsh
1084                     ; 141 										virtual_font|= (uint32_t)fonts_left[msg_index][17];
1086  02b3 b602          	ld	a,L12_msg_index
1087  02b5 97            	ld	xl,a
1088  02b6 a620          	ld	a,#32
1089  02b8 42            	mul	x,a
1090  02b9 d60011        	ld	a,(_fonts_left+17,x)
1091  02bc b703          	ld	c_lreg+3,a
1092  02be 3f02          	clr	c_lreg+2
1093  02c0 3f01          	clr	c_lreg+1
1094  02c2 3f00          	clr	c_lreg
1095  02c4 96            	ldw	x,sp
1096  02c5 1c0005        	addw	x,#OFST-6
1097  02c8 cd0000        	call	c_lgor
1099                     ; 142 										virtual_font = virtual_font<< 8;
1101  02cb 96            	ldw	x,sp
1102  02cc 1c0005        	addw	x,#OFST-6
1103  02cf a608          	ld	a,#8
1104  02d1 cd0000        	call	c_lglsh
1106                     ; 143 										virtual_font|= (uint32_t)fonts_left[msg_index+ 1][16];
1108  02d4 b602          	ld	a,L12_msg_index
1109  02d6 97            	ld	xl,a
1110  02d7 a620          	ld	a,#32
1111  02d9 42            	mul	x,a
1112  02da d60030        	ld	a,(_fonts_left+48,x)
1113  02dd b703          	ld	c_lreg+3,a
1114  02df 3f02          	clr	c_lreg+2
1115  02e1 3f01          	clr	c_lreg+1
1116  02e3 3f00          	clr	c_lreg
1117  02e5 96            	ldw	x,sp
1118  02e6 1c0005        	addw	x,#OFST-6
1119  02e9 cd0000        	call	c_lgor
1121                     ; 144 										virtual_font = virtual_font<< 8;
1123  02ec 96            	ldw	x,sp
1124  02ed 1c0005        	addw	x,#OFST-6
1125  02f0 a608          	ld	a,#8
1126  02f2 cd0000        	call	c_lglsh
1128                     ; 145 										virtual_font|= (uint32_t)fonts_left[msg_index+ 1][17];
1130  02f5 b602          	ld	a,L12_msg_index
1131  02f7 97            	ld	xl,a
1132  02f8 a620          	ld	a,#32
1133  02fa 42            	mul	x,a
1134  02fb d60031        	ld	a,(_fonts_left+49,x)
1135  02fe b703          	ld	c_lreg+3,a
1136  0300 3f02          	clr	c_lreg+2
1137  0302 3f01          	clr	c_lreg+1
1138  0304 3f00          	clr	c_lreg
1139  0306 96            	ldw	x,sp
1140  0307 1c0005        	addw	x,#OFST-6
1141  030a cd0000        	call	c_lgor
1143                     ; 146 										if(left_bit<17) {
1145  030d b614          	ld	a,L32_left_bit
1146  030f a111          	cp	a,#17
1147  0311 2423          	jruge	L353
1148                     ; 147 												font= (uint16_t)((virtual_font&(0xffff0000>>left_bit))>>(16- left_bit));
1150  0313 ae0000        	ldw	x,#0
1151  0316 bf02          	ldw	c_lreg+2,x
1152  0318 aeffff        	ldw	x,#-1
1153  031b bf00          	ldw	c_lreg,x
1154  031d b614          	ld	a,L32_left_bit
1155  031f cd0000        	call	c_lursh
1157  0322 96            	ldw	x,sp
1158  0323 1c0005        	addw	x,#OFST-6
1159  0326 cd0000        	call	c_land
1161  0329 a610          	ld	a,#16
1162  032b b014          	sub	a,L32_left_bit
1163  032d cd0000        	call	c_lursh
1165  0330 be02          	ldw	x,c_lreg+2
1166  0332 1f0a          	ldw	(OFST-1,sp),x
1168  0334 202d          	jra	L553
1169  0336               L353:
1170                     ; 150 												font= (uint16_t)((virtual_font&(0xffff0000>>left_bit))<<(left_bit- 16));
1172  0336 1e07          	ldw	x,(OFST-4,sp)
1173  0338 cd0000        	call	c_uitolx
1175  033b 96            	ldw	x,sp
1176  033c 1c0001        	addw	x,#OFST-10
1177  033f cd0000        	call	c_rtol
1179  0342 ae0000        	ldw	x,#0
1180  0345 bf02          	ldw	c_lreg+2,x
1181  0347 aeffff        	ldw	x,#-1
1182  034a bf00          	ldw	c_lreg,x
1183  034c b614          	ld	a,L32_left_bit
1184  034e cd0000        	call	c_lursh
1186  0351 96            	ldw	x,sp
1187  0352 1c0001        	addw	x,#OFST-10
1188  0355 cd0000        	call	c_land
1190  0358 b614          	ld	a,L32_left_bit
1191  035a a010          	sub	a,#16
1192  035c cd0000        	call	c_llsh
1194  035f be02          	ldw	x,c_lreg+2
1195  0361 1f0a          	ldw	(OFST-1,sp),x
1196  0363               L553:
1197                     ; 152 										SendData(font, DN);				
1199  0363 4b20          	push	#32
1200  0365 1e0b          	ldw	x,(OFST+0,sp)
1201  0367 cd0b91        	call	L52_SendData
1203  036a 84            	pop	a
1204                     ; 153 										GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);						
1206  036b b600          	ld	a,L732_row
1207  036d 5f            	clrw	x
1208  036e 97            	ld	xl,a
1209  036f d60000        	ld	a,(L3_RowLck_Pin,x)
1210  0372 88            	push	a
1211  0373 b600          	ld	a,L732_row
1212  0375 5f            	clrw	x
1213  0376 97            	ld	xl,a
1214  0377 58            	sllw	x
1215  0378 ee00          	ldw	x,(L5_RowLck_Gpio,x)
1216  037a cd0000        	call	_GPIO_WriteLow
1218  037d 84            	pop	a
1220  037e ac5b0b5b      	jpf	L513
1221  0382               L153:
1222                     ; 155 								else if((row> 0) && (row< 8)){
1224  0382 3d00          	tnz	L732_row
1225  0384 2603          	jrne	L05
1226  0386 cc05b1        	jp	L163
1227  0389               L05:
1229  0389 b600          	ld	a,L732_row
1230  038b a108          	cp	a,#8
1231  038d 2503          	jrult	L25
1232  038f cc05b1        	jp	L163
1233  0392               L25:
1234                     ; 156 										virtual_font = (uint32_t)fonts_left[msg_index][row*2- 2];
1236  0392 b600          	ld	a,L732_row
1237  0394 5f            	clrw	x
1238  0395 97            	ld	xl,a
1239  0396 58            	sllw	x
1240  0397 5a            	decw	x
1241  0398 5a            	decw	x
1242  0399 1f03          	ldw	(OFST-8,sp),x
1243  039b b602          	ld	a,L12_msg_index
1244  039d 97            	ld	xl,a
1245  039e a620          	ld	a,#32
1246  03a0 42            	mul	x,a
1247  03a1 72fb03        	addw	x,(OFST-8,sp)
1248  03a4 d60000        	ld	a,(_fonts_left,x)
1249  03a7 b703          	ld	c_lreg+3,a
1250  03a9 3f02          	clr	c_lreg+2
1251  03ab 3f01          	clr	c_lreg+1
1252  03ad 3f00          	clr	c_lreg
1253  03af 96            	ldw	x,sp
1254  03b0 1c0005        	addw	x,#OFST-6
1255  03b3 cd0000        	call	c_rtol
1257                     ; 157 										virtual_font = virtual_font<< 8;
1259  03b6 96            	ldw	x,sp
1260  03b7 1c0005        	addw	x,#OFST-6
1261  03ba a608          	ld	a,#8
1262  03bc cd0000        	call	c_lglsh
1264                     ; 158 										virtual_font|= (uint32_t)fonts_left[msg_index][row*2- 1];
1266  03bf b600          	ld	a,L732_row
1267  03c1 5f            	clrw	x
1268  03c2 97            	ld	xl,a
1269  03c3 58            	sllw	x
1270  03c4 5a            	decw	x
1271  03c5 1f03          	ldw	(OFST-8,sp),x
1272  03c7 b602          	ld	a,L12_msg_index
1273  03c9 97            	ld	xl,a
1274  03ca a620          	ld	a,#32
1275  03cc 42            	mul	x,a
1276  03cd 72fb03        	addw	x,(OFST-8,sp)
1277  03d0 d60000        	ld	a,(_fonts_left,x)
1278  03d3 b703          	ld	c_lreg+3,a
1279  03d5 3f02          	clr	c_lreg+2
1280  03d7 3f01          	clr	c_lreg+1
1281  03d9 3f00          	clr	c_lreg
1282  03db 96            	ldw	x,sp
1283  03dc 1c0005        	addw	x,#OFST-6
1284  03df cd0000        	call	c_lgor
1286                     ; 159 										virtual_font = virtual_font<< 8;
1288  03e2 96            	ldw	x,sp
1289  03e3 1c0005        	addw	x,#OFST-6
1290  03e6 a608          	ld	a,#8
1291  03e8 cd0000        	call	c_lglsh
1293                     ; 160 										virtual_font|= (uint32_t)fonts_left[msg_index+ 1][row*2- 2];
1295  03eb b600          	ld	a,L732_row
1296  03ed 5f            	clrw	x
1297  03ee 97            	ld	xl,a
1298  03ef 58            	sllw	x
1299  03f0 5a            	decw	x
1300  03f1 5a            	decw	x
1301  03f2 1f03          	ldw	(OFST-8,sp),x
1302  03f4 b602          	ld	a,L12_msg_index
1303  03f6 97            	ld	xl,a
1304  03f7 a620          	ld	a,#32
1305  03f9 42            	mul	x,a
1306  03fa 72fb03        	addw	x,(OFST-8,sp)
1307  03fd d60020        	ld	a,(_fonts_left+32,x)
1308  0400 b703          	ld	c_lreg+3,a
1309  0402 3f02          	clr	c_lreg+2
1310  0404 3f01          	clr	c_lreg+1
1311  0406 3f00          	clr	c_lreg
1312  0408 96            	ldw	x,sp
1313  0409 1c0005        	addw	x,#OFST-6
1314  040c cd0000        	call	c_lgor
1316                     ; 161 										virtual_font = virtual_font<< 8;
1318  040f 96            	ldw	x,sp
1319  0410 1c0005        	addw	x,#OFST-6
1320  0413 a608          	ld	a,#8
1321  0415 cd0000        	call	c_lglsh
1323                     ; 162 										virtual_font|= (uint32_t)fonts_left[msg_index+ 1][row*2- 1];
1325  0418 b600          	ld	a,L732_row
1326  041a 5f            	clrw	x
1327  041b 97            	ld	xl,a
1328  041c 58            	sllw	x
1329  041d 5a            	decw	x
1330  041e 1f03          	ldw	(OFST-8,sp),x
1331  0420 b602          	ld	a,L12_msg_index
1332  0422 97            	ld	xl,a
1333  0423 a620          	ld	a,#32
1334  0425 42            	mul	x,a
1335  0426 72fb03        	addw	x,(OFST-8,sp)
1336  0429 d60020        	ld	a,(_fonts_left+32,x)
1337  042c b703          	ld	c_lreg+3,a
1338  042e 3f02          	clr	c_lreg+2
1339  0430 3f01          	clr	c_lreg+1
1340  0432 3f00          	clr	c_lreg
1341  0434 96            	ldw	x,sp
1342  0435 1c0005        	addw	x,#OFST-6
1343  0438 cd0000        	call	c_lgor
1345                     ; 163 										if(left_bit<17) {
1347  043b b614          	ld	a,L32_left_bit
1348  043d a111          	cp	a,#17
1349  043f 2423          	jruge	L363
1350                     ; 164 												font= (uint16_t)((virtual_font&(0xffff0000>>left_bit))>>(16- left_bit));
1352  0441 ae0000        	ldw	x,#0
1353  0444 bf02          	ldw	c_lreg+2,x
1354  0446 aeffff        	ldw	x,#-1
1355  0449 bf00          	ldw	c_lreg,x
1356  044b b614          	ld	a,L32_left_bit
1357  044d cd0000        	call	c_lursh
1359  0450 96            	ldw	x,sp
1360  0451 1c0005        	addw	x,#OFST-6
1361  0454 cd0000        	call	c_land
1363  0457 a610          	ld	a,#16
1364  0459 b014          	sub	a,L32_left_bit
1365  045b cd0000        	call	c_lursh
1367  045e be02          	ldw	x,c_lreg+2
1368  0460 1f0a          	ldw	(OFST-1,sp),x
1370  0462 202d          	jra	L563
1371  0464               L363:
1372                     ; 167 												font= (uint16_t)((virtual_font&(0xffff0000>>left_bit))<<(left_bit- 16));
1374  0464 1e07          	ldw	x,(OFST-4,sp)
1375  0466 cd0000        	call	c_uitolx
1377  0469 96            	ldw	x,sp
1378  046a 1c0001        	addw	x,#OFST-10
1379  046d cd0000        	call	c_rtol
1381  0470 ae0000        	ldw	x,#0
1382  0473 bf02          	ldw	c_lreg+2,x
1383  0475 aeffff        	ldw	x,#-1
1384  0478 bf00          	ldw	c_lreg,x
1385  047a b614          	ld	a,L32_left_bit
1386  047c cd0000        	call	c_lursh
1388  047f 96            	ldw	x,sp
1389  0480 1c0001        	addw	x,#OFST-10
1390  0483 cd0000        	call	c_land
1392  0486 b614          	ld	a,L32_left_bit
1393  0488 a010          	sub	a,#16
1394  048a cd0000        	call	c_llsh
1396  048d be02          	ldw	x,c_lreg+2
1397  048f 1f0a          	ldw	(OFST-1,sp),x
1398  0491               L563:
1399                     ; 169 										SendData(font, UP);	
1401  0491 4b10          	push	#16
1402  0493 1e0b          	ldw	x,(OFST+0,sp)
1403  0495 cd0b91        	call	L52_SendData
1405  0498 84            	pop	a
1406                     ; 170 										virtual_font = (uint32_t)fonts_left[msg_index][row*2+ 16];
1408  0499 b600          	ld	a,L732_row
1409  049b 5f            	clrw	x
1410  049c 97            	ld	xl,a
1411  049d 58            	sllw	x
1412  049e 1f03          	ldw	(OFST-8,sp),x
1413  04a0 b602          	ld	a,L12_msg_index
1414  04a2 97            	ld	xl,a
1415  04a3 a620          	ld	a,#32
1416  04a5 42            	mul	x,a
1417  04a6 72fb03        	addw	x,(OFST-8,sp)
1418  04a9 d60010        	ld	a,(_fonts_left+16,x)
1419  04ac b703          	ld	c_lreg+3,a
1420  04ae 3f02          	clr	c_lreg+2
1421  04b0 3f01          	clr	c_lreg+1
1422  04b2 3f00          	clr	c_lreg
1423  04b4 96            	ldw	x,sp
1424  04b5 1c0005        	addw	x,#OFST-6
1425  04b8 cd0000        	call	c_rtol
1427                     ; 171 										virtual_font = virtual_font<< 8;
1429  04bb 96            	ldw	x,sp
1430  04bc 1c0005        	addw	x,#OFST-6
1431  04bf a608          	ld	a,#8
1432  04c1 cd0000        	call	c_lglsh
1434                     ; 172 										virtual_font|= (uint32_t)fonts_left[msg_index][row*2+ 1+ 16];
1436  04c4 b600          	ld	a,L732_row
1437  04c6 5f            	clrw	x
1438  04c7 97            	ld	xl,a
1439  04c8 58            	sllw	x
1440  04c9 1f03          	ldw	(OFST-8,sp),x
1441  04cb b602          	ld	a,L12_msg_index
1442  04cd 97            	ld	xl,a
1443  04ce a620          	ld	a,#32
1444  04d0 42            	mul	x,a
1445  04d1 72fb03        	addw	x,(OFST-8,sp)
1446  04d4 d60011        	ld	a,(_fonts_left+17,x)
1447  04d7 b703          	ld	c_lreg+3,a
1448  04d9 3f02          	clr	c_lreg+2
1449  04db 3f01          	clr	c_lreg+1
1450  04dd 3f00          	clr	c_lreg
1451  04df 96            	ldw	x,sp
1452  04e0 1c0005        	addw	x,#OFST-6
1453  04e3 cd0000        	call	c_lgor
1455                     ; 173 										virtual_font = virtual_font<< 8;
1457  04e6 96            	ldw	x,sp
1458  04e7 1c0005        	addw	x,#OFST-6
1459  04ea a608          	ld	a,#8
1460  04ec cd0000        	call	c_lglsh
1462                     ; 174 										virtual_font|= (uint32_t)fonts_left[msg_index+ 1][row*2+ 16];
1464  04ef b600          	ld	a,L732_row
1465  04f1 5f            	clrw	x
1466  04f2 97            	ld	xl,a
1467  04f3 58            	sllw	x
1468  04f4 1f03          	ldw	(OFST-8,sp),x
1469  04f6 b602          	ld	a,L12_msg_index
1470  04f8 97            	ld	xl,a
1471  04f9 a620          	ld	a,#32
1472  04fb 42            	mul	x,a
1473  04fc 72fb03        	addw	x,(OFST-8,sp)
1474  04ff d60030        	ld	a,(_fonts_left+48,x)
1475  0502 b703          	ld	c_lreg+3,a
1476  0504 3f02          	clr	c_lreg+2
1477  0506 3f01          	clr	c_lreg+1
1478  0508 3f00          	clr	c_lreg
1479  050a 96            	ldw	x,sp
1480  050b 1c0005        	addw	x,#OFST-6
1481  050e cd0000        	call	c_lgor
1483                     ; 175 										virtual_font = virtual_font<< 8;
1485  0511 96            	ldw	x,sp
1486  0512 1c0005        	addw	x,#OFST-6
1487  0515 a608          	ld	a,#8
1488  0517 cd0000        	call	c_lglsh
1490                     ; 176 										virtual_font|= (uint32_t)fonts_left[msg_index+ 1][row*2+ 1+ 16];
1492  051a b600          	ld	a,L732_row
1493  051c 5f            	clrw	x
1494  051d 97            	ld	xl,a
1495  051e 58            	sllw	x
1496  051f 1f03          	ldw	(OFST-8,sp),x
1497  0521 b602          	ld	a,L12_msg_index
1498  0523 97            	ld	xl,a
1499  0524 a620          	ld	a,#32
1500  0526 42            	mul	x,a
1501  0527 72fb03        	addw	x,(OFST-8,sp)
1502  052a d60031        	ld	a,(_fonts_left+49,x)
1503  052d b703          	ld	c_lreg+3,a
1504  052f 3f02          	clr	c_lreg+2
1505  0531 3f01          	clr	c_lreg+1
1506  0533 3f00          	clr	c_lreg
1507  0535 96            	ldw	x,sp
1508  0536 1c0005        	addw	x,#OFST-6
1509  0539 cd0000        	call	c_lgor
1511                     ; 177 										if(left_bit<17) {
1513  053c b614          	ld	a,L32_left_bit
1514  053e a111          	cp	a,#17
1515  0540 2423          	jruge	L763
1516                     ; 178 												font= (uint16_t)((virtual_font&(0xffff0000>>left_bit))>>(16- left_bit));
1518  0542 ae0000        	ldw	x,#0
1519  0545 bf02          	ldw	c_lreg+2,x
1520  0547 aeffff        	ldw	x,#-1
1521  054a bf00          	ldw	c_lreg,x
1522  054c b614          	ld	a,L32_left_bit
1523  054e cd0000        	call	c_lursh
1525  0551 96            	ldw	x,sp
1526  0552 1c0005        	addw	x,#OFST-6
1527  0555 cd0000        	call	c_land
1529  0558 a610          	ld	a,#16
1530  055a b014          	sub	a,L32_left_bit
1531  055c cd0000        	call	c_lursh
1533  055f be02          	ldw	x,c_lreg+2
1534  0561 1f0a          	ldw	(OFST-1,sp),x
1536  0563 202d          	jra	L173
1537  0565               L763:
1538                     ; 181 												font= (uint16_t)((virtual_font&(0xffff0000>>left_bit))<<(left_bit- 16));
1540  0565 1e07          	ldw	x,(OFST-4,sp)
1541  0567 cd0000        	call	c_uitolx
1543  056a 96            	ldw	x,sp
1544  056b 1c0001        	addw	x,#OFST-10
1545  056e cd0000        	call	c_rtol
1547  0571 ae0000        	ldw	x,#0
1548  0574 bf02          	ldw	c_lreg+2,x
1549  0576 aeffff        	ldw	x,#-1
1550  0579 bf00          	ldw	c_lreg,x
1551  057b b614          	ld	a,L32_left_bit
1552  057d cd0000        	call	c_lursh
1554  0580 96            	ldw	x,sp
1555  0581 1c0001        	addw	x,#OFST-10
1556  0584 cd0000        	call	c_land
1558  0587 b614          	ld	a,L32_left_bit
1559  0589 a010          	sub	a,#16
1560  058b cd0000        	call	c_llsh
1562  058e be02          	ldw	x,c_lreg+2
1563  0590 1f0a          	ldw	(OFST-1,sp),x
1564  0592               L173:
1565                     ; 183 										SendData(font, DN);
1567  0592 4b20          	push	#32
1568  0594 1e0b          	ldw	x,(OFST+0,sp)
1569  0596 cd0b91        	call	L52_SendData
1571  0599 84            	pop	a
1572                     ; 184 										GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);
1574  059a b600          	ld	a,L732_row
1575  059c 5f            	clrw	x
1576  059d 97            	ld	xl,a
1577  059e d60000        	ld	a,(L3_RowLck_Pin,x)
1578  05a1 88            	push	a
1579  05a2 b600          	ld	a,L732_row
1580  05a4 5f            	clrw	x
1581  05a5 97            	ld	xl,a
1582  05a6 58            	sllw	x
1583  05a7 ee00          	ldw	x,(L5_RowLck_Gpio,x)
1584  05a9 cd0000        	call	_GPIO_WriteLow
1586  05ac 84            	pop	a
1588  05ad ac5b0b5b      	jpf	L513
1589  05b1               L163:
1590                     ; 186 								else if(row>= 8){
1592  05b1 b600          	ld	a,L732_row
1593  05b3 a108          	cp	a,#8
1594  05b5 2403          	jruge	L45
1595  05b7 cc0b5b        	jp	L513
1596  05ba               L45:
1597                     ; 187 										virtual_font = (uint32_t)fonts_left[msg_index][14];
1599  05ba b602          	ld	a,L12_msg_index
1600  05bc 97            	ld	xl,a
1601  05bd a620          	ld	a,#32
1602  05bf 42            	mul	x,a
1603  05c0 d6000e        	ld	a,(_fonts_left+14,x)
1604  05c3 b703          	ld	c_lreg+3,a
1605  05c5 3f02          	clr	c_lreg+2
1606  05c7 3f01          	clr	c_lreg+1
1607  05c9 3f00          	clr	c_lreg
1608  05cb 96            	ldw	x,sp
1609  05cc 1c0005        	addw	x,#OFST-6
1610  05cf cd0000        	call	c_rtol
1612                     ; 188 										virtual_font = virtual_font<< 8;
1614  05d2 96            	ldw	x,sp
1615  05d3 1c0005        	addw	x,#OFST-6
1616  05d6 a608          	ld	a,#8
1617  05d8 cd0000        	call	c_lglsh
1619                     ; 189 										virtual_font|= (uint32_t)fonts_left[msg_index][15];
1621  05db b602          	ld	a,L12_msg_index
1622  05dd 97            	ld	xl,a
1623  05de a620          	ld	a,#32
1624  05e0 42            	mul	x,a
1625  05e1 d6000f        	ld	a,(_fonts_left+15,x)
1626  05e4 b703          	ld	c_lreg+3,a
1627  05e6 3f02          	clr	c_lreg+2
1628  05e8 3f01          	clr	c_lreg+1
1629  05ea 3f00          	clr	c_lreg
1630  05ec 96            	ldw	x,sp
1631  05ed 1c0005        	addw	x,#OFST-6
1632  05f0 cd0000        	call	c_lgor
1634                     ; 190 										virtual_font = virtual_font<< 8;
1636  05f3 96            	ldw	x,sp
1637  05f4 1c0005        	addw	x,#OFST-6
1638  05f7 a608          	ld	a,#8
1639  05f9 cd0000        	call	c_lglsh
1641                     ; 191 										virtual_font|= (uint32_t)fonts_left[msg_index+ 1][14];
1643  05fc b602          	ld	a,L12_msg_index
1644  05fe 97            	ld	xl,a
1645  05ff a620          	ld	a,#32
1646  0601 42            	mul	x,a
1647  0602 d6002e        	ld	a,(_fonts_left+46,x)
1648  0605 b703          	ld	c_lreg+3,a
1649  0607 3f02          	clr	c_lreg+2
1650  0609 3f01          	clr	c_lreg+1
1651  060b 3f00          	clr	c_lreg
1652  060d 96            	ldw	x,sp
1653  060e 1c0005        	addw	x,#OFST-6
1654  0611 cd0000        	call	c_lgor
1656                     ; 192 										virtual_font = virtual_font<< 8;
1658  0614 96            	ldw	x,sp
1659  0615 1c0005        	addw	x,#OFST-6
1660  0618 a608          	ld	a,#8
1661  061a cd0000        	call	c_lglsh
1663                     ; 193 										virtual_font|= (uint32_t)fonts_left[msg_index+ 1][15];
1665  061d b602          	ld	a,L12_msg_index
1666  061f 97            	ld	xl,a
1667  0620 a620          	ld	a,#32
1668  0622 42            	mul	x,a
1669  0623 d6002f        	ld	a,(_fonts_left+47,x)
1670  0626 b703          	ld	c_lreg+3,a
1671  0628 3f02          	clr	c_lreg+2
1672  062a 3f01          	clr	c_lreg+1
1673  062c 3f00          	clr	c_lreg
1674  062e 96            	ldw	x,sp
1675  062f 1c0005        	addw	x,#OFST-6
1676  0632 cd0000        	call	c_lgor
1678                     ; 194 										if(left_bit<17) {
1680  0635 b614          	ld	a,L32_left_bit
1681  0637 a111          	cp	a,#17
1682  0639 2423          	jruge	L773
1683                     ; 195 												font= (uint16_t)((virtual_font&(0xffff0000>>left_bit))>>(16- left_bit));
1685  063b ae0000        	ldw	x,#0
1686  063e bf02          	ldw	c_lreg+2,x
1687  0640 aeffff        	ldw	x,#-1
1688  0643 bf00          	ldw	c_lreg,x
1689  0645 b614          	ld	a,L32_left_bit
1690  0647 cd0000        	call	c_lursh
1692  064a 96            	ldw	x,sp
1693  064b 1c0005        	addw	x,#OFST-6
1694  064e cd0000        	call	c_land
1696  0651 a610          	ld	a,#16
1697  0653 b014          	sub	a,L32_left_bit
1698  0655 cd0000        	call	c_lursh
1700  0658 be02          	ldw	x,c_lreg+2
1701  065a 1f0a          	ldw	(OFST-1,sp),x
1703  065c 202d          	jra	L104
1704  065e               L773:
1705                     ; 198 												font= (uint16_t)((virtual_font&(0xffff0000>>left_bit))<<(left_bit- 16));
1707  065e 1e07          	ldw	x,(OFST-4,sp)
1708  0660 cd0000        	call	c_uitolx
1710  0663 96            	ldw	x,sp
1711  0664 1c0001        	addw	x,#OFST-10
1712  0667 cd0000        	call	c_rtol
1714  066a ae0000        	ldw	x,#0
1715  066d bf02          	ldw	c_lreg+2,x
1716  066f aeffff        	ldw	x,#-1
1717  0672 bf00          	ldw	c_lreg,x
1718  0674 b614          	ld	a,L32_left_bit
1719  0676 cd0000        	call	c_lursh
1721  0679 96            	ldw	x,sp
1722  067a 1c0001        	addw	x,#OFST-10
1723  067d cd0000        	call	c_land
1725  0680 b614          	ld	a,L32_left_bit
1726  0682 a010          	sub	a,#16
1727  0684 cd0000        	call	c_llsh
1729  0687 be02          	ldw	x,c_lreg+2
1730  0689 1f0a          	ldw	(OFST-1,sp),x
1731  068b               L104:
1732                     ; 200 										SendData(font, UP);
1734  068b 4b10          	push	#16
1735  068d 1e0b          	ldw	x,(OFST+0,sp)
1736  068f cd0b91        	call	L52_SendData
1738  0692 84            	pop	a
1739                     ; 201 										SendData(0, DN);
1741  0693 4b20          	push	#32
1742  0695 5f            	clrw	x
1743  0696 cd0b91        	call	L52_SendData
1745  0699 84            	pop	a
1746                     ; 202 										GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);	
1748  069a b600          	ld	a,L732_row
1749  069c 5f            	clrw	x
1750  069d 97            	ld	xl,a
1751  069e d60000        	ld	a,(L3_RowLck_Pin,x)
1752  06a1 88            	push	a
1753  06a2 b600          	ld	a,L732_row
1754  06a4 5f            	clrw	x
1755  06a5 97            	ld	xl,a
1756  06a6 58            	sllw	x
1757  06a7 ee00          	ldw	x,(L5_RowLck_Gpio,x)
1758  06a9 cd0000        	call	_GPIO_WriteLow
1760  06ac 84            	pop	a
1761  06ad ac5b0b5b      	jpf	L513
1762  06b1               L742:
1763                     ; 205 						case ROLL_FLASH:
1763                     ; 206 								if((0== flash_n)|| (2== flash_n)|| (4== flash_n)) {
1765  06b1 3d05          	tnz	L51_flash_n
1766  06b3 270f          	jreq	L504
1768  06b5 b605          	ld	a,L51_flash_n
1769  06b7 a102          	cp	a,#2
1770  06b9 2709          	jreq	L504
1772  06bb b605          	ld	a,L51_flash_n
1773  06bd a104          	cp	a,#4
1774  06bf 2703          	jreq	L65
1775  06c1 cc0869        	jp	L304
1776  06c4               L65:
1777  06c4               L504:
1778                     ; 207 										font = 0;	
1780  06c4 1e0a          	ldw	x,(OFST-1,sp)
1781                     ; 208 										for(i=0; i<9; i++) {
1783  06c6 0f09          	clr	(OFST-2,sp)
1784  06c8               L114:
1785                     ; 209 												GPIO_WriteHigh(RowLck_Gpio[i], RowLck_Pin[i]);
1787  06c8 7b09          	ld	a,(OFST-2,sp)
1788  06ca 5f            	clrw	x
1789  06cb 97            	ld	xl,a
1790  06cc d60000        	ld	a,(L3_RowLck_Pin,x)
1791  06cf 88            	push	a
1792  06d0 7b0a          	ld	a,(OFST-1,sp)
1793  06d2 5f            	clrw	x
1794  06d3 97            	ld	xl,a
1795  06d4 58            	sllw	x
1796  06d5 ee00          	ldw	x,(L5_RowLck_Gpio,x)
1797  06d7 cd0000        	call	_GPIO_WriteHigh
1799  06da 84            	pop	a
1800                     ; 208 										for(i=0; i<9; i++) {
1802  06db 0c09          	inc	(OFST-2,sp)
1805  06dd 7b09          	ld	a,(OFST-2,sp)
1806  06df a109          	cp	a,#9
1807  06e1 25e5          	jrult	L114
1808                     ; 212 										if(row<= 0) {					
1810  06e3 3d00          	tnz	L732_row
1811  06e5 2663          	jrne	L714
1812                     ; 213 												SendData(0x7ffe, UP);	
1814  06e7 4b10          	push	#16
1815  06e9 ae7ffe        	ldw	x,#32766
1816  06ec cd0b91        	call	L52_SendData
1818  06ef 84            	pop	a
1819                     ; 214 												font = (uint16_t)fonts_flash[floor][row*2+ 16];
1821  06f0 b600          	ld	a,L732_row
1822  06f2 5f            	clrw	x
1823  06f3 97            	ld	xl,a
1824  06f4 58            	sllw	x
1825  06f5 1f03          	ldw	(OFST-8,sp),x
1826  06f7 b606          	ld	a,L11_floor
1827  06f9 97            	ld	xl,a
1828  06fa a620          	ld	a,#32
1829  06fc 42            	mul	x,a
1830  06fd 72fb03        	addw	x,(OFST-8,sp)
1831  0700 d60010        	ld	a,(_fonts_flash+16,x)
1832  0703 5f            	clrw	x
1833  0704 97            	ld	xl,a
1834  0705 1f0a          	ldw	(OFST-1,sp),x
1835                     ; 215 												font = font<< 8;
1837  0707 7b0b          	ld	a,(OFST+0,sp)
1838  0709 6b0a          	ld	(OFST-1,sp),a
1839  070b 0f0b          	clr	(OFST+0,sp)
1840                     ; 216 												font|= (uint16_t)fonts_flash[floor][row*2+ 16+ 1];
1842  070d b600          	ld	a,L732_row
1843  070f 5f            	clrw	x
1844  0710 97            	ld	xl,a
1845  0711 58            	sllw	x
1846  0712 1f03          	ldw	(OFST-8,sp),x
1847  0714 b606          	ld	a,L11_floor
1848  0716 97            	ld	xl,a
1849  0717 a620          	ld	a,#32
1850  0719 42            	mul	x,a
1851  071a 72fb03        	addw	x,(OFST-8,sp)
1852  071d d60011        	ld	a,(_fonts_flash+17,x)
1853  0720 5f            	clrw	x
1854  0721 97            	ld	xl,a
1855  0722 01            	rrwa	x,a
1856  0723 1a0b          	or	a,(OFST+0,sp)
1857  0725 01            	rrwa	x,a
1858  0726 1a0a          	or	a,(OFST-1,sp)
1859  0728 01            	rrwa	x,a
1860  0729 1f0a          	ldw	(OFST-1,sp),x
1861                     ; 217 												SendData(font, DN);				
1863  072b 4b20          	push	#32
1864  072d 1e0b          	ldw	x,(OFST+0,sp)
1865  072f cd0b91        	call	L52_SendData
1867  0732 84            	pop	a
1868                     ; 218 												GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);						
1870  0733 b600          	ld	a,L732_row
1871  0735 5f            	clrw	x
1872  0736 97            	ld	xl,a
1873  0737 d60000        	ld	a,(L3_RowLck_Pin,x)
1874  073a 88            	push	a
1875  073b b600          	ld	a,L732_row
1876  073d 5f            	clrw	x
1877  073e 97            	ld	xl,a
1878  073f 58            	sllw	x
1879  0740 ee00          	ldw	x,(L5_RowLck_Gpio,x)
1880  0742 cd0000        	call	_GPIO_WriteLow
1882  0745 84            	pop	a
1884  0746 ac5b0b5b      	jpf	L513
1885  074a               L714:
1886                     ; 220 										else if((row> 0) && (row< 8)){
1888  074a 3d00          	tnz	L732_row
1889  074c 2603          	jrne	L06
1890  074e cc07fa        	jp	L324
1891  0751               L06:
1893  0751 b600          	ld	a,L732_row
1894  0753 a108          	cp	a,#8
1895  0755 2503          	jrult	L26
1896  0757 cc07fa        	jp	L324
1897  075a               L26:
1898                     ; 221 												font = (uint16_t)fonts_flash[floor][row*2- 2];
1900  075a b600          	ld	a,L732_row
1901  075c 5f            	clrw	x
1902  075d 97            	ld	xl,a
1903  075e 58            	sllw	x
1904  075f 5a            	decw	x
1905  0760 5a            	decw	x
1906  0761 1f03          	ldw	(OFST-8,sp),x
1907  0763 b606          	ld	a,L11_floor
1908  0765 97            	ld	xl,a
1909  0766 a620          	ld	a,#32
1910  0768 42            	mul	x,a
1911  0769 72fb03        	addw	x,(OFST-8,sp)
1912  076c d60000        	ld	a,(_fonts_flash,x)
1913  076f 5f            	clrw	x
1914  0770 97            	ld	xl,a
1915  0771 1f0a          	ldw	(OFST-1,sp),x
1916                     ; 222 												font = font<< 8;
1918  0773 7b0b          	ld	a,(OFST+0,sp)
1919  0775 6b0a          	ld	(OFST-1,sp),a
1920  0777 0f0b          	clr	(OFST+0,sp)
1921                     ; 223 												font|= (uint16_t)fonts_flash[floor][row*2- 1];
1923  0779 b600          	ld	a,L732_row
1924  077b 5f            	clrw	x
1925  077c 97            	ld	xl,a
1926  077d 58            	sllw	x
1927  077e 5a            	decw	x
1928  077f 1f03          	ldw	(OFST-8,sp),x
1929  0781 b606          	ld	a,L11_floor
1930  0783 97            	ld	xl,a
1931  0784 a620          	ld	a,#32
1932  0786 42            	mul	x,a
1933  0787 72fb03        	addw	x,(OFST-8,sp)
1934  078a d60000        	ld	a,(_fonts_flash,x)
1935  078d 5f            	clrw	x
1936  078e 97            	ld	xl,a
1937  078f 01            	rrwa	x,a
1938  0790 1a0b          	or	a,(OFST+0,sp)
1939  0792 01            	rrwa	x,a
1940  0793 1a0a          	or	a,(OFST-1,sp)
1941  0795 01            	rrwa	x,a
1942  0796 1f0a          	ldw	(OFST-1,sp),x
1943                     ; 224 												SendData(font, UP);	
1945  0798 4b10          	push	#16
1946  079a 1e0b          	ldw	x,(OFST+0,sp)
1947  079c cd0b91        	call	L52_SendData
1949  079f 84            	pop	a
1950                     ; 225 												font = (uint16_t)fonts_flash[floor][row*2+ 16];
1952  07a0 b600          	ld	a,L732_row
1953  07a2 5f            	clrw	x
1954  07a3 97            	ld	xl,a
1955  07a4 58            	sllw	x
1956  07a5 1f03          	ldw	(OFST-8,sp),x
1957  07a7 b606          	ld	a,L11_floor
1958  07a9 97            	ld	xl,a
1959  07aa a620          	ld	a,#32
1960  07ac 42            	mul	x,a
1961  07ad 72fb03        	addw	x,(OFST-8,sp)
1962  07b0 d60010        	ld	a,(_fonts_flash+16,x)
1963  07b3 5f            	clrw	x
1964  07b4 97            	ld	xl,a
1965  07b5 1f0a          	ldw	(OFST-1,sp),x
1966                     ; 226 												font = font<< 8;
1968  07b7 7b0b          	ld	a,(OFST+0,sp)
1969  07b9 6b0a          	ld	(OFST-1,sp),a
1970  07bb 0f0b          	clr	(OFST+0,sp)
1971                     ; 227 												font|= (uint16_t)fonts_flash[floor][row*2+ 1+ 16];
1973  07bd b600          	ld	a,L732_row
1974  07bf 5f            	clrw	x
1975  07c0 97            	ld	xl,a
1976  07c1 58            	sllw	x
1977  07c2 1f03          	ldw	(OFST-8,sp),x
1978  07c4 b606          	ld	a,L11_floor
1979  07c6 97            	ld	xl,a
1980  07c7 a620          	ld	a,#32
1981  07c9 42            	mul	x,a
1982  07ca 72fb03        	addw	x,(OFST-8,sp)
1983  07cd d60011        	ld	a,(_fonts_flash+17,x)
1984  07d0 5f            	clrw	x
1985  07d1 97            	ld	xl,a
1986  07d2 01            	rrwa	x,a
1987  07d3 1a0b          	or	a,(OFST+0,sp)
1988  07d5 01            	rrwa	x,a
1989  07d6 1a0a          	or	a,(OFST-1,sp)
1990  07d8 01            	rrwa	x,a
1991  07d9 1f0a          	ldw	(OFST-1,sp),x
1992                     ; 228 												SendData(font, DN);
1994  07db 4b20          	push	#32
1995  07dd 1e0b          	ldw	x,(OFST+0,sp)
1996  07df cd0b91        	call	L52_SendData
1998  07e2 84            	pop	a
1999                     ; 229 												GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);
2001  07e3 b600          	ld	a,L732_row
2002  07e5 5f            	clrw	x
2003  07e6 97            	ld	xl,a
2004  07e7 d60000        	ld	a,(L3_RowLck_Pin,x)
2005  07ea 88            	push	a
2006  07eb b600          	ld	a,L732_row
2007  07ed 5f            	clrw	x
2008  07ee 97            	ld	xl,a
2009  07ef 58            	sllw	x
2010  07f0 ee00          	ldw	x,(L5_RowLck_Gpio,x)
2011  07f2 cd0000        	call	_GPIO_WriteLow
2013  07f5 84            	pop	a
2015  07f6 ac5b0b5b      	jpf	L513
2016  07fa               L324:
2017                     ; 231 										else if(row>= 8){
2019  07fa b600          	ld	a,L732_row
2020  07fc a108          	cp	a,#8
2021  07fe 2403          	jruge	L46
2022  0800 cc0b5b        	jp	L513
2023  0803               L46:
2024                     ; 232 												font = (uint16_t)fonts_flash[floor][row*2- 2];
2026  0803 b600          	ld	a,L732_row
2027  0805 5f            	clrw	x
2028  0806 97            	ld	xl,a
2029  0807 58            	sllw	x
2030  0808 5a            	decw	x
2031  0809 5a            	decw	x
2032  080a 1f03          	ldw	(OFST-8,sp),x
2033  080c b606          	ld	a,L11_floor
2034  080e 97            	ld	xl,a
2035  080f a620          	ld	a,#32
2036  0811 42            	mul	x,a
2037  0812 72fb03        	addw	x,(OFST-8,sp)
2038  0815 d60000        	ld	a,(_fonts_flash,x)
2039  0818 5f            	clrw	x
2040  0819 97            	ld	xl,a
2041  081a 1f0a          	ldw	(OFST-1,sp),x
2042                     ; 233 												font = font<< 8;
2044  081c 7b0b          	ld	a,(OFST+0,sp)
2045  081e 6b0a          	ld	(OFST-1,sp),a
2046  0820 0f0b          	clr	(OFST+0,sp)
2047                     ; 234 												font|= (uint16_t)fonts_flash[floor][row*2- 1];
2049  0822 b600          	ld	a,L732_row
2050  0824 5f            	clrw	x
2051  0825 97            	ld	xl,a
2052  0826 58            	sllw	x
2053  0827 5a            	decw	x
2054  0828 1f03          	ldw	(OFST-8,sp),x
2055  082a b606          	ld	a,L11_floor
2056  082c 97            	ld	xl,a
2057  082d a620          	ld	a,#32
2058  082f 42            	mul	x,a
2059  0830 72fb03        	addw	x,(OFST-8,sp)
2060  0833 d60000        	ld	a,(_fonts_flash,x)
2061  0836 5f            	clrw	x
2062  0837 97            	ld	xl,a
2063  0838 01            	rrwa	x,a
2064  0839 1a0b          	or	a,(OFST+0,sp)
2065  083b 01            	rrwa	x,a
2066  083c 1a0a          	or	a,(OFST-1,sp)
2067  083e 01            	rrwa	x,a
2068  083f 1f0a          	ldw	(OFST-1,sp),x
2069                     ; 235 												SendData(font, UP);
2071  0841 4b10          	push	#16
2072  0843 1e0b          	ldw	x,(OFST+0,sp)
2073  0845 cd0b91        	call	L52_SendData
2075  0848 84            	pop	a
2076                     ; 236 												SendData(0x7ffe, DN);
2078  0849 4b20          	push	#32
2079  084b ae7ffe        	ldw	x,#32766
2080  084e cd0b91        	call	L52_SendData
2082  0851 84            	pop	a
2083                     ; 237 												GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);	
2085  0852 b600          	ld	a,L732_row
2086  0854 5f            	clrw	x
2087  0855 97            	ld	xl,a
2088  0856 d60000        	ld	a,(L3_RowLck_Pin,x)
2089  0859 88            	push	a
2090  085a b600          	ld	a,L732_row
2091  085c 5f            	clrw	x
2092  085d 97            	ld	xl,a
2093  085e 58            	sllw	x
2094  085f ee00          	ldw	x,(L5_RowLck_Gpio,x)
2095  0861 cd0000        	call	_GPIO_WriteLow
2097  0864 84            	pop	a
2098  0865 ac5b0b5b      	jpf	L513
2099  0869               L304:
2100                     ; 240 								else if((1== flash_n)|| (3== flash_n)|| (5== flash_n)){
2102  0869 b605          	ld	a,L51_flash_n
2103  086b a101          	cp	a,#1
2104  086d 270f          	jreq	L534
2106  086f b605          	ld	a,L51_flash_n
2107  0871 a103          	cp	a,#3
2108  0873 2709          	jreq	L534
2110  0875 b605          	ld	a,L51_flash_n
2111  0877 a105          	cp	a,#5
2112  0879 2703          	jreq	L66
2113  087b cc0b5b        	jp	L513
2114  087e               L66:
2115  087e               L534:
2116                     ; 241 										font = 0;	
2118  087e 1e0a          	ldw	x,(OFST-1,sp)
2119                     ; 242 										for(i=0; i<9; i++) {
2121  0880 0f09          	clr	(OFST-2,sp)
2122  0882               L144:
2123                     ; 243 												GPIO_WriteHigh(RowLck_Gpio[i], RowLck_Pin[i]);
2125  0882 7b09          	ld	a,(OFST-2,sp)
2126  0884 5f            	clrw	x
2127  0885 97            	ld	xl,a
2128  0886 d60000        	ld	a,(L3_RowLck_Pin,x)
2129  0889 88            	push	a
2130  088a 7b0a          	ld	a,(OFST-1,sp)
2131  088c 5f            	clrw	x
2132  088d 97            	ld	xl,a
2133  088e 58            	sllw	x
2134  088f ee00          	ldw	x,(L5_RowLck_Gpio,x)
2135  0891 cd0000        	call	_GPIO_WriteHigh
2137  0894 84            	pop	a
2138                     ; 242 										for(i=0; i<9; i++) {
2140  0895 0c09          	inc	(OFST-2,sp)
2143  0897 7b09          	ld	a,(OFST-2,sp)
2144  0899 a109          	cp	a,#9
2145  089b 25e5          	jrult	L144
2146                     ; 246 										if(row<= 0) {					
2148  089d 3d00          	tnz	L732_row
2149  089f 2661          	jrne	L744
2150                     ; 247 												SendData(0, UP);	
2152  08a1 4b10          	push	#16
2153  08a3 5f            	clrw	x
2154  08a4 cd0b91        	call	L52_SendData
2156  08a7 84            	pop	a
2157                     ; 248 												font = (uint16_t)fonts[floor][row*2+ 16];
2159  08a8 b600          	ld	a,L732_row
2160  08aa 5f            	clrw	x
2161  08ab 97            	ld	xl,a
2162  08ac 58            	sllw	x
2163  08ad 1f03          	ldw	(OFST-8,sp),x
2164  08af b606          	ld	a,L11_floor
2165  08b1 97            	ld	xl,a
2166  08b2 a620          	ld	a,#32
2167  08b4 42            	mul	x,a
2168  08b5 72fb03        	addw	x,(OFST-8,sp)
2169  08b8 d60010        	ld	a,(_fonts+16,x)
2170  08bb 5f            	clrw	x
2171  08bc 97            	ld	xl,a
2172  08bd 1f0a          	ldw	(OFST-1,sp),x
2173                     ; 249 												font = font<< 8;
2175  08bf 7b0b          	ld	a,(OFST+0,sp)
2176  08c1 6b0a          	ld	(OFST-1,sp),a
2177  08c3 0f0b          	clr	(OFST+0,sp)
2178                     ; 250 												font|= (uint16_t)fonts[floor][row*2+ 16+ 1];
2180  08c5 b600          	ld	a,L732_row
2181  08c7 5f            	clrw	x
2182  08c8 97            	ld	xl,a
2183  08c9 58            	sllw	x
2184  08ca 1f03          	ldw	(OFST-8,sp),x
2185  08cc b606          	ld	a,L11_floor
2186  08ce 97            	ld	xl,a
2187  08cf a620          	ld	a,#32
2188  08d1 42            	mul	x,a
2189  08d2 72fb03        	addw	x,(OFST-8,sp)
2190  08d5 d60011        	ld	a,(_fonts+17,x)
2191  08d8 5f            	clrw	x
2192  08d9 97            	ld	xl,a
2193  08da 01            	rrwa	x,a
2194  08db 1a0b          	or	a,(OFST+0,sp)
2195  08dd 01            	rrwa	x,a
2196  08de 1a0a          	or	a,(OFST-1,sp)
2197  08e0 01            	rrwa	x,a
2198  08e1 1f0a          	ldw	(OFST-1,sp),x
2199                     ; 251 												SendData(font, DN);				
2201  08e3 4b20          	push	#32
2202  08e5 1e0b          	ldw	x,(OFST+0,sp)
2203  08e7 cd0b91        	call	L52_SendData
2205  08ea 84            	pop	a
2206                     ; 252 												GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);						
2208  08eb b600          	ld	a,L732_row
2209  08ed 5f            	clrw	x
2210  08ee 97            	ld	xl,a
2211  08ef d60000        	ld	a,(L3_RowLck_Pin,x)
2212  08f2 88            	push	a
2213  08f3 b600          	ld	a,L732_row
2214  08f5 5f            	clrw	x
2215  08f6 97            	ld	xl,a
2216  08f7 58            	sllw	x
2217  08f8 ee00          	ldw	x,(L5_RowLck_Gpio,x)
2218  08fa cd0000        	call	_GPIO_WriteLow
2220  08fd 84            	pop	a
2222  08fe ac5b0b5b      	jpf	L513
2223  0902               L744:
2224                     ; 254 										else if((row> 0) && (row< 8)){
2226  0902 3d00          	tnz	L732_row
2227  0904 2603          	jrne	L07
2228  0906 cc09b2        	jp	L354
2229  0909               L07:
2231  0909 b600          	ld	a,L732_row
2232  090b a108          	cp	a,#8
2233  090d 2503          	jrult	L27
2234  090f cc09b2        	jp	L354
2235  0912               L27:
2236                     ; 255 												font = (uint16_t)fonts[floor][row*2- 2];
2238  0912 b600          	ld	a,L732_row
2239  0914 5f            	clrw	x
2240  0915 97            	ld	xl,a
2241  0916 58            	sllw	x
2242  0917 5a            	decw	x
2243  0918 5a            	decw	x
2244  0919 1f03          	ldw	(OFST-8,sp),x
2245  091b b606          	ld	a,L11_floor
2246  091d 97            	ld	xl,a
2247  091e a620          	ld	a,#32
2248  0920 42            	mul	x,a
2249  0921 72fb03        	addw	x,(OFST-8,sp)
2250  0924 d60000        	ld	a,(_fonts,x)
2251  0927 5f            	clrw	x
2252  0928 97            	ld	xl,a
2253  0929 1f0a          	ldw	(OFST-1,sp),x
2254                     ; 256 												font = font<< 8;
2256  092b 7b0b          	ld	a,(OFST+0,sp)
2257  092d 6b0a          	ld	(OFST-1,sp),a
2258  092f 0f0b          	clr	(OFST+0,sp)
2259                     ; 257 												font|= (uint16_t)fonts[floor][row*2- 1];
2261  0931 b600          	ld	a,L732_row
2262  0933 5f            	clrw	x
2263  0934 97            	ld	xl,a
2264  0935 58            	sllw	x
2265  0936 5a            	decw	x
2266  0937 1f03          	ldw	(OFST-8,sp),x
2267  0939 b606          	ld	a,L11_floor
2268  093b 97            	ld	xl,a
2269  093c a620          	ld	a,#32
2270  093e 42            	mul	x,a
2271  093f 72fb03        	addw	x,(OFST-8,sp)
2272  0942 d60000        	ld	a,(_fonts,x)
2273  0945 5f            	clrw	x
2274  0946 97            	ld	xl,a
2275  0947 01            	rrwa	x,a
2276  0948 1a0b          	or	a,(OFST+0,sp)
2277  094a 01            	rrwa	x,a
2278  094b 1a0a          	or	a,(OFST-1,sp)
2279  094d 01            	rrwa	x,a
2280  094e 1f0a          	ldw	(OFST-1,sp),x
2281                     ; 258 												SendData(font, UP);	
2283  0950 4b10          	push	#16
2284  0952 1e0b          	ldw	x,(OFST+0,sp)
2285  0954 cd0b91        	call	L52_SendData
2287  0957 84            	pop	a
2288                     ; 259 												font = (uint16_t)fonts[floor][row*2+ 16];
2290  0958 b600          	ld	a,L732_row
2291  095a 5f            	clrw	x
2292  095b 97            	ld	xl,a
2293  095c 58            	sllw	x
2294  095d 1f03          	ldw	(OFST-8,sp),x
2295  095f b606          	ld	a,L11_floor
2296  0961 97            	ld	xl,a
2297  0962 a620          	ld	a,#32
2298  0964 42            	mul	x,a
2299  0965 72fb03        	addw	x,(OFST-8,sp)
2300  0968 d60010        	ld	a,(_fonts+16,x)
2301  096b 5f            	clrw	x
2302  096c 97            	ld	xl,a
2303  096d 1f0a          	ldw	(OFST-1,sp),x
2304                     ; 260 												font = font<< 8;
2306  096f 7b0b          	ld	a,(OFST+0,sp)
2307  0971 6b0a          	ld	(OFST-1,sp),a
2308  0973 0f0b          	clr	(OFST+0,sp)
2309                     ; 261 												font|= (uint16_t)fonts[floor][row*2+ 1+ 16];
2311  0975 b600          	ld	a,L732_row
2312  0977 5f            	clrw	x
2313  0978 97            	ld	xl,a
2314  0979 58            	sllw	x
2315  097a 1f03          	ldw	(OFST-8,sp),x
2316  097c b606          	ld	a,L11_floor
2317  097e 97            	ld	xl,a
2318  097f a620          	ld	a,#32
2319  0981 42            	mul	x,a
2320  0982 72fb03        	addw	x,(OFST-8,sp)
2321  0985 d60011        	ld	a,(_fonts+17,x)
2322  0988 5f            	clrw	x
2323  0989 97            	ld	xl,a
2324  098a 01            	rrwa	x,a
2325  098b 1a0b          	or	a,(OFST+0,sp)
2326  098d 01            	rrwa	x,a
2327  098e 1a0a          	or	a,(OFST-1,sp)
2328  0990 01            	rrwa	x,a
2329  0991 1f0a          	ldw	(OFST-1,sp),x
2330                     ; 262 												SendData(font, DN);
2332  0993 4b20          	push	#32
2333  0995 1e0b          	ldw	x,(OFST+0,sp)
2334  0997 cd0b91        	call	L52_SendData
2336  099a 84            	pop	a
2337                     ; 263 												GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);
2339  099b b600          	ld	a,L732_row
2340  099d 5f            	clrw	x
2341  099e 97            	ld	xl,a
2342  099f d60000        	ld	a,(L3_RowLck_Pin,x)
2343  09a2 88            	push	a
2344  09a3 b600          	ld	a,L732_row
2345  09a5 5f            	clrw	x
2346  09a6 97            	ld	xl,a
2347  09a7 58            	sllw	x
2348  09a8 ee00          	ldw	x,(L5_RowLck_Gpio,x)
2349  09aa cd0000        	call	_GPIO_WriteLow
2351  09ad 84            	pop	a
2353  09ae ac5b0b5b      	jpf	L513
2354  09b2               L354:
2355                     ; 265 										else if(row>= 8){
2357  09b2 b600          	ld	a,L732_row
2358  09b4 a108          	cp	a,#8
2359  09b6 2403          	jruge	L47
2360  09b8 cc0b5b        	jp	L513
2361  09bb               L47:
2362                     ; 266 												font = (uint16_t)fonts[floor][row*2- 2];
2364  09bb b600          	ld	a,L732_row
2365  09bd 5f            	clrw	x
2366  09be 97            	ld	xl,a
2367  09bf 58            	sllw	x
2368  09c0 5a            	decw	x
2369  09c1 5a            	decw	x
2370  09c2 1f03          	ldw	(OFST-8,sp),x
2371  09c4 b606          	ld	a,L11_floor
2372  09c6 97            	ld	xl,a
2373  09c7 a620          	ld	a,#32
2374  09c9 42            	mul	x,a
2375  09ca 72fb03        	addw	x,(OFST-8,sp)
2376  09cd d60000        	ld	a,(_fonts,x)
2377  09d0 5f            	clrw	x
2378  09d1 97            	ld	xl,a
2379  09d2 1f0a          	ldw	(OFST-1,sp),x
2380                     ; 267 												font = font<< 8;
2382  09d4 7b0b          	ld	a,(OFST+0,sp)
2383  09d6 6b0a          	ld	(OFST-1,sp),a
2384  09d8 0f0b          	clr	(OFST+0,sp)
2385                     ; 268 												font|= (uint16_t)fonts[floor][row*2- 1];
2387  09da b600          	ld	a,L732_row
2388  09dc 5f            	clrw	x
2389  09dd 97            	ld	xl,a
2390  09de 58            	sllw	x
2391  09df 5a            	decw	x
2392  09e0 1f03          	ldw	(OFST-8,sp),x
2393  09e2 b606          	ld	a,L11_floor
2394  09e4 97            	ld	xl,a
2395  09e5 a620          	ld	a,#32
2396  09e7 42            	mul	x,a
2397  09e8 72fb03        	addw	x,(OFST-8,sp)
2398  09eb d60000        	ld	a,(_fonts,x)
2399  09ee 5f            	clrw	x
2400  09ef 97            	ld	xl,a
2401  09f0 01            	rrwa	x,a
2402  09f1 1a0b          	or	a,(OFST+0,sp)
2403  09f3 01            	rrwa	x,a
2404  09f4 1a0a          	or	a,(OFST-1,sp)
2405  09f6 01            	rrwa	x,a
2406  09f7 1f0a          	ldw	(OFST-1,sp),x
2407                     ; 269 												SendData(font, UP);
2409  09f9 4b10          	push	#16
2410  09fb 1e0b          	ldw	x,(OFST+0,sp)
2411  09fd cd0b91        	call	L52_SendData
2413  0a00 84            	pop	a
2414                     ; 270 												SendData(0, DN);
2416  0a01 4b20          	push	#32
2417  0a03 5f            	clrw	x
2418  0a04 cd0b91        	call	L52_SendData
2420  0a07 84            	pop	a
2421                     ; 271 												GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);	
2423  0a08 b600          	ld	a,L732_row
2424  0a0a 5f            	clrw	x
2425  0a0b 97            	ld	xl,a
2426  0a0c d60000        	ld	a,(L3_RowLck_Pin,x)
2427  0a0f 88            	push	a
2428  0a10 b600          	ld	a,L732_row
2429  0a12 5f            	clrw	x
2430  0a13 97            	ld	xl,a
2431  0a14 58            	sllw	x
2432  0a15 ee00          	ldw	x,(L5_RowLck_Gpio,x)
2433  0a17 cd0000        	call	_GPIO_WriteLow
2435  0a1a 84            	pop	a
2436  0a1b ac5b0b5b      	jpf	L513
2437  0a1f               L152:
2438                     ; 275 						case ROLL_UP:
2438                     ; 276 								// 取字模
2438                     ; 277 								font = 0;	
2440  0a1f 1e0a          	ldw	x,(OFST-1,sp)
2441                     ; 279 								for(i=0; i<9; i++) {
2443  0a21 0f09          	clr	(OFST-2,sp)
2444  0a23               L164:
2445                     ; 280 										GPIO_WriteHigh(RowLck_Gpio[i], RowLck_Pin[i]);
2447  0a23 7b09          	ld	a,(OFST-2,sp)
2448  0a25 5f            	clrw	x
2449  0a26 97            	ld	xl,a
2450  0a27 d60000        	ld	a,(L3_RowLck_Pin,x)
2451  0a2a 88            	push	a
2452  0a2b 7b0a          	ld	a,(OFST-1,sp)
2453  0a2d 5f            	clrw	x
2454  0a2e 97            	ld	xl,a
2455  0a2f 58            	sllw	x
2456  0a30 ee00          	ldw	x,(L5_RowLck_Gpio,x)
2457  0a32 cd0000        	call	_GPIO_WriteHigh
2459  0a35 84            	pop	a
2460                     ; 279 								for(i=0; i<9; i++) {
2462  0a36 0c09          	inc	(OFST-2,sp)
2465  0a38 7b09          	ld	a,(OFST-2,sp)
2466  0a3a a109          	cp	a,#9
2467  0a3c 25e5          	jrult	L164
2468                     ; 283 								if(row<= 0) {					
2470  0a3e 3d00          	tnz	L732_row
2471  0a40 2645          	jrne	L764
2472                     ; 284 										SendData(0, UP);	
2474  0a42 4b10          	push	#16
2475  0a44 5f            	clrw	x
2476  0a45 cd0b91        	call	L52_SendData
2478  0a48 84            	pop	a
2479                     ; 285 										font = (uint16_t)fonts_up[act_row+ 16];
2481  0a49 be03          	ldw	x,L71_act_row
2482  0a4b d60010        	ld	a,(_fonts_up+16,x)
2483  0a4e 5f            	clrw	x
2484  0a4f 97            	ld	xl,a
2485  0a50 1f0a          	ldw	(OFST-1,sp),x
2486                     ; 286 										font = font<< 8;
2488  0a52 7b0b          	ld	a,(OFST+0,sp)
2489  0a54 6b0a          	ld	(OFST-1,sp),a
2490  0a56 0f0b          	clr	(OFST+0,sp)
2491                     ; 287 										font|= (uint16_t)fonts_up[act_row+ 17];
2493  0a58 be03          	ldw	x,L71_act_row
2494  0a5a d60011        	ld	a,(_fonts_up+17,x)
2495  0a5d 5f            	clrw	x
2496  0a5e 97            	ld	xl,a
2497  0a5f 01            	rrwa	x,a
2498  0a60 1a0b          	or	a,(OFST+0,sp)
2499  0a62 01            	rrwa	x,a
2500  0a63 1a0a          	or	a,(OFST-1,sp)
2501  0a65 01            	rrwa	x,a
2502  0a66 1f0a          	ldw	(OFST-1,sp),x
2503                     ; 288 										SendData(font, DN);				
2505  0a68 4b20          	push	#32
2506  0a6a 1e0b          	ldw	x,(OFST+0,sp)
2507  0a6c cd0b91        	call	L52_SendData
2509  0a6f 84            	pop	a
2510                     ; 289 										GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);						
2512  0a70 b600          	ld	a,L732_row
2513  0a72 5f            	clrw	x
2514  0a73 97            	ld	xl,a
2515  0a74 d60000        	ld	a,(L3_RowLck_Pin,x)
2516  0a77 88            	push	a
2517  0a78 b600          	ld	a,L732_row
2518  0a7a 5f            	clrw	x
2519  0a7b 97            	ld	xl,a
2520  0a7c 58            	sllw	x
2521  0a7d ee00          	ldw	x,(L5_RowLck_Gpio,x)
2522  0a7f cd0000        	call	_GPIO_WriteLow
2524  0a82 84            	pop	a
2526  0a83 ac5b0b5b      	jpf	L513
2527  0a87               L764:
2528                     ; 291 								else if((row> 0) && (row< 8)){
2530  0a87 3d00          	tnz	L732_row
2531  0a89 2603cc0b16    	jreq	L374
2533  0a8e b600          	ld	a,L732_row
2534  0a90 a108          	cp	a,#8
2535  0a92 24f7          	jruge	L374
2536                     ; 292 										font = (uint16_t)fonts_up[act_row+ row*2- 2];
2538  0a94 b600          	ld	a,L732_row
2539  0a96 5f            	clrw	x
2540  0a97 97            	ld	xl,a
2541  0a98 58            	sllw	x
2542  0a99 72bb0003      	addw	x,L71_act_row
2543  0a9d 5a            	decw	x
2544  0a9e 5a            	decw	x
2545  0a9f d60000        	ld	a,(_fonts_up,x)
2546  0aa2 5f            	clrw	x
2547  0aa3 97            	ld	xl,a
2548  0aa4 1f0a          	ldw	(OFST-1,sp),x
2549                     ; 293 										font = font<< 8;
2551  0aa6 7b0b          	ld	a,(OFST+0,sp)
2552  0aa8 6b0a          	ld	(OFST-1,sp),a
2553  0aaa 0f0b          	clr	(OFST+0,sp)
2554                     ; 294 										font|= (uint16_t)fonts_up[act_row+ row*2- 1];
2556  0aac b600          	ld	a,L732_row
2557  0aae 5f            	clrw	x
2558  0aaf 97            	ld	xl,a
2559  0ab0 58            	sllw	x
2560  0ab1 72bb0003      	addw	x,L71_act_row
2561  0ab5 5a            	decw	x
2562  0ab6 d60000        	ld	a,(_fonts_up,x)
2563  0ab9 5f            	clrw	x
2564  0aba 97            	ld	xl,a
2565  0abb 01            	rrwa	x,a
2566  0abc 1a0b          	or	a,(OFST+0,sp)
2567  0abe 01            	rrwa	x,a
2568  0abf 1a0a          	or	a,(OFST-1,sp)
2569  0ac1 01            	rrwa	x,a
2570  0ac2 1f0a          	ldw	(OFST-1,sp),x
2571                     ; 295 										SendData(font, UP);	
2573  0ac4 4b10          	push	#16
2574  0ac6 1e0b          	ldw	x,(OFST+0,sp)
2575  0ac8 cd0b91        	call	L52_SendData
2577  0acb 84            	pop	a
2578                     ; 296 										font = (uint16_t)fonts_up[act_row+ row*2+ 16];
2580  0acc b600          	ld	a,L732_row
2581  0ace 5f            	clrw	x
2582  0acf 97            	ld	xl,a
2583  0ad0 58            	sllw	x
2584  0ad1 72bb0003      	addw	x,L71_act_row
2585  0ad5 d60010        	ld	a,(_fonts_up+16,x)
2586  0ad8 5f            	clrw	x
2587  0ad9 97            	ld	xl,a
2588  0ada 1f0a          	ldw	(OFST-1,sp),x
2589                     ; 297 										font = font<< 8;
2591  0adc 7b0b          	ld	a,(OFST+0,sp)
2592  0ade 6b0a          	ld	(OFST-1,sp),a
2593  0ae0 0f0b          	clr	(OFST+0,sp)
2594                     ; 298 										font|= (uint16_t)fonts_up[act_row+ row*2+ 17];
2596  0ae2 b600          	ld	a,L732_row
2597  0ae4 5f            	clrw	x
2598  0ae5 97            	ld	xl,a
2599  0ae6 58            	sllw	x
2600  0ae7 72bb0003      	addw	x,L71_act_row
2601  0aeb d60011        	ld	a,(_fonts_up+17,x)
2602  0aee 5f            	clrw	x
2603  0aef 97            	ld	xl,a
2604  0af0 01            	rrwa	x,a
2605  0af1 1a0b          	or	a,(OFST+0,sp)
2606  0af3 01            	rrwa	x,a
2607  0af4 1a0a          	or	a,(OFST-1,sp)
2608  0af6 01            	rrwa	x,a
2609  0af7 1f0a          	ldw	(OFST-1,sp),x
2610                     ; 299 										SendData(font, DN);
2612  0af9 4b20          	push	#32
2613  0afb 1e0b          	ldw	x,(OFST+0,sp)
2614  0afd cd0b91        	call	L52_SendData
2616  0b00 84            	pop	a
2617                     ; 300 										GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);
2619  0b01 b600          	ld	a,L732_row
2620  0b03 5f            	clrw	x
2621  0b04 97            	ld	xl,a
2622  0b05 d60000        	ld	a,(L3_RowLck_Pin,x)
2623  0b08 88            	push	a
2624  0b09 b600          	ld	a,L732_row
2625  0b0b 5f            	clrw	x
2626  0b0c 97            	ld	xl,a
2627  0b0d 58            	sllw	x
2628  0b0e ee00          	ldw	x,(L5_RowLck_Gpio,x)
2629  0b10 cd0000        	call	_GPIO_WriteLow
2631  0b13 84            	pop	a
2633  0b14 2045          	jra	L513
2634  0b16               L374:
2635                     ; 302 								else if(row>= 8){
2637  0b16 b600          	ld	a,L732_row
2638  0b18 a108          	cp	a,#8
2639  0b1a 253f          	jrult	L513
2640                     ; 303 										font = (uint16_t)fonts_up[act_row+ 14];
2642  0b1c be03          	ldw	x,L71_act_row
2643  0b1e d6000e        	ld	a,(_fonts_up+14,x)
2644  0b21 5f            	clrw	x
2645  0b22 97            	ld	xl,a
2646  0b23 1f0a          	ldw	(OFST-1,sp),x
2647                     ; 304 										font = font<< 8;
2649  0b25 7b0b          	ld	a,(OFST+0,sp)
2650  0b27 6b0a          	ld	(OFST-1,sp),a
2651  0b29 0f0b          	clr	(OFST+0,sp)
2652                     ; 305 										font|= (uint16_t)fonts_up[act_row+ 15];
2654  0b2b be03          	ldw	x,L71_act_row
2655  0b2d d6000f        	ld	a,(_fonts_up+15,x)
2656  0b30 5f            	clrw	x
2657  0b31 97            	ld	xl,a
2658  0b32 01            	rrwa	x,a
2659  0b33 1a0b          	or	a,(OFST+0,sp)
2660  0b35 01            	rrwa	x,a
2661  0b36 1a0a          	or	a,(OFST-1,sp)
2662  0b38 01            	rrwa	x,a
2663  0b39 1f0a          	ldw	(OFST-1,sp),x
2664                     ; 306 										SendData(font, UP);
2666  0b3b 4b10          	push	#16
2667  0b3d 1e0b          	ldw	x,(OFST+0,sp)
2668  0b3f ad50          	call	L52_SendData
2670  0b41 84            	pop	a
2671                     ; 307 										SendData(0, DN);
2673  0b42 4b20          	push	#32
2674  0b44 5f            	clrw	x
2675  0b45 ad4a          	call	L52_SendData
2677  0b47 84            	pop	a
2678                     ; 308 										GPIO_WriteLow(RowLck_Gpio[row], RowLck_Pin[row]);	
2680  0b48 b600          	ld	a,L732_row
2681  0b4a 5f            	clrw	x
2682  0b4b 97            	ld	xl,a
2683  0b4c d60000        	ld	a,(L3_RowLck_Pin,x)
2684  0b4f 88            	push	a
2685  0b50 b600          	ld	a,L732_row
2686  0b52 5f            	clrw	x
2687  0b53 97            	ld	xl,a
2688  0b54 58            	sllw	x
2689  0b55 ee00          	ldw	x,(L5_RowLck_Gpio,x)
2690  0b57 cd0000        	call	_GPIO_WriteLow
2692  0b5a 84            	pop	a
2693  0b5b               L352:
2694                     ; 311 						default:
2694                     ; 312 								break;
2696  0b5b               L123:
2697  0b5b               L513:
2698                     ; 316     if(scan_n > Brightness) {  //控制亮度 大于亮度值就熄灭  以保持亮度  实际上是 显示次数用来控制显示亮度
2700  0b5b b601          	ld	a,L142_scan_n
2701  0b5d b112          	cp	a,L7_Brightness
2702  0b5f 231d          	jrule	L105
2703                     ; 318 				for(i=0; i<9; i++) {
2705  0b61 0f09          	clr	(OFST-2,sp)
2706  0b63               L305:
2707                     ; 319 					GPIO_WriteHigh(RowLck_Gpio[i], RowLck_Pin[i]);
2709  0b63 7b09          	ld	a,(OFST-2,sp)
2710  0b65 5f            	clrw	x
2711  0b66 97            	ld	xl,a
2712  0b67 d60000        	ld	a,(L3_RowLck_Pin,x)
2713  0b6a 88            	push	a
2714  0b6b 7b0a          	ld	a,(OFST-1,sp)
2715  0b6d 5f            	clrw	x
2716  0b6e 97            	ld	xl,a
2717  0b6f 58            	sllw	x
2718  0b70 ee00          	ldw	x,(L5_RowLck_Gpio,x)
2719  0b72 cd0000        	call	_GPIO_WriteHigh
2721  0b75 84            	pop	a
2722                     ; 318 				for(i=0; i<9; i++) {
2724  0b76 0c09          	inc	(OFST-2,sp)
2727  0b78 7b09          	ld	a,(OFST-2,sp)
2728  0b7a a109          	cp	a,#9
2729  0b7c 25e5          	jrult	L305
2730  0b7e               L105:
2731                     ; 323     if(scan_n >= 10) {
2733  0b7e b601          	ld	a,L142_scan_n
2734  0b80 a10a          	cp	a,#10
2735  0b82 2508          	jrult	L115
2736                     ; 324         scan_n = 0;
2738  0b84 3f01          	clr	L142_scan_n
2739                     ; 325 				flash_n++;
2741  0b86 3c05          	inc	L51_flash_n
2742                     ; 326         row++;          // 下一行
2744  0b88 3c00          	inc	L732_row
2746  0b8a 2002          	jra	L315
2747  0b8c               L115:
2748                     ; 329         scan_n++;
2750  0b8c 3c01          	inc	L142_scan_n
2751  0b8e               L315:
2752                     ; 331 } 
2755  0b8e 5b0b          	addw	sp,#11
2756  0b90 81            	ret
2894                     ; 334 static void SendData(uint16_t value, GPIO_Pin_TypeDef data_place) {
2895                     	switch	.text
2896  0b91               L52_SendData:
2898  0b91 89            	pushw	x
2899  0b92 88            	push	a
2900       00000001      OFST:	set	1
2903                     ; 337 		GPIO_WriteLow(GPIOC, data_place);
2905  0b93 7b06          	ld	a,(OFST+5,sp)
2906  0b95 88            	push	a
2907  0b96 ae500a        	ldw	x,#20490
2908  0b99 cd0000        	call	_GPIO_WriteLow
2910  0b9c 84            	pop	a
2911                     ; 338 		GPIO_WriteLow(GPIOC, PIN_CLK);
2913  0b9d 4b40          	push	#64
2914  0b9f ae500a        	ldw	x,#20490
2915  0ba2 cd0000        	call	_GPIO_WriteLow
2917  0ba5 84            	pop	a
2918                     ; 339 		for(i=0; i<16; i++) {
2920  0ba6 0f01          	clr	(OFST+0,sp)
2921  0ba8               L575:
2922                     ; 340 				if(UP== data_place) {	
2924  0ba8 7b06          	ld	a,(OFST+5,sp)
2925  0baa a110          	cp	a,#16
2926  0bac 2632          	jrne	L306
2927                     ; 341 						if(value & 0x0001) {
2929  0bae 7b03          	ld	a,(OFST+2,sp)
2930  0bb0 a501          	bcp	a,#1
2931  0bb2 270b          	jreq	L506
2932                     ; 342 								GPIO_WriteHigh(GPIOC, PIN_SDI);//因为低电平 点亮
2934  0bb4 4b80          	push	#128
2935  0bb6 ae500a        	ldw	x,#20490
2936  0bb9 cd0000        	call	_GPIO_WriteHigh
2938  0bbc 84            	pop	a
2940  0bbd 2009          	jra	L706
2941  0bbf               L506:
2942                     ; 345 								GPIO_WriteLow(GPIOC, PIN_SDI);
2944  0bbf 4b80          	push	#128
2945  0bc1 ae500a        	ldw	x,#20490
2946  0bc4 cd0000        	call	_GPIO_WriteLow
2948  0bc7 84            	pop	a
2949  0bc8               L706:
2950                     ; 347 						GPIO_WriteHigh(GPIOC, PIN_CLK);   //数据移位发生在上升沿
2952  0bc8 4b40          	push	#64
2953  0bca ae500a        	ldw	x,#20490
2954  0bcd cd0000        	call	_GPIO_WriteHigh
2956  0bd0 84            	pop	a
2957                     ; 348 						GPIO_WriteLow(GPIOC, PIN_CLK);
2959  0bd1 4b40          	push	#64
2960  0bd3 ae500a        	ldw	x,#20490
2961  0bd6 cd0000        	call	_GPIO_WriteLow
2963  0bd9 84            	pop	a
2964                     ; 349 						value >>= 1;                      //value左移
2966  0bda 0402          	srl	(OFST+1,sp)
2967  0bdc 0603          	rrc	(OFST+2,sp)
2969  0bde 2036          	jra	L116
2970  0be0               L306:
2971                     ; 351 				else if(DN== data_place){
2973  0be0 7b06          	ld	a,(OFST+5,sp)
2974  0be2 a120          	cp	a,#32
2975  0be4 2630          	jrne	L116
2976                     ; 352 						if(value & 0x8000) {
2978  0be6 7b02          	ld	a,(OFST+1,sp)
2979  0be8 a580          	bcp	a,#128
2980  0bea 270b          	jreq	L516
2981                     ; 353 								GPIO_WriteHigh(GPIOC, PIN_SDI);
2983  0bec 4b80          	push	#128
2984  0bee ae500a        	ldw	x,#20490
2985  0bf1 cd0000        	call	_GPIO_WriteHigh
2987  0bf4 84            	pop	a
2989  0bf5 2009          	jra	L716
2990  0bf7               L516:
2991                     ; 356 								GPIO_WriteLow(GPIOC, PIN_SDI);
2993  0bf7 4b80          	push	#128
2994  0bf9 ae500a        	ldw	x,#20490
2995  0bfc cd0000        	call	_GPIO_WriteLow
2997  0bff 84            	pop	a
2998  0c00               L716:
2999                     ; 358 						GPIO_WriteHigh(GPIOC, PIN_CLK);   //数据移位发生在上升沿
3001  0c00 4b40          	push	#64
3002  0c02 ae500a        	ldw	x,#20490
3003  0c05 cd0000        	call	_GPIO_WriteHigh
3005  0c08 84            	pop	a
3006                     ; 359 						GPIO_WriteLow(GPIOC, PIN_CLK);
3008  0c09 4b40          	push	#64
3009  0c0b ae500a        	ldw	x,#20490
3010  0c0e cd0000        	call	_GPIO_WriteLow
3012  0c11 84            	pop	a
3013                     ; 360 						value <<= 1;                      //value左移
3015  0c12 0803          	sll	(OFST+2,sp)
3016  0c14 0902          	rlc	(OFST+1,sp)
3017  0c16               L116:
3018                     ; 339 		for(i=0; i<16; i++) {
3020  0c16 0c01          	inc	(OFST+0,sp)
3023  0c18 7b01          	ld	a,(OFST+0,sp)
3024  0c1a a110          	cp	a,#16
3025  0c1c 258a          	jrult	L575
3026                     ; 363 		GPIO_WriteHigh(GPIOC, data_place);   			//输出锁存打开
3028  0c1e 7b06          	ld	a,(OFST+5,sp)
3029  0c20 88            	push	a
3030  0c21 ae500a        	ldw	x,#20490
3031  0c24 cd0000        	call	_GPIO_WriteHigh
3033  0c27 84            	pop	a
3034                     ; 364 		GPIO_WriteLow(GPIOC, data_place);
3036  0c28 7b06          	ld	a,(OFST+5,sp)
3037  0c2a 88            	push	a
3038  0c2b ae500a        	ldw	x,#20490
3039  0c2e cd0000        	call	_GPIO_WriteLow
3041  0c31 84            	pop	a
3042                     ; 365 }
3045  0c32 5b03          	addw	sp,#3
3046  0c34 81            	ret
3201                     	switch	.ubsct
3202  0002               L12_msg_index:
3203  0002 00            	ds.b	1
3204  0003               L71_act_row:
3205  0003 0000          	ds.b	2
3206  0005               L51_flash_n:
3207  0005 00            	ds.b	1
3208  0006               L11_floor:
3209  0006 00            	ds.b	1
3210                     	xref	_fonts_up
3211                     	xref	_fonts_left
3212                     	xref	_fonts_flash
3213                     	xref	_fonts
3214                     	xdef	_SetFlashCounter
3215                     	xdef	_SetUpRow
3216                     	xdef	_SetBrightness
3217                     	xdef	_SetLeftBit
3218                     	xdef	_SetMsg
3219                     	xdef	_SetFloor
3220                     	xdef	_GetMode
3221                     	xdef	_SetMode
3222                     	xdef	_TaskDisp
3223                     	xdef	_DispInit
3224                     	xref	_GPIO_WriteLow
3225                     	xref	_GPIO_WriteHigh
3226                     	xref	_GPIO_Init
3227                     	xref.b	c_lreg
3247                     	xref	c_llsh
3248                     	xref	c_uitolx
3249                     	xref	c_land
3250                     	xref	c_lursh
3251                     	xref	c_lgor
3252                     	xref	c_lglsh
3253                     	xref	c_rtol
3254                     	end
