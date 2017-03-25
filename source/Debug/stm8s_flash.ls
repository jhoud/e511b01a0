   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  65                     ; 81 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  65                     ; 82 {
  67                     	switch	.text
  68  0000               _FLASH_Unlock:
  70  0000 88            	push	a
  71       00000000      OFST:	set	0
  74                     ; 84     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  76  0001 a1fd          	cp	a,#253
  77  0003 2704          	jreq	L01
  78  0005 a1f7          	cp	a,#247
  79  0007 2603          	jrne	L6
  80  0009               L01:
  81  0009 4f            	clr	a
  82  000a 2010          	jra	L21
  83  000c               L6:
  84  000c ae0054        	ldw	x,#84
  85  000f 89            	pushw	x
  86  0010 ae0000        	ldw	x,#0
  87  0013 89            	pushw	x
  88  0014 ae0010        	ldw	x,#L73
  89  0017 cd0000        	call	_assert_failed
  91  001a 5b04          	addw	sp,#4
  92  001c               L21:
  93                     ; 87     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
  95  001c 7b01          	ld	a,(OFST+1,sp)
  96  001e a1fd          	cp	a,#253
  97  0020 260a          	jrne	L14
  98                     ; 89         FLASH->PUKR = FLASH_RASS_KEY1;
 100  0022 35565062      	mov	20578,#86
 101                     ; 90         FLASH->PUKR = FLASH_RASS_KEY2;
 103  0026 35ae5062      	mov	20578,#174
 105  002a 2008          	jra	L34
 106  002c               L14:
 107                     ; 95         FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 109  002c 35ae5064      	mov	20580,#174
 110                     ; 96         FLASH->DUKR = FLASH_RASS_KEY1;
 112  0030 35565064      	mov	20580,#86
 113  0034               L34:
 114                     ; 98 }
 117  0034 84            	pop	a
 118  0035 81            	ret
 154                     ; 106 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 154                     ; 107 {
 155                     	switch	.text
 156  0036               _FLASH_Lock:
 158  0036 88            	push	a
 159       00000000      OFST:	set	0
 162                     ; 109     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 164  0037 a1fd          	cp	a,#253
 165  0039 2704          	jreq	L02
 166  003b a1f7          	cp	a,#247
 167  003d 2603          	jrne	L61
 168  003f               L02:
 169  003f 4f            	clr	a
 170  0040 2010          	jra	L22
 171  0042               L61:
 172  0042 ae006d        	ldw	x,#109
 173  0045 89            	pushw	x
 174  0046 ae0000        	ldw	x,#0
 175  0049 89            	pushw	x
 176  004a ae0010        	ldw	x,#L73
 177  004d cd0000        	call	_assert_failed
 179  0050 5b04          	addw	sp,#4
 180  0052               L22:
 181                     ; 112   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 183  0052 c6505f        	ld	a,20575
 184  0055 1401          	and	a,(OFST+1,sp)
 185  0057 c7505f        	ld	20575,a
 186                     ; 113 }
 189  005a 84            	pop	a
 190  005b 81            	ret
 213                     ; 120 void FLASH_DeInit(void)
 213                     ; 121 {
 214                     	switch	.text
 215  005c               _FLASH_DeInit:
 219                     ; 122     FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 221  005c 725f505a      	clr	20570
 222                     ; 123     FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 224  0060 725f505b      	clr	20571
 225                     ; 124     FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 227  0064 35ff505c      	mov	20572,#255
 228                     ; 125     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 230  0068 7217505f      	bres	20575,#3
 231                     ; 126     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 233  006c 7213505f      	bres	20575,#1
 234                     ; 127     (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 236  0070 c6505f        	ld	a,20575
 237  0073 97            	ld	xl,a
 238                     ; 128 }
 241  0074 81            	ret
 297                     ; 136 void FLASH_ITConfig(FunctionalState NewState)
 297                     ; 137 {
 298                     	switch	.text
 299  0075               _FLASH_ITConfig:
 301  0075 88            	push	a
 302       00000000      OFST:	set	0
 305                     ; 139   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 307  0076 4d            	tnz	a
 308  0077 2704          	jreq	L23
 309  0079 a101          	cp	a,#1
 310  007b 2603          	jrne	L03
 311  007d               L23:
 312  007d 4f            	clr	a
 313  007e 2010          	jra	L43
 314  0080               L03:
 315  0080 ae008b        	ldw	x,#139
 316  0083 89            	pushw	x
 317  0084 ae0000        	ldw	x,#0
 318  0087 89            	pushw	x
 319  0088 ae0010        	ldw	x,#L73
 320  008b cd0000        	call	_assert_failed
 322  008e 5b04          	addw	sp,#4
 323  0090               L43:
 324                     ; 141     if (NewState != DISABLE)
 326  0090 0d01          	tnz	(OFST+1,sp)
 327  0092 2706          	jreq	L121
 328                     ; 143         FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 330  0094 7212505a      	bset	20570,#1
 332  0098 2004          	jra	L321
 333  009a               L121:
 334                     ; 147         FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 336  009a 7213505a      	bres	20570,#1
 337  009e               L321:
 338                     ; 149 }
 341  009e 84            	pop	a
 342  009f 81            	ret
 377                     .const:	section	.text
 378  0000               L64:
 379  0000 00008000      	dc.l	32768
 380  0004               L05:
 381  0004 00028000      	dc.l	163840
 382  0008               L25:
 383  0008 00004000      	dc.l	16384
 384  000c               L45:
 385  000c 00004800      	dc.l	18432
 386                     ; 158 void FLASH_EraseByte(uint32_t Address)
 386                     ; 159 {
 387                     	switch	.text
 388  00a0               _FLASH_EraseByte:
 390       00000000      OFST:	set	0
 393                     ; 161     assert_param(IS_FLASH_ADDRESS_OK(Address));
 395  00a0 96            	ldw	x,sp
 396  00a1 1c0003        	addw	x,#OFST+3
 397  00a4 cd0000        	call	c_ltor
 399  00a7 ae0000        	ldw	x,#L64
 400  00aa cd0000        	call	c_lcmp
 402  00ad 250f          	jrult	L44
 403  00af 96            	ldw	x,sp
 404  00b0 1c0003        	addw	x,#OFST+3
 405  00b3 cd0000        	call	c_ltor
 407  00b6 ae0004        	ldw	x,#L05
 408  00b9 cd0000        	call	c_lcmp
 410  00bc 251e          	jrult	L24
 411  00be               L44:
 412  00be 96            	ldw	x,sp
 413  00bf 1c0003        	addw	x,#OFST+3
 414  00c2 cd0000        	call	c_ltor
 416  00c5 ae0008        	ldw	x,#L25
 417  00c8 cd0000        	call	c_lcmp
 419  00cb 2512          	jrult	L04
 420  00cd 96            	ldw	x,sp
 421  00ce 1c0003        	addw	x,#OFST+3
 422  00d1 cd0000        	call	c_ltor
 424  00d4 ae000c        	ldw	x,#L45
 425  00d7 cd0000        	call	c_lcmp
 427  00da 2403          	jruge	L04
 428  00dc               L24:
 429  00dc 4f            	clr	a
 430  00dd 2010          	jra	L65
 431  00df               L04:
 432  00df ae00a1        	ldw	x,#161
 433  00e2 89            	pushw	x
 434  00e3 ae0000        	ldw	x,#0
 435  00e6 89            	pushw	x
 436  00e7 ae0010        	ldw	x,#L73
 437  00ea cd0000        	call	_assert_failed
 439  00ed 5b04          	addw	sp,#4
 440  00ef               L65:
 441                     ; 164    *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; 
 443  00ef 7b05          	ld	a,(OFST+5,sp)
 444  00f1 97            	ld	xl,a
 445  00f2 7b06          	ld	a,(OFST+6,sp)
 446  00f4 3f00          	clr	c_x
 447  00f6 02            	rlwa	x,a
 448  00f7 9093          	ldw	y,x
 449  00f9 bf01          	ldw	c_x+1,x
 450  00fb 4f            	clr	a
 451  00fc 92bd0000      	ldf	[c_x.e],a
 452                     ; 166 }
 455  0100 81            	ret
 499                     ; 176 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 499                     ; 177 {
 500                     	switch	.text
 501  0101               _FLASH_ProgramByte:
 503       00000000      OFST:	set	0
 506                     ; 179     assert_param(IS_FLASH_ADDRESS_OK(Address));
 508  0101 96            	ldw	x,sp
 509  0102 1c0003        	addw	x,#OFST+3
 510  0105 cd0000        	call	c_ltor
 512  0108 ae0000        	ldw	x,#L64
 513  010b cd0000        	call	c_lcmp
 515  010e 250f          	jrult	L66
 516  0110 96            	ldw	x,sp
 517  0111 1c0003        	addw	x,#OFST+3
 518  0114 cd0000        	call	c_ltor
 520  0117 ae0004        	ldw	x,#L05
 521  011a cd0000        	call	c_lcmp
 523  011d 251e          	jrult	L46
 524  011f               L66:
 525  011f 96            	ldw	x,sp
 526  0120 1c0003        	addw	x,#OFST+3
 527  0123 cd0000        	call	c_ltor
 529  0126 ae0008        	ldw	x,#L25
 530  0129 cd0000        	call	c_lcmp
 532  012c 2512          	jrult	L26
 533  012e 96            	ldw	x,sp
 534  012f 1c0003        	addw	x,#OFST+3
 535  0132 cd0000        	call	c_ltor
 537  0135 ae000c        	ldw	x,#L45
 538  0138 cd0000        	call	c_lcmp
 540  013b 2403          	jruge	L26
 541  013d               L46:
 542  013d 4f            	clr	a
 543  013e 2010          	jra	L07
 544  0140               L26:
 545  0140 ae00b3        	ldw	x,#179
 546  0143 89            	pushw	x
 547  0144 ae0000        	ldw	x,#0
 548  0147 89            	pushw	x
 549  0148 ae0010        	ldw	x,#L73
 550  014b cd0000        	call	_assert_failed
 552  014e 5b04          	addw	sp,#4
 553  0150               L07:
 554                     ; 180     *(PointerAttr uint8_t*) (uint16_t)Address = Data;
 556  0150 7b05          	ld	a,(OFST+5,sp)
 557  0152 97            	ld	xl,a
 558  0153 7b06          	ld	a,(OFST+6,sp)
 559  0155 3f00          	clr	c_x
 560  0157 02            	rlwa	x,a
 561  0158 9093          	ldw	y,x
 562  015a 7b07          	ld	a,(OFST+7,sp)
 563  015c bf01          	ldw	c_x+1,x
 564  015e 92bd0000      	ldf	[c_x.e],a
 565                     ; 181 }
 568  0162 81            	ret
 603                     ; 190 uint8_t FLASH_ReadByte(uint32_t Address)
 603                     ; 191 {
 604                     	switch	.text
 605  0163               _FLASH_ReadByte:
 607       00000000      OFST:	set	0
 610                     ; 193     assert_param(IS_FLASH_ADDRESS_OK(Address));
 612  0163 96            	ldw	x,sp
 613  0164 1c0003        	addw	x,#OFST+3
 614  0167 cd0000        	call	c_ltor
 616  016a ae0000        	ldw	x,#L64
 617  016d cd0000        	call	c_lcmp
 619  0170 250f          	jrult	L001
 620  0172 96            	ldw	x,sp
 621  0173 1c0003        	addw	x,#OFST+3
 622  0176 cd0000        	call	c_ltor
 624  0179 ae0004        	ldw	x,#L05
 625  017c cd0000        	call	c_lcmp
 627  017f 251e          	jrult	L67
 628  0181               L001:
 629  0181 96            	ldw	x,sp
 630  0182 1c0003        	addw	x,#OFST+3
 631  0185 cd0000        	call	c_ltor
 633  0188 ae0008        	ldw	x,#L25
 634  018b cd0000        	call	c_lcmp
 636  018e 2512          	jrult	L47
 637  0190 96            	ldw	x,sp
 638  0191 1c0003        	addw	x,#OFST+3
 639  0194 cd0000        	call	c_ltor
 641  0197 ae000c        	ldw	x,#L45
 642  019a cd0000        	call	c_lcmp
 644  019d 2403          	jruge	L47
 645  019f               L67:
 646  019f 4f            	clr	a
 647  01a0 2010          	jra	L201
 648  01a2               L47:
 649  01a2 ae00c1        	ldw	x,#193
 650  01a5 89            	pushw	x
 651  01a6 ae0000        	ldw	x,#0
 652  01a9 89            	pushw	x
 653  01aa ae0010        	ldw	x,#L73
 654  01ad cd0000        	call	_assert_failed
 656  01b0 5b04          	addw	sp,#4
 657  01b2               L201:
 658                     ; 196     return(*(PointerAttr uint8_t *) (uint16_t)Address); 
 660  01b2 7b05          	ld	a,(OFST+5,sp)
 661  01b4 97            	ld	xl,a
 662  01b5 7b06          	ld	a,(OFST+6,sp)
 663  01b7 3f00          	clr	c_x
 664  01b9 02            	rlwa	x,a
 665  01ba 9093          	ldw	y,x
 666  01bc bf01          	ldw	c_x+1,x
 667  01be 92bc0000      	ldf	a,[c_x.e]
 670  01c2 81            	ret
 714                     ; 207 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 714                     ; 208 {
 715                     	switch	.text
 716  01c3               _FLASH_ProgramWord:
 718       00000000      OFST:	set	0
 721                     ; 210     assert_param(IS_FLASH_ADDRESS_OK(Address));
 723  01c3 96            	ldw	x,sp
 724  01c4 1c0003        	addw	x,#OFST+3
 725  01c7 cd0000        	call	c_ltor
 727  01ca ae0000        	ldw	x,#L64
 728  01cd cd0000        	call	c_lcmp
 730  01d0 250f          	jrult	L211
 731  01d2 96            	ldw	x,sp
 732  01d3 1c0003        	addw	x,#OFST+3
 733  01d6 cd0000        	call	c_ltor
 735  01d9 ae0004        	ldw	x,#L05
 736  01dc cd0000        	call	c_lcmp
 738  01df 251e          	jrult	L011
 739  01e1               L211:
 740  01e1 96            	ldw	x,sp
 741  01e2 1c0003        	addw	x,#OFST+3
 742  01e5 cd0000        	call	c_ltor
 744  01e8 ae0008        	ldw	x,#L25
 745  01eb cd0000        	call	c_lcmp
 747  01ee 2512          	jrult	L601
 748  01f0 96            	ldw	x,sp
 749  01f1 1c0003        	addw	x,#OFST+3
 750  01f4 cd0000        	call	c_ltor
 752  01f7 ae000c        	ldw	x,#L45
 753  01fa cd0000        	call	c_lcmp
 755  01fd 2403          	jruge	L601
 756  01ff               L011:
 757  01ff 4f            	clr	a
 758  0200 2010          	jra	L411
 759  0202               L601:
 760  0202 ae00d2        	ldw	x,#210
 761  0205 89            	pushw	x
 762  0206 ae0000        	ldw	x,#0
 763  0209 89            	pushw	x
 764  020a ae0010        	ldw	x,#L73
 765  020d cd0000        	call	_assert_failed
 767  0210 5b04          	addw	sp,#4
 768  0212               L411:
 769                     ; 213     FLASH->CR2 |= FLASH_CR2_WPRG;
 771  0212 721c505b      	bset	20571,#6
 772                     ; 214     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 774  0216 721d505c      	bres	20572,#6
 775                     ; 217     *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));
 777  021a 7b05          	ld	a,(OFST+5,sp)
 778  021c 97            	ld	xl,a
 779  021d 7b06          	ld	a,(OFST+6,sp)
 780  021f 3f00          	clr	c_x
 781  0221 02            	rlwa	x,a
 782  0222 9093          	ldw	y,x
 783  0224 7b07          	ld	a,(OFST+7,sp)
 784  0226 bf01          	ldw	c_x+1,x
 785  0228 92bd0000      	ldf	[c_x.e],a
 786                     ; 219     *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data)+1); 
 788  022c 7b05          	ld	a,(OFST+5,sp)
 789  022e 97            	ld	xl,a
 790  022f 7b06          	ld	a,(OFST+6,sp)
 791  0231 3f00          	clr	c_x
 792  0233 02            	rlwa	x,a
 793  0234 9093          	ldw	y,x
 794  0236 90ae0001      	ldw	y,#1
 795  023a bf01          	ldw	c_x+1,x
 796  023c 93            	ldw	x,y
 797  023d 7b08          	ld	a,(OFST+8,sp)
 798  023f 92a70000      	ldf	([c_x.e],x),a
 799                     ; 221     *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data)+2); 
 801  0243 7b05          	ld	a,(OFST+5,sp)
 802  0245 97            	ld	xl,a
 803  0246 7b06          	ld	a,(OFST+6,sp)
 804  0248 3f00          	clr	c_x
 805  024a 02            	rlwa	x,a
 806  024b 9093          	ldw	y,x
 807  024d 90ae0002      	ldw	y,#2
 808  0251 bf01          	ldw	c_x+1,x
 809  0253 93            	ldw	x,y
 810  0254 7b09          	ld	a,(OFST+9,sp)
 811  0256 92a70000      	ldf	([c_x.e],x),a
 812                     ; 223     *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data)+3); 
 814  025a 7b05          	ld	a,(OFST+5,sp)
 815  025c 97            	ld	xl,a
 816  025d 7b06          	ld	a,(OFST+6,sp)
 817  025f 3f00          	clr	c_x
 818  0261 02            	rlwa	x,a
 819  0262 9093          	ldw	y,x
 820  0264 90ae0003      	ldw	y,#3
 821  0268 bf01          	ldw	c_x+1,x
 822  026a 93            	ldw	x,y
 823  026b 7b0a          	ld	a,(OFST+10,sp)
 824  026d 92a70000      	ldf	([c_x.e],x),a
 825                     ; 224 }
 828  0271 81            	ret
 874                     ; 232 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 874                     ; 233 {
 875                     	switch	.text
 876  0272               _FLASH_ProgramOptionByte:
 878  0272 89            	pushw	x
 879       00000000      OFST:	set	0
 882                     ; 235     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 884  0273 a34800        	cpw	x,#18432
 885  0276 2508          	jrult	L021
 886  0278 a34880        	cpw	x,#18560
 887  027b 2403          	jruge	L021
 888  027d 4f            	clr	a
 889  027e 2010          	jra	L221
 890  0280               L021:
 891  0280 ae00eb        	ldw	x,#235
 892  0283 89            	pushw	x
 893  0284 ae0000        	ldw	x,#0
 894  0287 89            	pushw	x
 895  0288 ae0010        	ldw	x,#L73
 896  028b cd0000        	call	_assert_failed
 898  028e 5b04          	addw	sp,#4
 899  0290               L221:
 900                     ; 238     FLASH->CR2 |= FLASH_CR2_OPT;
 902  0290 721e505b      	bset	20571,#7
 903                     ; 239     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 905  0294 721f505c      	bres	20572,#7
 906                     ; 242     if (Address == 0x4800)
 908  0298 1e01          	ldw	x,(OFST+1,sp)
 909  029a a34800        	cpw	x,#18432
 910  029d 2607          	jrne	L742
 911                     ; 245        *((NEAR uint8_t*)Address) = Data;
 913  029f 7b05          	ld	a,(OFST+5,sp)
 914  02a1 1e01          	ldw	x,(OFST+1,sp)
 915  02a3 f7            	ld	(x),a
 917  02a4 200c          	jra	L152
 918  02a6               L742:
 919                     ; 250        *((NEAR uint8_t*)Address) = Data;
 921  02a6 7b05          	ld	a,(OFST+5,sp)
 922  02a8 1e01          	ldw	x,(OFST+1,sp)
 923  02aa f7            	ld	(x),a
 924                     ; 251        *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 926  02ab 7b05          	ld	a,(OFST+5,sp)
 927  02ad 43            	cpl	a
 928  02ae 1e01          	ldw	x,(OFST+1,sp)
 929  02b0 e701          	ld	(1,x),a
 930  02b2               L152:
 931                     ; 253     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 933  02b2 a6fd          	ld	a,#253
 934  02b4 cd045f        	call	_FLASH_WaitForLastOperation
 936                     ; 256     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 938  02b7 721f505b      	bres	20571,#7
 939                     ; 257     FLASH->NCR2 |= FLASH_NCR2_NOPT;
 941  02bb 721e505c      	bset	20572,#7
 942                     ; 258 }
 945  02bf 85            	popw	x
 946  02c0 81            	ret
 983                     ; 265 void FLASH_EraseOptionByte(uint16_t Address)
 983                     ; 266 {
 984                     	switch	.text
 985  02c1               _FLASH_EraseOptionByte:
 987  02c1 89            	pushw	x
 988       00000000      OFST:	set	0
 991                     ; 268     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 993  02c2 a34800        	cpw	x,#18432
 994  02c5 2508          	jrult	L621
 995  02c7 a34880        	cpw	x,#18560
 996  02ca 2403          	jruge	L621
 997  02cc 4f            	clr	a
 998  02cd 2010          	jra	L031
 999  02cf               L621:
1000  02cf ae010c        	ldw	x,#268
1001  02d2 89            	pushw	x
1002  02d3 ae0000        	ldw	x,#0
1003  02d6 89            	pushw	x
1004  02d7 ae0010        	ldw	x,#L73
1005  02da cd0000        	call	_assert_failed
1007  02dd 5b04          	addw	sp,#4
1008  02df               L031:
1009                     ; 271     FLASH->CR2 |= FLASH_CR2_OPT;
1011  02df 721e505b      	bset	20571,#7
1012                     ; 272     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
1014  02e3 721f505c      	bres	20572,#7
1015                     ; 275      if (Address == 0x4800)
1017  02e7 1e01          	ldw	x,(OFST+1,sp)
1018  02e9 a34800        	cpw	x,#18432
1019  02ec 2605          	jrne	L172
1020                     ; 278        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
1022  02ee 1e01          	ldw	x,(OFST+1,sp)
1023  02f0 7f            	clr	(x)
1025  02f1 2009          	jra	L372
1026  02f3               L172:
1027                     ; 283        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
1029  02f3 1e01          	ldw	x,(OFST+1,sp)
1030  02f5 7f            	clr	(x)
1031                     ; 284        *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
1033  02f6 1e01          	ldw	x,(OFST+1,sp)
1034  02f8 a6ff          	ld	a,#255
1035  02fa e701          	ld	(1,x),a
1036  02fc               L372:
1037                     ; 286     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
1039  02fc a6fd          	ld	a,#253
1040  02fe cd045f        	call	_FLASH_WaitForLastOperation
1042                     ; 289     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
1044  0301 721f505b      	bres	20571,#7
1045                     ; 290     FLASH->NCR2 |= FLASH_NCR2_NOPT;
1047  0305 721e505c      	bset	20572,#7
1048                     ; 291 }
1051  0309 85            	popw	x
1052  030a 81            	ret
1116                     ; 297 uint16_t FLASH_ReadOptionByte(uint16_t Address)
1116                     ; 298 {
1117                     	switch	.text
1118  030b               _FLASH_ReadOptionByte:
1120  030b 89            	pushw	x
1121  030c 5204          	subw	sp,#4
1122       00000004      OFST:	set	4
1125                     ; 299     uint8_t value_optbyte, value_optbyte_complement = 0;
1127  030e 7b01          	ld	a,(OFST-3,sp)
1128  0310 97            	ld	xl,a
1129                     ; 300     uint16_t res_value = 0;
1131  0311 1e03          	ldw	x,(OFST-1,sp)
1132                     ; 303     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
1134  0313 1e05          	ldw	x,(OFST+1,sp)
1135  0315 a34800        	cpw	x,#18432
1136  0318 250a          	jrult	L431
1137  031a 1e05          	ldw	x,(OFST+1,sp)
1138  031c a34880        	cpw	x,#18560
1139  031f 2403          	jruge	L431
1140  0321 4f            	clr	a
1141  0322 2010          	jra	L631
1142  0324               L431:
1143  0324 ae012f        	ldw	x,#303
1144  0327 89            	pushw	x
1145  0328 ae0000        	ldw	x,#0
1146  032b 89            	pushw	x
1147  032c ae0010        	ldw	x,#L73
1148  032f cd0000        	call	_assert_failed
1150  0332 5b04          	addw	sp,#4
1151  0334               L631:
1152                     ; 306     value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
1154  0334 1e05          	ldw	x,(OFST+1,sp)
1155  0336 f6            	ld	a,(x)
1156  0337 6b02          	ld	(OFST-2,sp),a
1157                     ; 307     value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
1159  0339 1e05          	ldw	x,(OFST+1,sp)
1160  033b e601          	ld	a,(1,x)
1161  033d 6b01          	ld	(OFST-3,sp),a
1162                     ; 310     if (Address == 0x4800)	 
1164  033f 1e05          	ldw	x,(OFST+1,sp)
1165  0341 a34800        	cpw	x,#18432
1166  0344 2608          	jrne	L723
1167                     ; 312         res_value =	 value_optbyte;
1169  0346 7b02          	ld	a,(OFST-2,sp)
1170  0348 5f            	clrw	x
1171  0349 97            	ld	xl,a
1172  034a 1f03          	ldw	(OFST-1,sp),x
1174  034c 2023          	jra	L133
1175  034e               L723:
1176                     ; 316         if (value_optbyte == (uint8_t)(~value_optbyte_complement))
1178  034e 7b01          	ld	a,(OFST-3,sp)
1179  0350 43            	cpl	a
1180  0351 1102          	cp	a,(OFST-2,sp)
1181  0353 2617          	jrne	L333
1182                     ; 318             res_value = (uint16_t)((uint16_t)value_optbyte << 8);
1184  0355 7b02          	ld	a,(OFST-2,sp)
1185  0357 5f            	clrw	x
1186  0358 97            	ld	xl,a
1187  0359 4f            	clr	a
1188  035a 02            	rlwa	x,a
1189  035b 1f03          	ldw	(OFST-1,sp),x
1190                     ; 319             res_value = res_value | (uint16_t)value_optbyte_complement;
1192  035d 7b01          	ld	a,(OFST-3,sp)
1193  035f 5f            	clrw	x
1194  0360 97            	ld	xl,a
1195  0361 01            	rrwa	x,a
1196  0362 1a04          	or	a,(OFST+0,sp)
1197  0364 01            	rrwa	x,a
1198  0365 1a03          	or	a,(OFST-1,sp)
1199  0367 01            	rrwa	x,a
1200  0368 1f03          	ldw	(OFST-1,sp),x
1202  036a 2005          	jra	L133
1203  036c               L333:
1204                     ; 323             res_value = FLASH_OPTIONBYTE_ERROR;
1206  036c ae5555        	ldw	x,#21845
1207  036f 1f03          	ldw	(OFST-1,sp),x
1208  0371               L133:
1209                     ; 326     return(res_value);
1211  0371 1e03          	ldw	x,(OFST-1,sp)
1214  0373 5b06          	addw	sp,#6
1215  0375 81            	ret
1290                     ; 335 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
1290                     ; 336 {
1291                     	switch	.text
1292  0376               _FLASH_SetLowPowerMode:
1294  0376 88            	push	a
1295       00000000      OFST:	set	0
1298                     ; 338     assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
1300  0377 a104          	cp	a,#4
1301  0379 270b          	jreq	L441
1302  037b a108          	cp	a,#8
1303  037d 2707          	jreq	L441
1304  037f 4d            	tnz	a
1305  0380 2704          	jreq	L441
1306  0382 a10c          	cp	a,#12
1307  0384 2603          	jrne	L241
1308  0386               L441:
1309  0386 4f            	clr	a
1310  0387 2010          	jra	L641
1311  0389               L241:
1312  0389 ae0152        	ldw	x,#338
1313  038c 89            	pushw	x
1314  038d ae0000        	ldw	x,#0
1315  0390 89            	pushw	x
1316  0391 ae0010        	ldw	x,#L73
1317  0394 cd0000        	call	_assert_failed
1319  0397 5b04          	addw	sp,#4
1320  0399               L641:
1321                     ; 341     FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
1323  0399 c6505a        	ld	a,20570
1324  039c a4f3          	and	a,#243
1325  039e c7505a        	ld	20570,a
1326                     ; 344     FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
1328  03a1 c6505a        	ld	a,20570
1329  03a4 1a01          	or	a,(OFST+1,sp)
1330  03a6 c7505a        	ld	20570,a
1331                     ; 345 }
1334  03a9 84            	pop	a
1335  03aa 81            	ret
1394                     ; 353 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1394                     ; 354 {
1395                     	switch	.text
1396  03ab               _FLASH_SetProgrammingTime:
1398  03ab 88            	push	a
1399       00000000      OFST:	set	0
1402                     ; 356     assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1404  03ac 4d            	tnz	a
1405  03ad 2704          	jreq	L451
1406  03af a101          	cp	a,#1
1407  03b1 2603          	jrne	L251
1408  03b3               L451:
1409  03b3 4f            	clr	a
1410  03b4 2010          	jra	L651
1411  03b6               L251:
1412  03b6 ae0164        	ldw	x,#356
1413  03b9 89            	pushw	x
1414  03ba ae0000        	ldw	x,#0
1415  03bd 89            	pushw	x
1416  03be ae0010        	ldw	x,#L73
1417  03c1 cd0000        	call	_assert_failed
1419  03c4 5b04          	addw	sp,#4
1420  03c6               L651:
1421                     ; 358     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1423  03c6 7211505a      	bres	20570,#0
1424                     ; 359     FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1426  03ca c6505a        	ld	a,20570
1427  03cd 1a01          	or	a,(OFST+1,sp)
1428  03cf c7505a        	ld	20570,a
1429                     ; 360 }
1432  03d2 84            	pop	a
1433  03d3 81            	ret
1458                     ; 367 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1458                     ; 368 {
1459                     	switch	.text
1460  03d4               _FLASH_GetLowPowerMode:
1464                     ; 369     return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1466  03d4 c6505a        	ld	a,20570
1467  03d7 a40c          	and	a,#12
1470  03d9 81            	ret
1495                     ; 377 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1495                     ; 378 {
1496                     	switch	.text
1497  03da               _FLASH_GetProgrammingTime:
1501                     ; 379     return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1503  03da c6505a        	ld	a,20570
1504  03dd a401          	and	a,#1
1507  03df 81            	ret
1541                     ; 387 uint32_t FLASH_GetBootSize(void)
1541                     ; 388 {
1542                     	switch	.text
1543  03e0               _FLASH_GetBootSize:
1545  03e0 5204          	subw	sp,#4
1546       00000004      OFST:	set	4
1549                     ; 389     uint32_t temp = 0;
1551  03e2 ae0000        	ldw	x,#0
1552  03e5 1f03          	ldw	(OFST-1,sp),x
1553  03e7 ae0000        	ldw	x,#0
1554  03ea 1f01          	ldw	(OFST-3,sp),x
1555                     ; 392     temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1557  03ec c6505d        	ld	a,20573
1558  03ef 5f            	clrw	x
1559  03f0 97            	ld	xl,a
1560  03f1 90ae0200      	ldw	y,#512
1561  03f5 cd0000        	call	c_umul
1563  03f8 96            	ldw	x,sp
1564  03f9 1c0001        	addw	x,#OFST-3
1565  03fc cd0000        	call	c_rtol
1567                     ; 395     if (FLASH->FPR == 0xFF)
1569  03ff c6505d        	ld	a,20573
1570  0402 a1ff          	cp	a,#255
1571  0404 2611          	jrne	L554
1572                     ; 397         temp += 512;
1574  0406 ae0200        	ldw	x,#512
1575  0409 bf02          	ldw	c_lreg+2,x
1576  040b ae0000        	ldw	x,#0
1577  040e bf00          	ldw	c_lreg,x
1578  0410 96            	ldw	x,sp
1579  0411 1c0001        	addw	x,#OFST-3
1580  0414 cd0000        	call	c_lgadd
1582  0417               L554:
1583                     ; 401     return(temp);
1585  0417 96            	ldw	x,sp
1586  0418 1c0001        	addw	x,#OFST-3
1587  041b cd0000        	call	c_ltor
1591  041e 5b04          	addw	sp,#4
1592  0420 81            	ret
1702                     ; 412 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1702                     ; 413 {
1703                     	switch	.text
1704  0421               _FLASH_GetFlagStatus:
1706  0421 88            	push	a
1707  0422 88            	push	a
1708       00000001      OFST:	set	1
1711                     ; 414     FlagStatus status = RESET;
1713  0423 0f01          	clr	(OFST+0,sp)
1714                     ; 416     assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1716  0425 a140          	cp	a,#64
1717  0427 2710          	jreq	L271
1718  0429 a108          	cp	a,#8
1719  042b 270c          	jreq	L271
1720  042d a104          	cp	a,#4
1721  042f 2708          	jreq	L271
1722  0431 a102          	cp	a,#2
1723  0433 2704          	jreq	L271
1724  0435 a101          	cp	a,#1
1725  0437 2603          	jrne	L071
1726  0439               L271:
1727  0439 4f            	clr	a
1728  043a 2010          	jra	L471
1729  043c               L071:
1730  043c ae01a0        	ldw	x,#416
1731  043f 89            	pushw	x
1732  0440 ae0000        	ldw	x,#0
1733  0443 89            	pushw	x
1734  0444 ae0010        	ldw	x,#L73
1735  0447 cd0000        	call	_assert_failed
1737  044a 5b04          	addw	sp,#4
1738  044c               L471:
1739                     ; 419     if ((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1741  044c c6505f        	ld	a,20575
1742  044f 1502          	bcp	a,(OFST+1,sp)
1743  0451 2706          	jreq	L725
1744                     ; 421         status = SET; /* FLASH_FLAG is set */
1746  0453 a601          	ld	a,#1
1747  0455 6b01          	ld	(OFST+0,sp),a
1749  0457 2002          	jra	L135
1750  0459               L725:
1751                     ; 425         status = RESET; /* FLASH_FLAG is reset*/
1753  0459 0f01          	clr	(OFST+0,sp)
1754  045b               L135:
1755                     ; 429     return status;
1757  045b 7b01          	ld	a,(OFST+0,sp)
1760  045d 85            	popw	x
1761  045e 81            	ret
1854                     ; 531 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1854                     ; 532 {
1855                     	switch	.text
1856  045f               _FLASH_WaitForLastOperation:
1858  045f 5205          	subw	sp,#5
1859       00000005      OFST:	set	5
1862                     ; 533     uint8_t flagstatus = 0x00;
1864  0461 0f05          	clr	(OFST+0,sp)
1865                     ; 534     uint32_t timeout = OPERATION_TIMEOUT;
1867  0463 aeffff        	ldw	x,#65535
1868  0466 1f03          	ldw	(OFST-2,sp),x
1869  0468 ae000f        	ldw	x,#15
1870  046b 1f01          	ldw	(OFST-4,sp),x
1871                     ; 539     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
1873  046d a1fd          	cp	a,#253
1874  046f 2631          	jrne	L316
1876  0471 2010          	jra	L106
1877  0473               L775:
1878                     ; 543             flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1878                     ; 544                                               FLASH_IAPSR_WR_PG_DIS));
1880  0473 c6505f        	ld	a,20575
1881  0476 a405          	and	a,#5
1882  0478 6b05          	ld	(OFST+0,sp),a
1883                     ; 545             timeout--;
1885  047a 96            	ldw	x,sp
1886  047b 1c0001        	addw	x,#OFST-4
1887  047e a601          	ld	a,#1
1888  0480 cd0000        	call	c_lgsbc
1890  0483               L106:
1891                     ; 541         while ((flagstatus == 0x00) && (timeout != 0x00))
1893  0483 0d05          	tnz	(OFST+0,sp)
1894  0485 2628          	jrne	L706
1896  0487 96            	ldw	x,sp
1897  0488 1c0001        	addw	x,#OFST-4
1898  048b cd0000        	call	c_lzmp
1900  048e 26e3          	jrne	L775
1901  0490 201d          	jra	L706
1902  0492               L116:
1903                     ; 552             flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1903                     ; 553                                               FLASH_IAPSR_WR_PG_DIS));
1905  0492 c6505f        	ld	a,20575
1906  0495 a441          	and	a,#65
1907  0497 6b05          	ld	(OFST+0,sp),a
1908                     ; 554             timeout--;
1910  0499 96            	ldw	x,sp
1911  049a 1c0001        	addw	x,#OFST-4
1912  049d a601          	ld	a,#1
1913  049f cd0000        	call	c_lgsbc
1915  04a2               L316:
1916                     ; 550         while ((flagstatus == 0x00) && (timeout != 0x00))
1918  04a2 0d05          	tnz	(OFST+0,sp)
1919  04a4 2609          	jrne	L706
1921  04a6 96            	ldw	x,sp
1922  04a7 1c0001        	addw	x,#OFST-4
1923  04aa cd0000        	call	c_lzmp
1925  04ad 26e3          	jrne	L116
1926  04af               L706:
1927                     ; 566     if (timeout == 0x00 )
1929  04af 96            	ldw	x,sp
1930  04b0 1c0001        	addw	x,#OFST-4
1931  04b3 cd0000        	call	c_lzmp
1933  04b6 2604          	jrne	L126
1934                     ; 568         flagstatus = FLASH_STATUS_TIMEOUT;
1936  04b8 a602          	ld	a,#2
1937  04ba 6b05          	ld	(OFST+0,sp),a
1938  04bc               L126:
1939                     ; 571     return((FLASH_Status_TypeDef)flagstatus);
1941  04bc 7b05          	ld	a,(OFST+0,sp)
1944  04be 5b05          	addw	sp,#5
1945  04c0 81            	ret
2009                     ; 581 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
2009                     ; 582 {
2010                     	switch	.text
2011  04c1               _FLASH_EraseBlock:
2013  04c1 89            	pushw	x
2014  04c2 5207          	subw	sp,#7
2015       00000007      OFST:	set	7
2018                     ; 583   uint32_t startaddress = 0;
2020  04c4 96            	ldw	x,sp
2021  04c5 1c0001        	addw	x,#OFST-6
2022  04c8 cd0000        	call	c_ltor
2024                     ; 593   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
2026  04cb 7b0c          	ld	a,(OFST+5,sp)
2027  04cd a1fd          	cp	a,#253
2028  04cf 2706          	jreq	L402
2029  04d1 7b0c          	ld	a,(OFST+5,sp)
2030  04d3 a1f7          	cp	a,#247
2031  04d5 2603          	jrne	L202
2032  04d7               L402:
2033  04d7 4f            	clr	a
2034  04d8 2010          	jra	L602
2035  04da               L202:
2036  04da ae0251        	ldw	x,#593
2037  04dd 89            	pushw	x
2038  04de ae0000        	ldw	x,#0
2039  04e1 89            	pushw	x
2040  04e2 ae0010        	ldw	x,#L73
2041  04e5 cd0000        	call	_assert_failed
2043  04e8 5b04          	addw	sp,#4
2044  04ea               L602:
2045                     ; 594   if (FLASH_MemType == FLASH_MEMTYPE_PROG)
2047  04ea 7b0c          	ld	a,(OFST+5,sp)
2048  04ec a1fd          	cp	a,#253
2049  04ee 2626          	jrne	L556
2050                     ; 596       assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
2052  04f0 1e08          	ldw	x,(OFST+1,sp)
2053  04f2 a30400        	cpw	x,#1024
2054  04f5 2403          	jruge	L012
2055  04f7 4f            	clr	a
2056  04f8 2010          	jra	L212
2057  04fa               L012:
2058  04fa ae0254        	ldw	x,#596
2059  04fd 89            	pushw	x
2060  04fe ae0000        	ldw	x,#0
2061  0501 89            	pushw	x
2062  0502 ae0010        	ldw	x,#L73
2063  0505 cd0000        	call	_assert_failed
2065  0508 5b04          	addw	sp,#4
2066  050a               L212:
2067                     ; 597       startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
2069  050a ae8000        	ldw	x,#32768
2070  050d 1f03          	ldw	(OFST-4,sp),x
2071  050f ae0000        	ldw	x,#0
2072  0512 1f01          	ldw	(OFST-6,sp),x
2074  0514 2024          	jra	L756
2075  0516               L556:
2076                     ; 601       assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
2078  0516 1e08          	ldw	x,(OFST+1,sp)
2079  0518 a30010        	cpw	x,#16
2080  051b 2403          	jruge	L412
2081  051d 4f            	clr	a
2082  051e 2010          	jra	L612
2083  0520               L412:
2084  0520 ae0259        	ldw	x,#601
2085  0523 89            	pushw	x
2086  0524 ae0000        	ldw	x,#0
2087  0527 89            	pushw	x
2088  0528 ae0010        	ldw	x,#L73
2089  052b cd0000        	call	_assert_failed
2091  052e 5b04          	addw	sp,#4
2092  0530               L612:
2093                     ; 602       startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2095  0530 ae4000        	ldw	x,#16384
2096  0533 1f03          	ldw	(OFST-4,sp),x
2097  0535 ae0000        	ldw	x,#0
2098  0538 1f01          	ldw	(OFST-6,sp),x
2099  053a               L756:
2100                     ; 607     pwFlash = (PointerAttr uint8_t *)(uint32_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
2102  053a 1e08          	ldw	x,(OFST+1,sp)
2103  053c a680          	ld	a,#128
2104  053e cd0000        	call	c_cmulx
2106  0541 96            	ldw	x,sp
2107  0542 1c0001        	addw	x,#OFST-6
2108  0545 cd0000        	call	c_ladd
2110  0548 450100        	mov	c_x,c_lreg+1
2111  054b be02          	ldw	x,c_lreg+2
2112  054d b600          	ld	a,c_x
2113  054f 6b05          	ld	(OFST-2,sp),a
2114  0551 1f06          	ldw	(OFST-1,sp),x
2115                     ; 614     FLASH->CR2 |= FLASH_CR2_ERASE;
2117  0553 721a505b      	bset	20571,#5
2118                     ; 615     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
2120  0557 721b505c      	bres	20572,#5
2121                     ; 622   *pwFlash = (uint8_t)0;
2123  055b 7b05          	ld	a,(OFST-2,sp)
2124  055d b700          	ld	c_x,a
2125  055f 1e06          	ldw	x,(OFST-1,sp)
2126  0561 bf01          	ldw	c_x+1,x
2127  0563 4f            	clr	a
2128  0564 92bd0000      	ldf	[c_x.e],a
2129                     ; 623   *(pwFlash + 1) = (uint8_t)0;
2131  0568 7b05          	ld	a,(OFST-2,sp)
2132  056a b700          	ld	c_x,a
2133  056c 1e06          	ldw	x,(OFST-1,sp)
2134  056e 90ae0001      	ldw	y,#1
2135  0572 bf01          	ldw	c_x+1,x
2136  0574 93            	ldw	x,y
2137  0575 4f            	clr	a
2138  0576 92a70000      	ldf	([c_x.e],x),a
2139                     ; 624   *(pwFlash + 2) = (uint8_t)0;
2141  057a 7b05          	ld	a,(OFST-2,sp)
2142  057c b700          	ld	c_x,a
2143  057e 1e06          	ldw	x,(OFST-1,sp)
2144  0580 90ae0002      	ldw	y,#2
2145  0584 bf01          	ldw	c_x+1,x
2146  0586 93            	ldw	x,y
2147  0587 4f            	clr	a
2148  0588 92a70000      	ldf	([c_x.e],x),a
2149                     ; 625   *(pwFlash + 3) = (uint8_t)0;    
2151  058c 7b05          	ld	a,(OFST-2,sp)
2152  058e b700          	ld	c_x,a
2153  0590 1e06          	ldw	x,(OFST-1,sp)
2154  0592 90ae0003      	ldw	y,#3
2155  0596 bf01          	ldw	c_x+1,x
2156  0598 93            	ldw	x,y
2157  0599 4f            	clr	a
2158  059a 92a70000      	ldf	([c_x.e],x),a
2159                     ; 627 }
2162  059e 5b09          	addw	sp,#9
2163  05a0 81            	ret
2268                     ; 638 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
2268                     ; 639                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
2268                     ; 640 {
2269                     	switch	.text
2270  05a1               _FLASH_ProgramBlock:
2272  05a1 89            	pushw	x
2273  05a2 5206          	subw	sp,#6
2274       00000006      OFST:	set	6
2277                     ; 641     uint16_t Count = 0;
2279  05a4 1e05          	ldw	x,(OFST-1,sp)
2280                     ; 642     uint32_t startaddress = 0;
2282  05a6 96            	ldw	x,sp
2283  05a7 1c0001        	addw	x,#OFST-5
2284  05aa cd0000        	call	c_ltor
2286                     ; 645     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
2288  05ad 7b0b          	ld	a,(OFST+5,sp)
2289  05af a1fd          	cp	a,#253
2290  05b1 2706          	jreq	L422
2291  05b3 7b0b          	ld	a,(OFST+5,sp)
2292  05b5 a1f7          	cp	a,#247
2293  05b7 2603          	jrne	L222
2294  05b9               L422:
2295  05b9 4f            	clr	a
2296  05ba 2010          	jra	L622
2297  05bc               L222:
2298  05bc ae0285        	ldw	x,#645
2299  05bf 89            	pushw	x
2300  05c0 ae0000        	ldw	x,#0
2301  05c3 89            	pushw	x
2302  05c4 ae0010        	ldw	x,#L73
2303  05c7 cd0000        	call	_assert_failed
2305  05ca 5b04          	addw	sp,#4
2306  05cc               L622:
2307                     ; 646     assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
2309  05cc 0d0c          	tnz	(OFST+6,sp)
2310  05ce 2706          	jreq	L232
2311  05d0 7b0c          	ld	a,(OFST+6,sp)
2312  05d2 a110          	cp	a,#16
2313  05d4 2603          	jrne	L032
2314  05d6               L232:
2315  05d6 4f            	clr	a
2316  05d7 2010          	jra	L432
2317  05d9               L032:
2318  05d9 ae0286        	ldw	x,#646
2319  05dc 89            	pushw	x
2320  05dd ae0000        	ldw	x,#0
2321  05e0 89            	pushw	x
2322  05e1 ae0010        	ldw	x,#L73
2323  05e4 cd0000        	call	_assert_failed
2325  05e7 5b04          	addw	sp,#4
2326  05e9               L432:
2327                     ; 647     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
2329  05e9 7b0b          	ld	a,(OFST+5,sp)
2330  05eb a1fd          	cp	a,#253
2331  05ed 2626          	jrne	L337
2332                     ; 649         assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
2334  05ef 1e07          	ldw	x,(OFST+1,sp)
2335  05f1 a30400        	cpw	x,#1024
2336  05f4 2403          	jruge	L632
2337  05f6 4f            	clr	a
2338  05f7 2010          	jra	L042
2339  05f9               L632:
2340  05f9 ae0289        	ldw	x,#649
2341  05fc 89            	pushw	x
2342  05fd ae0000        	ldw	x,#0
2343  0600 89            	pushw	x
2344  0601 ae0010        	ldw	x,#L73
2345  0604 cd0000        	call	_assert_failed
2347  0607 5b04          	addw	sp,#4
2348  0609               L042:
2349                     ; 650         startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
2351  0609 ae8000        	ldw	x,#32768
2352  060c 1f03          	ldw	(OFST-3,sp),x
2353  060e ae0000        	ldw	x,#0
2354  0611 1f01          	ldw	(OFST-5,sp),x
2356  0613 2024          	jra	L537
2357  0615               L337:
2358                     ; 654         assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
2360  0615 1e07          	ldw	x,(OFST+1,sp)
2361  0617 a30010        	cpw	x,#16
2362  061a 2403          	jruge	L242
2363  061c 4f            	clr	a
2364  061d 2010          	jra	L442
2365  061f               L242:
2366  061f ae028e        	ldw	x,#654
2367  0622 89            	pushw	x
2368  0623 ae0000        	ldw	x,#0
2369  0626 89            	pushw	x
2370  0627 ae0010        	ldw	x,#L73
2371  062a cd0000        	call	_assert_failed
2373  062d 5b04          	addw	sp,#4
2374  062f               L442:
2375                     ; 655         startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
2377  062f ae4000        	ldw	x,#16384
2378  0632 1f03          	ldw	(OFST-3,sp),x
2379  0634 ae0000        	ldw	x,#0
2380  0637 1f01          	ldw	(OFST-5,sp),x
2381  0639               L537:
2382                     ; 659     startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
2384  0639 1e07          	ldw	x,(OFST+1,sp)
2385  063b a680          	ld	a,#128
2386  063d cd0000        	call	c_cmulx
2388  0640 96            	ldw	x,sp
2389  0641 1c0001        	addw	x,#OFST-5
2390  0644 cd0000        	call	c_lgadd
2392                     ; 662     if (FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
2394  0647 0d0c          	tnz	(OFST+6,sp)
2395  0649 260a          	jrne	L737
2396                     ; 665         FLASH->CR2 |= FLASH_CR2_PRG;
2398  064b 7210505b      	bset	20571,#0
2399                     ; 666         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
2401  064f 7211505c      	bres	20572,#0
2403  0653 2008          	jra	L147
2404  0655               L737:
2405                     ; 671         FLASH->CR2 |= FLASH_CR2_FPRG;
2407  0655 7218505b      	bset	20571,#4
2408                     ; 672         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
2410  0659 7219505c      	bres	20572,#4
2411  065d               L147:
2412                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2414  065d 5f            	clrw	x
2415  065e 1f05          	ldw	(OFST-1,sp),x
2416  0660               L347:
2417                     ; 680   *((PointerAttr uint8_t*) (uint16_t)startaddress + Count) = ((uint8_t)(Buffer[Count]));
2419  0660 7b03          	ld	a,(OFST-3,sp)
2420  0662 97            	ld	xl,a
2421  0663 7b04          	ld	a,(OFST-2,sp)
2422  0665 3f00          	clr	c_x
2423  0667 02            	rlwa	x,a
2424  0668 9093          	ldw	y,x
2425  066a 1605          	ldw	y,(OFST-1,sp)
2426  066c bf01          	ldw	c_x+1,x
2427  066e 93            	ldw	x,y
2428  066f 160d          	ldw	y,(OFST+7,sp)
2429  0671 72f905        	addw	y,(OFST-1,sp)
2430  0674 90f6          	ld	a,(y)
2431  0676 92a70000      	ldf	([c_x.e],x),a
2432                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
2434  067a 1e05          	ldw	x,(OFST-1,sp)
2435  067c 1c0001        	addw	x,#1
2436  067f 1f05          	ldw	(OFST-1,sp),x
2439  0681 1e05          	ldw	x,(OFST-1,sp)
2440  0683 a30080        	cpw	x,#128
2441  0686 25d8          	jrult	L347
2442                     ; 685 }
2445  0688 5b08          	addw	sp,#8
2446  068a 81            	ret
2459                     	xdef	_FLASH_WaitForLastOperation
2460                     	xdef	_FLASH_ProgramBlock
2461                     	xdef	_FLASH_EraseBlock
2462                     	xdef	_FLASH_GetFlagStatus
2463                     	xdef	_FLASH_GetBootSize
2464                     	xdef	_FLASH_GetProgrammingTime
2465                     	xdef	_FLASH_GetLowPowerMode
2466                     	xdef	_FLASH_SetProgrammingTime
2467                     	xdef	_FLASH_SetLowPowerMode
2468                     	xdef	_FLASH_EraseOptionByte
2469                     	xdef	_FLASH_ProgramOptionByte
2470                     	xdef	_FLASH_ReadOptionByte
2471                     	xdef	_FLASH_ProgramWord
2472                     	xdef	_FLASH_ReadByte
2473                     	xdef	_FLASH_ProgramByte
2474                     	xdef	_FLASH_EraseByte
2475                     	xdef	_FLASH_ITConfig
2476                     	xdef	_FLASH_DeInit
2477                     	xdef	_FLASH_Lock
2478                     	xdef	_FLASH_Unlock
2479                     	xref	_assert_failed
2480                     	switch	.const
2481  0010               L73:
2482  0010 66776c69625c  	dc.b	"fwlib\src\stm8s_fl"
2483  0022 6173682e6300  	dc.b	"ash.c",0
2484                     	xref.b	c_lreg
2485                     	xref.b	c_x
2505                     	xref	c_ladd
2506                     	xref	c_cmulx
2507                     	xref	c_lzmp
2508                     	xref	c_lgsbc
2509                     	xref	c_lgadd
2510                     	xref	c_rtol
2511                     	xref	c_umul
2512                     	xref	c_lcmp
2513                     	xref	c_ltor
2514                     	end
