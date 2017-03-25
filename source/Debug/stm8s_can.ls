   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   4                     	bsct
   5  0000               __Id:
   6  0000 00000000      	dc.l	0
   7  0004               __IDE:
   8  0004 00            	dc.b	0
   9  0005               __RTR:
  10  0005 00            	dc.b	0
  11  0006               __DLC:
  12  0006 00            	dc.b	0
  13  0007               __Data:
  14  0007 00            	dc.b	0
  15  0008 000000000000  	ds.b	7
  16  000f               __FMI:
  17  000f 00            	dc.b	0
  47                     ; 56 void CAN_DeInit(void)
  47                     ; 57 {
  49                     	switch	.text
  50  0000               _CAN_DeInit:
  54                     ; 59     CAN->MCR = CAN_MCR_INRQ;
  56  0000 35015420      	mov	21536,#1
  57                     ; 60     CAN->PSR = CAN_Page_Config;
  59  0004 35065427      	mov	21543,#6
  60                     ; 61     CAN_OperatingModeRequest(CAN_OperatingMode_Initialization);
  62  0008 4f            	clr	a
  63  0009 cd0ba8        	call	_CAN_OperatingModeRequest
  65                     ; 62     CAN->Page.Config.ESR = CAN_ESR_RESET_VALUE;
  67  000c 725f5428      	clr	21544
  68                     ; 63     CAN->Page.Config.EIER = CAN_EIER_RESET_VALUE;
  70  0010 725f5429      	clr	21545
  71                     ; 64     CAN->Page.Config.BTR1 = CAN_BTR1_RESET_VALUE;
  73  0014 3540542c      	mov	21548,#64
  74                     ; 65     CAN->Page.Config.BTR2 = CAN_BTR2_RESET_VALUE;
  76  0018 3523542d      	mov	21549,#35
  77                     ; 66     CAN->Page.Config.FMR1 = CAN_FMR1_RESET_VALUE;
  79  001c 725f5430      	clr	21552
  80                     ; 67     CAN->Page.Config.FMR2 = CAN_FMR2_RESET_VALUE;
  82  0020 725f5431      	clr	21553
  83                     ; 68     CAN->Page.Config.FCR1 = CAN_FCR_RESET_VALUE;
  85  0024 725f5432      	clr	21554
  86                     ; 69     CAN->Page.Config.FCR2 = CAN_FCR_RESET_VALUE;
  88  0028 725f5433      	clr	21555
  89                     ; 70     CAN->Page.Config.FCR3 = CAN_FCR_RESET_VALUE;
  91  002c 725f5434      	clr	21556
  92                     ; 71     CAN_OperatingModeRequest(CAN_OperatingMode_Normal);
  94  0030 a601          	ld	a,#1
  95  0032 cd0ba8        	call	_CAN_OperatingModeRequest
  97                     ; 72     CAN->PSR = CAN_Page_RxFifo;
  99  0035 35075427      	mov	21543,#7
 100                     ; 73     CAN->Page.RxFIFO.MDLCR = CAN_MDLC_RESET_VALUE;
 102  0039 725f5429      	clr	21545
 103                     ; 74     CAN->PSR = CAN_Page_TxMailBox0;
 105  003d 725f5427      	clr	21543
 106                     ; 75     CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
 108  0041 725f5429      	clr	21545
 109                     ; 76     CAN->PSR = CAN_Page_TxMailBox1;
 111  0045 35015427      	mov	21543,#1
 112                     ; 77     CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
 114  0049 725f5429      	clr	21545
 115                     ; 78     CAN->PSR = CAN_Page_TxMailBox2;
 117  004d 35055427      	mov	21543,#5
 118                     ; 79     CAN->Page.TxMailbox.MDLCR = CAN_MDLC_RESET_VALUE;
 120  0051 725f5429      	clr	21545
 121                     ; 81     CAN->MCR = CAN_MCR_RESET_VALUE;
 123  0055 35025420      	mov	21536,#2
 124                     ; 82     CAN->MSR = (uint8_t)(~CAN_MSR_RESET_VALUE);/* rc_w1 */
 126  0059 35fd5421      	mov	21537,#253
 127                     ; 83     CAN->TSR = (uint8_t)(~CAN_TSR_RESET_VALUE);/* rc_w1 */
 129  005d 35ff5422      	mov	21538,#255
 130                     ; 84     CAN->RFR = (uint8_t)(~CAN_RFR_RESET_VALUE);/* rc_w1 */
 132  0061 35ff5424      	mov	21540,#255
 133                     ; 85     CAN->IER = CAN_IER_RESET_VALUE;
 135  0065 725f5425      	clr	21541
 136                     ; 86     CAN->DGR = CAN_DGR_RESET_VALUE;
 138  0069 350c5426      	mov	21542,#12
 139                     ; 87     CAN->PSR = CAN_PSR_RESET_VALUE;
 141  006d 725f5427      	clr	21543
 142                     ; 88 }
 145  0071 81            	ret
 696                     ; 100 CAN_InitStatus_TypeDef CAN_Init(CAN_MasterCtrl_TypeDef CAN_MasterCtrl,
 696                     ; 101                                 CAN_Mode_TypeDef CAN_Mode,
 696                     ; 102                                 CAN_SynJumpWidth_TypeDef CAN_SynJumpWidth,
 696                     ; 103                                 CAN_BitSeg1_TypeDef CAN_BitSeg1,
 696                     ; 104                                 CAN_BitSeg2_TypeDef CAN_BitSeg2,
 696                     ; 105                                 uint8_t CAN_Prescaler)
 696                     ; 106 {
 697                     	switch	.text
 698  0072               _CAN_Init:
 700  0072 89            	pushw	x
 701  0073 5204          	subw	sp,#4
 702       00000004      OFST:	set	4
 705                     ; 107     CAN_InitStatus_TypeDef InitStatus =  CAN_InitStatus_Failed;
 707  0075 7b02          	ld	a,(OFST-2,sp)
 708  0077 97            	ld	xl,a
 709                     ; 108     uint16_t timeout = CAN_ACKNOWLEDGE_TIMEOUT;
 711  0078 aeffff        	ldw	x,#65535
 712  007b 1f03          	ldw	(OFST-1,sp),x
 713                     ; 109     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
 715  007d cd10a8        	call	_CAN_GetSelectedPage
 717  0080 6b01          	ld	(OFST-3,sp),a
 718                     ; 113     assert_param(IS_CAN_MASTERCTRL_OK(CAN_MasterCtrl));
 720  0082 0d05          	tnz	(OFST+1,sp)
 721  0084 270c          	jreq	L21
 722  0086 7b05          	ld	a,(OFST+1,sp)
 723  0088 a1fd          	cp	a,#253
 724  008a 2409          	jruge	L01
 725  008c 7b05          	ld	a,(OFST+1,sp)
 726  008e a104          	cp	a,#4
 727  0090 2503          	jrult	L01
 728  0092               L21:
 729  0092 4f            	clr	a
 730  0093 2010          	jra	L41
 731  0095               L01:
 732  0095 ae0071        	ldw	x,#113
 733  0098 89            	pushw	x
 734  0099 ae0000        	ldw	x,#0
 735  009c 89            	pushw	x
 736  009d ae0008        	ldw	x,#L103
 737  00a0 cd0000        	call	_assert_failed
 739  00a3 5b04          	addw	sp,#4
 740  00a5               L41:
 741                     ; 114     assert_param(IS_CAN_MODE_OK(CAN_Mode));
 743  00a5 0d06          	tnz	(OFST+2,sp)
 744  00a7 2712          	jreq	L02
 745  00a9 7b06          	ld	a,(OFST+2,sp)
 746  00ab a101          	cp	a,#1
 747  00ad 270c          	jreq	L02
 748  00af 7b06          	ld	a,(OFST+2,sp)
 749  00b1 a102          	cp	a,#2
 750  00b3 2706          	jreq	L02
 751  00b5 7b06          	ld	a,(OFST+2,sp)
 752  00b7 a103          	cp	a,#3
 753  00b9 2603          	jrne	L61
 754  00bb               L02:
 755  00bb 4f            	clr	a
 756  00bc 2010          	jra	L22
 757  00be               L61:
 758  00be ae0072        	ldw	x,#114
 759  00c1 89            	pushw	x
 760  00c2 ae0000        	ldw	x,#0
 761  00c5 89            	pushw	x
 762  00c6 ae0008        	ldw	x,#L103
 763  00c9 cd0000        	call	_assert_failed
 765  00cc 5b04          	addw	sp,#4
 766  00ce               L22:
 767                     ; 115     assert_param(IS_CAN_SYNJUMPWIDTH_OK(CAN_SynJumpWidth));
 769  00ce 0d09          	tnz	(OFST+5,sp)
 770  00d0 2712          	jreq	L62
 771  00d2 7b09          	ld	a,(OFST+5,sp)
 772  00d4 a140          	cp	a,#64
 773  00d6 270c          	jreq	L62
 774  00d8 7b09          	ld	a,(OFST+5,sp)
 775  00da a180          	cp	a,#128
 776  00dc 2706          	jreq	L62
 777  00de 7b09          	ld	a,(OFST+5,sp)
 778  00e0 a1c0          	cp	a,#192
 779  00e2 2603          	jrne	L42
 780  00e4               L62:
 781  00e4 4f            	clr	a
 782  00e5 2010          	jra	L03
 783  00e7               L42:
 784  00e7 ae0073        	ldw	x,#115
 785  00ea 89            	pushw	x
 786  00eb ae0000        	ldw	x,#0
 787  00ee 89            	pushw	x
 788  00ef ae0008        	ldw	x,#L103
 789  00f2 cd0000        	call	_assert_failed
 791  00f5 5b04          	addw	sp,#4
 792  00f7               L03:
 793                     ; 116     assert_param(IS_CAN_BITSEG1_OK(CAN_BitSeg1));
 795  00f7 7b0a          	ld	a,(OFST+6,sp)
 796  00f9 a110          	cp	a,#16
 797  00fb 2403          	jruge	L23
 798  00fd 4f            	clr	a
 799  00fe 2010          	jra	L43
 800  0100               L23:
 801  0100 ae0074        	ldw	x,#116
 802  0103 89            	pushw	x
 803  0104 ae0000        	ldw	x,#0
 804  0107 89            	pushw	x
 805  0108 ae0008        	ldw	x,#L103
 806  010b cd0000        	call	_assert_failed
 808  010e 5b04          	addw	sp,#4
 809  0110               L43:
 810                     ; 117     assert_param(IS_CAN_BITSEG2_OK(CAN_BitSeg2));
 812  0110 7b0b          	ld	a,(OFST+7,sp)
 813  0112 a110          	cp	a,#16
 814  0114 2506          	jrult	L24
 815  0116 7b0b          	ld	a,(OFST+7,sp)
 816  0118 a171          	cp	a,#113
 817  011a 2504          	jrult	L04
 818  011c               L24:
 819  011c 0d0b          	tnz	(OFST+7,sp)
 820  011e 2603          	jrne	L63
 821  0120               L04:
 822  0120 4f            	clr	a
 823  0121 2010          	jra	L44
 824  0123               L63:
 825  0123 ae0075        	ldw	x,#117
 826  0126 89            	pushw	x
 827  0127 ae0000        	ldw	x,#0
 828  012a 89            	pushw	x
 829  012b ae0008        	ldw	x,#L103
 830  012e cd0000        	call	_assert_failed
 832  0131 5b04          	addw	sp,#4
 833  0133               L44:
 834                     ; 118     assert_param(IS_CAN_PRESCALER_OK(CAN_Prescaler));
 836  0133 0d0c          	tnz	(OFST+8,sp)
 837  0135 2709          	jreq	L64
 838  0137 7b0c          	ld	a,(OFST+8,sp)
 839  0139 a141          	cp	a,#65
 840  013b 2403          	jruge	L64
 841  013d 4f            	clr	a
 842  013e 2010          	jra	L05
 843  0140               L64:
 844  0140 ae0076        	ldw	x,#118
 845  0143 89            	pushw	x
 846  0144 ae0000        	ldw	x,#0
 847  0147 89            	pushw	x
 848  0148 ae0008        	ldw	x,#L103
 849  014b cd0000        	call	_assert_failed
 851  014e 5b04          	addw	sp,#4
 852  0150               L05:
 853                     ; 121     CAN->MCR = CAN_MCR_INRQ;
 855  0150 35015420      	mov	21536,#1
 857  0154 2007          	jra	L703
 858  0156               L303:
 859                     ; 125         timeout--;
 861  0156 1e03          	ldw	x,(OFST-1,sp)
 862  0158 1d0001        	subw	x,#1
 863  015b 1f03          	ldw	(OFST-1,sp),x
 864  015d               L703:
 865                     ; 123     while (((uint8_t)(CAN->MSR & CAN_MSR_INAK) != 0x01) && ((uint16_t)timeout != 0))
 867  015d c65421        	ld	a,21537
 868  0160 a401          	and	a,#1
 869  0162 a101          	cp	a,#1
 870  0164 2704          	jreq	L313
 872  0166 1e03          	ldw	x,(OFST-1,sp)
 873  0168 26ec          	jrne	L303
 874  016a               L313:
 875                     ; 129     if ((CAN->MSR & CAN_MSR_INAK) != CAN_MSR_INAK)
 877  016a c65421        	ld	a,21537
 878  016d a401          	and	a,#1
 879  016f a101          	cp	a,#1
 880  0171 270c          	jreq	L513
 881                     ; 132         InitStatus =  CAN_InitStatus_Failed;
 883  0173 0f02          	clr	(OFST-2,sp)
 885  0175               L713:
 886                     ; 166     CAN_SelectPage(can_page);
 888  0175 7b01          	ld	a,(OFST-3,sp)
 889  0177 cd10ac        	call	_CAN_SelectPage
 891                     ; 169     return (CAN_InitStatus_TypeDef)InitStatus;
 893  017a 7b02          	ld	a,(OFST-2,sp)
 896  017c 5b06          	addw	sp,#6
 897  017e 81            	ret
 898  017f               L513:
 899                     ; 139         CAN->MCR |= (uint8_t)CAN_MasterCtrl;
 901  017f c65420        	ld	a,21536
 902  0182 1a05          	or	a,(OFST+1,sp)
 903  0184 c75420        	ld	21536,a
 904                     ; 142         CAN->DGR |= (uint8_t)CAN_Mode ;
 906  0187 c65426        	ld	a,21542
 907  018a 1a06          	or	a,(OFST+2,sp)
 908  018c c75426        	ld	21542,a
 909                     ; 143         CAN->PSR = CAN_Page_Config;
 911  018f 35065427      	mov	21543,#6
 912                     ; 144         CAN->Page.Config.BTR1 = (uint8_t)((uint8_t)(CAN_Prescaler - (uint8_t)1) | CAN_SynJumpWidth);
 914  0193 7b0c          	ld	a,(OFST+8,sp)
 915  0195 4a            	dec	a
 916  0196 1a09          	or	a,(OFST+5,sp)
 917  0198 c7542c        	ld	21548,a
 918                     ; 145         CAN->Page.Config.BTR2 = (uint8_t)(CAN_BitSeg1 | (uint8_t)CAN_BitSeg2);
 920  019b 7b0a          	ld	a,(OFST+6,sp)
 921  019d 1a0b          	or	a,(OFST+7,sp)
 922  019f c7542d        	ld	21549,a
 923                     ; 148         CAN->MCR &= (uint8_t)(~CAN_MCR_INRQ);
 925  01a2 72115420      	bres	21536,#0
 926                     ; 150         timeout = 0xFFFF;
 928  01a6 aeffff        	ldw	x,#65535
 929  01a9 1f03          	ldw	(OFST-1,sp),x
 931  01ab 2007          	jra	L523
 932  01ad               L123:
 933                     ; 153             timeout--;
 935  01ad 1e03          	ldw	x,(OFST-1,sp)
 936  01af 1d0001        	subw	x,#1
 937  01b2 1f03          	ldw	(OFST-1,sp),x
 938  01b4               L523:
 939                     ; 151         while ((((uint8_t)(CAN->MSR & CAN_MSR_INAK) == 0x01))&&(timeout != 0))
 941  01b4 c65421        	ld	a,21537
 942  01b7 a401          	and	a,#1
 943  01b9 a101          	cp	a,#1
 944  01bb 2604          	jrne	L133
 946  01bd 1e03          	ldw	x,(OFST-1,sp)
 947  01bf 26ec          	jrne	L123
 948  01c1               L133:
 949                     ; 156         if ((CAN->MSR & CAN_MSR_INAK) == CAN_MSR_INAK)
 951  01c1 c65421        	ld	a,21537
 952  01c4 a401          	and	a,#1
 953  01c6 a101          	cp	a,#1
 954  01c8 2604          	jrne	L333
 955                     ; 158             InitStatus = CAN_InitStatus_Failed;
 957  01ca 0f02          	clr	(OFST-2,sp)
 959  01cc 20a7          	jra	L713
 960  01ce               L333:
 961                     ; 162             InitStatus = CAN_InitStatus_Success;
 963  01ce a601          	ld	a,#1
 964  01d0 6b02          	ld	(OFST-2,sp),a
 965  01d2 20a1          	jra	L713
1298                     ; 188 void CAN_FilterInit(CAN_FilterNumber_TypeDef CAN_FilterNumber,
1298                     ; 189                     FunctionalState CAN_FilterActivation,
1298                     ; 190                     CAN_FilterMode_TypeDef CAN_FilterMode,
1298                     ; 191                     CAN_FilterScale_TypeDef CAN_FilterScale,
1298                     ; 192                     uint8_t CAN_FilterID1,
1298                     ; 193                     uint8_t CAN_FilterID2,
1298                     ; 194                     uint8_t CAN_FilterID3,
1298                     ; 195                     uint8_t CAN_FilterID4,
1298                     ; 196                     uint8_t CAN_FilterIDMask1,
1298                     ; 197                     uint8_t CAN_FilterIDMask2,
1298                     ; 198                     uint8_t CAN_FilterIDMask3,
1298                     ; 199                     uint8_t CAN_FilterIDMask4)
1298                     ; 200 {
1299                     	switch	.text
1300  01d4               _CAN_FilterInit:
1302  01d4 89            	pushw	x
1303  01d5 5205          	subw	sp,#5
1304       00000005      OFST:	set	5
1307                     ; 201     uint8_t fact = 0;
1309  01d7 7b03          	ld	a,(OFST-2,sp)
1310  01d9 97            	ld	xl,a
1311                     ; 202     uint8_t fsc  = 0;
1313  01da 7b04          	ld	a,(OFST-1,sp)
1314  01dc 97            	ld	xl,a
1315                     ; 203     uint8_t fmhl = 0;
1317  01dd 7b05          	ld	a,(OFST+0,sp)
1318  01df 97            	ld	xl,a
1319                     ; 205     CAN_Page_TypeDef can_page_filter = CAN_Page_Filter01;
1321  01e0 7b02          	ld	a,(OFST-3,sp)
1322  01e2 97            	ld	xl,a
1323                     ; 206     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
1325  01e3 cd10a8        	call	_CAN_GetSelectedPage
1327  01e6 6b01          	ld	(OFST-4,sp),a
1328                     ; 209     assert_param(IS_CAN_FILTER_NUMBER_OK(CAN_FilterNumber));
1330  01e8 0d06          	tnz	(OFST+1,sp)
1331  01ea 271e          	jreq	L65
1332  01ec 7b06          	ld	a,(OFST+1,sp)
1333  01ee a101          	cp	a,#1
1334  01f0 2718          	jreq	L65
1335  01f2 7b06          	ld	a,(OFST+1,sp)
1336  01f4 a102          	cp	a,#2
1337  01f6 2712          	jreq	L65
1338  01f8 7b06          	ld	a,(OFST+1,sp)
1339  01fa a103          	cp	a,#3
1340  01fc 270c          	jreq	L65
1341  01fe 7b06          	ld	a,(OFST+1,sp)
1342  0200 a104          	cp	a,#4
1343  0202 2706          	jreq	L65
1344  0204 7b06          	ld	a,(OFST+1,sp)
1345  0206 a105          	cp	a,#5
1346  0208 2603          	jrne	L45
1347  020a               L65:
1348  020a 4f            	clr	a
1349  020b 2010          	jra	L06
1350  020d               L45:
1351  020d ae00d1        	ldw	x,#209
1352  0210 89            	pushw	x
1353  0211 ae0000        	ldw	x,#0
1354  0214 89            	pushw	x
1355  0215 ae0008        	ldw	x,#L103
1356  0218 cd0000        	call	_assert_failed
1358  021b 5b04          	addw	sp,#4
1359  021d               L06:
1360                     ; 210     assert_param(IS_FUNCTIONALSTATE_OK(CAN_FilterActivation));
1362  021d 0d07          	tnz	(OFST+2,sp)
1363  021f 2706          	jreq	L46
1364  0221 7b07          	ld	a,(OFST+2,sp)
1365  0223 a101          	cp	a,#1
1366  0225 2603          	jrne	L26
1367  0227               L46:
1368  0227 4f            	clr	a
1369  0228 2010          	jra	L66
1370  022a               L26:
1371  022a ae00d2        	ldw	x,#210
1372  022d 89            	pushw	x
1373  022e ae0000        	ldw	x,#0
1374  0231 89            	pushw	x
1375  0232 ae0008        	ldw	x,#L103
1376  0235 cd0000        	call	_assert_failed
1378  0238 5b04          	addw	sp,#4
1379  023a               L66:
1380                     ; 211     assert_param(IS_CAN_FILTER_MODE_OK(CAN_FilterMode));
1382  023a 0d0a          	tnz	(OFST+5,sp)
1383  023c 2712          	jreq	L27
1384  023e 7b0a          	ld	a,(OFST+5,sp)
1385  0240 a110          	cp	a,#16
1386  0242 270c          	jreq	L27
1387  0244 7b0a          	ld	a,(OFST+5,sp)
1388  0246 a111          	cp	a,#17
1389  0248 2706          	jreq	L27
1390  024a 7b0a          	ld	a,(OFST+5,sp)
1391  024c a101          	cp	a,#1
1392  024e 2603          	jrne	L07
1393  0250               L27:
1394  0250 4f            	clr	a
1395  0251 2010          	jra	L47
1396  0253               L07:
1397  0253 ae00d3        	ldw	x,#211
1398  0256 89            	pushw	x
1399  0257 ae0000        	ldw	x,#0
1400  025a 89            	pushw	x
1401  025b ae0008        	ldw	x,#L103
1402  025e cd0000        	call	_assert_failed
1404  0261 5b04          	addw	sp,#4
1405  0263               L47:
1406                     ; 212     assert_param(IS_CAN_FILTER_SCALE_OK(CAN_FilterScale));
1408  0263 0d0b          	tnz	(OFST+6,sp)
1409  0265 2712          	jreq	L001
1410  0267 7b0b          	ld	a,(OFST+6,sp)
1411  0269 a102          	cp	a,#2
1412  026b 270c          	jreq	L001
1413  026d 7b0b          	ld	a,(OFST+6,sp)
1414  026f a104          	cp	a,#4
1415  0271 2706          	jreq	L001
1416  0273 7b0b          	ld	a,(OFST+6,sp)
1417  0275 a106          	cp	a,#6
1418  0277 2603          	jrne	L67
1419  0279               L001:
1420  0279 4f            	clr	a
1421  027a 2010          	jra	L201
1422  027c               L67:
1423  027c ae00d4        	ldw	x,#212
1424  027f 89            	pushw	x
1425  0280 ae0000        	ldw	x,#0
1426  0283 89            	pushw	x
1427  0284 ae0008        	ldw	x,#L103
1428  0287 cd0000        	call	_assert_failed
1430  028a 5b04          	addw	sp,#4
1431  028c               L201:
1432                     ; 215     if (CAN_FilterNumber == CAN_FilterNumber_0)
1434  028c 0d06          	tnz	(OFST+1,sp)
1435  028e 2610          	jrne	L535
1436                     ; 217         fact = 0x01;
1438  0290 a601          	ld	a,#1
1439  0292 6b03          	ld	(OFST-2,sp),a
1440                     ; 218         fsc  = 0x00;
1442  0294 0f04          	clr	(OFST-1,sp)
1443                     ; 219         fmhl = 0x03;
1445  0296 a603          	ld	a,#3
1446  0298 6b05          	ld	(OFST+0,sp),a
1447                     ; 221         can_page_filter = CAN_Page_Filter01;
1449  029a a602          	ld	a,#2
1450  029c 6b02          	ld	(OFST-3,sp),a
1452  029e 206c          	jra	L735
1453  02a0               L535:
1454                     ; 223     else if (CAN_FilterNumber == CAN_FilterNumber_1)
1456  02a0 7b06          	ld	a,(OFST+1,sp)
1457  02a2 a101          	cp	a,#1
1458  02a4 2612          	jrne	L145
1459                     ; 225         fact = 0x10;
1461  02a6 a610          	ld	a,#16
1462  02a8 6b03          	ld	(OFST-2,sp),a
1463                     ; 226         fsc  = 0x04;
1465  02aa a604          	ld	a,#4
1466  02ac 6b04          	ld	(OFST-1,sp),a
1467                     ; 227         fmhl = 0x0C;
1469  02ae a60c          	ld	a,#12
1470  02b0 6b05          	ld	(OFST+0,sp),a
1471                     ; 229         can_page_filter = CAN_Page_Filter01;
1473  02b2 a602          	ld	a,#2
1474  02b4 6b02          	ld	(OFST-3,sp),a
1476  02b6 2054          	jra	L735
1477  02b8               L145:
1478                     ; 231     else if (CAN_FilterNumber == CAN_FilterNumber_2)
1480  02b8 7b06          	ld	a,(OFST+1,sp)
1481  02ba a102          	cp	a,#2
1482  02bc 2610          	jrne	L545
1483                     ; 233         fact = 0x01;
1485  02be a601          	ld	a,#1
1486  02c0 6b03          	ld	(OFST-2,sp),a
1487                     ; 234         fsc  = 0x00;
1489  02c2 0f04          	clr	(OFST-1,sp)
1490                     ; 235         fmhl = 0x30;
1492  02c4 a630          	ld	a,#48
1493  02c6 6b05          	ld	(OFST+0,sp),a
1494                     ; 237         can_page_filter = CAN_Page_Filter23;
1496  02c8 a603          	ld	a,#3
1497  02ca 6b02          	ld	(OFST-3,sp),a
1499  02cc 203e          	jra	L735
1500  02ce               L545:
1501                     ; 239     else if (CAN_FilterNumber == CAN_FilterNumber_3)
1503  02ce 7b06          	ld	a,(OFST+1,sp)
1504  02d0 a103          	cp	a,#3
1505  02d2 2612          	jrne	L155
1506                     ; 241         fact = 0x10;
1508  02d4 a610          	ld	a,#16
1509  02d6 6b03          	ld	(OFST-2,sp),a
1510                     ; 242         fsc  = 0x04;
1512  02d8 a604          	ld	a,#4
1513  02da 6b04          	ld	(OFST-1,sp),a
1514                     ; 243         fmhl = 0xC0;
1516  02dc a6c0          	ld	a,#192
1517  02de 6b05          	ld	(OFST+0,sp),a
1518                     ; 245         can_page_filter = CAN_Page_Filter23;
1520  02e0 a603          	ld	a,#3
1521  02e2 6b02          	ld	(OFST-3,sp),a
1523  02e4 2026          	jra	L735
1524  02e6               L155:
1525                     ; 247     else if (CAN_FilterNumber == CAN_FilterNumber_4)
1527  02e6 7b06          	ld	a,(OFST+1,sp)
1528  02e8 a104          	cp	a,#4
1529  02ea 2610          	jrne	L555
1530                     ; 249         fact = 0x01;
1532  02ec a601          	ld	a,#1
1533  02ee 6b03          	ld	(OFST-2,sp),a
1534                     ; 250         fsc  = 0x00;
1536  02f0 0f04          	clr	(OFST-1,sp)
1537                     ; 251         fmhl = 0x03;
1539  02f2 a603          	ld	a,#3
1540  02f4 6b05          	ld	(OFST+0,sp),a
1541                     ; 253         can_page_filter = CAN_Page_Filter45;
1543  02f6 a604          	ld	a,#4
1544  02f8 6b02          	ld	(OFST-3,sp),a
1546  02fa 2010          	jra	L735
1547  02fc               L555:
1548                     ; 257         fact = 0x10;
1550  02fc a610          	ld	a,#16
1551  02fe 6b03          	ld	(OFST-2,sp),a
1552                     ; 258         fsc  = 0x04;
1554  0300 a604          	ld	a,#4
1555  0302 6b04          	ld	(OFST-1,sp),a
1556                     ; 259         fmhl = 0x0C;
1558  0304 a60c          	ld	a,#12
1559  0306 6b05          	ld	(OFST+0,sp),a
1560                     ; 261         can_page_filter = CAN_Page_Filter45;
1562  0308 a604          	ld	a,#4
1563  030a 6b02          	ld	(OFST-3,sp),a
1564  030c               L735:
1565                     ; 265     CAN_OperatingModeRequest(CAN_OperatingMode_Initialization);
1567  030c 4f            	clr	a
1568  030d cd0ba8        	call	_CAN_OperatingModeRequest
1570                     ; 267     CAN->PSR = CAN_Page_Config;
1572  0310 35065427      	mov	21543,#6
1573                     ; 272     if (can_page_filter == CAN_Page_Filter01) /* FCR1 */
1575  0314 7b02          	ld	a,(OFST-3,sp)
1576  0316 a102          	cp	a,#2
1577  0318 262b          	jrne	L165
1578                     ; 275         CAN->Page.Config.FCR1 &= (uint8_t)(~(uint8_t)(fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00|CAN_FCR1_FSC01) << fsc )));
1580  031a 7b04          	ld	a,(OFST-1,sp)
1581  031c 5f            	clrw	x
1582  031d 97            	ld	xl,a
1583  031e a606          	ld	a,#6
1584  0320 5d            	tnzw	x
1585  0321 2704          	jreq	L401
1586  0323               L601:
1587  0323 48            	sll	a
1588  0324 5a            	decw	x
1589  0325 26fc          	jrne	L601
1590  0327               L401:
1591  0327 1a03          	or	a,(OFST-2,sp)
1592  0329 43            	cpl	a
1593  032a c45432        	and	a,21554
1594  032d c75432        	ld	21554,a
1595                     ; 277         CAN->Page.Config.FCR1 |= (uint8_t)(CAN_FilterScale << fsc);
1597  0330 7b04          	ld	a,(OFST-1,sp)
1598  0332 5f            	clrw	x
1599  0333 97            	ld	xl,a
1600  0334 7b0b          	ld	a,(OFST+6,sp)
1601  0336 5d            	tnzw	x
1602  0337 2704          	jreq	L011
1603  0339               L211:
1604  0339 48            	sll	a
1605  033a 5a            	decw	x
1606  033b 26fc          	jrne	L211
1607  033d               L011:
1608  033d ca5432        	or	a,21554
1609  0340 c75432        	ld	21554,a
1611  0343 205a          	jra	L365
1612  0345               L165:
1613                     ; 279     else if (can_page_filter == CAN_Page_Filter23) /* FCR2*/
1615  0345 7b02          	ld	a,(OFST-3,sp)
1616  0347 a103          	cp	a,#3
1617  0349 262b          	jrne	L565
1618                     ; 282         CAN->Page.Config.FCR2 &= (uint8_t)~(uint8_t)( fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00|CAN_FCR1_FSC01) << fsc ));
1620  034b 7b04          	ld	a,(OFST-1,sp)
1621  034d 5f            	clrw	x
1622  034e 97            	ld	xl,a
1623  034f a606          	ld	a,#6
1624  0351 5d            	tnzw	x
1625  0352 2704          	jreq	L411
1626  0354               L611:
1627  0354 48            	sll	a
1628  0355 5a            	decw	x
1629  0356 26fc          	jrne	L611
1630  0358               L411:
1631  0358 1a03          	or	a,(OFST-2,sp)
1632  035a 43            	cpl	a
1633  035b c45433        	and	a,21555
1634  035e c75433        	ld	21555,a
1635                     ; 285         CAN->Page.Config.FCR2 |= (uint8_t)(CAN_FilterScale << fsc);
1637  0361 7b04          	ld	a,(OFST-1,sp)
1638  0363 5f            	clrw	x
1639  0364 97            	ld	xl,a
1640  0365 7b0b          	ld	a,(OFST+6,sp)
1641  0367 5d            	tnzw	x
1642  0368 2704          	jreq	L021
1643  036a               L221:
1644  036a 48            	sll	a
1645  036b 5a            	decw	x
1646  036c 26fc          	jrne	L221
1647  036e               L021:
1648  036e ca5433        	or	a,21555
1649  0371 c75433        	ld	21555,a
1651  0374 2029          	jra	L365
1652  0376               L565:
1653                     ; 291         CAN->Page.Config.FCR3 &= (uint8_t)~(uint8_t)( fact | (uint8_t)((uint8_t)(CAN_FCR1_FSC00|CAN_FCR1_FSC01) << fsc ));
1655  0376 7b04          	ld	a,(OFST-1,sp)
1656  0378 5f            	clrw	x
1657  0379 97            	ld	xl,a
1658  037a a606          	ld	a,#6
1659  037c 5d            	tnzw	x
1660  037d 2704          	jreq	L421
1661  037f               L621:
1662  037f 48            	sll	a
1663  0380 5a            	decw	x
1664  0381 26fc          	jrne	L621
1665  0383               L421:
1666  0383 1a03          	or	a,(OFST-2,sp)
1667  0385 43            	cpl	a
1668  0386 c45434        	and	a,21556
1669  0389 c75434        	ld	21556,a
1670                     ; 294         CAN->Page.Config.FCR3 |= (uint8_t)(CAN_FilterScale << fsc);
1672  038c 7b04          	ld	a,(OFST-1,sp)
1673  038e 5f            	clrw	x
1674  038f 97            	ld	xl,a
1675  0390 7b0b          	ld	a,(OFST+6,sp)
1676  0392 5d            	tnzw	x
1677  0393 2704          	jreq	L031
1678  0395               L231:
1679  0395 48            	sll	a
1680  0396 5a            	decw	x
1681  0397 26fc          	jrne	L231
1682  0399               L031:
1683  0399 ca5434        	or	a,21556
1684  039c c75434        	ld	21556,a
1685  039f               L365:
1686                     ; 300     if (can_page_filter != CAN_Page_Filter45) /* FMR1*/
1688  039f 7b02          	ld	a,(OFST-3,sp)
1689  03a1 a104          	cp	a,#4
1690  03a3 273d          	jreq	L175
1691                     ; 303         if (CAN_FilterMode == CAN_FilterMode_IdMask)
1693  03a5 0d0a          	tnz	(OFST+5,sp)
1694  03a7 260b          	jrne	L375
1695                     ; 306             CAN->Page.Config.FMR1 &= (uint8_t)~(fmhl);
1697  03a9 7b05          	ld	a,(OFST+0,sp)
1698  03ab 43            	cpl	a
1699  03ac c45430        	and	a,21552
1700  03af c75430        	ld	21552,a
1702  03b2 2069          	jra	L706
1703  03b4               L375:
1704                     ; 308         else if ( CAN_FilterMode == CAN_FilterMode_IdList)
1706  03b4 7b0a          	ld	a,(OFST+5,sp)
1707  03b6 a101          	cp	a,#1
1708  03b8 260a          	jrne	L775
1709                     ; 311             CAN->Page.Config.FMR1 |= (uint8_t)(fmhl);
1711  03ba c65430        	ld	a,21552
1712  03bd 1a05          	or	a,(OFST+0,sp)
1713  03bf c75430        	ld	21552,a
1715  03c2 2059          	jra	L706
1716  03c4               L775:
1717                     ; 313         else if ( CAN_FilterMode == CAN_FilterMode_IdList_IdMask)
1719  03c4 7b0a          	ld	a,(OFST+5,sp)
1720  03c6 a111          	cp	a,#17
1721  03c8 260c          	jrne	L306
1722                     ; 316             CAN->Page.Config.FMR1 |= (uint8_t)(fmhl & CAN_IDLIST_IDMASK_MASK);
1724  03ca 7b05          	ld	a,(OFST+0,sp)
1725  03cc a455          	and	a,#85
1726  03ce ca5430        	or	a,21552
1727  03d1 c75430        	ld	21552,a
1729  03d4 2047          	jra	L706
1730  03d6               L306:
1731                     ; 321             CAN->Page.Config.FMR1 |= (uint8_t)(fmhl & CAN_IDMASK_IDLIST_MASK);
1733  03d6 7b05          	ld	a,(OFST+0,sp)
1734  03d8 a4aa          	and	a,#170
1735  03da ca5430        	or	a,21552
1736  03dd c75430        	ld	21552,a
1737  03e0 203b          	jra	L706
1738  03e2               L175:
1739                     ; 330         if (CAN_FilterMode == CAN_FilterMode_IdMask)
1741  03e2 0d0a          	tnz	(OFST+5,sp)
1742  03e4 260b          	jrne	L116
1743                     ; 333             CAN->Page.Config.FMR2 &= (uint8_t)~(fmhl);
1745  03e6 7b05          	ld	a,(OFST+0,sp)
1746  03e8 43            	cpl	a
1747  03e9 c45431        	and	a,21553
1748  03ec c75431        	ld	21553,a
1750  03ef 202c          	jra	L706
1751  03f1               L116:
1752                     ; 335         else if ( CAN_FilterMode == CAN_FilterMode_IdList)
1754  03f1 7b0a          	ld	a,(OFST+5,sp)
1755  03f3 a101          	cp	a,#1
1756  03f5 260a          	jrne	L516
1757                     ; 338             CAN->Page.Config.FMR2 |= (uint8_t)(fmhl);
1759  03f7 c65431        	ld	a,21553
1760  03fa 1a05          	or	a,(OFST+0,sp)
1761  03fc c75431        	ld	21553,a
1763  03ff 201c          	jra	L706
1764  0401               L516:
1765                     ; 340         else if ( CAN_FilterMode == CAN_FilterMode_IdList_IdMask)
1767  0401 7b0a          	ld	a,(OFST+5,sp)
1768  0403 a111          	cp	a,#17
1769  0405 260c          	jrne	L126
1770                     ; 343             CAN->Page.Config.FMR2 |= (uint8_t)(fmhl & CAN_IDLIST_IDMASK_MASK);
1772  0407 7b05          	ld	a,(OFST+0,sp)
1773  0409 a455          	and	a,#85
1774  040b ca5431        	or	a,21553
1775  040e c75431        	ld	21553,a
1777  0411 200a          	jra	L706
1778  0413               L126:
1779                     ; 348             CAN->Page.Config.FMR2 |= (uint8_t)(fmhl & CAN_IDMASK_IDLIST_MASK);
1781  0413 7b05          	ld	a,(OFST+0,sp)
1782  0415 a4aa          	and	a,#170
1783  0417 ca5431        	or	a,21553
1784  041a c75431        	ld	21553,a
1785  041d               L706:
1786                     ; 354     CAN->PSR = (uint8_t)can_page_filter;
1788  041d 7b02          	ld	a,(OFST-3,sp)
1789  041f c75427        	ld	21543,a
1790                     ; 355     if (fsc != 0)
1792  0422 0d04          	tnz	(OFST-1,sp)
1793  0424 2603          	jrne	L431
1794  0426 cc04f2        	jp	L526
1795  0429               L431:
1796                     ; 358         if (CAN_FilterScale == CAN_FilterScale_8Bit)
1798  0429 0d0b          	tnz	(OFST+6,sp)
1799  042b 262c          	jrne	L726
1800                     ; 360             CAN->Page.Filter.FR09 = CAN_FilterID1;
1802  042d 7b0c          	ld	a,(OFST+7,sp)
1803  042f c75430        	ld	21552,a
1804                     ; 361             CAN->Page.Filter.FR10 = CAN_FilterIDMask1;
1806  0432 7b10          	ld	a,(OFST+11,sp)
1807  0434 c75431        	ld	21553,a
1808                     ; 362             CAN->Page.Filter.FR11 = CAN_FilterID2;
1810  0437 7b0d          	ld	a,(OFST+8,sp)
1811  0439 c75432        	ld	21554,a
1812                     ; 363             CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
1814  043c 7b11          	ld	a,(OFST+12,sp)
1815  043e c75433        	ld	21555,a
1816                     ; 364             CAN->Page.Filter.FR13 = CAN_FilterID3;
1818  0441 7b0e          	ld	a,(OFST+9,sp)
1819  0443 c75434        	ld	21556,a
1820                     ; 365             CAN->Page.Filter.FR14 = CAN_FilterIDMask3;
1822  0446 7b12          	ld	a,(OFST+13,sp)
1823  0448 c75435        	ld	21557,a
1824                     ; 366             CAN->Page.Filter.FR15 = CAN_FilterID4;
1826  044b 7b0f          	ld	a,(OFST+10,sp)
1827  044d c75436        	ld	21558,a
1828                     ; 367             CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1830  0450 7b13          	ld	a,(OFST+14,sp)
1831  0452 c75437        	ld	21559,a
1833  0455 acb005b0      	jpf	L546
1834  0459               L726:
1835                     ; 369         else if (CAN_FilterScale == CAN_FilterScale_16_8Bit)
1837  0459 7b0b          	ld	a,(OFST+6,sp)
1838  045b a102          	cp	a,#2
1839  045d 262c          	jrne	L336
1840                     ; 371             CAN->Page.Filter.FR09 = CAN_FilterID1;
1842  045f 7b0c          	ld	a,(OFST+7,sp)
1843  0461 c75430        	ld	21552,a
1844                     ; 372             CAN->Page.Filter.FR10 = CAN_FilterID2;
1846  0464 7b0d          	ld	a,(OFST+8,sp)
1847  0466 c75431        	ld	21553,a
1848                     ; 373             CAN->Page.Filter.FR11 = CAN_FilterIDMask1;
1850  0469 7b10          	ld	a,(OFST+11,sp)
1851  046b c75432        	ld	21554,a
1852                     ; 374             CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
1854  046e 7b11          	ld	a,(OFST+12,sp)
1855  0470 c75433        	ld	21555,a
1856                     ; 375             CAN->Page.Filter.FR13 = CAN_FilterID3;
1858  0473 7b0e          	ld	a,(OFST+9,sp)
1859  0475 c75434        	ld	21556,a
1860                     ; 376             CAN->Page.Filter.FR14 = CAN_FilterIDMask3;
1862  0478 7b12          	ld	a,(OFST+13,sp)
1863  047a c75435        	ld	21557,a
1864                     ; 377             CAN->Page.Filter.FR15 = CAN_FilterID4;
1866  047d 7b0f          	ld	a,(OFST+10,sp)
1867  047f c75436        	ld	21558,a
1868                     ; 378             CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1870  0482 7b13          	ld	a,(OFST+14,sp)
1871  0484 c75437        	ld	21559,a
1873  0487 acb005b0      	jpf	L546
1874  048b               L336:
1875                     ; 380         else if (CAN_FilterScale == CAN_FilterScale_16Bit)
1877  048b 7b0b          	ld	a,(OFST+6,sp)
1878  048d a104          	cp	a,#4
1879  048f 262c          	jrne	L736
1880                     ; 382             CAN->Page.Filter.FR09 = CAN_FilterID1;
1882  0491 7b0c          	ld	a,(OFST+7,sp)
1883  0493 c75430        	ld	21552,a
1884                     ; 383             CAN->Page.Filter.FR10 = CAN_FilterID2;
1886  0496 7b0d          	ld	a,(OFST+8,sp)
1887  0498 c75431        	ld	21553,a
1888                     ; 384             CAN->Page.Filter.FR11 = CAN_FilterIDMask1;
1890  049b 7b10          	ld	a,(OFST+11,sp)
1891  049d c75432        	ld	21554,a
1892                     ; 385             CAN->Page.Filter.FR12 = CAN_FilterIDMask2;
1894  04a0 7b11          	ld	a,(OFST+12,sp)
1895  04a2 c75433        	ld	21555,a
1896                     ; 386             CAN->Page.Filter.FR13 = CAN_FilterID3;
1898  04a5 7b0e          	ld	a,(OFST+9,sp)
1899  04a7 c75434        	ld	21556,a
1900                     ; 387             CAN->Page.Filter.FR14 = CAN_FilterID4;
1902  04aa 7b0f          	ld	a,(OFST+10,sp)
1903  04ac c75435        	ld	21557,a
1904                     ; 388             CAN->Page.Filter.FR15 = CAN_FilterIDMask3;
1906  04af 7b12          	ld	a,(OFST+13,sp)
1907  04b1 c75436        	ld	21558,a
1908                     ; 389             CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1910  04b4 7b13          	ld	a,(OFST+14,sp)
1911  04b6 c75437        	ld	21559,a
1913  04b9 acb005b0      	jpf	L546
1914  04bd               L736:
1915                     ; 391         else if (CAN_FilterScale == CAN_FilterScale_32Bit)
1917  04bd 7b0b          	ld	a,(OFST+6,sp)
1918  04bf a106          	cp	a,#6
1919  04c1 2703          	jreq	L631
1920  04c3 cc05b0        	jp	L546
1921  04c6               L631:
1922                     ; 393             CAN->Page.Filter.FR09 = CAN_FilterID1;
1924  04c6 7b0c          	ld	a,(OFST+7,sp)
1925  04c8 c75430        	ld	21552,a
1926                     ; 394             CAN->Page.Filter.FR10 = CAN_FilterID2;
1928  04cb 7b0d          	ld	a,(OFST+8,sp)
1929  04cd c75431        	ld	21553,a
1930                     ; 395             CAN->Page.Filter.FR11 = CAN_FilterID3;
1932  04d0 7b0e          	ld	a,(OFST+9,sp)
1933  04d2 c75432        	ld	21554,a
1934                     ; 396             CAN->Page.Filter.FR12 = CAN_FilterID4;
1936  04d5 7b0f          	ld	a,(OFST+10,sp)
1937  04d7 c75433        	ld	21555,a
1938                     ; 397             CAN->Page.Filter.FR13 = CAN_FilterIDMask1;
1940  04da 7b10          	ld	a,(OFST+11,sp)
1941  04dc c75434        	ld	21556,a
1942                     ; 398             CAN->Page.Filter.FR14 = CAN_FilterIDMask2;
1944  04df 7b11          	ld	a,(OFST+12,sp)
1945  04e1 c75435        	ld	21557,a
1946                     ; 399             CAN->Page.Filter.FR15 = CAN_FilterIDMask3;
1948  04e4 7b12          	ld	a,(OFST+13,sp)
1949  04e6 c75436        	ld	21558,a
1950                     ; 400             CAN->Page.Filter.FR16 = CAN_FilterIDMask4;
1952  04e9 7b13          	ld	a,(OFST+14,sp)
1953  04eb c75437        	ld	21559,a
1954  04ee acb005b0      	jpf	L546
1955  04f2               L526:
1956                     ; 406         if (CAN_FilterScale == CAN_FilterScale_8Bit)
1958  04f2 0d0b          	tnz	(OFST+6,sp)
1959  04f4 262c          	jrne	L746
1960                     ; 408             CAN->Page.Filter.FR01 = CAN_FilterID1;
1962  04f6 7b0c          	ld	a,(OFST+7,sp)
1963  04f8 c75428        	ld	21544,a
1964                     ; 409             CAN->Page.Filter.FR02 = CAN_FilterIDMask1;
1966  04fb 7b10          	ld	a,(OFST+11,sp)
1967  04fd c75429        	ld	21545,a
1968                     ; 410             CAN->Page.Filter.FR03 = CAN_FilterID2;
1970  0500 7b0d          	ld	a,(OFST+8,sp)
1971  0502 c7542a        	ld	21546,a
1972                     ; 411             CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
1974  0505 7b11          	ld	a,(OFST+12,sp)
1975  0507 c7542b        	ld	21547,a
1976                     ; 412             CAN->Page.Filter.FR05 = CAN_FilterID3;
1978  050a 7b0e          	ld	a,(OFST+9,sp)
1979  050c c7542c        	ld	21548,a
1980                     ; 413             CAN->Page.Filter.FR06 = CAN_FilterIDMask3;
1982  050f 7b12          	ld	a,(OFST+13,sp)
1983  0511 c7542d        	ld	21549,a
1984                     ; 414             CAN->Page.Filter.FR07 = CAN_FilterID4;
1986  0514 7b0f          	ld	a,(OFST+10,sp)
1987  0516 c7542e        	ld	21550,a
1988                     ; 415             CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
1990  0519 7b13          	ld	a,(OFST+14,sp)
1991  051b c7542f        	ld	21551,a
1993  051e acb005b0      	jpf	L546
1994  0522               L746:
1995                     ; 417         else if (CAN_FilterScale == CAN_FilterScale_16_8Bit)
1997  0522 7b0b          	ld	a,(OFST+6,sp)
1998  0524 a102          	cp	a,#2
1999  0526 262a          	jrne	L356
2000                     ; 419             CAN->Page.Filter.FR01 = CAN_FilterID1;
2002  0528 7b0c          	ld	a,(OFST+7,sp)
2003  052a c75428        	ld	21544,a
2004                     ; 420             CAN->Page.Filter.FR02 = CAN_FilterID2;
2006  052d 7b0d          	ld	a,(OFST+8,sp)
2007  052f c75429        	ld	21545,a
2008                     ; 421             CAN->Page.Filter.FR03 = CAN_FilterIDMask1;
2010  0532 7b10          	ld	a,(OFST+11,sp)
2011  0534 c7542a        	ld	21546,a
2012                     ; 422             CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
2014  0537 7b11          	ld	a,(OFST+12,sp)
2015  0539 c7542b        	ld	21547,a
2016                     ; 423             CAN->Page.Filter.FR05 = CAN_FilterID3;
2018  053c 7b0e          	ld	a,(OFST+9,sp)
2019  053e c7542c        	ld	21548,a
2020                     ; 424             CAN->Page.Filter.FR06 = CAN_FilterIDMask3;
2022  0541 7b12          	ld	a,(OFST+13,sp)
2023  0543 c7542d        	ld	21549,a
2024                     ; 425             CAN->Page.Filter.FR07 = CAN_FilterID4;
2026  0546 7b0f          	ld	a,(OFST+10,sp)
2027  0548 c7542e        	ld	21550,a
2028                     ; 426             CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
2030  054b 7b13          	ld	a,(OFST+14,sp)
2031  054d c7542f        	ld	21551,a
2033  0550 205e          	jra	L546
2034  0552               L356:
2035                     ; 428         else if (CAN_FilterScale == CAN_FilterScale_16Bit)
2037  0552 7b0b          	ld	a,(OFST+6,sp)
2038  0554 a104          	cp	a,#4
2039  0556 262a          	jrne	L756
2040                     ; 430             CAN->Page.Filter.FR01 = CAN_FilterID1;
2042  0558 7b0c          	ld	a,(OFST+7,sp)
2043  055a c75428        	ld	21544,a
2044                     ; 431             CAN->Page.Filter.FR02 = CAN_FilterID2;
2046  055d 7b0d          	ld	a,(OFST+8,sp)
2047  055f c75429        	ld	21545,a
2048                     ; 432             CAN->Page.Filter.FR03 = CAN_FilterIDMask1;
2050  0562 7b10          	ld	a,(OFST+11,sp)
2051  0564 c7542a        	ld	21546,a
2052                     ; 433             CAN->Page.Filter.FR04 = CAN_FilterIDMask2;
2054  0567 7b11          	ld	a,(OFST+12,sp)
2055  0569 c7542b        	ld	21547,a
2056                     ; 434             CAN->Page.Filter.FR05 = CAN_FilterID3;
2058  056c 7b0e          	ld	a,(OFST+9,sp)
2059  056e c7542c        	ld	21548,a
2060                     ; 435             CAN->Page.Filter.FR06 = CAN_FilterID4;
2062  0571 7b0f          	ld	a,(OFST+10,sp)
2063  0573 c7542d        	ld	21549,a
2064                     ; 436             CAN->Page.Filter.FR07 = CAN_FilterIDMask3;
2066  0576 7b12          	ld	a,(OFST+13,sp)
2067  0578 c7542e        	ld	21550,a
2068                     ; 437             CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
2070  057b 7b13          	ld	a,(OFST+14,sp)
2071  057d c7542f        	ld	21551,a
2073  0580 202e          	jra	L546
2074  0582               L756:
2075                     ; 439         else if (CAN_FilterScale == CAN_FilterScale_32Bit)
2077  0582 7b0b          	ld	a,(OFST+6,sp)
2078  0584 a106          	cp	a,#6
2079  0586 2628          	jrne	L546
2080                     ; 441             CAN->Page.Filter.FR01 = CAN_FilterID1;
2082  0588 7b0c          	ld	a,(OFST+7,sp)
2083  058a c75428        	ld	21544,a
2084                     ; 442             CAN->Page.Filter.FR02 = CAN_FilterID2;
2086  058d 7b0d          	ld	a,(OFST+8,sp)
2087  058f c75429        	ld	21545,a
2088                     ; 443             CAN->Page.Filter.FR03 = CAN_FilterID3;
2090  0592 7b0e          	ld	a,(OFST+9,sp)
2091  0594 c7542a        	ld	21546,a
2092                     ; 444             CAN->Page.Filter.FR04 = CAN_FilterID4;
2094  0597 7b0f          	ld	a,(OFST+10,sp)
2095  0599 c7542b        	ld	21547,a
2096                     ; 445             CAN->Page.Filter.FR05 = CAN_FilterIDMask1;
2098  059c 7b10          	ld	a,(OFST+11,sp)
2099  059e c7542c        	ld	21548,a
2100                     ; 446             CAN->Page.Filter.FR06 = CAN_FilterIDMask2;
2102  05a1 7b11          	ld	a,(OFST+12,sp)
2103  05a3 c7542d        	ld	21549,a
2104                     ; 447             CAN->Page.Filter.FR07 = CAN_FilterIDMask3;
2106  05a6 7b12          	ld	a,(OFST+13,sp)
2107  05a8 c7542e        	ld	21550,a
2108                     ; 448             CAN->Page.Filter.FR08 = CAN_FilterIDMask4;
2110  05ab 7b13          	ld	a,(OFST+14,sp)
2111  05ad c7542f        	ld	21551,a
2112  05b0               L546:
2113                     ; 457     CAN->PSR = CAN_Page_Config;
2115  05b0 35065427      	mov	21543,#6
2116                     ; 458     if (CAN_FilterActivation != DISABLE)
2118  05b4 0d07          	tnz	(OFST+2,sp)
2119  05b6 272a          	jreq	L566
2120                     ; 460         if ((CAN_FilterNumber & 0x06) == 0x00) /* FCR1*/
2122  05b8 7b06          	ld	a,(OFST+1,sp)
2123  05ba a506          	bcp	a,#6
2124  05bc 260a          	jrne	L766
2125                     ; 461         {   CAN->Page.Config.FCR1 |= (uint8_t)fact;
2127  05be c65432        	ld	a,21554
2128  05c1 1a03          	or	a,(OFST-2,sp)
2129  05c3 c75432        	ld	21554,a
2131  05c6 201a          	jra	L566
2132  05c8               L766:
2133                     ; 463         else if ((CAN_FilterNumber & 0x06) == 0x02) /*FCR2*/
2135  05c8 7b06          	ld	a,(OFST+1,sp)
2136  05ca a406          	and	a,#6
2137  05cc a102          	cp	a,#2
2138  05ce 260a          	jrne	L376
2139                     ; 464         { CAN->Page.Config.FCR2 |= (uint8_t)fact;
2141  05d0 c65433        	ld	a,21555
2142  05d3 1a03          	or	a,(OFST-2,sp)
2143  05d5 c75433        	ld	21555,a
2145  05d8 2008          	jra	L566
2146  05da               L376:
2147                     ; 467         { CAN->Page.Config.FCR3 |= (uint8_t)fact;
2149  05da c65434        	ld	a,21556
2150  05dd 1a03          	or	a,(OFST-2,sp)
2151  05df c75434        	ld	21556,a
2152  05e2               L566:
2153                     ; 470     CAN_OperatingModeRequest(CAN_OperatingMode_Normal);
2155  05e2 a601          	ld	a,#1
2156  05e4 cd0ba8        	call	_CAN_OperatingModeRequest
2158                     ; 472     CAN_SelectPage(can_page);
2160  05e7 7b01          	ld	a,(OFST-4,sp)
2161  05e9 cd10ac        	call	_CAN_SelectPage
2163                     ; 473 }
2166  05ec 5b07          	addw	sp,#7
2167  05ee 81            	ret
2310                     ; 481 void CAN_ITConfig(CAN_IT_TypeDef CAN_IT, FunctionalState NewState)
2310                     ; 482 {
2311                     	switch	.text
2312  05ef               _CAN_ITConfig:
2314  05ef 89            	pushw	x
2315  05f0 5203          	subw	sp,#3
2316       00000003      OFST:	set	3
2319                     ; 483     uint8_t tmperrorinterrupt = 0;
2321  05f2 7b03          	ld	a,(OFST+0,sp)
2322  05f4 97            	ld	xl,a
2323                     ; 484     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
2325  05f5 cd10a8        	call	_CAN_GetSelectedPage
2327  05f8 6b02          	ld	(OFST-1,sp),a
2328                     ; 488     assert_param(IS_CAN_IT_CONFIG_OK(CAN_IT));
2330  05fa 1e04          	ldw	x,(OFST+1,sp)
2331  05fc 2711          	jreq	L241
2332  05fe 1e04          	ldw	x,(OFST+1,sp)
2333  0600 01            	rrwa	x,a
2334  0601 a470          	and	a,#112
2335  0603 01            	rrwa	x,a
2336  0604 a4b0          	and	a,#176
2337  0606 01            	rrwa	x,a
2338  0607 a30000        	cpw	x,#0
2339  060a 2603          	jrne	L241
2340  060c 4f            	clr	a
2341  060d 2010          	jra	L441
2342  060f               L241:
2343  060f ae01e8        	ldw	x,#488
2344  0612 89            	pushw	x
2345  0613 ae0000        	ldw	x,#0
2346  0616 89            	pushw	x
2347  0617 ae0008        	ldw	x,#L103
2348  061a cd0000        	call	_assert_failed
2350  061d 5b04          	addw	sp,#4
2351  061f               L441:
2352                     ; 489     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2354  061f 0d08          	tnz	(OFST+5,sp)
2355  0621 2706          	jreq	L051
2356  0623 7b08          	ld	a,(OFST+5,sp)
2357  0625 a101          	cp	a,#1
2358  0627 2603          	jrne	L641
2359  0629               L051:
2360  0629 4f            	clr	a
2361  062a 2010          	jra	L251
2362  062c               L641:
2363  062c ae01e9        	ldw	x,#489
2364  062f 89            	pushw	x
2365  0630 ae0000        	ldw	x,#0
2366  0633 89            	pushw	x
2367  0634 ae0008        	ldw	x,#L103
2368  0637 cd0000        	call	_assert_failed
2370  063a 5b04          	addw	sp,#4
2371  063c               L251:
2372                     ; 491     tmperrorinterrupt = (uint8_t)(((uint16_t)CAN_IT) >>7);
2374  063c 1e04          	ldw	x,(OFST+1,sp)
2375  063e a607          	ld	a,#7
2376  0640               L451:
2377  0640 54            	srlw	x
2378  0641 4a            	dec	a
2379  0642 26fc          	jrne	L451
2380  0644 9f            	ld	a,xl
2381  0645 6b03          	ld	(OFST+0,sp),a
2382                     ; 492     tmperrorinterrupt = (uint8_t)((uint8_t)((uint16_t)tmperrorinterrupt & 0xF0) | 
2382                     ; 493                                   (uint8_t)((uint8_t)((uint16_t)tmperrorinterrupt & 0x0F) >>1));
2384  0647 7b03          	ld	a,(OFST+0,sp)
2385  0649 a40f          	and	a,#15
2386  064b 44            	srl	a
2387  064c 6b01          	ld	(OFST-2,sp),a
2388  064e 7b03          	ld	a,(OFST+0,sp)
2389  0650 a4f0          	and	a,#240
2390  0652 1a01          	or	a,(OFST-2,sp)
2391  0654 6b03          	ld	(OFST+0,sp),a
2392                     ; 495     CAN->PSR = CAN_Page_Config;
2394  0656 35065427      	mov	21543,#6
2395                     ; 496     if (NewState != DISABLE)
2397  065a 0d08          	tnz	(OFST+5,sp)
2398  065c 2712          	jreq	L167
2399                     ; 499         CAN->IER |= (uint8_t)(CAN_IT);
2401  065e c65425        	ld	a,21541
2402  0661 1a05          	or	a,(OFST+2,sp)
2403  0663 c75425        	ld	21541,a
2404                     ; 500         CAN->Page.Config.EIER |= (uint8_t)(tmperrorinterrupt);
2406  0666 c65429        	ld	a,21545
2407  0669 1a03          	or	a,(OFST+0,sp)
2408  066b c75429        	ld	21545,a
2410  066e 2012          	jra	L367
2411  0670               L167:
2412                     ; 505         CAN->IER &= (uint8_t)~(uint8_t)((uint16_t)CAN_IT);
2414  0670 7b05          	ld	a,(OFST+2,sp)
2415  0672 43            	cpl	a
2416  0673 c45425        	and	a,21541
2417  0676 c75425        	ld	21541,a
2418                     ; 506         CAN->Page.Config.EIER &= (uint8_t)~(tmperrorinterrupt);
2420  0679 7b03          	ld	a,(OFST+0,sp)
2421  067b 43            	cpl	a
2422  067c c45429        	and	a,21545
2423  067f c75429        	ld	21545,a
2424  0682               L367:
2425                     ; 509     CAN_SelectPage(can_page);
2427  0682 7b02          	ld	a,(OFST-1,sp)
2428  0684 cd10ac        	call	_CAN_SelectPage
2430                     ; 510 }
2433  0687 5b05          	addw	sp,#5
2434  0689 81            	ret
2494                     ; 519 void CAN_ST7CompatibilityCmd(CAN_ST7Compatibility_TypeDef CAN_ST7Compatibility)
2494                     ; 520 {
2495                     	switch	.text
2496  068a               _CAN_ST7CompatibilityCmd:
2498  068a 88            	push	a
2499       00000000      OFST:	set	0
2502                     ; 522     assert_param(IS_CAN_ST7_COMPATIBILITY_OK(CAN_ST7Compatibility));
2504  068b 4d            	tnz	a
2505  068c 2704          	jreq	L261
2506  068e a110          	cp	a,#16
2507  0690 2603          	jrne	L061
2508  0692               L261:
2509  0692 4f            	clr	a
2510  0693 2010          	jra	L461
2511  0695               L061:
2512  0695 ae020a        	ldw	x,#522
2513  0698 89            	pushw	x
2514  0699 ae0000        	ldw	x,#0
2515  069c 89            	pushw	x
2516  069d ae0008        	ldw	x,#L103
2517  06a0 cd0000        	call	_assert_failed
2519  06a3 5b04          	addw	sp,#4
2520  06a5               L461:
2521                     ; 524     CAN->DGR &= (uint8_t)(~CAN_DGR_TXM2E);
2523  06a5 72195426      	bres	21542,#4
2524                     ; 527     CAN->DGR |= (uint8_t)CAN_ST7Compatibility;
2526  06a9 c65426        	ld	a,21542
2527  06ac 1a01          	or	a,(OFST+1,sp)
2528  06ae c75426        	ld	21542,a
2529                     ; 528 }
2532  06b1 84            	pop	a
2533  06b2 81            	ret
2581                     ; 535 void CAN_TTComModeCmd(FunctionalState NewState)
2581                     ; 536 {
2582                     	switch	.text
2583  06b3               _CAN_TTComModeCmd:
2585  06b3 88            	push	a
2586  06b4 88            	push	a
2587       00000001      OFST:	set	1
2590                     ; 537     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
2592  06b5 cd10a8        	call	_CAN_GetSelectedPage
2594  06b8 6b01          	ld	(OFST+0,sp),a
2595                     ; 539     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2597  06ba 0d02          	tnz	(OFST+1,sp)
2598  06bc 2706          	jreq	L271
2599  06be 7b02          	ld	a,(OFST+1,sp)
2600  06c0 a101          	cp	a,#1
2601  06c2 2603          	jrne	L071
2602  06c4               L271:
2603  06c4 4f            	clr	a
2604  06c5 2010          	jra	L471
2605  06c7               L071:
2606  06c7 ae021b        	ldw	x,#539
2607  06ca 89            	pushw	x
2608  06cb ae0000        	ldw	x,#0
2609  06ce 89            	pushw	x
2610  06cf ae0008        	ldw	x,#L103
2611  06d2 cd0000        	call	_assert_failed
2613  06d5 5b04          	addw	sp,#4
2614  06d7               L471:
2615                     ; 540     if (NewState != DISABLE)
2617  06d7 0d02          	tnz	(OFST+1,sp)
2618  06d9 2726          	jreq	L5301
2619                     ; 543         CAN->MCR |= CAN_MCR_TTCM;
2621  06db 721e5420      	bset	21536,#7
2622                     ; 545         CAN->PSR = CAN_Page_TxMailBox0;
2624  06df 725f5427      	clr	21543
2625                     ; 546         CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
2627  06e3 721e5429      	bset	21545,#7
2628                     ; 547         CAN->PSR = CAN_Page_TxMailBox1;
2630  06e7 35015427      	mov	21543,#1
2631                     ; 548         CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
2633  06eb 721e5429      	bset	21545,#7
2634                     ; 549         CAN->PSR = CAN_Page_TxMailBox2;
2636  06ef 35055427      	mov	21543,#5
2637                     ; 550         CAN->Page.TxMailbox.MDLCR |= CAN_MDLCR_TGT;
2639  06f3 721e5429      	bset	21545,#7
2640                     ; 551         CAN->PSR = CAN_Page_RxFifo;
2642  06f7 35075427      	mov	21543,#7
2643                     ; 552         CAN->Page.RxFIFO.MDLCR |= CAN_MDLCR_TGT;
2645  06fb 721e5429      	bset	21545,#7
2647  06ff 2024          	jra	L7301
2648  0701               L5301:
2649                     ; 557         CAN->MCR &= ((uint8_t)~CAN_MCR_TTCM);
2651  0701 721f5420      	bres	21536,#7
2652                     ; 559         CAN->PSR = CAN_Page_TxMailBox0;
2654  0705 725f5427      	clr	21543
2655                     ; 560         CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2657  0709 721f5429      	bres	21545,#7
2658                     ; 561         CAN->PSR = CAN_Page_TxMailBox1;
2660  070d 35015427      	mov	21543,#1
2661                     ; 562         CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2663  0711 721f5429      	bres	21545,#7
2664                     ; 563         CAN->PSR = CAN_Page_TxMailBox2;
2666  0715 35055427      	mov	21543,#5
2667                     ; 564         CAN->Page.TxMailbox.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2669  0719 721f5429      	bres	21545,#7
2670                     ; 565         CAN->PSR = CAN_Page_RxFifo;
2672  071d 35075427      	mov	21543,#7
2673                     ; 566         CAN->Page.RxFIFO.MDLCR &= ((uint8_t)~CAN_MDLCR_TGT);
2675  0721 721f5429      	bres	21545,#7
2676  0725               L7301:
2677                     ; 569     CAN_SelectPage(can_page);
2679  0725 7b01          	ld	a,(OFST+0,sp)
2680  0727 cd10ac        	call	_CAN_SelectPage
2682                     ; 570 }
2685  072a 85            	popw	x
2686  072b 81            	ret
2892                     .const:	section	.text
2893  0000               L012:
2894  0000 20000000      	dc.l	536870912
2895  0004               L612:
2896  0004 00000800      	dc.l	2048
2897                     ; 581 CAN_TxStatus_TypeDef CAN_Transmit(uint32_t CAN_Id,
2897                     ; 582                                   CAN_Id_TypeDef CAN_IDE,
2897                     ; 583                                   CAN_RTR_TypeDef CAN_RTR,
2897                     ; 584                                   uint8_t CAN_DLC,
2897                     ; 585                                   uint8_t *CAN_Data)
2897                     ; 586 {
2898                     	switch	.text
2899  072c               _CAN_Transmit:
2901  072c 5206          	subw	sp,#6
2902       00000006      OFST:	set	6
2905                     ; 587     CAN_TxStatus_TypeDef CAN_TxStatus = CAN_TxStatus_NoMailBox;
2907  072e 7b06          	ld	a,(OFST+0,sp)
2908  0730 97            	ld	xl,a
2909                     ; 588     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
2911  0731 cd10a8        	call	_CAN_GetSelectedPage
2913  0734 6b05          	ld	(OFST-1,sp),a
2914                     ; 590     assert_param(IS_CAN_IDTYPE_OK(CAN_IDE));
2916  0736 0d0d          	tnz	(OFST+7,sp)
2917  0738 2706          	jreq	L202
2918  073a 7b0d          	ld	a,(OFST+7,sp)
2919  073c a140          	cp	a,#64
2920  073e 2603          	jrne	L002
2921  0740               L202:
2922  0740 4f            	clr	a
2923  0741 2010          	jra	L402
2924  0743               L002:
2925  0743 ae024e        	ldw	x,#590
2926  0746 89            	pushw	x
2927  0747 ae0000        	ldw	x,#0
2928  074a 89            	pushw	x
2929  074b ae0008        	ldw	x,#L103
2930  074e cd0000        	call	_assert_failed
2932  0751 5b04          	addw	sp,#4
2933  0753               L402:
2934                     ; 591     if (CAN_IDE != CAN_Id_Standard)
2936  0753 0d0d          	tnz	(OFST+7,sp)
2937  0755 2724          	jreq	L3511
2938                     ; 593         assert_param(IS_CAN_EXTID_OK(CAN_Id));
2940  0757 96            	ldw	x,sp
2941  0758 1c0009        	addw	x,#OFST+3
2942  075b cd0000        	call	c_ltor
2944  075e ae0000        	ldw	x,#L012
2945  0761 cd0000        	call	c_lcmp
2947  0764 2403          	jruge	L602
2948  0766 4f            	clr	a
2949  0767 2010          	jra	L212
2950  0769               L602:
2951  0769 ae0251        	ldw	x,#593
2952  076c 89            	pushw	x
2953  076d ae0000        	ldw	x,#0
2954  0770 89            	pushw	x
2955  0771 ae0008        	ldw	x,#L103
2956  0774 cd0000        	call	_assert_failed
2958  0777 5b04          	addw	sp,#4
2959  0779               L212:
2961  0779 2022          	jra	L5511
2962  077b               L3511:
2963                     ; 597         assert_param(IS_CAN_STDID_OK(CAN_Id));
2965  077b 96            	ldw	x,sp
2966  077c 1c0009        	addw	x,#OFST+3
2967  077f cd0000        	call	c_ltor
2969  0782 ae0004        	ldw	x,#L612
2970  0785 cd0000        	call	c_lcmp
2972  0788 2403          	jruge	L412
2973  078a 4f            	clr	a
2974  078b 2010          	jra	L022
2975  078d               L412:
2976  078d ae0255        	ldw	x,#597
2977  0790 89            	pushw	x
2978  0791 ae0000        	ldw	x,#0
2979  0794 89            	pushw	x
2980  0795 ae0008        	ldw	x,#L103
2981  0798 cd0000        	call	_assert_failed
2983  079b 5b04          	addw	sp,#4
2984  079d               L022:
2985  079d               L5511:
2986                     ; 599     assert_param(IS_CAN_RTR_OK(CAN_RTR));
2988  079d 0d0e          	tnz	(OFST+8,sp)
2989  079f 2706          	jreq	L422
2990  07a1 7b0e          	ld	a,(OFST+8,sp)
2991  07a3 a120          	cp	a,#32
2992  07a5 2603          	jrne	L222
2993  07a7               L422:
2994  07a7 4f            	clr	a
2995  07a8 2010          	jra	L622
2996  07aa               L222:
2997  07aa ae0257        	ldw	x,#599
2998  07ad 89            	pushw	x
2999  07ae ae0000        	ldw	x,#0
3000  07b1 89            	pushw	x
3001  07b2 ae0008        	ldw	x,#L103
3002  07b5 cd0000        	call	_assert_failed
3004  07b8 5b04          	addw	sp,#4
3005  07ba               L622:
3006                     ; 600     assert_param(IS_CAN_DLC_OK(CAN_DLC));
3008  07ba 7b0f          	ld	a,(OFST+9,sp)
3009  07bc a109          	cp	a,#9
3010  07be 2403          	jruge	L032
3011  07c0 4f            	clr	a
3012  07c1 2010          	jra	L232
3013  07c3               L032:
3014  07c3 ae0258        	ldw	x,#600
3015  07c6 89            	pushw	x
3016  07c7 ae0000        	ldw	x,#0
3017  07ca 89            	pushw	x
3018  07cb ae0008        	ldw	x,#L103
3019  07ce cd0000        	call	_assert_failed
3021  07d1 5b04          	addw	sp,#4
3022  07d3               L232:
3023                     ; 602     if ((CAN->TPR & CAN_TPR_TME0) == CAN_TPR_TME0)
3025  07d3 c65423        	ld	a,21539
3026  07d6 a404          	and	a,#4
3027  07d8 a104          	cp	a,#4
3028  07da 2604          	jrne	L7511
3029                     ; 604         CAN_TxStatus = CAN_TxStatus_MailBox0Ok;
3031  07dc 0f06          	clr	(OFST+0,sp)
3033  07de 2022          	jra	L1611
3034  07e0               L7511:
3035                     ; 606     else if ((CAN->TPR & CAN_TPR_TME1) == CAN_TPR_TME1)
3037  07e0 c65423        	ld	a,21539
3038  07e3 a408          	and	a,#8
3039  07e5 a108          	cp	a,#8
3040  07e7 2606          	jrne	L3611
3041                     ; 608         CAN_TxStatus = CAN_TxStatus_MailBox1Ok;
3043  07e9 a601          	ld	a,#1
3044  07eb 6b06          	ld	(OFST+0,sp),a
3046  07ed 2013          	jra	L1611
3047  07ef               L3611:
3048                     ; 610     else if ((CAN->TPR & CAN_TPR_TME2) == CAN_TPR_TME2)
3050  07ef c65423        	ld	a,21539
3051  07f2 a410          	and	a,#16
3052  07f4 a110          	cp	a,#16
3053  07f6 2606          	jrne	L7611
3054                     ; 612         CAN_TxStatus = CAN_TxStatus_MailBox2Ok;
3056  07f8 a605          	ld	a,#5
3057  07fa 6b06          	ld	(OFST+0,sp),a
3059  07fc 2004          	jra	L1611
3060  07fe               L7611:
3061                     ; 616         CAN_TxStatus = CAN_TxStatus_NoMailBox;
3063  07fe a6f4          	ld	a,#244
3064  0800 6b06          	ld	(OFST+0,sp),a
3065  0802               L1611:
3066                     ; 618     if (CAN_TxStatus != CAN_TxStatus_NoMailBox)
3068  0802 7b06          	ld	a,(OFST+0,sp)
3069  0804 a1f4          	cp	a,#244
3070  0806 2603          	jrne	L432
3071  0808 cc08d4        	jp	L3711
3072  080b               L432:
3073                     ; 620         CAN->PSR = (uint8_t)CAN_TxStatus;
3075  080b 7b06          	ld	a,(OFST+0,sp)
3076  080d c75427        	ld	21543,a
3077                     ; 622         if (CAN_IDE != CAN_Id_Standard)
3079  0810 0d0d          	tnz	(OFST+7,sp)
3080  0812 273b          	jreq	L5711
3081                     ; 624             CAN_Id &= (uint32_t)CAN_EXTID_SIZE;
3083  0814 7b09          	ld	a,(OFST+3,sp)
3084  0816 a41f          	and	a,#31
3085  0818 6b09          	ld	(OFST+3,sp),a
3086                     ; 625             CAN->Page.TxMailbox.MIDR4 = (uint8_t)(CAN_Id);
3088  081a 7b0c          	ld	a,(OFST+6,sp)
3089  081c c7542d        	ld	21549,a
3090                     ; 626             CAN_Id = CAN_Id>>8;
3092  081f 96            	ldw	x,sp
3093  0820 1c0009        	addw	x,#OFST+3
3094  0823 a608          	ld	a,#8
3095  0825 cd0000        	call	c_lgursh
3097                     ; 627             CAN->Page.TxMailbox.MIDR3 = (uint8_t)(CAN_Id);
3099  0828 7b0c          	ld	a,(OFST+6,sp)
3100  082a c7542c        	ld	21548,a
3101                     ; 628             CAN_Id = CAN_Id>>8;
3103  082d 96            	ldw	x,sp
3104  082e 1c0009        	addw	x,#OFST+3
3105  0831 a608          	ld	a,#8
3106  0833 cd0000        	call	c_lgursh
3108                     ; 629             CAN->Page.TxMailbox.MIDR2 = (uint8_t)(CAN_Id);
3110  0836 7b0c          	ld	a,(OFST+6,sp)
3111  0838 c7542b        	ld	21547,a
3112                     ; 630             CAN_Id = CAN_Id>>8;
3114  083b 96            	ldw	x,sp
3115  083c 1c0009        	addw	x,#OFST+3
3116  083f a608          	ld	a,#8
3117  0841 cd0000        	call	c_lgursh
3119                     ; 631             CAN->Page.TxMailbox.MIDR1 = (uint8_t)(CAN_Id |CAN_IDE | CAN_RTR);
3121  0844 7b0c          	ld	a,(OFST+6,sp)
3122  0846 1a0d          	or	a,(OFST+7,sp)
3123  0848 1a0e          	or	a,(OFST+8,sp)
3124  084a c7542a        	ld	21546,a
3126  084d 203a          	jra	L7711
3127  084f               L5711:
3128                     ; 635             CAN_Id &= (uint16_t)CAN_STDID_SIZE;
3130  084f 7b0b          	ld	a,(OFST+5,sp)
3131  0851 a407          	and	a,#7
3132  0853 6b0b          	ld	(OFST+5,sp),a
3133  0855 0f0a          	clr	(OFST+4,sp)
3134  0857 0f09          	clr	(OFST+3,sp)
3135                     ; 636             CAN->Page.TxMailbox.MIDR1 = (uint8_t)((CAN_Id>>6) | (CAN_RTR)) ;
3137  0859 7b0e          	ld	a,(OFST+8,sp)
3138  085b b703          	ld	c_lreg+3,a
3139  085d 3f02          	clr	c_lreg+2
3140  085f 3f01          	clr	c_lreg+1
3141  0861 3f00          	clr	c_lreg
3142  0863 96            	ldw	x,sp
3143  0864 1c0001        	addw	x,#OFST-5
3144  0867 cd0000        	call	c_rtol
3146  086a 96            	ldw	x,sp
3147  086b 1c0009        	addw	x,#OFST+3
3148  086e cd0000        	call	c_ltor
3150  0871 a606          	ld	a,#6
3151  0873 cd0000        	call	c_lursh
3153  0876 96            	ldw	x,sp
3154  0877 1c0001        	addw	x,#OFST-5
3155  087a cd0000        	call	c_lor
3157  087d b603          	ld	a,c_lreg+3
3158  087f c7542a        	ld	21546,a
3159                     ; 637             CAN->Page.TxMailbox.MIDR2 = (uint8_t)(CAN_Id<<2);
3161  0882 7b0c          	ld	a,(OFST+6,sp)
3162  0884 48            	sll	a
3163  0885 48            	sll	a
3164  0886 c7542b        	ld	21547,a
3165  0889               L7711:
3166                     ; 641         CAN->Page.TxMailbox.MDLCR &= (uint8_t)0xF0;
3168  0889 c65429        	ld	a,21545
3169  088c a4f0          	and	a,#240
3170  088e c75429        	ld	21545,a
3171                     ; 643         CAN->Page.TxMailbox.MDLCR |= CAN_DLC;
3173  0891 c65429        	ld	a,21545
3174  0894 1a0f          	or	a,(OFST+9,sp)
3175  0896 c75429        	ld	21545,a
3176                     ; 645         CAN->Page.TxMailbox.MDAR1 = CAN_Data[0];
3178  0899 1e10          	ldw	x,(OFST+10,sp)
3179  089b f6            	ld	a,(x)
3180  089c c7542e        	ld	21550,a
3181                     ; 646         CAN->Page.TxMailbox.MDAR2 = CAN_Data[1];
3183  089f 1e10          	ldw	x,(OFST+10,sp)
3184  08a1 e601          	ld	a,(1,x)
3185  08a3 c7542f        	ld	21551,a
3186                     ; 647         CAN->Page.TxMailbox.MDAR3 = CAN_Data[2];
3188  08a6 1e10          	ldw	x,(OFST+10,sp)
3189  08a8 e602          	ld	a,(2,x)
3190  08aa c75430        	ld	21552,a
3191                     ; 648         CAN->Page.TxMailbox.MDAR4 = CAN_Data[3];
3193  08ad 1e10          	ldw	x,(OFST+10,sp)
3194  08af e603          	ld	a,(3,x)
3195  08b1 c75431        	ld	21553,a
3196                     ; 649         CAN->Page.TxMailbox.MDAR5 = CAN_Data[4];
3198  08b4 1e10          	ldw	x,(OFST+10,sp)
3199  08b6 e604          	ld	a,(4,x)
3200  08b8 c75432        	ld	21554,a
3201                     ; 650         CAN->Page.TxMailbox.MDAR6 = CAN_Data[5];
3203  08bb 1e10          	ldw	x,(OFST+10,sp)
3204  08bd e605          	ld	a,(5,x)
3205  08bf c75433        	ld	21555,a
3206                     ; 651         CAN->Page.TxMailbox.MDAR7 = CAN_Data[6];
3208  08c2 1e10          	ldw	x,(OFST+10,sp)
3209  08c4 e606          	ld	a,(6,x)
3210  08c6 c75434        	ld	21556,a
3211                     ; 652         CAN->Page.TxMailbox.MDAR8 = CAN_Data[7];
3213  08c9 1e10          	ldw	x,(OFST+10,sp)
3214  08cb e607          	ld	a,(7,x)
3215  08cd c75435        	ld	21557,a
3216                     ; 654         CAN->Page.TxMailbox.MCSR |= CAN_MCSR_TXRQ;
3218  08d0 72105428      	bset	21544,#0
3219  08d4               L3711:
3220                     ; 657     CAN_SelectPage(can_page);
3222  08d4 7b05          	ld	a,(OFST-1,sp)
3223  08d6 cd10ac        	call	_CAN_SelectPage
3225                     ; 658     return (CAN_TxStatus_TypeDef)CAN_TxStatus;
3227  08d9 7b06          	ld	a,(OFST+0,sp)
3230  08db 5b06          	addw	sp,#6
3231  08dd 81            	ret
3318                     ; 666 CAN_TxStatus_TypeDef CAN_TransmitStatus(CAN_TransmitMailBox_TypeDef CAN_TransmitMailbox)
3318                     ; 667 {
3319                     	switch	.text
3320  08de               _CAN_TransmitStatus:
3322  08de 88            	push	a
3323  08df 89            	pushw	x
3324       00000002      OFST:	set	2
3327                     ; 669     CAN_TxStatus_TypeDef tstate = CAN_TxStatus_Failed;
3329  08e0 a6f0          	ld	a,#240
3330  08e2 6b01          	ld	(OFST-1,sp),a
3331                     ; 670     uint8_t tmpstate=0;
3333  08e4 0f02          	clr	(OFST+0,sp)
3334                     ; 673     assert_param(IS_CAN_TRANSMITMAILBOX_OK(CAN_TransmitMailbox));
3336  08e6 0d03          	tnz	(OFST+1,sp)
3337  08e8 270c          	jreq	L242
3338  08ea 7b03          	ld	a,(OFST+1,sp)
3339  08ec a101          	cp	a,#1
3340  08ee 2706          	jreq	L242
3341  08f0 7b03          	ld	a,(OFST+1,sp)
3342  08f2 a105          	cp	a,#5
3343  08f4 2603          	jrne	L042
3344  08f6               L242:
3345  08f6 4f            	clr	a
3346  08f7 2010          	jra	L442
3347  08f9               L042:
3348  08f9 ae02a1        	ldw	x,#673
3349  08fc 89            	pushw	x
3350  08fd ae0000        	ldw	x,#0
3351  0900 89            	pushw	x
3352  0901 ae0008        	ldw	x,#L103
3353  0904 cd0000        	call	_assert_failed
3355  0907 5b04          	addw	sp,#4
3356  0909               L442:
3357                     ; 675     switch (CAN_TransmitMailbox)
3359  0909 7b03          	ld	a,(OFST+1,sp)
3361                     ; 688         break;
3362  090b 4d            	tnz	a
3363  090c 270d          	jreq	L1021
3364  090e 4a            	dec	a
3365  090f 271c          	jreq	L3021
3366  0911 a004          	sub	a,#4
3367  0913 272c          	jreq	L5021
3368  0915               L7021:
3369                     ; 686     default:
3369                     ; 687         tstate = CAN_TxStatus_Failed;
3371  0915 a6f0          	ld	a,#240
3372  0917 6b01          	ld	(OFST-1,sp),a
3373                     ; 688         break;
3375  0919 203a          	jra	L5621
3376  091b               L1021:
3377                     ; 677     case (CAN_TransmitMailBox_0): tmpstate = (uint8_t)((CAN->TSR & (uint8_t)(CAN_TSR_RQCP0|CAN_TSR_TXOK0)));
3379  091b c65422        	ld	a,21538
3380  091e a411          	and	a,#17
3381  0920 6b02          	ld	(OFST+0,sp),a
3382                     ; 678         tmpstate |= (uint8_t)((CAN->TPR & CAN_TPR_TME0));
3384  0922 c65423        	ld	a,21539
3385  0925 a404          	and	a,#4
3386  0927 1a02          	or	a,(OFST+0,sp)
3387  0929 6b02          	ld	(OFST+0,sp),a
3388                     ; 679         break;
3390  092b 2028          	jra	L5621
3391  092d               L3021:
3392                     ; 680     case (CAN_TransmitMailBox_1): tmpstate = (uint8_t)((uint8_t)(CAN->TSR & (uint8_t)(CAN_TSR_RQCP1|CAN_TSR_TXOK1))>>1);
3394  092d c65422        	ld	a,21538
3395  0930 a422          	and	a,#34
3396  0932 44            	srl	a
3397  0933 6b02          	ld	(OFST+0,sp),a
3398                     ; 681         tmpstate |= (uint8_t)((uint8_t)(CAN->TPR & CAN_TPR_TME1) >> 1);
3400  0935 c65423        	ld	a,21539
3401  0938 a408          	and	a,#8
3402  093a 44            	srl	a
3403  093b 1a02          	or	a,(OFST+0,sp)
3404  093d 6b02          	ld	(OFST+0,sp),a
3405                     ; 682         break;
3407  093f 2014          	jra	L5621
3408  0941               L5021:
3409                     ; 683     case (CAN_TransmitMailBox_2): tmpstate = (uint8_t)((uint8_t)(CAN->TSR & (uint8_t)(CAN_TSR_RQCP2|CAN_TSR_TXOK2))>>2);
3411  0941 c65422        	ld	a,21538
3412  0944 a444          	and	a,#68
3413  0946 44            	srl	a
3414  0947 44            	srl	a
3415  0948 6b02          	ld	(OFST+0,sp),a
3416                     ; 684         tmpstate |= (uint8_t)((uint8_t)(CAN->TPR & CAN_TPR_TME2) >> 2);
3418  094a c65423        	ld	a,21539
3419  094d a410          	and	a,#16
3420  094f 44            	srl	a
3421  0950 44            	srl	a
3422  0951 1a02          	or	a,(OFST+0,sp)
3423  0953 6b02          	ld	(OFST+0,sp),a
3424                     ; 685         break;
3426  0955               L5621:
3427                     ; 691     switch (tmpstate)
3429  0955 7b02          	ld	a,(OFST+0,sp)
3431                     ; 707         break;
3432  0957 4d            	tnz	a
3433  0958 2711          	jreq	L1121
3434  095a a004          	sub	a,#4
3435  095c 271f          	jreq	L7121
3436  095e 4a            	dec	a
3437  095f 2710          	jreq	L3121
3438  0961 a010          	sub	a,#16
3439  0963 2712          	jreq	L5121
3440  0965               L1221:
3441                     ; 705     default:
3441                     ; 706         tstate = CAN_TxStatus_Failed;
3443  0965 a6f0          	ld	a,#240
3444  0967 6b01          	ld	(OFST-1,sp),a
3445                     ; 707         break;
3447  0969 2016          	jra	L1721
3448  096b               L1121:
3449                     ; 694     case (0x00): tstate = CAN_TxStatus_Pending;
3451  096b a6f2          	ld	a,#242
3452  096d 6b01          	ld	(OFST-1,sp),a
3453                     ; 695         break;
3455  096f 2010          	jra	L1721
3456  0971               L3121:
3457                     ; 697     case (0x05): tstate = CAN_TxStatus_Failed;
3459  0971 a6f0          	ld	a,#240
3460  0973 6b01          	ld	(OFST-1,sp),a
3461                     ; 698         break;
3463  0975 200a          	jra	L1721
3464  0977               L5121:
3465                     ; 700     case (0x15): tstate = CAN_TxStatus_Ok;
3467  0977 a6f1          	ld	a,#241
3468  0979 6b01          	ld	(OFST-1,sp),a
3469                     ; 701         break;
3471  097b 2004          	jra	L1721
3472  097d               L7121:
3473                     ; 703     case (0x04): tstate = CAN_TxStatus_MailBoxEmpty;
3475  097d a6f5          	ld	a,#245
3476  097f 6b01          	ld	(OFST-1,sp),a
3477                     ; 704         break;
3479  0981               L1721:
3480                     ; 710     return (CAN_TxStatus_TypeDef)tstate;
3482  0981 7b01          	ld	a,(OFST-1,sp)
3485  0983 5b03          	addw	sp,#3
3486  0985 81            	ret
3535                     ; 718 void CAN_CancelTransmit(CAN_TransmitMailBox_TypeDef CAN_TransmitMailbox)
3535                     ; 719 {
3536                     	switch	.text
3537  0986               _CAN_CancelTransmit:
3539  0986 88            	push	a
3540  0987 88            	push	a
3541       00000001      OFST:	set	1
3544                     ; 720     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
3546  0988 cd10a8        	call	_CAN_GetSelectedPage
3548  098b 6b01          	ld	(OFST+0,sp),a
3549                     ; 722     assert_param(IS_CAN_TRANSMITMAILBOX_OK(CAN_TransmitMailbox));
3551  098d 0d02          	tnz	(OFST+1,sp)
3552  098f 270c          	jreq	L252
3553  0991 7b02          	ld	a,(OFST+1,sp)
3554  0993 a101          	cp	a,#1
3555  0995 2706          	jreq	L252
3556  0997 7b02          	ld	a,(OFST+1,sp)
3557  0999 a105          	cp	a,#5
3558  099b 2603          	jrne	L052
3559  099d               L252:
3560  099d 4f            	clr	a
3561  099e 2010          	jra	L452
3562  09a0               L052:
3563  09a0 ae02d2        	ldw	x,#722
3564  09a3 89            	pushw	x
3565  09a4 ae0000        	ldw	x,#0
3566  09a7 89            	pushw	x
3567  09a8 ae0008        	ldw	x,#L103
3568  09ab cd0000        	call	_assert_failed
3570  09ae 5b04          	addw	sp,#4
3571  09b0               L452:
3572                     ; 724     CAN->PSR = (uint8_t)CAN_TransmitMailbox;
3574  09b0 7b02          	ld	a,(OFST+1,sp)
3575  09b2 c75427        	ld	21543,a
3576                     ; 726     CAN->Page.TxMailbox.MCSR |= CAN_MCSR_ABRQ;
3578  09b5 72125428      	bset	21544,#1
3579                     ; 728     CAN_SelectPage(can_page);
3581  09b9 7b01          	ld	a,(OFST+0,sp)
3582  09bb cd10ac        	call	_CAN_SelectPage
3584                     ; 729 }
3587  09be 85            	popw	x
3588  09bf 81            	ret
3611                     ; 736 void CAN_FIFORelease(void)
3611                     ; 737 {
3612                     	switch	.text
3613  09c0               _CAN_FIFORelease:
3617                     ; 739     CAN->RFR = CAN_RFR_RFOM; /*rc-w1*/
3619  09c0 35205424      	mov	21540,#32
3620                     ; 740 }
3623  09c4 81            	ret
3697                     ; 746 CAN_NbrPendingMessage_TypeDef CAN_MessagePending(void)
3697                     ; 747 {
3698                     	switch	.text
3699  09c5               _CAN_MessagePending:
3701  09c5 88            	push	a
3702       00000001      OFST:	set	1
3705                     ; 748     CAN_NbrPendingMessage_TypeDef msgpending = CAN_NbrPendingMessage_0;
3707  09c6 0f01          	clr	(OFST+0,sp)
3708                     ; 749     msgpending = (CAN_NbrPendingMessage_TypeDef)(CAN->RFR & CAN_RFR_FMP01);
3710  09c8 c65424        	ld	a,21540
3711  09cb a403          	and	a,#3
3712  09cd 6b01          	ld	(OFST+0,sp),a
3713                     ; 750     return (CAN_NbrPendingMessage_TypeDef)msgpending;
3715  09cf 7b01          	ld	a,(OFST+0,sp)
3718  09d1 5b01          	addw	sp,#1
3719  09d3 81            	ret
3790                     ; 761 void CAN_Receive(void)
3790                     ; 762 {
3791                     	switch	.text
3792  09d4               _CAN_Receive:
3794  09d4 520d          	subw	sp,#13
3795       0000000d      OFST:	set	13
3798                     ; 763     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
3800  09d6 cd10a8        	call	_CAN_GetSelectedPage
3802  09d9 6b01          	ld	(OFST-12,sp),a
3803                     ; 764     uint32_t temp1 = 0, temp2 = 0, temp3 = 0;
3805  09db 96            	ldw	x,sp
3806  09dc 1c0006        	addw	x,#OFST-7
3807  09df cd0000        	call	c_ltor
3811  09e2 96            	ldw	x,sp
3812  09e3 1c000a        	addw	x,#OFST-3
3813  09e6 cd0000        	call	c_ltor
3817  09e9 96            	ldw	x,sp
3818  09ea 1c0002        	addw	x,#OFST-11
3819  09ed cd0000        	call	c_ltor
3821                     ; 767     CAN->PSR = CAN_Page_RxFifo;
3823  09f0 35075427      	mov	21543,#7
3824                     ; 770     _IDE = (uint8_t)(CAN->Page.RxFIFO.MIDR1 & CAN_Id_Extended);
3826  09f4 c6542a        	ld	a,21546
3827  09f7 a440          	and	a,#64
3828  09f9 b704          	ld	__IDE,a
3829                     ; 771     if (_IDE != CAN_Id_Standard)
3831  09fb 3d04          	tnz	__IDE
3832  09fd 2602          	jrne	L462
3833  09ff 207b          	jp	L1141
3834  0a01               L462:
3835                     ; 773       temp1 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR3) << 8);
3837  0a01 c6542c        	ld	a,21548
3838  0a04 5f            	clrw	x
3839  0a05 97            	ld	xl,a
3840  0a06 90ae0100      	ldw	y,#256
3841  0a0a cd0000        	call	c_umul
3843  0a0d 96            	ldw	x,sp
3844  0a0e 1c0006        	addw	x,#OFST-7
3845  0a11 cd0000        	call	c_rtol
3847                     ; 774       temp2 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR2) << 16);  
3849  0a14 c6542b        	ld	a,21547
3850  0a17 b703          	ld	c_lreg+3,a
3851  0a19 3f02          	clr	c_lreg+2
3852  0a1b 3f01          	clr	c_lreg+1
3853  0a1d 3f00          	clr	c_lreg
3854  0a1f a610          	ld	a,#16
3855  0a21 cd0000        	call	c_llsh
3857  0a24 96            	ldw	x,sp
3858  0a25 1c000a        	addw	x,#OFST-3
3859  0a28 cd0000        	call	c_rtol
3861                     ; 775       temp3 = ((uint32_t)((uint32_t)CAN->Page.RxFIFO.MIDR1 & 0x1F) << 24);
3863  0a2b c6542a        	ld	a,21546
3864  0a2e b703          	ld	c_lreg+3,a
3865  0a30 3f02          	clr	c_lreg+2
3866  0a32 3f01          	clr	c_lreg+1
3867  0a34 3f00          	clr	c_lreg
3868  0a36 b603          	ld	a,c_lreg+3
3869  0a38 a41f          	and	a,#31
3870  0a3a b703          	ld	c_lreg+3,a
3871  0a3c 3f02          	clr	c_lreg+2
3872  0a3e 3f01          	clr	c_lreg+1
3873  0a40 3f00          	clr	c_lreg
3874  0a42 a618          	ld	a,#24
3875  0a44 cd0000        	call	c_llsh
3877  0a47 96            	ldw	x,sp
3878  0a48 1c0002        	addw	x,#OFST-11
3879  0a4b cd0000        	call	c_rtol
3881                     ; 777       _Id = (uint32_t)CAN_EXTID_SIZE & ((CAN->Page.RxFIFO.MIDR4) | temp1 | temp2 | temp3 );
3883  0a4e c6542d        	ld	a,21549
3884  0a51 b703          	ld	c_lreg+3,a
3885  0a53 3f02          	clr	c_lreg+2
3886  0a55 3f01          	clr	c_lreg+1
3887  0a57 3f00          	clr	c_lreg
3888  0a59 96            	ldw	x,sp
3889  0a5a 1c0006        	addw	x,#OFST-7
3890  0a5d cd0000        	call	c_lor
3892  0a60 96            	ldw	x,sp
3893  0a61 1c000a        	addw	x,#OFST-3
3894  0a64 cd0000        	call	c_lor
3896  0a67 96            	ldw	x,sp
3897  0a68 1c0002        	addw	x,#OFST-11
3898  0a6b cd0000        	call	c_lor
3900  0a6e b600          	ld	a,c_lreg
3901  0a70 a41f          	and	a,#31
3902  0a72 b700          	ld	c_lreg,a
3903  0a74 ae0000        	ldw	x,#__Id
3904  0a77 cd0000        	call	c_rtol
3907  0a7a 204c          	jra	L3141
3908  0a7c               L1141:
3909                     ; 781         temp1 = (uint16_t)((uint16_t)((uint16_t)((uint16_t)CAN->Page.RxFIFO.MIDR1 & 0x1F) << 6));
3911  0a7c c6542a        	ld	a,21546
3912  0a7f 5f            	clrw	x
3913  0a80 a41f          	and	a,#31
3914  0a82 5f            	clrw	x
3915  0a83 02            	rlwa	x,a
3916  0a84 58            	sllw	x
3917  0a85 58            	sllw	x
3918  0a86 58            	sllw	x
3919  0a87 58            	sllw	x
3920  0a88 58            	sllw	x
3921  0a89 58            	sllw	x
3922  0a8a cd0000        	call	c_uitolx
3924  0a8d 96            	ldw	x,sp
3925  0a8e 1c0006        	addw	x,#OFST-7
3926  0a91 cd0000        	call	c_rtol
3928                     ; 782         temp2 = (uint16_t)((uint16_t)((uint16_t)CAN->Page.RxFIFO.MIDR2 >> 2)&0x3F);
3930  0a94 c6542b        	ld	a,21547
3931  0a97 5f            	clrw	x
3932  0a98 97            	ld	xl,a
3933  0a99 54            	srlw	x
3934  0a9a 54            	srlw	x
3935  0a9b 9f            	ld	a,xl
3936  0a9c 5f            	clrw	x
3937  0a9d a43f          	and	a,#63
3938  0a9f 5f            	clrw	x
3939  0aa0 cd0000        	call	c_uitol
3941  0aa3 96            	ldw	x,sp
3942  0aa4 1c000a        	addw	x,#OFST-3
3943  0aa7 cd0000        	call	c_rtol
3945                     ; 784       _Id = (uint16_t)CAN_STDID_SIZE & (temp1 | temp2 );
3947  0aaa 96            	ldw	x,sp
3948  0aab 1c0006        	addw	x,#OFST-7
3949  0aae cd0000        	call	c_ltor
3951  0ab1 96            	ldw	x,sp
3952  0ab2 1c000a        	addw	x,#OFST-3
3953  0ab5 cd0000        	call	c_lor
3955  0ab8 b602          	ld	a,c_lreg+2
3956  0aba a407          	and	a,#7
3957  0abc b702          	ld	c_lreg+2,a
3958  0abe 3f01          	clr	c_lreg+1
3959  0ac0 3f00          	clr	c_lreg
3960  0ac2 ae0000        	ldw	x,#__Id
3961  0ac5 cd0000        	call	c_rtol
3963  0ac8               L3141:
3964                     ; 787     _RTR = (uint8_t)((uint8_t)0x20 & CAN->Page.RxFIFO.MIDR1);
3966  0ac8 c6542a        	ld	a,21546
3967  0acb a420          	and	a,#32
3968  0acd b705          	ld	__RTR,a
3969                     ; 790     _DLC = (uint8_t)(CAN->Page.RxFIFO.MDLCR & (uint8_t)0x0F);
3971  0acf c65429        	ld	a,21545
3972  0ad2 a40f          	and	a,#15
3973  0ad4 b706          	ld	__DLC,a
3974                     ; 793     _FMI = CAN->Page.RxFIFO.MFMI;
3976  0ad6 555428000f    	mov	__FMI,21544
3977                     ; 796     _Data[0] = CAN->Page.RxFIFO.MDAR1;
3979  0adb 55542e0007    	mov	__Data,21550
3980                     ; 797     _Data[1] = CAN->Page.RxFIFO.MDAR2;
3982  0ae0 55542f0008    	mov	__Data+1,21551
3983                     ; 798     _Data[2] = CAN->Page.RxFIFO.MDAR3;
3985  0ae5 5554300009    	mov	__Data+2,21552
3986                     ; 799     _Data[3] = CAN->Page.RxFIFO.MDAR4;
3988  0aea 555431000a    	mov	__Data+3,21553
3989                     ; 800     _Data[4] = CAN->Page.RxFIFO.MDAR5;
3991  0aef 555432000b    	mov	__Data+4,21554
3992                     ; 801     _Data[5] = CAN->Page.RxFIFO.MDAR6;
3994  0af4 555433000c    	mov	__Data+5,21555
3995                     ; 802     _Data[6] = CAN->Page.RxFIFO.MDAR7;
3997  0af9 555434000d    	mov	__Data+6,21556
3998                     ; 803     _Data[7] = CAN->Page.RxFIFO.MDAR8;
4000  0afe 555435000e    	mov	__Data+7,21557
4001                     ; 806     CAN_FIFORelease();
4003  0b03 cd09c0        	call	_CAN_FIFORelease
4005                     ; 808     CAN_SelectPage(can_page);
4007  0b06 7b01          	ld	a,(OFST-12,sp)
4008  0b08 cd10ac        	call	_CAN_SelectPage
4010                     ; 809 }
4013  0b0b 5b0d          	addw	sp,#13
4014  0b0d 81            	ret
4038                     ; 819 uint32_t CAN_GetReceivedId(void)
4038                     ; 820 {
4039                     	switch	.text
4040  0b0e               _CAN_GetReceivedId:
4044                     ; 821     return (_Id);
4046  0b0e ae0000        	ldw	x,#__Id
4047  0b11 cd0000        	call	c_ltor
4051  0b14 81            	ret
4076                     ; 832 CAN_Id_TypeDef CAN_GetReceivedIDE(void)
4076                     ; 833 {
4077                     	switch	.text
4078  0b15               _CAN_GetReceivedIDE:
4082                     ; 834     return (CAN_Id_TypeDef)(_IDE);
4084  0b15 b604          	ld	a,__IDE
4087  0b17 81            	ret
4112                     ; 845 CAN_RTR_TypeDef CAN_GetReceivedRTR(void)
4112                     ; 846 {
4113                     	switch	.text
4114  0b18               _CAN_GetReceivedRTR:
4118                     ; 847     return (CAN_RTR_TypeDef)(_RTR);
4120  0b18 b605          	ld	a,__RTR
4123  0b1a 81            	ret
4147                     ; 858 uint8_t CAN_GetReceivedDLC(void)
4147                     ; 859 {
4148                     	switch	.text
4149  0b1b               _CAN_GetReceivedDLC:
4153                     ; 860     return (_DLC);
4155  0b1b b606          	ld	a,__DLC
4158  0b1d 81            	ret
4195                     ; 872 uint8_t CAN_GetReceivedData(uint8_t CAN_DataIndex)
4195                     ; 873 {
4196                     	switch	.text
4197  0b1e               _CAN_GetReceivedData:
4199  0b1e 88            	push	a
4200       00000000      OFST:	set	0
4203                     ; 874     assert_param(IS_CAN_DLC_OK(CAN_DataIndex));
4205  0b1f a109          	cp	a,#9
4206  0b21 2403          	jruge	L003
4207  0b23 4f            	clr	a
4208  0b24 2010          	jra	L203
4209  0b26               L003:
4210  0b26 ae036a        	ldw	x,#874
4211  0b29 89            	pushw	x
4212  0b2a ae0000        	ldw	x,#0
4213  0b2d 89            	pushw	x
4214  0b2e ae0008        	ldw	x,#L103
4215  0b31 cd0000        	call	_assert_failed
4217  0b34 5b04          	addw	sp,#4
4218  0b36               L203:
4219                     ; 875     return (_Data[CAN_DataIndex]);
4221  0b36 7b01          	ld	a,(OFST+1,sp)
4222  0b38 5f            	clrw	x
4223  0b39 97            	ld	xl,a
4224  0b3a e607          	ld	a,(__Data,x)
4227  0b3c 5b01          	addw	sp,#1
4228  0b3e 81            	ret
4252                     ; 886 uint8_t CAN_GetReceivedFMI(void)
4252                     ; 887 {
4253                     	switch	.text
4254  0b3f               _CAN_GetReceivedFMI:
4258                     ; 888     return (_FMI);
4260  0b3f b60f          	ld	a,__FMI
4263  0b41 81            	ret
4310                     ; 896 uint16_t CAN_GetMessageTimeStamp(void)
4310                     ; 897 {
4311                     	switch	.text
4312  0b42               _CAN_GetMessageTimeStamp:
4314  0b42 5203          	subw	sp,#3
4315       00000003      OFST:	set	3
4318                     ; 898     uint16_t timestamp = 0;
4320  0b44 1e02          	ldw	x,(OFST-1,sp)
4321                     ; 899     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
4323  0b46 cd10a8        	call	_CAN_GetSelectedPage
4325  0b49 6b01          	ld	(OFST-2,sp),a
4326                     ; 902     CAN->PSR = CAN_Page_RxFifo;
4328  0b4b 35075427      	mov	21543,#7
4329                     ; 904     timestamp = CAN->Page.RxFIFO.MTSRL;
4331  0b4f c65436        	ld	a,21558
4332  0b52 5f            	clrw	x
4333  0b53 97            	ld	xl,a
4334  0b54 1f02          	ldw	(OFST-1,sp),x
4335                     ; 905     timestamp |= (uint16_t)(((uint16_t)CAN->Page.RxFIFO.MTSRH)<<8);
4337  0b56 c65437        	ld	a,21559
4338  0b59 5f            	clrw	x
4339  0b5a 97            	ld	xl,a
4340  0b5b 4f            	clr	a
4341  0b5c 02            	rlwa	x,a
4342  0b5d 01            	rrwa	x,a
4343  0b5e 1a03          	or	a,(OFST+0,sp)
4344  0b60 01            	rrwa	x,a
4345  0b61 1a02          	or	a,(OFST-1,sp)
4346  0b63 01            	rrwa	x,a
4347  0b64 1f02          	ldw	(OFST-1,sp),x
4348                     ; 908     CAN_SelectPage(can_page);
4350  0b66 7b01          	ld	a,(OFST-2,sp)
4351  0b68 cd10ac        	call	_CAN_SelectPage
4353                     ; 910     return (uint16_t)(timestamp);
4355  0b6b 1e02          	ldw	x,(OFST-1,sp)
4358  0b6d 5b03          	addw	sp,#3
4359  0b6f 81            	ret
4415                     ; 918 CAN_Sleep_TypeDef CAN_Sleep(void)
4415                     ; 919 {
4416                     	switch	.text
4417  0b70               _CAN_Sleep:
4419  0b70 88            	push	a
4420       00000001      OFST:	set	1
4423                     ; 921     CAN_Sleep_TypeDef sleepstatus = CAN_Sleep_Failed;
4425  0b71 0f01          	clr	(OFST+0,sp)
4426                     ; 924     CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_INRQ)) | CAN_MCR_SLEEP);
4428  0b73 c65420        	ld	a,21536
4429  0b76 a4fe          	and	a,#254
4430  0b78 aa02          	or	a,#2
4431  0b7a c75420        	ld	21536,a
4432                     ; 927     if ((CAN->MSR & (CAN_MSR_SLAK|CAN_MSR_INAK)) == CAN_MSR_SLAK)
4434  0b7d c65421        	ld	a,21537
4435  0b80 a403          	and	a,#3
4436  0b82 a102          	cp	a,#2
4437  0b84 2604          	jrne	L3551
4438                     ; 930         sleepstatus =  CAN_Sleep_Ok;
4440  0b86 a601          	ld	a,#1
4441  0b88 6b01          	ld	(OFST+0,sp),a
4442  0b8a               L3551:
4443                     ; 934     return (CAN_Sleep_TypeDef) sleepstatus;
4445  0b8a 7b01          	ld	a,(OFST+0,sp)
4448  0b8c 5b01          	addw	sp,#1
4449  0b8e 81            	ret
4505                     ; 942 CAN_WakeUp_TypeDef CAN_WakeUp(void)
4505                     ; 943 {
4506                     	switch	.text
4507  0b8f               _CAN_WakeUp:
4509  0b8f 88            	push	a
4510       00000001      OFST:	set	1
4513                     ; 944     CAN_WakeUp_TypeDef wakeupstatus = CAN_WakeUp_Failed;
4515  0b90 0f01          	clr	(OFST+0,sp)
4516                     ; 947     CAN->MCR &= (uint8_t)(~CAN_MCR_SLEEP);
4518  0b92 72135420      	bres	21536,#1
4519                     ; 950     if ((CAN->MSR & CAN_MSR_SLAK) != CAN_MSR_SLAK)
4521  0b96 c65421        	ld	a,21537
4522  0b99 a402          	and	a,#2
4523  0b9b a102          	cp	a,#2
4524  0b9d 2704          	jreq	L3061
4525                     ; 953         wakeupstatus = CAN_WakeUp_Ok;
4527  0b9f a601          	ld	a,#1
4528  0ba1 6b01          	ld	(OFST+0,sp),a
4529  0ba3               L3061:
4530                     ; 957     return (CAN_WakeUp_TypeDef)wakeupstatus;
4532  0ba3 7b01          	ld	a,(OFST+0,sp)
4535  0ba5 5b01          	addw	sp,#1
4536  0ba7 81            	ret
4644                     ; 969 CAN_ModeStatus_TypeDef CAN_OperatingModeRequest(CAN_OperatingMode_TypeDef CAN_OperatingMode)
4644                     ; 970 {
4645                     	switch	.text
4646  0ba8               _CAN_OperatingModeRequest:
4648  0ba8 88            	push	a
4649  0ba9 5203          	subw	sp,#3
4650       00000003      OFST:	set	3
4653                     ; 972     uint16_t timeout = CAN_ACKNOWLEDGE_TIMEOUT;
4655  0bab aeffff        	ldw	x,#65535
4656  0bae 1f02          	ldw	(OFST-1,sp),x
4657                     ; 973     uint8_t modestatus = 0;
4659  0bb0 7b01          	ld	a,(OFST-2,sp)
4660  0bb2 97            	ld	xl,a
4661                     ; 975     assert_param(IS_CAN_OPERATINGMODE_OK(CAN_OperatingMode));
4663  0bb3 0d04          	tnz	(OFST+1,sp)
4664  0bb5 270c          	jreq	L023
4665  0bb7 7b04          	ld	a,(OFST+1,sp)
4666  0bb9 a101          	cp	a,#1
4667  0bbb 2706          	jreq	L023
4668  0bbd 7b04          	ld	a,(OFST+1,sp)
4669  0bbf a102          	cp	a,#2
4670  0bc1 2603          	jrne	L613
4671  0bc3               L023:
4672  0bc3 4f            	clr	a
4673  0bc4 2010          	jra	L223
4674  0bc6               L613:
4675  0bc6 ae03cf        	ldw	x,#975
4676  0bc9 89            	pushw	x
4677  0bca ae0000        	ldw	x,#0
4678  0bcd 89            	pushw	x
4679  0bce ae0008        	ldw	x,#L103
4680  0bd1 cd0000        	call	_assert_failed
4682  0bd4 5b04          	addw	sp,#4
4683  0bd6               L223:
4684                     ; 977     if (CAN_OperatingMode == CAN_OperatingMode_Initialization)
4686  0bd6 0d04          	tnz	(OFST+1,sp)
4687  0bd8 2633          	jrne	L5561
4688                     ; 980         CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_SLEEP)) | CAN_MCR_INRQ);
4690  0bda c65420        	ld	a,21536
4691  0bdd a4fd          	and	a,#253
4692  0bdf aa01          	or	a,#1
4693  0be1 c75420        	ld	21536,a
4695  0be4 2007          	jra	L3661
4696  0be6               L7561:
4697                     ; 985             timeout--;
4699  0be6 1e02          	ldw	x,(OFST-1,sp)
4700  0be8 1d0001        	subw	x,#1
4701  0beb 1f02          	ldw	(OFST-1,sp),x
4702  0bed               L3661:
4703                     ; 983         while (((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_INAK) && (timeout != 0))
4705  0bed c65421        	ld	a,21537
4706  0bf0 a403          	and	a,#3
4707  0bf2 a101          	cp	a,#1
4708  0bf4 2704          	jreq	L7661
4710  0bf6 1e02          	ldw	x,(OFST-1,sp)
4711  0bf8 26ec          	jrne	L7561
4712  0bfa               L7661:
4713                     ; 987         if ((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_INAK)
4715  0bfa c65421        	ld	a,21537
4716  0bfd a403          	and	a,#3
4717  0bff a101          	cp	a,#1
4718  0c01 2704          	jreq	L1761
4719                     ; 989           modestatus = CAN_ModeStatus_Failed;
4721  0c03 0f01          	clr	(OFST-2,sp)
4723  0c05 2074          	jra	L5761
4724  0c07               L1761:
4725                     ; 993           modestatus = CAN_ModeStatus_Success;  
4727  0c07 a601          	ld	a,#1
4728  0c09 6b01          	ld	(OFST-2,sp),a
4729  0c0b 206e          	jra	L5761
4730  0c0d               L5561:
4731                     ; 997     else  if (CAN_OperatingMode == CAN_OperatingMode_Normal)
4733  0c0d 7b04          	ld	a,(OFST+1,sp)
4734  0c0f a101          	cp	a,#1
4735  0c11 262d          	jrne	L7761
4736                     ; 1000         CAN->MCR &= (uint8_t)(~(CAN_MCR_SLEEP|CAN_MCR_INRQ));
4738  0c13 c65420        	ld	a,21536
4739  0c16 a4fc          	and	a,#252
4740  0c18 c75420        	ld	21536,a
4742  0c1b 2007          	jra	L3071
4743  0c1d               L1071:
4744                     ; 1005             timeout--;
4746  0c1d 1e02          	ldw	x,(OFST-1,sp)
4747  0c1f 1d0001        	subw	x,#1
4748  0c22 1f02          	ldw	(OFST-1,sp),x
4749  0c24               L3071:
4750                     ; 1003         while (((CAN->MSR & CAN_MODE_MASK) != 0) && (timeout!=0))
4752  0c24 c65421        	ld	a,21537
4753  0c27 a503          	bcp	a,#3
4754  0c29 2704          	jreq	L7071
4756  0c2b 1e02          	ldw	x,(OFST-1,sp)
4757  0c2d 26ee          	jrne	L1071
4758  0c2f               L7071:
4759                     ; 1007         if ((CAN->MSR & CAN_MODE_MASK) != 0)
4761  0c2f c65421        	ld	a,21537
4762  0c32 a503          	bcp	a,#3
4763  0c34 2704          	jreq	L1171
4764                     ; 1009           modestatus = CAN_ModeStatus_Failed;
4766  0c36 0f01          	clr	(OFST-2,sp)
4768  0c38 2041          	jra	L5761
4769  0c3a               L1171:
4770                     ; 1013           modestatus = CAN_ModeStatus_Success;  
4772  0c3a a601          	ld	a,#1
4773  0c3c 6b01          	ld	(OFST-2,sp),a
4774  0c3e 203b          	jra	L5761
4775  0c40               L7761:
4776                     ; 1016     else  if (CAN_OperatingMode == CAN_OperatingMode_Sleep)
4778  0c40 7b04          	ld	a,(OFST+1,sp)
4779  0c42 a102          	cp	a,#2
4780  0c44 2633          	jrne	L7171
4781                     ; 1019         CAN->MCR = (uint8_t)((uint8_t)(CAN->MCR & (uint8_t)(~CAN_MCR_INRQ)) | CAN_MCR_SLEEP);
4783  0c46 c65420        	ld	a,21536
4784  0c49 a4fe          	and	a,#254
4785  0c4b aa02          	or	a,#2
4786  0c4d c75420        	ld	21536,a
4788  0c50 2007          	jra	L5271
4789  0c52               L1271:
4790                     ; 1024             timeout--;
4792  0c52 1e02          	ldw	x,(OFST-1,sp)
4793  0c54 1d0001        	subw	x,#1
4794  0c57 1f02          	ldw	(OFST-1,sp),x
4795  0c59               L5271:
4796                     ; 1022         while (((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK) && (timeout!=0))
4798  0c59 c65421        	ld	a,21537
4799  0c5c a403          	and	a,#3
4800  0c5e a102          	cp	a,#2
4801  0c60 2704          	jreq	L1371
4803  0c62 1e02          	ldw	x,(OFST-1,sp)
4804  0c64 26ec          	jrne	L1271
4805  0c66               L1371:
4806                     ; 1026         if ((CAN->MSR & CAN_MODE_MASK) != CAN_MSR_SLAK)
4808  0c66 c65421        	ld	a,21537
4809  0c69 a403          	and	a,#3
4810  0c6b a102          	cp	a,#2
4811  0c6d 2704          	jreq	L3371
4812                     ; 1028            modestatus = CAN_ModeStatus_Failed;  
4814  0c6f 0f01          	clr	(OFST-2,sp)
4816  0c71 2008          	jra	L5761
4817  0c73               L3371:
4818                     ; 1032            modestatus = CAN_ModeStatus_Success;  
4820  0c73 a601          	ld	a,#1
4821  0c75 6b01          	ld	(OFST-2,sp),a
4822  0c77 2002          	jra	L5761
4823  0c79               L7171:
4824                     ; 1037          modestatus = CAN_ModeStatus_Failed;
4826  0c79 0f01          	clr	(OFST-2,sp)
4827  0c7b               L5761:
4828                     ; 1039   return (CAN_ModeStatus_TypeDef)(modestatus);
4830  0c7b 7b01          	ld	a,(OFST-2,sp)
4833  0c7d 5b04          	addw	sp,#4
4834  0c7f 81            	ret
4953                     ; 1047 CAN_ErrorCode_TypeDef CAN_GetLastErrorCode(void)
4953                     ; 1048 {
4954                     	switch	.text
4955  0c80               _CAN_GetLastErrorCode:
4957  0c80 89            	pushw	x
4958       00000002      OFST:	set	2
4961                     ; 1049     CAN_ErrorCode_TypeDef errcode = CAN_ErrorCode_NoErr;
4963  0c81 7b02          	ld	a,(OFST+0,sp)
4964  0c83 97            	ld	xl,a
4965                     ; 1050     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
4967  0c84 cd10a8        	call	_CAN_GetSelectedPage
4969  0c87 6b01          	ld	(OFST-1,sp),a
4970                     ; 1052     CAN->PSR = CAN_Page_Config;
4972  0c89 35065427      	mov	21543,#6
4973                     ; 1053     errcode = (CAN_ErrorCode_TypeDef)((CAN->Page.Config.ESR) & (CAN_ESR_LEC));
4975  0c8d c65428        	ld	a,21544
4976  0c90 a470          	and	a,#112
4977  0c92 6b02          	ld	(OFST+0,sp),a
4978                     ; 1056     CAN_SelectPage(can_page);
4980  0c94 7b01          	ld	a,(OFST-1,sp)
4981  0c96 cd10ac        	call	_CAN_SelectPage
4983                     ; 1058     return (CAN_ErrorCode_TypeDef)(errcode);
4985  0c99 7b02          	ld	a,(OFST+0,sp)
4988  0c9b 85            	popw	x
4989  0c9c 81            	ret
5120                     ; 1073 void CAN_ClearFlag(CAN_FLAG_TypeDef CAN_Flag)
5120                     ; 1074 {
5121                     	switch	.text
5122  0c9d               _CAN_ClearFlag:
5124  0c9d 89            	pushw	x
5125  0c9e 88            	push	a
5126       00000001      OFST:	set	1
5129                     ; 1075     CAN_Page_TypeDef can_page = (CAN_Page_TypeDef)0;
5131  0c9f 0f01          	clr	(OFST+0,sp)
5132                     ; 1077     assert_param(IS_CAN_FLAG_CLEAR_OK(CAN_Flag));
5134  0ca1 a33401        	cpw	x,#13313
5135  0ca4 271e          	jreq	L233
5136  0ca6 a33402        	cpw	x,#13314
5137  0ca9 2719          	jreq	L233
5138  0cab a33404        	cpw	x,#13316
5139  0cae 2714          	jreq	L233
5140  0cb0 a33208        	cpw	x,#12808
5141  0cb3 270f          	jreq	L233
5142  0cb5 a33210        	cpw	x,#12816
5143  0cb8 270a          	jreq	L233
5144  0cba a33108        	cpw	x,#12552
5145  0cbd 2705          	jreq	L233
5146  0cbf a33070        	cpw	x,#12400
5147  0cc2 2603          	jrne	L033
5148  0cc4               L233:
5149  0cc4 4f            	clr	a
5150  0cc5 2010          	jra	L433
5151  0cc7               L033:
5152  0cc7 ae0435        	ldw	x,#1077
5153  0cca 89            	pushw	x
5154  0ccb ae0000        	ldw	x,#0
5155  0cce 89            	pushw	x
5156  0ccf ae0008        	ldw	x,#L103
5157  0cd2 cd0000        	call	_assert_failed
5159  0cd5 5b04          	addw	sp,#4
5160  0cd7               L433:
5161                     ; 1078     if (((uint16_t)CAN_Flag & 0x0700)!= RESET)
5163  0cd7 7b02          	ld	a,(OFST+1,sp)
5164  0cd9 a507          	bcp	a,#7
5165  0cdb 2731          	jreq	L3602
5166                     ; 1080         if (((uint16_t)CAN_Flag & 0x020B)!= RESET)
5168  0cdd 1e02          	ldw	x,(OFST+1,sp)
5169  0cdf 01            	rrwa	x,a
5170  0ce0 a40b          	and	a,#11
5171  0ce2 01            	rrwa	x,a
5172  0ce3 a402          	and	a,#2
5173  0ce5 01            	rrwa	x,a
5174  0ce6 a30000        	cpw	x,#0
5175  0ce9 2707          	jreq	L5602
5176                     ; 1083             CAN->RFR = (uint8_t)(CAN_Flag);
5178  0ceb 7b03          	ld	a,(OFST+2,sp)
5179  0ced c75424        	ld	21540,a
5181  0cf0 202e          	jra	L5702
5182  0cf2               L5602:
5183                     ; 1085         else if (((uint16_t)CAN_Flag & 0x0403)!= RESET)
5185  0cf2 1e02          	ldw	x,(OFST+1,sp)
5186  0cf4 01            	rrwa	x,a
5187  0cf5 a403          	and	a,#3
5188  0cf7 01            	rrwa	x,a
5189  0cf8 a404          	and	a,#4
5190  0cfa 01            	rrwa	x,a
5191  0cfb a30000        	cpw	x,#0
5192  0cfe 2707          	jreq	L1702
5193                     ; 1088             CAN->TSR = (uint8_t)(CAN_Flag);
5195  0d00 7b03          	ld	a,(OFST+2,sp)
5196  0d02 c75422        	ld	21538,a
5198  0d05 2019          	jra	L5702
5199  0d07               L1702:
5200                     ; 1093             CAN->MSR = (uint8_t)(CAN_Flag);
5202  0d07 7b03          	ld	a,(OFST+2,sp)
5203  0d09 c75421        	ld	21537,a
5204  0d0c 2012          	jra	L5702
5205  0d0e               L3602:
5206                     ; 1099         can_page = CAN_GetSelectedPage();
5208  0d0e cd10a8        	call	_CAN_GetSelectedPage
5210  0d11 6b01          	ld	(OFST+0,sp),a
5211                     ; 1102         CAN->PSR = CAN_Page_Config;
5213  0d13 35065427      	mov	21543,#6
5214                     ; 1103         CAN->Page.Config.ESR = (uint8_t)RESET;
5216  0d17 725f5428      	clr	21544
5217                     ; 1106         CAN_SelectPage(can_page);
5219  0d1b 7b01          	ld	a,(OFST+0,sp)
5220  0d1d cd10ac        	call	_CAN_SelectPage
5222  0d20               L5702:
5223                     ; 1108 }
5226  0d20 5b03          	addw	sp,#3
5227  0d22 81            	ret
5306                     ; 1115 FlagStatus CAN_GetFlagStatus(CAN_FLAG_TypeDef CAN_Flag)
5306                     ; 1116 {
5307                     	switch	.text
5308  0d23               _CAN_GetFlagStatus:
5310  0d23 89            	pushw	x
5311  0d24 89            	pushw	x
5312       00000002      OFST:	set	2
5315                     ; 1117     FlagStatus bitstatus = RESET;
5317  0d25 7b02          	ld	a,(OFST+0,sp)
5318  0d27 97            	ld	xl,a
5319                     ; 1118     CAN_Page_TypeDef can_page = (CAN_Page_TypeDef)0;
5321  0d28 7b01          	ld	a,(OFST-1,sp)
5322  0d2a 97            	ld	xl,a
5323                     ; 1121     assert_param(IS_CAN_FLAG_STATUS_OK(CAN_Flag));
5325  0d2b 1e03          	ldw	x,(OFST+1,sp)
5326  0d2d a33401        	cpw	x,#13313
5327  0d30 2746          	jreq	L243
5328  0d32 1e03          	ldw	x,(OFST+1,sp)
5329  0d34 a33402        	cpw	x,#13314
5330  0d37 273f          	jreq	L243
5331  0d39 1e03          	ldw	x,(OFST+1,sp)
5332  0d3b a33404        	cpw	x,#13316
5333  0d3e 2738          	jreq	L243
5334  0d40 1e03          	ldw	x,(OFST+1,sp)
5335  0d42 a31203        	cpw	x,#4611
5336  0d45 2731          	jreq	L243
5337  0d47 1e03          	ldw	x,(OFST+1,sp)
5338  0d49 a33208        	cpw	x,#12808
5339  0d4c 272a          	jreq	L243
5340  0d4e 1e03          	ldw	x,(OFST+1,sp)
5341  0d50 a33210        	cpw	x,#12816
5342  0d53 2723          	jreq	L243
5343  0d55 1e03          	ldw	x,(OFST+1,sp)
5344  0d57 a33108        	cpw	x,#12552
5345  0d5a 271c          	jreq	L243
5346  0d5c 1e03          	ldw	x,(OFST+1,sp)
5347  0d5e a31001        	cpw	x,#4097
5348  0d61 2715          	jreq	L243
5349  0d63 1e03          	ldw	x,(OFST+1,sp)
5350  0d65 a31002        	cpw	x,#4098
5351  0d68 270e          	jreq	L243
5352  0d6a 1e03          	ldw	x,(OFST+1,sp)
5353  0d6c a31004        	cpw	x,#4100
5354  0d6f 2707          	jreq	L243
5355  0d71 1e03          	ldw	x,(OFST+1,sp)
5356  0d73 a33070        	cpw	x,#12400
5357  0d76 2603          	jrne	L043
5358  0d78               L243:
5359  0d78 4f            	clr	a
5360  0d79 2010          	jra	L443
5361  0d7b               L043:
5362  0d7b ae0461        	ldw	x,#1121
5363  0d7e 89            	pushw	x
5364  0d7f ae0000        	ldw	x,#0
5365  0d82 89            	pushw	x
5366  0d83 ae0008        	ldw	x,#L103
5367  0d86 cd0000        	call	_assert_failed
5369  0d89 5b04          	addw	sp,#4
5370  0d8b               L443:
5371                     ; 1123     if (((uint16_t)CAN_Flag & 0x0700)!= RESET)
5373  0d8b 7b03          	ld	a,(OFST+1,sp)
5374  0d8d a507          	bcp	a,#7
5375  0d8f 274f          	jreq	L5312
5376                     ; 1125         if (((uint16_t)CAN_Flag & 0x020B)!= RESET)
5378  0d91 1e03          	ldw	x,(OFST+1,sp)
5379  0d93 01            	rrwa	x,a
5380  0d94 a40b          	and	a,#11
5381  0d96 01            	rrwa	x,a
5382  0d97 a402          	and	a,#2
5383  0d99 01            	rrwa	x,a
5384  0d9a a30000        	cpw	x,#0
5385  0d9d 2711          	jreq	L7312
5386                     ; 1128             if ((CAN->RFR & (uint16_t)CAN_Flag )!= RESET)
5388  0d9f c65424        	ld	a,21540
5389  0da2 1404          	and	a,(OFST+2,sp)
5390  0da4 2706          	jreq	L1412
5391                     ; 1131                 bitstatus = SET;
5393  0da6 a601          	ld	a,#1
5394  0da8 6b02          	ld	(OFST+0,sp),a
5396  0daa 2051          	jra	L3612
5397  0dac               L1412:
5398                     ; 1136                 bitstatus = RESET;
5400  0dac 0f02          	clr	(OFST+0,sp)
5401  0dae 204d          	jra	L3612
5402  0db0               L7312:
5403                     ; 1140         else if (((uint16_t)CAN_Flag & 0x0403)!= RESET)
5405  0db0 1e03          	ldw	x,(OFST+1,sp)
5406  0db2 01            	rrwa	x,a
5407  0db3 a403          	and	a,#3
5408  0db5 01            	rrwa	x,a
5409  0db6 a404          	and	a,#4
5410  0db8 01            	rrwa	x,a
5411  0db9 a30000        	cpw	x,#0
5412  0dbc 2711          	jreq	L7412
5413                     ; 1143             if ((CAN->TSR & (uint16_t)CAN_Flag )!= RESET)
5415  0dbe c65422        	ld	a,21538
5416  0dc1 1404          	and	a,(OFST+2,sp)
5417  0dc3 2706          	jreq	L1512
5418                     ; 1146                 bitstatus = SET;
5420  0dc5 a601          	ld	a,#1
5421  0dc7 6b02          	ld	(OFST+0,sp),a
5423  0dc9 2032          	jra	L3612
5424  0dcb               L1512:
5425                     ; 1151                 bitstatus = RESET;
5427  0dcb 0f02          	clr	(OFST+0,sp)
5428  0dcd 202e          	jra	L3612
5429  0dcf               L7412:
5430                     ; 1157             if ((CAN->MSR & (uint16_t)CAN_Flag )!= RESET)
5432  0dcf c65421        	ld	a,21537
5433  0dd2 1404          	and	a,(OFST+2,sp)
5434  0dd4 2706          	jreq	L7512
5435                     ; 1160                 bitstatus = SET;
5437  0dd6 a601          	ld	a,#1
5438  0dd8 6b02          	ld	(OFST+0,sp),a
5440  0dda 2021          	jra	L3612
5441  0ddc               L7512:
5442                     ; 1165                 bitstatus = RESET;
5444  0ddc 0f02          	clr	(OFST+0,sp)
5445  0dde 201d          	jra	L3612
5446  0de0               L5312:
5447                     ; 1172         can_page = CAN_GetSelectedPage();
5449  0de0 cd10a8        	call	_CAN_GetSelectedPage
5451  0de3 6b01          	ld	(OFST-1,sp),a
5452                     ; 1174         CAN->PSR = CAN_Page_Config;
5454  0de5 35065427      	mov	21543,#6
5455                     ; 1175         if ((CAN->Page.Config.ESR & (uint16_t)CAN_Flag) != RESET)
5457  0de9 c65428        	ld	a,21544
5458  0dec 1404          	and	a,(OFST+2,sp)
5459  0dee 2706          	jreq	L5612
5460                     ; 1178             bitstatus = SET;
5462  0df0 a601          	ld	a,#1
5463  0df2 6b02          	ld	(OFST+0,sp),a
5465  0df4 2002          	jra	L7612
5466  0df6               L5612:
5467                     ; 1183             bitstatus = RESET;
5469  0df6 0f02          	clr	(OFST+0,sp)
5470  0df8               L7612:
5471                     ; 1186         CAN_SelectPage(can_page);
5473  0df8 7b01          	ld	a,(OFST-1,sp)
5474  0dfa cd10ac        	call	_CAN_SelectPage
5476  0dfd               L3612:
5477                     ; 1191     return  (FlagStatus)bitstatus;
5479  0dfd 7b02          	ld	a,(OFST+0,sp)
5482  0dff 5b04          	addw	sp,#4
5483  0e01 81            	ret
5543                     ; 1199 ITStatus CAN_GetITStatus(CAN_IT_TypeDef CAN_IT)
5543                     ; 1200 {
5544                     	switch	.text
5545  0e02               _CAN_GetITStatus:
5547  0e02 89            	pushw	x
5548  0e03 89            	pushw	x
5549       00000002      OFST:	set	2
5552                     ; 1201     ITStatus pendingbitstatus = RESET;
5554  0e04 0f02          	clr	(OFST+0,sp)
5555                     ; 1202     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
5557  0e06 cd10a8        	call	_CAN_GetSelectedPage
5559  0e09 6b01          	ld	(OFST-1,sp),a
5560                     ; 1205     assert_param(IS_CAN_IT_STATUS_OK(CAN_IT));
5562  0e0b 1e03          	ldw	x,(OFST+1,sp)
5563  0e0d a30001        	cpw	x,#1
5564  0e10 273f          	jreq	L253
5565  0e12 1e03          	ldw	x,(OFST+1,sp)
5566  0e14 a30002        	cpw	x,#2
5567  0e17 2738          	jreq	L253
5568  0e19 1e03          	ldw	x,(OFST+1,sp)
5569  0e1b a30004        	cpw	x,#4
5570  0e1e 2731          	jreq	L253
5571  0e20 1e03          	ldw	x,(OFST+1,sp)
5572  0e22 a30008        	cpw	x,#8
5573  0e25 272a          	jreq	L253
5574  0e27 1e03          	ldw	x,(OFST+1,sp)
5575  0e29 a30080        	cpw	x,#128
5576  0e2c 2723          	jreq	L253
5577  0e2e 1e03          	ldw	x,(OFST+1,sp)
5578  0e30 a34000        	cpw	x,#16384
5579  0e33 271c          	jreq	L253
5580  0e35 1e03          	ldw	x,(OFST+1,sp)
5581  0e37 a30100        	cpw	x,#256
5582  0e3a 2715          	jreq	L253
5583  0e3c 1e03          	ldw	x,(OFST+1,sp)
5584  0e3e a30200        	cpw	x,#512
5585  0e41 270e          	jreq	L253
5586  0e43 1e03          	ldw	x,(OFST+1,sp)
5587  0e45 a30400        	cpw	x,#1024
5588  0e48 2707          	jreq	L253
5589  0e4a 1e03          	ldw	x,(OFST+1,sp)
5590  0e4c a30800        	cpw	x,#2048
5591  0e4f 2603          	jrne	L053
5592  0e51               L253:
5593  0e51 4f            	clr	a
5594  0e52 2010          	jra	L453
5595  0e54               L053:
5596  0e54 ae04b5        	ldw	x,#1205
5597  0e57 89            	pushw	x
5598  0e58 ae0000        	ldw	x,#0
5599  0e5b 89            	pushw	x
5600  0e5c ae0008        	ldw	x,#L103
5601  0e5f cd0000        	call	_assert_failed
5603  0e62 5b04          	addw	sp,#4
5604  0e64               L453:
5605                     ; 1208     switch (CAN_IT)
5607  0e64 1e03          	ldw	x,(OFST+1,sp)
5609                     ; 1321         break;
5610  0e66 5a            	decw	x
5611  0e67 2746          	jreq	L1712
5612  0e69 5a            	decw	x
5613  0e6a 2760          	jreq	L3712
5614  0e6c 1d0002        	subw	x,#2
5615  0e6f 2778          	jreq	L5712
5616  0e71 1d0004        	subw	x,#4
5617  0e74 2603          	jrne	L653
5618  0e76 cc0f06        	jp	L7712
5619  0e79               L653:
5620  0e79 1d0078        	subw	x,#120
5621  0e7c 2603          	jrne	L063
5622  0e7e cc0f23        	jp	L1022
5623  0e81               L063:
5624  0e81 1d0080        	subw	x,#128
5625  0e84 2603          	jrne	L263
5626  0e86 cc0f5d        	jp	L5022
5627  0e89               L263:
5628  0e89 1d0100        	subw	x,#256
5629  0e8c 2603          	jrne	L463
5630  0e8e cc0f7a        	jp	L7022
5631  0e91               L463:
5632  0e91 1d0200        	subw	x,#512
5633  0e94 2603          	jrne	L663
5634  0e96 cc0f97        	jp	L1122
5635  0e99               L663:
5636  0e99 1d0400        	subw	x,#1024
5637  0e9c 2603          	jrne	L073
5638  0e9e cc0fb4        	jp	L3122
5639  0ea1               L073:
5640  0ea1 1d3800        	subw	x,#14336
5641  0ea4 2603          	jrne	L273
5642  0ea6 cc0f40        	jp	L3022
5643  0ea9               L273:
5644  0ea9               L5122:
5645                     ; 1319     default :
5645                     ; 1320         pendingbitstatus = RESET;
5647  0ea9 0f02          	clr	(OFST+0,sp)
5648                     ; 1321         break;
5650  0eab accf0fcf      	jpf	L7422
5651  0eaf               L1712:
5652                     ; 1210     case CAN_IT_TME:
5652                     ; 1211         if ((CAN->IER & CAN_IER_TMEIE) !=RESET)
5654  0eaf c65425        	ld	a,21541
5655  0eb2 a501          	bcp	a,#1
5656  0eb4 2710          	jreq	L1522
5657                     ; 1213             pendingbitstatus = CheckITStatus(CAN->TSR, CAN_TSR_RQCP012);
5659  0eb6 ae0007        	ldw	x,#7
5660  0eb9 c65422        	ld	a,21538
5661  0ebc 95            	ld	xh,a
5662  0ebd cd10b0        	call	L3_CheckITStatus
5664  0ec0 6b02          	ld	(OFST+0,sp),a
5666  0ec2 accf0fcf      	jpf	L7422
5667  0ec6               L1522:
5668                     ; 1217             pendingbitstatus = RESET;
5670  0ec6 0f02          	clr	(OFST+0,sp)
5671  0ec8 accf0fcf      	jpf	L7422
5672  0ecc               L3712:
5673                     ; 1221     case CAN_IT_FMP:
5673                     ; 1222         if ((CAN->IER & CAN_IER_FMPIE) !=RESET)
5675  0ecc c65425        	ld	a,21541
5676  0ecf a502          	bcp	a,#2
5677  0ed1 2710          	jreq	L5522
5678                     ; 1224             pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FMP01);
5680  0ed3 ae0003        	ldw	x,#3
5681  0ed6 c65424        	ld	a,21540
5682  0ed9 95            	ld	xh,a
5683  0eda cd10b0        	call	L3_CheckITStatus
5685  0edd 6b02          	ld	(OFST+0,sp),a
5687  0edf accf0fcf      	jpf	L7422
5688  0ee3               L5522:
5689                     ; 1228             pendingbitstatus = RESET;
5691  0ee3 0f02          	clr	(OFST+0,sp)
5692  0ee5 accf0fcf      	jpf	L7422
5693  0ee9               L5712:
5694                     ; 1231     case CAN_IT_FF:
5694                     ; 1232         if ((CAN->IER & CAN_IER_FFIE) !=RESET)
5696  0ee9 c65425        	ld	a,21541
5697  0eec a504          	bcp	a,#4
5698  0eee 2710          	jreq	L1622
5699                     ; 1234             pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FULL);
5701  0ef0 ae0008        	ldw	x,#8
5702  0ef3 c65424        	ld	a,21540
5703  0ef6 95            	ld	xh,a
5704  0ef7 cd10b0        	call	L3_CheckITStatus
5706  0efa 6b02          	ld	(OFST+0,sp),a
5708  0efc accf0fcf      	jpf	L7422
5709  0f00               L1622:
5710                     ; 1238             pendingbitstatus = RESET;
5712  0f00 0f02          	clr	(OFST+0,sp)
5713  0f02 accf0fcf      	jpf	L7422
5714  0f06               L7712:
5715                     ; 1241     case CAN_IT_FOV:
5715                     ; 1242         if ((CAN->IER & CAN_IER_FOVIE) !=RESET)
5717  0f06 c65425        	ld	a,21541
5718  0f09 a508          	bcp	a,#8
5719  0f0b 2710          	jreq	L5622
5720                     ; 1244             pendingbitstatus = CheckITStatus(CAN->RFR, CAN_RFR_FOVR);
5722  0f0d ae0010        	ldw	x,#16
5723  0f10 c65424        	ld	a,21540
5724  0f13 95            	ld	xh,a
5725  0f14 cd10b0        	call	L3_CheckITStatus
5727  0f17 6b02          	ld	(OFST+0,sp),a
5729  0f19 accf0fcf      	jpf	L7422
5730  0f1d               L5622:
5731                     ; 1248             pendingbitstatus = RESET;
5733  0f1d 0f02          	clr	(OFST+0,sp)
5734  0f1f accf0fcf      	jpf	L7422
5735  0f23               L1022:
5736                     ; 1251     case CAN_IT_WKU:
5736                     ; 1252         if ((CAN->IER & CAN_IER_WKUIE) !=RESET)
5738  0f23 c65425        	ld	a,21541
5739  0f26 a580          	bcp	a,#128
5740  0f28 2710          	jreq	L1722
5741                     ; 1254             pendingbitstatus = CheckITStatus(CAN->MSR, CAN_MSR_WKUI);
5743  0f2a ae0008        	ldw	x,#8
5744  0f2d c65421        	ld	a,21537
5745  0f30 95            	ld	xh,a
5746  0f31 cd10b0        	call	L3_CheckITStatus
5748  0f34 6b02          	ld	(OFST+0,sp),a
5750  0f36 accf0fcf      	jpf	L7422
5751  0f3a               L1722:
5752                     ; 1258             pendingbitstatus = RESET;
5754  0f3a 0f02          	clr	(OFST+0,sp)
5755  0f3c accf0fcf      	jpf	L7422
5756  0f40               L3022:
5757                     ; 1262     case CAN_IT_ERR:
5757                     ; 1263         CAN->PSR = CAN_Page_Config;
5759  0f40 35065427      	mov	21543,#6
5760                     ; 1264         if ((CAN->Page.Config.EIER & CAN_EIER_ERRIE) !=RESET)
5762  0f44 c65429        	ld	a,21545
5763  0f47 a580          	bcp	a,#128
5764  0f49 270e          	jreq	L5722
5765                     ; 1266             pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EWGF|CAN_ESR_EPVF|CAN_ESR_BOFF|CAN_ESR_LEC);
5767  0f4b ae0077        	ldw	x,#119
5768  0f4e c65428        	ld	a,21544
5769  0f51 95            	ld	xh,a
5770  0f52 cd10b0        	call	L3_CheckITStatus
5772  0f55 6b02          	ld	(OFST+0,sp),a
5774  0f57 2076          	jra	L7422
5775  0f59               L5722:
5776                     ; 1270             pendingbitstatus = RESET;
5778  0f59 0f02          	clr	(OFST+0,sp)
5779  0f5b 2072          	jra	L7422
5780  0f5d               L5022:
5781                     ; 1274     case CAN_IT_EWG:
5781                     ; 1275         CAN->PSR = CAN_Page_Config;
5783  0f5d 35065427      	mov	21543,#6
5784                     ; 1276         if ((CAN->Page.Config.EIER & CAN_EIER_EWGIE) !=RESET)
5786  0f61 c65429        	ld	a,21545
5787  0f64 a501          	bcp	a,#1
5788  0f66 270e          	jreq	L1032
5789                     ; 1278             pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EWGF);
5791  0f68 ae0001        	ldw	x,#1
5792  0f6b c65428        	ld	a,21544
5793  0f6e 95            	ld	xh,a
5794  0f6f cd10b0        	call	L3_CheckITStatus
5796  0f72 6b02          	ld	(OFST+0,sp),a
5798  0f74 2059          	jra	L7422
5799  0f76               L1032:
5800                     ; 1282             pendingbitstatus = RESET;
5802  0f76 0f02          	clr	(OFST+0,sp)
5803  0f78 2055          	jra	L7422
5804  0f7a               L7022:
5805                     ; 1286     case CAN_IT_EPV:
5805                     ; 1287         CAN->PSR = CAN_Page_Config;
5807  0f7a 35065427      	mov	21543,#6
5808                     ; 1288         if ((CAN->Page.Config.EIER & CAN_EIER_EPVIE) !=RESET)
5810  0f7e c65429        	ld	a,21545
5811  0f81 a502          	bcp	a,#2
5812  0f83 270e          	jreq	L5032
5813                     ; 1290             pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_EPVF);
5815  0f85 ae0002        	ldw	x,#2
5816  0f88 c65428        	ld	a,21544
5817  0f8b 95            	ld	xh,a
5818  0f8c cd10b0        	call	L3_CheckITStatus
5820  0f8f 6b02          	ld	(OFST+0,sp),a
5822  0f91 203c          	jra	L7422
5823  0f93               L5032:
5824                     ; 1294             pendingbitstatus = RESET;
5826  0f93 0f02          	clr	(OFST+0,sp)
5827  0f95 2038          	jra	L7422
5828  0f97               L1122:
5829                     ; 1297     case CAN_IT_BOF:
5829                     ; 1298         CAN->PSR = CAN_Page_Config;
5831  0f97 35065427      	mov	21543,#6
5832                     ; 1299         if ((CAN->Page.Config.EIER & CAN_EIER_BOFIE) !=RESET)
5834  0f9b c65429        	ld	a,21545
5835  0f9e a504          	bcp	a,#4
5836  0fa0 270e          	jreq	L1132
5837                     ; 1301             pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_BOFF);
5839  0fa2 ae0004        	ldw	x,#4
5840  0fa5 c65428        	ld	a,21544
5841  0fa8 95            	ld	xh,a
5842  0fa9 cd10b0        	call	L3_CheckITStatus
5844  0fac 6b02          	ld	(OFST+0,sp),a
5846  0fae 201f          	jra	L7422
5847  0fb0               L1132:
5848                     ; 1305             pendingbitstatus = RESET;
5850  0fb0 0f02          	clr	(OFST+0,sp)
5851  0fb2 201b          	jra	L7422
5852  0fb4               L3122:
5853                     ; 1308     case CAN_IT_LEC:
5853                     ; 1309         CAN->PSR = CAN_Page_Config;
5855  0fb4 35065427      	mov	21543,#6
5856                     ; 1310         if ((CAN->Page.Config.EIER & CAN_EIER_LECIE) !=RESET)
5858  0fb8 c65429        	ld	a,21545
5859  0fbb a510          	bcp	a,#16
5860  0fbd 270e          	jreq	L5132
5861                     ; 1312             pendingbitstatus = CheckITStatus(CAN->Page.Config.ESR, CAN_ESR_LEC);
5863  0fbf ae0070        	ldw	x,#112
5864  0fc2 c65428        	ld	a,21544
5865  0fc5 95            	ld	xh,a
5866  0fc6 cd10b0        	call	L3_CheckITStatus
5868  0fc9 6b02          	ld	(OFST+0,sp),a
5870  0fcb 2002          	jra	L7422
5871  0fcd               L5132:
5872                     ; 1316             pendingbitstatus = RESET;
5874  0fcd 0f02          	clr	(OFST+0,sp)
5875  0fcf               L7422:
5876                     ; 1324     CAN_SelectPage(can_page);
5878  0fcf 7b01          	ld	a,(OFST-1,sp)
5879  0fd1 cd10ac        	call	_CAN_SelectPage
5881                     ; 1326     return  (ITStatus)pendingbitstatus;
5883  0fd4 7b02          	ld	a,(OFST+0,sp)
5886  0fd6 5b04          	addw	sp,#4
5887  0fd8 81            	ret
5936                     ; 1344 void CAN_ClearITPendingBit(CAN_IT_TypeDef CAN_IT)
5936                     ; 1345 {
5937                     	switch	.text
5938  0fd9               _CAN_ClearITPendingBit:
5940  0fd9 89            	pushw	x
5941  0fda 88            	push	a
5942       00000001      OFST:	set	1
5945                     ; 1346     CAN_Page_TypeDef can_page = CAN_GetSelectedPage();
5947  0fdb cd10a8        	call	_CAN_GetSelectedPage
5949  0fde 6b01          	ld	(OFST+0,sp),a
5950                     ; 1348     assert_param(IS_CAN_IT_PENDING_BIT_OK(CAN_IT));
5952  0fe0 1e02          	ldw	x,(OFST+1,sp)
5953  0fe2 a30001        	cpw	x,#1
5954  0fe5 2738          	jreq	L004
5955  0fe7 1e02          	ldw	x,(OFST+1,sp)
5956  0fe9 a30004        	cpw	x,#4
5957  0fec 2731          	jreq	L004
5958  0fee 1e02          	ldw	x,(OFST+1,sp)
5959  0ff0 a30008        	cpw	x,#8
5960  0ff3 272a          	jreq	L004
5961  0ff5 1e02          	ldw	x,(OFST+1,sp)
5962  0ff7 a30080        	cpw	x,#128
5963  0ffa 2723          	jreq	L004
5964  0ffc 1e02          	ldw	x,(OFST+1,sp)
5965  0ffe a34000        	cpw	x,#16384
5966  1001 271c          	jreq	L004
5967  1003 1e02          	ldw	x,(OFST+1,sp)
5968  1005 a30100        	cpw	x,#256
5969  1008 2715          	jreq	L004
5970  100a 1e02          	ldw	x,(OFST+1,sp)
5971  100c a30200        	cpw	x,#512
5972  100f 270e          	jreq	L004
5973  1011 1e02          	ldw	x,(OFST+1,sp)
5974  1013 a30400        	cpw	x,#1024
5975  1016 2707          	jreq	L004
5976  1018 1e02          	ldw	x,(OFST+1,sp)
5977  101a a30800        	cpw	x,#2048
5978  101d 2603          	jrne	L673
5979  101f               L004:
5980  101f 4f            	clr	a
5981  1020 2010          	jra	L204
5982  1022               L673:
5983  1022 ae0544        	ldw	x,#1348
5984  1025 89            	pushw	x
5985  1026 ae0000        	ldw	x,#0
5986  1029 89            	pushw	x
5987  102a ae0008        	ldw	x,#L103
5988  102d cd0000        	call	_assert_failed
5990  1030 5b04          	addw	sp,#4
5991  1032               L204:
5992                     ; 1350     switch (CAN_IT)
5994  1032 1e02          	ldw	x,(OFST+1,sp)
5996                     ; 1393     default :
5996                     ; 1394         break;
5997  1034 5a            	decw	x
5998  1035 272a          	jreq	L1232
5999  1037 1d0003        	subw	x,#3
6000  103a 272b          	jreq	L3232
6001  103c 1d0004        	subw	x,#4
6002  103f 272c          	jreq	L5232
6003  1041 1d0078        	subw	x,#120
6004  1044 272d          	jreq	L7232
6005  1046 1d0080        	subw	x,#128
6006  1049 273c          	jreq	L3332
6007  104b 1d0100        	subw	x,#256
6008  104e 273d          	jreq	L5332
6009  1050 1d0200        	subw	x,#512
6010  1053 273e          	jreq	L7332
6011  1055 1d0400        	subw	x,#1024
6012  1058 273f          	jreq	L1432
6013  105a 1d3800        	subw	x,#14336
6014  105d 271a          	jreq	L1332
6015  105f 2040          	jra	L1732
6016  1061               L1232:
6017                     ; 1352     case CAN_IT_TME:
6017                     ; 1353         CAN->TSR = CAN_TSR_RQCP012;/* rc_w1*/
6019  1061 35075422      	mov	21538,#7
6020                     ; 1354         break;
6022  1065 203a          	jra	L1732
6023  1067               L3232:
6024                     ; 1356     case CAN_IT_FF:
6024                     ; 1357         CAN->RFR = CAN_RFR_FULL; /* rc_w1*/
6026  1067 35085424      	mov	21540,#8
6027                     ; 1358         break;
6029  106b 2034          	jra	L1732
6030  106d               L5232:
6031                     ; 1360     case CAN_IT_FOV:
6031                     ; 1361         CAN->RFR = CAN_RFR_FOVR; /* rc_w1*/
6033  106d 35105424      	mov	21540,#16
6034                     ; 1362         break;
6036  1071 202e          	jra	L1732
6037  1073               L7232:
6038                     ; 1364     case CAN_IT_WKU:
6038                     ; 1365         CAN->MSR = CAN_MSR_WKUI;  /* rc_w1*/
6040  1073 35085421      	mov	21537,#8
6041                     ; 1366         break;
6043  1077 2028          	jra	L1732
6044  1079               L1332:
6045                     ; 1368     case CAN_IT_ERR:
6045                     ; 1369         CAN->PSR = CAN_Page_Config;
6047  1079 35065427      	mov	21543,#6
6048                     ; 1370         CAN->Page.Config.ESR = (uint8_t)CAN_ESR_RESET_VALUE;
6050  107d 725f5428      	clr	21544
6051                     ; 1371         CAN->MSR = CAN_MSR_ERRI;
6053  1081 35045421      	mov	21537,#4
6054                     ; 1372         break;
6056  1085 201a          	jra	L1732
6057  1087               L3332:
6058                     ; 1374     case CAN_IT_EWG:
6058                     ; 1375         CAN->MSR = CAN_MSR_ERRI;
6060  1087 35045421      	mov	21537,#4
6061                     ; 1376         break;
6063  108b 2014          	jra	L1732
6064  108d               L5332:
6065                     ; 1378     case CAN_IT_EPV:
6065                     ; 1379         CAN->MSR = CAN_MSR_ERRI;
6067  108d 35045421      	mov	21537,#4
6068                     ; 1380         break;
6070  1091 200e          	jra	L1732
6071  1093               L7332:
6072                     ; 1382     case CAN_IT_BOF:
6072                     ; 1383         CAN->MSR = CAN_MSR_ERRI;
6074  1093 35045421      	mov	21537,#4
6075                     ; 1384         break;
6077  1097 2008          	jra	L1732
6078  1099               L1432:
6079                     ; 1386     case CAN_IT_LEC:
6079                     ; 1387         CAN->PSR = CAN_Page_Config;
6081  1099 35065427      	mov	21543,#6
6082                     ; 1388         CAN->Page.Config.ESR = (uint8_t)CAN_ESR_RESET_VALUE;
6084  109d 725f5428      	clr	21544
6085                     ; 1389         break;
6087  10a1               L3432:
6088                     ; 1393     default :
6088                     ; 1394         break;
6090  10a1               L1732:
6091                     ; 1397     CAN_SelectPage(can_page);
6093  10a1 7b01          	ld	a,(OFST+0,sp)
6094  10a3 ad07          	call	_CAN_SelectPage
6096                     ; 1398 }
6099  10a5 5b03          	addw	sp,#3
6100  10a7 81            	ret
6125                     ; 1405 CAN_Page_TypeDef CAN_GetSelectedPage(void)
6125                     ; 1406 {
6126                     	switch	.text
6127  10a8               _CAN_GetSelectedPage:
6131                     ; 1407     return (CAN_Page_TypeDef)(CAN->PSR);
6133  10a8 c65427        	ld	a,21543
6136  10ab 81            	ret
6171                     ; 1415 void CAN_SelectPage(CAN_Page_TypeDef CAN_Page)
6171                     ; 1416 {
6172                     	switch	.text
6173  10ac               _CAN_SelectPage:
6177                     ; 1417     CAN->PSR = (uint8_t)CAN_Page;
6179  10ac c75427        	ld	21543,a
6180                     ; 1418 }
6183  10af 81            	ret
6237                     ; 1426 static ITStatus CheckITStatus(uint8_t CAN_Reg, uint8_t It_Bit)
6237                     ; 1427 {
6238                     	switch	.text
6239  10b0               L3_CheckITStatus:
6241  10b0 89            	pushw	x
6242  10b1 88            	push	a
6243       00000001      OFST:	set	1
6246                     ; 1428     ITStatus pendingbitstatus = RESET;
6248  10b2 0f01          	clr	(OFST+0,sp)
6249                     ; 1429     if ((CAN_Reg & It_Bit) != (uint8_t)RESET)
6251  10b4 9f            	ld	a,xl
6252  10b5 1402          	and	a,(OFST+1,sp)
6253  10b7 2706          	jreq	L7442
6254                     ; 1432         pendingbitstatus = SET;
6256  10b9 a601          	ld	a,#1
6257  10bb 6b01          	ld	(OFST+0,sp),a
6259  10bd 2002          	jra	L1542
6260  10bf               L7442:
6261                     ; 1437         pendingbitstatus = RESET;
6263  10bf 0f01          	clr	(OFST+0,sp)
6264  10c1               L1542:
6265                     ; 1439     return (ITStatus)pendingbitstatus;
6267  10c1 7b01          	ld	a,(OFST+0,sp)
6270  10c3 5b03          	addw	sp,#3
6271  10c5 81            	ret
6341                     	xdef	__FMI
6342                     	xdef	__Data
6343                     	xdef	__DLC
6344                     	xdef	__RTR
6345                     	xdef	__IDE
6346                     	xdef	__Id
6347                     	xdef	_CAN_ClearITPendingBit
6348                     	xdef	_CAN_GetITStatus
6349                     	xdef	_CAN_ClearFlag
6350                     	xdef	_CAN_GetFlagStatus
6351                     	xdef	_CAN_SelectPage
6352                     	xdef	_CAN_GetSelectedPage
6353                     	xdef	_CAN_GetLastErrorCode
6354                     	xdef	_CAN_OperatingModeRequest
6355                     	xdef	_CAN_WakeUp
6356                     	xdef	_CAN_Sleep
6357                     	xdef	_CAN_GetMessageTimeStamp
6358                     	xdef	_CAN_GetReceivedFMI
6359                     	xdef	_CAN_GetReceivedData
6360                     	xdef	_CAN_GetReceivedDLC
6361                     	xdef	_CAN_GetReceivedRTR
6362                     	xdef	_CAN_GetReceivedIDE
6363                     	xdef	_CAN_GetReceivedId
6364                     	xdef	_CAN_Receive
6365                     	xdef	_CAN_MessagePending
6366                     	xdef	_CAN_FIFORelease
6367                     	xdef	_CAN_CancelTransmit
6368                     	xdef	_CAN_TransmitStatus
6369                     	xdef	_CAN_TTComModeCmd
6370                     	xdef	_CAN_Transmit
6371                     	xdef	_CAN_ST7CompatibilityCmd
6372                     	xdef	_CAN_ITConfig
6373                     	xdef	_CAN_FilterInit
6374                     	xdef	_CAN_Init
6375                     	xdef	_CAN_DeInit
6376                     	xref	_assert_failed
6377                     	switch	.const
6378  0008               L103:
6379  0008 66776c69625c  	dc.b	"fwlib\src\stm8s_ca"
6380  001a 6e2e6300      	dc.b	"n.c",0
6381                     	xref.b	c_lreg
6401                     	xref	c_uitol
6402                     	xref	c_uitolx
6403                     	xref	c_llsh
6404                     	xref	c_umul
6405                     	xref	c_lor
6406                     	xref	c_rtol
6407                     	xref	c_lursh
6408                     	xref	c_lgursh
6409                     	xref	c_lcmp
6410                     	xref	c_ltor
6411                     	end
