   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 48 void UART3_DeInit(void)
  32                     ; 49 {
  34                     	switch	.text
  35  0000               _UART3_DeInit:
  39                     ; 52     (void) UART3->SR;
  41  0000 c65240        	ld	a,21056
  42  0003 97            	ld	xl,a
  43                     ; 53     (void) UART3->DR;
  45  0004 c65241        	ld	a,21057
  46  0007 97            	ld	xl,a
  47                     ; 55     UART3->BRR2 = UART3_BRR2_RESET_VALUE; /*Set UART3_BRR2 to reset value 0x00 */
  49  0008 725f5243      	clr	21059
  50                     ; 56     UART3->BRR1 = UART3_BRR1_RESET_VALUE; /*Set UART3_BRR1 to reset value 0x00 */
  52  000c 725f5242      	clr	21058
  53                     ; 58     UART3->CR1 = UART3_CR1_RESET_VALUE;  /*Set UART3_CR1 to reset value 0x00  */
  55  0010 725f5244      	clr	21060
  56                     ; 59     UART3->CR2 = UART3_CR2_RESET_VALUE;  /*Set UART3_CR2 to reset value 0x00  */
  58  0014 725f5245      	clr	21061
  59                     ; 60     UART3->CR3 = UART3_CR3_RESET_VALUE;  /*Set UART3_CR3 to reset value 0x00  */
  61  0018 725f5246      	clr	21062
  62                     ; 61     UART3->CR4 = UART3_CR4_RESET_VALUE;  /*Set UART3_CR4 to reset value 0x00  */
  64  001c 725f5247      	clr	21063
  65                     ; 62     UART3->CR6 = UART3_CR6_RESET_VALUE;  /*Set UART3_CR6 to reset value 0x00  */
  67  0020 725f5249      	clr	21065
  68                     ; 64 }
  71  0024 81            	ret
 299                     .const:	section	.text
 300  0000               L43:
 301  0000 00098969      	dc.l	625001
 302  0004               L64:
 303  0004 00000064      	dc.l	100
 304                     ; 78 void UART3_Init(uint32_t BaudRate, UART3_WordLength_TypeDef WordLength, 
 304                     ; 79                 UART3_StopBits_TypeDef StopBits, UART3_Parity_TypeDef Parity, 
 304                     ; 80                 UART3_Mode_TypeDef Mode)
 304                     ; 81 {
 305                     	switch	.text
 306  0025               _UART3_Init:
 308  0025 520e          	subw	sp,#14
 309       0000000e      OFST:	set	14
 312                     ; 82     uint8_t BRR2_1 = 0, BRR2_2 = 0;
 314  0027 7b05          	ld	a,(OFST-9,sp)
 315  0029 97            	ld	xl,a
 318  002a 7b06          	ld	a,(OFST-8,sp)
 319  002c 97            	ld	xl,a
 320                     ; 83     uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 322  002d 96            	ldw	x,sp
 323  002e 1c000b        	addw	x,#OFST-3
 324  0031 cd0000        	call	c_ltor
 328  0034 96            	ldw	x,sp
 329  0035 1c0007        	addw	x,#OFST-7
 330  0038 cd0000        	call	c_ltor
 332                     ; 86     assert_param(IS_UART3_WORDLENGTH_OK(WordLength));
 334  003b 0d15          	tnz	(OFST+7,sp)
 335  003d 2706          	jreq	L21
 336  003f 7b15          	ld	a,(OFST+7,sp)
 337  0041 a110          	cp	a,#16
 338  0043 2603          	jrne	L01
 339  0045               L21:
 340  0045 4f            	clr	a
 341  0046 2010          	jra	L41
 342  0048               L01:
 343  0048 ae0056        	ldw	x,#86
 344  004b 89            	pushw	x
 345  004c ae0000        	ldw	x,#0
 346  004f 89            	pushw	x
 347  0050 ae0008        	ldw	x,#L741
 348  0053 cd0000        	call	_assert_failed
 350  0056 5b04          	addw	sp,#4
 351  0058               L41:
 352                     ; 87     assert_param(IS_UART3_STOPBITS_OK(StopBits));
 354  0058 0d16          	tnz	(OFST+8,sp)
 355  005a 2706          	jreq	L02
 356  005c 7b16          	ld	a,(OFST+8,sp)
 357  005e a120          	cp	a,#32
 358  0060 2603          	jrne	L61
 359  0062               L02:
 360  0062 4f            	clr	a
 361  0063 2010          	jra	L22
 362  0065               L61:
 363  0065 ae0057        	ldw	x,#87
 364  0068 89            	pushw	x
 365  0069 ae0000        	ldw	x,#0
 366  006c 89            	pushw	x
 367  006d ae0008        	ldw	x,#L741
 368  0070 cd0000        	call	_assert_failed
 370  0073 5b04          	addw	sp,#4
 371  0075               L22:
 372                     ; 88     assert_param(IS_UART3_PARITY_OK(Parity));
 374  0075 0d17          	tnz	(OFST+9,sp)
 375  0077 270c          	jreq	L62
 376  0079 7b17          	ld	a,(OFST+9,sp)
 377  007b a104          	cp	a,#4
 378  007d 2706          	jreq	L62
 379  007f 7b17          	ld	a,(OFST+9,sp)
 380  0081 a106          	cp	a,#6
 381  0083 2603          	jrne	L42
 382  0085               L62:
 383  0085 4f            	clr	a
 384  0086 2010          	jra	L03
 385  0088               L42:
 386  0088 ae0058        	ldw	x,#88
 387  008b 89            	pushw	x
 388  008c ae0000        	ldw	x,#0
 389  008f 89            	pushw	x
 390  0090 ae0008        	ldw	x,#L741
 391  0093 cd0000        	call	_assert_failed
 393  0096 5b04          	addw	sp,#4
 394  0098               L03:
 395                     ; 89     assert_param(IS_UART3_BAUDRATE_OK(BaudRate));
 397  0098 96            	ldw	x,sp
 398  0099 1c0011        	addw	x,#OFST+3
 399  009c cd0000        	call	c_ltor
 401  009f ae0000        	ldw	x,#L43
 402  00a2 cd0000        	call	c_lcmp
 404  00a5 2403          	jruge	L23
 405  00a7 4f            	clr	a
 406  00a8 2010          	jra	L63
 407  00aa               L23:
 408  00aa ae0059        	ldw	x,#89
 409  00ad 89            	pushw	x
 410  00ae ae0000        	ldw	x,#0
 411  00b1 89            	pushw	x
 412  00b2 ae0008        	ldw	x,#L741
 413  00b5 cd0000        	call	_assert_failed
 415  00b8 5b04          	addw	sp,#4
 416  00ba               L63:
 417                     ; 90     assert_param(IS_UART3_MODE_OK((uint8_t)Mode));
 419  00ba 7b18          	ld	a,(OFST+10,sp)
 420  00bc a108          	cp	a,#8
 421  00be 2730          	jreq	L24
 422  00c0 7b18          	ld	a,(OFST+10,sp)
 423  00c2 a140          	cp	a,#64
 424  00c4 272a          	jreq	L24
 425  00c6 7b18          	ld	a,(OFST+10,sp)
 426  00c8 a104          	cp	a,#4
 427  00ca 2724          	jreq	L24
 428  00cc 7b18          	ld	a,(OFST+10,sp)
 429  00ce a180          	cp	a,#128
 430  00d0 271e          	jreq	L24
 431  00d2 7b18          	ld	a,(OFST+10,sp)
 432  00d4 a10c          	cp	a,#12
 433  00d6 2718          	jreq	L24
 434  00d8 7b18          	ld	a,(OFST+10,sp)
 435  00da a10c          	cp	a,#12
 436  00dc 2712          	jreq	L24
 437  00de 7b18          	ld	a,(OFST+10,sp)
 438  00e0 a144          	cp	a,#68
 439  00e2 270c          	jreq	L24
 440  00e4 7b18          	ld	a,(OFST+10,sp)
 441  00e6 a1c0          	cp	a,#192
 442  00e8 2706          	jreq	L24
 443  00ea 7b18          	ld	a,(OFST+10,sp)
 444  00ec a188          	cp	a,#136
 445  00ee 2603          	jrne	L04
 446  00f0               L24:
 447  00f0 4f            	clr	a
 448  00f1 2010          	jra	L44
 449  00f3               L04:
 450  00f3 ae005a        	ldw	x,#90
 451  00f6 89            	pushw	x
 452  00f7 ae0000        	ldw	x,#0
 453  00fa 89            	pushw	x
 454  00fb ae0008        	ldw	x,#L741
 455  00fe cd0000        	call	_assert_failed
 457  0101 5b04          	addw	sp,#4
 458  0103               L44:
 459                     ; 93     UART3->CR1 &= (uint8_t)(~UART3_CR1_M);     
 461  0103 72195244      	bres	21060,#4
 462                     ; 95     UART3->CR1 |= (uint8_t)WordLength; 
 464  0107 c65244        	ld	a,21060
 465  010a 1a15          	or	a,(OFST+7,sp)
 466  010c c75244        	ld	21060,a
 467                     ; 98     UART3->CR3 &= (uint8_t)(~UART3_CR3_STOP);  
 469  010f c65246        	ld	a,21062
 470  0112 a4cf          	and	a,#207
 471  0114 c75246        	ld	21062,a
 472                     ; 100     UART3->CR3 |= (uint8_t)StopBits;  
 474  0117 c65246        	ld	a,21062
 475  011a 1a16          	or	a,(OFST+8,sp)
 476  011c c75246        	ld	21062,a
 477                     ; 103     UART3->CR1 &= (uint8_t)(~(UART3_CR1_PCEN | UART3_CR1_PS));  
 479  011f c65244        	ld	a,21060
 480  0122 a4f9          	and	a,#249
 481  0124 c75244        	ld	21060,a
 482                     ; 105     UART3->CR1 |= (uint8_t)Parity;     
 484  0127 c65244        	ld	a,21060
 485  012a 1a17          	or	a,(OFST+9,sp)
 486  012c c75244        	ld	21060,a
 487                     ; 108     UART3->BRR1 &= (uint8_t)(~UART3_BRR1_DIVM);  
 489  012f 725f5242      	clr	21058
 490                     ; 110     UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVM);  
 492  0133 c65243        	ld	a,21059
 493  0136 a40f          	and	a,#15
 494  0138 c75243        	ld	21059,a
 495                     ; 112     UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVF);  
 497  013b c65243        	ld	a,21059
 498  013e a4f0          	and	a,#240
 499  0140 c75243        	ld	21059,a
 500                     ; 115     BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 502  0143 96            	ldw	x,sp
 503  0144 1c0011        	addw	x,#OFST+3
 504  0147 cd0000        	call	c_ltor
 506  014a a604          	ld	a,#4
 507  014c cd0000        	call	c_llsh
 509  014f 96            	ldw	x,sp
 510  0150 1c0001        	addw	x,#OFST-13
 511  0153 cd0000        	call	c_rtol
 513  0156 cd0000        	call	_CLK_GetClockFreq
 515  0159 96            	ldw	x,sp
 516  015a 1c0001        	addw	x,#OFST-13
 517  015d cd0000        	call	c_ludv
 519  0160 96            	ldw	x,sp
 520  0161 1c000b        	addw	x,#OFST-3
 521  0164 cd0000        	call	c_rtol
 523                     ; 116     BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 525  0167 96            	ldw	x,sp
 526  0168 1c0011        	addw	x,#OFST+3
 527  016b cd0000        	call	c_ltor
 529  016e a604          	ld	a,#4
 530  0170 cd0000        	call	c_llsh
 532  0173 96            	ldw	x,sp
 533  0174 1c0001        	addw	x,#OFST-13
 534  0177 cd0000        	call	c_rtol
 536  017a cd0000        	call	_CLK_GetClockFreq
 538  017d a664          	ld	a,#100
 539  017f cd0000        	call	c_smul
 541  0182 96            	ldw	x,sp
 542  0183 1c0001        	addw	x,#OFST-13
 543  0186 cd0000        	call	c_ludv
 545  0189 96            	ldw	x,sp
 546  018a 1c0007        	addw	x,#OFST-7
 547  018d cd0000        	call	c_rtol
 549                     ; 119     BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 549                     ; 120                         << 4) / 100) & (uint8_t)0x0F); 
 551  0190 96            	ldw	x,sp
 552  0191 1c000b        	addw	x,#OFST-3
 553  0194 cd0000        	call	c_ltor
 555  0197 a664          	ld	a,#100
 556  0199 cd0000        	call	c_smul
 558  019c 96            	ldw	x,sp
 559  019d 1c0001        	addw	x,#OFST-13
 560  01a0 cd0000        	call	c_rtol
 562  01a3 96            	ldw	x,sp
 563  01a4 1c0007        	addw	x,#OFST-7
 564  01a7 cd0000        	call	c_ltor
 566  01aa 96            	ldw	x,sp
 567  01ab 1c0001        	addw	x,#OFST-13
 568  01ae cd0000        	call	c_lsub
 570  01b1 a604          	ld	a,#4
 571  01b3 cd0000        	call	c_llsh
 573  01b6 ae0004        	ldw	x,#L64
 574  01b9 cd0000        	call	c_ludv
 576  01bc b603          	ld	a,c_lreg+3
 577  01be a40f          	and	a,#15
 578  01c0 6b05          	ld	(OFST-9,sp),a
 579                     ; 121     BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 581  01c2 96            	ldw	x,sp
 582  01c3 1c000b        	addw	x,#OFST-3
 583  01c6 cd0000        	call	c_ltor
 585  01c9 a604          	ld	a,#4
 586  01cb cd0000        	call	c_lursh
 588  01ce b603          	ld	a,c_lreg+3
 589  01d0 a4f0          	and	a,#240
 590  01d2 b703          	ld	c_lreg+3,a
 591  01d4 3f02          	clr	c_lreg+2
 592  01d6 3f01          	clr	c_lreg+1
 593  01d8 3f00          	clr	c_lreg
 594  01da b603          	ld	a,c_lreg+3
 595  01dc 6b06          	ld	(OFST-8,sp),a
 596                     ; 123     UART3->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 598  01de 7b05          	ld	a,(OFST-9,sp)
 599  01e0 1a06          	or	a,(OFST-8,sp)
 600  01e2 c75243        	ld	21059,a
 601                     ; 125     UART3->BRR1 = (uint8_t)BaudRate_Mantissa;           
 603  01e5 7b0e          	ld	a,(OFST+0,sp)
 604  01e7 c75242        	ld	21058,a
 605                     ; 127     if ((uint8_t)(Mode & UART3_MODE_TX_ENABLE))
 607  01ea 7b18          	ld	a,(OFST+10,sp)
 608  01ec a504          	bcp	a,#4
 609  01ee 2706          	jreq	L151
 610                     ; 130         UART3->CR2 |= UART3_CR2_TEN;  
 612  01f0 72165245      	bset	21061,#3
 614  01f4 2004          	jra	L351
 615  01f6               L151:
 616                     ; 135         UART3->CR2 &= (uint8_t)(~UART3_CR2_TEN);  
 618  01f6 72175245      	bres	21061,#3
 619  01fa               L351:
 620                     ; 137     if ((uint8_t)(Mode & UART3_MODE_RX_ENABLE))
 622  01fa 7b18          	ld	a,(OFST+10,sp)
 623  01fc a508          	bcp	a,#8
 624  01fe 2706          	jreq	L551
 625                     ; 140         UART3->CR2 |= UART3_CR2_REN;  
 627  0200 72145245      	bset	21061,#2
 629  0204 2004          	jra	L751
 630  0206               L551:
 631                     ; 145         UART3->CR2 &= (uint8_t)(~UART3_CR2_REN);  
 633  0206 72155245      	bres	21061,#2
 634  020a               L751:
 635                     ; 147 }
 638  020a 5b0e          	addw	sp,#14
 639  020c 81            	ret
 694                     ; 155 void UART3_Cmd(FunctionalState NewState)
 694                     ; 156 {
 695                     	switch	.text
 696  020d               _UART3_Cmd:
 700                     ; 158     if (NewState != DISABLE)
 702  020d 4d            	tnz	a
 703  020e 2706          	jreq	L702
 704                     ; 161         UART3->CR1 &= (uint8_t)(~UART3_CR1_UARTD); 
 706  0210 721b5244      	bres	21060,#5
 708  0214 2004          	jra	L112
 709  0216               L702:
 710                     ; 166         UART3->CR1 |= UART3_CR1_UARTD;  
 712  0216 721a5244      	bset	21060,#5
 713  021a               L112:
 714                     ; 168 }
 717  021a 81            	ret
 850                     ; 185 void UART3_ITConfig(UART3_IT_TypeDef UART3_IT, FunctionalState NewState)
 850                     ; 186 {
 851                     	switch	.text
 852  021b               _UART3_ITConfig:
 854  021b 89            	pushw	x
 855  021c 89            	pushw	x
 856       00000002      OFST:	set	2
 859                     ; 187     uint8_t uartreg = 0, itpos = 0x00;
 861  021d 7b01          	ld	a,(OFST-1,sp)
 862  021f 97            	ld	xl,a
 865  0220 7b02          	ld	a,(OFST+0,sp)
 866  0222 97            	ld	xl,a
 867                     ; 190     assert_param(IS_UART3_CONFIG_IT_OK(UART3_IT));
 869  0223 1e03          	ldw	x,(OFST+1,sp)
 870  0225 a30100        	cpw	x,#256
 871  0228 272a          	jreq	L65
 872  022a 1e03          	ldw	x,(OFST+1,sp)
 873  022c a30277        	cpw	x,#631
 874  022f 2723          	jreq	L65
 875  0231 1e03          	ldw	x,(OFST+1,sp)
 876  0233 a30266        	cpw	x,#614
 877  0236 271c          	jreq	L65
 878  0238 1e03          	ldw	x,(OFST+1,sp)
 879  023a a30205        	cpw	x,#517
 880  023d 2715          	jreq	L65
 881  023f 1e03          	ldw	x,(OFST+1,sp)
 882  0241 a30244        	cpw	x,#580
 883  0244 270e          	jreq	L65
 884  0246 1e03          	ldw	x,(OFST+1,sp)
 885  0248 a30412        	cpw	x,#1042
 886  024b 2707          	jreq	L65
 887  024d 1e03          	ldw	x,(OFST+1,sp)
 888  024f a30346        	cpw	x,#838
 889  0252 2603          	jrne	L45
 890  0254               L65:
 891  0254 4f            	clr	a
 892  0255 2010          	jra	L06
 893  0257               L45:
 894  0257 ae00be        	ldw	x,#190
 895  025a 89            	pushw	x
 896  025b ae0000        	ldw	x,#0
 897  025e 89            	pushw	x
 898  025f ae0008        	ldw	x,#L741
 899  0262 cd0000        	call	_assert_failed
 901  0265 5b04          	addw	sp,#4
 902  0267               L06:
 903                     ; 191     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 905  0267 0d07          	tnz	(OFST+5,sp)
 906  0269 2706          	jreq	L46
 907  026b 7b07          	ld	a,(OFST+5,sp)
 908  026d a101          	cp	a,#1
 909  026f 2603          	jrne	L26
 910  0271               L46:
 911  0271 4f            	clr	a
 912  0272 2010          	jra	L66
 913  0274               L26:
 914  0274 ae00bf        	ldw	x,#191
 915  0277 89            	pushw	x
 916  0278 ae0000        	ldw	x,#0
 917  027b 89            	pushw	x
 918  027c ae0008        	ldw	x,#L741
 919  027f cd0000        	call	_assert_failed
 921  0282 5b04          	addw	sp,#4
 922  0284               L66:
 923                     ; 194     uartreg = (uint8_t)((uint16_t)UART3_IT >> 0x08);
 925  0284 7b03          	ld	a,(OFST+1,sp)
 926  0286 6b01          	ld	(OFST-1,sp),a
 927                     ; 197     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
 929  0288 7b04          	ld	a,(OFST+2,sp)
 930  028a a40f          	and	a,#15
 931  028c 5f            	clrw	x
 932  028d 97            	ld	xl,a
 933  028e a601          	ld	a,#1
 934  0290 5d            	tnzw	x
 935  0291 2704          	jreq	L07
 936  0293               L27:
 937  0293 48            	sll	a
 938  0294 5a            	decw	x
 939  0295 26fc          	jrne	L27
 940  0297               L07:
 941  0297 6b02          	ld	(OFST+0,sp),a
 942                     ; 199     if (NewState != DISABLE)
 944  0299 0d07          	tnz	(OFST+5,sp)
 945  029b 273a          	jreq	L372
 946                     ; 202         if (uartreg == 0x01)
 948  029d 7b01          	ld	a,(OFST-1,sp)
 949  029f a101          	cp	a,#1
 950  02a1 260a          	jrne	L572
 951                     ; 204             UART3->CR1 |= itpos;
 953  02a3 c65244        	ld	a,21060
 954  02a6 1a02          	or	a,(OFST+0,sp)
 955  02a8 c75244        	ld	21060,a
 957  02ab 2066          	jra	L113
 958  02ad               L572:
 959                     ; 206         else if (uartreg == 0x02)
 961  02ad 7b01          	ld	a,(OFST-1,sp)
 962  02af a102          	cp	a,#2
 963  02b1 260a          	jrne	L103
 964                     ; 208             UART3->CR2 |= itpos;
 966  02b3 c65245        	ld	a,21061
 967  02b6 1a02          	or	a,(OFST+0,sp)
 968  02b8 c75245        	ld	21061,a
 970  02bb 2056          	jra	L113
 971  02bd               L103:
 972                     ; 210         else if (uartreg == 0x03)
 974  02bd 7b01          	ld	a,(OFST-1,sp)
 975  02bf a103          	cp	a,#3
 976  02c1 260a          	jrne	L503
 977                     ; 212             UART3->CR4 |= itpos;
 979  02c3 c65247        	ld	a,21063
 980  02c6 1a02          	or	a,(OFST+0,sp)
 981  02c8 c75247        	ld	21063,a
 983  02cb 2046          	jra	L113
 984  02cd               L503:
 985                     ; 216             UART3->CR6 |= itpos;
 987  02cd c65249        	ld	a,21065
 988  02d0 1a02          	or	a,(OFST+0,sp)
 989  02d2 c75249        	ld	21065,a
 990  02d5 203c          	jra	L113
 991  02d7               L372:
 992                     ; 222         if (uartreg == 0x01)
 994  02d7 7b01          	ld	a,(OFST-1,sp)
 995  02d9 a101          	cp	a,#1
 996  02db 260b          	jrne	L313
 997                     ; 224             UART3->CR1 &= (uint8_t)(~itpos);
 999  02dd 7b02          	ld	a,(OFST+0,sp)
1000  02df 43            	cpl	a
1001  02e0 c45244        	and	a,21060
1002  02e3 c75244        	ld	21060,a
1004  02e6 202b          	jra	L113
1005  02e8               L313:
1006                     ; 226         else if (uartreg == 0x02)
1008  02e8 7b01          	ld	a,(OFST-1,sp)
1009  02ea a102          	cp	a,#2
1010  02ec 260b          	jrne	L713
1011                     ; 228             UART3->CR2 &= (uint8_t)(~itpos);
1013  02ee 7b02          	ld	a,(OFST+0,sp)
1014  02f0 43            	cpl	a
1015  02f1 c45245        	and	a,21061
1016  02f4 c75245        	ld	21061,a
1018  02f7 201a          	jra	L113
1019  02f9               L713:
1020                     ; 230         else if (uartreg == 0x03)
1022  02f9 7b01          	ld	a,(OFST-1,sp)
1023  02fb a103          	cp	a,#3
1024  02fd 260b          	jrne	L323
1025                     ; 232             UART3->CR4 &= (uint8_t)(~itpos);
1027  02ff 7b02          	ld	a,(OFST+0,sp)
1028  0301 43            	cpl	a
1029  0302 c45247        	and	a,21063
1030  0305 c75247        	ld	21063,a
1032  0308 2009          	jra	L113
1033  030a               L323:
1034                     ; 236             UART3->CR6 &= (uint8_t)(~itpos);
1036  030a 7b02          	ld	a,(OFST+0,sp)
1037  030c 43            	cpl	a
1038  030d c45249        	and	a,21065
1039  0310 c75249        	ld	21065,a
1040  0313               L113:
1041                     ; 239 }
1044  0313 5b04          	addw	sp,#4
1045  0315 81            	ret
1105                     ; 248 void UART3_LINBreakDetectionConfig(UART3_LINBreakDetectionLength_TypeDef UART3_LINBreakDetectionLength)
1105                     ; 249 {
1106                     	switch	.text
1107  0316               _UART3_LINBreakDetectionConfig:
1109  0316 88            	push	a
1110       00000000      OFST:	set	0
1113                     ; 251     assert_param(IS_UART3_LINBREAKDETECTIONLENGTH_OK(UART3_LINBreakDetectionLength));
1115  0317 4d            	tnz	a
1116  0318 2704          	jreq	L001
1117  031a a101          	cp	a,#1
1118  031c 2603          	jrne	L67
1119  031e               L001:
1120  031e 4f            	clr	a
1121  031f 2010          	jra	L201
1122  0321               L67:
1123  0321 ae00fb        	ldw	x,#251
1124  0324 89            	pushw	x
1125  0325 ae0000        	ldw	x,#0
1126  0328 89            	pushw	x
1127  0329 ae0008        	ldw	x,#L741
1128  032c cd0000        	call	_assert_failed
1130  032f 5b04          	addw	sp,#4
1131  0331               L201:
1132                     ; 253     if (UART3_LINBreakDetectionLength != UART3_LINBREAKDETECTIONLENGTH_10BITS)
1134  0331 0d01          	tnz	(OFST+1,sp)
1135  0333 2706          	jreq	L553
1136                     ; 255         UART3->CR4 |= UART3_CR4_LBDL;
1138  0335 721a5247      	bset	21063,#5
1140  0339 2004          	jra	L753
1141  033b               L553:
1142                     ; 259         UART3->CR4 &= ((uint8_t)~UART3_CR4_LBDL);
1144  033b 721b5247      	bres	21063,#5
1145  033f               L753:
1146                     ; 261 }
1149  033f 84            	pop	a
1150  0340 81            	ret
1272                     ; 273 void UART3_LINConfig(UART3_LinMode_TypeDef UART3_Mode,
1272                     ; 274                      UART3_LinAutosync_TypeDef UART3_Autosync, 
1272                     ; 275                      UART3_LinDivUp_TypeDef UART3_DivUp)
1272                     ; 276 {
1273                     	switch	.text
1274  0341               _UART3_LINConfig:
1276  0341 89            	pushw	x
1277       00000000      OFST:	set	0
1280                     ; 278     assert_param(IS_UART3_SLAVE_OK(UART3_Mode));
1282  0342 9e            	ld	a,xh
1283  0343 4d            	tnz	a
1284  0344 2705          	jreq	L011
1285  0346 9e            	ld	a,xh
1286  0347 a101          	cp	a,#1
1287  0349 2603          	jrne	L601
1288  034b               L011:
1289  034b 4f            	clr	a
1290  034c 2010          	jra	L211
1291  034e               L601:
1292  034e ae0116        	ldw	x,#278
1293  0351 89            	pushw	x
1294  0352 ae0000        	ldw	x,#0
1295  0355 89            	pushw	x
1296  0356 ae0008        	ldw	x,#L741
1297  0359 cd0000        	call	_assert_failed
1299  035c 5b04          	addw	sp,#4
1300  035e               L211:
1301                     ; 279     assert_param(IS_UART3_AUTOSYNC_OK(UART3_Autosync));
1303  035e 7b02          	ld	a,(OFST+2,sp)
1304  0360 a101          	cp	a,#1
1305  0362 2704          	jreq	L611
1306  0364 0d02          	tnz	(OFST+2,sp)
1307  0366 2603          	jrne	L411
1308  0368               L611:
1309  0368 4f            	clr	a
1310  0369 2010          	jra	L021
1311  036b               L411:
1312  036b ae0117        	ldw	x,#279
1313  036e 89            	pushw	x
1314  036f ae0000        	ldw	x,#0
1315  0372 89            	pushw	x
1316  0373 ae0008        	ldw	x,#L741
1317  0376 cd0000        	call	_assert_failed
1319  0379 5b04          	addw	sp,#4
1320  037b               L021:
1321                     ; 280     assert_param(IS_UART3_DIVUP_OK(UART3_DivUp));
1323  037b 0d05          	tnz	(OFST+5,sp)
1324  037d 2706          	jreq	L421
1325  037f 7b05          	ld	a,(OFST+5,sp)
1326  0381 a101          	cp	a,#1
1327  0383 2603          	jrne	L221
1328  0385               L421:
1329  0385 4f            	clr	a
1330  0386 2010          	jra	L621
1331  0388               L221:
1332  0388 ae0118        	ldw	x,#280
1333  038b 89            	pushw	x
1334  038c ae0000        	ldw	x,#0
1335  038f 89            	pushw	x
1336  0390 ae0008        	ldw	x,#L741
1337  0393 cd0000        	call	_assert_failed
1339  0396 5b04          	addw	sp,#4
1340  0398               L621:
1341                     ; 282     if (UART3_Mode != UART3_LIN_MODE_MASTER)
1343  0398 0d01          	tnz	(OFST+1,sp)
1344  039a 2706          	jreq	L734
1345                     ; 284         UART3->CR6 |=  UART3_CR6_LSLV;
1347  039c 721a5249      	bset	21065,#5
1349  03a0 2004          	jra	L144
1350  03a2               L734:
1351                     ; 288         UART3->CR6 &= ((uint8_t)~UART3_CR6_LSLV);
1353  03a2 721b5249      	bres	21065,#5
1354  03a6               L144:
1355                     ; 291     if (UART3_Autosync != UART3_LIN_AUTOSYNC_DISABLE)
1357  03a6 0d02          	tnz	(OFST+2,sp)
1358  03a8 2706          	jreq	L344
1359                     ; 293         UART3->CR6 |=  UART3_CR6_LASE ;
1361  03aa 72185249      	bset	21065,#4
1363  03ae 2004          	jra	L544
1364  03b0               L344:
1365                     ; 297         UART3->CR6 &= ((uint8_t)~ UART3_CR6_LASE );
1367  03b0 72195249      	bres	21065,#4
1368  03b4               L544:
1369                     ; 300     if (UART3_DivUp != UART3_LIN_DIVUP_LBRR1)
1371  03b4 0d05          	tnz	(OFST+5,sp)
1372  03b6 2706          	jreq	L744
1373                     ; 302         UART3->CR6 |=  UART3_CR6_LDUM;
1375  03b8 721e5249      	bset	21065,#7
1377  03bc 2004          	jra	L154
1378  03be               L744:
1379                     ; 306         UART3->CR6 &= ((uint8_t)~ UART3_CR6_LDUM);
1381  03be 721f5249      	bres	21065,#7
1382  03c2               L154:
1383                     ; 308 }
1386  03c2 85            	popw	x
1387  03c3 81            	ret
1423                     ; 316 void UART3_LINCmd(FunctionalState NewState)
1423                     ; 317 {
1424                     	switch	.text
1425  03c4               _UART3_LINCmd:
1427  03c4 88            	push	a
1428       00000000      OFST:	set	0
1431                     ; 319     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1433  03c5 4d            	tnz	a
1434  03c6 2704          	jreq	L431
1435  03c8 a101          	cp	a,#1
1436  03ca 2603          	jrne	L231
1437  03cc               L431:
1438  03cc 4f            	clr	a
1439  03cd 2010          	jra	L631
1440  03cf               L231:
1441  03cf ae013f        	ldw	x,#319
1442  03d2 89            	pushw	x
1443  03d3 ae0000        	ldw	x,#0
1444  03d6 89            	pushw	x
1445  03d7 ae0008        	ldw	x,#L741
1446  03da cd0000        	call	_assert_failed
1448  03dd 5b04          	addw	sp,#4
1449  03df               L631:
1450                     ; 321     if (NewState != DISABLE)
1452  03df 0d01          	tnz	(OFST+1,sp)
1453  03e1 2706          	jreq	L174
1454                     ; 324         UART3->CR3 |= UART3_CR3_LINEN;
1456  03e3 721c5246      	bset	21062,#6
1458  03e7 2004          	jra	L374
1459  03e9               L174:
1460                     ; 329         UART3->CR3 &= ((uint8_t)~UART3_CR3_LINEN);
1462  03e9 721d5246      	bres	21062,#6
1463  03ed               L374:
1464                     ; 331 }
1467  03ed 84            	pop	a
1468  03ee 81            	ret
1526                     ; 339 void UART3_WakeUpConfig(UART3_WakeUp_TypeDef UART3_WakeUp)
1526                     ; 340 {
1527                     	switch	.text
1528  03ef               _UART3_WakeUpConfig:
1530  03ef 88            	push	a
1531       00000000      OFST:	set	0
1534                     ; 342     assert_param(IS_UART3_WAKEUP_OK(UART3_WakeUp));
1536  03f0 4d            	tnz	a
1537  03f1 2704          	jreq	L441
1538  03f3 a108          	cp	a,#8
1539  03f5 2603          	jrne	L241
1540  03f7               L441:
1541  03f7 4f            	clr	a
1542  03f8 2010          	jra	L641
1543  03fa               L241:
1544  03fa ae0156        	ldw	x,#342
1545  03fd 89            	pushw	x
1546  03fe ae0000        	ldw	x,#0
1547  0401 89            	pushw	x
1548  0402 ae0008        	ldw	x,#L741
1549  0405 cd0000        	call	_assert_failed
1551  0408 5b04          	addw	sp,#4
1552  040a               L641:
1553                     ; 344     UART3->CR1 &= ((uint8_t)~UART3_CR1_WAKE);
1555  040a 72175244      	bres	21060,#3
1556                     ; 345     UART3->CR1 |= (uint8_t)UART3_WakeUp;
1558  040e c65244        	ld	a,21060
1559  0411 1a01          	or	a,(OFST+1,sp)
1560  0413 c75244        	ld	21060,a
1561                     ; 346 }
1564  0416 84            	pop	a
1565  0417 81            	ret
1602                     ; 354 void UART3_ReceiverWakeUpCmd(FunctionalState NewState)
1602                     ; 355 {
1603                     	switch	.text
1604  0418               _UART3_ReceiverWakeUpCmd:
1606  0418 88            	push	a
1607       00000000      OFST:	set	0
1610                     ; 357     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1612  0419 4d            	tnz	a
1613  041a 2704          	jreq	L451
1614  041c a101          	cp	a,#1
1615  041e 2603          	jrne	L251
1616  0420               L451:
1617  0420 4f            	clr	a
1618  0421 2010          	jra	L651
1619  0423               L251:
1620  0423 ae0165        	ldw	x,#357
1621  0426 89            	pushw	x
1622  0427 ae0000        	ldw	x,#0
1623  042a 89            	pushw	x
1624  042b ae0008        	ldw	x,#L741
1625  042e cd0000        	call	_assert_failed
1627  0431 5b04          	addw	sp,#4
1628  0433               L651:
1629                     ; 359     if (NewState != DISABLE)
1631  0433 0d01          	tnz	(OFST+1,sp)
1632  0435 2706          	jreq	L145
1633                     ; 362         UART3->CR2 |= UART3_CR2_RWU;
1635  0437 72125245      	bset	21061,#1
1637  043b 2004          	jra	L345
1638  043d               L145:
1639                     ; 367         UART3->CR2 &= ((uint8_t)~UART3_CR2_RWU);
1641  043d 72135245      	bres	21061,#1
1642  0441               L345:
1643                     ; 369 }
1646  0441 84            	pop	a
1647  0442 81            	ret
1670                     ; 376 uint8_t UART3_ReceiveData8(void)
1670                     ; 377 {
1671                     	switch	.text
1672  0443               _UART3_ReceiveData8:
1676                     ; 378     return ((uint8_t)UART3->DR);
1678  0443 c65241        	ld	a,21057
1681  0446 81            	ret
1715                     ; 386 uint16_t UART3_ReceiveData9(void)
1715                     ; 387 {
1716                     	switch	.text
1717  0447               _UART3_ReceiveData9:
1719  0447 89            	pushw	x
1720       00000002      OFST:	set	2
1723                     ; 388   uint16_t temp = 0;
1725  0448 5f            	clrw	x
1726  0449 1f01          	ldw	(OFST-1,sp),x
1727                     ; 390  temp = (uint16_t)(((uint16_t)((uint16_t)UART3->CR1 & (uint16_t)UART3_CR1_R8)) << 1);
1729  044b c65244        	ld	a,21060
1730  044e 5f            	clrw	x
1731  044f a480          	and	a,#128
1732  0451 5f            	clrw	x
1733  0452 02            	rlwa	x,a
1734  0453 58            	sllw	x
1735  0454 1f01          	ldw	(OFST-1,sp),x
1736                     ; 391   return (uint16_t)((((uint16_t)UART3->DR) | temp) & ((uint16_t)0x01FF));
1738  0456 c65241        	ld	a,21057
1739  0459 5f            	clrw	x
1740  045a 97            	ld	xl,a
1741  045b 01            	rrwa	x,a
1742  045c 1a02          	or	a,(OFST+0,sp)
1743  045e 01            	rrwa	x,a
1744  045f 1a01          	or	a,(OFST-1,sp)
1745  0461 01            	rrwa	x,a
1746  0462 01            	rrwa	x,a
1747  0463 a4ff          	and	a,#255
1748  0465 01            	rrwa	x,a
1749  0466 a401          	and	a,#1
1750  0468 01            	rrwa	x,a
1753  0469 5b02          	addw	sp,#2
1754  046b 81            	ret
1788                     ; 399 void UART3_SendData8(uint8_t Data)
1788                     ; 400 {
1789                     	switch	.text
1790  046c               _UART3_SendData8:
1794                     ; 402     UART3->DR = Data;
1796  046c c75241        	ld	21057,a
1797                     ; 403 }
1800  046f 81            	ret
1834                     ; 410 void UART3_SendData9(uint16_t Data)
1834                     ; 411 {
1835                     	switch	.text
1836  0470               _UART3_SendData9:
1838  0470 89            	pushw	x
1839       00000000      OFST:	set	0
1842                     ; 413     UART3->CR1 &= ((uint8_t)~UART3_CR1_T8);                  
1844  0471 721d5244      	bres	21060,#6
1845                     ; 416     UART3->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART3_CR1_T8); 
1847  0475 54            	srlw	x
1848  0476 54            	srlw	x
1849  0477 9f            	ld	a,xl
1850  0478 a440          	and	a,#64
1851  047a ca5244        	or	a,21060
1852  047d c75244        	ld	21060,a
1853                     ; 419     UART3->DR   = (uint8_t)(Data);                    
1855  0480 7b02          	ld	a,(OFST+2,sp)
1856  0482 c75241        	ld	21057,a
1857                     ; 420 }
1860  0485 85            	popw	x
1861  0486 81            	ret
1884                     ; 427 void UART3_SendBreak(void)
1884                     ; 428 {
1885                     	switch	.text
1886  0487               _UART3_SendBreak:
1890                     ; 429     UART3->CR2 |= UART3_CR2_SBK;
1892  0487 72105245      	bset	21061,#0
1893                     ; 430 }
1896  048b 81            	ret
1931                     ; 437 void UART3_SetAddress(uint8_t UART3_Address)
1931                     ; 438 {
1932                     	switch	.text
1933  048c               _UART3_SetAddress:
1935  048c 88            	push	a
1936       00000000      OFST:	set	0
1939                     ; 440     assert_param(IS_UART3_ADDRESS_OK(UART3_Address));
1941  048d a110          	cp	a,#16
1942  048f 2403          	jruge	L471
1943  0491 4f            	clr	a
1944  0492 2010          	jra	L671
1945  0494               L471:
1946  0494 ae01b8        	ldw	x,#440
1947  0497 89            	pushw	x
1948  0498 ae0000        	ldw	x,#0
1949  049b 89            	pushw	x
1950  049c ae0008        	ldw	x,#L741
1951  049f cd0000        	call	_assert_failed
1953  04a2 5b04          	addw	sp,#4
1954  04a4               L671:
1955                     ; 443     UART3->CR4 &= ((uint8_t)~UART3_CR4_ADD);
1957  04a4 c65247        	ld	a,21063
1958  04a7 a4f0          	and	a,#240
1959  04a9 c75247        	ld	21063,a
1960                     ; 445     UART3->CR4 |= UART3_Address;
1962  04ac c65247        	ld	a,21063
1963  04af 1a01          	or	a,(OFST+1,sp)
1964  04b1 c75247        	ld	21063,a
1965                     ; 446 }
1968  04b4 84            	pop	a
1969  04b5 81            	ret
2127                     ; 454 FlagStatus UART3_GetFlagStatus(UART3_Flag_TypeDef UART3_FLAG)
2127                     ; 455 {
2128                     	switch	.text
2129  04b6               _UART3_GetFlagStatus:
2131  04b6 89            	pushw	x
2132  04b7 88            	push	a
2133       00000001      OFST:	set	1
2136                     ; 456     FlagStatus status = RESET;
2138  04b8 0f01          	clr	(OFST+0,sp)
2139                     ; 459     assert_param(IS_UART3_FLAG_OK(UART3_FLAG));
2141  04ba a30080        	cpw	x,#128
2142  04bd 2737          	jreq	L402
2143  04bf a30040        	cpw	x,#64
2144  04c2 2732          	jreq	L402
2145  04c4 a30020        	cpw	x,#32
2146  04c7 272d          	jreq	L402
2147  04c9 a30010        	cpw	x,#16
2148  04cc 2728          	jreq	L402
2149  04ce a30008        	cpw	x,#8
2150  04d1 2723          	jreq	L402
2151  04d3 a30004        	cpw	x,#4
2152  04d6 271e          	jreq	L402
2153  04d8 a30002        	cpw	x,#2
2154  04db 2719          	jreq	L402
2155  04dd a30001        	cpw	x,#1
2156  04e0 2714          	jreq	L402
2157  04e2 a30101        	cpw	x,#257
2158  04e5 270f          	jreq	L402
2159  04e7 a30301        	cpw	x,#769
2160  04ea 270a          	jreq	L402
2161  04ec a30302        	cpw	x,#770
2162  04ef 2705          	jreq	L402
2163  04f1 a30210        	cpw	x,#528
2164  04f4 2603          	jrne	L202
2165  04f6               L402:
2166  04f6 4f            	clr	a
2167  04f7 2010          	jra	L602
2168  04f9               L202:
2169  04f9 ae01cb        	ldw	x,#459
2170  04fc 89            	pushw	x
2171  04fd ae0000        	ldw	x,#0
2172  0500 89            	pushw	x
2173  0501 ae0008        	ldw	x,#L741
2174  0504 cd0000        	call	_assert_failed
2176  0507 5b04          	addw	sp,#4
2177  0509               L602:
2178                     ; 462     if (UART3_FLAG == UART3_FLAG_LBDF)
2180  0509 1e02          	ldw	x,(OFST+1,sp)
2181  050b a30210        	cpw	x,#528
2182  050e 2611          	jrne	L347
2183                     ; 464         if ((UART3->CR4 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2185  0510 c65247        	ld	a,21063
2186  0513 1503          	bcp	a,(OFST+2,sp)
2187  0515 2706          	jreq	L547
2188                     ; 467             status = SET;
2190  0517 a601          	ld	a,#1
2191  0519 6b01          	ld	(OFST+0,sp),a
2193  051b 2039          	jra	L157
2194  051d               L547:
2195                     ; 472             status = RESET;
2197  051d 0f01          	clr	(OFST+0,sp)
2198  051f 2035          	jra	L157
2199  0521               L347:
2200                     ; 475     else if (UART3_FLAG == UART3_FLAG_SBK)
2202  0521 1e02          	ldw	x,(OFST+1,sp)
2203  0523 a30101        	cpw	x,#257
2204  0526 2611          	jrne	L357
2205                     ; 477         if ((UART3->CR2 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2207  0528 c65245        	ld	a,21061
2208  052b 1503          	bcp	a,(OFST+2,sp)
2209  052d 2706          	jreq	L557
2210                     ; 480             status = SET;
2212  052f a601          	ld	a,#1
2213  0531 6b01          	ld	(OFST+0,sp),a
2215  0533 2021          	jra	L157
2216  0535               L557:
2217                     ; 485             status = RESET;
2219  0535 0f01          	clr	(OFST+0,sp)
2220  0537 201d          	jra	L157
2221  0539               L357:
2222                     ; 488     else if ((UART3_FLAG == UART3_FLAG_LHDF) || (UART3_FLAG == UART3_FLAG_LSF))
2224  0539 1e02          	ldw	x,(OFST+1,sp)
2225  053b a30302        	cpw	x,#770
2226  053e 2707          	jreq	L567
2228  0540 1e02          	ldw	x,(OFST+1,sp)
2229  0542 a30301        	cpw	x,#769
2230  0545 2614          	jrne	L367
2231  0547               L567:
2232                     ; 490         if ((UART3->CR6 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2234  0547 c65249        	ld	a,21065
2235  054a 1503          	bcp	a,(OFST+2,sp)
2236  054c 2706          	jreq	L767
2237                     ; 493             status = SET;
2239  054e a601          	ld	a,#1
2240  0550 6b01          	ld	(OFST+0,sp),a
2242  0552 2002          	jra	L157
2243  0554               L767:
2244                     ; 498             status = RESET;
2246  0554 0f01          	clr	(OFST+0,sp)
2247  0556               L157:
2248                     ; 516     return  status;
2250  0556 7b01          	ld	a,(OFST+0,sp)
2253  0558 5b03          	addw	sp,#3
2254  055a 81            	ret
2255  055b               L367:
2256                     ; 503         if ((UART3->SR & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
2258  055b c65240        	ld	a,21056
2259  055e 1503          	bcp	a,(OFST+2,sp)
2260  0560 2706          	jreq	L577
2261                     ; 506             status = SET;
2263  0562 a601          	ld	a,#1
2264  0564 6b01          	ld	(OFST+0,sp),a
2266  0566 20ee          	jra	L157
2267  0568               L577:
2268                     ; 511             status = RESET;
2270  0568 0f01          	clr	(OFST+0,sp)
2271  056a 20ea          	jra	L157
2307                     ; 546 void UART3_ClearFlag(UART3_Flag_TypeDef UART3_FLAG)
2307                     ; 547 {
2308                     	switch	.text
2309  056c               _UART3_ClearFlag:
2311  056c 89            	pushw	x
2312       00000000      OFST:	set	0
2315                     ; 549     assert_param(IS_UART3_CLEAR_FLAG_OK(UART3_FLAG));
2317  056d a30020        	cpw	x,#32
2318  0570 270f          	jreq	L412
2319  0572 a30302        	cpw	x,#770
2320  0575 270a          	jreq	L412
2321  0577 a30301        	cpw	x,#769
2322  057a 2705          	jreq	L412
2323  057c a30210        	cpw	x,#528
2324  057f 2603          	jrne	L212
2325  0581               L412:
2326  0581 4f            	clr	a
2327  0582 2010          	jra	L612
2328  0584               L212:
2329  0584 ae0225        	ldw	x,#549
2330  0587 89            	pushw	x
2331  0588 ae0000        	ldw	x,#0
2332  058b 89            	pushw	x
2333  058c ae0008        	ldw	x,#L741
2334  058f cd0000        	call	_assert_failed
2336  0592 5b04          	addw	sp,#4
2337  0594               L612:
2338                     ; 552     if (UART3_FLAG == UART3_FLAG_RXNE)
2340  0594 1e01          	ldw	x,(OFST+1,sp)
2341  0596 a30020        	cpw	x,#32
2342  0599 2606          	jrne	L7101
2343                     ; 554         UART3->SR = (uint8_t)~(UART3_SR_RXNE);
2345  059b 35df5240      	mov	21056,#223
2347  059f 201e          	jra	L1201
2348  05a1               L7101:
2349                     ; 557     else if (UART3_FLAG == UART3_FLAG_LBDF)
2351  05a1 1e01          	ldw	x,(OFST+1,sp)
2352  05a3 a30210        	cpw	x,#528
2353  05a6 2606          	jrne	L3201
2354                     ; 559         UART3->CR4 &= (uint8_t)(~UART3_CR4_LBDF);
2356  05a8 72195247      	bres	21063,#4
2358  05ac 2011          	jra	L1201
2359  05ae               L3201:
2360                     ; 562     else if (UART3_FLAG == UART3_FLAG_LHDF)
2362  05ae 1e01          	ldw	x,(OFST+1,sp)
2363  05b0 a30302        	cpw	x,#770
2364  05b3 2606          	jrne	L7201
2365                     ; 564         UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
2367  05b5 72135249      	bres	21065,#1
2369  05b9 2004          	jra	L1201
2370  05bb               L7201:
2371                     ; 569         UART3->CR6 &= (uint8_t)(~UART3_CR6_LSF);
2373  05bb 72115249      	bres	21065,#0
2374  05bf               L1201:
2375                     ; 571 }
2378  05bf 85            	popw	x
2379  05c0 81            	ret
2462                     ; 586 ITStatus UART3_GetITStatus(UART3_IT_TypeDef UART3_IT)
2462                     ; 587 {
2463                     	switch	.text
2464  05c1               _UART3_GetITStatus:
2466  05c1 89            	pushw	x
2467  05c2 89            	pushw	x
2468       00000002      OFST:	set	2
2471                     ; 588     ITStatus pendingbitstatus = RESET;
2473  05c3 7b02          	ld	a,(OFST+0,sp)
2474  05c5 97            	ld	xl,a
2475                     ; 589     uint8_t itpos = 0;
2477  05c6 7b01          	ld	a,(OFST-1,sp)
2478  05c8 97            	ld	xl,a
2479                     ; 590     uint8_t itmask1 = 0;
2481  05c9 7b02          	ld	a,(OFST+0,sp)
2482  05cb 97            	ld	xl,a
2483                     ; 591     uint8_t itmask2 = 0;
2485  05cc 7b02          	ld	a,(OFST+0,sp)
2486  05ce 97            	ld	xl,a
2487                     ; 592     uint8_t enablestatus = 0;
2489  05cf 7b02          	ld	a,(OFST+0,sp)
2490  05d1 97            	ld	xl,a
2491                     ; 595     assert_param(IS_UART3_GET_IT_OK(UART3_IT));
2493  05d2 1e03          	ldw	x,(OFST+1,sp)
2494  05d4 a30277        	cpw	x,#631
2495  05d7 2731          	jreq	L422
2496  05d9 1e03          	ldw	x,(OFST+1,sp)
2497  05db a30266        	cpw	x,#614
2498  05de 272a          	jreq	L422
2499  05e0 1e03          	ldw	x,(OFST+1,sp)
2500  05e2 a30255        	cpw	x,#597
2501  05e5 2723          	jreq	L422
2502  05e7 1e03          	ldw	x,(OFST+1,sp)
2503  05e9 a30244        	cpw	x,#580
2504  05ec 271c          	jreq	L422
2505  05ee 1e03          	ldw	x,(OFST+1,sp)
2506  05f0 a30235        	cpw	x,#565
2507  05f3 2715          	jreq	L422
2508  05f5 1e03          	ldw	x,(OFST+1,sp)
2509  05f7 a30346        	cpw	x,#838
2510  05fa 270e          	jreq	L422
2511  05fc 1e03          	ldw	x,(OFST+1,sp)
2512  05fe a30412        	cpw	x,#1042
2513  0601 2707          	jreq	L422
2514  0603 1e03          	ldw	x,(OFST+1,sp)
2515  0605 a30100        	cpw	x,#256
2516  0608 2603          	jrne	L222
2517  060a               L422:
2518  060a 4f            	clr	a
2519  060b 2010          	jra	L622
2520  060d               L222:
2521  060d ae0253        	ldw	x,#595
2522  0610 89            	pushw	x
2523  0611 ae0000        	ldw	x,#0
2524  0614 89            	pushw	x
2525  0615 ae0008        	ldw	x,#L741
2526  0618 cd0000        	call	_assert_failed
2528  061b 5b04          	addw	sp,#4
2529  061d               L622:
2530                     ; 598     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
2532  061d 7b04          	ld	a,(OFST+2,sp)
2533  061f a40f          	and	a,#15
2534  0621 5f            	clrw	x
2535  0622 97            	ld	xl,a
2536  0623 a601          	ld	a,#1
2537  0625 5d            	tnzw	x
2538  0626 2704          	jreq	L032
2539  0628               L232:
2540  0628 48            	sll	a
2541  0629 5a            	decw	x
2542  062a 26fc          	jrne	L232
2543  062c               L032:
2544  062c 6b01          	ld	(OFST-1,sp),a
2545                     ; 600     itmask1 = (uint8_t)((uint8_t)UART3_IT >> (uint8_t)4);
2547  062e 7b04          	ld	a,(OFST+2,sp)
2548  0630 4e            	swap	a
2549  0631 a40f          	and	a,#15
2550  0633 6b02          	ld	(OFST+0,sp),a
2551                     ; 602     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2553  0635 7b02          	ld	a,(OFST+0,sp)
2554  0637 5f            	clrw	x
2555  0638 97            	ld	xl,a
2556  0639 a601          	ld	a,#1
2557  063b 5d            	tnzw	x
2558  063c 2704          	jreq	L432
2559  063e               L632:
2560  063e 48            	sll	a
2561  063f 5a            	decw	x
2562  0640 26fc          	jrne	L632
2563  0642               L432:
2564  0642 6b02          	ld	(OFST+0,sp),a
2565                     ; 605     if (UART3_IT == UART3_IT_PE)
2567  0644 1e03          	ldw	x,(OFST+1,sp)
2568  0646 a30100        	cpw	x,#256
2569  0649 261c          	jrne	L5701
2570                     ; 608         enablestatus = (uint8_t)((uint8_t)UART3->CR1 & itmask2);
2572  064b c65244        	ld	a,21060
2573  064e 1402          	and	a,(OFST+0,sp)
2574  0650 6b02          	ld	(OFST+0,sp),a
2575                     ; 611         if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
2577  0652 c65240        	ld	a,21056
2578  0655 1501          	bcp	a,(OFST-1,sp)
2579  0657 270a          	jreq	L7701
2581  0659 0d02          	tnz	(OFST+0,sp)
2582  065b 2706          	jreq	L7701
2583                     ; 614             pendingbitstatus = SET;
2585  065d a601          	ld	a,#1
2586  065f 6b02          	ld	(OFST+0,sp),a
2588  0661 2064          	jra	L3011
2589  0663               L7701:
2590                     ; 619             pendingbitstatus = RESET;
2592  0663 0f02          	clr	(OFST+0,sp)
2593  0665 2060          	jra	L3011
2594  0667               L5701:
2595                     ; 622     else if (UART3_IT == UART3_IT_LBDF)
2597  0667 1e03          	ldw	x,(OFST+1,sp)
2598  0669 a30346        	cpw	x,#838
2599  066c 261c          	jrne	L5011
2600                     ; 625         enablestatus = (uint8_t)((uint8_t)UART3->CR4 & itmask2);
2602  066e c65247        	ld	a,21063
2603  0671 1402          	and	a,(OFST+0,sp)
2604  0673 6b02          	ld	(OFST+0,sp),a
2605                     ; 627         if (((UART3->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2607  0675 c65247        	ld	a,21063
2608  0678 1501          	bcp	a,(OFST-1,sp)
2609  067a 270a          	jreq	L7011
2611  067c 0d02          	tnz	(OFST+0,sp)
2612  067e 2706          	jreq	L7011
2613                     ; 630             pendingbitstatus = SET;
2615  0680 a601          	ld	a,#1
2616  0682 6b02          	ld	(OFST+0,sp),a
2618  0684 2041          	jra	L3011
2619  0686               L7011:
2620                     ; 635             pendingbitstatus = RESET;
2622  0686 0f02          	clr	(OFST+0,sp)
2623  0688 203d          	jra	L3011
2624  068a               L5011:
2625                     ; 638     else if (UART3_IT == UART3_IT_LHDF)
2627  068a 1e03          	ldw	x,(OFST+1,sp)
2628  068c a30412        	cpw	x,#1042
2629  068f 261c          	jrne	L5111
2630                     ; 641         enablestatus = (uint8_t)((uint8_t)UART3->CR6 & itmask2);
2632  0691 c65249        	ld	a,21065
2633  0694 1402          	and	a,(OFST+0,sp)
2634  0696 6b02          	ld	(OFST+0,sp),a
2635                     ; 643         if (((UART3->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
2637  0698 c65249        	ld	a,21065
2638  069b 1501          	bcp	a,(OFST-1,sp)
2639  069d 270a          	jreq	L7111
2641  069f 0d02          	tnz	(OFST+0,sp)
2642  06a1 2706          	jreq	L7111
2643                     ; 646             pendingbitstatus = SET;
2645  06a3 a601          	ld	a,#1
2646  06a5 6b02          	ld	(OFST+0,sp),a
2648  06a7 201e          	jra	L3011
2649  06a9               L7111:
2650                     ; 651             pendingbitstatus = RESET;
2652  06a9 0f02          	clr	(OFST+0,sp)
2653  06ab 201a          	jra	L3011
2654  06ad               L5111:
2655                     ; 657         enablestatus = (uint8_t)((uint8_t)UART3->CR2 & itmask2);
2657  06ad c65245        	ld	a,21061
2658  06b0 1402          	and	a,(OFST+0,sp)
2659  06b2 6b02          	ld	(OFST+0,sp),a
2660                     ; 659         if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
2662  06b4 c65240        	ld	a,21056
2663  06b7 1501          	bcp	a,(OFST-1,sp)
2664  06b9 270a          	jreq	L5211
2666  06bb 0d02          	tnz	(OFST+0,sp)
2667  06bd 2706          	jreq	L5211
2668                     ; 662             pendingbitstatus = SET;
2670  06bf a601          	ld	a,#1
2671  06c1 6b02          	ld	(OFST+0,sp),a
2673  06c3 2002          	jra	L3011
2674  06c5               L5211:
2675                     ; 667             pendingbitstatus = RESET;
2677  06c5 0f02          	clr	(OFST+0,sp)
2678  06c7               L3011:
2679                     ; 671     return  pendingbitstatus;
2681  06c7 7b02          	ld	a,(OFST+0,sp)
2684  06c9 5b04          	addw	sp,#4
2685  06cb 81            	ret
2722                     ; 701 void UART3_ClearITPendingBit(UART3_IT_TypeDef UART3_IT)
2722                     ; 702 {
2723                     	switch	.text
2724  06cc               _UART3_ClearITPendingBit:
2726  06cc 89            	pushw	x
2727       00000000      OFST:	set	0
2730                     ; 704     assert_param(IS_UART3_CLEAR_IT_OK(UART3_IT));
2732  06cd a30255        	cpw	x,#597
2733  06d0 270a          	jreq	L442
2734  06d2 a30412        	cpw	x,#1042
2735  06d5 2705          	jreq	L442
2736  06d7 a30346        	cpw	x,#838
2737  06da 2603          	jrne	L242
2738  06dc               L442:
2739  06dc 4f            	clr	a
2740  06dd 2010          	jra	L642
2741  06df               L242:
2742  06df ae02c0        	ldw	x,#704
2743  06e2 89            	pushw	x
2744  06e3 ae0000        	ldw	x,#0
2745  06e6 89            	pushw	x
2746  06e7 ae0008        	ldw	x,#L741
2747  06ea cd0000        	call	_assert_failed
2749  06ed 5b04          	addw	sp,#4
2750  06ef               L642:
2751                     ; 707     if (UART3_IT == UART3_IT_RXNE)
2753  06ef 1e01          	ldw	x,(OFST+1,sp)
2754  06f1 a30255        	cpw	x,#597
2755  06f4 2606          	jrne	L7411
2756                     ; 709         UART3->SR = (uint8_t)~(UART3_SR_RXNE);
2758  06f6 35df5240      	mov	21056,#223
2760  06fa 2011          	jra	L1511
2761  06fc               L7411:
2762                     ; 712     else if (UART3_IT == UART3_IT_LBDF)
2764  06fc 1e01          	ldw	x,(OFST+1,sp)
2765  06fe a30346        	cpw	x,#838
2766  0701 2606          	jrne	L3511
2767                     ; 714         UART3->CR4 &= (uint8_t)~(UART3_CR4_LBDF);
2769  0703 72195247      	bres	21063,#4
2771  0707 2004          	jra	L1511
2772  0709               L3511:
2773                     ; 719         UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
2775  0709 72135249      	bres	21065,#1
2776  070d               L1511:
2777                     ; 721 }
2780  070d 85            	popw	x
2781  070e 81            	ret
2794                     	xdef	_UART3_ClearITPendingBit
2795                     	xdef	_UART3_GetITStatus
2796                     	xdef	_UART3_ClearFlag
2797                     	xdef	_UART3_GetFlagStatus
2798                     	xdef	_UART3_SetAddress
2799                     	xdef	_UART3_SendBreak
2800                     	xdef	_UART3_SendData9
2801                     	xdef	_UART3_SendData8
2802                     	xdef	_UART3_ReceiveData9
2803                     	xdef	_UART3_ReceiveData8
2804                     	xdef	_UART3_WakeUpConfig
2805                     	xdef	_UART3_ReceiverWakeUpCmd
2806                     	xdef	_UART3_LINCmd
2807                     	xdef	_UART3_LINConfig
2808                     	xdef	_UART3_LINBreakDetectionConfig
2809                     	xdef	_UART3_ITConfig
2810                     	xdef	_UART3_Cmd
2811                     	xdef	_UART3_Init
2812                     	xdef	_UART3_DeInit
2813                     	xref	_assert_failed
2814                     	xref	_CLK_GetClockFreq
2815                     	switch	.const
2816  0008               L741:
2817  0008 66776c69625c  	dc.b	"fwlib\src\stm8s_ua"
2818  001a 7274332e6300  	dc.b	"rt3.c",0
2819                     	xref.b	c_lreg
2839                     	xref	c_lursh
2840                     	xref	c_lsub
2841                     	xref	c_smul
2842                     	xref	c_ludv
2843                     	xref	c_rtol
2844                     	xref	c_llsh
2845                     	xref	c_lcmp
2846                     	xref	c_ltor
2847                     	end
