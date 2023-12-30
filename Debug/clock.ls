   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  15                     	bsct
  16  0000               _t_delay:
  17  0000 00000000      	dc.l	0
  55                     ; 4 void clock_init(void){
  57                     .text:	section	.text,new
  58  0000               _clock_init:
  62                     ; 5 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
  64  0000 4f            	clr	a
  65  0001 cd0000        	call	_CLK_SYSCLKDivConfig
  67                     ; 6 	CLK_SYSCLKSourceSwitchCmd(ENABLE);
  69  0004 a601          	ld	a,#1
  70  0006 cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
  72                     ; 7 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSE);
  74  0009 a604          	ld	a,#4
  75  000b cd0000        	call	_CLK_SYSCLKSourceConfig
  77                     ; 11 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
  79  000e ae0201        	ldw	x,#513
  80  0011 cd0000        	call	_CLK_PeripheralClockConfig
  82                     ; 13 	TIM4_TimeBaseInit(TIM4_Prescaler_128, 124);
  84  0014 ae077c        	ldw	x,#1916
  85  0017 cd0000        	call	_TIM4_TimeBaseInit
  87                     ; 15 	TIM4_ClearFlag(TIM4_FLAG_Update);
  89  001a a601          	ld	a,#1
  90  001c cd0000        	call	_TIM4_ClearFlag
  92                     ; 17 	TIM4_ITConfig(TIM4_IT_Update, ENABLE);
  94  001f ae0101        	ldw	x,#257
  95  0022 cd0000        	call	_TIM4_ITConfig
  97                     ; 19 	enableInterrupts();
 100  0025 9a            rim
 102                     ; 21 	TIM4_Cmd(ENABLE);
 105  0026 a601          	ld	a,#1
 106  0028 cd0000        	call	_TIM4_Cmd
 108                     ; 22 }
 111  002b 81            	ret
 135                     ; 24 void delay_dec(void){
 136                     .text:	section	.text,new
 137  0000               _delay_dec:
 141                     ; 25 	if (t_delay > 0) t_delay--;
 143  0000 ae0000        	ldw	x,#_t_delay
 144  0003 cd0000        	call	c_lzmp
 146  0006 2708          	jreq	L13
 149  0008 ae0000        	ldw	x,#_t_delay
 150  000b a601          	ld	a,#1
 151  000d cd0000        	call	c_lgsbc
 153  0010               L13:
 154                     ; 26 }
 157  0010 81            	ret
 192                     ; 28 void delay(volatile uint32_t ms){
 193                     .text:	section	.text,new
 194  0000               _delay:
 196       00000000      OFST:	set	0
 199                     ; 29 	t_delay = ms;
 201  0000 1e05          	ldw	x,(OFST+5,sp)
 202  0002 bf02          	ldw	_t_delay+2,x
 203  0004 1e03          	ldw	x,(OFST+3,sp)
 204  0006 bf00          	ldw	_t_delay,x
 206  0008               L55:
 207                     ; 30 	while(t_delay != 0);
 209  0008 ae0000        	ldw	x,#_t_delay
 210  000b cd0000        	call	c_lzmp
 212  000e 26f8          	jrne	L55
 213                     ; 32 }
 216  0010 81            	ret
 240                     	xdef	_delay_dec
 241                     	xdef	_t_delay
 242                     	xdef	_delay
 243                     	xdef	_clock_init
 244                     	xref	_TIM4_ClearFlag
 245                     	xref	_TIM4_ITConfig
 246                     	xref	_TIM4_Cmd
 247                     	xref	_TIM4_TimeBaseInit
 248                     	xref	_CLK_PeripheralClockConfig
 249                     	xref	_CLK_SYSCLKSourceSwitchCmd
 250                     	xref	_CLK_SYSCLKDivConfig
 251                     	xref	_CLK_SYSCLKSourceConfig
 270                     	xref	c_lgsbc
 271                     	xref	c_lzmp
 272                     	end
