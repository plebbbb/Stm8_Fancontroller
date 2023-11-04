   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  53                     ; 7 void v_control_init(void){
  55                     	switch	.text
  56  0000               _v_control_init:
  60                     ; 8 	v_controller_port1.output_value = 0;
  62  0000 5f            	clrw	x
  63  0001 bf00          	ldw	_v_controller_port1,x
  64                     ; 9 	v_controller_port1.output_value_raw = 0;
  66  0003 5f            	clrw	x
  67  0004 bf02          	ldw	_v_controller_port1+2,x
  68                     ; 10 	v_controller_port1.is_enabled = 0;
  70  0006 3f04          	clr	_v_controller_port1+4
  71                     ; 12 	CLK_PeripheralClockConfig(CLK_Peripheral_COMP, ENABLE);
  73  0008 ae1501        	ldw	x,#5377
  74  000b cd0000        	call	_CLK_PeripheralClockConfig
  76                     ; 13 	SYSCFG_RIDeInit();
  78  000e cd0000        	call	_SYSCFG_RIDeInit
  80                     ; 14 	SYSCFG_RIIOSwitchConfig(RI_IOSwitch_15, ENABLE);
  82  0011 ae3401        	ldw	x,#13313
  83  0014 cd0000        	call	_SYSCFG_RIIOSwitchConfig
  85                     ; 15 	CLK_PeripheralClockConfig(CLK_Peripheral_DAC, ENABLE);
  87  0017 ae0701        	ldw	x,#1793
  88  001a cd0000        	call	_CLK_PeripheralClockConfig
  90                     ; 16 	DAC_DeInit();
  92  001d cd0000        	call	_DAC_DeInit
  94                     ; 17 	DAC_Init(DAC_Channel_1, DAC_Trigger_None, DAC_OutputBuffer_Disable);
  96  0020 4b02          	push	#2
  97  0022 ae0030        	ldw	x,#48
  98  0025 cd0000        	call	_DAC_Init
 100  0028 84            	pop	a
 101                     ; 18 	DAC_SetChannel1Data(DAC_Align_12b_R, v_controller_port1.output_value_raw);
 103  0029 be02          	ldw	x,_v_controller_port1+2
 104  002b 89            	pushw	x
 105  002c 4f            	clr	a
 106  002d cd0000        	call	_DAC_SetChannel1Data
 108  0030 85            	popw	x
 109                     ; 19 	DAC_Cmd(DAC_Channel_1, ENABLE);
 111  0031 ae0001        	ldw	x,#1
 112  0034 cd0000        	call	_DAC_Cmd
 114                     ; 20 	GPIO_Init(GPIOD, GPIO_Pin_7, GPIO_Mode_Out_PP_Low_Slow);
 116  0037 4bc0          	push	#192
 117  0039 4b80          	push	#128
 118  003b ae500f        	ldw	x,#20495
 119  003e cd0000        	call	_GPIO_Init
 121  0041 85            	popw	x
 122                     ; 21 	GPIO_WriteBit(GPIOD, GPIO_Pin_7, RESET);
 124  0042 4b00          	push	#0
 125  0044 4b80          	push	#128
 126  0046 ae500f        	ldw	x,#20495
 127  0049 cd0000        	call	_GPIO_WriteBit
 129  004c 85            	popw	x
 130                     ; 22 }
 133  004d 81            	ret
 190                     ; 25 void v_control_active(bool state){
 191                     	switch	.text
 192  004e               _v_control_active:
 196                     ; 26 	v_controller_port1.is_enabled = state;
 198  004e b704          	ld	_v_controller_port1+4,a
 199                     ; 27 	GPIO_WriteBit(GPIOD, GPIO_Pin_7, state ? SET : RESET);
 201  0050 4d            	tnz	a
 202  0051 2704          	jreq	L01
 203  0053 a601          	ld	a,#1
 204  0055 2001          	jra	L21
 205  0057               L01:
 206  0057 4f            	clr	a
 207  0058               L21:
 208  0058 88            	push	a
 209  0059 4b80          	push	#128
 210  005b ae500f        	ldw	x,#20495
 211  005e cd0000        	call	_GPIO_WriteBit
 213  0061 85            	popw	x
 214                     ; 28 }
 217  0062 81            	ret
 254                     ; 34 void v_control_setoutput(uint8_t level){
 255                     	switch	.text
 256  0063               _v_control_setoutput:
 258  0063 88            	push	a
 259  0064 5208          	subw	sp,#8
 260       00000008      OFST:	set	8
 263                     ; 35 	if (level > 100) return;
 265  0066 a165          	cp	a,#101
 266  0068 2442          	jruge	L61
 269                     ; 36 	v_controller_port1.output_value = level;
 271  006a 7b09          	ld	a,(OFST+1,sp)
 272  006c 5f            	clrw	x
 273  006d 97            	ld	xl,a
 274  006e bf00          	ldw	_v_controller_port1,x
 275                     ; 37 	v_controller_port1.output_value_raw = 4095 - level * 20.48; //output interval from 4095 to 2048. 4095 leads to minimum non-stop duty cycle.
 277  0070 7b09          	ld	a,(OFST+1,sp)
 278  0072 5f            	clrw	x
 279  0073 97            	ld	xl,a
 280  0074 cd0000        	call	c_itof
 282  0077 96            	ldw	x,sp
 283  0078 1c0005        	addw	x,#OFST-3
 284  007b cd0000        	call	c_rtol
 287  007e ae0000        	ldw	x,#L37
 288  0081 cd0000        	call	c_ltor
 290  0084 96            	ldw	x,sp
 291  0085 1c0005        	addw	x,#OFST-3
 292  0088 cd0000        	call	c_fmul
 294  008b 96            	ldw	x,sp
 295  008c 1c0001        	addw	x,#OFST-7
 296  008f cd0000        	call	c_rtol
 299  0092 ae0fff        	ldw	x,#4095
 300  0095 cd0000        	call	c_itof
 302  0098 96            	ldw	x,sp
 303  0099 1c0001        	addw	x,#OFST-7
 304  009c cd0000        	call	c_fsub
 306  009f cd0000        	call	c_ftoi
 308  00a2 bf02          	ldw	_v_controller_port1+2,x
 309                     ; 38 	DAC_SetChannel1Data(DAC_Align_12b_R, 	v_controller_port1.output_value_raw);
 311  00a4 be02          	ldw	x,_v_controller_port1+2
 312  00a6 89            	pushw	x
 313  00a7 4f            	clr	a
 314  00a8 cd0000        	call	_DAC_SetChannel1Data
 316  00ab 85            	popw	x
 317                     ; 39 }
 318  00ac               L61:
 321  00ac 5b09          	addw	sp,#9
 322  00ae 81            	ret
 358                     ; 42 void v_control_setoutput_raw(uint16_t level){
 359                     	switch	.text
 360  00af               _v_control_setoutput_raw:
 364                     ; 43 	DAC_SetChannel1Data(DAC_Align_12b_R, level);
 366  00af 89            	pushw	x
 367  00b0 4f            	clr	a
 368  00b1 cd0000        	call	_DAC_SetChannel1Data
 370  00b4 85            	popw	x
 371                     ; 44 }
 374  00b5 81            	ret
 431                     	xdef	_v_control_setoutput_raw
 432                     	xdef	_v_control_setoutput
 433                     	xdef	_v_control_active
 434                     	xdef	_v_control_init
 435                     	switch	.ubsct
 436  0000               _v_controller_port1:
 437  0000 0000000000    	ds.b	5
 438                     	xdef	_v_controller_port1
 439                     	xref	_SYSCFG_RIIOSwitchConfig
 440                     	xref	_SYSCFG_RIDeInit
 441                     	xref	_GPIO_WriteBit
 442                     	xref	_GPIO_Init
 443                     	xref	_DAC_SetChannel1Data
 444                     	xref	_DAC_Cmd
 445                     	xref	_DAC_Init
 446                     	xref	_DAC_DeInit
 447                     	xref	_CLK_PeripheralClockConfig
 448                     .const:	section	.text
 449  0000               L37:
 450  0000 41a3d70a      	dc.w	16803,-10486
 451                     	xref.b	c_x
 471                     	xref	c_ftoi
 472                     	xref	c_fsub
 473                     	xref	c_fmul
 474                     	xref	c_rtol
 475                     	xref	c_ltor
 476                     	xref	c_itof
 477                     	end
