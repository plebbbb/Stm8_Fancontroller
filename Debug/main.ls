   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  63                     ; 9 void delay_ms(unsigned long int ms) {
  65                     	switch	.text
  66  0000               _delay_ms:
  68  0000 5204          	subw	sp,#4
  69       00000004      OFST:	set	4
  72                     ; 11     for (i = 0; i < ((200000UL / 18 / 1000UL) * ms); i++) {
  74  0002 ae0000        	ldw	x,#0
  75  0005 1f03          	ldw	(OFST-1,sp),x
  76  0007 ae0000        	ldw	x,#0
  77  000a 1f01          	ldw	(OFST-3,sp),x
  80  000c 200a          	jra	L73
  81  000e               L33:
  82                     ; 12         nop();
  85  000e 9d            nop
  87                     ; 11     for (i = 0; i < ((200000UL / 18 / 1000UL) * ms); i++) {
  90  000f 96            	ldw	x,sp
  91  0010 1c0001        	addw	x,#OFST-3
  92  0013 a601          	ld	a,#1
  93  0015 cd0000        	call	c_lgadc
  96  0018               L73:
  99  0018 96            	ldw	x,sp
 100  0019 1c0007        	addw	x,#OFST+3
 101  001c cd0000        	call	c_ltor
 103  001f a60b          	ld	a,#11
 104  0021 cd0000        	call	c_smul
 106  0024 96            	ldw	x,sp
 107  0025 1c0001        	addw	x,#OFST-3
 108  0028 cd0000        	call	c_lcmp
 110  002b 22e1          	jrugt	L33
 111                     ; 14 }
 114  002d 5b04          	addw	sp,#4
 115  002f 81            	ret
 143                     ; 17 void serial_init(void){
 144                     	switch	.text
 145  0030               _serial_init:
 149                     ; 18 	 CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
 151  0030 4f            	clr	a
 152  0031 cd0000        	call	_CLK_SYSCLKDivConfig
 154                     ; 19 	CLK_PeripheralClockConfig(CLK_Peripheral_USART1,ENABLE);
 156  0034 ae0501        	ldw	x,#1281
 157  0037 cd0000        	call	_CLK_PeripheralClockConfig
 159                     ; 20 	USART_DeInit(USART1);
 161  003a ae5230        	ldw	x,#21040
 162  003d cd0000        	call	_USART_DeInit
 164                     ; 21 	USART_Init(USART1,9600, USART_WordLength_8b, USART_StopBits_1, USART_Parity_No,USART_Mode_Tx);
 166  0040 4b08          	push	#8
 167  0042 4b00          	push	#0
 168  0044 4b00          	push	#0
 169  0046 4b00          	push	#0
 170  0048 ae2580        	ldw	x,#9600
 171  004b 89            	pushw	x
 172  004c ae0000        	ldw	x,#0
 173  004f 89            	pushw	x
 174  0050 ae5230        	ldw	x,#21040
 175  0053 cd0000        	call	_USART_Init
 177  0056 5b08          	addw	sp,#8
 178                     ; 22 	USART_Cmd(USART1, ENABLE);
 180  0058 4b01          	push	#1
 181  005a ae5230        	ldw	x,#21040
 182  005d cd0000        	call	_USART_Cmd
 184  0060 84            	pop	a
 185                     ; 23 }
 188  0061 81            	ret
 260                     ; 28 void main(){
 261                     	switch	.text
 262  0062               _main:
 264  0062 5203          	subw	sp,#3
 265       00000003      OFST:	set	3
 268                     ; 30 	uint16_t c = 30;
 270                     ; 31 	bool e = 0;
 272                     ; 32 	GPIO_Init(GPIOA, GPIO_Pin_5, GPIO_Mode_Out_PP_Low_Slow);
 274  0064 4bc0          	push	#192
 275  0066 4b20          	push	#32
 276  0068 ae5000        	ldw	x,#20480
 277  006b cd0000        	call	_GPIO_Init
 279  006e 85            	popw	x
 280                     ; 33 	GPIO_Init(GPIOC, GPIO_Pin_3, GPIO_Mode_Out_PP_Low_Fast);
 282  006f 4be0          	push	#224
 283  0071 4b08          	push	#8
 284  0073 ae500a        	ldw	x,#20490
 285  0076 cd0000        	call	_GPIO_Init
 287  0079 85            	popw	x
 288                     ; 36 	serial_init();
 290  007a adb4          	call	_serial_init
 292                     ; 41 	pwm_control_init(2);
 294  007c ae0002        	ldw	x,#2
 295  007f cd0000        	call	_pwm_control_init
 297                     ; 42 	v_control_init();
 299  0082 cd0000        	call	_v_control_init
 301                     ; 43 	v_control_active(1);
 303  0085 a601          	ld	a,#1
 304  0087 cd0000        	call	_v_control_active
 306  008a               L501:
 307                     ; 47 		GPIO_WriteBit(GPIOA, GPIO_Pin_5, SET);
 309  008a 4b01          	push	#1
 310  008c 4b20          	push	#32
 311  008e ae5000        	ldw	x,#20480
 312  0091 cd0000        	call	_GPIO_WriteBit
 314  0094 85            	popw	x
 315                     ; 48 		delay_ms(50);
 317  0095 ae0032        	ldw	x,#50
 318  0098 89            	pushw	x
 319  0099 ae0000        	ldw	x,#0
 320  009c 89            	pushw	x
 321  009d cd0000        	call	_delay_ms
 323  00a0 5b04          	addw	sp,#4
 324                     ; 49 		USART_SendData8(USART1, 0x48);
 326  00a2 4b48          	push	#72
 327  00a4 ae5230        	ldw	x,#21040
 328  00a7 cd0000        	call	_USART_SendData8
 330  00aa 84            	pop	a
 332  00ab 20dd          	jra	L501
 345                     	xdef	_main
 346                     	xdef	_serial_init
 347                     	xdef	_delay_ms
 348                     	xref	_pwm_control_init
 349                     	xref	_v_control_active
 350                     	xref	_v_control_init
 351                     	xref	_USART_SendData8
 352                     	xref	_USART_Cmd
 353                     	xref	_USART_Init
 354                     	xref	_USART_DeInit
 355                     	xref	_GPIO_WriteBit
 356                     	xref	_GPIO_Init
 357                     	xref	_CLK_PeripheralClockConfig
 358                     	xref	_CLK_SYSCLKDivConfig
 377                     	xref	c_lcmp
 378                     	xref	c_smul
 379                     	xref	c_ltor
 380                     	xref	c_lgadc
 381                     	end
