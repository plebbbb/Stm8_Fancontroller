   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  49                     ; 9 void tach_init(void){
  51                     .text:	section	.text,new
  52  0000               _tach_init:
  56                     ; 10 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, ENABLE);
  58  0000 ae0101        	ldw	x,#257
  59  0003 cd0000        	call	_CLK_PeripheralClockConfig
  61                     ; 12 	TIM3_TimeBaseInit(TIM3_Prescaler_128, TIM3_CounterMode_Up, 624); //5ms clock 
  63  0006 ae0270        	ldw	x,#624
  64  0009 89            	pushw	x
  65  000a ae0700        	ldw	x,#1792
  66  000d cd0000        	call	_TIM3_TimeBaseInit
  68  0010 85            	popw	x
  69                     ; 13 	TIM3_ClearFlag(TIM3_FLAG_Update);
  71  0011 ae0001        	ldw	x,#1
  72  0014 cd0000        	call	_TIM3_ClearFlag
  74                     ; 14 	TIM3_ITConfig(TIM3_IT_Update, ENABLE);
  76  0017 ae0101        	ldw	x,#257
  77  001a cd0000        	call	_TIM3_ITConfig
  79                     ; 18 	enableInterrupts();
  82  001d 9a            rim
  84                     ; 20 	TIM3_Cmd(ENABLE);
  87  001e a601          	ld	a,#1
  88  0020 cd0000        	call	_TIM3_Cmd
  90                     ; 21 }
  93  0023 81            	ret
 133                     ; 23 void enable_tach(uint8_t tach){
 134                     .text:	section	.text,new
 135  0000               _enable_tach:
 139                     ; 24 		switch(tach){
 142                     ; 42 		break;
 143  0000 4a            	dec	a
 144  0001 2708          	jreq	L12
 145  0003 4a            	dec	a
 146  0004 2721          	jreq	L32
 147  0006 4a            	dec	a
 148  0007 273a          	jreq	L52
 149  0009 2058          	jra	L74
 150  000b               L12:
 151                     ; 25 		case 1:
 151                     ; 26 			tach1.enabled = 1;
 153  000b 3501000b      	mov	_tach1+3,#1
 154                     ; 27 			GPIO_Init(GPIOB, GPIO_Pin_2, GPIO_Mode_In_FL_No_IT);
 156  000f 4b00          	push	#0
 157  0011 4b04          	push	#4
 158  0013 ae5005        	ldw	x,#20485
 159  0016 cd0000        	call	_GPIO_Init
 161  0019 85            	popw	x
 162                     ; 28 			GPIO_ExternalPullUpConfig(GPIOB, GPIO_Pin_2, ENABLE);
 164  001a 4b01          	push	#1
 165  001c 4b04          	push	#4
 166  001e ae5005        	ldw	x,#20485
 167  0021 cd0000        	call	_GPIO_ExternalPullUpConfig
 169  0024 85            	popw	x
 170                     ; 30 		break;
 172  0025 203c          	jra	L74
 173  0027               L32:
 174                     ; 31 		case 2:
 174                     ; 32 			tach2.enabled = 1;
 176  0027 35010007      	mov	_tach2+3,#1
 177                     ; 33 			GPIO_Init(GPIOB, GPIO_Pin_3, GPIO_Mode_In_FL_No_IT);
 179  002b 4b00          	push	#0
 180  002d 4b08          	push	#8
 181  002f ae5005        	ldw	x,#20485
 182  0032 cd0000        	call	_GPIO_Init
 184  0035 85            	popw	x
 185                     ; 34 			GPIO_ExternalPullUpConfig(GPIOB, GPIO_Pin_3, ENABLE);
 187  0036 4b01          	push	#1
 188  0038 4b08          	push	#8
 189  003a ae5005        	ldw	x,#20485
 190  003d cd0000        	call	_GPIO_ExternalPullUpConfig
 192  0040 85            	popw	x
 193                     ; 36 		break;
 195  0041 2020          	jra	L74
 196  0043               L52:
 197                     ; 37 		case 3:
 197                     ; 38 			tach3.enabled = 1;
 199  0043 35010003      	mov	_tach3+3,#1
 200                     ; 39 			GPIO_Init(GPIOB, GPIO_Pin_5, GPIO_Mode_In_FL_IT);
 202  0047 4b20          	push	#32
 203  0049 4b20          	push	#32
 204  004b ae5005        	ldw	x,#20485
 205  004e cd0000        	call	_GPIO_Init
 207  0051 85            	popw	x
 208                     ; 40 			GPIO_ExternalPullUpConfig(GPIOB, GPIO_Pin_5, ENABLE);
 210  0052 4b01          	push	#1
 211  0054 4b20          	push	#32
 212  0056 ae5005        	ldw	x,#20485
 213  0059 cd0000        	call	_GPIO_ExternalPullUpConfig
 215  005c 85            	popw	x
 216                     ; 41 			EXTI_SetPinSensitivity(GPIO_Pin_5,EXTI_Trigger_Falling);
 218  005d ae2002        	ldw	x,#8194
 219  0060 cd0000        	call	_EXTI_SetPinSensitivity
 221                     ; 42 		break;
 223  0063               L74:
 224                     ; 44 }
 227  0063 81            	ret
 264                     ; 46 uint32_t get_tach_rpm(uint8_t tach){
 265                     .text:	section	.text,new
 266  0000               _get_tach_rpm:
 270                     ; 47 	switch(tach){
 273                     ; 52 		case 3:
 273                     ; 53 			return 6000/tach3.ms_period_last;
 274  0000 4a            	dec	a
 275  0001 2708          	jreq	L15
 276  0003 4a            	dec	a
 277  0004 2715          	jreq	L35
 278  0006 4a            	dec	a
 279  0007 2722          	jreq	L55
 280  0009 2030          	jra	L77
 281  000b               L15:
 282                     ; 48 		case 1:
 282                     ; 49 			return 6000/tach1.ms_period_last;
 284  000b ae1770        	ldw	x,#6000
 285  000e b609          	ld	a,_tach1+1
 286  0010 905f          	clrw	y
 287  0012 9097          	ld	yl,a
 288  0014 cd0000        	call	c_idiv
 290  0017 cd0000        	call	c_itolx
 294  001a 81            	ret
 295  001b               L35:
 296                     ; 50 		case 2:
 296                     ; 51 			return 6000/tach2.ms_period_last;
 298  001b ae1770        	ldw	x,#6000
 299  001e b605          	ld	a,_tach2+1
 300  0020 905f          	clrw	y
 301  0022 9097          	ld	yl,a
 302  0024 cd0000        	call	c_idiv
 304  0027 cd0000        	call	c_itolx
 308  002a 81            	ret
 309  002b               L55:
 310                     ; 52 		case 3:
 310                     ; 53 			return 6000/tach3.ms_period_last;
 312  002b ae1770        	ldw	x,#6000
 313  002e b601          	ld	a,_tach3+1
 314  0030 905f          	clrw	y
 315  0032 9097          	ld	yl,a
 316  0034 cd0000        	call	c_idiv
 318  0037 cd0000        	call	c_itolx
 322  003a 81            	ret
 323  003b               L77:
 324                     ; 56 }
 327  003b 81            	ret
 351                     ; 58 void tach1_sens_update(void){
 352                     .text:	section	.text,new
 353  0000               _tach1_sens_update:
 357                     ; 59 	tach1.ms_period_last = tach1.ms_5;
 359  0000 450809        	mov	_tach1+1,_tach1
 360                     ; 61 }
 363  0003 81            	ret
 387                     ; 63 void tach2_sens_update(void){
 388                     .text:	section	.text,new
 389  0000               _tach2_sens_update:
 393                     ; 64 	tach2.ms_period_last = tach2.ms_5;
 395  0000 450405        	mov	_tach2+1,_tach2
 396                     ; 66 }
 399  0003 81            	ret
 423                     ; 68 void tach3_sens_update(void){
 424                     .text:	section	.text,new
 425  0000               _tach3_sens_update:
 429                     ; 69 	tach3.ms_period_last = tach3.ms_5;
 431  0000 450001        	mov	_tach3+1,_tach3
 432                     ; 71 }
 435  0003 81            	ret
 461                     ; 73  void tach_ms_inc(void){
 462                     .text:	section	.text,new
 463  0000               _tach_ms_inc:
 467                     ; 74 	if (tach1.enabled){
 469  0000 3d0b          	tnz	_tach1+3
 470  0002 270e          	jreq	L141
 471                     ; 75 		if(tach1.ms_5 >= 200) tach1.warning = 1;
 473  0004 b608          	ld	a,_tach1
 474  0006 a1c8          	cp	a,#200
 475  0008 2506          	jrult	L341
 478  000a 3501000a      	mov	_tach1+2,#1
 480  000e 2002          	jra	L141
 481  0010               L341:
 482                     ; 76 		else tach1.ms_5++;
 484  0010 3c08          	inc	_tach1
 485  0012               L141:
 486                     ; 78 	if (tach2.enabled){
 488  0012 3d07          	tnz	_tach2+3
 489  0014 270e          	jreq	L741
 490                     ; 79 		if(tach2.ms_5 >= 200) tach2.warning = 1;
 492  0016 b604          	ld	a,_tach2
 493  0018 a1c8          	cp	a,#200
 494  001a 2506          	jrult	L151
 497  001c 35010006      	mov	_tach2+2,#1
 499  0020 2002          	jra	L741
 500  0022               L151:
 501                     ; 80 		else tach2.ms_5++;
 503  0022 3c04          	inc	_tach2
 504  0024               L741:
 505                     ; 82 	if (tach3.enabled){
 507  0024 3d03          	tnz	_tach3+3
 508  0026 270e          	jreq	L551
 509                     ; 83 		if(tach3.ms_5 >= 200) tach3.warning = 1;
 511  0028 b600          	ld	a,_tach3
 512  002a a1c8          	cp	a,#200
 513  002c 2506          	jrult	L751
 516  002e 35010002      	mov	_tach3+2,#1
 518  0032 2002          	jra	L551
 519  0034               L751:
 520                     ; 84 		else tach3.ms_5++;
 522  0034 3c00          	inc	_tach3
 523  0036               L551:
 524                     ; 86 }
 527  0036 81            	ret
 564                     ; 88 uint16_t get_ms(uint8_t tach){
 565                     .text:	section	.text,new
 566  0000               _get_ms:
 570                     ; 89 	switch(tach){
 573                     ; 98 		break;
 575  0000 4a            	dec	a
 576  0001 2708          	jreq	L361
 577  0003 4a            	dec	a
 578  0004 270a          	jreq	L561
 579  0006 4a            	dec	a
 580  0007 270c          	jreq	L761
 581  0009 200f          	jra	L112
 582  000b               L361:
 583                     ; 90 		case 1:
 583                     ; 91 			return tach1.ms_5;
 585  000b b608          	ld	a,_tach1
 586  000d 5f            	clrw	x
 587  000e 97            	ld	xl,a
 590  000f 81            	ret
 591  0010               L561:
 592                     ; 93 		case 2:
 592                     ; 94 			return tach2.ms_5;
 595  0010 b604          	ld	a,_tach2
 596  0012 5f            	clrw	x
 597  0013 97            	ld	xl,a
 600  0014 81            	ret
 601  0015               L761:
 602                     ; 96 		case 3:
 602                     ; 97 			return tach3.ms_5;
 605  0015 b600          	ld	a,_tach3
 606  0017 5f            	clrw	x
 607  0018 97            	ld	xl,a
 610  0019 81            	ret
 611  001a               L112:
 612                     ; 100 }
 615  001a 81            	ret
 652                     ; 102 uint16_t get_ms_period(uint8_t tach){
 653                     .text:	section	.text,new
 654  0000               _get_ms_period:
 658                     ; 103 	switch(tach){
 661                     ; 112 		break;
 663  0000 4a            	dec	a
 664  0001 2708          	jreq	L312
 665  0003 4a            	dec	a
 666  0004 270a          	jreq	L512
 667  0006 4a            	dec	a
 668  0007 270c          	jreq	L712
 669  0009 200f          	jra	L142
 670  000b               L312:
 671                     ; 104 		case 1:
 671                     ; 105 			return tach1.ms_period_last;
 673  000b b609          	ld	a,_tach1+1
 674  000d 5f            	clrw	x
 675  000e 97            	ld	xl,a
 678  000f 81            	ret
 679  0010               L512:
 680                     ; 107 		case 2:
 680                     ; 108 			return tach2.ms_period_last;
 683  0010 b605          	ld	a,_tach2+1
 684  0012 5f            	clrw	x
 685  0013 97            	ld	xl,a
 688  0014 81            	ret
 689  0015               L712:
 690                     ; 110 		case 3:
 690                     ; 111 			return tach3.ms_period_last;
 693  0015 b601          	ld	a,_tach3+1
 694  0017 5f            	clrw	x
 695  0018 97            	ld	xl,a
 698  0019 81            	ret
 699  001a               L142:
 700                     ; 114 }
 703  001a 81            	ret
 809                     	xdef	_tach_ms_inc
 810                     	xdef	_tach3_sens_update
 811                     	xdef	_tach2_sens_update
 812                     	xdef	_tach1_sens_update
 813                     	switch	.ubsct
 814  0000               _tach3:
 815  0000 00000000      	ds.b	4
 816                     	xdef	_tach3
 817  0004               _tach2:
 818  0004 00000000      	ds.b	4
 819                     	xdef	_tach2
 820  0008               _tach1:
 821  0008 00000000      	ds.b	4
 822                     	xdef	_tach1
 823                     	xdef	_get_ms_period
 824                     	xdef	_get_ms
 825                     	xdef	_get_tach_rpm
 826                     	xdef	_enable_tach
 827                     	xdef	_tach_init
 828                     	xref	_TIM3_ClearFlag
 829                     	xref	_TIM3_ITConfig
 830                     	xref	_TIM3_Cmd
 831                     	xref	_TIM3_TimeBaseInit
 832                     	xref	_GPIO_ExternalPullUpConfig
 833                     	xref	_GPIO_Init
 834                     	xref	_EXTI_SetPinSensitivity
 835                     	xref	_CLK_PeripheralClockConfig
 855                     	xref	c_itolx
 856                     	xref	c_idiv
 857                     	end
