   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 48 void ADC2_DeInit(void)
  32                     ; 49 {
  34                     	switch	.text
  35  0000               _ADC2_DeInit:
  39                     ; 50     ADC2->CSR  = ADC2_CSR_RESET_VALUE;
  41  0000 725f5400      	clr	21504
  42                     ; 51     ADC2->CR1  = ADC2_CR1_RESET_VALUE;
  44  0004 725f5401      	clr	21505
  45                     ; 52     ADC2->CR2  = ADC2_CR2_RESET_VALUE;
  47  0008 725f5402      	clr	21506
  48                     ; 53     ADC2->TDRH = ADC2_TDRH_RESET_VALUE;
  50  000c 725f5406      	clr	21510
  51                     ; 54     ADC2->TDRL = ADC2_TDRL_RESET_VALUE;
  53  0010 725f5407      	clr	21511
  54                     ; 55 }
  57  0014 81            	ret
 584                     ; 77 void ADC2_Init(ADC2_ConvMode_TypeDef ADC2_ConversionMode, ADC2_Channel_TypeDef ADC2_Channel, ADC2_PresSel_TypeDef ADC2_PrescalerSelection, ADC2_ExtTrig_TypeDef ADC2_ExtTrigger, FunctionalState ADC2_ExtTriggerState, ADC2_Align_TypeDef ADC2_Align, ADC2_SchmittTrigg_TypeDef ADC2_SchmittTriggerChannel, FunctionalState ADC2_SchmittTriggerState)
 584                     ; 78 {
 585                     	switch	.text
 586  0015               _ADC2_Init:
 588  0015 89            	pushw	x
 589       00000000      OFST:	set	0
 592                     ; 81     assert_param(IS_ADC2_CONVERSIONMODE_OK(ADC2_ConversionMode));
 594  0016 9e            	ld	a,xh
 595  0017 4d            	tnz	a
 596  0018 2705          	jreq	L21
 597  001a 9e            	ld	a,xh
 598  001b a101          	cp	a,#1
 599  001d 2603          	jrne	L01
 600  001f               L21:
 601  001f 4f            	clr	a
 602  0020 2010          	jra	L41
 603  0022               L01:
 604  0022 ae0051        	ldw	x,#81
 605  0025 89            	pushw	x
 606  0026 ae0000        	ldw	x,#0
 607  0029 89            	pushw	x
 608  002a ae0000        	ldw	x,#L172
 609  002d cd0000        	call	_assert_failed
 611  0030 5b04          	addw	sp,#4
 612  0032               L41:
 613                     ; 82     assert_param(IS_ADC2_CHANNEL_OK(ADC2_Channel));
 615  0032 0d02          	tnz	(OFST+2,sp)
 616  0034 275a          	jreq	L02
 617  0036 7b02          	ld	a,(OFST+2,sp)
 618  0038 a101          	cp	a,#1
 619  003a 2754          	jreq	L02
 620  003c 7b02          	ld	a,(OFST+2,sp)
 621  003e a102          	cp	a,#2
 622  0040 274e          	jreq	L02
 623  0042 7b02          	ld	a,(OFST+2,sp)
 624  0044 a103          	cp	a,#3
 625  0046 2748          	jreq	L02
 626  0048 7b02          	ld	a,(OFST+2,sp)
 627  004a a104          	cp	a,#4
 628  004c 2742          	jreq	L02
 629  004e 7b02          	ld	a,(OFST+2,sp)
 630  0050 a105          	cp	a,#5
 631  0052 273c          	jreq	L02
 632  0054 7b02          	ld	a,(OFST+2,sp)
 633  0056 a106          	cp	a,#6
 634  0058 2736          	jreq	L02
 635  005a 7b02          	ld	a,(OFST+2,sp)
 636  005c a107          	cp	a,#7
 637  005e 2730          	jreq	L02
 638  0060 7b02          	ld	a,(OFST+2,sp)
 639  0062 a108          	cp	a,#8
 640  0064 272a          	jreq	L02
 641  0066 7b02          	ld	a,(OFST+2,sp)
 642  0068 a109          	cp	a,#9
 643  006a 2724          	jreq	L02
 644  006c 7b02          	ld	a,(OFST+2,sp)
 645  006e a10a          	cp	a,#10
 646  0070 271e          	jreq	L02
 647  0072 7b02          	ld	a,(OFST+2,sp)
 648  0074 a10b          	cp	a,#11
 649  0076 2718          	jreq	L02
 650  0078 7b02          	ld	a,(OFST+2,sp)
 651  007a a10c          	cp	a,#12
 652  007c 2712          	jreq	L02
 653  007e 7b02          	ld	a,(OFST+2,sp)
 654  0080 a10d          	cp	a,#13
 655  0082 270c          	jreq	L02
 656  0084 7b02          	ld	a,(OFST+2,sp)
 657  0086 a10e          	cp	a,#14
 658  0088 2706          	jreq	L02
 659  008a 7b02          	ld	a,(OFST+2,sp)
 660  008c a10f          	cp	a,#15
 661  008e 2603          	jrne	L61
 662  0090               L02:
 663  0090 4f            	clr	a
 664  0091 2010          	jra	L22
 665  0093               L61:
 666  0093 ae0052        	ldw	x,#82
 667  0096 89            	pushw	x
 668  0097 ae0000        	ldw	x,#0
 669  009a 89            	pushw	x
 670  009b ae0000        	ldw	x,#L172
 671  009e cd0000        	call	_assert_failed
 673  00a1 5b04          	addw	sp,#4
 674  00a3               L22:
 675                     ; 83     assert_param(IS_ADC2_PRESSEL_OK(ADC2_PrescalerSelection));
 677  00a3 0d05          	tnz	(OFST+5,sp)
 678  00a5 272a          	jreq	L62
 679  00a7 7b05          	ld	a,(OFST+5,sp)
 680  00a9 a110          	cp	a,#16
 681  00ab 2724          	jreq	L62
 682  00ad 7b05          	ld	a,(OFST+5,sp)
 683  00af a120          	cp	a,#32
 684  00b1 271e          	jreq	L62
 685  00b3 7b05          	ld	a,(OFST+5,sp)
 686  00b5 a130          	cp	a,#48
 687  00b7 2718          	jreq	L62
 688  00b9 7b05          	ld	a,(OFST+5,sp)
 689  00bb a140          	cp	a,#64
 690  00bd 2712          	jreq	L62
 691  00bf 7b05          	ld	a,(OFST+5,sp)
 692  00c1 a150          	cp	a,#80
 693  00c3 270c          	jreq	L62
 694  00c5 7b05          	ld	a,(OFST+5,sp)
 695  00c7 a160          	cp	a,#96
 696  00c9 2706          	jreq	L62
 697  00cb 7b05          	ld	a,(OFST+5,sp)
 698  00cd a170          	cp	a,#112
 699  00cf 2603          	jrne	L42
 700  00d1               L62:
 701  00d1 4f            	clr	a
 702  00d2 2010          	jra	L03
 703  00d4               L42:
 704  00d4 ae0053        	ldw	x,#83
 705  00d7 89            	pushw	x
 706  00d8 ae0000        	ldw	x,#0
 707  00db 89            	pushw	x
 708  00dc ae0000        	ldw	x,#L172
 709  00df cd0000        	call	_assert_failed
 711  00e2 5b04          	addw	sp,#4
 712  00e4               L03:
 713                     ; 84     assert_param(IS_ADC2_EXTTRIG_OK(ADC2_ExtTrigger));
 715  00e4 0d06          	tnz	(OFST+6,sp)
 716  00e6 2706          	jreq	L43
 717  00e8 7b06          	ld	a,(OFST+6,sp)
 718  00ea a101          	cp	a,#1
 719  00ec 2603          	jrne	L23
 720  00ee               L43:
 721  00ee 4f            	clr	a
 722  00ef 2010          	jra	L63
 723  00f1               L23:
 724  00f1 ae0054        	ldw	x,#84
 725  00f4 89            	pushw	x
 726  00f5 ae0000        	ldw	x,#0
 727  00f8 89            	pushw	x
 728  00f9 ae0000        	ldw	x,#L172
 729  00fc cd0000        	call	_assert_failed
 731  00ff 5b04          	addw	sp,#4
 732  0101               L63:
 733                     ; 85     assert_param(IS_FUNCTIONALSTATE_OK(((ADC2_ExtTriggerState))));
 735  0101 0d07          	tnz	(OFST+7,sp)
 736  0103 2706          	jreq	L24
 737  0105 7b07          	ld	a,(OFST+7,sp)
 738  0107 a101          	cp	a,#1
 739  0109 2603          	jrne	L04
 740  010b               L24:
 741  010b 4f            	clr	a
 742  010c 2010          	jra	L44
 743  010e               L04:
 744  010e ae0055        	ldw	x,#85
 745  0111 89            	pushw	x
 746  0112 ae0000        	ldw	x,#0
 747  0115 89            	pushw	x
 748  0116 ae0000        	ldw	x,#L172
 749  0119 cd0000        	call	_assert_failed
 751  011c 5b04          	addw	sp,#4
 752  011e               L44:
 753                     ; 86     assert_param(IS_ADC2_ALIGN_OK(ADC2_Align));
 755  011e 0d08          	tnz	(OFST+8,sp)
 756  0120 2706          	jreq	L05
 757  0122 7b08          	ld	a,(OFST+8,sp)
 758  0124 a108          	cp	a,#8
 759  0126 2603          	jrne	L64
 760  0128               L05:
 761  0128 4f            	clr	a
 762  0129 2010          	jra	L25
 763  012b               L64:
 764  012b ae0056        	ldw	x,#86
 765  012e 89            	pushw	x
 766  012f ae0000        	ldw	x,#0
 767  0132 89            	pushw	x
 768  0133 ae0000        	ldw	x,#L172
 769  0136 cd0000        	call	_assert_failed
 771  0139 5b04          	addw	sp,#4
 772  013b               L25:
 773                     ; 87     assert_param(IS_ADC2_SCHMITTTRIG_OK(ADC2_SchmittTriggerChannel));
 775  013b 0d09          	tnz	(OFST+9,sp)
 776  013d 2760          	jreq	L65
 777  013f 7b09          	ld	a,(OFST+9,sp)
 778  0141 a101          	cp	a,#1
 779  0143 275a          	jreq	L65
 780  0145 7b09          	ld	a,(OFST+9,sp)
 781  0147 a102          	cp	a,#2
 782  0149 2754          	jreq	L65
 783  014b 7b09          	ld	a,(OFST+9,sp)
 784  014d a103          	cp	a,#3
 785  014f 274e          	jreq	L65
 786  0151 7b09          	ld	a,(OFST+9,sp)
 787  0153 a104          	cp	a,#4
 788  0155 2748          	jreq	L65
 789  0157 7b09          	ld	a,(OFST+9,sp)
 790  0159 a105          	cp	a,#5
 791  015b 2742          	jreq	L65
 792  015d 7b09          	ld	a,(OFST+9,sp)
 793  015f a106          	cp	a,#6
 794  0161 273c          	jreq	L65
 795  0163 7b09          	ld	a,(OFST+9,sp)
 796  0165 a107          	cp	a,#7
 797  0167 2736          	jreq	L65
 798  0169 7b09          	ld	a,(OFST+9,sp)
 799  016b a108          	cp	a,#8
 800  016d 2730          	jreq	L65
 801  016f 7b09          	ld	a,(OFST+9,sp)
 802  0171 a109          	cp	a,#9
 803  0173 272a          	jreq	L65
 804  0175 7b09          	ld	a,(OFST+9,sp)
 805  0177 a10a          	cp	a,#10
 806  0179 2724          	jreq	L65
 807  017b 7b09          	ld	a,(OFST+9,sp)
 808  017d a10b          	cp	a,#11
 809  017f 271e          	jreq	L65
 810  0181 7b09          	ld	a,(OFST+9,sp)
 811  0183 a10c          	cp	a,#12
 812  0185 2718          	jreq	L65
 813  0187 7b09          	ld	a,(OFST+9,sp)
 814  0189 a10d          	cp	a,#13
 815  018b 2712          	jreq	L65
 816  018d 7b09          	ld	a,(OFST+9,sp)
 817  018f a10e          	cp	a,#14
 818  0191 270c          	jreq	L65
 819  0193 7b09          	ld	a,(OFST+9,sp)
 820  0195 a10f          	cp	a,#15
 821  0197 2706          	jreq	L65
 822  0199 7b09          	ld	a,(OFST+9,sp)
 823  019b a11f          	cp	a,#31
 824  019d 2603          	jrne	L45
 825  019f               L65:
 826  019f 4f            	clr	a
 827  01a0 2010          	jra	L06
 828  01a2               L45:
 829  01a2 ae0057        	ldw	x,#87
 830  01a5 89            	pushw	x
 831  01a6 ae0000        	ldw	x,#0
 832  01a9 89            	pushw	x
 833  01aa ae0000        	ldw	x,#L172
 834  01ad cd0000        	call	_assert_failed
 836  01b0 5b04          	addw	sp,#4
 837  01b2               L06:
 838                     ; 88     assert_param(IS_FUNCTIONALSTATE_OK(ADC2_SchmittTriggerState));
 840  01b2 0d0a          	tnz	(OFST+10,sp)
 841  01b4 2706          	jreq	L46
 842  01b6 7b0a          	ld	a,(OFST+10,sp)
 843  01b8 a101          	cp	a,#1
 844  01ba 2603          	jrne	L26
 845  01bc               L46:
 846  01bc 4f            	clr	a
 847  01bd 2010          	jra	L66
 848  01bf               L26:
 849  01bf ae0058        	ldw	x,#88
 850  01c2 89            	pushw	x
 851  01c3 ae0000        	ldw	x,#0
 852  01c6 89            	pushw	x
 853  01c7 ae0000        	ldw	x,#L172
 854  01ca cd0000        	call	_assert_failed
 856  01cd 5b04          	addw	sp,#4
 857  01cf               L66:
 858                     ; 93     ADC2_ConversionConfig(ADC2_ConversionMode, ADC2_Channel, ADC2_Align);
 860  01cf 7b08          	ld	a,(OFST+8,sp)
 861  01d1 88            	push	a
 862  01d2 7b03          	ld	a,(OFST+3,sp)
 863  01d4 97            	ld	xl,a
 864  01d5 7b02          	ld	a,(OFST+2,sp)
 865  01d7 95            	ld	xh,a
 866  01d8 cd03a6        	call	_ADC2_ConversionConfig
 868  01db 84            	pop	a
 869                     ; 95     ADC2_PrescalerConfig(ADC2_PrescalerSelection);
 871  01dc 7b05          	ld	a,(OFST+5,sp)
 872  01de ad6e          	call	_ADC2_PrescalerConfig
 874                     ; 100     ADC2_ExternalTriggerConfig(ADC2_ExtTrigger, ADC2_ExtTriggerState);
 876  01e0 7b07          	ld	a,(OFST+7,sp)
 877  01e2 97            	ld	xl,a
 878  01e3 7b06          	ld	a,(OFST+6,sp)
 879  01e5 95            	ld	xh,a
 880  01e6 cd047f        	call	_ADC2_ExternalTriggerConfig
 882                     ; 105     ADC2_SchmittTriggerConfig(ADC2_SchmittTriggerChannel, ADC2_SchmittTriggerState);
 884  01e9 7b0a          	ld	a,(OFST+10,sp)
 885  01eb 97            	ld	xl,a
 886  01ec 7b09          	ld	a,(OFST+9,sp)
 887  01ee 95            	ld	xh,a
 888  01ef cd0293        	call	_ADC2_SchmittTriggerConfig
 890                     ; 108     ADC2->CR1 |= ADC2_CR1_ADON;
 892  01f2 72105401      	bset	21505,#0
 893                     ; 110 }
 896  01f6 85            	popw	x
 897  01f7 81            	ret
 933                     ; 118 void ADC2_Cmd(FunctionalState NewState)
 933                     ; 119 {
 934                     	switch	.text
 935  01f8               _ADC2_Cmd:
 937  01f8 88            	push	a
 938       00000000      OFST:	set	0
 941                     ; 122     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 943  01f9 4d            	tnz	a
 944  01fa 2704          	jreq	L47
 945  01fc a101          	cp	a,#1
 946  01fe 2603          	jrne	L27
 947  0200               L47:
 948  0200 4f            	clr	a
 949  0201 2010          	jra	L67
 950  0203               L27:
 951  0203 ae007a        	ldw	x,#122
 952  0206 89            	pushw	x
 953  0207 ae0000        	ldw	x,#0
 954  020a 89            	pushw	x
 955  020b ae0000        	ldw	x,#L172
 956  020e cd0000        	call	_assert_failed
 958  0211 5b04          	addw	sp,#4
 959  0213               L67:
 960                     ; 124     if (NewState != DISABLE)
 962  0213 0d01          	tnz	(OFST+1,sp)
 963  0215 2706          	jreq	L113
 964                     ; 126         ADC2->CR1 |= ADC2_CR1_ADON;
 966  0217 72105401      	bset	21505,#0
 968  021b 2004          	jra	L313
 969  021d               L113:
 970                     ; 130         ADC2->CR1 &= (uint8_t)(~ADC2_CR1_ADON);
 972  021d 72115401      	bres	21505,#0
 973  0221               L313:
 974                     ; 133 }
 977  0221 84            	pop	a
 978  0222 81            	ret
