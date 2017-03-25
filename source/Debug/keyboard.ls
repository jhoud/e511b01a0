   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   4                     .const:	section	.text
   5  0000               L3_Keyboards_Pin:
   6  0000 02            	dc.b	2
   7  0001 04            	dc.b	4
   8  0002 08            	dc.b	8
  51                     ; 13 void KeyboardInit(void) {
  53                     	switch	.text
  54  0000               _KeyboardInit:
  56  0000 88            	push	a
  57       00000001      OFST:	set	1
  60                     ; 15 		for(i= 0; i<3; i++) {
  62  0001 0f01          	clr	(OFST+0,sp)
  63  0003               L14:
  64                     ; 16 				GPIO_Init(GPIOC, Keyboards_Pin[i], GPIO_MODE_IN_PU_NO_IT);
  66  0003 4b40          	push	#64
  67  0005 7b02          	ld	a,(OFST+1,sp)
  68  0007 5f            	clrw	x
  69  0008 97            	ld	xl,a
  70  0009 d60000        	ld	a,(L3_Keyboards_Pin,x)
  71  000c 88            	push	a
  72  000d ae500a        	ldw	x,#20490
  73  0010 cd0000        	call	_GPIO_Init
  75  0013 85            	popw	x
  76                     ; 15 		for(i= 0; i<3; i++) {
  78  0014 0c01          	inc	(OFST+0,sp)
  81  0016 7b01          	ld	a,(OFST+0,sp)
  82  0018 a103          	cp	a,#3
  83  001a 25e7          	jrult	L14
  84                     ; 18     for(i=0; i<KEY_COUNT; i++) {
  86  001c 0f01          	clr	(OFST+0,sp)
  87  001e               L74:
  88                     ; 19         KeyboardCnt[i] = 1;
  90  001e 7b01          	ld	a,(OFST+0,sp)
  91  0020 5f            	clrw	x
  92  0021 97            	ld	xl,a
  93  0022 58            	sllw	x
  94  0023 90ae0001      	ldw	y,#1
  95  0027 ef00          	ldw	(L7_KeyboardCnt,x),y
  96                     ; 18     for(i=0; i<KEY_COUNT; i++) {
  98  0029 0c01          	inc	(OFST+0,sp)
 101  002b 7b01          	ld	a,(OFST+0,sp)
 102  002d a103          	cp	a,#3
 103  002f 25ed          	jrult	L74
 104                     ; 21 }
 107  0031 84            	pop	a
 108  0032 81            	ret
 143                     ; 23 int IsKeyPress(int key) {
 144                     	switch	.text
 145  0033               _IsKeyPress:
 147  0033 89            	pushw	x
 148  0034 89            	pushw	x
 149       00000002      OFST:	set	2
 152                     ; 24     if(KeyboardStatus & (1U << key)) {
 154  0035 b606          	ld	a,L5_KeyboardStatus
 155  0037 5f            	clrw	x
 156  0038 97            	ld	xl,a
 157  0039 1f01          	ldw	(OFST-1,sp),x
 158  003b ae0001        	ldw	x,#1
 159  003e 7b04          	ld	a,(OFST+2,sp)
 160  0040 4d            	tnz	a
 161  0041 2704          	jreq	L01
 162  0043               L21:
 163  0043 58            	sllw	x
 164  0044 4a            	dec	a
 165  0045 26fc          	jrne	L21
 166  0047               L01:
 167  0047 01            	rrwa	x,a
 168  0048 1402          	and	a,(OFST+0,sp)
 169  004a 01            	rrwa	x,a
 170  004b 1401          	and	a,(OFST-1,sp)
 171  004d 01            	rrwa	x,a
 172  004e a30000        	cpw	x,#0
 173  0051 2705          	jreq	L37
 174                     ; 25         return 1;
 176  0053 ae0001        	ldw	x,#1
 178  0056 2001          	jra	L41
 179  0058               L37:
 180                     ; 27     return 0;
 182  0058 5f            	clrw	x
 184  0059               L41:
 186  0059 5b04          	addw	sp,#4
 187  005b 81            	ret
 226                     ; 31 void TaskKeyboard(void) {                  //中断处理函数之一
 227                     	switch	.text
 228  005c               _TaskKeyboard:
 230  005c 88            	push	a
 231       00000001      OFST:	set	1
 234                     ; 34     for(i=0; i<KEY_COUNT; i++) {
 236  005d 0f01          	clr	(OFST+0,sp)
 237  005f               L311:
 238                     ; 35         if(!GPIO_ReadInputPin(GPIOC, Keyboards_Pin[i])) {   //按键低电平有效
 240  005f 7b01          	ld	a,(OFST+0,sp)
 241  0061 5f            	clrw	x
 242  0062 97            	ld	xl,a
 243  0063 d60000        	ld	a,(L3_Keyboards_Pin,x)
 244  0066 88            	push	a
 245  0067 ae500a        	ldw	x,#20490
 246  006a cd0000        	call	_GPIO_ReadInputPin
 248  006d 5b01          	addw	sp,#1
 249  006f 4d            	tnz	a
 250  0070 2637          	jrne	L121
 251                     ; 36 						if (KeyboardCnt[i] >= 2) {               //用于去抖
 253  0072 7b01          	ld	a,(OFST+0,sp)
 254  0074 5f            	clrw	x
 255  0075 97            	ld	xl,a
 256  0076 58            	sllw	x
 257  0077 9093          	ldw	y,x
 258  0079 90ee00        	ldw	y,(L7_KeyboardCnt,y)
 259  007c 90a30002      	cpw	y,#2
 260  0080 2506          	jrult	L321
 261                     ; 37                 SetKeyPress(i);
 263  0082 7b01          	ld	a,(OFST+0,sp)
 264  0084 5f            	clrw	x
 265  0085 97            	ld	xl,a
 266  0086 ad6d          	call	L11_SetKeyPress
 268  0088               L321:
 269                     ; 39 						if(KeyboardCnt[i] != (uint16_t) 0xffff) { //(uint8_t)0xff
 271  0088 7b01          	ld	a,(OFST+0,sp)
 272  008a 5f            	clrw	x
 273  008b 97            	ld	xl,a
 274  008c 58            	sllw	x
 275  008d 9093          	ldw	y,x
 276  008f 90ee00        	ldw	y,(L7_KeyboardCnt,y)
 277  0092 90a3ffff      	cpw	y,#65535
 278  0096 2750          	jreq	L721
 279                     ; 40                 KeyboardCnt[i]++;                  //计数器
 281  0098 7b01          	ld	a,(OFST+0,sp)
 282  009a 5f            	clrw	x
 283  009b 97            	ld	xl,a
 284  009c 58            	sllw	x
 285  009d 9093          	ldw	y,x
 286  009f ee00          	ldw	x,(L7_KeyboardCnt,x)
 287  00a1 1c0001        	addw	x,#1
 288  00a4 90ef00        	ldw	(L7_KeyboardCnt,y),x
 289  00a7 203f          	jra	L721
 290  00a9               L121:
 291                     ; 47 						if (KeyboardCnt[i] == 0) {
 293  00a9 7b01          	ld	a,(OFST+0,sp)
 294  00ab 5f            	clrw	x
 295  00ac 97            	ld	xl,a
 296  00ad 58            	sllw	x
 297  00ae e601          	ld	a,(L7_KeyboardCnt+1,x)
 298  00b0 ea00          	or	a,(L7_KeyboardCnt,x)
 299  00b2 2608          	jrne	L131
 300                     ; 48                 ClrKeyPress(i);  
 302  00b4 7b01          	ld	a,(OFST+0,sp)
 303  00b6 5f            	clrw	x
 304  00b7 97            	ld	xl,a
 305  00b8 ad50          	call	L31_ClrKeyPress
 308  00ba 202c          	jra	L721
 309  00bc               L131:
 310                     ; 56 						else if(KeyboardCnt[i] >=2 ){
 312  00bc 7b01          	ld	a,(OFST+0,sp)
 313  00be 5f            	clrw	x
 314  00bf 97            	ld	xl,a
 315  00c0 58            	sllw	x
 316  00c1 9093          	ldw	y,x
 317  00c3 90ee00        	ldw	y,(L7_KeyboardCnt,y)
 318  00c6 90a30002      	cpw	y,#2
 319  00ca 250d          	jrult	L531
 320                     ; 57                 KeyboardCnt[i] = 1;
 322  00cc 7b01          	ld	a,(OFST+0,sp)
 323  00ce 5f            	clrw	x
 324  00cf 97            	ld	xl,a
 325  00d0 58            	sllw	x
 326  00d1 90ae0001      	ldw	y,#1
 327  00d5 ef00          	ldw	(L7_KeyboardCnt,x),y
 329  00d7 200f          	jra	L721
 330  00d9               L531:
 331                     ; 60                 KeyboardCnt[i]--;
 333  00d9 7b01          	ld	a,(OFST+0,sp)
 334  00db 5f            	clrw	x
 335  00dc 97            	ld	xl,a
 336  00dd 58            	sllw	x
 337  00de 9093          	ldw	y,x
 338  00e0 ee00          	ldw	x,(L7_KeyboardCnt,x)
 339  00e2 1d0001        	subw	x,#1
 340  00e5 90ef00        	ldw	(L7_KeyboardCnt,y),x
 341  00e8               L721:
 342                     ; 34     for(i=0; i<KEY_COUNT; i++) {
 344  00e8 0c01          	inc	(OFST+0,sp)
 347  00ea 7b01          	ld	a,(OFST+0,sp)
 348  00ec a103          	cp	a,#3
 349  00ee 2403cc005f    	jrult	L311
 350                     ; 64 }
 353  00f3 84            	pop	a
 354  00f4 81            	ret
 389                     ; 66 static void SetKeyPress(int key) {
 390                     	switch	.text
 391  00f5               L11_SetKeyPress:
 395                     ; 67     KeyboardStatus |= (1U << key);
 397  00f5 9f            	ld	a,xl
 398  00f6 5f            	clrw	x
 399  00f7 4d            	tnz	a
 400  00f8 2a01          	jrpl	L22
 401  00fa 53            	cplw	x
 402  00fb               L22:
 403  00fb 97            	ld	xl,a
 404  00fc a601          	ld	a,#1
 405  00fe 5d            	tnzw	x
 406  00ff 2704          	jreq	L42
 407  0101               L62:
 408  0101 48            	sll	a
 409  0102 5a            	decw	x
 410  0103 26fc          	jrne	L62
 411  0105               L42:
 412  0105 ba06          	or	a,L5_KeyboardStatus
 413  0107 b706          	ld	L5_KeyboardStatus,a
 414                     ; 68 }
 417  0109 81            	ret
 452                     ; 70 static void ClrKeyPress(int key) {
 453                     	switch	.text
 454  010a               L31_ClrKeyPress:
 458                     ; 71     KeyboardStatus &= ~(1U << key);
 460  010a 9f            	ld	a,xl
 461  010b 5f            	clrw	x
 462  010c 4d            	tnz	a
 463  010d 2a01          	jrpl	L23
 464  010f 53            	cplw	x
 465  0110               L23:
 466  0110 97            	ld	xl,a
 467  0111 a601          	ld	a,#1
 468  0113 5d            	tnzw	x
 469  0114 2704          	jreq	L43
 470  0116               L63:
 471  0116 48            	sll	a
 472  0117 5a            	decw	x
 473  0118 26fc          	jrne	L63
 474  011a               L43:
 475  011a 43            	cpl	a
 476  011b b406          	and	a,L5_KeyboardStatus
 477  011d b706          	ld	L5_KeyboardStatus,a
 478                     ; 72 }
 481  011f 81            	ret
 610                     	switch	.ubsct
 611  0000               L7_KeyboardCnt:
 612  0000 000000000000  	ds.b	6
 613  0006               L5_KeyboardStatus:
 614  0006 00            	ds.b	1
 615                     	xdef	_IsKeyPress
 616                     	xdef	_TaskKeyboard
 617                     	xdef	_KeyboardInit
 618                     	xref	_GPIO_ReadInputPin
 619                     	xref	_GPIO_Init
 639                     	end
