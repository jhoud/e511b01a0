   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 44 uint8_t ITC_GetCPUCC(void)
  32                     ; 45 {
  34                     	switch	.text
  35  0000               _ITC_GetCPUCC:
  39                     ; 47   _asm("push cc");
  42  0000 8a            push cc
  44                     ; 48   _asm("pop a");
  47  0001 84            pop a
  49                     ; 49   return; /* Ignore compiler warning, the returned value is in A register */
  52  0002 81            	ret
  75                     ; 74 void ITC_DeInit(void)
  75                     ; 75 {
  76                     	switch	.text
  77  0003               _ITC_DeInit:
  81                     ; 76     ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  83  0003 35ff7f70      	mov	32624,#255
  84                     ; 77     ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  86  0007 35ff7f71      	mov	32625,#255
  87                     ; 78     ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
  89  000b 35ff7f72      	mov	32626,#255
  90                     ; 79     ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
  92  000f 35ff7f73      	mov	32627,#255
  93                     ; 80     ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
  95  0013 35ff7f74      	mov	32628,#255
  96                     ; 81     ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
  98  0017 35ff7f75      	mov	32629,#255
  99                     ; 82     ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 101  001b 35ff7f76      	mov	32630,#255
 102                     ; 83     ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 104  001f 35ff7f77      	mov	32631,#255
 105                     ; 84 }
 108  0023 81            	ret
 133                     ; 91 uint8_t ITC_GetSoftIntStatus(void)
 133                     ; 92 {
 134                     	switch	.text
 135  0024               _ITC_GetSoftIntStatus:
 139                     ; 93     return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 141  0024 adda          	call	_ITC_GetCPUCC
 143  0026 a428          	and	a,#40
 146  0028 81            	ret
 424                     .const:	section	.text
 425  0000               L62:
 426  0000 006a          	dc.w	L14
 427  0002 006a          	dc.w	L14
 428  0004 006a          	dc.w	L14
 429  0006 006a          	dc.w	L14
 430  0008 0073          	dc.w	L34
 431  000a 0073          	dc.w	L34
 432  000c 0073          	dc.w	L34
 433  000e 0073          	dc.w	L34
 434  0010 007c          	dc.w	L54
 435  0012 007c          	dc.w	L54
 436  0014 007c          	dc.w	L54
 437  0016 007c          	dc.w	L54
 438  0018 0085          	dc.w	L74
 439  001a 0085          	dc.w	L74
 440  001c 0085          	dc.w	L74
 441  001e 0085          	dc.w	L74
 442  0020 008e          	dc.w	L15
 443  0022 008e          	dc.w	L15
 444  0024 008e          	dc.w	L15
 445  0026 008e          	dc.w	L15
 446  0028 0097          	dc.w	L35
 447  002a 0097          	dc.w	L35
 448  002c 0097          	dc.w	L35
 449  002e 0097          	dc.w	L35
 450  0030 00a0          	dc.w	L55
 451                     ; 101 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 451                     ; 102 {
 452                     	switch	.text
 453  0029               _ITC_GetSoftwarePriority:
 455  0029 88            	push	a
 456  002a 89            	pushw	x
 457       00000002      OFST:	set	2
 460                     ; 104     uint8_t Value = 0;
 462  002b 0f02          	clr	(OFST+0,sp)
 463                     ; 105     uint8_t Mask = 0;
 465  002d 7b01          	ld	a,(OFST-1,sp)
 466  002f 97            	ld	xl,a
 467                     ; 108     assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 469  0030 7b03          	ld	a,(OFST+1,sp)
 470  0032 a119          	cp	a,#25
 471  0034 2403          	jruge	L41
 472  0036 4f            	clr	a
 473  0037 2010          	jra	L61
 474  0039               L41:
 475  0039 ae006c        	ldw	x,#108
 476  003c 89            	pushw	x
 477  003d ae0000        	ldw	x,#0
 478  0040 89            	pushw	x
 479  0041 ae0064        	ldw	x,#L112
 480  0044 cd0000        	call	_assert_failed
 482  0047 5b04          	addw	sp,#4
 483  0049               L61:
 484                     ; 111     Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 486  0049 7b03          	ld	a,(OFST+1,sp)
 487  004b a403          	and	a,#3
 488  004d 48            	sll	a
 489  004e 5f            	clrw	x
 490  004f 97            	ld	xl,a
 491  0050 a603          	ld	a,#3
 492  0052 5d            	tnzw	x
 493  0053 2704          	jreq	L02
 494  0055               L22:
 495  0055 48            	sll	a
 496  0056 5a            	decw	x
 497  0057 26fc          	jrne	L22
 498  0059               L02:
 499  0059 6b01          	ld	(OFST-1,sp),a
 500                     ; 113     switch (IrqNum)
 502  005b 7b03          	ld	a,(OFST+1,sp)
 504                     ; 185     default:
 504                     ; 186         break;
 505  005d a119          	cp	a,#25
 506  005f 2407          	jruge	L42
 507  0061 5f            	clrw	x
 508  0062 97            	ld	xl,a
 509  0063 58            	sllw	x
 510  0064 de0000        	ldw	x,(L62,x)
 511  0067 fc            	jp	(x)
 512  0068               L42:
 513  0068 203d          	jra	L512
 514  006a               L14:
 515                     ; 115     case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 515                     ; 116     case ITC_IRQ_AWU:
 515                     ; 117     case ITC_IRQ_CLK:
 515                     ; 118     case ITC_IRQ_PORTA:
 515                     ; 119         Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 517  006a c67f70        	ld	a,32624
 518  006d 1401          	and	a,(OFST-1,sp)
 519  006f 6b02          	ld	(OFST+0,sp),a
 520                     ; 120         break;
 522  0071 2034          	jra	L512
 523  0073               L34:
 524                     ; 121     case ITC_IRQ_PORTB:
 524                     ; 122     case ITC_IRQ_PORTC:
 524                     ; 123     case ITC_IRQ_PORTD:
 524                     ; 124     case ITC_IRQ_PORTE:
 524                     ; 125         Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 526  0073 c67f71        	ld	a,32625
 527  0076 1401          	and	a,(OFST-1,sp)
 528  0078 6b02          	ld	(OFST+0,sp),a
 529                     ; 126         break;
 531  007a 202b          	jra	L512
 532  007c               L54:
 533                     ; 128     case ITC_IRQ_CAN_RX:
 533                     ; 129     case ITC_IRQ_CAN_TX:
 533                     ; 130 #endif /*STM8S208 or STM8AF52Ax */
 533                     ; 131 
 533                     ; 132 #ifdef STM8S903
 533                     ; 133     case ITC_IRQ_PORTF:
 533                     ; 134 #endif /*STM8S903*/
 533                     ; 135 
 533                     ; 136     case ITC_IRQ_SPI:
 533                     ; 137     case ITC_IRQ_TIM1_OVF:
 533                     ; 138         Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 535  007c c67f72        	ld	a,32626
 536  007f 1401          	and	a,(OFST-1,sp)
 537  0081 6b02          	ld	(OFST+0,sp),a
 538                     ; 139         break;
 540  0083 2022          	jra	L512
 541  0085               L74:
 542                     ; 140     case ITC_IRQ_TIM1_CAPCOM:
 542                     ; 141 #ifdef STM8S903
 542                     ; 142     case ITC_IRQ_TIM5_OVFTRI:
 542                     ; 143     case ITC_IRQ_TIM5_CAPCOM:
 542                     ; 144 #else
 542                     ; 145     case ITC_IRQ_TIM2_OVF:
 542                     ; 146     case ITC_IRQ_TIM2_CAPCOM:
 542                     ; 147 #endif /*STM8S903*/
 542                     ; 148 
 542                     ; 149     case ITC_IRQ_TIM3_OVF:
 542                     ; 150         Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 544  0085 c67f73        	ld	a,32627
 545  0088 1401          	and	a,(OFST-1,sp)
 546  008a 6b02          	ld	(OFST+0,sp),a
 547                     ; 151         break;
 549  008c 2019          	jra	L512
 550  008e               L15:
 551                     ; 152     case ITC_IRQ_TIM3_CAPCOM:
 551                     ; 153     case ITC_IRQ_UART1_TX:
 551                     ; 154     case ITC_IRQ_UART1_RX:
 551                     ; 155     case ITC_IRQ_I2C:
 551                     ; 156         Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 553  008e c67f74        	ld	a,32628
 554  0091 1401          	and	a,(OFST-1,sp)
 555  0093 6b02          	ld	(OFST+0,sp),a
 556                     ; 157         break;
 558  0095 2010          	jra	L512
 559  0097               L35:
 560                     ; 165     case ITC_IRQ_UART3_TX:
 560                     ; 166     case ITC_IRQ_UART3_RX:
 560                     ; 167     case ITC_IRQ_ADC2:
 560                     ; 168 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 560                     ; 169 
 560                     ; 170 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 560                     ; 171     defined(STM8S903) || defined(STM8AF626x)
 560                     ; 172     case ITC_IRQ_ADC1:
 560                     ; 173 #endif /*STM8S105, STM8S103 or STM8S905 or STM8AF626x */
 560                     ; 174 
 560                     ; 175 #ifdef STM8S903
 560                     ; 176     case ITC_IRQ_TIM6_OVFTRI:
 560                     ; 177 #else
 560                     ; 178     case ITC_IRQ_TIM4_OVF:
 560                     ; 179 #endif /*STM8S903*/
 560                     ; 180         Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 562  0097 c67f75        	ld	a,32629
 563  009a 1401          	and	a,(OFST-1,sp)
 564  009c 6b02          	ld	(OFST+0,sp),a
 565                     ; 181         break;
 567  009e 2007          	jra	L512
 568  00a0               L55:
 569                     ; 182     case ITC_IRQ_EEPROM_EEC:
 569                     ; 183         Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 571  00a0 c67f76        	ld	a,32630
 572  00a3 1401          	and	a,(OFST-1,sp)
 573  00a5 6b02          	ld	(OFST+0,sp),a
 574                     ; 184         break;
 576  00a7               L75:
 577                     ; 185     default:
 577                     ; 186         break;
 579  00a7               L512:
 580                     ; 189     Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 582  00a7 7b03          	ld	a,(OFST+1,sp)
 583  00a9 a403          	and	a,#3
 584  00ab 48            	sll	a
 585  00ac 5f            	clrw	x
 586  00ad 97            	ld	xl,a
 587  00ae 7b02          	ld	a,(OFST+0,sp)
 588  00b0 5d            	tnzw	x
 589  00b1 2704          	jreq	L03
 590  00b3               L23:
 591  00b3 44            	srl	a
 592  00b4 5a            	decw	x
 593  00b5 26fc          	jrne	L23
 594  00b7               L03:
 595  00b7 6b02          	ld	(OFST+0,sp),a
 596                     ; 191     return((ITC_PriorityLevel_TypeDef)Value);
 598  00b9 7b02          	ld	a,(OFST+0,sp)
 601  00bb 5b03          	addw	sp,#3
 602  00bd 81            	ret
 668                     	switch	.const
 669  0032               L66:
 670  0032 0156          	dc.w	L712
 671  0034 0156          	dc.w	L712
 672  0036 0156          	dc.w	L712
 673  0038 0156          	dc.w	L712
 674  003a 0168          	dc.w	L122
 675  003c 0168          	dc.w	L122
 676  003e 0168          	dc.w	L122
 677  0040 0168          	dc.w	L122
 678  0042 017a          	dc.w	L322
 679  0044 017a          	dc.w	L322
 680  0046 017a          	dc.w	L322
 681  0048 017a          	dc.w	L322
 682  004a 018c          	dc.w	L522
 683  004c 018c          	dc.w	L522
 684  004e 018c          	dc.w	L522
 685  0050 018c          	dc.w	L522
 686  0052 019e          	dc.w	L722
 687  0054 019e          	dc.w	L722
 688  0056 019e          	dc.w	L722
 689  0058 019e          	dc.w	L722
 690  005a 01b0          	dc.w	L132
 691  005c 01b0          	dc.w	L132
 692  005e 01b0          	dc.w	L132
 693  0060 01b0          	dc.w	L132
 694  0062 01c2          	dc.w	L332
 695                     ; 208 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 695                     ; 209 {
 696                     	switch	.text
 697  00be               _ITC_SetSoftwarePriority:
 699  00be 89            	pushw	x
 700  00bf 89            	pushw	x
 701       00000002      OFST:	set	2
 704                     ; 211     uint8_t Mask = 0;
 706  00c0 7b01          	ld	a,(OFST-1,sp)
 707  00c2 97            	ld	xl,a
 708                     ; 212     uint8_t NewPriority = 0;
 710  00c3 7b02          	ld	a,(OFST+0,sp)
 711  00c5 97            	ld	xl,a
 712                     ; 215     assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 714  00c6 7b03          	ld	a,(OFST+1,sp)
 715  00c8 a119          	cp	a,#25
 716  00ca 2403          	jruge	L63
 717  00cc 4f            	clr	a
 718  00cd 2010          	jra	L04
 719  00cf               L63:
 720  00cf ae00d7        	ldw	x,#215
 721  00d2 89            	pushw	x
 722  00d3 ae0000        	ldw	x,#0
 723  00d6 89            	pushw	x
 724  00d7 ae0064        	ldw	x,#L112
 725  00da cd0000        	call	_assert_failed
 727  00dd 5b04          	addw	sp,#4
 728  00df               L04:
 729                     ; 216     assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 731  00df 7b04          	ld	a,(OFST+2,sp)
 732  00e1 a102          	cp	a,#2
 733  00e3 2710          	jreq	L44
 734  00e5 7b04          	ld	a,(OFST+2,sp)
 735  00e7 a101          	cp	a,#1
 736  00e9 270a          	jreq	L44
 737  00eb 0d04          	tnz	(OFST+2,sp)
 738  00ed 2706          	jreq	L44
 739  00ef 7b04          	ld	a,(OFST+2,sp)
 740  00f1 a103          	cp	a,#3
 741  00f3 2603          	jrne	L24
 742  00f5               L44:
 743  00f5 4f            	clr	a
 744  00f6 2010          	jra	L64
 745  00f8               L24:
 746  00f8 ae00d8        	ldw	x,#216
 747  00fb 89            	pushw	x
 748  00fc ae0000        	ldw	x,#0
 749  00ff 89            	pushw	x
 750  0100 ae0064        	ldw	x,#L112
 751  0103 cd0000        	call	_assert_failed
 753  0106 5b04          	addw	sp,#4
 754  0108               L64:
 755                     ; 219     assert_param(IS_ITC_INTERRUPTS_DISABLED);
 757  0108 cd0024        	call	_ITC_GetSoftIntStatus
 759  010b a128          	cp	a,#40
 760  010d 2603          	jrne	L05
 761  010f 4f            	clr	a
 762  0110 2010          	jra	L25
 763  0112               L05:
 764  0112 ae00db        	ldw	x,#219
 765  0115 89            	pushw	x
 766  0116 ae0000        	ldw	x,#0
 767  0119 89            	pushw	x
 768  011a ae0064        	ldw	x,#L112
 769  011d cd0000        	call	_assert_failed
 771  0120 5b04          	addw	sp,#4
 772  0122               L25:
 773                     ; 223     Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 775  0122 7b03          	ld	a,(OFST+1,sp)
 776  0124 a403          	and	a,#3
 777  0126 48            	sll	a
 778  0127 5f            	clrw	x
 779  0128 97            	ld	xl,a
 780  0129 a603          	ld	a,#3
 781  012b 5d            	tnzw	x
 782  012c 2704          	jreq	L45
 783  012e               L65:
 784  012e 48            	sll	a
 785  012f 5a            	decw	x
 786  0130 26fc          	jrne	L65
 787  0132               L45:
 788  0132 43            	cpl	a
 789  0133 6b01          	ld	(OFST-1,sp),a
 790                     ; 226     NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 792  0135 7b03          	ld	a,(OFST+1,sp)
 793  0137 a403          	and	a,#3
 794  0139 48            	sll	a
 795  013a 5f            	clrw	x
 796  013b 97            	ld	xl,a
 797  013c 7b04          	ld	a,(OFST+2,sp)
 798  013e 5d            	tnzw	x
 799  013f 2704          	jreq	L06
 800  0141               L26:
 801  0141 48            	sll	a
 802  0142 5a            	decw	x
 803  0143 26fc          	jrne	L26
 804  0145               L06:
 805  0145 6b02          	ld	(OFST+0,sp),a
 806                     ; 228     switch (IrqNum)
 808  0147 7b03          	ld	a,(OFST+1,sp)
 810                     ; 314     default:
 810                     ; 315         break;
 811  0149 a119          	cp	a,#25
 812  014b 2407          	jruge	L46
 813  014d 5f            	clrw	x
 814  014e 97            	ld	xl,a
 815  014f 58            	sllw	x
 816  0150 de0032        	ldw	x,(L66,x)
 817  0153 fc            	jp	(x)
 818  0154               L46:
 819  0154 207c          	jra	L372
 820  0156               L712:
 821                     ; 231     case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 821                     ; 232     case ITC_IRQ_AWU:
 821                     ; 233     case ITC_IRQ_CLK:
 821                     ; 234     case ITC_IRQ_PORTA:
 821                     ; 235         ITC->ISPR1 &= Mask;
 823  0156 c67f70        	ld	a,32624
 824  0159 1401          	and	a,(OFST-1,sp)
 825  015b c77f70        	ld	32624,a
 826                     ; 236         ITC->ISPR1 |= NewPriority;
 828  015e c67f70        	ld	a,32624
 829  0161 1a02          	or	a,(OFST+0,sp)
 830  0163 c77f70        	ld	32624,a
 831                     ; 237         break;
 833  0166 206a          	jra	L372
 834  0168               L122:
 835                     ; 239     case ITC_IRQ_PORTB:
 835                     ; 240     case ITC_IRQ_PORTC:
 835                     ; 241     case ITC_IRQ_PORTD:
 835                     ; 242     case ITC_IRQ_PORTE:
 835                     ; 243         ITC->ISPR2 &= Mask;
 837  0168 c67f71        	ld	a,32625
 838  016b 1401          	and	a,(OFST-1,sp)
 839  016d c77f71        	ld	32625,a
 840                     ; 244         ITC->ISPR2 |= NewPriority;
 842  0170 c67f71        	ld	a,32625
 843  0173 1a02          	or	a,(OFST+0,sp)
 844  0175 c77f71        	ld	32625,a
 845                     ; 245         break;
 847  0178 2058          	jra	L372
 848  017a               L322:
 849                     ; 248     case ITC_IRQ_CAN_RX:
 849                     ; 249     case ITC_IRQ_CAN_TX:
 849                     ; 250 #endif /*STM8S208 or STM8AF52Ax */
 849                     ; 251 
 849                     ; 252 #ifdef STM8S903
 849                     ; 253     case ITC_IRQ_PORTF:
 849                     ; 254 #endif /*STM8S903*/
 849                     ; 255     case ITC_IRQ_SPI:
 849                     ; 256     case ITC_IRQ_TIM1_OVF:
 849                     ; 257         ITC->ISPR3 &= Mask;
 851  017a c67f72        	ld	a,32626
 852  017d 1401          	and	a,(OFST-1,sp)
 853  017f c77f72        	ld	32626,a
 854                     ; 258         ITC->ISPR3 |= NewPriority;
 856  0182 c67f72        	ld	a,32626
 857  0185 1a02          	or	a,(OFST+0,sp)
 858  0187 c77f72        	ld	32626,a
 859                     ; 259         break;
 861  018a 2046          	jra	L372
 862  018c               L522:
 863                     ; 261     case ITC_IRQ_TIM1_CAPCOM:
 863                     ; 262 #ifdef STM8S903
 863                     ; 263     case ITC_IRQ_TIM5_OVFTRI:
 863                     ; 264     case ITC_IRQ_TIM5_CAPCOM:
 863                     ; 265 #else
 863                     ; 266     case ITC_IRQ_TIM2_OVF:
 863                     ; 267     case ITC_IRQ_TIM2_CAPCOM:
 863                     ; 268 #endif /*STM8S903*/
 863                     ; 269 
 863                     ; 270     case ITC_IRQ_TIM3_OVF:
 863                     ; 271         ITC->ISPR4 &= Mask;
 865  018c c67f73        	ld	a,32627
 866  018f 1401          	and	a,(OFST-1,sp)
 867  0191 c77f73        	ld	32627,a
 868                     ; 272         ITC->ISPR4 |= NewPriority;
 870  0194 c67f73        	ld	a,32627
 871  0197 1a02          	or	a,(OFST+0,sp)
 872  0199 c77f73        	ld	32627,a
 873                     ; 273         break;
 875  019c 2034          	jra	L372
 876  019e               L722:
 877                     ; 275     case ITC_IRQ_TIM3_CAPCOM:
 877                     ; 276     case ITC_IRQ_UART1_TX:
 877                     ; 277     case ITC_IRQ_UART1_RX:
 877                     ; 278     case ITC_IRQ_I2C:
 877                     ; 279         ITC->ISPR5 &= Mask;
 879  019e c67f74        	ld	a,32628
 880  01a1 1401          	and	a,(OFST-1,sp)
 881  01a3 c77f74        	ld	32628,a
 882                     ; 280         ITC->ISPR5 |= NewPriority;
 884  01a6 c67f74        	ld	a,32628
 885  01a9 1a02          	or	a,(OFST+0,sp)
 886  01ab c77f74        	ld	32628,a
 887                     ; 281         break;
 889  01ae 2022          	jra	L372
 890  01b0               L132:
 891                     ; 290     case ITC_IRQ_UART3_TX:
 891                     ; 291     case ITC_IRQ_UART3_RX:
 891                     ; 292     case ITC_IRQ_ADC2:
 891                     ; 293 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 891                     ; 294 
 891                     ; 295 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 891                     ; 296     defined(STM8S903) || defined(STM8AF626x)
 891                     ; 297     case ITC_IRQ_ADC1:
 891                     ; 298 #endif /*STM8S105, STM8S103 or STM8S905 or STM8AF626x */
 891                     ; 299 
 891                     ; 300 #ifdef STM8S903
 891                     ; 301     case ITC_IRQ_TIM6_OVFTRI:
 891                     ; 302 #else
 891                     ; 303     case ITC_IRQ_TIM4_OVF:
 891                     ; 304 #endif /*STM8S903*/
 891                     ; 305         ITC->ISPR6 &= Mask;
 893  01b0 c67f75        	ld	a,32629
 894  01b3 1401          	and	a,(OFST-1,sp)
 895  01b5 c77f75        	ld	32629,a
 896                     ; 306         ITC->ISPR6 |= NewPriority;
 898  01b8 c67f75        	ld	a,32629
 899  01bb 1a02          	or	a,(OFST+0,sp)
 900  01bd c77f75        	ld	32629,a
 901                     ; 307         break;
 903  01c0 2010          	jra	L372
 904  01c2               L332:
 905                     ; 309     case ITC_IRQ_EEPROM_EEC:
 905                     ; 310         ITC->ISPR7 &= Mask;
 907  01c2 c67f76        	ld	a,32630
 908  01c5 1401          	and	a,(OFST-1,sp)
 909  01c7 c77f76        	ld	32630,a
 910                     ; 311         ITC->ISPR7 |= NewPriority;
 912  01ca c67f76        	ld	a,32630
 913  01cd 1a02          	or	a,(OFST+0,sp)
 914  01cf c77f76        	ld	32630,a
 915                     ; 312         break;
 917  01d2               L532:
 918                     ; 314     default:
 918                     ; 315         break;
 920  01d2               L372:
 921                     ; 319 }
 924  01d2 5b04          	addw	sp,#4
 925  01d4 81            	ret
 938                     	xdef	_ITC_GetSoftwarePriority
 939                     	xdef	_ITC_SetSoftwarePriority
 940                     	xdef	_ITC_GetSoftIntStatus
 941                     	xdef	_ITC_DeInit
 942                     	xdef	_ITC_GetCPUCC
 943                     	xref	_assert_failed
 944                     	switch	.const
 945  0064               L112:
 946  0064 66776c69625c  	dc.b	"fwlib\src\stm8s_it"
 947  0076 632e6300      	dc.b	"c.c",0
 967                     	end
