   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  15                     	bsct
  16  0000               _t_delay:
  17  0000 00000000      	dc.l	0
  54                     ; 4 void clock_init(void){
  56                     .text:	section	.text,new
  57  0000               _clock_init:
  61                     ; 5 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
  63  0000 4f            	clr	a
  64  0001 cd0000        	call	_CLK_SYSCLKDivConfig
  66                     ; 6 	CLK_SYSCLKSourceSwitchCmd(ENABLE);
  68  0004 a601          	ld	a,#1
  69  0006 cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
  71                     ; 7 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSE);
  73  0009 a604          	ld	a,#4
  74  000b cd0000        	call	_CLK_SYSCLKSourceConfig
  76                     ; 11 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
  78  000e ae0201        	ldw	x,#513
  79  0011 cd0000        	call	_CLK_PeripheralClockConfig
  81                     ; 13 	TIM4_TimeBaseInit(TIM4_Prescaler_128, 124);
  83  0014 ae077c        	ldw	x,#1916
  84  0017 cd0000        	call	_TIM4_TimeBaseInit
  86                     ; 15 	TIM4_ClearFlag(TIM4_FLAG_Update);
  88  001a a601          	ld	a,#1
  89  001c cd0000        	call	_TIM4_ClearFlag
  91                     ; 17 	TIM4_ITConfig(TIM4_IT_Update, ENABLE);
  93  001f ae0101        	ldw	x,#257
  94  0022 cd0000        	call	_TIM4_ITConfig
  96                     ; 19 	TIM4_Cmd(ENABLE);
  98  0025 a601          	ld	a,#1
  99  0027 cd0000        	call	_TIM4_Cmd
 101                     ; 20 }
 104  002a 81            	ret
 128                     ; 22 void delay_dec(void){
 129                     .text:	section	.text,new
 130  0000               _delay_dec:
 134                     ; 23 	if (t_delay > 0) t_delay--;
 136  0000 ae0000        	ldw	x,#_t_delay
 137  0003 cd0000        	call	c_lzmp
 139  0006 2708          	jreq	L13
 142  0008 ae0000        	ldw	x,#_t_delay
 143  000b a601          	ld	a,#1
 144  000d cd0000        	call	c_lgsbc
 146  0010               L13:
 147                     ; 24 }
 150  0010 81            	ret
 185                     ; 26 void delay(volatile uint32_t ms){
 186                     .text:	section	.text,new
 187  0000               _delay:
 189       00000000      OFST:	set	0
 192                     ; 27 	t_delay = ms;
 194  0000 1e05          	ldw	x,(OFST+5,sp)
 195  0002 bf02          	ldw	_t_delay+2,x
 196  0004 1e03          	ldw	x,(OFST+3,sp)
 197  0006 bf00          	ldw	_t_delay,x
 199  0008               L55:
 200                     ; 28 	while(t_delay != 0);
 202  0008 ae0000        	ldw	x,#_t_delay
 203  000b cd0000        	call	c_lzmp
 205  000e 26f8          	jrne	L55
 206                     ; 30 }
 209  0010 81            	ret
 233                     	xdef	_delay_dec
 234                     	xdef	_t_delay
 235                     	xdef	_delay
 236                     	xdef	_clock_init
 237                     	xref	_TIM4_ClearFlag
 238                     	xref	_TIM4_ITConfig
 239                     	xref	_TIM4_Cmd
 240                     	xref	_TIM4_TimeBaseInit
 241                     	xref	_CLK_PeripheralClockConfig
 242                     	xref	_CLK_SYSCLKSourceSwitchCmd
 243                     	xref	_CLK_SYSCLKDivConfig
 244                     	xref	_CLK_SYSCLKSourceConfig
 263                     	xref	c_lgsbc
 264                     	xref	c_lzmp
 265                     	end
