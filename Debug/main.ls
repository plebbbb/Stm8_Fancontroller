   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  50                     ; 7 void main(){
  52                     	switch	.text
  53  0000               _main:
  57                     ; 8 	GPIO_Init(GPIOA, GPIO_Pin_5, GPIO_Mode_Out_PP_Low_Slow);
  59  0000 4bc0          	push	#192
  60  0002 4b20          	push	#32
  61  0004 ae5000        	ldw	x,#20480
  62  0007 cd0000        	call	_GPIO_Init
  64  000a 85            	popw	x
  65                     ; 9 	GPIO_Init(GPIOD, GPIO_Pin_2, GPIO_Mode_Out_PP_Low_Slow);
  67  000b 4bc0          	push	#192
  68  000d 4b04          	push	#4
  69  000f ae500f        	ldw	x,#20495
  70  0012 cd0000        	call	_GPIO_Init
  72  0015 85            	popw	x
  73                     ; 10 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, ENABLE);
  75  0016 ae1101        	ldw	x,#4353
  76  0019 cd0000        	call	_CLK_PeripheralClockConfig
  78                     ; 11 	TIM1_TimeBaseInit(1, TIM1_CounterMode_Up, 65535, 0);
  80  001c 4b00          	push	#0
  81  001e aeffff        	ldw	x,#65535
  82  0021 89            	pushw	x
  83  0022 4b00          	push	#0
  84  0024 ae0001        	ldw	x,#1
  85  0027 cd0000        	call	_TIM1_TimeBaseInit
  87  002a 5b04          	addw	sp,#4
  88                     ; 12 	TIM1_OC1Init(TIM1_OCMode_Toggle, TIM1_OutputState_Enable, TIM1_OutputNState_Disable, 40, TIM1_OCPolarity_Low, TIM1_OCNPolarity_Low, TIM1_OCIdleState_Set,TIM1_OCNIdleState_Set);
  90  002c 4b2a          	push	#42
  91  002e 4b55          	push	#85
  92  0030 4b88          	push	#136
  93  0032 4b22          	push	#34
  94  0034 ae0028        	ldw	x,#40
  95  0037 89            	pushw	x
  96  0038 4b00          	push	#0
  97  003a ae3011        	ldw	x,#12305
  98  003d cd0000        	call	_TIM1_OC1Init
 100  0040 5b07          	addw	sp,#7
 101                     ; 13 	TIM1_OC1PreloadConfig(DISABLE);
 103  0042 4f            	clr	a
 104  0043 cd0000        	call	_TIM1_OC1PreloadConfig
 106                     ; 14 	TIM1_CtrlPWMOutputs(ENABLE);
 108  0046 a601          	ld	a,#1
 109  0048 cd0000        	call	_TIM1_CtrlPWMOutputs
 111                     ; 15 	TIM1_Cmd(ENABLE);
 113  004b a601          	ld	a,#1
 114  004d cd0000        	call	_TIM1_Cmd
 116  0050               L12:
 117                     ; 17 		GPIO_WriteBit(GPIOA, GPIO_Pin_5, SET) ;
 119  0050 4b01          	push	#1
 120  0052 4b20          	push	#32
 121  0054 ae5000        	ldw	x,#20480
 122  0057 cd0000        	call	_GPIO_WriteBit
 124  005a 85            	popw	x
 126  005b 20f3          	jra	L12
 139                     	xdef	_main
 140                     	xref	_TIM1_OC1PreloadConfig
 141                     	xref	_TIM1_CtrlPWMOutputs
 142                     	xref	_TIM1_OC1Init
 143                     	xref	_TIM1_Cmd
 144                     	xref	_TIM1_TimeBaseInit
 145                     	xref	_GPIO_WriteBit
 146                     	xref	_GPIO_Init
 147                     	xref	_CLK_PeripheralClockConfig
 166                     	end
