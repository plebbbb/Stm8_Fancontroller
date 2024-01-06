   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  50                     ; 10 void tach_init(void){
  52                     .text:	section	.text,new
  53  0000               _tach_init:
  57                     ; 11 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, ENABLE);
  59  0000 ae0101        	ldw	x,#257
  60  0003 cd0000        	call	_CLK_PeripheralClockConfig
  62                     ; 14 	TIM3_TimeBaseInit(TIM3_Prescaler_128, TIM3_CounterMode_Up, 248); //2ms clock 
  64  0006 ae00f8        	ldw	x,#248
  65  0009 89            	pushw	x
  66  000a ae0700        	ldw	x,#1792
  67  000d cd0000        	call	_TIM3_TimeBaseInit
  69  0010 85            	popw	x
  70                     ; 16 	TIM3_ClearFlag(TIM3_FLAG_Update);
  72  0011 ae0001        	ldw	x,#1
  73  0014 cd0000        	call	_TIM3_ClearFlag
  75                     ; 17 	TIM3_ITConfig(TIM3_IT_Update, ENABLE);
  77  0017 ae0101        	ldw	x,#257
  78  001a cd0000        	call	_TIM3_ITConfig
  80                     ; 19 	EXTI_SelectPort(EXTI_Port_B);
  82  001d 4f            	clr	a
  83  001e cd0000        	call	_EXTI_SelectPort
  85                     ; 21 	enableInterrupts();
  88  0021 9a            rim
  90                     ; 23 	TIM3_Cmd(ENABLE);
  93  0022 a601          	ld	a,#1
  94  0024 cd0000        	call	_TIM3_Cmd
  96                     ; 24 }
  99  0027 81            	ret
 139                     ; 26 void enable_tach(uint8_t tach){
 140                     .text:	section	.text,new
 141  0000               _enable_tach:
 145                     ; 27 	switch(tach){
 148                     ; 45 		break;
 149  0000 4a            	dec	a
 150  0001 2708          	jreq	L72
 151  0003 4a            	dec	a
 152  0004 2727          	jreq	L13
 153  0006 4a            	dec	a
 154  0007 2746          	jreq	L33
 155  0009 2064          	jra	L55
 156  000b               L72:
 157                     ; 28 		case 1:
 157                     ; 29 			tach1.enabled=1;
 159  000b 35010014      	mov	L3_tach1+6,#1
 160                     ; 30 			GPIO_Init(GPIOB, GPIO_Pin_2, GPIO_Mode_In_FL_IT);
 162  000f 4b20          	push	#32
 163  0011 4b04          	push	#4
 164  0013 ae5005        	ldw	x,#20485
 165  0016 cd0000        	call	_GPIO_Init
 167  0019 85            	popw	x
 168                     ; 31 			GPIO_ExternalPullUpConfig(GPIOB, GPIO_Pin_2, ENABLE);
 170  001a 4b01          	push	#1
 171  001c 4b04          	push	#4
 172  001e ae5005        	ldw	x,#20485
 173  0021 cd0000        	call	_GPIO_ExternalPullUpConfig
 175  0024 85            	popw	x
 176                     ; 32 			EXTI_SetPinSensitivity(GPIO_Pin_2,EXTI_Trigger_Falling_Low);
 178  0025 ae0400        	ldw	x,#1024
 179  0028 cd0000        	call	_EXTI_SetPinSensitivity
 181                     ; 33 		break;
 183  002b 2042          	jra	L55
 184  002d               L13:
 185                     ; 34 		case 2:
 185                     ; 35 			tach2.enabled=2;
 187  002d 3502000d      	mov	L5_tach2+6,#2
 188                     ; 36 			GPIO_Init(GPIOB, GPIO_Pin_3, GPIO_Mode_In_FL_IT);
 190  0031 4b20          	push	#32
 191  0033 4b08          	push	#8
 192  0035 ae5005        	ldw	x,#20485
 193  0038 cd0000        	call	_GPIO_Init
 195  003b 85            	popw	x
 196                     ; 37 			GPIO_ExternalPullUpConfig(GPIOB, GPIO_Pin_3, ENABLE);
 198  003c 4b01          	push	#1
 199  003e 4b08          	push	#8
 200  0040 ae5005        	ldw	x,#20485
 201  0043 cd0000        	call	_GPIO_ExternalPullUpConfig
 203  0046 85            	popw	x
 204                     ; 38 			EXTI_SetPinSensitivity(GPIO_Pin_3,EXTI_Trigger_Rising);
 206  0047 ae0801        	ldw	x,#2049
 207  004a cd0000        	call	_EXTI_SetPinSensitivity
 209                     ; 39 		break;
 211  004d 2020          	jra	L55
 212  004f               L33:
 213                     ; 40 		case 3:
 213                     ; 41 			tach3.enabled=3;
 215  004f 35030006      	mov	L7_tach3+6,#3
 216                     ; 42 			GPIO_Init(GPIOB, GPIO_Pin_5, GPIO_Mode_In_FL_IT);
 218  0053 4b20          	push	#32
 219  0055 4b20          	push	#32
 220  0057 ae5005        	ldw	x,#20485
 221  005a cd0000        	call	_GPIO_Init
 223  005d 85            	popw	x
 224                     ; 43 			GPIO_ExternalPullUpConfig(GPIOB, GPIO_Pin_5, ENABLE);
 226  005e 4b01          	push	#1
 227  0060 4b20          	push	#32
 228  0062 ae5005        	ldw	x,#20485
 229  0065 cd0000        	call	_GPIO_ExternalPullUpConfig
 231  0068 85            	popw	x
 232                     ; 44 			EXTI_SetPinSensitivity(GPIO_Pin_5,EXTI_Trigger_Falling);
 234  0069 ae2002        	ldw	x,#8194
 235  006c cd0000        	call	_EXTI_SetPinSensitivity
 237                     ; 45 		break;
 239  006f               L55:
 240                     ; 48 }
 243  006f 81            	ret
 280                     ; 50 uint32_t get_tach_rpm(uint8_t tach){
 281                     .text:	section	.text,new
 282  0000               _get_tach_rpm:
 286                     ; 52 	switch(tach){
 289                     ; 61 			return (15000.f/(float)tach3.ms_period_last);
 290  0000 4a            	dec	a
 291  0001 2708          	jreq	L75
 292  0003 4a            	dec	a
 293  0004 2724          	jreq	L16
 294  0006 4a            	dec	a
 295  0007 2740          	jreq	L36
 296  0009 205d          	jra	L501
 297  000b               L75:
 298                     ; 53 		case 1:
 298                     ; 54 			if (tach1.warning) return 0;
 300  000b 3d13          	tnz	L3_tach1+5
 301  000d 270b          	jreq	L701
 304  000f ae0000        	ldw	x,#0
 305  0012 bf02          	ldw	c_lreg+2,x
 306  0014 ae0000        	ldw	x,#0
 307  0017 bf00          	ldw	c_lreg,x
 310  0019 81            	ret
 311  001a               L701:
 312                     ; 55 			return (15000.f/(float)tach1.ms_period_last);
 314  001a ae0008        	ldw	x,#L511
 315  001d cd0000        	call	c_ltor
 317  0020 ae000f        	ldw	x,#L3_tach1+1
 318  0023 cd0000        	call	c_fdiv
 320  0026 cd0000        	call	c_ftol
 324  0029 81            	ret
 325  002a               L16:
 326                     ; 56 		case 2:
 326                     ; 57 			if (tach2.warning) return 0;
 328  002a 3d0c          	tnz	L5_tach2+5
 329  002c 270b          	jreq	L121
 332  002e ae0000        	ldw	x,#0
 333  0031 bf02          	ldw	c_lreg+2,x
 334  0033 ae0000        	ldw	x,#0
 335  0036 bf00          	ldw	c_lreg,x
 338  0038 81            	ret
 339  0039               L121:
 340                     ; 58 			return (15000.f/(float)tach2.ms_period_last);
 342  0039 ae0008        	ldw	x,#L511
 343  003c cd0000        	call	c_ltor
 345  003f ae0008        	ldw	x,#L5_tach2+1
 346  0042 cd0000        	call	c_fdiv
 348  0045 cd0000        	call	c_ftol
 352  0048 81            	ret
 353  0049               L36:
 354                     ; 59 		case 3:
 354                     ; 60 			if (tach3.warning) return 0;
 356  0049 3d05          	tnz	L7_tach3+5
 357  004b 270b          	jreq	L321
 360  004d ae0000        	ldw	x,#0
 361  0050 bf02          	ldw	c_lreg+2,x
 362  0052 ae0000        	ldw	x,#0
 363  0055 bf00          	ldw	c_lreg,x
 366  0057 81            	ret
 367  0058               L321:
 368                     ; 61 			return (15000.f/(float)tach3.ms_period_last);
 370  0058 ae0008        	ldw	x,#L511
 371  005b cd0000        	call	c_ltor
 373  005e ae0001        	ldw	x,#L7_tach3+1
 374  0061 cd0000        	call	c_fdiv
 376  0064 cd0000        	call	c_ftol
 380  0067 81            	ret
 381  0068               L501:
 382                     ; 64 }
 385  0068 81            	ret
 409                     ; 66 void tach1_sens_update(void){
 410                     .text:	section	.text,new
 411  0000               _tach1_sens_update:
 413  0000 5208          	subw	sp,#8
 414       00000008      OFST:	set	8
 417                     ; 67 	if (tach1.ms_5 == 0) return;
 419  0002 3d0e          	tnz	L3_tach1
 420  0004 273f          	jreq	L41
 423                     ; 68 	tach1.ms_period_last = tach1.ms_5*0.05 + tach1.ms_period_last*0.95;
 425  0006 ae000f        	ldw	x,#L3_tach1+1
 426  0009 cd0000        	call	c_ltor
 428  000c ae0000        	ldw	x,#L351
 429  000f cd0000        	call	c_fmul
 431  0012 96            	ldw	x,sp
 432  0013 1c0005        	addw	x,#OFST-3
 433  0016 cd0000        	call	c_rtol
 436  0019 b60e          	ld	a,L3_tach1
 437  001b 5f            	clrw	x
 438  001c 97            	ld	xl,a
 439  001d cd0000        	call	c_itof
 441  0020 96            	ldw	x,sp
 442  0021 1c0001        	addw	x,#OFST-7
 443  0024 cd0000        	call	c_rtol
 446  0027 ae0004        	ldw	x,#L341
 447  002a cd0000        	call	c_ltor
 449  002d 96            	ldw	x,sp
 450  002e 1c0001        	addw	x,#OFST-7
 451  0031 cd0000        	call	c_fmul
 453  0034 96            	ldw	x,sp
 454  0035 1c0005        	addw	x,#OFST-3
 455  0038 cd0000        	call	c_fadd
 457  003b ae000f        	ldw	x,#L3_tach1+1
 458  003e cd0000        	call	c_rtol
 460                     ; 69 	tach1.ms_5 = 0;
 462  0041 3f0e          	clr	L3_tach1
 463                     ; 70 	tach1.warning = 0;
 465  0043 3f13          	clr	L3_tach1+5
 466                     ; 71 }
 467  0045               L41:
 470  0045 5b08          	addw	sp,#8
 471  0047 81            	ret
 495                     ; 73 void tach2_sens_update(void){
 496                     .text:	section	.text,new
 497  0000               _tach2_sens_update:
 499  0000 5208          	subw	sp,#8
 500       00000008      OFST:	set	8
 503                     ; 74 	tach2.ms_period_last = tach2.ms_5*0.05 + tach2.ms_period_last*0.95;
 505  0002 ae0008        	ldw	x,#L5_tach2+1
 506  0005 cd0000        	call	c_ltor
 508  0008 ae0000        	ldw	x,#L351
 509  000b cd0000        	call	c_fmul
 511  000e 96            	ldw	x,sp
 512  000f 1c0005        	addw	x,#OFST-3
 513  0012 cd0000        	call	c_rtol
 516  0015 b607          	ld	a,L5_tach2
 517  0017 5f            	clrw	x
 518  0018 97            	ld	xl,a
 519  0019 cd0000        	call	c_itof
 521  001c 96            	ldw	x,sp
 522  001d 1c0001        	addw	x,#OFST-7
 523  0020 cd0000        	call	c_rtol
 526  0023 ae0004        	ldw	x,#L341
 527  0026 cd0000        	call	c_ltor
 529  0029 96            	ldw	x,sp
 530  002a 1c0001        	addw	x,#OFST-7
 531  002d cd0000        	call	c_fmul
 533  0030 96            	ldw	x,sp
 534  0031 1c0005        	addw	x,#OFST-3
 535  0034 cd0000        	call	c_fadd
 537  0037 ae0008        	ldw	x,#L5_tach2+1
 538  003a cd0000        	call	c_rtol
 540                     ; 75 	tach2.ms_5 = 0;
 542  003d 3f07          	clr	L5_tach2
 543                     ; 76 	tach2.warning = 0;
 545  003f 3f0c          	clr	L5_tach2+5
 546                     ; 77 }
 549  0041 5b08          	addw	sp,#8
 550  0043 81            	ret
 574                     ; 79 void tach3_sens_update(void){
 575                     .text:	section	.text,new
 576  0000               _tach3_sens_update:
 578  0000 5208          	subw	sp,#8
 579       00000008      OFST:	set	8
 582                     ; 80 	tach3.ms_period_last = tach3.ms_5*0.05 + tach3.ms_period_last*0.95;
 584  0002 ae0001        	ldw	x,#L7_tach3+1
 585  0005 cd0000        	call	c_ltor
 587  0008 ae0000        	ldw	x,#L351
 588  000b cd0000        	call	c_fmul
 590  000e 96            	ldw	x,sp
 591  000f 1c0005        	addw	x,#OFST-3
 592  0012 cd0000        	call	c_rtol
 595  0015 b600          	ld	a,L7_tach3
 596  0017 5f            	clrw	x
 597  0018 97            	ld	xl,a
 598  0019 cd0000        	call	c_itof
 600  001c 96            	ldw	x,sp
 601  001d 1c0001        	addw	x,#OFST-7
 602  0020 cd0000        	call	c_rtol
 605  0023 ae0004        	ldw	x,#L341
 606  0026 cd0000        	call	c_ltor
 608  0029 96            	ldw	x,sp
 609  002a 1c0001        	addw	x,#OFST-7
 610  002d cd0000        	call	c_fmul
 612  0030 96            	ldw	x,sp
 613  0031 1c0005        	addw	x,#OFST-3
 614  0034 cd0000        	call	c_fadd
 616  0037 ae0001        	ldw	x,#L7_tach3+1
 617  003a cd0000        	call	c_rtol
 619                     ; 81 	tach3.ms_5 = 0;
 621  003d 3f00          	clr	L7_tach3
 622                     ; 82 	tach3.warning = 0;
 624  003f 3f05          	clr	L7_tach3+5
 625                     ; 83 }//*/
 628  0041 5b08          	addw	sp,#8
 629  0043 81            	ret
 655                     ; 91  void tach_ms_inc(void){
 656                     .text:	section	.text,new
 657  0000               _tach_ms_inc:
 661                     ; 93 	if (tach1.enabled){
 663  0000 3d14          	tnz	L3_tach1+6
 664  0002 270e          	jreq	L702
 665                     ; 94 		if(tach1.ms_5 >= 200) tach1.warning = 1;
 667  0004 b60e          	ld	a,L3_tach1
 668  0006 a1c8          	cp	a,#200
 669  0008 2506          	jrult	L112
 672  000a 35010013      	mov	L3_tach1+5,#1
 674  000e 2002          	jra	L702
 675  0010               L112:
 676                     ; 95 		else tach1.ms_5++;
 678  0010 3c0e          	inc	L3_tach1
 679  0012               L702:
 680                     ; 97 	if (tach2.enabled){
 682  0012 3d0d          	tnz	L5_tach2+6
 683  0014 270e          	jreq	L512
 684                     ; 98 		if(tach2.ms_5 >= 200) tach2.warning = 1;
 686  0016 b607          	ld	a,L5_tach2
 687  0018 a1c8          	cp	a,#200
 688  001a 2506          	jrult	L712
 691  001c 3501000c      	mov	L5_tach2+5,#1
 693  0020 2002          	jra	L512
 694  0022               L712:
 695                     ; 99 		else tach2.ms_5++;
 697  0022 3c07          	inc	L5_tach2
 698  0024               L512:
 699                     ; 101 	if (tach3.enabled){
 701  0024 3d06          	tnz	L7_tach3+6
 702  0026 270e          	jreq	L322
 703                     ; 102 		if(tach3.ms_5 >= 200) tach3.warning = 1;
 705  0028 b600          	ld	a,L7_tach3
 706  002a a1c8          	cp	a,#200
 707  002c 2506          	jrult	L522
 710  002e 35010005      	mov	L7_tach3+5,#1
 712  0032 2002          	jra	L322
 713  0034               L522:
 714                     ; 103 		else tach3.ms_5++;
 716  0034 3c00          	inc	L7_tach3
 717  0036               L322:
 718                     ; 105 }
 721  0036 81            	ret
 831                     	xdef	_tach_ms_inc
 832                     	xdef	_tach3_sens_update
 833                     	xdef	_tach2_sens_update
 834                     	xdef	_tach1_sens_update
 835                     	switch	.ubsct
 836  0000               L7_tach3:
 837  0000 000000000000  	ds.b	7
 838  0007               L5_tach2:
 839  0007 000000000000  	ds.b	7
 840  000e               L3_tach1:
 841  000e 000000000000  	ds.b	7
 842                     	xdef	_get_tach_rpm
 843                     	xdef	_enable_tach
 844                     	xdef	_tach_init
 845                     	xref	_TIM3_ClearFlag
 846                     	xref	_TIM3_ITConfig
 847                     	xref	_TIM3_Cmd
 848                     	xref	_TIM3_TimeBaseInit
 849                     	xref	_GPIO_ExternalPullUpConfig
 850                     	xref	_GPIO_Init
 851                     	xref	_EXTI_SelectPort
 852                     	xref	_EXTI_SetPinSensitivity
 853                     	xref	_CLK_PeripheralClockConfig
 854                     .const:	section	.text
 855  0000               L351:
 856  0000 3f733333      	dc.w	16243,13107
 857  0004               L341:
 858  0004 3d4ccccc      	dc.w	15692,-13108
 859  0008               L511:
 860  0008 466a6000      	dc.w	18026,24576
 861                     	xref.b	c_lreg
 862                     	xref.b	c_x
 882                     	xref	c_fadd
 883                     	xref	c_fmul
 884                     	xref	c_rtol
 885                     	xref	c_itof
 886                     	xref	c_ftol
 887                     	xref	c_fdiv
 888                     	xref	c_ltor
 889                     	end
