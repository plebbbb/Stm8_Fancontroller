   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  60                     ; 7 void pwm_control_init(uint16_t port){
  62                     	switch	.text
  63  0000               _pwm_control_init:
  65  0000 89            	pushw	x
  66       00000000      OFST:	set	0
  69                     ; 8 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, ENABLE);
  71  0001 ae1101        	ldw	x,#4353
  72  0004 cd0000        	call	_CLK_PeripheralClockConfig
  74                     ; 9 	TIM1_TimeBaseInit(0, TIM1_CounterMode_Up, 12582, 0); //~25khz from 12582 based on getting ~4800hz from 65536. This frequency is probably off spec.
  76  0007 4b00          	push	#0
  77  0009 ae3126        	ldw	x,#12582
  78  000c 89            	pushw	x
  79  000d 4b00          	push	#0
  80  000f 5f            	clrw	x
  81  0010 cd0000        	call	_TIM1_TimeBaseInit
  83  0013 5b04          	addw	sp,#4
  84                     ; 11 	switch (port){
  86  0015 1e01          	ldw	x,(OFST+1,sp)
  88                     ; 25 			break;
  89  0017 1d0002        	subw	x,#2
  90  001a 2705          	jreq	L3
  91  001c 5a            	decw	x
  92  001d 2723          	jreq	L5
  93  001f 2040          	jra	L53
  94  0021               L3:
  95                     ; 12 		case 2: //timer 1 channel 1, pin D2
  95                     ; 13 			GPIO_Init(GPIOD, GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast);
  97  0021 4be0          	push	#224
  98  0023 4b10          	push	#16
  99  0025 ae500f        	ldw	x,#20495
 100  0028 cd0000        	call	_GPIO_Init
 102  002b 85            	popw	x
 103                     ; 14 			TIM1_OC1Init(TIM1_OCMode_PWM2, TIM1_OutputState_Enable, TIM1_OutputNState_Disable, 0, TIM1_OCPolarity_Low, TIM1_OCNPolarity_Low, TIM1_OCIdleState_Set, TIM1_OCNIdleState_Set);
 105  002c 4b2a          	push	#42
 106  002e 4b55          	push	#85
 107  0030 4b88          	push	#136
 108  0032 4b22          	push	#34
 109  0034 5f            	clrw	x
 110  0035 89            	pushw	x
 111  0036 4b00          	push	#0
 112  0038 ae7011        	ldw	x,#28689
 113  003b cd0000        	call	_TIM1_OC1Init
 115  003e 5b07          	addw	sp,#7
 116                     ; 18 			break;
 118  0040 201f          	jra	L53
 119  0042               L5:
 120                     ; 19 		case 3: //timer 1 channel 2, pin D4
 120                     ; 20 			GPIO_Init(GPIOD, GPIO_Pin_2, GPIO_Mode_Out_PP_Low_Fast);
 122  0042 4be0          	push	#224
 123  0044 4b04          	push	#4
 124  0046 ae500f        	ldw	x,#20495
 125  0049 cd0000        	call	_GPIO_Init
 127  004c 85            	popw	x
 128                     ; 21 			TIM1_OC2Init(TIM1_OCMode_PWM2, TIM1_OutputState_Enable, TIM1_OutputNState_Disable, 0, TIM1_OCPolarity_Low, TIM1_OCNPolarity_Low, TIM1_OCIdleState_Set, TIM1_OCNIdleState_Set);
 130  004d 4b2a          	push	#42
 131  004f 4b55          	push	#85
 132  0051 4b88          	push	#136
 133  0053 4b22          	push	#34
 134  0055 5f            	clrw	x
 135  0056 89            	pushw	x
 136  0057 4b00          	push	#0
 137  0059 ae7011        	ldw	x,#28689
 138  005c cd0000        	call	_TIM1_OC2Init
 140  005f 5b07          	addw	sp,#7
 141                     ; 25 			break;
 143  0061               L53:
 144                     ; 27 	TIM1_CtrlPWMOutputs(ENABLE);
 146  0061 a601          	ld	a,#1
 147  0063 cd0000        	call	_TIM1_CtrlPWMOutputs
 149                     ; 28 	TIM1_Cmd(ENABLE);
 151  0066 a601          	ld	a,#1
 152  0068 cd0000        	call	_TIM1_Cmd
 154                     ; 29 }
 157  006b 85            	popw	x
 158  006c 81            	ret
 204                     ; 31 void pwm_control_setoutput(uint16_t port, uint16_t duty_cycle){
 205                     	switch	.text
 206  006d               _pwm_control_setoutput:
 208  006d 89            	pushw	x
 209       00000000      OFST:	set	0
 212                     ; 32 	if (duty_cycle > 12582) return;
 214  006e 1e05          	ldw	x,(OFST+5,sp)
 215  0070 a33127        	cpw	x,#12583
 216  0073 2430          	jruge	L01
 219                     ; 34 	switch (port){
 221  0075 1e01          	ldw	x,(OFST+1,sp)
 223                     ; 47 			break;
 224  0077 1d0002        	subw	x,#2
 225  007a 2705          	jreq	L73
 226  007c 5a            	decw	x
 227  007d 2715          	jreq	L14
 228  007f 2024          	jra	L17
 229  0081               L73:
 230                     ; 35 		case 2:
 230                     ; 36 	//		pwm_controller_port2.output_value = duty_cycle;
 230                     ; 37 	//		pwm_controller_port2.output_value_raw = duty_cycle * 125.82; // 12582/100
 230                     ; 38 	//		TIM1_SetCompare1(pwm_controller_port2.output_value_raw);
 230                     ; 39 				TIM1_SetCompare1(duty_cycle * 125.82);
 232  0081 1e05          	ldw	x,(OFST+5,sp)
 233  0083 cd0000        	call	c_uitof
 235  0086 ae0000        	ldw	x,#L77
 236  0089 cd0000        	call	c_fmul
 238  008c cd0000        	call	c_ftoi
 240  008f cd0000        	call	_TIM1_SetCompare1
 242                     ; 40 			break;
 244  0092 2011          	jra	L17
 245  0094               L14:
 246                     ; 41 		case 3:
 246                     ; 42 	//		pwm_controller_port2.output_value = duty_cycle;
 246                     ; 43 	//		pwm_controller_port3.output_value_raw = duty_cycle * 125.82; // 12582/100
 246                     ; 44 	//		TIM1_SetCompare2(pwm_controller_port3.output_value_raw);
 246                     ; 45 				TIM1_SetCompare2(duty_cycle * 125.82);
 248  0094 1e05          	ldw	x,(OFST+5,sp)
 249  0096 cd0000        	call	c_uitof
 251  0099 ae0000        	ldw	x,#L77
 252  009c cd0000        	call	c_fmul
 254  009f cd0000        	call	c_ftoi
 256  00a2 cd0000        	call	_TIM1_SetCompare2
 258                     ; 47 			break;
 260  00a5               L17:
 261                     ; 49 }
 262  00a5               L01:
 265  00a5 85            	popw	x
 266  00a6 81            	ret
 279                     	xdef	_pwm_control_setoutput
 280                     	xdef	_pwm_control_init
 281                     	xref	_TIM1_SetCompare2
 282                     	xref	_TIM1_SetCompare1
 283                     	xref	_TIM1_CtrlPWMOutputs
 284                     	xref	_TIM1_OC2Init
 285                     	xref	_TIM1_OC1Init
 286                     	xref	_TIM1_Cmd
 287                     	xref	_TIM1_TimeBaseInit
 288                     	xref	_GPIO_Init
 289                     	xref	_CLK_PeripheralClockConfig
 290                     .const:	section	.text
 291  0000               L77:
 292  0000 42fba3d7      	dc.w	17147,-23593
 293                     	xref.b	c_x
 313                     	xref	c_ftoi
 314                     	xref	c_fmul
 315                     	xref	c_uitof
 316                     	end
