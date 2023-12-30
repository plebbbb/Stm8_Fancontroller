   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  47                     ; 26 void serial_init(void){
  49                     .text:	section	.text,new
  50  0000               _serial_init:
  54                     ; 28 	CLK_PeripheralClockConfig(CLK_Peripheral_USART1,ENABLE);
  56  0000 ae0501        	ldw	x,#1281
  57  0003 cd0000        	call	_CLK_PeripheralClockConfig
  59                     ; 29 	USART_DeInit(USART1);
  61  0006 ae5230        	ldw	x,#21040
  62  0009 cd0000        	call	_USART_DeInit
  64                     ; 30 	USART_Init(USART1,9600, USART_WordLength_8b, USART_StopBits_1, USART_Parity_No, USART_Mode_Tx);
  66  000c 4b08          	push	#8
  67  000e 4b00          	push	#0
  68  0010 4b00          	push	#0
  69  0012 4b00          	push	#0
  70  0014 ae2580        	ldw	x,#9600
  71  0017 89            	pushw	x
  72  0018 ae0000        	ldw	x,#0
  73  001b 89            	pushw	x
  74  001c ae5230        	ldw	x,#21040
  75  001f cd0000        	call	_USART_Init
  77  0022 5b08          	addw	sp,#8
  78                     ; 31 	USART_Cmd(USART1, ENABLE);
  80  0024 4b01          	push	#1
  81  0026 ae5230        	ldw	x,#21040
  82  0029 cd0000        	call	_USART_Cmd
  84  002c 84            	pop	a
  85                     ; 32 }
  88  002d 81            	ret
 135                     ; 35 void serial_write(char* word){
 136                     .text:	section	.text,new
 137  0000               _serial_write:
 139  0000 89            	pushw	x
 140       00000002      OFST:	set	2
 143                     ; 36 	char* ptr = word;
 145  0001 1f01          	ldw	(OFST-1,sp),x
 148  0003 2020          	jra	L74
 149  0005               L34:
 150                     ; 38 		USART_SendData8(USART1, *ptr);
 152  0005 1e01          	ldw	x,(OFST-1,sp)
 153  0007 f6            	ld	a,(x)
 154  0008 88            	push	a
 155  0009 ae5230        	ldw	x,#21040
 156  000c cd0000        	call	_USART_SendData8
 158  000f 84            	pop	a
 159                     ; 39 		ptr++;
 161  0010 1e01          	ldw	x,(OFST-1,sp)
 162  0012 1c0001        	addw	x,#1
 163  0015 1f01          	ldw	(OFST-1,sp),x
 166  0017               L55:
 167                     ; 40 		while(!(USART_GetFlagStatus(USART1, USART_FLAG_TXE)));
 169  0017 ae0080        	ldw	x,#128
 170  001a 89            	pushw	x
 171  001b ae5230        	ldw	x,#21040
 172  001e cd0000        	call	_USART_GetFlagStatus
 174  0021 85            	popw	x
 175  0022 4d            	tnz	a
 176  0023 27f2          	jreq	L55
 177  0025               L74:
 178                     ; 37 	while (*ptr != '\0'){
 180  0025 1e01          	ldw	x,(OFST-1,sp)
 181  0027 7d            	tnz	(x)
 182  0028 26db          	jrne	L34
 183                     ; 42 	USART_SendData8(USART1, '\n');
 185  002a 4b0a          	push	#10
 186  002c ae5230        	ldw	x,#21040
 187  002f cd0000        	call	_USART_SendData8
 189  0032 84            	pop	a
 191  0033               L36:
 192                     ; 43 	while (!(USART_GetFlagStatus(USART1, USART_FLAG_TXE)));
 194  0033 ae0080        	ldw	x,#128
 195  0036 89            	pushw	x
 196  0037 ae5230        	ldw	x,#21040
 197  003a cd0000        	call	_USART_GetFlagStatus
 199  003d 85            	popw	x
 200  003e 4d            	tnz	a
 201  003f 27f2          	jreq	L36
 202                     ; 44 }
 205  0041 85            	popw	x
 206  0042 81            	ret
 243                     ; 47 void serial_write_int(int b){
 244                     .text:	section	.text,new
 245  0000               _serial_write_int:
 249                     ; 48 	sprintf(wordarray, "%i", b);
 251  0000 89            	pushw	x
 252  0001 ae0017        	ldw	x,#L501
 253  0004 89            	pushw	x
 254  0005 ae0000        	ldw	x,#_wordarray
 255  0008 cd0000        	call	_sprintf
 257  000b 5b04          	addw	sp,#4
 258                     ; 49 	serial_write(wordarray);
 260  000d ae0000        	ldw	x,#_wordarray
 261  0010 cd0000        	call	_serial_write
 263                     ; 50 }
 266  0013 81            	ret
 303                     ; 52 void serial_write_float(double b){
 304                     .text:	section	.text,new
 305  0000               _serial_write_float:
 307       00000000      OFST:	set	0
 310                     ; 53 	sprintf(wordarray, "%f", b);
 312  0000 1e05          	ldw	x,(OFST+5,sp)
 313  0002 89            	pushw	x
 314  0003 1e05          	ldw	x,(OFST+5,sp)
 315  0005 89            	pushw	x
 316  0006 ae0014        	ldw	x,#L521
 317  0009 89            	pushw	x
 318  000a ae0000        	ldw	x,#_wordarray
 319  000d cd0000        	call	_sprintf
 321  0010 5b06          	addw	sp,#6
 322                     ; 54 	serial_write(wordarray);
 324  0012 ae0000        	ldw	x,#_wordarray
 325  0015 cd0000        	call	_serial_write
 327                     ; 55 }
 330  0018 81            	ret
 406                     ; 57 void main(){
 407                     .text:	section	.text,new
 408  0000               _main:
 410  0000 520c          	subw	sp,#12
 411       0000000c      OFST:	set	12
 414                     ; 58 	uint16_t c = 30;
 416                     ; 59 	int e = -1;
 418  0002 aeffff        	ldw	x,#65535
 419  0005 1f07          	ldw	(OFST-5,sp),x
 421                     ; 62 	double fan_spd = 0;
 423                     ; 63 	GPIO_Init(GPIOA, GPIO_Pin_5, GPIO_Mode_Out_PP_Low_Slow);
 425  0007 4bc0          	push	#192
 426  0009 4b20          	push	#32
 427  000b ae5000        	ldw	x,#20480
 428  000e cd0000        	call	_GPIO_Init
 430  0011 85            	popw	x
 431                     ; 64 	GPIO_Init(GPIOC, GPIO_Pin_3, GPIO_Mode_Out_PP_Low_Fast);
 433  0012 4be0          	push	#224
 434  0014 4b08          	push	#8
 435  0016 ae500a        	ldw	x,#20490
 436  0019 cd0000        	call	_GPIO_Init
 438  001c 85            	popw	x
 439                     ; 65 	GPIO_ExternalPullUpConfig(GPIOC, GPIO_Pin_3, ENABLE);
 441  001d 4b01          	push	#1
 442  001f 4b08          	push	#8
 443  0021 ae500a        	ldw	x,#20490
 444  0024 cd0000        	call	_GPIO_ExternalPullUpConfig
 446  0027 85            	popw	x
 447                     ; 67 	clock_init();
 449  0028 cd0000        	call	_clock_init
 451                     ; 70 			GPIO_WriteBit(GPIOA, GPIO_Pin_5, SET);
 453  002b 4b01          	push	#1
 454  002d 4b20          	push	#32
 455  002f ae5000        	ldw	x,#20480
 456  0032 cd0000        	call	_GPIO_WriteBit
 458  0035 85            	popw	x
 459                     ; 72 	serial_init();
 461  0036 cd0000        	call	_serial_init
 463                     ; 73 	adc_subsystem_init();
 465  0039 cd0000        	call	_adc_subsystem_init
 467                     ; 74 	adc_sensor_config(0, 3226.7f, 0.003141f, -0.0001141f, (double)0.0000016181);
 469  003c ce0006        	ldw	x,L512+2
 470  003f 89            	pushw	x
 471  0040 ce0004        	ldw	x,L512
 472  0043 89            	pushw	x
 473  0044 ce000a        	ldw	x,L502+2
 474  0047 89            	pushw	x
 475  0048 ce0008        	ldw	x,L502
 476  004b 89            	pushw	x
 477  004c ce000e        	ldw	x,L571+2
 478  004f 89            	pushw	x
 479  0050 ce000c        	ldw	x,L571
 480  0053 89            	pushw	x
 481  0054 ce0012        	ldw	x,L561+2
 482  0057 89            	pushw	x
 483  0058 ce0010        	ldw	x,L561
 484  005b 89            	pushw	x
 485  005c 4f            	clr	a
 486  005d cd0000        	call	_adc_sensor_config
 488  0060 5b10          	addw	sp,#16
 489                     ; 76 	delay(100);
 491  0062 ae0064        	ldw	x,#100
 492  0065 89            	pushw	x
 493  0066 ae0000        	ldw	x,#0
 494  0069 89            	pushw	x
 495  006a cd0000        	call	_delay
 497  006d 5b04          	addw	sp,#4
 498                     ; 78 	pwm_control_init(2);
 500  006f ae0002        	ldw	x,#2
 501  0072 cd0000        	call	_pwm_control_init
 503                     ; 79 	v_control_init();
 505  0075 cd0000        	call	_v_control_init
 507                     ; 80 	v_control_active(1);
 509  0078 a601          	ld	a,#1
 510  007a cd0000        	call	_v_control_active
 512                     ; 81 	serial_write_float(adc_FAN1.A);
 514  007d be08          	ldw	x,_adc_FAN1+8
 515  007f 89            	pushw	x
 516  0080 be06          	ldw	x,_adc_FAN1+6
 517  0082 89            	pushw	x
 518  0083 cd0000        	call	_serial_write_float
 520  0086 5b04          	addw	sp,#4
 521                     ; 82 	serial_write_float(adc_FAN1.B);
 523  0088 be0c          	ldw	x,_adc_FAN1+12
 524  008a 89            	pushw	x
 525  008b be0a          	ldw	x,_adc_FAN1+10
 526  008d 89            	pushw	x
 527  008e cd0000        	call	_serial_write_float
 529  0091 5b04          	addw	sp,#4
 530                     ; 83 	serial_write_float(adc_FAN1.C);
 532  0093 be10          	ldw	x,_adc_FAN1+16
 533  0095 89            	pushw	x
 534  0096 be0e          	ldw	x,_adc_FAN1+14
 535  0098 89            	pushw	x
 536  0099 cd0000        	call	_serial_write_float
 538  009c 5b04          	addw	sp,#4
 539  009e               L122:
 540                     ; 86 		GPIO_WriteBit(GPIOA, GPIO_Pin_5, (e>0 ? SET : RESET));
 542  009e 9c            	rvf
 543  009f 1e07          	ldw	x,(OFST-5,sp)
 544  00a1 2d04          	jrsle	L61
 545  00a3 a601          	ld	a,#1
 546  00a5 2001          	jra	L02
 547  00a7               L61:
 548  00a7 4f            	clr	a
 549  00a8               L02:
 550  00a8 88            	push	a
 551  00a9 4b20          	push	#32
 552  00ab ae5000        	ldw	x,#20480
 553  00ae cd0000        	call	_GPIO_WriteBit
 555  00b1 85            	popw	x
 556                     ; 87 		delay(50);
 558  00b2 ae0032        	ldw	x,#50
 559  00b5 89            	pushw	x
 560  00b6 ae0000        	ldw	x,#0
 561  00b9 89            	pushw	x
 562  00ba cd0000        	call	_delay
 564  00bd 5b04          	addw	sp,#4
 565                     ; 88 		temp_SFH = adc_sensor_read_C(adc_FAN1);
 567  00bf ae0000        	ldw	x,#_adc_FAN1
 568  00c2 bf00          	ldw	c_x,x
 569  00c4 ae0012        	ldw	x,#18
 570  00c7               L22:
 571  00c7 5a            	decw	x
 572  00c8 92d600        	ld	a,([c_x],x)
 573  00cb 88            	push	a
 574  00cc 5d            	tnzw	x
 575  00cd 26f8          	jrne	L22
 576  00cf cd0000        	call	_adc_sensor_read_C
 578  00d2 5b12          	addw	sp,#18
 579  00d4 96            	ldw	x,sp
 580  00d5 1c0003        	addw	x,#OFST-9
 581  00d8 cd0000        	call	c_rtol
 584                     ; 90 		fan_spd = temp_SFH-28;
 586  00db 96            	ldw	x,sp
 587  00dc 1c0003        	addw	x,#OFST-9
 588  00df cd0000        	call	c_ltor
 590  00e2 ae0000        	ldw	x,#L132
 591  00e5 cd0000        	call	c_fsub
 593  00e8 96            	ldw	x,sp
 594  00e9 1c0009        	addw	x,#OFST-3
 595  00ec cd0000        	call	c_rtol
 598                     ; 91 		if (fan_spd < 0) v_control_active(0);
 600  00ef 9c            	rvf
 601  00f0 9c            	rvf
 602  00f1 0d09          	tnz	(OFST-3,sp)
 603  00f3 2e06          	jrsge	L532
 606  00f5 4f            	clr	a
 607  00f6 cd0000        	call	_v_control_active
 610  00f9 2009          	jra	L732
 611  00fb               L532:
 612                     ; 93 			v_control_active(1);
 614  00fb a601          	ld	a,#1
 615  00fd cd0000        	call	_v_control_active
 617                     ; 94 			v_control_setoutput((double)(40*fan_spd, 0));
 619  0100 4f            	clr	a
 620  0101 cd0000        	call	_v_control_setoutput
 622  0104               L732:
 623                     ; 97 		serial_write_float(temp_SFH);
 625  0104 1e05          	ldw	x,(OFST-7,sp)
 626  0106 89            	pushw	x
 627  0107 1e05          	ldw	x,(OFST-7,sp)
 628  0109 89            	pushw	x
 629  010a cd0000        	call	_serial_write_float
 631  010d 5b04          	addw	sp,#4
 632                     ; 98 		e = -e;
 634  010f 1e07          	ldw	x,(OFST-5,sp)
 635  0111 50            	negw	x
 636  0112 1f07          	ldw	(OFST-5,sp),x
 639  0114 2088          	jra	L122
 664                     	xdef	_main
 665                     	xdef	_serial_write_float
 666                     	xdef	_serial_write_int
 667                     	switch	.ubsct
 668  0000               _wordarray:
 669  0000 000000000000  	ds.b	50
 670                     	xdef	_wordarray
 671                     	xdef	_serial_write
 672                     	xdef	_serial_init
 673                     	xref	_delay
 674                     	xref	_clock_init
 675                     	xref	_adc_sensor_read_C
 676                     	xref	_adc_sensor_config
 677                     	xref	_adc_subsystem_init
 678                     	xref.b	_adc_FAN1
 679                     	xref	_pwm_control_init
 680                     	xref	_v_control_setoutput
 681                     	xref	_v_control_active
 682                     	xref	_v_control_init
 683                     	xref	_sprintf
 684                     	xref	_USART_GetFlagStatus
 685                     	xref	_USART_SendData8
 686                     	xref	_USART_Cmd
 687                     	xref	_USART_Init
 688                     	xref	_USART_DeInit
 689                     	xref	_GPIO_WriteBit
 690                     	xref	_GPIO_ExternalPullUpConfig
 691                     	xref	_GPIO_Init
 692                     	xref	_CLK_PeripheralClockConfig
 693                     .const:	section	.text
 694  0000               L132:
 695  0000 41e00000      	dc.w	16864,0
 696  0004               L512:
 697  0004 35d92d7e      	dc.w	13785,11646
 698  0008               L502:
 699  0008 b8ef48f8      	dc.w	-18193,18680
 700  000c               L571:
 701  000c 3b4dd93c      	dc.w	15181,-9924
 702  0010               L561:
 703  0010 4549ab33      	dc.w	17737,-21709
 704  0014               L521:
 705  0014 256600        	dc.b	"%f",0
 706  0017               L501:
 707  0017 256900        	dc.b	"%i",0
 708                     	xref.b	c_x
 728                     	xref	c_fsub
 729                     	xref	c_ltor
 730                     	xref	c_rtol
 731                     	end
