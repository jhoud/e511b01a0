   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 45 void TIM3_DeInit(void)
  32                     ; 46 {
  34                     	switch	.text
  35  0000               _TIM3_DeInit:
  39                     ; 48     TIM3->CR1 = (uint8_t)TIM3_CR1_RESET_VALUE;
  41  0000 725f5320      	clr	21280
  42                     ; 49     TIM3->IER = (uint8_t)TIM3_IER_RESET_VALUE;
  44  0004 725f5321      	clr	21281
  45                     ; 50     TIM3->SR2 = (uint8_t)TIM3_SR2_RESET_VALUE;
  47  0008 725f5323      	clr	21283
  48                     ; 53     TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  50  000c 725f5327      	clr	21287
  51                     ; 56     TIM3->CCER1 = (uint8_t)TIM3_CCER1_RESET_VALUE;
  53  0010 725f5327      	clr	21287
  54                     ; 57     TIM3->CCMR1 = (uint8_t)TIM3_CCMR1_RESET_VALUE;
  56  0014 725f5325      	clr	21285
  57                     ; 58     TIM3->CCMR2 = (uint8_t)TIM3_CCMR2_RESET_VALUE;
  59  0018 725f5326      	clr	21286
  60                     ; 59     TIM3->CNTRH = (uint8_t)TIM3_CNTRH_RESET_VALUE;
  62  001c 725f5328      	clr	21288
  63                     ; 60     TIM3->CNTRL = (uint8_t)TIM3_CNTRL_RESET_VALUE;
  65  0020 725f5329      	clr	21289
  66                     ; 61     TIM3->PSCR = (uint8_t)TIM3_PSCR_RESET_VALUE;
  68  0024 725f532a      	clr	21290
  69                     ; 62     TIM3->ARRH  = (uint8_t)TIM3_ARRH_RESET_VALUE;
  71  0028 35ff532b      	mov	21291,#255
  72                     ; 63     TIM3->ARRL  = (uint8_t)TIM3_ARRL_RESET_VALUE;
  74  002c 35ff532c      	mov	21292,#255
  75                     ; 64     TIM3->CCR1H = (uint8_t)TIM3_CCR1H_RESET_VALUE;
  77  0030 725f532d      	clr	21293
  78                     ; 65     TIM3->CCR1L = (uint8_t)TIM3_CCR1L_RESET_VALUE;
  80  0034 725f532e      	clr	21294
  81                     ; 66     TIM3->CCR2H = (uint8_t)TIM3_CCR2H_RESET_VALUE;
  83  0038 725f532f      	clr	21295
  84                     ; 67     TIM3->CCR2L = (uint8_t)TIM3_CCR2L_RESET_VALUE;
  86  003c 725f5330      	clr	21296
  87                     ; 68     TIM3->SR1 = (uint8_t)TIM3_SR1_RESET_VALUE;
  89  0040 725f5322      	clr	21282
  90                     ; 69 }
  93  0044 81            	ret
 261                     ; 78 void TIM3_TimeBaseInit( TIM3_Prescaler_TypeDef TIM3_Prescaler,
 261                     ; 79                         uint16_t TIM3_Period)
 261                     ; 80 {
 262                     	switch	.text
 263  0045               _TIM3_TimeBaseInit:
 265  0045 88            	push	a
 266       00000000      OFST:	set	0
 269                     ; 82     TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 271  0046 c7532a        	ld	21290,a
 272                     ; 84     TIM3->ARRH = (uint8_t)(TIM3_Period >> 8);
 274  0049 7b04          	ld	a,(OFST+4,sp)
 275  004b c7532b        	ld	21291,a
 276                     ; 85     TIM3->ARRL = (uint8_t)(TIM3_Period);
 278  004e 7b05          	ld	a,(OFST+5,sp)
 279  0050 c7532c        	ld	21292,a
 280                     ; 86 }
 283  0053 84            	pop	a
 284  0054 81            	ret
 442                     ; 96 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 442                     ; 97                   TIM3_OutputState_TypeDef TIM3_OutputState,
 442                     ; 98                   uint16_t TIM3_Pulse,
 442                     ; 99                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 442                     ; 100 {
 443                     	switch	.text
 444  0055               _TIM3_OC1Init:
 446  0055 89            	pushw	x
 447  0056 88            	push	a
 448       00000001      OFST:	set	1
 451                     ; 102     assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 453  0057 9e            	ld	a,xh
 454  0058 4d            	tnz	a
 455  0059 2719          	jreq	L41
 456  005b 9e            	ld	a,xh
 457  005c a110          	cp	a,#16
 458  005e 2714          	jreq	L41
 459  0060 9e            	ld	a,xh
 460  0061 a120          	cp	a,#32
 461  0063 270f          	jreq	L41
 462  0065 9e            	ld	a,xh
 463  0066 a130          	cp	a,#48
 464  0068 270a          	jreq	L41
 465  006a 9e            	ld	a,xh
 466  006b a160          	cp	a,#96
 467  006d 2705          	jreq	L41
 468  006f 9e            	ld	a,xh
 469  0070 a170          	cp	a,#112
 470  0072 2603          	jrne	L21
 471  0074               L41:
 472  0074 4f            	clr	a
 473  0075 2010          	jra	L61
 474  0077               L21:
 475  0077 ae0066        	ldw	x,#102
 476  007a 89            	pushw	x
 477  007b ae0000        	ldw	x,#0
 478  007e 89            	pushw	x
 479  007f ae0000        	ldw	x,#L502
 480  0082 cd0000        	call	_assert_failed
 482  0085 5b04          	addw	sp,#4
 483  0087               L61:
 484                     ; 103     assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 486  0087 0d03          	tnz	(OFST+2,sp)
 487  0089 2706          	jreq	L22
 488  008b 7b03          	ld	a,(OFST+2,sp)
 489  008d a111          	cp	a,#17
 490  008f 2603          	jrne	L02
 491  0091               L22:
 492  0091 4f            	clr	a
 493  0092 2010          	jra	L42
 494  0094               L02:
 495  0094 ae0067        	ldw	x,#103
 496  0097 89            	pushw	x
 497  0098 ae0000        	ldw	x,#0
 498  009b 89            	pushw	x
 499  009c ae0000        	ldw	x,#L502
 500  009f cd0000        	call	_assert_failed
 502  00a2 5b04          	addw	sp,#4
 503  00a4               L42:
 504                     ; 104     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 506  00a4 0d08          	tnz	(OFST+7,sp)
 507  00a6 2706          	jreq	L03
 508  00a8 7b08          	ld	a,(OFST+7,sp)
 509  00aa a122          	cp	a,#34
 510  00ac 2603          	jrne	L62
 511  00ae               L03:
 512  00ae 4f            	clr	a
 513  00af 2010          	jra	L23
 514  00b1               L62:
 515  00b1 ae0068        	ldw	x,#104
 516  00b4 89            	pushw	x
 517  00b5 ae0000        	ldw	x,#0
 518  00b8 89            	pushw	x
 519  00b9 ae0000        	ldw	x,#L502
 520  00bc cd0000        	call	_assert_failed
 522  00bf 5b04          	addw	sp,#4
 523  00c1               L23:
 524                     ; 107     TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC1E | TIM3_CCER1_CC1P));
 526  00c1 c65327        	ld	a,21287
 527  00c4 a4fc          	and	a,#252
 528  00c6 c75327        	ld	21287,a
 529                     ; 109     TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC1E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC1P   ));
 531  00c9 7b08          	ld	a,(OFST+7,sp)
 532  00cb a402          	and	a,#2
 533  00cd 6b01          	ld	(OFST+0,sp),a
 534  00cf 7b03          	ld	a,(OFST+2,sp)
 535  00d1 a401          	and	a,#1
 536  00d3 1a01          	or	a,(OFST+0,sp)
 537  00d5 ca5327        	or	a,21287
 538  00d8 c75327        	ld	21287,a
 539                     ; 112     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 541  00db c65325        	ld	a,21285
 542  00de a48f          	and	a,#143
 543  00e0 1a02          	or	a,(OFST+1,sp)
 544  00e2 c75325        	ld	21285,a
 545                     ; 115     TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 547  00e5 7b06          	ld	a,(OFST+5,sp)
 548  00e7 c7532d        	ld	21293,a
 549                     ; 116     TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 551  00ea 7b07          	ld	a,(OFST+6,sp)
 552  00ec c7532e        	ld	21294,a
 553                     ; 117 }
 556  00ef 5b03          	addw	sp,#3
 557  00f1 81            	ret
 622                     ; 128 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 622                     ; 129                   TIM3_OutputState_TypeDef TIM3_OutputState,
 622                     ; 130                   uint16_t TIM3_Pulse,
 622                     ; 131                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
 622                     ; 132 {
 623                     	switch	.text
 624  00f2               _TIM3_OC2Init:
 626  00f2 89            	pushw	x
 627  00f3 88            	push	a
 628       00000001      OFST:	set	1
 631                     ; 134     assert_param(IS_TIM3_OC_MODE_OK(TIM3_OCMode));
 633  00f4 9e            	ld	a,xh
 634  00f5 4d            	tnz	a
 635  00f6 2719          	jreq	L04
 636  00f8 9e            	ld	a,xh
 637  00f9 a110          	cp	a,#16
 638  00fb 2714          	jreq	L04
 639  00fd 9e            	ld	a,xh
 640  00fe a120          	cp	a,#32
 641  0100 270f          	jreq	L04
 642  0102 9e            	ld	a,xh
 643  0103 a130          	cp	a,#48
 644  0105 270a          	jreq	L04
 645  0107 9e            	ld	a,xh
 646  0108 a160          	cp	a,#96
 647  010a 2705          	jreq	L04
 648  010c 9e            	ld	a,xh
 649  010d a170          	cp	a,#112
 650  010f 2603          	jrne	L63
 651  0111               L04:
 652  0111 4f            	clr	a
 653  0112 2010          	jra	L24
 654  0114               L63:
 655  0114 ae0086        	ldw	x,#134
 656  0117 89            	pushw	x
 657  0118 ae0000        	ldw	x,#0
 658  011b 89            	pushw	x
 659  011c ae0000        	ldw	x,#L502
 660  011f cd0000        	call	_assert_failed
 662  0122 5b04          	addw	sp,#4
 663  0124               L24:
 664                     ; 135     assert_param(IS_TIM3_OUTPUT_STATE_OK(TIM3_OutputState));
 666  0124 0d03          	tnz	(OFST+2,sp)
 667  0126 2706          	jreq	L64
 668  0128 7b03          	ld	a,(OFST+2,sp)
 669  012a a111          	cp	a,#17
 670  012c 2603          	jrne	L44
 671  012e               L64:
 672  012e 4f            	clr	a
 673  012f 2010          	jra	L05
 674  0131               L44:
 675  0131 ae0087        	ldw	x,#135
 676  0134 89            	pushw	x
 677  0135 ae0000        	ldw	x,#0
 678  0138 89            	pushw	x
 679  0139 ae0000        	ldw	x,#L502
 680  013c cd0000        	call	_assert_failed
 682  013f 5b04          	addw	sp,#4
 683  0141               L05:
 684                     ; 136     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
 686  0141 0d08          	tnz	(OFST+7,sp)
 687  0143 2706          	jreq	L45
 688  0145 7b08          	ld	a,(OFST+7,sp)
 689  0147 a122          	cp	a,#34
 690  0149 2603          	jrne	L25
 691  014b               L45:
 692  014b 4f            	clr	a
 693  014c 2010          	jra	L65
 694  014e               L25:
 695  014e ae0088        	ldw	x,#136
 696  0151 89            	pushw	x
 697  0152 ae0000        	ldw	x,#0
 698  0155 89            	pushw	x
 699  0156 ae0000        	ldw	x,#L502
 700  0159 cd0000        	call	_assert_failed
 702  015c 5b04          	addw	sp,#4
 703  015e               L65:
 704                     ; 140     TIM3->CCER1 &= (uint8_t)(~( TIM3_CCER1_CC2E |  TIM3_CCER1_CC2P ));
 706  015e c65327        	ld	a,21287
 707  0161 a4cf          	and	a,#207
 708  0163 c75327        	ld	21287,a
 709                     ; 142     TIM3->CCER1 |= (uint8_t)((uint8_t)(TIM3_OutputState  & TIM3_CCER1_CC2E   ) | (uint8_t)(TIM3_OCPolarity   & TIM3_CCER1_CC2P ));
 711  0166 7b08          	ld	a,(OFST+7,sp)
 712  0168 a420          	and	a,#32
 713  016a 6b01          	ld	(OFST+0,sp),a
 714  016c 7b03          	ld	a,(OFST+2,sp)
 715  016e a410          	and	a,#16
 716  0170 1a01          	or	a,(OFST+0,sp)
 717  0172 ca5327        	or	a,21287
 718  0175 c75327        	ld	21287,a
 719                     ; 146     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
 721  0178 c65326        	ld	a,21286
 722  017b a48f          	and	a,#143
 723  017d 1a02          	or	a,(OFST+1,sp)
 724  017f c75326        	ld	21286,a
 725                     ; 150     TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 727  0182 7b06          	ld	a,(OFST+5,sp)
 728  0184 c7532f        	ld	21295,a
 729                     ; 151     TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 731  0187 7b07          	ld	a,(OFST+6,sp)
 732  0189 c75330        	ld	21296,a
 733                     ; 152 }
 736  018c 5b03          	addw	sp,#3
 737  018e 81            	ret
 922                     ; 163 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
 922                     ; 164                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
 922                     ; 165                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
 922                     ; 166                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
 922                     ; 167                  uint8_t TIM3_ICFilter)
 922                     ; 168 {
 923                     	switch	.text
 924  018f               _TIM3_ICInit:
 926  018f 89            	pushw	x
 927       00000000      OFST:	set	0
 930                     ; 170     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
 932  0190 9e            	ld	a,xh
 933  0191 4d            	tnz	a
 934  0192 2705          	jreq	L46
 935  0194 9e            	ld	a,xh
 936  0195 a101          	cp	a,#1
 937  0197 2603          	jrne	L26
 938  0199               L46:
 939  0199 4f            	clr	a
 940  019a 2010          	jra	L66
 941  019c               L26:
 942  019c ae00aa        	ldw	x,#170
 943  019f 89            	pushw	x
 944  01a0 ae0000        	ldw	x,#0
 945  01a3 89            	pushw	x
 946  01a4 ae0000        	ldw	x,#L502
 947  01a7 cd0000        	call	_assert_failed
 949  01aa 5b04          	addw	sp,#4
 950  01ac               L66:
 951                     ; 171     assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
 953  01ac 0d02          	tnz	(OFST+2,sp)
 954  01ae 2706          	jreq	L27
 955  01b0 7b02          	ld	a,(OFST+2,sp)
 956  01b2 a144          	cp	a,#68
 957  01b4 2603          	jrne	L07
 958  01b6               L27:
 959  01b6 4f            	clr	a
 960  01b7 2010          	jra	L47
 961  01b9               L07:
 962  01b9 ae00ab        	ldw	x,#171
 963  01bc 89            	pushw	x
 964  01bd ae0000        	ldw	x,#0
 965  01c0 89            	pushw	x
 966  01c1 ae0000        	ldw	x,#L502
 967  01c4 cd0000        	call	_assert_failed
 969  01c7 5b04          	addw	sp,#4
 970  01c9               L47:
 971                     ; 172     assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
 973  01c9 7b05          	ld	a,(OFST+5,sp)
 974  01cb a101          	cp	a,#1
 975  01cd 270c          	jreq	L001
 976  01cf 7b05          	ld	a,(OFST+5,sp)
 977  01d1 a102          	cp	a,#2
 978  01d3 2706          	jreq	L001
 979  01d5 7b05          	ld	a,(OFST+5,sp)
 980  01d7 a103          	cp	a,#3
 981  01d9 2603          	jrne	L67
 982  01db               L001:
 983  01db 4f            	clr	a
 984  01dc 2010          	jra	L201
 985  01de               L67:
 986  01de ae00ac        	ldw	x,#172
 987  01e1 89            	pushw	x
 988  01e2 ae0000        	ldw	x,#0
 989  01e5 89            	pushw	x
 990  01e6 ae0000        	ldw	x,#L502
 991  01e9 cd0000        	call	_assert_failed
 993  01ec 5b04          	addw	sp,#4
 994  01ee               L201:
 995                     ; 173     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
 997  01ee 0d06          	tnz	(OFST+6,sp)
 998  01f0 2712          	jreq	L601
 999  01f2 7b06          	ld	a,(OFST+6,sp)
1000  01f4 a104          	cp	a,#4
1001  01f6 270c          	jreq	L601
1002  01f8 7b06          	ld	a,(OFST+6,sp)
1003  01fa a108          	cp	a,#8
1004  01fc 2706          	jreq	L601
1005  01fe 7b06          	ld	a,(OFST+6,sp)
1006  0200 a10c          	cp	a,#12
1007  0202 2603          	jrne	L401
1008  0204               L601:
1009  0204 4f            	clr	a
1010  0205 2010          	jra	L011
1011  0207               L401:
1012  0207 ae00ad        	ldw	x,#173
1013  020a 89            	pushw	x
1014  020b ae0000        	ldw	x,#0
1015  020e 89            	pushw	x
1016  020f ae0000        	ldw	x,#L502
1017  0212 cd0000        	call	_assert_failed
1019  0215 5b04          	addw	sp,#4
1020  0217               L011:
1021                     ; 174     assert_param(IS_TIM3_IC_FILTER_OK(TIM3_ICFilter));
1023  0217 7b07          	ld	a,(OFST+7,sp)
1024  0219 a110          	cp	a,#16
1025  021b 2403          	jruge	L211
1026  021d 4f            	clr	a
1027  021e 2010          	jra	L411
1028  0220               L211:
1029  0220 ae00ae        	ldw	x,#174
1030  0223 89            	pushw	x
1031  0224 ae0000        	ldw	x,#0
1032  0227 89            	pushw	x
1033  0228 ae0000        	ldw	x,#L502
1034  022b cd0000        	call	_assert_failed
1036  022e 5b04          	addw	sp,#4
1037  0230               L411:
1038                     ; 176     if (TIM3_Channel != TIM3_CHANNEL_2)
1040  0230 7b01          	ld	a,(OFST+1,sp)
1041  0232 a101          	cp	a,#1
1042  0234 2714          	jreq	L543
1043                     ; 179         TI1_Config((uint8_t)TIM3_ICPolarity,
1043                     ; 180                    (uint8_t)TIM3_ICSelection,
1043                     ; 181                    (uint8_t)TIM3_ICFilter);
1045  0236 7b07          	ld	a,(OFST+7,sp)
1046  0238 88            	push	a
1047  0239 7b06          	ld	a,(OFST+6,sp)
1048  023b 97            	ld	xl,a
1049  023c 7b03          	ld	a,(OFST+3,sp)
1050  023e 95            	ld	xh,a
1051  023f cd0925        	call	L3_TI1_Config
1053  0242 84            	pop	a
1054                     ; 184         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1056  0243 7b06          	ld	a,(OFST+6,sp)
1057  0245 cd0741        	call	_TIM3_SetIC1Prescaler
1060  0248 2012          	jra	L743
1061  024a               L543:
1062                     ; 189         TI2_Config((uint8_t)TIM3_ICPolarity,
1062                     ; 190                    (uint8_t)TIM3_ICSelection,
1062                     ; 191                    (uint8_t)TIM3_ICFilter);
1064  024a 7b07          	ld	a,(OFST+7,sp)
1065  024c 88            	push	a
1066  024d 7b06          	ld	a,(OFST+6,sp)
1067  024f 97            	ld	xl,a
1068  0250 7b03          	ld	a,(OFST+3,sp)
1069  0252 95            	ld	xh,a
1070  0253 cd0955        	call	L5_TI2_Config
1072  0256 84            	pop	a
1073                     ; 194         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1075  0257 7b06          	ld	a,(OFST+6,sp)
1076  0259 cd0770        	call	_TIM3_SetIC2Prescaler
1078  025c               L743:
1079                     ; 196 }
1082  025c 85            	popw	x
1083  025d 81            	ret
1180                     ; 206 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
1180                     ; 207                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
1180                     ; 208                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
1180                     ; 209                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
1180                     ; 210                      uint8_t TIM3_ICFilter)
1180                     ; 211 {
1181                     	switch	.text
1182  025e               _TIM3_PWMIConfig:
1184  025e 89            	pushw	x
1185  025f 89            	pushw	x
1186       00000002      OFST:	set	2
1189                     ; 212     uint8_t icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
1191  0260 7b01          	ld	a,(OFST-1,sp)
1192  0262 97            	ld	xl,a
1193                     ; 213     uint8_t icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
1195  0263 7b02          	ld	a,(OFST+0,sp)
1196  0265 97            	ld	xl,a
1197                     ; 216     assert_param(IS_TIM3_PWMI_CHANNEL_OK(TIM3_Channel));
1199  0266 0d03          	tnz	(OFST+1,sp)
1200  0268 2706          	jreq	L221
1201  026a 7b03          	ld	a,(OFST+1,sp)
1202  026c a101          	cp	a,#1
1203  026e 2603          	jrne	L021
1204  0270               L221:
1205  0270 4f            	clr	a
1206  0271 2010          	jra	L421
1207  0273               L021:
1208  0273 ae00d8        	ldw	x,#216
1209  0276 89            	pushw	x
1210  0277 ae0000        	ldw	x,#0
1211  027a 89            	pushw	x
1212  027b ae0000        	ldw	x,#L502
1213  027e cd0000        	call	_assert_failed
1215  0281 5b04          	addw	sp,#4
1216  0283               L421:
1217                     ; 217     assert_param(IS_TIM3_IC_POLARITY_OK(TIM3_ICPolarity));
1219  0283 0d04          	tnz	(OFST+2,sp)
1220  0285 2706          	jreq	L031
1221  0287 7b04          	ld	a,(OFST+2,sp)
1222  0289 a144          	cp	a,#68
1223  028b 2603          	jrne	L621
1224  028d               L031:
1225  028d 4f            	clr	a
1226  028e 2010          	jra	L231
1227  0290               L621:
1228  0290 ae00d9        	ldw	x,#217
1229  0293 89            	pushw	x
1230  0294 ae0000        	ldw	x,#0
1231  0297 89            	pushw	x
1232  0298 ae0000        	ldw	x,#L502
1233  029b cd0000        	call	_assert_failed
1235  029e 5b04          	addw	sp,#4
1236  02a0               L231:
1237                     ; 218     assert_param(IS_TIM3_IC_SELECTION_OK(TIM3_ICSelection));
1239  02a0 7b07          	ld	a,(OFST+5,sp)
1240  02a2 a101          	cp	a,#1
1241  02a4 270c          	jreq	L631
1242  02a6 7b07          	ld	a,(OFST+5,sp)
1243  02a8 a102          	cp	a,#2
1244  02aa 2706          	jreq	L631
1245  02ac 7b07          	ld	a,(OFST+5,sp)
1246  02ae a103          	cp	a,#3
1247  02b0 2603          	jrne	L431
1248  02b2               L631:
1249  02b2 4f            	clr	a
1250  02b3 2010          	jra	L041
1251  02b5               L431:
1252  02b5 ae00da        	ldw	x,#218
1253  02b8 89            	pushw	x
1254  02b9 ae0000        	ldw	x,#0
1255  02bc 89            	pushw	x
1256  02bd ae0000        	ldw	x,#L502
1257  02c0 cd0000        	call	_assert_failed
1259  02c3 5b04          	addw	sp,#4
1260  02c5               L041:
1261                     ; 219     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_ICPrescaler));
1263  02c5 0d08          	tnz	(OFST+6,sp)
1264  02c7 2712          	jreq	L441
1265  02c9 7b08          	ld	a,(OFST+6,sp)
1266  02cb a104          	cp	a,#4
1267  02cd 270c          	jreq	L441
1268  02cf 7b08          	ld	a,(OFST+6,sp)
1269  02d1 a108          	cp	a,#8
1270  02d3 2706          	jreq	L441
1271  02d5 7b08          	ld	a,(OFST+6,sp)
1272  02d7 a10c          	cp	a,#12
1273  02d9 2603          	jrne	L241
1274  02db               L441:
1275  02db 4f            	clr	a
1276  02dc 2010          	jra	L641
1277  02de               L241:
1278  02de ae00db        	ldw	x,#219
1279  02e1 89            	pushw	x
1280  02e2 ae0000        	ldw	x,#0
1281  02e5 89            	pushw	x
1282  02e6 ae0000        	ldw	x,#L502
1283  02e9 cd0000        	call	_assert_failed
1285  02ec 5b04          	addw	sp,#4
1286  02ee               L641:
1287                     ; 222     if (TIM3_ICPolarity != TIM3_ICPOLARITY_FALLING)
1289  02ee 7b04          	ld	a,(OFST+2,sp)
1290  02f0 a144          	cp	a,#68
1291  02f2 2706          	jreq	L714
1292                     ; 224         icpolarity = (uint8_t)TIM3_ICPOLARITY_FALLING;
1294  02f4 a644          	ld	a,#68
1295  02f6 6b01          	ld	(OFST-1,sp),a
1297  02f8 2002          	jra	L124
1298  02fa               L714:
1299                     ; 228         icpolarity = (uint8_t)TIM3_ICPOLARITY_RISING;
1301  02fa 0f01          	clr	(OFST-1,sp)
1302  02fc               L124:
1303                     ; 232     if (TIM3_ICSelection == TIM3_ICSELECTION_DIRECTTI)
1305  02fc 7b07          	ld	a,(OFST+5,sp)
1306  02fe a101          	cp	a,#1
1307  0300 2606          	jrne	L324
1308                     ; 234         icselection = (uint8_t)TIM3_ICSELECTION_INDIRECTTI;
1310  0302 a602          	ld	a,#2
1311  0304 6b02          	ld	(OFST+0,sp),a
1313  0306 2004          	jra	L524
1314  0308               L324:
1315                     ; 238         icselection = (uint8_t)TIM3_ICSELECTION_DIRECTTI;
1317  0308 a601          	ld	a,#1
1318  030a 6b02          	ld	(OFST+0,sp),a
1319  030c               L524:
1320                     ; 241     if (TIM3_Channel != TIM3_CHANNEL_2)
1322  030c 7b03          	ld	a,(OFST+1,sp)
1323  030e a101          	cp	a,#1
1324  0310 2726          	jreq	L724
1325                     ; 244         TI1_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1325                     ; 245                    (uint8_t)TIM3_ICFilter);
1327  0312 7b09          	ld	a,(OFST+7,sp)
1328  0314 88            	push	a
1329  0315 7b08          	ld	a,(OFST+6,sp)
1330  0317 97            	ld	xl,a
1331  0318 7b05          	ld	a,(OFST+3,sp)
1332  031a 95            	ld	xh,a
1333  031b cd0925        	call	L3_TI1_Config
1335  031e 84            	pop	a
1336                     ; 248         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1338  031f 7b08          	ld	a,(OFST+6,sp)
1339  0321 cd0741        	call	_TIM3_SetIC1Prescaler
1341                     ; 251         TI2_Config(icpolarity, icselection, TIM3_ICFilter);
1343  0324 7b09          	ld	a,(OFST+7,sp)
1344  0326 88            	push	a
1345  0327 7b03          	ld	a,(OFST+1,sp)
1346  0329 97            	ld	xl,a
1347  032a 7b02          	ld	a,(OFST+0,sp)
1348  032c 95            	ld	xh,a
1349  032d cd0955        	call	L5_TI2_Config
1351  0330 84            	pop	a
1352                     ; 254         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1354  0331 7b08          	ld	a,(OFST+6,sp)
1355  0333 cd0770        	call	_TIM3_SetIC2Prescaler
1358  0336 2024          	jra	L134
1359  0338               L724:
1360                     ; 259         TI2_Config((uint8_t)TIM3_ICPolarity, (uint8_t)TIM3_ICSelection,
1360                     ; 260                    (uint8_t)TIM3_ICFilter);
1362  0338 7b09          	ld	a,(OFST+7,sp)
1363  033a 88            	push	a
1364  033b 7b08          	ld	a,(OFST+6,sp)
1365  033d 97            	ld	xl,a
1366  033e 7b05          	ld	a,(OFST+3,sp)
1367  0340 95            	ld	xh,a
1368  0341 cd0955        	call	L5_TI2_Config
1370  0344 84            	pop	a
1371                     ; 263         TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1373  0345 7b08          	ld	a,(OFST+6,sp)
1374  0347 cd0770        	call	_TIM3_SetIC2Prescaler
1376                     ; 266         TI1_Config(icpolarity, icselection, TIM3_ICFilter);
1378  034a 7b09          	ld	a,(OFST+7,sp)
1379  034c 88            	push	a
1380  034d 7b03          	ld	a,(OFST+1,sp)
1381  034f 97            	ld	xl,a
1382  0350 7b02          	ld	a,(OFST+0,sp)
1383  0352 95            	ld	xh,a
1384  0353 cd0925        	call	L3_TI1_Config
1386  0356 84            	pop	a
1387                     ; 269         TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1389  0357 7b08          	ld	a,(OFST+6,sp)
1390  0359 cd0741        	call	_TIM3_SetIC1Prescaler
1392  035c               L134:
1393                     ; 271 }
1396  035c 5b04          	addw	sp,#4
1397  035e 81            	ret
1453                     ; 280 void TIM3_Cmd(FunctionalState NewState)
1453                     ; 281 {
1454                     	switch	.text
1455  035f               _TIM3_Cmd:
1457  035f 88            	push	a
1458       00000000      OFST:	set	0
1461                     ; 283     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1463  0360 4d            	tnz	a
1464  0361 2704          	jreq	L451
1465  0363 a101          	cp	a,#1
1466  0365 2603          	jrne	L251
1467  0367               L451:
1468  0367 4f            	clr	a
1469  0368 2010          	jra	L651
1470  036a               L251:
1471  036a ae011b        	ldw	x,#283
1472  036d 89            	pushw	x
1473  036e ae0000        	ldw	x,#0
1474  0371 89            	pushw	x
1475  0372 ae0000        	ldw	x,#L502
1476  0375 cd0000        	call	_assert_failed
1478  0378 5b04          	addw	sp,#4
1479  037a               L651:
1480                     ; 286     if (NewState != DISABLE)
1482  037a 0d01          	tnz	(OFST+1,sp)
1483  037c 2706          	jreq	L164
1484                     ; 288         TIM3->CR1 |= (uint8_t)TIM3_CR1_CEN;
1486  037e 72105320      	bset	21280,#0
1488  0382 2004          	jra	L364
1489  0384               L164:
1490                     ; 292         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_CEN);
1492  0384 72115320      	bres	21280,#0
1493  0388               L364:
1494                     ; 294 }
1497  0388 84            	pop	a
1498  0389 81            	ret
1571                     ; 309 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1571                     ; 310 {
1572                     	switch	.text
1573  038a               _TIM3_ITConfig:
1575  038a 89            	pushw	x
1576       00000000      OFST:	set	0
1579                     ; 312     assert_param(IS_TIM3_IT_OK(TIM3_IT));
1581  038b 9e            	ld	a,xh
1582  038c 4d            	tnz	a
1583  038d 2708          	jreq	L261
1584  038f 9e            	ld	a,xh
1585  0390 a108          	cp	a,#8
1586  0392 2403          	jruge	L261
1587  0394 4f            	clr	a
1588  0395 2010          	jra	L461
1589  0397               L261:
1590  0397 ae0138        	ldw	x,#312
1591  039a 89            	pushw	x
1592  039b ae0000        	ldw	x,#0
1593  039e 89            	pushw	x
1594  039f ae0000        	ldw	x,#L502
1595  03a2 cd0000        	call	_assert_failed
1597  03a5 5b04          	addw	sp,#4
1598  03a7               L461:
1599                     ; 313     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1601  03a7 0d02          	tnz	(OFST+2,sp)
1602  03a9 2706          	jreq	L071
1603  03ab 7b02          	ld	a,(OFST+2,sp)
1604  03ad a101          	cp	a,#1
1605  03af 2603          	jrne	L661
1606  03b1               L071:
1607  03b1 4f            	clr	a
1608  03b2 2010          	jra	L271
1609  03b4               L661:
1610  03b4 ae0139        	ldw	x,#313
1611  03b7 89            	pushw	x
1612  03b8 ae0000        	ldw	x,#0
1613  03bb 89            	pushw	x
1614  03bc ae0000        	ldw	x,#L502
1615  03bf cd0000        	call	_assert_failed
1617  03c2 5b04          	addw	sp,#4
1618  03c4               L271:
1619                     ; 315     if (NewState != DISABLE)
1621  03c4 0d02          	tnz	(OFST+2,sp)
1622  03c6 270a          	jreq	L125
1623                     ; 318         TIM3->IER |= (uint8_t)TIM3_IT;
1625  03c8 c65321        	ld	a,21281
1626  03cb 1a01          	or	a,(OFST+1,sp)
1627  03cd c75321        	ld	21281,a
1629  03d0 2009          	jra	L325
1630  03d2               L125:
1631                     ; 323         TIM3->IER &= (uint8_t)(~TIM3_IT);
1633  03d2 7b01          	ld	a,(OFST+1,sp)
1634  03d4 43            	cpl	a
1635  03d5 c45321        	and	a,21281
1636  03d8 c75321        	ld	21281,a
1637  03db               L325:
1638                     ; 325 }
1641  03db 85            	popw	x
1642  03dc 81            	ret
1679                     ; 334 void TIM3_UpdateDisableConfig(FunctionalState NewState)
1679                     ; 335 {
1680                     	switch	.text
1681  03dd               _TIM3_UpdateDisableConfig:
1683  03dd 88            	push	a
1684       00000000      OFST:	set	0
1687                     ; 337     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1689  03de 4d            	tnz	a
1690  03df 2704          	jreq	L002
1691  03e1 a101          	cp	a,#1
1692  03e3 2603          	jrne	L671
1693  03e5               L002:
1694  03e5 4f            	clr	a
1695  03e6 2010          	jra	L202
1696  03e8               L671:
1697  03e8 ae0151        	ldw	x,#337
1698  03eb 89            	pushw	x
1699  03ec ae0000        	ldw	x,#0
1700  03ef 89            	pushw	x
1701  03f0 ae0000        	ldw	x,#L502
1702  03f3 cd0000        	call	_assert_failed
1704  03f6 5b04          	addw	sp,#4
1705  03f8               L202:
1706                     ; 340     if (NewState != DISABLE)
1708  03f8 0d01          	tnz	(OFST+1,sp)
1709  03fa 2706          	jreq	L345
1710                     ; 342         TIM3->CR1 |= TIM3_CR1_UDIS;
1712  03fc 72125320      	bset	21280,#1
1714  0400 2004          	jra	L545
1715  0402               L345:
1716                     ; 346         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_UDIS);
1718  0402 72135320      	bres	21280,#1
1719  0406               L545:
1720                     ; 348 }
1723  0406 84            	pop	a
1724  0407 81            	ret
1783                     ; 358 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
1783                     ; 359 {
1784                     	switch	.text
1785  0408               _TIM3_UpdateRequestConfig:
1787  0408 88            	push	a
1788       00000000      OFST:	set	0
1791                     ; 361     assert_param(IS_TIM3_UPDATE_SOURCE_OK(TIM3_UpdateSource));
1793  0409 4d            	tnz	a
1794  040a 2704          	jreq	L012
1795  040c a101          	cp	a,#1
1796  040e 2603          	jrne	L602
1797  0410               L012:
1798  0410 4f            	clr	a
1799  0411 2010          	jra	L212
1800  0413               L602:
1801  0413 ae0169        	ldw	x,#361
1802  0416 89            	pushw	x
1803  0417 ae0000        	ldw	x,#0
1804  041a 89            	pushw	x
1805  041b ae0000        	ldw	x,#L502
1806  041e cd0000        	call	_assert_failed
1808  0421 5b04          	addw	sp,#4
1809  0423               L212:
1810                     ; 364     if (TIM3_UpdateSource != TIM3_UPDATESOURCE_GLOBAL)
1812  0423 0d01          	tnz	(OFST+1,sp)
1813  0425 2706          	jreq	L575
1814                     ; 366         TIM3->CR1 |= TIM3_CR1_URS;
1816  0427 72145320      	bset	21280,#2
1818  042b 2004          	jra	L775
1819  042d               L575:
1820                     ; 370         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_URS);
1822  042d 72155320      	bres	21280,#2
1823  0431               L775:
1824                     ; 372 }
1827  0431 84            	pop	a
1828  0432 81            	ret
1886                     ; 383 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1886                     ; 384 {
1887                     	switch	.text
1888  0433               _TIM3_SelectOnePulseMode:
1890  0433 88            	push	a
1891       00000000      OFST:	set	0
1894                     ; 386     assert_param(IS_TIM3_OPM_MODE_OK(TIM3_OPMode));
1896  0434 a101          	cp	a,#1
1897  0436 2703          	jreq	L022
1898  0438 4d            	tnz	a
1899  0439 2603          	jrne	L612
1900  043b               L022:
1901  043b 4f            	clr	a
1902  043c 2010          	jra	L222
1903  043e               L612:
1904  043e ae0182        	ldw	x,#386
1905  0441 89            	pushw	x
1906  0442 ae0000        	ldw	x,#0
1907  0445 89            	pushw	x
1908  0446 ae0000        	ldw	x,#L502
1909  0449 cd0000        	call	_assert_failed
1911  044c 5b04          	addw	sp,#4
1912  044e               L222:
1913                     ; 389     if (TIM3_OPMode != TIM3_OPMODE_REPETITIVE)
1915  044e 0d01          	tnz	(OFST+1,sp)
1916  0450 2706          	jreq	L726
1917                     ; 391         TIM3->CR1 |= TIM3_CR1_OPM;
1919  0452 72165320      	bset	21280,#3
1921  0456 2004          	jra	L136
1922  0458               L726:
1923                     ; 395         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_OPM);
1925  0458 72175320      	bres	21280,#3
1926  045c               L136:
1927                     ; 398 }
1930  045c 84            	pop	a
1931  045d 81            	ret
2000                     ; 429 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
2000                     ; 430                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
2000                     ; 431 {
2001                     	switch	.text
2002  045e               _TIM3_PrescalerConfig:
2004  045e 89            	pushw	x
2005       00000000      OFST:	set	0
2008                     ; 433     assert_param(IS_TIM3_PRESCALER_RELOAD_OK(TIM3_PSCReloadMode));
2010  045f 9f            	ld	a,xl
2011  0460 4d            	tnz	a
2012  0461 2705          	jreq	L032
2013  0463 9f            	ld	a,xl
2014  0464 a101          	cp	a,#1
2015  0466 2603          	jrne	L622
2016  0468               L032:
2017  0468 4f            	clr	a
2018  0469 2010          	jra	L232
2019  046b               L622:
2020  046b ae01b1        	ldw	x,#433
2021  046e 89            	pushw	x
2022  046f ae0000        	ldw	x,#0
2023  0472 89            	pushw	x
2024  0473 ae0000        	ldw	x,#L502
2025  0476 cd0000        	call	_assert_failed
2027  0479 5b04          	addw	sp,#4
2028  047b               L232:
2029                     ; 434     assert_param(IS_TIM3_PRESCALER_OK(Prescaler));
2031  047b 0d01          	tnz	(OFST+1,sp)
2032  047d 275a          	jreq	L632
2033  047f 7b01          	ld	a,(OFST+1,sp)
2034  0481 a101          	cp	a,#1
2035  0483 2754          	jreq	L632
2036  0485 7b01          	ld	a,(OFST+1,sp)
2037  0487 a102          	cp	a,#2
2038  0489 274e          	jreq	L632
2039  048b 7b01          	ld	a,(OFST+1,sp)
2040  048d a103          	cp	a,#3
2041  048f 2748          	jreq	L632
2042  0491 7b01          	ld	a,(OFST+1,sp)
2043  0493 a104          	cp	a,#4
2044  0495 2742          	jreq	L632
2045  0497 7b01          	ld	a,(OFST+1,sp)
2046  0499 a105          	cp	a,#5
2047  049b 273c          	jreq	L632
2048  049d 7b01          	ld	a,(OFST+1,sp)
2049  049f a106          	cp	a,#6
2050  04a1 2736          	jreq	L632
2051  04a3 7b01          	ld	a,(OFST+1,sp)
2052  04a5 a107          	cp	a,#7
2053  04a7 2730          	jreq	L632
2054  04a9 7b01          	ld	a,(OFST+1,sp)
2055  04ab a108          	cp	a,#8
2056  04ad 272a          	jreq	L632
2057  04af 7b01          	ld	a,(OFST+1,sp)
2058  04b1 a109          	cp	a,#9
2059  04b3 2724          	jreq	L632
2060  04b5 7b01          	ld	a,(OFST+1,sp)
2061  04b7 a10a          	cp	a,#10
2062  04b9 271e          	jreq	L632
2063  04bb 7b01          	ld	a,(OFST+1,sp)
2064  04bd a10b          	cp	a,#11
2065  04bf 2718          	jreq	L632
2066  04c1 7b01          	ld	a,(OFST+1,sp)
2067  04c3 a10c          	cp	a,#12
2068  04c5 2712          	jreq	L632
2069  04c7 7b01          	ld	a,(OFST+1,sp)
2070  04c9 a10d          	cp	a,#13
2071  04cb 270c          	jreq	L632
2072  04cd 7b01          	ld	a,(OFST+1,sp)
2073  04cf a10e          	cp	a,#14
2074  04d1 2706          	jreq	L632
2075  04d3 7b01          	ld	a,(OFST+1,sp)
2076  04d5 a10f          	cp	a,#15
2077  04d7 2603          	jrne	L432
2078  04d9               L632:
2079  04d9 4f            	clr	a
2080  04da 2010          	jra	L042
2081  04dc               L432:
2082  04dc ae01b2        	ldw	x,#434
2083  04df 89            	pushw	x
2084  04e0 ae0000        	ldw	x,#0
2085  04e3 89            	pushw	x
2086  04e4 ae0000        	ldw	x,#L502
2087  04e7 cd0000        	call	_assert_failed
2089  04ea 5b04          	addw	sp,#4
2090  04ec               L042:
2091                     ; 437     TIM3->PSCR = (uint8_t)Prescaler;
2093  04ec 7b01          	ld	a,(OFST+1,sp)
2094  04ee c7532a        	ld	21290,a
2095                     ; 440     TIM3->EGR = (uint8_t)TIM3_PSCReloadMode;
2097  04f1 7b02          	ld	a,(OFST+2,sp)
2098  04f3 c75324        	ld	21284,a
2099                     ; 441 }
2102  04f6 85            	popw	x
2103  04f7 81            	ret
2162                     ; 452 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
2162                     ; 453 {
2163                     	switch	.text
2164  04f8               _TIM3_ForcedOC1Config:
2166  04f8 88            	push	a
2167       00000000      OFST:	set	0
2170                     ; 455     assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
2172  04f9 a150          	cp	a,#80
2173  04fb 2704          	jreq	L642
2174  04fd a140          	cp	a,#64
2175  04ff 2603          	jrne	L442
2176  0501               L642:
2177  0501 4f            	clr	a
2178  0502 2010          	jra	L052
2179  0504               L442:
2180  0504 ae01c7        	ldw	x,#455
2181  0507 89            	pushw	x
2182  0508 ae0000        	ldw	x,#0
2183  050b 89            	pushw	x
2184  050c ae0000        	ldw	x,#L502
2185  050f cd0000        	call	_assert_failed
2187  0512 5b04          	addw	sp,#4
2188  0514               L052:
2189                     ; 458     TIM3->CCMR1 =  (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM))  | (uint8_t)TIM3_ForcedAction);
2191  0514 c65325        	ld	a,21285
2192  0517 a48f          	and	a,#143
2193  0519 1a01          	or	a,(OFST+1,sp)
2194  051b c75325        	ld	21285,a
2195                     ; 459 }
2198  051e 84            	pop	a
2199  051f 81            	ret
2236                     ; 470 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
2236                     ; 471 {
2237                     	switch	.text
2238  0520               _TIM3_ForcedOC2Config:
2240  0520 88            	push	a
2241       00000000      OFST:	set	0
2244                     ; 473     assert_param(IS_TIM3_FORCED_ACTION_OK(TIM3_ForcedAction));
2246  0521 a150          	cp	a,#80
2247  0523 2704          	jreq	L652
2248  0525 a140          	cp	a,#64
2249  0527 2603          	jrne	L452
2250  0529               L652:
2251  0529 4f            	clr	a
2252  052a 2010          	jra	L062
2253  052c               L452:
2254  052c ae01d9        	ldw	x,#473
2255  052f 89            	pushw	x
2256  0530 ae0000        	ldw	x,#0
2257  0533 89            	pushw	x
2258  0534 ae0000        	ldw	x,#L502
2259  0537 cd0000        	call	_assert_failed
2261  053a 5b04          	addw	sp,#4
2262  053c               L062:
2263                     ; 476     TIM3->CCMR2 =  (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_ForcedAction);
2265  053c c65326        	ld	a,21286
2266  053f a48f          	and	a,#143
2267  0541 1a01          	or	a,(OFST+1,sp)
2268  0543 c75326        	ld	21286,a
2269                     ; 477 }
2272  0546 84            	pop	a
2273  0547 81            	ret
2310                     ; 486 void TIM3_ARRPreloadConfig(FunctionalState NewState)
2310                     ; 487 {
2311                     	switch	.text
2312  0548               _TIM3_ARRPreloadConfig:
2314  0548 88            	push	a
2315       00000000      OFST:	set	0
2318                     ; 489     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2320  0549 4d            	tnz	a
2321  054a 2704          	jreq	L662
2322  054c a101          	cp	a,#1
2323  054e 2603          	jrne	L462
2324  0550               L662:
2325  0550 4f            	clr	a
2326  0551 2010          	jra	L072
2327  0553               L462:
2328  0553 ae01e9        	ldw	x,#489
2329  0556 89            	pushw	x
2330  0557 ae0000        	ldw	x,#0
2331  055a 89            	pushw	x
2332  055b ae0000        	ldw	x,#L502
2333  055e cd0000        	call	_assert_failed
2335  0561 5b04          	addw	sp,#4
2336  0563               L072:
2337                     ; 492     if (NewState != DISABLE)
2339  0563 0d01          	tnz	(OFST+1,sp)
2340  0565 2706          	jreq	L747
2341                     ; 494         TIM3->CR1 |= TIM3_CR1_ARPE;
2343  0567 721e5320      	bset	21280,#7
2345  056b 2004          	jra	L157
2346  056d               L747:
2347                     ; 498         TIM3->CR1 &= (uint8_t)(~TIM3_CR1_ARPE);
2349  056d 721f5320      	bres	21280,#7
2350  0571               L157:
2351                     ; 500 }
2354  0571 84            	pop	a
2355  0572 81            	ret
2392                     ; 509 void TIM3_OC1PreloadConfig(FunctionalState NewState)
2392                     ; 510 {
2393                     	switch	.text
2394  0573               _TIM3_OC1PreloadConfig:
2396  0573 88            	push	a
2397       00000000      OFST:	set	0
2400                     ; 512     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2402  0574 4d            	tnz	a
2403  0575 2704          	jreq	L672
2404  0577 a101          	cp	a,#1
2405  0579 2603          	jrne	L472
2406  057b               L672:
2407  057b 4f            	clr	a
2408  057c 2010          	jra	L003
2409  057e               L472:
2410  057e ae0200        	ldw	x,#512
2411  0581 89            	pushw	x
2412  0582 ae0000        	ldw	x,#0
2413  0585 89            	pushw	x
2414  0586 ae0000        	ldw	x,#L502
2415  0589 cd0000        	call	_assert_failed
2417  058c 5b04          	addw	sp,#4
2418  058e               L003:
2419                     ; 515     if (NewState != DISABLE)
2421  058e 0d01          	tnz	(OFST+1,sp)
2422  0590 2706          	jreq	L177
2423                     ; 517         TIM3->CCMR1 |= TIM3_CCMR_OCxPE;
2425  0592 72165325      	bset	21285,#3
2427  0596 2004          	jra	L377
2428  0598               L177:
2429                     ; 521         TIM3->CCMR1 &= (uint8_t)(~TIM3_CCMR_OCxPE);
2431  0598 72175325      	bres	21285,#3
2432  059c               L377:
2433                     ; 523 }
2436  059c 84            	pop	a
2437  059d 81            	ret
2474                     ; 532 void TIM3_OC2PreloadConfig(FunctionalState NewState)
2474                     ; 533 {
2475                     	switch	.text
2476  059e               _TIM3_OC2PreloadConfig:
2478  059e 88            	push	a
2479       00000000      OFST:	set	0
2482                     ; 535     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2484  059f 4d            	tnz	a
2485  05a0 2704          	jreq	L603
2486  05a2 a101          	cp	a,#1
2487  05a4 2603          	jrne	L403
2488  05a6               L603:
2489  05a6 4f            	clr	a
2490  05a7 2010          	jra	L013
2491  05a9               L403:
2492  05a9 ae0217        	ldw	x,#535
2493  05ac 89            	pushw	x
2494  05ad ae0000        	ldw	x,#0
2495  05b0 89            	pushw	x
2496  05b1 ae0000        	ldw	x,#L502
2497  05b4 cd0000        	call	_assert_failed
2499  05b7 5b04          	addw	sp,#4
2500  05b9               L013:
2501                     ; 538     if (NewState != DISABLE)
2503  05b9 0d01          	tnz	(OFST+1,sp)
2504  05bb 2706          	jreq	L3101
2505                     ; 540         TIM3->CCMR2 |= TIM3_CCMR_OCxPE;
2507  05bd 72165326      	bset	21286,#3
2509  05c1 2004          	jra	L5101
2510  05c3               L3101:
2511                     ; 544         TIM3->CCMR2 &= (uint8_t)(~TIM3_CCMR_OCxPE);
2513  05c3 72175326      	bres	21286,#3
2514  05c7               L5101:
2515                     ; 546 }
2518  05c7 84            	pop	a
2519  05c8 81            	ret
2585                     ; 557 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
2585                     ; 558 {
2586                     	switch	.text
2587  05c9               _TIM3_GenerateEvent:
2589  05c9 88            	push	a
2590       00000000      OFST:	set	0
2593                     ; 560     assert_param(IS_TIM3_EVENT_SOURCE_OK(TIM3_EventSource));
2595  05ca 4d            	tnz	a
2596  05cb 2703          	jreq	L413
2597  05cd 4f            	clr	a
2598  05ce 2010          	jra	L613
2599  05d0               L413:
2600  05d0 ae0230        	ldw	x,#560
2601  05d3 89            	pushw	x
2602  05d4 ae0000        	ldw	x,#0
2603  05d7 89            	pushw	x
2604  05d8 ae0000        	ldw	x,#L502
2605  05db cd0000        	call	_assert_failed
2607  05de 5b04          	addw	sp,#4
2608  05e0               L613:
2609                     ; 563     TIM3->EGR = (uint8_t)TIM3_EventSource;
2611  05e0 7b01          	ld	a,(OFST+1,sp)
2612  05e2 c75324        	ld	21284,a
2613                     ; 564 }
2616  05e5 84            	pop	a
2617  05e6 81            	ret
2654                     ; 575 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2654                     ; 576 {
2655                     	switch	.text
2656  05e7               _TIM3_OC1PolarityConfig:
2658  05e7 88            	push	a
2659       00000000      OFST:	set	0
2662                     ; 578     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2664  05e8 4d            	tnz	a
2665  05e9 2704          	jreq	L423
2666  05eb a122          	cp	a,#34
2667  05ed 2603          	jrne	L223
2668  05ef               L423:
2669  05ef 4f            	clr	a
2670  05f0 2010          	jra	L623
2671  05f2               L223:
2672  05f2 ae0242        	ldw	x,#578
2673  05f5 89            	pushw	x
2674  05f6 ae0000        	ldw	x,#0
2675  05f9 89            	pushw	x
2676  05fa ae0000        	ldw	x,#L502
2677  05fd cd0000        	call	_assert_failed
2679  0600 5b04          	addw	sp,#4
2680  0602               L623:
2681                     ; 581     if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2683  0602 0d01          	tnz	(OFST+1,sp)
2684  0604 2706          	jreq	L5601
2685                     ; 583         TIM3->CCER1 |= TIM3_CCER1_CC1P;
2687  0606 72125327      	bset	21287,#1
2689  060a 2004          	jra	L7601
2690  060c               L5601:
2691                     ; 587         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
2693  060c 72135327      	bres	21287,#1
2694  0610               L7601:
2695                     ; 589 }
2698  0610 84            	pop	a
2699  0611 81            	ret
2736                     ; 600 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2736                     ; 601 {
2737                     	switch	.text
2738  0612               _TIM3_OC2PolarityConfig:
2740  0612 88            	push	a
2741       00000000      OFST:	set	0
2744                     ; 603     assert_param(IS_TIM3_OC_POLARITY_OK(TIM3_OCPolarity));
2746  0613 4d            	tnz	a
2747  0614 2704          	jreq	L433
2748  0616 a122          	cp	a,#34
2749  0618 2603          	jrne	L233
2750  061a               L433:
2751  061a 4f            	clr	a
2752  061b 2010          	jra	L633
2753  061d               L233:
2754  061d ae025b        	ldw	x,#603
2755  0620 89            	pushw	x
2756  0621 ae0000        	ldw	x,#0
2757  0624 89            	pushw	x
2758  0625 ae0000        	ldw	x,#L502
2759  0628 cd0000        	call	_assert_failed
2761  062b 5b04          	addw	sp,#4
2762  062d               L633:
2763                     ; 606     if (TIM3_OCPolarity != TIM3_OCPOLARITY_HIGH)
2765  062d 0d01          	tnz	(OFST+1,sp)
2766  062f 2706          	jreq	L7011
2767                     ; 608         TIM3->CCER1 |= TIM3_CCER1_CC2P;
2769  0631 721a5327      	bset	21287,#5
2771  0635 2004          	jra	L1111
2772  0637               L7011:
2773                     ; 612         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
2775  0637 721b5327      	bres	21287,#5
2776  063b               L1111:
2777                     ; 614 }
2780  063b 84            	pop	a
2781  063c 81            	ret
2827                     ; 627 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel, FunctionalState NewState)
2827                     ; 628 {
2828                     	switch	.text
2829  063d               _TIM3_CCxCmd:
2831  063d 89            	pushw	x
2832       00000000      OFST:	set	0
2835                     ; 630     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2837  063e 9e            	ld	a,xh
2838  063f 4d            	tnz	a
2839  0640 2705          	jreq	L443
2840  0642 9e            	ld	a,xh
2841  0643 a101          	cp	a,#1
2842  0645 2603          	jrne	L243
2843  0647               L443:
2844  0647 4f            	clr	a
2845  0648 2010          	jra	L643
2846  064a               L243:
2847  064a ae0276        	ldw	x,#630
2848  064d 89            	pushw	x
2849  064e ae0000        	ldw	x,#0
2850  0651 89            	pushw	x
2851  0652 ae0000        	ldw	x,#L502
2852  0655 cd0000        	call	_assert_failed
2854  0658 5b04          	addw	sp,#4
2855  065a               L643:
2856                     ; 631     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2858  065a 0d02          	tnz	(OFST+2,sp)
2859  065c 2706          	jreq	L253
2860  065e 7b02          	ld	a,(OFST+2,sp)
2861  0660 a101          	cp	a,#1
2862  0662 2603          	jrne	L053
2863  0664               L253:
2864  0664 4f            	clr	a
2865  0665 2010          	jra	L453
2866  0667               L053:
2867  0667 ae0277        	ldw	x,#631
2868  066a 89            	pushw	x
2869  066b ae0000        	ldw	x,#0
2870  066e 89            	pushw	x
2871  066f ae0000        	ldw	x,#L502
2872  0672 cd0000        	call	_assert_failed
2874  0675 5b04          	addw	sp,#4
2875  0677               L453:
2876                     ; 633     if (TIM3_Channel == TIM3_CHANNEL_1)
2878  0677 0d01          	tnz	(OFST+1,sp)
2879  0679 2610          	jrne	L5311
2880                     ; 636         if (NewState != DISABLE)
2882  067b 0d02          	tnz	(OFST+2,sp)
2883  067d 2706          	jreq	L7311
2884                     ; 638             TIM3->CCER1 |= TIM3_CCER1_CC1E;
2886  067f 72105327      	bset	21287,#0
2888  0683 2014          	jra	L3411
2889  0685               L7311:
2890                     ; 642             TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
2892  0685 72115327      	bres	21287,#0
2893  0689 200e          	jra	L3411
2894  068b               L5311:
2895                     ; 649         if (NewState != DISABLE)
2897  068b 0d02          	tnz	(OFST+2,sp)
2898  068d 2706          	jreq	L5411
2899                     ; 651             TIM3->CCER1 |= TIM3_CCER1_CC2E;
2901  068f 72185327      	bset	21287,#4
2903  0693 2004          	jra	L3411
2904  0695               L5411:
2905                     ; 655             TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
2907  0695 72195327      	bres	21287,#4
2908  0699               L3411:
2909                     ; 659 }
2912  0699 85            	popw	x
2913  069a 81            	ret
2959                     ; 680 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel, TIM3_OCMode_TypeDef TIM3_OCMode)
2959                     ; 681 {
2960                     	switch	.text
2961  069b               _TIM3_SelectOCxM:
2963  069b 89            	pushw	x
2964       00000000      OFST:	set	0
2967                     ; 683     assert_param(IS_TIM3_CHANNEL_OK(TIM3_Channel));
2969  069c 9e            	ld	a,xh
2970  069d 4d            	tnz	a
2971  069e 2705          	jreq	L263
2972  06a0 9e            	ld	a,xh
2973  06a1 a101          	cp	a,#1
2974  06a3 2603          	jrne	L063
2975  06a5               L263:
2976  06a5 4f            	clr	a
2977  06a6 2010          	jra	L463
2978  06a8               L063:
2979  06a8 ae02ab        	ldw	x,#683
2980  06ab 89            	pushw	x
2981  06ac ae0000        	ldw	x,#0
2982  06af 89            	pushw	x
2983  06b0 ae0000        	ldw	x,#L502
2984  06b3 cd0000        	call	_assert_failed
2986  06b6 5b04          	addw	sp,#4
2987  06b8               L463:
2988                     ; 684     assert_param(IS_TIM3_OCM_OK(TIM3_OCMode));
2990  06b8 0d02          	tnz	(OFST+2,sp)
2991  06ba 272a          	jreq	L073
2992  06bc 7b02          	ld	a,(OFST+2,sp)
2993  06be a110          	cp	a,#16
2994  06c0 2724          	jreq	L073
2995  06c2 7b02          	ld	a,(OFST+2,sp)
2996  06c4 a120          	cp	a,#32
2997  06c6 271e          	jreq	L073
2998  06c8 7b02          	ld	a,(OFST+2,sp)
2999  06ca a130          	cp	a,#48
3000  06cc 2718          	jreq	L073
3001  06ce 7b02          	ld	a,(OFST+2,sp)
3002  06d0 a160          	cp	a,#96
3003  06d2 2712          	jreq	L073
3004  06d4 7b02          	ld	a,(OFST+2,sp)
3005  06d6 a170          	cp	a,#112
3006  06d8 270c          	jreq	L073
3007  06da 7b02          	ld	a,(OFST+2,sp)
3008  06dc a150          	cp	a,#80
3009  06de 2706          	jreq	L073
3010  06e0 7b02          	ld	a,(OFST+2,sp)
3011  06e2 a140          	cp	a,#64
3012  06e4 2603          	jrne	L663
3013  06e6               L073:
3014  06e6 4f            	clr	a
3015  06e7 2010          	jra	L273
3016  06e9               L663:
3017  06e9 ae02ac        	ldw	x,#684
3018  06ec 89            	pushw	x
3019  06ed ae0000        	ldw	x,#0
3020  06f0 89            	pushw	x
3021  06f1 ae0000        	ldw	x,#L502
3022  06f4 cd0000        	call	_assert_failed
3024  06f7 5b04          	addw	sp,#4
3025  06f9               L273:
3026                     ; 686     if (TIM3_Channel == TIM3_CHANNEL_1)
3028  06f9 0d01          	tnz	(OFST+1,sp)
3029  06fb 2610          	jrne	L3711
3030                     ; 689         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
3032  06fd 72115327      	bres	21287,#0
3033                     ; 692         TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
3035  0701 c65325        	ld	a,21285
3036  0704 a48f          	and	a,#143
3037  0706 1a02          	or	a,(OFST+2,sp)
3038  0708 c75325        	ld	21285,a
3040  070b 200e          	jra	L5711
3041  070d               L3711:
3042                     ; 697         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2E);
3044  070d 72195327      	bres	21287,#4
3045                     ; 700         TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_OCM)) | (uint8_t)TIM3_OCMode);
3047  0711 c65326        	ld	a,21286
3048  0714 a48f          	and	a,#143
3049  0716 1a02          	or	a,(OFST+2,sp)
3050  0718 c75326        	ld	21286,a
3051  071b               L5711:
3052                     ; 702 }
3055  071b 85            	popw	x
3056  071c 81            	ret
3090                     ; 711 void TIM3_SetCounter(uint16_t Counter)
3090                     ; 712 {
3091                     	switch	.text
3092  071d               _TIM3_SetCounter:
3096                     ; 714     TIM3->CNTRH = (uint8_t)(Counter >> 8);
3098  071d 9e            	ld	a,xh
3099  071e c75328        	ld	21288,a
3100                     ; 715     TIM3->CNTRL = (uint8_t)(Counter);
3102  0721 9f            	ld	a,xl
3103  0722 c75329        	ld	21289,a
3104                     ; 717 }
3107  0725 81            	ret
3141                     ; 726 void TIM3_SetAutoreload(uint16_t Autoreload)
3141                     ; 727 {
3142                     	switch	.text
3143  0726               _TIM3_SetAutoreload:
3147                     ; 729     TIM3->ARRH = (uint8_t)(Autoreload >> 8);
3149  0726 9e            	ld	a,xh
3150  0727 c7532b        	ld	21291,a
3151                     ; 730     TIM3->ARRL = (uint8_t)(Autoreload);
3153  072a 9f            	ld	a,xl
3154  072b c7532c        	ld	21292,a
3155                     ; 731 }
3158  072e 81            	ret
3192                     ; 740 void TIM3_SetCompare1(uint16_t Compare1)
3192                     ; 741 {
3193                     	switch	.text
3194  072f               _TIM3_SetCompare1:
3198                     ; 743     TIM3->CCR1H = (uint8_t)(Compare1 >> 8);
3200  072f 9e            	ld	a,xh
3201  0730 c7532d        	ld	21293,a
3202                     ; 744     TIM3->CCR1L = (uint8_t)(Compare1);
3204  0733 9f            	ld	a,xl
3205  0734 c7532e        	ld	21294,a
3206                     ; 745 }
3209  0737 81            	ret
3243                     ; 754 void TIM3_SetCompare2(uint16_t Compare2)
3243                     ; 755 {
3244                     	switch	.text
3245  0738               _TIM3_SetCompare2:
3249                     ; 757     TIM3->CCR2H = (uint8_t)(Compare2 >> 8);
3251  0738 9e            	ld	a,xh
3252  0739 c7532f        	ld	21295,a
3253                     ; 758     TIM3->CCR2L = (uint8_t)(Compare2);
3255  073c 9f            	ld	a,xl
3256  073d c75330        	ld	21296,a
3257                     ; 759 }
3260  0740 81            	ret
3297                     ; 772 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
3297                     ; 773 {
3298                     	switch	.text
3299  0741               _TIM3_SetIC1Prescaler:
3301  0741 88            	push	a
3302       00000000      OFST:	set	0
3305                     ; 775     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC1Prescaler));
3307  0742 4d            	tnz	a
3308  0743 270c          	jreq	L014
3309  0745 a104          	cp	a,#4
3310  0747 2708          	jreq	L014
3311  0749 a108          	cp	a,#8
3312  074b 2704          	jreq	L014
3313  074d a10c          	cp	a,#12
3314  074f 2603          	jrne	L604
3315  0751               L014:
3316  0751 4f            	clr	a
3317  0752 2010          	jra	L214
3318  0754               L604:
3319  0754 ae0307        	ldw	x,#775
3320  0757 89            	pushw	x
3321  0758 ae0000        	ldw	x,#0
3322  075b 89            	pushw	x
3323  075c ae0000        	ldw	x,#L502
3324  075f cd0000        	call	_assert_failed
3326  0762 5b04          	addw	sp,#4
3327  0764               L214:
3328                     ; 778     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC1Prescaler);
3330  0764 c65325        	ld	a,21285
3331  0767 a4f3          	and	a,#243
3332  0769 1a01          	or	a,(OFST+1,sp)
3333  076b c75325        	ld	21285,a
3334                     ; 779 }
3337  076e 84            	pop	a
3338  076f 81            	ret
3375                     ; 791 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
3375                     ; 792 {
3376                     	switch	.text
3377  0770               _TIM3_SetIC2Prescaler:
3379  0770 88            	push	a
3380       00000000      OFST:	set	0
3383                     ; 794     assert_param(IS_TIM3_IC_PRESCALER_OK(TIM3_IC2Prescaler));
3385  0771 4d            	tnz	a
3386  0772 270c          	jreq	L024
3387  0774 a104          	cp	a,#4
3388  0776 2708          	jreq	L024
3389  0778 a108          	cp	a,#8
3390  077a 2704          	jreq	L024
3391  077c a10c          	cp	a,#12
3392  077e 2603          	jrne	L614
3393  0780               L024:
3394  0780 4f            	clr	a
3395  0781 2010          	jra	L224
3396  0783               L614:
3397  0783 ae031a        	ldw	x,#794
3398  0786 89            	pushw	x
3399  0787 ae0000        	ldw	x,#0
3400  078a 89            	pushw	x
3401  078b ae0000        	ldw	x,#L502
3402  078e cd0000        	call	_assert_failed
3404  0791 5b04          	addw	sp,#4
3405  0793               L224:
3406                     ; 797     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~TIM3_CCMR_ICxPSC)) | (uint8_t)TIM3_IC2Prescaler);
3408  0793 c65326        	ld	a,21286
3409  0796 a4f3          	and	a,#243
3410  0798 1a01          	or	a,(OFST+1,sp)
3411  079a c75326        	ld	21286,a
3412                     ; 798 }
3415  079d 84            	pop	a
3416  079e 81            	ret
3468                     ; 804 uint16_t TIM3_GetCapture1(void)
3468                     ; 805 {
3469                     	switch	.text
3470  079f               _TIM3_GetCapture1:
3472  079f 5204          	subw	sp,#4
3473       00000004      OFST:	set	4
3476                     ; 807     uint16_t tmpccr1 = 0;
3478  07a1 1e03          	ldw	x,(OFST-1,sp)
3479                     ; 808     uint8_t tmpccr1l=0, tmpccr1h=0;
3481  07a3 7b01          	ld	a,(OFST-3,sp)
3482  07a5 97            	ld	xl,a
3485  07a6 7b02          	ld	a,(OFST-2,sp)
3486  07a8 97            	ld	xl,a
3487                     ; 810     tmpccr1h = TIM3->CCR1H;
3489  07a9 c6532d        	ld	a,21293
3490  07ac 6b02          	ld	(OFST-2,sp),a
3491                     ; 811     tmpccr1l = TIM3->CCR1L;
3493  07ae c6532e        	ld	a,21294
3494  07b1 6b01          	ld	(OFST-3,sp),a
3495                     ; 813     tmpccr1 = (uint16_t)(tmpccr1l);
3497  07b3 7b01          	ld	a,(OFST-3,sp)
3498  07b5 5f            	clrw	x
3499  07b6 97            	ld	xl,a
3500  07b7 1f03          	ldw	(OFST-1,sp),x
3501                     ; 814     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3503  07b9 7b02          	ld	a,(OFST-2,sp)
3504  07bb 5f            	clrw	x
3505  07bc 97            	ld	xl,a
3506  07bd 4f            	clr	a
3507  07be 02            	rlwa	x,a
3508  07bf 01            	rrwa	x,a
3509  07c0 1a04          	or	a,(OFST+0,sp)
3510  07c2 01            	rrwa	x,a
3511  07c3 1a03          	or	a,(OFST-1,sp)
3512  07c5 01            	rrwa	x,a
3513  07c6 1f03          	ldw	(OFST-1,sp),x
3514                     ; 816     return (uint16_t)tmpccr1;
3516  07c8 1e03          	ldw	x,(OFST-1,sp)
3519  07ca 5b04          	addw	sp,#4
3520  07cc 81            	ret
3572                     ; 824 uint16_t TIM3_GetCapture2(void)
3572                     ; 825 {
3573                     	switch	.text
3574  07cd               _TIM3_GetCapture2:
3576  07cd 5204          	subw	sp,#4
3577       00000004      OFST:	set	4
3580                     ; 827     uint16_t tmpccr2 = 0;
3582  07cf 1e03          	ldw	x,(OFST-1,sp)
3583                     ; 828     uint8_t tmpccr2l=0, tmpccr2h=0;
3585  07d1 7b01          	ld	a,(OFST-3,sp)
3586  07d3 97            	ld	xl,a
3589  07d4 7b02          	ld	a,(OFST-2,sp)
3590  07d6 97            	ld	xl,a
3591                     ; 830     tmpccr2h = TIM3->CCR2H;
3593  07d7 c6532f        	ld	a,21295
3594  07da 6b02          	ld	(OFST-2,sp),a
3595                     ; 831     tmpccr2l = TIM3->CCR2L;
3597  07dc c65330        	ld	a,21296
3598  07df 6b01          	ld	(OFST-3,sp),a
3599                     ; 833     tmpccr2 = (uint16_t)(tmpccr2l);
3601  07e1 7b01          	ld	a,(OFST-3,sp)
3602  07e3 5f            	clrw	x
3603  07e4 97            	ld	xl,a
3604  07e5 1f03          	ldw	(OFST-1,sp),x
3605                     ; 834     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3607  07e7 7b02          	ld	a,(OFST-2,sp)
3608  07e9 5f            	clrw	x
3609  07ea 97            	ld	xl,a
3610  07eb 4f            	clr	a
3611  07ec 02            	rlwa	x,a
3612  07ed 01            	rrwa	x,a
3613  07ee 1a04          	or	a,(OFST+0,sp)
3614  07f0 01            	rrwa	x,a
3615  07f1 1a03          	or	a,(OFST-1,sp)
3616  07f3 01            	rrwa	x,a
3617  07f4 1f03          	ldw	(OFST-1,sp),x
3618                     ; 836     return (uint16_t)tmpccr2;
3620  07f6 1e03          	ldw	x,(OFST-1,sp)
3623  07f8 5b04          	addw	sp,#4
3624  07fa 81            	ret
3658                     ; 844 uint16_t TIM3_GetCounter(void)
3658                     ; 845 {
3659                     	switch	.text
3660  07fb               _TIM3_GetCounter:
3662  07fb 89            	pushw	x
3663       00000002      OFST:	set	2
3666                     ; 846    uint16_t tmpcntr = 0;
3668  07fc 5f            	clrw	x
3669  07fd 1f01          	ldw	(OFST-1,sp),x
3670                     ; 848    tmpcntr = ((uint16_t)TIM3->CNTRH << 8);
3672  07ff c65328        	ld	a,21288
3673  0802 5f            	clrw	x
3674  0803 97            	ld	xl,a
3675  0804 4f            	clr	a
3676  0805 02            	rlwa	x,a
3677  0806 1f01          	ldw	(OFST-1,sp),x
3678                     ; 850     return (uint16_t)( tmpcntr| (uint16_t)(TIM3->CNTRL));
3680  0808 c65329        	ld	a,21289
3681  080b 5f            	clrw	x
3682  080c 97            	ld	xl,a
3683  080d 01            	rrwa	x,a
3684  080e 1a02          	or	a,(OFST+0,sp)
3685  0810 01            	rrwa	x,a
3686  0811 1a01          	or	a,(OFST-1,sp)
3687  0813 01            	rrwa	x,a
3690  0814 5b02          	addw	sp,#2
3691  0816 81            	ret
3715                     ; 859 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
3715                     ; 860 {
3716                     	switch	.text
3717  0817               _TIM3_GetPrescaler:
3721                     ; 862     return (TIM3_Prescaler_TypeDef)(TIM3->PSCR);
3723  0817 c6532a        	ld	a,21290
3726  081a 81            	ret
3852                     ; 877 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
3852                     ; 878 {
3853                     	switch	.text
3854  081b               _TIM3_GetFlagStatus:
3856  081b 89            	pushw	x
3857  081c 89            	pushw	x
3858       00000002      OFST:	set	2
3861                     ; 879    FlagStatus bitstatus = RESET;
3863  081d 7b02          	ld	a,(OFST+0,sp)
3864  081f 97            	ld	xl,a
3865                     ; 880    uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
3867  0820 7b01          	ld	a,(OFST-1,sp)
3868  0822 97            	ld	xl,a
3871  0823 7b02          	ld	a,(OFST+0,sp)
3872  0825 97            	ld	xl,a
3873                     ; 883     assert_param(IS_TIM3_GET_FLAG_OK(TIM3_FLAG));
3875  0826 1e03          	ldw	x,(OFST+1,sp)
3876  0828 a30001        	cpw	x,#1
3877  082b 271c          	jreq	L044
3878  082d 1e03          	ldw	x,(OFST+1,sp)
3879  082f a30002        	cpw	x,#2
3880  0832 2715          	jreq	L044
3881  0834 1e03          	ldw	x,(OFST+1,sp)
3882  0836 a30004        	cpw	x,#4
3883  0839 270e          	jreq	L044
3884  083b 1e03          	ldw	x,(OFST+1,sp)
3885  083d a30200        	cpw	x,#512
3886  0840 2707          	jreq	L044
3887  0842 1e03          	ldw	x,(OFST+1,sp)
3888  0844 a30400        	cpw	x,#1024
3889  0847 2603          	jrne	L634
3890  0849               L044:
3891  0849 4f            	clr	a
3892  084a 2010          	jra	L244
3893  084c               L634:
3894  084c ae0373        	ldw	x,#883
3895  084f 89            	pushw	x
3896  0850 ae0000        	ldw	x,#0
3897  0853 89            	pushw	x
3898  0854 ae0000        	ldw	x,#L502
3899  0857 cd0000        	call	_assert_failed
3901  085a 5b04          	addw	sp,#4
3902  085c               L244:
3903                     ; 885     tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_FLAG);
3905  085c c65322        	ld	a,21282
3906  085f 1404          	and	a,(OFST+2,sp)
3907  0861 6b01          	ld	(OFST-1,sp),a
3908                     ; 886     tim3_flag_h = (uint8_t)((uint16_t)TIM3_FLAG >> 8);
3910  0863 7b03          	ld	a,(OFST+1,sp)
3911  0865 6b02          	ld	(OFST+0,sp),a
3912                     ; 888     if (((tim3_flag_l) | (uint8_t)(TIM3->SR2 & tim3_flag_h)) != (uint8_t)RESET )
3914  0867 c65323        	ld	a,21283
3915  086a 1402          	and	a,(OFST+0,sp)
3916  086c 1a01          	or	a,(OFST-1,sp)
3917  086e 2706          	jreq	L5051
3918                     ; 890         bitstatus = SET;
3920  0870 a601          	ld	a,#1
3921  0872 6b02          	ld	(OFST+0,sp),a
3923  0874 2002          	jra	L7051
3924  0876               L5051:
3925                     ; 894         bitstatus = RESET;
3927  0876 0f02          	clr	(OFST+0,sp)
3928  0878               L7051:
3929                     ; 896     return (FlagStatus)bitstatus;
3931  0878 7b02          	ld	a,(OFST+0,sp)
3934  087a 5b04          	addw	sp,#4
3935  087c 81            	ret
3971                     ; 911 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3971                     ; 912 {
3972                     	switch	.text
3973  087d               _TIM3_ClearFlag:
3975  087d 89            	pushw	x
3976       00000000      OFST:	set	0
3979                     ; 914     assert_param(IS_TIM3_CLEAR_FLAG_OK(TIM3_FLAG));
3981  087e 01            	rrwa	x,a
3982  087f a4f8          	and	a,#248
3983  0881 01            	rrwa	x,a
3984  0882 a4f9          	and	a,#249
3985  0884 01            	rrwa	x,a
3986  0885 a30000        	cpw	x,#0
3987  0888 2607          	jrne	L644
3988  088a 1e01          	ldw	x,(OFST+1,sp)
3989  088c 2703          	jreq	L644
3990  088e 4f            	clr	a
3991  088f 2010          	jra	L054
3992  0891               L644:
3993  0891 ae0392        	ldw	x,#914
3994  0894 89            	pushw	x
3995  0895 ae0000        	ldw	x,#0
3996  0898 89            	pushw	x
3997  0899 ae0000        	ldw	x,#L502
3998  089c cd0000        	call	_assert_failed
4000  089f 5b04          	addw	sp,#4
4001  08a1               L054:
4002                     ; 917     TIM3->SR1 = (uint8_t)(~((uint8_t)(TIM3_FLAG)));
4004  08a1 7b02          	ld	a,(OFST+2,sp)
4005  08a3 43            	cpl	a
4006  08a4 c75322        	ld	21282,a
4007                     ; 918     TIM3->SR2 = (uint8_t)(~((uint8_t)((uint16_t)TIM3_FLAG >> 8)));
4009  08a7 7b01          	ld	a,(OFST+1,sp)
4010  08a9 43            	cpl	a
4011  08aa c75323        	ld	21283,a
4012                     ; 919 }
4015  08ad 85            	popw	x
4016  08ae 81            	ret
4081                     ; 932 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
4081                     ; 933 {
4082                     	switch	.text
4083  08af               _TIM3_GetITStatus:
4085  08af 88            	push	a
4086  08b0 89            	pushw	x
4087       00000002      OFST:	set	2
4090                     ; 934     ITStatus bitstatus = RESET;
4092  08b1 7b02          	ld	a,(OFST+0,sp)
4093  08b3 97            	ld	xl,a
4094                     ; 935     uint8_t TIM3_itStatus = 0, TIM3_itEnable = 0;
4096  08b4 7b01          	ld	a,(OFST-1,sp)
4097  08b6 97            	ld	xl,a
4100  08b7 7b02          	ld	a,(OFST+0,sp)
4101  08b9 97            	ld	xl,a
4102                     ; 938     assert_param(IS_TIM3_GET_IT_OK(TIM3_IT));
4104  08ba 7b03          	ld	a,(OFST+1,sp)
4105  08bc a101          	cp	a,#1
4106  08be 270c          	jreq	L654
4107  08c0 7b03          	ld	a,(OFST+1,sp)
4108  08c2 a102          	cp	a,#2
4109  08c4 2706          	jreq	L654
4110  08c6 7b03          	ld	a,(OFST+1,sp)
4111  08c8 a104          	cp	a,#4
4112  08ca 2603          	jrne	L454
4113  08cc               L654:
4114  08cc 4f            	clr	a
4115  08cd 2010          	jra	L064
4116  08cf               L454:
4117  08cf ae03aa        	ldw	x,#938
4118  08d2 89            	pushw	x
4119  08d3 ae0000        	ldw	x,#0
4120  08d6 89            	pushw	x
4121  08d7 ae0000        	ldw	x,#L502
4122  08da cd0000        	call	_assert_failed
4124  08dd 5b04          	addw	sp,#4
4125  08df               L064:
4126                     ; 940     TIM3_itStatus = (uint8_t)(TIM3->SR1 & TIM3_IT);
4128  08df c65322        	ld	a,21282
4129  08e2 1403          	and	a,(OFST+1,sp)
4130  08e4 6b01          	ld	(OFST-1,sp),a
4131                     ; 942     TIM3_itEnable = (uint8_t)(TIM3->IER & TIM3_IT);
4133  08e6 c65321        	ld	a,21281
4134  08e9 1403          	and	a,(OFST+1,sp)
4135  08eb 6b02          	ld	(OFST+0,sp),a
4136                     ; 944     if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET ))
4138  08ed 0d01          	tnz	(OFST-1,sp)
4139  08ef 270a          	jreq	L1651
4141  08f1 0d02          	tnz	(OFST+0,sp)
4142  08f3 2706          	jreq	L1651
4143                     ; 946         bitstatus = SET;
4145  08f5 a601          	ld	a,#1
4146  08f7 6b02          	ld	(OFST+0,sp),a
4148  08f9 2002          	jra	L3651
4149  08fb               L1651:
4150                     ; 950         bitstatus = RESET;
4152  08fb 0f02          	clr	(OFST+0,sp)
4153  08fd               L3651:
4154                     ; 952     return (ITStatus)(bitstatus);
4156  08fd 7b02          	ld	a,(OFST+0,sp)
4159  08ff 5b03          	addw	sp,#3
4160  0901 81            	ret
4197                     ; 965 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
4197                     ; 966 {
4198                     	switch	.text
4199  0902               _TIM3_ClearITPendingBit:
4201  0902 88            	push	a
4202       00000000      OFST:	set	0
4205                     ; 968     assert_param(IS_TIM3_IT_OK(TIM3_IT));
4207  0903 4d            	tnz	a
4208  0904 2707          	jreq	L464
4209  0906 a108          	cp	a,#8
4210  0908 2403          	jruge	L464
4211  090a 4f            	clr	a
4212  090b 2010          	jra	L664
4213  090d               L464:
4214  090d ae03c8        	ldw	x,#968
4215  0910 89            	pushw	x
4216  0911 ae0000        	ldw	x,#0
4217  0914 89            	pushw	x
4218  0915 ae0000        	ldw	x,#L502
4219  0918 cd0000        	call	_assert_failed
4221  091b 5b04          	addw	sp,#4
4222  091d               L664:
4223                     ; 971     TIM3->SR1 = (uint8_t)(~TIM3_IT);
4225  091d 7b01          	ld	a,(OFST+1,sp)
4226  091f 43            	cpl	a
4227  0920 c75322        	ld	21282,a
4228                     ; 972 }
4231  0923 84            	pop	a
4232  0924 81            	ret
4284                     ; 991 static void TI1_Config(uint8_t TIM3_ICPolarity,
4284                     ; 992                        uint8_t TIM3_ICSelection,
4284                     ; 993                        uint8_t TIM3_ICFilter)
4284                     ; 994 {
4285                     	switch	.text
4286  0925               L3_TI1_Config:
4288  0925 89            	pushw	x
4289  0926 88            	push	a
4290       00000001      OFST:	set	1
4293                     ; 996     TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1E);
4295  0927 72115327      	bres	21287,#0
4296                     ; 999     TIM3->CCMR1 = (uint8_t)((uint8_t)(TIM3->CCMR1 & (uint8_t)(~( TIM3_CCMR_CCxS | TIM3_CCMR_ICxF))) | (uint8_t)(( (TIM3_ICSelection)) | ((uint8_t)( TIM3_ICFilter << 4))));
4298  092b 7b06          	ld	a,(OFST+5,sp)
4299  092d 97            	ld	xl,a
4300  092e a610          	ld	a,#16
4301  0930 42            	mul	x,a
4302  0931 9f            	ld	a,xl
4303  0932 1a03          	or	a,(OFST+2,sp)
4304  0934 6b01          	ld	(OFST+0,sp),a
4305  0936 c65325        	ld	a,21285
4306  0939 a40c          	and	a,#12
4307  093b 1a01          	or	a,(OFST+0,sp)
4308  093d c75325        	ld	21285,a
4309                     ; 1002     if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
4311  0940 0d02          	tnz	(OFST+1,sp)
4312  0942 2706          	jreq	L1361
4313                     ; 1004         TIM3->CCER1 |= TIM3_CCER1_CC1P;
4315  0944 72125327      	bset	21287,#1
4317  0948 2004          	jra	L3361
4318  094a               L1361:
4319                     ; 1008         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC1P);
4321  094a 72135327      	bres	21287,#1
4322  094e               L3361:
4323                     ; 1011     TIM3->CCER1 |= TIM3_CCER1_CC1E;
4325  094e 72105327      	bset	21287,#0
4326                     ; 1012 }
4329  0952 5b03          	addw	sp,#3
4330  0954 81            	ret
4382                     ; 1031 static void TI2_Config(uint8_t TIM3_ICPolarity,
4382                     ; 1032                        uint8_t TIM3_ICSelection,
4382                     ; 1033                        uint8_t TIM3_ICFilter)
4382                     ; 1034 {
4383                     	switch	.text
4384  0955               L5_TI2_Config:
4386  0955 89            	pushw	x
4387  0956 88            	push	a
4388       00000001      OFST:	set	1
4391                     ; 1036     TIM3->CCER1 &=  (uint8_t)(~TIM3_CCER1_CC2E);
4393  0957 72195327      	bres	21287,#4
4394                     ; 1039     TIM3->CCMR2 = (uint8_t)((uint8_t)(TIM3->CCMR2 & (uint8_t)(~( TIM3_CCMR_CCxS |
4394                     ; 1040                   TIM3_CCMR_ICxF    ))) | (uint8_t)(( (TIM3_ICSelection)) | 
4394                     ; 1041                   ((uint8_t)( TIM3_ICFilter << 4))));
4396  095b 7b06          	ld	a,(OFST+5,sp)
4397  095d 97            	ld	xl,a
4398  095e a610          	ld	a,#16
4399  0960 42            	mul	x,a
4400  0961 9f            	ld	a,xl
4401  0962 1a03          	or	a,(OFST+2,sp)
4402  0964 6b01          	ld	(OFST+0,sp),a
4403  0966 c65326        	ld	a,21286
4404  0969 a40c          	and	a,#12
4405  096b 1a01          	or	a,(OFST+0,sp)
4406  096d c75326        	ld	21286,a
4407                     ; 1044     if (TIM3_ICPolarity != TIM3_ICPOLARITY_RISING)
4409  0970 0d02          	tnz	(OFST+1,sp)
4410  0972 2706          	jreq	L3661
4411                     ; 1046         TIM3->CCER1 |= TIM3_CCER1_CC2P;
4413  0974 721a5327      	bset	21287,#5
4415  0978 2004          	jra	L5661
4416  097a               L3661:
4417                     ; 1050         TIM3->CCER1 &= (uint8_t)(~TIM3_CCER1_CC2P);
4419  097a 721b5327      	bres	21287,#5
4420  097e               L5661:
4421                     ; 1054     TIM3->CCER1 |= TIM3_CCER1_CC2E;
4423  097e 72185327      	bset	21287,#4
4424                     ; 1056 }
4427  0982 5b03          	addw	sp,#3
4428  0984 81            	ret
4441                     	xdef	_TIM3_ClearITPendingBit
4442                     	xdef	_TIM3_GetITStatus
4443                     	xdef	_TIM3_ClearFlag
4444                     	xdef	_TIM3_GetFlagStatus
4445                     	xdef	_TIM3_GetPrescaler
4446                     	xdef	_TIM3_GetCounter
4447                     	xdef	_TIM3_GetCapture2
4448                     	xdef	_TIM3_GetCapture1
4449                     	xdef	_TIM3_SetIC2Prescaler
4450                     	xdef	_TIM3_SetIC1Prescaler
4451                     	xdef	_TIM3_SetCompare2
4452                     	xdef	_TIM3_SetCompare1
4453                     	xdef	_TIM3_SetAutoreload
4454                     	xdef	_TIM3_SetCounter
4455                     	xdef	_TIM3_SelectOCxM
4456                     	xdef	_TIM3_CCxCmd
4457                     	xdef	_TIM3_OC2PolarityConfig
4458                     	xdef	_TIM3_OC1PolarityConfig
4459                     	xdef	_TIM3_GenerateEvent
4460                     	xdef	_TIM3_OC2PreloadConfig
4461                     	xdef	_TIM3_OC1PreloadConfig
4462                     	xdef	_TIM3_ARRPreloadConfig
4463                     	xdef	_TIM3_ForcedOC2Config
4464                     	xdef	_TIM3_ForcedOC1Config
4465                     	xdef	_TIM3_PrescalerConfig
4466                     	xdef	_TIM3_SelectOnePulseMode
4467                     	xdef	_TIM3_UpdateRequestConfig
4468                     	xdef	_TIM3_UpdateDisableConfig
4469                     	xdef	_TIM3_ITConfig
4470                     	xdef	_TIM3_Cmd
4471                     	xdef	_TIM3_PWMIConfig
4472                     	xdef	_TIM3_ICInit
4473                     	xdef	_TIM3_OC2Init
4474                     	xdef	_TIM3_OC1Init
4475                     	xdef	_TIM3_TimeBaseInit
4476                     	xdef	_TIM3_DeInit
4477                     	xref	_assert_failed
4478                     .const:	section	.text
4479  0000               L502:
4480  0000 66776c69625c  	dc.b	"fwlib\src\stm8s_ti"
4481  0012 6d332e6300    	dc.b	"m3.c",0
4501                     	end