1014                     ; 140 void ADC2_ITConfig(FunctionalState NewState)
1014                     ; 141 {
1015                     	switch	.text
1016  0223               _ADC2_ITConfig:
1018  0223 88            	push	a
1019       00000000      OFST:	set	0
1022                     ; 144     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1024  0224 4d            	tnz	a
1025  0225 2704          	jreq	L401
1026  0227 a101          	cp	a,#1
1027  0229 2603          	jrne	L201
1028  022b               L401:
1029  022b 4f            	clr	a
1030  022c 2010          	jra	L601
1031  022e               L201:
1032  022e ae0090        	ldw	x,#144
1033  0231 89            	pushw	x
1034  0232 ae0000        	ldw	x,#0
1035  0235 89            	pushw	x
1036  0236 ae0000        	ldw	x,#L172
1037  0239 cd0000        	call	_assert_failed
1039  023c 5b04          	addw	sp,#4
1040  023e               L601:
1041                     ; 146     if (NewState != DISABLE)
1043  023e 0d01          	tnz	(OFST+1,sp)
1044  0240 2706          	jreq	L333
1045                     ; 149         ADC2->CSR |= (uint8_t)ADC2_CSR_EOCIE;
1047  0242 721a5400      	bset	21504,#5
1049  0246 2004          	jra	L533
1050  0248               L333:
1051                     ; 154         ADC2->CSR &= (uint8_t)(~ADC2_CSR_EOCIE);
1053  0248 721b5400      	bres	21504,#5
1054  024c               L533:
1055                     ; 157 }
1058  024c 84            	pop	a
1059  024d 81            	ret
1096                     ; 165 void ADC2_PrescalerConfig(ADC2_PresSel_TypeDef ADC2_Prescaler)
1096                     ; 166 {
1097                     	switch	.text
1098  024e               _ADC2_PrescalerConfig:
1100  024e 88            	push	a
1101       00000000      OFST:	set	0
1104                     ; 169     assert_param(IS_ADC2_PRESSEL_OK(ADC2_Prescaler));
1106  024f 4d            	tnz	a
1107  0250 271c          	jreq	L411
1108  0252 a110          	cp	a,#16
1109  0254 2718          	jreq	L411
1110  0256 a120          	cp	a,#32
1111  0258 2714          	jreq	L411
1112  025a a130          	cp	a,#48
1113  025c 2710          	jreq	L411
1114  025e a140          	cp	a,#64
1115  0260 270c          	jreq	L411
1116  0262 a150          	cp	a,#80
1117  0264 2708          	jreq	L411
1118  0266 a160          	cp	a,#96
1119  0268 2704          	jreq	L411
1120  026a a170          	cp	a,#112
1121  026c 2603          	jrne	L211
1122  026e               L411:
1123  026e 4f            	clr	a
1124  026f 2010          	jra	L611
1125  0271               L211:
1126  0271 ae00a9        	ldw	x,#169
1127  0274 89            	pushw	x
1128  0275 ae0000        	ldw	x,#0
1129  0278 89            	pushw	x
1130  0279 ae0000        	ldw	x,#L172
1131  027c cd0000        	call	_assert_failed
1133  027f 5b04          	addw	sp,#4
1134  0281               L611:
1135                     ; 172     ADC2->CR1 &= (uint8_t)(~ADC2_CR1_SPSEL);
1137  0281 c65401        	ld	a,21505
1138  0284 a48f          	and	a,#143
1139  0286 c75401        	ld	21505,a
1140                     ; 174     ADC2->CR1 |= (uint8_t)(ADC2_Prescaler);
1142  0289 c65401        	ld	a,21505
1143  028c 1a01          	or	a,(OFST+1,sp)
1144  028e c75401        	ld	21505,a
1145                     ; 176 }
1148  0291 84            	pop	a
1149  0292 81            	ret
1197                     ; 187 void ADC2_SchmittTriggerConfig(ADC2_SchmittTrigg_TypeDef ADC2_SchmittTriggerChannel, FunctionalState NewState)
1197                     ; 188 {
1198                     	switch	.text
1199  0293               _ADC2_SchmittTriggerConfig:
1201  0293 89            	pushw	x
1202       00000000      OFST:	set	0
1205                     ; 191     assert_param(IS_ADC2_SCHMITTTRIG_OK(ADC2_SchmittTriggerChannel));
1207  0294 9e            	ld	a,xh
1208  0295 4d            	tnz	a
1209  0296 2750          	jreq	L421
1210  0298 9e            	ld	a,xh
1211  0299 a101          	cp	a,#1
1212  029b 274b          	jreq	L421
1213  029d 9e            	ld	a,xh
1214  029e a102          	cp	a,#2
1215  02a0 2746          	jreq	L421
1216  02a2 9e            	ld	a,xh
1217  02a3 a103          	cp	a,#3
1218  02a5 2741          	jreq	L421
1219  02a7 9e            	ld	a,xh
1220  02a8 a104          	cp	a,#4
1221  02aa 273c          	jreq	L421
1222  02ac 9e            	ld	a,xh
1223  02ad a105          	cp	a,#5
1224  02af 2737          	jreq	L421
1225  02b1 9e            	ld	a,xh
1226  02b2 a106          	cp	a,#6
1227  02b4 2732          	jreq	L421
1228  02b6 9e            	ld	a,xh
1229  02b7 a107          	cp	a,#7
1230  02b9 272d          	jreq	L421
1231  02bb 9e            	ld	a,xh
1232  02bc a108          	cp	a,#8
1233  02be 2728          	jreq	L421
1234  02c0 9e            	ld	a,xh
1235  02c1 a109          	cp	a,#9
1236  02c3 2723          	jreq	L421
1237  02c5 9e            	ld	a,xh
1238  02c6 a10a          	cp	a,#10
1239  02c8 271e          	jreq	L421
1240  02ca 9e            	ld	a,xh
1241  02cb a10b          	cp	a,#11
1242  02cd 2719          	jreq	L421
1243  02cf 9e            	ld	a,xh
1244  02d0 a10c          	cp	a,#12
1245  02d2 2714          	jreq	L421
1246  02d4 9e            	ld	a,xh
1247  02d5 a10d          	cp	a,#13
1248  02d7 270f          	jreq	L421
1249  02d9 9e            	ld	a,xh
1250  02da a10e          	cp	a,#14
1251  02dc 270a          	jreq	L421
1252  02de 9e            	ld	a,xh
1253  02df a10f          	cp	a,#15
1254  02e1 2705          	jreq	L421
1255  02e3 9e            	ld	a,xh
1256  02e4 a11f          	cp	a,#31
1257  02e6 2603          	jrne	L221
1258  02e8               L421:
1259  02e8 4f            	clr	a
1260  02e9 2010          	jra	L621
1261  02eb               L221:
1262  02eb ae00bf        	ldw	x,#191
1263  02ee 89            	pushw	x
1264  02ef ae0000        	ldw	x,#0
1265  02f2 89            	pushw	x
1266  02f3 ae0000        	ldw	x,#L172
1267  02f6 cd0000        	call	_assert_failed
1269  02f9 5b04          	addw	sp,#4
1270  02fb               L621:
1271                     ; 192     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1273  02fb 0d02          	tnz	(OFST+2,sp)
1274  02fd 2706          	jreq	L231
1275  02ff 7b02          	ld	a,(OFST+2,sp)
1276  0301 a101          	cp	a,#1
1277  0303 2603          	jrne	L031
1278  0305               L231:
1279  0305 4f            	clr	a
1280  0306 2010          	jra	L431
1281  0308               L031:
1282  0308 ae00c0        	ldw	x,#192
1283  030b 89            	pushw	x
1284  030c ae0000        	ldw	x,#0
1285  030f 89            	pushw	x
1286  0310 ae0000        	ldw	x,#L172
1287  0313 cd0000        	call	_assert_failed
1289  0316 5b04          	addw	sp,#4
1290  0318               L431:
1291                     ; 194     if (ADC2_SchmittTriggerChannel == ADC2_SCHMITTTRIG_ALL)
1293  0318 7b01          	ld	a,(OFST+1,sp)
1294  031a a11f          	cp	a,#31
1295  031c 2620          	jrne	L773
1296                     ; 196         if (NewState != DISABLE)
1298  031e 0d02          	tnz	(OFST+2,sp)
1299  0320 270a          	jreq	L104
1300                     ; 198             ADC2->TDRL &= (uint8_t)0x0;
1302  0322 725f5407      	clr	21511
1303                     ; 199             ADC2->TDRH &= (uint8_t)0x0;
1305  0326 725f5406      	clr	21510
1307  032a 2078          	jra	L504
1308  032c               L104:
1309                     ; 203             ADC2->TDRL |= (uint8_t)0xFF;
1311  032c c65407        	ld	a,21511
1312  032f aaff          	or	a,#255
1313  0331 c75407        	ld	21511,a
1314                     ; 204             ADC2->TDRH |= (uint8_t)0xFF;
1316  0334 c65406        	ld	a,21510
1317  0337 aaff          	or	a,#255
1318  0339 c75406        	ld	21510,a
1319  033c 2066          	jra	L504
1320  033e               L773:
1321                     ; 207     else if (ADC2_SchmittTriggerChannel < ADC2_SCHMITTTRIG_CHANNEL8)
1323  033e 7b01          	ld	a,(OFST+1,sp)
1324  0340 a108          	cp	a,#8
1325  0342 242f          	jruge	L704
1326                     ; 209         if (NewState != DISABLE)
1328  0344 0d02          	tnz	(OFST+2,sp)
1329  0346 2716          	jreq	L114
1330                     ; 211             ADC2->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC2_SchmittTriggerChannel));
1332  0348 7b01          	ld	a,(OFST+1,sp)
1333  034a 5f            	clrw	x
1334  034b 97            	ld	xl,a
1335  034c a601          	ld	a,#1
1336  034e 5d            	tnzw	x
1337  034f 2704          	jreq	L631
1338  0351               L041:
1339  0351 48            	sll	a
1340  0352 5a            	decw	x
1341  0353 26fc          	jrne	L041
1342  0355               L631:
1343  0355 43            	cpl	a
1344  0356 c45407        	and	a,21511
1345  0359 c75407        	ld	21511,a
1347  035c 2046          	jra	L504
1348  035e               L114:
1349                     ; 215             ADC2->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC2_SchmittTriggerChannel);
1351  035e 7b01          	ld	a,(OFST+1,sp)
1352  0360 5f            	clrw	x
1353  0361 97            	ld	xl,a
1354  0362 a601          	ld	a,#1
1355  0364 5d            	tnzw	x
1356  0365 2704          	jreq	L241
1357  0367               L441:
1358  0367 48            	sll	a
1359  0368 5a            	decw	x
1360  0369 26fc          	jrne	L441
1361  036b               L241:
1362  036b ca5407        	or	a,21511
1363  036e c75407        	ld	21511,a
1364  0371 2031          	jra	L504
1365  0373               L704:
1366                     ; 220         if (NewState != DISABLE)
1368  0373 0d02          	tnz	(OFST+2,sp)
1369  0375 2718          	jreq	L714
1370                     ; 222             ADC2->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC2_SchmittTriggerChannel - (uint8_t)8)));
1372  0377 7b01          	ld	a,(OFST+1,sp)
1373  0379 a008          	sub	a,#8
1374  037b 5f            	clrw	x
1375  037c 97            	ld	xl,a
1376  037d a601          	ld	a,#1
1377  037f 5d            	tnzw	x
1378  0380 2704          	jreq	L641
1379  0382               L051:
1380  0382 48            	sll	a
1381  0383 5a            	decw	x
1382  0384 26fc          	jrne	L051
1383  0386               L641:
1384  0386 43            	cpl	a
1385  0387 c45406        	and	a,21510
1386  038a c75406        	ld	21510,a
1388  038d 2015          	jra	L504
1389  038f               L714:
1390                     ; 226             ADC2->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC2_SchmittTriggerChannel - (uint8_t)8));
1392  038f 7b01          	ld	a,(OFST+1,sp)
1393  0391 a008          	sub	a,#8
1394  0393 5f            	clrw	x
1395  0394 97            	ld	xl,a
1396  0395 a601          	ld	a,#1
1397  0397 5d            	tnzw	x
1398  0398 2704          	jreq	L251
1399  039a               L451:
1400  039a 48            	sll	a
1401  039b 5a            	decw	x
1402  039c 26fc          	jrne	L451
1403  039e               L251:
1404  039e ca5406        	or	a,21510
1405  03a1 c75406        	ld	21510,a
1406  03a4               L504:
1407                     ; 230 }
1410  03a4 85            	popw	x
1411  03a5 81            	ret
1469                     ; 242 void ADC2_ConversionConfig(ADC2_ConvMode_TypeDef ADC2_ConversionMode, ADC2_Channel_TypeDef ADC2_Channel, ADC2_Align_TypeDef ADC2_Align)
1469                     ; 243 {
1470                     	switch	.text
1471  03a6               _ADC2_ConversionConfig:
1473  03a6 89            	pushw	x
1474       00000000      OFST:	set	0
1477                     ; 246     assert_param(IS_ADC2_CONVERSIONMODE_OK(ADC2_ConversionMode));
1479  03a7 9e            	ld	a,xh
1480  03a8 4d            	tnz	a
1481  03a9 2705          	jreq	L261
1482  03ab 9e            	ld	a,xh
1483  03ac a101          	cp	a,#1
1484  03ae 2603          	jrne	L061
1485  03b0               L261:
1486  03b0 4f            	clr	a
1487  03b1 2010          	jra	L461
1488  03b3               L061:
1489  03b3 ae00f6        	ldw	x,#246
1490  03b6 89            	pushw	x
1491  03b7 ae0000        	ldw	x,#0
1492  03ba 89            	pushw	x
1493  03bb ae0000        	ldw	x,#L172
1494  03be cd0000        	call	_assert_failed
1496  03c1 5b04          	addw	sp,#4
1497  03c3               L461:
1498                     ; 247     assert_param(IS_ADC2_CHANNEL_OK(ADC2_Channel));
1500  03c3 0d02          	tnz	(OFST+2,sp)
1501  03c5 275a          	jreq	L071
1502  03c7 7b02          	ld	a,(OFST+2,sp)
1503  03c9 a101          	cp	a,#1
1504  03cb 2754          	jreq	L071
1505  03cd 7b02          	ld	a,(OFST+2,sp)
1506  03cf a102          	cp	a,#2
1507  03d1 274e          	jreq	L071
1508  03d3 7b02          	ld	a,(OFST+2,sp)
1509  03d5 a103          	cp	a,#3
1510  03d7 2748          	jreq	L071
1511  03d9 7b02          	ld	a,(OFST+2,sp)
1512  03db a104          	cp	a,#4
1513  03dd 2742          	jreq	L071
1514  03df 7b02          	ld	a,(OFST+2,sp)
1515  03e1 a105          	cp	a,#5
1516  03e3 273c          	jreq	L071
1517  03e5 7b02          	ld	a,(OFST+2,sp)
1518  03e7 a106          	cp	a,#6
1519  03e9 2736          	jreq	L071
1520  03eb 7b02          	ld	a,(OFST+2,sp)
1521  03ed a107          	cp	a,#7
1522  03ef 2730          	jreq	L071
1523  03f1 7b02          	ld	a,(OFST+2,sp)
1524  03f3 a108          	cp	a,#8
1525  03f5 272a          	jreq	L071
1526  03f7 7b02          	ld	a,(OFST+2,sp)
1527  03f9 a109          	cp	a,#9
1528  03fb 2724          	jreq	L071
1529  03fd 7b02          	ld	a,(OFST+2,sp)
1530  03ff a10a          	cp	a,#10
1531  0401 271e          	jreq	L071
1532  0403 7b02          	ld	a,(OFST+2,sp)
1533  0405 a10b          	cp	a,#11
1534  0407 2718          	jreq	L071
1535  0409 7b02          	ld	a,(OFST+2,sp)
1536  040b a10c          	cp	a,#12
1537  040d 2712          	jreq	L071
1538  040f 7b02          	ld	a,(OFST+2,sp)
1539  0411 a10d          	cp	a,#13
1540  0413 270c          	jreq	L071
1541  0415 7b02          	ld	a,(OFST+2,sp)
1542  0417 a10e          	cp	a,#14
1543  0419 2706          	jreq	L071
1544  041b 7b02          	ld	a,(OFST+2,sp)
1545  041d a10f          	cp	a,#15
1546  041f 2603          	jrne	L661
1547  0421               L071:
1548  0421 4f            	clr	a
1549  0422 2010          	jra	L271
1550  0424               L661:
1551  0424 ae00f7        	ldw	x,#247
1552  0427 89            	pushw	x
1553  0428 ae0000        	ldw	x,#0
1554  042b 89            	pushw	x
1555  042c ae0000        	ldw	x,#L172
1556  042f cd0000        	call	_assert_failed
1558  0432 5b04          	addw	sp,#4
1559  0434               L271:
1560                     ; 248     assert_param(IS_ADC2_ALIGN_OK(ADC2_Align));
1562  0434 0d05          	tnz	(OFST+5,sp)
1563  0436 2706          	jreq	L671
1564  0438 7b05          	ld	a,(OFST+5,sp)
1565  043a a108          	cp	a,#8
1566  043c 2603          	jrne	L471
1567  043e               L671:
1568  043e 4f            	clr	a
1569  043f 2010          	jra	L002
1570  0441               L471:
1571  0441 ae00f8        	ldw	x,#248
1572  0444 89            	pushw	x
1573  0445 ae0000        	ldw	x,#0
1574  0448 89            	pushw	x
1575  0449 ae0000        	ldw	x,#L172
1576  044c cd0000        	call	_assert_failed
1578  044f 5b04          	addw	sp,#4
1579  0451               L002:
1580                     ; 251     ADC2->CR2 &= (uint8_t)(~ADC2_CR2_ALIGN);
1582  0451 72175402      	bres	21506,#3
1583                     ; 253     ADC2->CR2 |= (uint8_t)(ADC2_Align);
1585  0455 c65402        	ld	a,21506
1586  0458 1a05          	or	a,(OFST+5,sp)
1587  045a c75402        	ld	21506,a
1588                     ; 255     if (ADC2_ConversionMode == ADC2_CONVERSIONMODE_CONTINUOUS)
1590  045d 7b01          	ld	a,(OFST+1,sp)
1591  045f a101          	cp	a,#1
1592  0461 2606          	jrne	L154
1593                     ; 258         ADC2->CR1 |= ADC2_CR1_CONT;
1595  0463 72125401      	bset	21505,#1
1597  0467 2004          	jra	L354
1598  0469               L154:
1599                     ; 263         ADC2->CR1 &= (uint8_t)(~ADC2_CR1_CONT);
1601  0469 72135401      	bres	21505,#1
1602  046d               L354:
1603                     ; 267     ADC2->CSR &= (uint8_t)(~ADC2_CSR_CH);
1605  046d c65400        	ld	a,21504
1606  0470 a4f0          	and	a,#240
1607  0472 c75400        	ld	21504,a
1608                     ; 269     ADC2->CSR |= (uint8_t)(ADC2_Channel);
1610  0475 c65400        	ld	a,21504
1611  0478 1a02          	or	a,(OFST+2,sp)
1612  047a c75400        	ld	21504,a
1613                     ; 271 }
1616  047d 85            	popw	x
1617  047e 81            	ret
1664                     ; 284 void ADC2_ExternalTriggerConfig(ADC2_ExtTrig_TypeDef ADC2_ExtTrigger, FunctionalState NewState)
1664                     ; 285 {
1665                     	switch	.text
1666  047f               _ADC2_ExternalTriggerConfig:
1668  047f 89            	pushw	x
1669       00000000      OFST:	set	0
1672                     ; 288     assert_param(IS_ADC2_EXTTRIG_OK(ADC2_ExtTrigger));
1674  0480 9e            	ld	a,xh
1675  0481 4d            	tnz	a
1676  0482 2705          	jreq	L602
1677  0484 9e            	ld	a,xh
1678  0485 a101          	cp	a,#1
1679  0487 2603          	jrne	L402
1680  0489               L602:
1681  0489 4f            	clr	a
1682  048a 2010          	jra	L012
1683  048c               L402:
1684  048c ae0120        	ldw	x,#288
1685  048f 89            	pushw	x
1686  0490 ae0000        	ldw	x,#0
1687  0493 89            	pushw	x
1688  0494 ae0000        	ldw	x,#L172
1689  0497 cd0000        	call	_assert_failed
1691  049a 5b04          	addw	sp,#4
1692  049c               L012:
1693                     ; 289     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1695  049c 0d02          	tnz	(OFST+2,sp)
1696  049e 2706          	jreq	L412
1697  04a0 7b02          	ld	a,(OFST+2,sp)
1698  04a2 a101          	cp	a,#1
1699  04a4 2603          	jrne	L212
1700  04a6               L412:
1701  04a6 4f            	clr	a
1702  04a7 2010          	jra	L612
1703  04a9               L212:
1704  04a9 ae0121        	ldw	x,#289
1705  04ac 89            	pushw	x
1706  04ad ae0000        	ldw	x,#0
1707  04b0 89            	pushw	x
1708  04b1 ae0000        	ldw	x,#L172
1709  04b4 cd0000        	call	_assert_failed
1711  04b7 5b04          	addw	sp,#4
1712  04b9               L612:
1713                     ; 292     ADC2->CR2 &= (uint8_t)(~ADC2_CR2_EXTSEL);
1715  04b9 c65402        	ld	a,21506
1716  04bc a4cf          	and	a,#207
1717  04be c75402        	ld	21506,a
1718                     ; 294     if (NewState != DISABLE)
1720  04c1 0d02          	tnz	(OFST+2,sp)
1721  04c3 2706          	jreq	L774
1722                     ; 297         ADC2->CR2 |= (uint8_t)(ADC2_CR2_EXTTRIG);
1724  04c5 721c5402      	bset	21506,#6
1726  04c9 2004          	jra	L105
1727  04cb               L774:
1728                     ; 302         ADC2->CR2 &= (uint8_t)(~ADC2_CR2_EXTTRIG);
1730  04cb 721d5402      	bres	21506,#6
1731  04cf               L105:
1732                     ; 306     ADC2->CR2 |= (uint8_t)(ADC2_ExtTrigger);
1734  04cf c65402        	ld	a,21506
1735  04d2 1a01          	or	a,(OFST+1,sp)
1736  04d4 c75402        	ld	21506,a
1737                     ; 308 }
1740  04d7 85            	popw	x
1741  04d8 81            	ret
1765                     ; 320 void ADC2_StartConversion(void)
1765                     ; 321 {
1766                     	switch	.text
1767  04d9               _ADC2_StartConversion:
1771                     ; 322     ADC2->CR1 |= ADC2_CR1_ADON;
1773  04d9 72105401      	bset	21505,#0
1774                     ; 323 }
1777  04dd 81            	ret
1821                     ; 332 uint16_t ADC2_GetConversionValue(void)
1821                     ; 333 {
1822                     	switch	.text
1823  04de               _ADC2_GetConversionValue:
1825  04de 5205          	subw	sp,#5
1826       00000005      OFST:	set	5
1829                     ; 335     uint16_t temph = 0;
1831  04e0 1e04          	ldw	x,(OFST-1,sp)
1832                     ; 336     uint8_t templ = 0;
1834  04e2 7b03          	ld	a,(OFST-2,sp)
1835  04e4 97            	ld	xl,a
1836                     ; 338     if ((ADC2->CR2 & ADC2_CR2_ALIGN) != 0) /* Right alignment */
1838  04e5 c65402        	ld	a,21506
1839  04e8 a508          	bcp	a,#8
1840  04ea 2719          	jreq	L535
1841                     ; 341         templ = ADC2->DRL;
1843  04ec c65405        	ld	a,21509
1844  04ef 6b03          	ld	(OFST-2,sp),a
1845                     ; 343         temph = ADC2->DRH;
1847  04f1 c65404        	ld	a,21508
1848  04f4 5f            	clrw	x
1849  04f5 97            	ld	xl,a
1850  04f6 1f04          	ldw	(OFST-1,sp),x
1851                     ; 345         temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1853  04f8 1e04          	ldw	x,(OFST-1,sp)
1854  04fa 4f            	clr	a
1855  04fb 02            	rlwa	x,a
1856  04fc 01            	rrwa	x,a
1857  04fd 1a03          	or	a,(OFST-2,sp)
1858  04ff 02            	rlwa	x,a
1859  0500 1f04          	ldw	(OFST-1,sp),x
1860  0502 01            	rrwa	x,a
1862  0503 2021          	jra	L735
1863  0505               L535:
1864                     ; 350         temph = ADC2->DRH;
1866  0505 c65404        	ld	a,21508
1867  0508 5f            	clrw	x
1868  0509 97            	ld	xl,a
1869  050a 1f04          	ldw	(OFST-1,sp),x
1870                     ; 352         templ = ADC2->DRL;
1872  050c c65405        	ld	a,21509
1873  050f 6b03          	ld	(OFST-2,sp),a
1874                     ; 354         temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1876  0511 1e04          	ldw	x,(OFST-1,sp)
1877  0513 4f            	clr	a
1878  0514 02            	rlwa	x,a
1879  0515 1f01          	ldw	(OFST-4,sp),x
1880  0517 7b03          	ld	a,(OFST-2,sp)
1881  0519 97            	ld	xl,a
1882  051a a640          	ld	a,#64
1883  051c 42            	mul	x,a
1884  051d 01            	rrwa	x,a
1885  051e 1a02          	or	a,(OFST-3,sp)
1886  0520 01            	rrwa	x,a
1887  0521 1a01          	or	a,(OFST-4,sp)
1888  0523 01            	rrwa	x,a
1889  0524 1f04          	ldw	(OFST-1,sp),x
1890  0526               L735:
1891                     ; 357     return ((uint16_t)temph);
1893  0526 1e04          	ldw	x,(OFST-1,sp)
1896  0528 5b05          	addw	sp,#5
1897  052a 81            	ret
1941                     ; 366 FlagStatus ADC2_GetFlagStatus(void)
1941                     ; 367 {
1942                     	switch	.text
1943  052b               _ADC2_GetFlagStatus:
1947                     ; 369     return (FlagStatus)(ADC2->CSR & ADC2_CSR_EOC);
1949  052b c65400        	ld	a,21504
1950  052e a480          	and	a,#128
1953  0530 81            	ret
1976                     ; 378 void ADC2_ClearFlag(void)
1976                     ; 379 {
1977                     	switch	.text
1978  0531               _ADC2_ClearFlag:
1982                     ; 380     ADC2->CSR &= (uint8_t)(~ADC2_CSR_EOC);
1984  0531 721f5400      	bres	21504,#7
1985                     ; 381 }
1988  0535 81            	ret
2012                     ; 389 ITStatus ADC2_GetITStatus(void)
2012                     ; 390 {
2013                     	switch	.text
2014  0536               _ADC2_GetITStatus:
2018                     ; 391     return (ITStatus)(ADC2->CSR & ADC2_CSR_EOC);
2020  0536 c65400        	ld	a,21504
2021  0539 a480          	and	a,#128
2024  053b 81            	ret
2048                     ; 399 void ADC2_ClearITPendingBit(void)
2048                     ; 400 {
2049                     	switch	.text
2050  053c               _ADC2_ClearITPendingBit:
2054                     ; 401     ADC2->CSR &= (uint8_t)(~ADC2_CSR_EOC);
2056  053c 721f5400      	bres	21504,#7
2057                     ; 402 }
2060  0540 81            	ret
2073                     	xdef	_ADC2_ClearITPendingBit
2074                     	xdef	_ADC2_GetITStatus
2075                     	xdef	_ADC2_ClearFlag
2076                     	xdef	_ADC2_GetFlagStatus
2077                     	xdef	_ADC2_GetConversionValue
2078                     	xdef	_ADC2_StartConversion
2079                     	xdef	_ADC2_ExternalTriggerConfig
2080                     	xdef	_ADC2_ConversionConfig
2081                     	xdef	_ADC2_SchmittTriggerConfig
2082                     	xdef	_ADC2_PrescalerConfig
2083                     	xdef	_ADC2_ITConfig
2084                     	xdef	_ADC2_Cmd
2085                     	xdef	_ADC2_Init
2086                     	xdef	_ADC2_DeInit
2087                     	xref	_assert_failed
2088                     .const:	section	.text
2089  0000               L172:
2090  0000 66776c69625c  	dc.b	"fwlib\src\stm8s_ad"
2091  0012 63322e6300    	dc.b	"c2.c",0
2111                     	end
