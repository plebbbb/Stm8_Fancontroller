   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  54                     ; 7 void v_control_init(void){
  56                     .text:	section	.text,new
  57  0000               _v_control_init:
  61                     ; 8 	v_controller_port1.output_value = 0;
  63  0000 5f            	clrw	x
  64  0001 bf00          	ldw	_v_controller_port1,x
  65                     ; 9 	v_controller_port1.output_value_raw = 0;
  67  0003 5f            	clrw	x
  68  0004 bf02          	ldw	_v_controller_port1+2,x
  69                     ; 10 	v_controller_port1.is_enabled = 0;
  71  0006 3f04          	clr	_v_controller_port1+4
  72                     ; 12 	CLK_PeripheralClockConfig(CLK_Peripheral_COMP, ENABLE);
  74  0008 ae1501        	ldw	x,#5377
  75  000b cd0000        	call	_CLK_PeripheralClockConfig
  77                     ; 13 	SYSCFG_RIDeInit();
  79  000e cd0000        	call	_SYSCFG_RIDeInit
  81                     ; 14 	SYSCFG_RIIOSwitchConfig(RI_IOSwitch_15, ENABLE);
  83  0011 ae3401        	ldw	x,#13313
  84  0014 cd0000        	call	_SYSCFG_RIIOSwitchConfig
  86                     ; 15 	CLK_PeripheralClockConfig(CLK_Peripheral_DAC, ENABLE);
  88  0017 ae0701        	ldw	x,#1793
  89  001a cd0000        	call	_CLK_PeripheralClockConfig
  91                     ; 16 	DAC_DeInit();
  93  001d cd0000        	call	_DAC_DeInit
  95                     ; 17 	DAC_Init(DAC_Channel_1, DAC_Trigger_None, DAC_OutputBuffer_Disable);
  97  0020 4b02          	push	#2
  98  0022 ae0030        	ldw	x,#48
  99  0025 cd0000        	call	_DAC_Init
 101  0028 84            	pop	a
 102                     ; 18 	DAC_SetChannel1Data(DAC_Align_12b_R, v_controller_port1.output_value_raw);
 104  0029 be02          	ldw	x,_v_controller_port1+2
 105  002b 89            	pushw	x
 106  002c 4f            	clr	a
 107  002d cd0000        	call	_DAC_SetChannel1Data
 109  0030 85            	popw	x
 110                     ; 19 	DAC_Cmd(DAC_Channel_1, ENABLE);
 112  0031 ae0001        	ldw	x,#1
 113  0034 cd0000        	call	_DAC_Cmd
 115                     ; 20 	GPIO_Init(GPIOD, GPIO_Pin_7, GPIO_Mode_Out_PP_Low_Slow);
 117  0037 4bc0          	push	#192
 118  0039 4b80          	push	#128
 119  003b ae500f        	ldw	x,#20495
 120  003e cd0000        	call	_GPIO_Init
 122  0041 85            	popw	x
 123                     ; 21 	GPIO_WriteBit(GPIOD, GPIO_Pin_7, RESET);
 125  0042 4b00          	push	#0
 126  0044 4b80          	push	#128
 127  0046 ae500f        	ldw	x,#20495
 128  0049 cd0000        	call	_GPIO_WriteBit
 130  004c 85            	popw	x
 131                     ; 22 }
 134  004d 81            	ret
 191                     ; 25 void v_control_active(bool state){
 192                     .text:	section	.text,new
 193  0000               _v_control_active:
 197                     ; 26 	v_controller_port1.is_enabled = state;
 199  0000 b704          	ld	_v_controller_port1+4,a
 200                     ; 27 	GPIO_WriteBit(GPIOD, GPIO_Pin_7, state ? SET : RESET);
 202  0002 4d            	tnz	a
 203  0003 2704          	jreq	L01
 204  0005 a601          	ld	a,#1
 205  0007 2001          	jra	L21
 206  0009               L01:
 207  0009 4f            	clr	a
 208  000a               L21:
 209  000a 88            	push	a
 210  000b 4b80          	push	#128
 211  000d ae500f        	ldw	x,#20495
 212  0010 cd0000        	call	_GPIO_WriteBit
 214  0013 85            	popw	x
 215                     ; 28 }
 218  0014 81            	ret
 255                     ; 34 void v_control_setoutput(uint8_t level){
 256                     .text:	section	.text,new
 257  0000               _v_control_setoutput:
 259  0000 88            	push	a
 260  0001 5208          	subw	sp,#8
 261       00000008      OFST:	set	8
 264                     ; 35 	if (level > 100) return;
 266  0003 a165          	cp	a,#101
 267  0005 2442          	jruge	L61
 270                     ; 36 	v_controller_port1.output_value = level;
 272  0007 7b09          	ld	a,(OFST+1,sp)
 273  0009 5f            	clrw	x
 274  000a 97            	ld	xl,a
 275  000b bf00          	ldw	_v_controller_port1,x
 276                     ; 37 	v_controller_port1.output_value_raw = 4095 - level * 20.48; //output interval from 4095 to 2048. 4095 leads to minimum non-stop duty cycle.
 278  000d 7b09          	ld	a,(OFST+1,sp)
 279  000f 5f            	clrw	x
 280  0010 97            	ld	xl,a
 281  0011 cd0000        	call	c_itof
 283  0014 96            	ldw	x,sp
 284  0015 1c0005        	addw	x,#OFST-3
 285  0018 cd0000        	call	c_rtol
 288  001b ae0000        	ldw	x,#L37
 289  001e cd0000        	call	c_ltor
 291  0021 96            	ldw	x,sp
 292  0022 1c0005        	addw	x,#OFST-3
 293  0025 cd0000        	call	c_fmul
 295  0028 96            	ldw	x,sp
 296  0029 1c0001        	addw	x,#OFST-7
 297  002c cd0000        	call	c_rtol
 300  002f ae0fff        	ldw	x,#4095
 301  0032 cd0000        	call	c_itof
 303  0035 96            	ldw	x,sp
 304  0036 1c0001        	addw	x,#OFST-7
 305  0039 cd0000        	call	c_fsub
 307  003c cd0000        	call	c_ftoi
 309  003f bf02          	ldw	_v_controller_port1+2,x
 310                     ; 38 	DAC_SetChannel1Data(DAC_Align_12b_R, 	v_controller_port1.output_value_raw);
 312  0041 be02          	ldw	x,_v_controller_port1+2
 313  0043 89            	pushw	x
 314  0044 4f            	clr	a
 315  0045 cd0000        	call	_DAC_SetChannel1Data
 317  0048 85            	popw	x
 318                     ; 39 }
 319  0049               L61:
 322  0049 5b09          	addw	sp,#9
 323  004b 81            	ret
 359                     ; 42 void v_control_setoutput_raw(uint16_t level){
 360                     .text:	section	.text,new
 361  0000               _v_control_setoutput_raw:
 365                     ; 43 	DAC_SetChannel1Data(DAC_Align_12b_R, level);
 367  0000 89            	pushw	x
 368  0001 4f            	clr	a
 369  0002 cd0000        	call	_DAC_SetChannel1Data
 371  0005 85            	popw	x
 372                     ; 44 }
 375  0006 81            	ret
 432                     	xdef	_v_control_setoutput_raw
 433                     	xdef	_v_control_setoutput
 434                     	xdef	_v_control_active
 435                     	xdef	_v_control_init
 436                     	switch	.ubsct
 437  0000               _v_controller_port1:
 438  0000 0000000000    	ds.b	5
 439                     	xdef	_v_controller_port1
 440                     	xref	_SYSCFG_RIIOSwitchConfig
 441                     	xref	_SYSCFG_RIDeInit
 442                     	xref	_GPIO_WriteBit
 443                     	xref	_GPIO_Init
 444                     	xref	_DAC_SetChannel1Data
 445                     	xref	_DAC_Cmd
 446                     	xref	_DAC_Init
 447                     	xref	_DAC_DeInit
 448                     	xref	_CLK_PeripheralClockConfig
 449                     .const:	section	.text
 450  0000               L37:
 451  0000 41a3d70a      	dc.w	16803,-10486
 452                     	xref.b	c_x
 472                     	xref	c_ftoi
 473                     	xref	c_fsub
 474                     	xref	c_fmul
 475                     	xref	c_rtol
 476                     	xref	c_ltor
 477                     	xref	c_itof
 478                     	end
