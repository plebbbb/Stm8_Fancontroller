   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  46                     ; 28 void setup(void){
  48                     .text:	section	.text,new
  49  0000               _setup:
  53                     ; 29 	clock_init();
  55  0000 cd0000        	call	_clock_init
  57                     ; 31 	serial_init();
  59  0003 cd0000        	call	_serial_init
  61                     ; 32 	adc_subsystem_init();
  63  0006 cd0000        	call	_adc_subsystem_init
  65                     ; 33 }
  68  0009 81            	ret
  93                     ; 35 void hw_config(void){
  94                     .text:	section	.text,new
  95  0000               _hw_config:
  99                     ; 38 	v_control_init();
 101  0000 cd0000        	call	_v_control_init
 103                     ; 39 	pwm_control_init(2);
 105  0003 ae0002        	ldw	x,#2
 106  0006 cd0000        	call	_pwm_control_init
 108                     ; 41 }
 111  0009 81            	ret
 139                     ; 43 void hw_setIC(void){
 140                     .text:	section	.text,new
 141  0000               _hw_setIC:
 145                     ; 44 	v_control_active(1);
 147  0000 a601          	ld	a,#1
 148  0002 cd0000        	call	_v_control_active
 150                     ; 45 	v_control_setoutput(40);
 152  0005 a628          	ld	a,#40
 153  0007 cd0000        	call	_v_control_setoutput
 155                     ; 46 	pwm_control_setoutput(2,40);
 157  000a ae0028        	ldw	x,#40
 158  000d 89            	pushw	x
 159  000e ae0002        	ldw	x,#2
 160  0011 cd0000        	call	_pwm_control_setoutput
 162  0014 85            	popw	x
 163                     ; 47 	enableInterrupts();
 166  0015 9a            rim
 168                     ; 48 	delay(1000);
 171  0016 ae03e8        	ldw	x,#1000
 172  0019 89            	pushw	x
 173  001a ae0000        	ldw	x,#0
 174  001d 89            	pushw	x
 175  001e cd0000        	call	_delay
 177  0021 5b04          	addw	sp,#4
 178                     ; 49 }
 181  0023 81            	ret
 184                     	bsct
 185  0000               _e:
 186  0000 0001          	dc.w	1
 187  0002               _stored_rxbuffer:
 188  0002 03            	dc.b	3
 189  0003               _temp_rxbuffer_verify:
 190  0003 03            	dc.b	3
 220                     ; 71 void calc_params(void){
 221                     .text:	section	.text,new
 222  0000               _calc_params:
 224  0000 5208          	subw	sp,#8
 225       00000008      OFST:	set	8
 228                     ; 73 	max_temp = 55+5*((stored_rxbuffer & 0b00001100) >> 2);
 230  0002 b602          	ld	a,_stored_rxbuffer
 231  0004 44            	srl	a
 232  0005 44            	srl	a
 233  0006 a403          	and	a,#3
 234  0008 97            	ld	xl,a
 235  0009 a605          	ld	a,#5
 236  000b 42            	mul	x,a
 237  000c 9f            	ld	a,xl
 238  000d ab37          	add	a,#55
 239  000f b719          	ld	_max_temp,a
 240                     ; 76 	min_temp = 20+5*((stored_rxbuffer & 0b00110000) >> 4);
 242  0011 b602          	ld	a,_stored_rxbuffer
 243  0013 4e            	swap	a
 244  0014 a40f          	and	a,#15
 245  0016 a403          	and	a,#3
 246  0018 97            	ld	xl,a
 247  0019 a605          	ld	a,#5
 248  001b 42            	mul	x,a
 249  001c 9f            	ld	a,xl
 250  001d ab14          	add	a,#20
 251  001f b718          	ld	_min_temp,a
 252                     ; 79 	min_fan_DC = 25*((stored_rxbuffer & 0b01000000) >> 6);
 254  0021 b602          	ld	a,_stored_rxbuffer
 255  0023 4e            	swap	a
 256  0024 44            	srl	a
 257  0025 44            	srl	a
 258  0026 a403          	and	a,#3
 259  0028 a401          	and	a,#1
 260  002a 97            	ld	xl,a
 261  002b a619          	ld	a,#25
 262  002d 42            	mul	x,a
 263  002e 9f            	ld	a,xl
 264  002f b717          	ld	_min_fan_DC,a
 265                     ; 82 	min_pump_DC = 25 + 15*((stored_rxbuffer & 0b10000000) >> 7);
 267  0031 b602          	ld	a,_stored_rxbuffer
 268  0033 49            	rlc	a
 269  0034 4f            	clr	a
 270  0035 49            	rlc	a
 271  0036 97            	ld	xl,a
 272  0037 a60f          	ld	a,#15
 273  0039 42            	mul	x,a
 274  003a 9f            	ld	a,xl
 275  003b ab19          	add	a,#25
 276  003d b716          	ld	_min_pump_DC,a
 277                     ; 84 	DC_fan_gain = (min_fan_DC - 100) / (min_temp - max_temp);
 279  003f b618          	ld	a,_min_temp
 280  0041 5f            	clrw	x
 281  0042 b019          	sub	a,_max_temp
 282  0044 2401          	jrnc	L41
 283  0046 5a            	decw	x
 284  0047               L41:
 285  0047 02            	rlwa	x,a
 286  0048 b617          	ld	a,_min_fan_DC
 287  004a 905f          	clrw	y
 288  004c 9097          	ld	yl,a
 289  004e 72a20064      	subw	y,#100
 290  0052 51            	exgw	x,y
 291  0053 cd0000        	call	c_idiv
 293  0056 51            	exgw	x,y
 294  0057 51            	exgw	x,y
 295  0058 cd0000        	call	c_itof
 297  005b 51            	exgw	x,y
 298  005c ae000e        	ldw	x,#_DC_fan_gain
 299  005f cd0000        	call	c_rtol
 301                     ; 85 	DC_pump_gain = (min_pump_DC - 100) / (min_temp - max_temp);
 303  0062 b618          	ld	a,_min_temp
 304  0064 5f            	clrw	x
 305  0065 b019          	sub	a,_max_temp
 306  0067 2401          	jrnc	L61
 307  0069 5a            	decw	x
 308  006a               L61:
 309  006a 02            	rlwa	x,a
 310  006b b616          	ld	a,_min_pump_DC
 311  006d 905f          	clrw	y
 312  006f 9097          	ld	yl,a
 313  0071 72a20064      	subw	y,#100
 314  0075 51            	exgw	x,y
 315  0076 cd0000        	call	c_idiv
 317  0079 51            	exgw	x,y
 318  007a 51            	exgw	x,y
 319  007b cd0000        	call	c_itof
 321  007e 51            	exgw	x,y
 322  007f ae000a        	ldw	x,#_DC_pump_gain
 323  0082 cd0000        	call	c_rtol
 325                     ; 87 	DC_fan_offset = 100 - DC_fan_gain * max_temp;
 327  0085 b619          	ld	a,_max_temp
 328  0087 5f            	clrw	x
 329  0088 97            	ld	xl,a
 330  0089 cd0000        	call	c_itof
 332  008c 96            	ldw	x,sp
 333  008d 1c0005        	addw	x,#OFST-3
 334  0090 cd0000        	call	c_rtol
 337  0093 ae000e        	ldw	x,#_DC_fan_gain
 338  0096 cd0000        	call	c_ltor
 340  0099 96            	ldw	x,sp
 341  009a 1c0005        	addw	x,#OFST-3
 342  009d cd0000        	call	c_fmul
 344  00a0 96            	ldw	x,sp
 345  00a1 1c0001        	addw	x,#OFST-7
 346  00a4 cd0000        	call	c_rtol
 349  00a7 a664          	ld	a,#100
 350  00a9 cd0000        	call	c_ctof
 352  00ac 96            	ldw	x,sp
 353  00ad 1c0001        	addw	x,#OFST-7
 354  00b0 cd0000        	call	c_fsub
 356  00b3 ae0006        	ldw	x,#_DC_fan_offset
 357  00b6 cd0000        	call	c_rtol
 359                     ; 88 	DC_pump_offset = 100 - DC_pump_gain * max_temp;
 361  00b9 b619          	ld	a,_max_temp
 362  00bb 5f            	clrw	x
 363  00bc 97            	ld	xl,a
 364  00bd cd0000        	call	c_itof
 366  00c0 96            	ldw	x,sp
 367  00c1 1c0005        	addw	x,#OFST-3
 368  00c4 cd0000        	call	c_rtol
 371  00c7 ae000a        	ldw	x,#_DC_pump_gain
 372  00ca cd0000        	call	c_ltor
 374  00cd 96            	ldw	x,sp
 375  00ce 1c0005        	addw	x,#OFST-3
 376  00d1 cd0000        	call	c_fmul
 378  00d4 96            	ldw	x,sp
 379  00d5 1c0001        	addw	x,#OFST-7
 380  00d8 cd0000        	call	c_rtol
 383  00db a664          	ld	a,#100
 384  00dd cd0000        	call	c_ctof
 386  00e0 96            	ldw	x,sp
 387  00e1 1c0001        	addw	x,#OFST-7
 388  00e4 cd0000        	call	c_fsub
 390  00e7 ae0002        	ldw	x,#_DC_pump_offset
 391  00ea cd0000        	call	c_rtol
 393                     ; 89 }
 396  00ed 5b08          	addw	sp,#8
 397  00ef 81            	ret
 442                     ; 92 void main(){
 443                     .text:	section	.text,new
 444  0000               _main:
 446  0000 5204          	subw	sp,#4
 447       00000004      OFST:	set	4
 450                     ; 93 	setup();
 452  0002 cd0000        	call	_setup
 454                     ; 94 	hw_config();
 456  0005 cd0000        	call	_hw_config
 458                     ; 95 	hw_setIC();
 460  0008 cd0000        	call	_hw_setIC
 462                     ; 96 	calc_params();
 464  000b cd0000        	call	_calc_params
 466  000e               L17:
 467                     ; 100 		delay(500);
 469  000e ae01f4        	ldw	x,#500
 470  0011 89            	pushw	x
 471  0012 ae0000        	ldw	x,#0
 472  0015 89            	pushw	x
 473  0016 cd0000        	call	_delay
 475  0019 5b04          	addw	sp,#4
 476                     ; 102 		e = -e;
 478  001b be00          	ldw	x,_e
 479  001d 50            	negw	x
 480  001e bf00          	ldw	_e,x
 481                     ; 103 		if (stored_rxbuffer != rx_buffer){
 483  0020 b602          	ld	a,_stored_rxbuffer
 484  0022 b100          	cp	a,_rx_buffer
 485  0024 2730          	jreq	L57
 486                     ; 105 			if (temp_rxbuffer_verify == rx_buffer) {
 488  0026 b603          	ld	a,_temp_rxbuffer_verify
 489  0028 b100          	cp	a,_rx_buffer
 490  002a 2618          	jrne	L77
 491                     ; 106 				stored_rxbuffer = rx_buffer;
 493  002c 450002        	mov	_stored_rxbuffer,_rx_buffer
 494                     ; 107 				temp_rxbuffer_verify = stored_rxbuffer;
 496  002f 450203        	mov	_temp_rxbuffer_verify,_stored_rxbuffer
 497                     ; 108 				calc_params();
 499  0032 cd0000        	call	_calc_params
 502  0035               L301:
 503                     ; 109 				while(!serial_tx_buf_write((void*)&stored_rxbuffer,1));
 505  0035 4b01          	push	#1
 506  0037 ae0002        	ldw	x,#_stored_rxbuffer
 507  003a cd0000        	call	_serial_tx_buf_write
 509  003d 5b01          	addw	sp,#1
 510  003f 4d            	tnz	a
 511  0040 27f3          	jreq	L301
 512                     ; 110 				continue; //wait 1s to see if retransmit verification occurs on reciever side.
 514  0042 20ca          	jra	L17
 515  0044               L77:
 516                     ; 115 				temp_rxbuffer_verify = rx_buffer;
 518  0044 450003        	mov	_temp_rxbuffer_verify,_rx_buffer
 520  0047               L511:
 521                     ; 116 				while (!serial_tx_buf_write((void*)&temp_rxbuffer_verify, 1));
 523  0047 4b01          	push	#1
 524  0049 ae0003        	ldw	x,#_temp_rxbuffer_verify
 525  004c cd0000        	call	_serial_tx_buf_write
 527  004f 5b01          	addw	sp,#1
 528  0051 4d            	tnz	a
 529  0052 27f3          	jreq	L511
 530                     ; 117 				continue;
 532  0054 20b8          	jra	L17
 533  0056               L57:
 534                     ; 121 		Temp_C = adc_sensor_read_C(adc_FAN1)*0.2 + 0.8*Temp_C;
 536  0056 ae0012        	ldw	x,#_Temp_C
 537  0059 cd0000        	call	c_ltor
 539  005c ae0000        	ldw	x,#L531
 540  005f cd0000        	call	c_fmul
 542  0062 96            	ldw	x,sp
 543  0063 1c0001        	addw	x,#OFST-3
 544  0066 cd0000        	call	c_rtol
 547  0069 ae0000        	ldw	x,#_adc_FAN1
 548  006c bf00          	ldw	c_x,x
 549  006e ae0012        	ldw	x,#18
 550  0071               L22:
 551  0071 5a            	decw	x
 552  0072 92d600        	ld	a,([c_x],x)
 553  0075 88            	push	a
 554  0076 5d            	tnzw	x
 555  0077 26f8          	jrne	L22
 556  0079 cd0000        	call	_adc_sensor_read_C
 558  007c 5b12          	addw	sp,#18
 559  007e ae0004        	ldw	x,#L521
 560  0081 cd0000        	call	c_fmul
 562  0084 96            	ldw	x,sp
 563  0085 1c0001        	addw	x,#OFST-3
 564  0088 cd0000        	call	c_fadd
 566  008b ae0012        	ldw	x,#_Temp_C
 567  008e cd0000        	call	c_rtol
 569                     ; 122 		tgt_duty_cycle_fan = (DC_fan_gain*Temp_C + DC_fan_offset);
 571  0091 ae000e        	ldw	x,#_DC_fan_gain
 572  0094 cd0000        	call	c_ltor
 574  0097 ae0012        	ldw	x,#_Temp_C
 575  009a cd0000        	call	c_fmul
 577  009d ae0006        	ldw	x,#_DC_fan_offset
 578  00a0 cd0000        	call	c_fadd
 580  00a3 cd0000        	call	c_ftol
 582  00a6 b603          	ld	a,c_lreg+3
 583  00a8 b701          	ld	_tgt_duty_cycle_fan,a
 584                     ; 123 		tgt_duty_cycle_pump = (DC_pump_gain*Temp_C + DC_pump_offset);
 586  00aa ae000a        	ldw	x,#_DC_pump_gain
 587  00ad cd0000        	call	c_ltor
 589  00b0 ae0012        	ldw	x,#_Temp_C
 590  00b3 cd0000        	call	c_fmul
 592  00b6 ae0002        	ldw	x,#_DC_pump_offset
 593  00b9 cd0000        	call	c_fadd
 595  00bc cd0000        	call	c_ftol
 597  00bf b603          	ld	a,c_lreg+3
 598  00c1 b700          	ld	_tgt_duty_cycle_pump,a
 599                     ; 125 		if (tgt_duty_cycle_fan > 100) tgt_duty_cycle_fan = 100;
 601  00c3 b601          	ld	a,_tgt_duty_cycle_fan
 602  00c5 a165          	cp	a,#101
 603  00c7 2504          	jrult	L141
 606  00c9 35640001      	mov	_tgt_duty_cycle_fan,#100
 607  00cd               L141:
 608                     ; 126 		if (tgt_duty_cycle_fan < DC_fan_offset) tgt_duty_cycle_fan = DC_fan_offset;
 610  00cd 9c            	rvf
 611  00ce b601          	ld	a,_tgt_duty_cycle_fan
 612  00d0 5f            	clrw	x
 613  00d1 97            	ld	xl,a
 614  00d2 cd0000        	call	c_itof
 616  00d5 ae0006        	ldw	x,#_DC_fan_offset
 617  00d8 cd0000        	call	c_fcmp
 619  00db 2e0d          	jrsge	L341
 622  00dd ae0006        	ldw	x,#_DC_fan_offset
 623  00e0 cd0000        	call	c_ltor
 625  00e3 cd0000        	call	c_ftol
 627  00e6 b603          	ld	a,c_lreg+3
 628  00e8 b701          	ld	_tgt_duty_cycle_fan,a
 629  00ea               L341:
 630                     ; 127 		if (tgt_duty_cycle_pump > 100) tgt_duty_cycle_pump = 100;
 632  00ea b600          	ld	a,_tgt_duty_cycle_pump
 633  00ec a165          	cp	a,#101
 634  00ee 2504          	jrult	L541
 637  00f0 35640000      	mov	_tgt_duty_cycle_pump,#100
 638  00f4               L541:
 639                     ; 128 		if (tgt_duty_cycle_pump < DC_pump_offset) tgt_duty_cycle_pump = DC_pump_offset;
 641  00f4 9c            	rvf
 642  00f5 b600          	ld	a,_tgt_duty_cycle_pump
 643  00f7 5f            	clrw	x
 644  00f8 97            	ld	xl,a
 645  00f9 cd0000        	call	c_itof
 647  00fc ae0002        	ldw	x,#_DC_pump_offset
 648  00ff cd0000        	call	c_fcmp
 650  0102 2e0d          	jrsge	L741
 653  0104 ae0002        	ldw	x,#_DC_pump_offset
 654  0107 cd0000        	call	c_ltor
 656  010a cd0000        	call	c_ftol
 658  010d b603          	ld	a,c_lreg+3
 659  010f b700          	ld	_tgt_duty_cycle_pump,a
 660  0111               L741:
 661                     ; 130 		switch (stored_rxbuffer & 0b00000001){
 663  0111 b602          	ld	a,_stored_rxbuffer
 664  0113 a401          	and	a,#1
 666                     ; 138 				pwm_control_setoutput(2,tgt_duty_cycle_fan);
 667  0115 4d            	tnz	a
 668  0116 2705          	jreq	L15
 669  0118 4a            	dec	a
 670  0119 2711          	jreq	L35
 671  011b 2025          	jra	L351
 672  011d               L15:
 673                     ; 131 			case 0:
 673                     ; 132 				v_control_active(0);
 675  011d 4f            	clr	a
 676  011e cd0000        	call	_v_control_active
 678                     ; 133 				pwm_control_setoutput(2,0);
 680  0121 5f            	clrw	x
 681  0122 89            	pushw	x
 682  0123 ae0002        	ldw	x,#2
 683  0126 cd0000        	call	_pwm_control_setoutput
 685  0129 85            	popw	x
 686                     ; 134 				break;
 688  012a 2016          	jra	L351
 689  012c               L35:
 690                     ; 135 			case 1:
 690                     ; 136 				v_control_active(1);
 692  012c a601          	ld	a,#1
 693  012e cd0000        	call	_v_control_active
 695                     ; 137 				v_control_setoutput(tgt_duty_cycle_pump);
 697  0131 b600          	ld	a,_tgt_duty_cycle_pump
 698  0133 cd0000        	call	_v_control_setoutput
 700                     ; 138 				pwm_control_setoutput(2,tgt_duty_cycle_fan);
 702  0136 b601          	ld	a,_tgt_duty_cycle_fan
 703  0138 5f            	clrw	x
 704  0139 97            	ld	xl,a
 705  013a 89            	pushw	x
 706  013b ae0002        	ldw	x,#2
 707  013e cd0000        	call	_pwm_control_setoutput
 709  0141 85            	popw	x
 710  0142               L351:
 711                     ; 142 		switch ((stored_rxbuffer & 0b00000010) >> 1){
 713  0142 b602          	ld	a,_stored_rxbuffer
 714  0144 44            	srl	a
 715  0145 5f            	clrw	x
 716  0146 a401          	and	a,#1
 717  0148 5f            	clrw	x
 718  0149 5f            	clrw	x
 719  014a 97            	ld	xl,a
 720  014b a30001        	cpw	x,#1
 721  014e 2703          	jreq	L62
 722  0150 cc000e        	jp	L17
 723  0153               L62:
 726  0153               L55:
 727                     ; 143 			case 1:
 727                     ; 144 				serial_tx_buf_write((void*)&Temp_C, 4);
 729  0153 4b04          	push	#4
 730  0155 ae0012        	ldw	x,#_Temp_C
 731  0158 cd0000        	call	_serial_tx_buf_write
 733  015b 84            	pop	a
 734  015c ac0e000e      	jpf	L17
 735  0160               L75:
 736                     ; 145 			case 0:
 736                     ; 146 				break;
 738  0160 ac0e000e      	jpf	L17
 881                     	xdef	_main
 882                     	xdef	_calc_params
 883                     	switch	.ubsct
 884  0000               _tgt_duty_cycle_pump:
 885  0000 00            	ds.b	1
 886                     	xdef	_tgt_duty_cycle_pump
 887  0001               _tgt_duty_cycle_fan:
 888  0001 00            	ds.b	1
 889                     	xdef	_tgt_duty_cycle_fan
 890                     	xdef	_temp_rxbuffer_verify
 891                     	xdef	_stored_rxbuffer
 892  0002               _DC_pump_offset:
 893  0002 00000000      	ds.b	4
 894                     	xdef	_DC_pump_offset
 895  0006               _DC_fan_offset:
 896  0006 00000000      	ds.b	4
 897                     	xdef	_DC_fan_offset
 898  000a               _DC_pump_gain:
 899  000a 00000000      	ds.b	4
 900                     	xdef	_DC_pump_gain
 901  000e               _DC_fan_gain:
 902  000e 00000000      	ds.b	4
 903                     	xdef	_DC_fan_gain
 904  0012               _Temp_C:
 905  0012 00000000      	ds.b	4
 906                     	xdef	_Temp_C
 907                     	xdef	_e
 908  0016               _min_pump_DC:
 909  0016 00            	ds.b	1
 910                     	xdef	_min_pump_DC
 911  0017               _min_fan_DC:
 912  0017 00            	ds.b	1
 913                     	xdef	_min_fan_DC
 914  0018               _min_temp:
 915  0018 00            	ds.b	1
 916                     	xdef	_min_temp
 917  0019               _max_temp:
 918  0019 00            	ds.b	1
 919                     	xdef	_max_temp
 920                     	xdef	_hw_setIC
 921                     	xdef	_hw_config
 922                     	xdef	_setup
 923                     	xref	_serial_tx_buf_write
 924                     	xref	_serial_init
 925                     	xref.b	_rx_buffer
 926                     	xref	_delay
 927                     	xref	_clock_init
 928                     	xref	_adc_sensor_read_C
 929                     	xref	_adc_subsystem_init
 930                     	xref.b	_adc_FAN1
 931                     	xref	_pwm_control_setoutput
 932                     	xref	_pwm_control_init
 933                     	xref	_v_control_setoutput
 934                     	xref	_v_control_active
 935                     	xref	_v_control_init
 936                     .const:	section	.text
 937  0000               L531:
 938  0000 3f4ccccc      	dc.w	16204,-13108
 939  0004               L521:
 940  0004 3e4ccccc      	dc.w	15948,-13108
 941                     	xref.b	c_lreg
 942                     	xref.b	c_x
 962                     	xref	c_fcmp
 963                     	xref	c_ftol
 964                     	xref	c_fadd
 965                     	xref	c_fsub
 966                     	xref	c_fmul
 967                     	xref	c_ltor
 968                     	xref	c_ctof
 969                     	xref	c_rtol
 970                     	xref	c_itof
 971                     	xref	c_idiv
 972                     	end
