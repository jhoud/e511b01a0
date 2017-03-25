   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  35                     ; 3 void LedInit(void) {
  37                     	switch	.text
  38  0000               _LedInit:
  42                     ; 4     GPIO_Init(GPIOC, GPIO_PIN_3 | GPIO_PIN_5 | GPIO_PIN_1, GPIO_MODE_OUT_PP_LOW_FAST);
  44  0000 4be0          	push	#224
  45  0002 4b2a          	push	#42
  46  0004 ae500a        	ldw	x,#20490
  47  0007 cd0000        	call	_GPIO_Init
  49  000a 85            	popw	x
  50                     ; 5     GPIO_WriteLow(GPIOC, GPIO_PIN_3 | GPIO_PIN_5);
  52  000b 4b28          	push	#40
  53  000d ae500a        	ldw	x,#20490
  54  0010 cd0000        	call	_GPIO_WriteLow
  56  0013 84            	pop	a
  57                     ; 6     GPIO_WriteHigh(GPIOC, GPIO_PIN_1);
  59  0014 4b02          	push	#2
  60  0016 ae500a        	ldw	x,#20490
  61  0019 cd0000        	call	_GPIO_WriteHigh
  63  001c 84            	pop	a
  64                     ; 7     GPIO_Init(GPIOE, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST);
  66  001d 4be0          	push	#224
  67  001f 4b20          	push	#32
  68  0021 ae5014        	ldw	x,#20500
  69  0024 cd0000        	call	_GPIO_Init
  71  0027 85            	popw	x
  72                     ; 8     GPIO_WriteHigh(GPIOE, GPIO_PIN_5);
  74  0028 4b20          	push	#32
  75  002a ae5014        	ldw	x,#20500
  76  002d cd0000        	call	_GPIO_WriteHigh
  78  0030 84            	pop	a
  79                     ; 9 }
  82  0031 81            	ret
 118                     ; 11 void LedOn(int index) {
 119                     	switch	.text
 120  0032               _LedOn:
 124                     ; 12     switch(index) {
 127                     ; 24             break;
 128  0032 5d            	tnzw	x
 129  0033 270b          	jreq	L12
 130  0035 5a            	decw	x
 131  0036 2713          	jreq	L32
 132  0038 5a            	decw	x
 133  0039 271b          	jreq	L52
 134  003b 5a            	decw	x
 135  003c 2723          	jreq	L72
 136  003e 202a          	jra	L15
 137  0040               L12:
 138                     ; 13         case LED_UP:
 138                     ; 14             GPIO_WriteHigh(GPIOC, GPIO_PIN_3);
 140  0040 4b08          	push	#8
 141  0042 ae500a        	ldw	x,#20490
 142  0045 cd0000        	call	_GPIO_WriteHigh
 144  0048 84            	pop	a
 145                     ; 15             break;
 147  0049 201f          	jra	L15
 148  004b               L32:
 149                     ; 16         case LED_DN:
 149                     ; 17             GPIO_WriteHigh(GPIOC, GPIO_PIN_5);
 151  004b 4b20          	push	#32
 152  004d ae500a        	ldw	x,#20490
 153  0050 cd0000        	call	_GPIO_WriteHigh
 155  0053 84            	pop	a
 156                     ; 18             break;
 158  0054 2014          	jra	L15
 159  0056               L52:
 160                     ; 19         case LED_S1:
 160                     ; 20             GPIO_WriteLow(GPIOC, GPIO_PIN_1);
 162  0056 4b02          	push	#2
 163  0058 ae500a        	ldw	x,#20490
 164  005b cd0000        	call	_GPIO_WriteLow
 166  005e 84            	pop	a
 167                     ; 21             break;
 169  005f 2009          	jra	L15
 170  0061               L72:
 171                     ; 22         case LED_S2:
 171                     ; 23             GPIO_WriteLow(GPIOE, GPIO_PIN_5);
 173  0061 4b20          	push	#32
 174  0063 ae5014        	ldw	x,#20500
 175  0066 cd0000        	call	_GPIO_WriteLow
 177  0069 84            	pop	a
 178                     ; 24             break;
 180  006a               L15:
 181                     ; 26 }
 184  006a 81            	ret
 220                     ; 28 void LedOff(int index) {
 221                     	switch	.text
 222  006b               _LedOff:
 226                     ; 29     switch(index) {
 229                     ; 41             break;
 230  006b 5d            	tnzw	x
 231  006c 270b          	jreq	L35
 232  006e 5a            	decw	x
 233  006f 2713          	jreq	L55
 234  0071 5a            	decw	x
 235  0072 271b          	jreq	L75
 236  0074 5a            	decw	x
 237  0075 2723          	jreq	L16
 238  0077 202a          	jra	L301
 239  0079               L35:
 240                     ; 30         case LED_UP:
 240                     ; 31             GPIO_WriteLow(GPIOC, GPIO_PIN_3);
 242  0079 4b08          	push	#8
 243  007b ae500a        	ldw	x,#20490
 244  007e cd0000        	call	_GPIO_WriteLow
 246  0081 84            	pop	a
 247                     ; 32             break;
 249  0082 201f          	jra	L301
 250  0084               L55:
 251                     ; 33         case LED_DN:
 251                     ; 34             GPIO_WriteLow(GPIOC, GPIO_PIN_5);
 253  0084 4b20          	push	#32
 254  0086 ae500a        	ldw	x,#20490
 255  0089 cd0000        	call	_GPIO_WriteLow
 257  008c 84            	pop	a
 258                     ; 35             break;
 260  008d 2014          	jra	L301
 261  008f               L75:
 262                     ; 36         case LED_S1:
 262                     ; 37             GPIO_WriteHigh(GPIOC, GPIO_PIN_1);
 264  008f 4b02          	push	#2
 265  0091 ae500a        	ldw	x,#20490
 266  0094 cd0000        	call	_GPIO_WriteHigh
 268  0097 84            	pop	a
 269                     ; 38             break;
 271  0098 2009          	jra	L301
 272  009a               L16:
 273                     ; 39         case LED_S2:
 273                     ; 40             GPIO_WriteHigh(GPIOE, GPIO_PIN_5);
 275  009a 4b20          	push	#32
 276  009c ae5014        	ldw	x,#20500
 277  009f cd0000        	call	_GPIO_WriteHigh
 279  00a2 84            	pop	a
 280                     ; 41             break;
 282  00a3               L301:
 283                     ; 43 }
 286  00a3 81            	ret
 299                     	xdef	_LedOff
 300                     	xdef	_LedOn
 301                     	xdef	_LedInit
 302                     	xref	_GPIO_WriteLow
 303                     	xref	_GPIO_WriteHigh
 304                     	xref	_GPIO_Init
 323                     	end
