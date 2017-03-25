   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
 732                     ; 5 void CAN_Config(void) {     //can≈‰÷√
 734                     	switch	.text
 735  0000               _CAN_Config:
 737  0000 5213          	subw	sp,#19
 738       00000013      OFST:	set	19
 741                     ; 6     CAN_InitStatus_TypeDef    status = CAN_InitStatus_Failed;
 743  0002 7b01          	ld	a,(OFST-18,sp)
 744  0004 97            	ld	xl,a
 745                     ; 32     CAN_DeInit();
 747  0005 cd0000        	call	_CAN_DeInit
 749                     ; 35     CAN_MasterCtrl = CAN_MasterCtrl_AllDisabled;
 751  0008 7b0e          	ld	a,(OFST-5,sp)
 752  000a 97            	ld	xl,a
 753                     ; 36     CAN_Mode = CAN_Mode_Normal;
 755  000b 7b0f          	ld	a,(OFST-4,sp)
 756  000d 97            	ld	xl,a
 757                     ; 38     CAN_SynJumpWidth = CAN_SynJumpWidth_1TimeQuantum;
 759  000e 7b10          	ld	a,(OFST-3,sp)
 760  0010 97            	ld	xl,a
 761                     ; 39     CAN_BitSeg1 = CAN_BitSeg1_6TimeQuantum;
 763  0011 7b11          	ld	a,(OFST-2,sp)
 764  0013 97            	ld	xl,a
 765                     ; 40     CAN_BitSeg2 = CAN_BitSeg2_7TimeQuantum;
 767  0014 7b12          	ld	a,(OFST-1,sp)
 768  0016 97            	ld	xl,a
 769                     ; 41     CAN_Prescaler = 20;
 771  0017 7b13          	ld	a,(OFST+0,sp)
 772  0019 97            	ld	xl,a
 773                     ; 48     status = CAN_Init(CAN_MasterCtrl,CAN_Mode,CAN_SynJumpWidth,CAN_BitSeg1,CAN_BitSeg2,CAN_Prescaler);
 775  001a 7b01          	ld	a,(OFST-18,sp)
 776  001c 97            	ld	xl,a
 777  001d 4b14          	push	#20
 778  001f 4b60          	push	#96
 779  0021 4b05          	push	#5
 780  0023 4b00          	push	#0
 781  0025 5f            	clrw	x
 782  0026 4f            	clr	a
 783  0027 95            	ld	xh,a
 784  0028 cd0000        	call	_CAN_Init
 786  002b 5b04          	addw	sp,#4
 787                     ; 51     CAN_FilterNumber = 0;
 789  002d 7b02          	ld	a,(OFST-17,sp)
 790  002f 97            	ld	xl,a
 791                     ; 52     CAN_FilterActivation = ENABLE;
 793  0030 7b03          	ld	a,(OFST-16,sp)
 794  0032 97            	ld	xl,a
 795                     ; 53     CAN_FilterMode = CAN_FilterMode_IdMask;
 797  0033 7b04          	ld	a,(OFST-15,sp)
 798  0035 97            	ld	xl,a
 799                     ; 54     CAN_FilterScale = CAN_FilterScale_32Bit;
 801  0036 7b05          	ld	a,(OFST-14,sp)
 802  0038 97            	ld	xl,a
 803                     ; 55     CAN_FilterID1=0;  
 805  0039 7b06          	ld	a,(OFST-13,sp)
 806  003b 97            	ld	xl,a
 807                     ; 56     CAN_FilterID2=0;
 809  003c 7b07          	ld	a,(OFST-12,sp)
 810  003e 97            	ld	xl,a
 811                     ; 57     CAN_FilterID3=0;
 813  003f 7b08          	ld	a,(OFST-11,sp)
 814  0041 97            	ld	xl,a
 815                     ; 58     CAN_FilterID4=0;
 817  0042 7b09          	ld	a,(OFST-10,sp)
 818  0044 97            	ld	xl,a
 819                     ; 59     CAN_FilterIDMask1=0;
 821  0045 7b0a          	ld	a,(OFST-9,sp)
 822  0047 97            	ld	xl,a
 823                     ; 60     CAN_FilterIDMask2=0;
 825  0048 7b0b          	ld	a,(OFST-8,sp)
 826  004a 97            	ld	xl,a
 827                     ; 61     CAN_FilterIDMask3=0;
 829  004b 7b0c          	ld	a,(OFST-7,sp)
 830  004d 97            	ld	xl,a
 831                     ; 62     CAN_FilterIDMask4=0;  
 833  004e 7b0d          	ld	a,(OFST-6,sp)
 834  0050 97            	ld	xl,a
 835                     ; 63     CAN_FilterInit(CAN_FilterNumber, CAN_FilterActivation, CAN_FilterMode, CAN_FilterScale,CAN_FilterID1, CAN_FilterID2, CAN_FilterID3, CAN_FilterID4,CAN_FilterIDMask1, CAN_FilterIDMask2, CAN_FilterIDMask3, CAN_FilterIDMask4);
 837  0051 4b00          	push	#0
 838  0053 4b00          	push	#0
 839  0055 4b00          	push	#0
 840  0057 4b00          	push	#0
 841  0059 4b00          	push	#0
 842  005b 4b00          	push	#0
 843  005d 4b00          	push	#0
 844  005f 4b00          	push	#0
 845  0061 4b06          	push	#6
 846  0063 4b00          	push	#0
 847  0065 ae0001        	ldw	x,#1
 848  0068 4f            	clr	a
 849  0069 95            	ld	xh,a
 850  006a cd0000        	call	_CAN_FilterInit
 852  006d 5b0a          	addw	sp,#10
 853                     ; 64 }
 856  006f 5b13          	addw	sp,#19
 857  0071 81            	ret
 893                     ; 66 void ReceiveCanData(void) {    //can∑¢ÀÕ‘⁄main¿Ô
 894                     	switch	.text
 895  0072               _ReceiveCanData:
 897  0072 88            	push	a
 898       00000001      OFST:	set	1
 901                     ; 68     for(i=0; i<8; i++) {
 903  0073 0f01          	clr	(OFST+0,sp)
 904  0075               L314:
 905                     ; 69         CanBuffer[i] = CAN_GetReceivedData(i);
 907  0075 7b01          	ld	a,(OFST+0,sp)
 908  0077 5f            	clrw	x
 909  0078 97            	ld	xl,a
 910  0079 89            	pushw	x
 911  007a 7b03          	ld	a,(OFST+2,sp)
 912  007c cd0000        	call	_CAN_GetReceivedData
 914  007f 85            	popw	x
 915  0080 e700          	ld	(L3_CanBuffer,x),a
 916                     ; 68     for(i=0; i<8; i++) {
 918  0082 0c01          	inc	(OFST+0,sp)
 921  0084 7b01          	ld	a,(OFST+0,sp)
 922  0086 a108          	cp	a,#8
 923  0088 25eb          	jrult	L314
 924                     ; 71 }
 927  008a 84            	pop	a
 928  008b 81            	ret
 952                     ; 73 uint8_t GetCan1(void) {
 953                     	switch	.text
 954  008c               _GetCan1:
 958                     ; 74     return CanBuffer[0];
 960  008c b600          	ld	a,L3_CanBuffer
 963  008e 81            	ret
 987                     ; 77 uint8_t GetCan2(void) {
 988                     	switch	.text
 989  008f               _GetCan2:
 993                     ; 78     return CanBuffer[1];
 995  008f b601          	ld	a,L3_CanBuffer+1
 998  0091 81            	ret
1023                     	switch	.ubsct
1024  0000               L3_CanBuffer:
1025  0000 000000000000  	ds.b	8
1026                     	xdef	_GetCan2
1027                     	xdef	_GetCan1
1028                     	xdef	_ReceiveCanData
1029                     	xdef	_CAN_Config
1030                     	xref	_CAN_GetReceivedData
1031                     	xref	_CAN_FilterInit
1032                     	xref	_CAN_Init
1033                     	xref	_CAN_DeInit
1053                     	end
