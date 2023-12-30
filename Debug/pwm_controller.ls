   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  61                     ; 7 void pwm_control_init(uint16_t port){
  63                     .text:	section	.text,new
  64  0000               _pwm_control_init:
  66  0000 89            	pushw	x
  67       00000000      OFST:	set	0
  70                     ; 8 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, ENABLE);
  72  0001 ae1101        	ldw	x,#4353
  73  0004 cd0000        	call	_CLK_PeripheralClockConfig
  75                     ; 9 	TIM1_TimeBaseInit(0, TIM1_CounterMode_Up, 12582, 0); //~25khz from 12582 based on getting ~4800hz from 65536. This frequency is probably off spec.
  77  0007 4b00          	push	#0
  78  0009 ae3126        	ldw	x,#12582
  79  000c 89            	pushw	x
  80  000d 4b00          	push	#0
  81  000f 5f            	clrw	x
  82  0010 cd0000        	call	_TIM1_TimeBaseInit
  84  0013 5b04          	addw	sp,#4
  85                     ; 11 	switch (port){
  87  0015 1e01          	ldw	x,(OFST+1,sp)
  89                     ; 25 			break;
  90  0017 1d0002        	subw	x,#2
  91  001a 2705          	jreq	L3
  92  001c 5a            	decw	x
  93  001d 2723          	jreq	L5
  94  001f 2040          	jra	L53
  95  0021               L3:
  96                     ; 12 		case 2: //timer 1 channel 1, pin D2
  96                     ; 13 			GPIO_Init(GPIOD, GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast);
  98  0021 4be0          	push	#224
  99  0023 4b10          	push	#16
 100  0025 ae500f        	ldw	x,#20495
 101  0028 cd0000        	call	_GPIO_Init
 103  002b 85            	popw	x
 104                     ; 14 			TIM1_OC1Init(TIM1_OCMode_PWM2, TIM1_OutputState_Enable, TIM1_OutputNState_Disable, 0, TIM1_OCPolarity_Low, TIM1_OCNPolarity_Low, TIM1_OCIdleState_Set, TIM1_OCNIdleState_Set);
 106  002c 4b2a          	push	#42
 107  002e 4b55          	push	#85
 108  0030 4b88          	push	#136
 109  0032 4b22          	push	#34
 110  0034 5f            	clrw	x
 111  0035 89            	pushw	x
 112  0036 4b00          	push	#0
 113  0038 ae7011        	ldw	x,#28689
 114  003b cd0000        	call	_TIM1_OC1Init
 116  003e 5b07          	addw	sp,#7
 117                     ; 18 			break;
 119  0040 201f          	jra	L53
 120  0042               L5:
 121                     ; 19 		case 3: //timer 1 channel 2, pin D4
 121                     ; 20 			GPIO_Init(GPIOD, GPIO_Pin_2, GPIO_Mode_Out_PP_Low_Fast);
 123  0042 4be0          	push	#224
 124  0044 4b04          	push	#4
 125  0046 ae500f        	ldw	x,#20495
 126  0049 cd0000        	call	_GPIO_Init
 128  004c 85            	popw	x
 129                     ; 21 			TIM1_OC2Init(TIM1_OCMode_PWM2, TIM1_OutputState_Enable, TIM1_OutputNState_Disable, 0, TIM1_OCPolarity_Low, TIM1_OCNPolarity_Low, TIM1_OCIdleState_Set, TIM1_OCNIdleState_Set);
 131  004d 4b2a          	push	#42
 132  004f 4b55          	push	#85
 133  0051 4b88          	push	#136
 134  0053 4b22          	push	#34
 135  0055 5f            	clrw	x
 136  0056 89            	pushw	x
 137  0057 4b00          	push	#0
 138  0059 ae7011        	ldw	x,#28689
 139  005c cd0000        	call	_TIM1_OC2Init
 141  005f 5b07          	addw	sp,#7
 142                     ; 25 			break;
 144  0061               L53:
 145                     ; 27 	TIM1_CtrlPWMOutputs(ENABLE);
 147  0061 a601          	ld	a,#1
 148  0063 cd0000        	call	_TIM1_CtrlPWMOutputs
 150                     ; 28 	TIM1_Cmd(ENABLE);
 152  0066 a601          	ld	a,#1
 153  0068 cd0000        	call	_TIM1_Cmd
 155                     ; 29 }
 158  006b 85            	popw	x
 159  006c 81            	ret
 205                     ; 31 void pwm_control_setoutput(uint16_t port, uint16_t duty_cycle){
 206                     .text:	section	.text,new
 207  0000               _pwm_control_setoutput:
 209  0000 89            	pushw	x
 210       00000000      OFST:	set	0
 213                     ; 32 	if (duty_cycle > 12582) return;
 215  0001 1e05          	ldw	x,(OFST+5,sp)
 216  0003 a33127        	cpw	x,#12583
 217  0006 2430          	jruge	L01
 220                     ; 34 	switch (port){
 222  0008 1e01          	ldw	x,(OFST+1,sp)
 224                     ; 47 			break;
 225  000a 1d0002        	subw	x,#2
 226  000d 2705          	jreq	L73
 227  000f 5a            	decw	x
 228  0010 2715          	jreq	L14
 229  0012 2024          	jra	L17
 230  0014               L73:
 231                     ; 35 		case 2:
 231                     ; 36 	//		pwm_controller_port2.output_value = duty_cycle;
 231                     ; 37 	//		pwm_controller_port2.output_value_raw = duty_cycle * 125.82; // 12582/100
 231                     ; 38 	//		TIM1_SetCompare1(pwm_controller_port2.output_value_raw);
 231                     ; 39 				TIM1_SetCompare1(duty_cycle * 125.82);
 233  0014 1e05          	ldw	x,(OFST+5,sp)
 234  0016 cd0000        	call	c_uitof
 236  0019 ae0000        	ldw	x,#L77
 237  001c cd0000        	call	c_fmul
 239  001f cd0000        	call	c_ftoi
 241  0022 cd0000        	call	_TIM1_SetCompare1
 243                     ; 40 			break;
 245  0025 2011          	jra	L17
 246  0027               L14:
 247                     ; 41 		case 3:
 247                     ; 42 	//		pwm_controller_port2.output_value = duty_cycle;
 247                     ; 43 	//		pwm_controller_port3.output_value_raw = duty_cycle * 125.82; // 12582/100
 247                     ; 44 	//		TIM1_SetCompare2(pwm_controller_port3.output_value_raw);
 247                     ; 45 				TIM1_SetCompare2(duty_cycle * 125.82);
 249  0027 1e05          	ldw	x,(OFST+5,sp)
 250  0029 cd0000        	call	c_uitof
 252  002c ae0000        	ldw	x,#L77
 253  002f cd0000        	call	c_fmul
 255  0032 cd0000        	call	c_ftoi
 257  0035 cd0000        	call	_TIM1_SetCompare2
 259                     ; 47 			break;
 261  0038               L17:
 262                     ; 49 }
 263  0038               L01:
 266  0038 85            	popw	x
 267  0039 81            	ret
 280                     	xdef	_pwm_control_setoutput
 281                     	xdef	_pwm_control_init
 282                     	xref	_TIM1_SetCompare2
 283                     	xref	_TIM1_SetCompare1
 284                     	xref	_TIM1_CtrlPWMOutputs
 285                     	xref	_TIM1_OC2Init
 286                     	xref	_TIM1_OC1Init
 287                     	xref	_TIM1_Cmd
 288                     	xref	_TIM1_TimeBaseInit
 289                     	xref	_GPIO_Init
 290                     	xref	_CLK_PeripheralClockConfig
 291                     .const:	section	.text
 292  0000               L77:
 293  0000 42fba3d7      	dc.w	17147,-23593
 294                     	xref.b	c_x
 314                     	xref	c_ftoi
 315                     	xref	c_fmul
 316                     	xref	c_uitof
 317                     	end
