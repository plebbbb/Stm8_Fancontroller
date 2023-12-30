   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  43                     ; 168 void TIM5_DeInit(void)
  43                     ; 169 {
  45                     .text:	section	.text,new
  46  0000               _TIM5_DeInit:
  50                     ; 170   TIM5->CR1 = TIM_CR1_RESET_VALUE;
  52  0000 725f5300      	clr	21248
  53                     ; 171   TIM5->CR2 = TIM_CR2_RESET_VALUE;
  55  0004 725f5301      	clr	21249
  56                     ; 172   TIM5->SMCR = TIM_SMCR_RESET_VALUE;
  58  0008 725f5302      	clr	21250
  59                     ; 173   TIM5->ETR = TIM_ETR_RESET_VALUE;
  61  000c 725f5303      	clr	21251
  62                     ; 174   TIM5->IER = TIM_IER_RESET_VALUE;
  64  0010 725f5305      	clr	21253
  65                     ; 175   TIM5->SR2 = TIM_SR2_RESET_VALUE;
  67  0014 725f5307      	clr	21255
  68                     ; 178   TIM5->CCER1 = TIM_CCER1_RESET_VALUE;
  70  0018 725f530b      	clr	21259
  71                     ; 180   TIM5->CCMR1 = 0x01;/*TIM5_ICxSource_TIxFPx */
  73  001c 35015309      	mov	21257,#1
  74                     ; 181   TIM5->CCMR2 = 0x01;/*TIM5_ICxSource_TIxFPx */
  76  0020 3501530a      	mov	21258,#1
  77                     ; 184   TIM5->CCER1 = TIM_CCER1_RESET_VALUE;
  79  0024 725f530b      	clr	21259
  80                     ; 185   TIM5->CCMR1 = TIM_CCMR1_RESET_VALUE;
  82  0028 725f5309      	clr	21257
  83                     ; 186   TIM5->CCMR2 = TIM_CCMR2_RESET_VALUE;
  85  002c 725f530a      	clr	21258
  86                     ; 188   TIM5->CNTRH = TIM_CNTRH_RESET_VALUE;
  88  0030 725f530c      	clr	21260
  89                     ; 189   TIM5->CNTRL = TIM_CNTRL_RESET_VALUE;
  91  0034 725f530d      	clr	21261
  92                     ; 191   TIM5->PSCR = TIM_PSCR_RESET_VALUE;
  94  0038 725f530e      	clr	21262
  95                     ; 193   TIM5->ARRH = TIM_ARRH_RESET_VALUE;
  97  003c 35ff530f      	mov	21263,#255
  98                     ; 194   TIM5->ARRL = TIM_ARRL_RESET_VALUE;
 100  0040 35ff5310      	mov	21264,#255
 101                     ; 196   TIM5->CCR1H = TIM_CCR1H_RESET_VALUE;
 103  0044 725f5311      	clr	21265
 104                     ; 197   TIM5->CCR1L = TIM_CCR1L_RESET_VALUE;
 106  0048 725f5312      	clr	21266
 107                     ; 198   TIM5->CCR2H = TIM_CCR2H_RESET_VALUE;
 109  004c 725f5313      	clr	21267
 110                     ; 199   TIM5->CCR2L = TIM_CCR2L_RESET_VALUE;
 112  0050 725f5314      	clr	21268
 113                     ; 202   TIM5->OISR = TIM_OISR_RESET_VALUE;
 115  0054 725f5316      	clr	21270
 116                     ; 203   TIM5->EGR = 0x01;/* TIM_EGR_UG */
 118  0058 35015308      	mov	21256,#1
 119                     ; 204   TIM5->BKR = TIM_BKR_RESET_VALUE;
 121  005c 725f5315      	clr	21269
 122                     ; 205   TIM5->SR1 = TIM_SR1_RESET_VALUE;
 124  0060 725f5306      	clr	21254
 125                     ; 206 }
 128  0064 81            	ret
 290                     ; 231 void TIM5_TimeBaseInit(TIM5_Prescaler_TypeDef TIM5_Prescaler,
 290                     ; 232                        TIM5_CounterMode_TypeDef TIM5_CounterMode,
 290                     ; 233                        uint16_t TIM5_Period)
 290                     ; 234 {
 291                     .text:	section	.text,new
 292  0000               _TIM5_TimeBaseInit:
 294  0000 89            	pushw	x
 295       00000000      OFST:	set	0
 298                     ; 236   assert_param(IS_TIM5_PRESCALER(TIM5_Prescaler));
 300                     ; 237   assert_param(IS_TIM5_COUNTER_MODE(TIM5_CounterMode));
 302                     ; 242   TIM5->ARRH = (uint8_t)(TIM5_Period >> 8) ;
 304  0001 7b05          	ld	a,(OFST+5,sp)
 305  0003 c7530f        	ld	21263,a
 306                     ; 243   TIM5->ARRL = (uint8_t)(TIM5_Period);
 308  0006 7b06          	ld	a,(OFST+6,sp)
 309  0008 c75310        	ld	21264,a
 310                     ; 246   TIM5->PSCR = (uint8_t)(TIM5_Prescaler);
 312  000b 9e            	ld	a,xh
 313  000c c7530e        	ld	21262,a
 314                     ; 249   TIM5->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 316  000f c65300        	ld	a,21248
 317  0012 a48f          	and	a,#143
 318  0014 c75300        	ld	21248,a
 319                     ; 250   TIM5->CR1 |= (uint8_t)(TIM5_CounterMode);
 321  0017 9f            	ld	a,xl
 322  0018 ca5300        	or	a,21248
 323  001b c75300        	ld	21248,a
 324                     ; 253   TIM5->EGR = TIM5_EventSource_Update;
 326  001e 35015308      	mov	21256,#1
 327                     ; 254 }
 330  0022 85            	popw	x
 331  0023 81            	ret
 399                     ; 274 void TIM5_PrescalerConfig(TIM5_Prescaler_TypeDef Prescaler,
 399                     ; 275                           TIM5_PSCReloadMode_TypeDef TIM5_PSCReloadMode)
 399                     ; 276 {
 400                     .text:	section	.text,new
 401  0000               _TIM5_PrescalerConfig:
 405                     ; 278   assert_param(IS_TIM5_PRESCALER(Prescaler));
 407                     ; 279   assert_param(IS_TIM5_PRESCALER_RELOAD(TIM5_PSCReloadMode));
 409                     ; 282   TIM5->PSCR = (uint8_t)(Prescaler);
 411  0000 9e            	ld	a,xh
 412  0001 c7530e        	ld	21262,a
 413                     ; 285   if (TIM5_PSCReloadMode == TIM5_PSCReloadMode_Immediate)
 415  0004 9f            	ld	a,xl
 416  0005 a101          	cp	a,#1
 417  0007 2606          	jrne	L741
 418                     ; 287     TIM5->EGR |= TIM_EGR_UG ;
 420  0009 72105308      	bset	21256,#0
 422  000d 2004          	jra	L151
 423  000f               L741:
 424                     ; 291     TIM5->EGR &= (uint8_t)(~TIM_EGR_UG) ;
 426  000f 72115308      	bres	21256,#0
 427  0013               L151:
 428                     ; 293 }
 431  0013 81            	ret
 476                     ; 306 void TIM5_CounterModeConfig(TIM5_CounterMode_TypeDef TIM5_CounterMode)
 476                     ; 307 {
 477                     .text:	section	.text,new
 478  0000               _TIM5_CounterModeConfig:
 480  0000 88            	push	a
 481  0001 88            	push	a
 482       00000001      OFST:	set	1
 485                     ; 308   uint8_t tmpcr1 = 0;
 487                     ; 311   assert_param(IS_TIM5_COUNTER_MODE(TIM5_CounterMode));
 489                     ; 313   tmpcr1 = TIM5->CR1;
 491  0002 c65300        	ld	a,21248
 492  0005 6b01          	ld	(OFST+0,sp),a
 494                     ; 316   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
 496  0007 7b01          	ld	a,(OFST+0,sp)
 497  0009 a48f          	and	a,#143
 498  000b 6b01          	ld	(OFST+0,sp),a
 500                     ; 319   tmpcr1 |= (uint8_t)TIM5_CounterMode;
 502  000d 7b01          	ld	a,(OFST+0,sp)
 503  000f 1a02          	or	a,(OFST+1,sp)
 504  0011 6b01          	ld	(OFST+0,sp),a
 506                     ; 321   TIM5->CR1 = tmpcr1;
 508  0013 7b01          	ld	a,(OFST+0,sp)
 509  0015 c75300        	ld	21248,a
 510                     ; 322 }
 513  0018 85            	popw	x
 514  0019 81            	ret
 548                     ; 330 void TIM5_SetCounter(uint16_t Counter)
 548                     ; 331 {
 549                     .text:	section	.text,new
 550  0000               _TIM5_SetCounter:
 554                     ; 334   TIM5->CNTRH = (uint8_t)(Counter >> 8);
 556  0000 9e            	ld	a,xh
 557  0001 c7530c        	ld	21260,a
 558                     ; 335   TIM5->CNTRL = (uint8_t)(Counter);
 560  0004 9f            	ld	a,xl
 561  0005 c7530d        	ld	21261,a
 562                     ; 336 }
 565  0008 81            	ret
 599                     ; 344 void TIM5_SetAutoreload(uint16_t Autoreload)
 599                     ; 345 {
 600                     .text:	section	.text,new
 601  0000               _TIM5_SetAutoreload:
 605                     ; 347   TIM5->ARRH = (uint8_t)(Autoreload >> 8);
 607  0000 9e            	ld	a,xh
 608  0001 c7530f        	ld	21263,a
 609                     ; 348   TIM5->ARRL = (uint8_t)(Autoreload);
 611  0004 9f            	ld	a,xl
 612  0005 c75310        	ld	21264,a
 613                     ; 349 }
 616  0008 81            	ret
 668                     ; 356 uint16_t TIM5_GetCounter(void)
 668                     ; 357 {
 669                     .text:	section	.text,new
 670  0000               _TIM5_GetCounter:
 672  0000 5204          	subw	sp,#4
 673       00000004      OFST:	set	4
 676                     ; 358   uint16_t tmpcnt = 0;
 678                     ; 361   tmpcntrh = TIM5->CNTRH;
 680  0002 c6530c        	ld	a,21260
 681  0005 6b02          	ld	(OFST-2,sp),a
 683                     ; 362   tmpcntrl = TIM5->CNTRL;
 685  0007 c6530d        	ld	a,21261
 686  000a 6b01          	ld	(OFST-3,sp),a
 688                     ; 364   tmpcnt = (uint16_t)(tmpcntrl);
 690  000c 7b01          	ld	a,(OFST-3,sp)
 691  000e 5f            	clrw	x
 692  000f 97            	ld	xl,a
 693  0010 1f03          	ldw	(OFST-1,sp),x
 695                     ; 365   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
 697  0012 7b02          	ld	a,(OFST-2,sp)
 698  0014 5f            	clrw	x
 699  0015 97            	ld	xl,a
 700  0016 4f            	clr	a
 701  0017 02            	rlwa	x,a
 702  0018 01            	rrwa	x,a
 703  0019 1a04          	or	a,(OFST+0,sp)
 704  001b 01            	rrwa	x,a
 705  001c 1a03          	or	a,(OFST-1,sp)
 706  001e 01            	rrwa	x,a
 707  001f 1f03          	ldw	(OFST-1,sp),x
 709                     ; 367   return ((uint16_t)tmpcnt);
 711  0021 1e03          	ldw	x,(OFST-1,sp)
 714  0023 5b04          	addw	sp,#4
 715  0025 81            	ret
 739                     ; 383 TIM5_Prescaler_TypeDef TIM5_GetPrescaler(void)
 739                     ; 384 {
 740                     .text:	section	.text,new
 741  0000               _TIM5_GetPrescaler:
 745                     ; 386   return ((TIM5_Prescaler_TypeDef)TIM5->PSCR);
 747  0000 c6530e        	ld	a,21262
 750  0003 81            	ret
 806                     ; 396 void TIM5_UpdateDisableConfig(FunctionalState NewState)
 806                     ; 397 {
 807                     .text:	section	.text,new
 808  0000               _TIM5_UpdateDisableConfig:
 812                     ; 399   assert_param(IS_FUNCTIONAL_STATE(NewState));
 814                     ; 402   if (NewState != DISABLE)
 816  0000 4d            	tnz	a
 817  0001 2706          	jreq	L513
 818                     ; 404     TIM5->CR1 |= TIM_CR1_UDIS;
 820  0003 72125300      	bset	21248,#1
 822  0007 2004          	jra	L713
 823  0009               L513:
 824                     ; 408     TIM5->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
 826  0009 72135300      	bres	21248,#1
 827  000d               L713:
 828                     ; 410 }
 831  000d 81            	ret
 889                     ; 420 void TIM5_UpdateRequestConfig(TIM5_UpdateSource_TypeDef TIM5_UpdateSource)
 889                     ; 421 {
 890                     .text:	section	.text,new
 891  0000               _TIM5_UpdateRequestConfig:
 895                     ; 423   assert_param(IS_TIM5_UPDATE_SOURCE(TIM5_UpdateSource));
 897                     ; 426   if (TIM5_UpdateSource == TIM5_UpdateSource_Regular)
 899  0000 a101          	cp	a,#1
 900  0002 2606          	jrne	L743
 901                     ; 428     TIM5->CR1 |= TIM_CR1_URS ;
 903  0004 72145300      	bset	21248,#2
 905  0008 2004          	jra	L153
 906  000a               L743:
 907                     ; 432     TIM5->CR1 &= (uint8_t)(~TIM_CR1_URS);
 909  000a 72155300      	bres	21248,#2
 910  000e               L153:
 911                     ; 434 }
 914  000e 81            	ret
 950                     ; 442 void TIM5_ARRPreloadConfig(FunctionalState NewState)
 950                     ; 443 {
 951                     .text:	section	.text,new
 952  0000               _TIM5_ARRPreloadConfig:
 956                     ; 445   assert_param(IS_FUNCTIONAL_STATE(NewState));
 958                     ; 448   if (NewState != DISABLE)
 960  0000 4d            	tnz	a
 961  0001 2706          	jreq	L173
 962                     ; 450     TIM5->CR1 |= TIM_CR1_ARPE;
 964  0003 721e5300      	bset	21248,#7
 966  0007 2004          	jra	L373
 967  0009               L173:
 968                     ; 454     TIM5->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
 970  0009 721f5300      	bres	21248,#7
 971  000d               L373:
 972                     ; 456 }
 975  000d 81            	ret
1032                     ; 466 void TIM5_SelectOnePulseMode(TIM5_OPMode_TypeDef TIM5_OPMode)
1032                     ; 467 {
1033                     .text:	section	.text,new
1034  0000               _TIM5_SelectOnePulseMode:
1038                     ; 469   assert_param(IS_TIM5_OPM_MODE(TIM5_OPMode));
1040                     ; 472   if (TIM5_OPMode == TIM5_OPMode_Single)
1042  0000 a101          	cp	a,#1
1043  0002 2606          	jrne	L324
1044                     ; 474     TIM5->CR1 |= TIM_CR1_OPM ;
1046  0004 72165300      	bset	21248,#3
1048  0008 2004          	jra	L524
1049  000a               L324:
1050                     ; 478     TIM5->CR1 &= (uint8_t)(~TIM_CR1_OPM);
1052  000a 72175300      	bres	21248,#3
1053  000e               L524:
1054                     ; 480 }
1057  000e 81            	ret
1092                     ; 488 void TIM5_Cmd(FunctionalState NewState)
1092                     ; 489 {
1093                     .text:	section	.text,new
1094  0000               _TIM5_Cmd:
1098                     ; 491   assert_param(IS_FUNCTIONAL_STATE(NewState));
1100                     ; 494   if (NewState != DISABLE)
1102  0000 4d            	tnz	a
1103  0001 2706          	jreq	L544
1104                     ; 496     TIM5->CR1 |= TIM_CR1_CEN;
1106  0003 72105300      	bset	21248,#0
1108  0007 2004          	jra	L744
1109  0009               L544:
1110                     ; 500     TIM5->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1112  0009 72115300      	bres	21248,#0
1113  000d               L744:
1114                     ; 502 }
1117  000d 81            	ret
1315                     ; 578 void TIM5_OC1Init(TIM5_OCMode_TypeDef TIM5_OCMode,
1315                     ; 579                   TIM5_OutputState_TypeDef TIM5_OutputState,
1315                     ; 580                   uint16_t TIM5_Pulse,
1315                     ; 581                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity,
1315                     ; 582                   TIM5_OCIdleState_TypeDef TIM5_OCIdleState)
1315                     ; 583 {
1316                     .text:	section	.text,new
1317  0000               _TIM5_OC1Init:
1319  0000 89            	pushw	x
1320  0001 88            	push	a
1321       00000001      OFST:	set	1
1324                     ; 584   uint8_t tmpccmr1 = 0;
1326                     ; 587   assert_param(IS_TIM5_OC_MODE(TIM5_OCMode));
1328                     ; 588   assert_param(IS_TIM5_OUTPUT_STATE(TIM5_OutputState));
1330                     ; 589   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
1332                     ; 590   assert_param(IS_TIM5_OCIDLE_STATE(TIM5_OCIdleState));
1334                     ; 592   tmpccmr1 = TIM5->CCMR1;
1336  0002 c65309        	ld	a,21257
1337  0005 6b01          	ld	(OFST+0,sp),a
1339                     ; 595   TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1341  0007 7211530b      	bres	21259,#0
1342                     ; 597   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
1344  000b 7b01          	ld	a,(OFST+0,sp)
1345  000d a48f          	and	a,#143
1346  000f 6b01          	ld	(OFST+0,sp),a
1348                     ; 600   tmpccmr1 |= (uint8_t)TIM5_OCMode;
1350  0011 9e            	ld	a,xh
1351  0012 1a01          	or	a,(OFST+0,sp)
1352  0014 6b01          	ld	(OFST+0,sp),a
1354                     ; 602   TIM5->CCMR1 = tmpccmr1;
1356  0016 7b01          	ld	a,(OFST+0,sp)
1357  0018 c75309        	ld	21257,a
1358                     ; 605   if (TIM5_OutputState == TIM5_OutputState_Enable)
1360  001b 9f            	ld	a,xl
1361  001c a101          	cp	a,#1
1362  001e 2606          	jrne	L365
1363                     ; 607     TIM5->CCER1 |= TIM_CCER1_CC1E;
1365  0020 7210530b      	bset	21259,#0
1367  0024 2004          	jra	L565
1368  0026               L365:
1369                     ; 611     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1371  0026 7211530b      	bres	21259,#0
1372  002a               L565:
1373                     ; 615   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
1375  002a 7b08          	ld	a,(OFST+7,sp)
1376  002c a101          	cp	a,#1
1377  002e 2606          	jrne	L765
1378                     ; 617     TIM5->CCER1 |= TIM_CCER1_CC1P;
1380  0030 7212530b      	bset	21259,#1
1382  0034 2004          	jra	L175
1383  0036               L765:
1384                     ; 621     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
1386  0036 7213530b      	bres	21259,#1
1387  003a               L175:
1388                     ; 625   if (TIM5_OCIdleState == TIM5_OCIdleState_Set)
1390  003a 7b09          	ld	a,(OFST+8,sp)
1391  003c a101          	cp	a,#1
1392  003e 2606          	jrne	L375
1393                     ; 627     TIM5->OISR |= TIM_OISR_OIS1;
1395  0040 72105316      	bset	21270,#0
1397  0044 2004          	jra	L575
1398  0046               L375:
1399                     ; 631     TIM5->OISR &= (uint8_t)(~TIM_OISR_OIS1);
1401  0046 72115316      	bres	21270,#0
1402  004a               L575:
1403                     ; 635   TIM5->CCR1H = (uint8_t)(TIM5_Pulse >> 8);
1405  004a 7b06          	ld	a,(OFST+5,sp)
1406  004c c75311        	ld	21265,a
1407                     ; 636   TIM5->CCR1L = (uint8_t)(TIM5_Pulse);
1409  004f 7b07          	ld	a,(OFST+6,sp)
1410  0051 c75312        	ld	21266,a
1411                     ; 637 }
1414  0054 5b03          	addw	sp,#3
1415  0056 81            	ret
1498                     ; 664 void TIM5_OC2Init(TIM5_OCMode_TypeDef TIM5_OCMode,
1498                     ; 665                   TIM5_OutputState_TypeDef TIM5_OutputState,
1498                     ; 666                   uint16_t TIM5_Pulse,
1498                     ; 667                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity,
1498                     ; 668                   TIM5_OCIdleState_TypeDef TIM5_OCIdleState)
1498                     ; 669 {
1499                     .text:	section	.text,new
1500  0000               _TIM5_OC2Init:
1502  0000 89            	pushw	x
1503  0001 88            	push	a
1504       00000001      OFST:	set	1
1507                     ; 670   uint8_t tmpccmr2 = 0;
1509                     ; 673   assert_param(IS_TIM5_OC_MODE(TIM5_OCMode));
1511                     ; 674   assert_param(IS_TIM5_OUTPUT_STATE(TIM5_OutputState));
1513                     ; 675   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
1515                     ; 676   assert_param(IS_TIM5_OCIDLE_STATE(TIM5_OCIdleState));
1517                     ; 678   tmpccmr2 = TIM5->CCMR2;
1519  0002 c6530a        	ld	a,21258
1520  0005 6b01          	ld	(OFST+0,sp),a
1522                     ; 681   TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1524  0007 7219530b      	bres	21259,#4
1525                     ; 684   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
1527  000b 7b01          	ld	a,(OFST+0,sp)
1528  000d a48f          	and	a,#143
1529  000f 6b01          	ld	(OFST+0,sp),a
1531                     ; 687   tmpccmr2 |= (uint8_t)TIM5_OCMode;
1533  0011 9e            	ld	a,xh
1534  0012 1a01          	or	a,(OFST+0,sp)
1535  0014 6b01          	ld	(OFST+0,sp),a
1537                     ; 689   TIM5->CCMR2 = tmpccmr2;
1539  0016 7b01          	ld	a,(OFST+0,sp)
1540  0018 c7530a        	ld	21258,a
1541                     ; 692   if (TIM5_OutputState == TIM5_OutputState_Enable)
1543  001b 9f            	ld	a,xl
1544  001c a101          	cp	a,#1
1545  001e 2606          	jrne	L146
1546                     ; 694     TIM5->CCER1 |= TIM_CCER1_CC2E;
1548  0020 7218530b      	bset	21259,#4
1550  0024 2004          	jra	L346
1551  0026               L146:
1552                     ; 698     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1554  0026 7219530b      	bres	21259,#4
1555  002a               L346:
1556                     ; 702   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
1558  002a 7b08          	ld	a,(OFST+7,sp)
1559  002c a101          	cp	a,#1
1560  002e 2606          	jrne	L546
1561                     ; 704     TIM5->CCER1 |= TIM_CCER1_CC2P;
1563  0030 721a530b      	bset	21259,#5
1565  0034 2004          	jra	L746
1566  0036               L546:
1567                     ; 708     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
1569  0036 721b530b      	bres	21259,#5
1570  003a               L746:
1571                     ; 713   if (TIM5_OCIdleState == TIM5_OCIdleState_Set)
1573  003a 7b09          	ld	a,(OFST+8,sp)
1574  003c a101          	cp	a,#1
1575  003e 2606          	jrne	L156
1576                     ; 715     TIM5->OISR |= TIM_OISR_OIS2;
1578  0040 72145316      	bset	21270,#2
1580  0044 2004          	jra	L356
1581  0046               L156:
1582                     ; 719     TIM5->OISR &= (uint8_t)(~TIM_OISR_OIS2);
1584  0046 72155316      	bres	21270,#2
1585  004a               L356:
1586                     ; 723   TIM5->CCR2H = (uint8_t)(TIM5_Pulse >> 8);
1588  004a 7b06          	ld	a,(OFST+5,sp)
1589  004c c75313        	ld	21267,a
1590                     ; 724   TIM5->CCR2L = (uint8_t)(TIM5_Pulse);
1592  004f 7b07          	ld	a,(OFST+6,sp)
1593  0051 c75314        	ld	21268,a
1594                     ; 725 }
1597  0054 5b03          	addw	sp,#3
1598  0056 81            	ret
1796                     ; 754 void TIM5_BKRConfig(TIM5_OSSIState_TypeDef TIM5_OSSIState,
1796                     ; 755                     TIM5_LockLevel_TypeDef TIM5_LockLevel,
1796                     ; 756                     TIM5_BreakState_TypeDef TIM5_BreakState,
1796                     ; 757                     TIM5_BreakPolarity_TypeDef TIM5_BreakPolarity,
1796                     ; 758                     TIM5_AutomaticOutput_TypeDef TIM5_AutomaticOutput)
1796                     ; 759 
1796                     ; 760 {
1797                     .text:	section	.text,new
1798  0000               _TIM5_BKRConfig:
1800  0000 89            	pushw	x
1801  0001 88            	push	a
1802       00000001      OFST:	set	1
1805                     ; 762   assert_param(IS_TIM5_OSSI_STATE(TIM5_OSSIState));
1807                     ; 763   assert_param(IS_TIM5_LOCK_LEVEL(TIM5_LockLevel));
1809                     ; 764   assert_param(IS_TIM5_BREAK_STATE(TIM5_BreakState));
1811                     ; 765   assert_param(IS_TIM5_BREAK_POLARITY(TIM5_BreakPolarity));
1813                     ; 766   assert_param(IS_TIM5_AUTOMATIC_OUTPUT_STATE(TIM5_AutomaticOutput));
1815                     ; 772   TIM5->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM5_OSSIState | (uint8_t)TIM5_LockLevel) | \
1815                     ; 773                                   (uint8_t)((uint8_t)TIM5_BreakState | (uint8_t)TIM5_BreakPolarity)) | \
1815                     ; 774                                   TIM5_AutomaticOutput));
1817  0002 7b06          	ld	a,(OFST+5,sp)
1818  0004 1a07          	or	a,(OFST+6,sp)
1819  0006 6b01          	ld	(OFST+0,sp),a
1821  0008 9f            	ld	a,xl
1822  0009 1a02          	or	a,(OFST+1,sp)
1823  000b 1a01          	or	a,(OFST+0,sp)
1824  000d 1a08          	or	a,(OFST+7,sp)
1825  000f c75315        	ld	21269,a
1826                     ; 775 }
1829  0012 5b03          	addw	sp,#3
1830  0014 81            	ret
1866                     ; 783 void TIM5_CtrlPWMOutputs(FunctionalState NewState)
1866                     ; 784 {
1867                     .text:	section	.text,new
1868  0000               _TIM5_CtrlPWMOutputs:
1872                     ; 786   assert_param(IS_FUNCTIONAL_STATE(NewState));
1874                     ; 790   if (NewState != DISABLE)
1876  0000 4d            	tnz	a
1877  0001 2706          	jreq	L5001
1878                     ; 792     TIM5->BKR |= TIM_BKR_MOE ;
1880  0003 721e5315      	bset	21269,#7
1882  0007 2004          	jra	L7001
1883  0009               L5001:
1884                     ; 796     TIM5->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1886  0009 721f5315      	bres	21269,#7
1887  000d               L7001:
1888                     ; 798 }
1891  000d 81            	ret
1956                     ; 818 void TIM5_SelectOCxM(TIM5_Channel_TypeDef TIM5_Channel,
1956                     ; 819                      TIM5_OCMode_TypeDef TIM5_OCMode)
1956                     ; 820 {
1957                     .text:	section	.text,new
1958  0000               _TIM5_SelectOCxM:
1960  0000 89            	pushw	x
1961       00000000      OFST:	set	0
1964                     ; 822   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
1966                     ; 823   assert_param(IS_TIM5_OCM(TIM5_OCMode));
1968                     ; 825   if (TIM5_Channel == TIM5_Channel_1)
1970  0001 9e            	ld	a,xh
1971  0002 4d            	tnz	a
1972  0003 2615          	jrne	L3401
1973                     ; 828     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1975  0005 7211530b      	bres	21259,#0
1976                     ; 831     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
1978  0009 c65309        	ld	a,21257
1979  000c a48f          	and	a,#143
1980  000e c75309        	ld	21257,a
1981                     ; 834     TIM5->CCMR1 |= (uint8_t)TIM5_OCMode;
1983  0011 9f            	ld	a,xl
1984  0012 ca5309        	or	a,21257
1985  0015 c75309        	ld	21257,a
1987  0018 2014          	jra	L5401
1988  001a               L3401:
1989                     ; 839     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1991  001a 7219530b      	bres	21259,#4
1992                     ; 842     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
1994  001e c6530a        	ld	a,21258
1995  0021 a48f          	and	a,#143
1996  0023 c7530a        	ld	21258,a
1997                     ; 845     TIM5->CCMR2 |= (uint8_t)TIM5_OCMode;
1999  0026 c6530a        	ld	a,21258
2000  0029 1a02          	or	a,(OFST+2,sp)
2001  002b c7530a        	ld	21258,a
2002  002e               L5401:
2003                     ; 847 }
2006  002e 85            	popw	x
2007  002f 81            	ret
2041                     ; 855 void TIM5_SetCompare1(uint16_t Compare)
2041                     ; 856 {
2042                     .text:	section	.text,new
2043  0000               _TIM5_SetCompare1:
2047                     ; 858   TIM5->CCR1H = (uint8_t)(Compare >> 8);
2049  0000 9e            	ld	a,xh
2050  0001 c75311        	ld	21265,a
2051                     ; 859   TIM5->CCR1L = (uint8_t)(Compare);
2053  0004 9f            	ld	a,xl
2054  0005 c75312        	ld	21266,a
2055                     ; 860 }
2058  0008 81            	ret
2092                     ; 868 void TIM5_SetCompare2(uint16_t Compare)
2092                     ; 869 {
2093                     .text:	section	.text,new
2094  0000               _TIM5_SetCompare2:
2098                     ; 871   TIM5->CCR2H = (uint8_t)(Compare >> 8);
2100  0000 9e            	ld	a,xh
2101  0001 c75313        	ld	21267,a
2102                     ; 872   TIM5->CCR2L = (uint8_t)(Compare);
2104  0004 9f            	ld	a,xl
2105  0005 c75314        	ld	21268,a
2106                     ; 873 }
2109  0008 81            	ret
2176                     ; 883 void TIM5_ForcedOC1Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
2176                     ; 884 {
2177                     .text:	section	.text,new
2178  0000               _TIM5_ForcedOC1Config:
2180  0000 88            	push	a
2181  0001 88            	push	a
2182       00000001      OFST:	set	1
2185                     ; 885   uint8_t tmpccmr1 = 0;
2187                     ; 888   assert_param(IS_TIM5_FORCED_ACTION(TIM5_ForcedAction));
2189                     ; 890   tmpccmr1 = TIM5->CCMR1;
2191  0002 c65309        	ld	a,21257
2192  0005 6b01          	ld	(OFST+0,sp),a
2194                     ; 893   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
2196  0007 7b01          	ld	a,(OFST+0,sp)
2197  0009 a48f          	and	a,#143
2198  000b 6b01          	ld	(OFST+0,sp),a
2200                     ; 896   tmpccmr1 |= (uint8_t)TIM5_ForcedAction;
2202  000d 7b01          	ld	a,(OFST+0,sp)
2203  000f 1a02          	or	a,(OFST+1,sp)
2204  0011 6b01          	ld	(OFST+0,sp),a
2206                     ; 898   TIM5->CCMR1 = tmpccmr1;
2208  0013 7b01          	ld	a,(OFST+0,sp)
2209  0015 c75309        	ld	21257,a
2210                     ; 899 }
2213  0018 85            	popw	x
2214  0019 81            	ret
2259                     ; 909 void TIM5_ForcedOC2Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
2259                     ; 910 {
2260                     .text:	section	.text,new
2261  0000               _TIM5_ForcedOC2Config:
2263  0000 88            	push	a
2264  0001 88            	push	a
2265       00000001      OFST:	set	1
2268                     ; 911   uint8_t tmpccmr2 = 0;
2270                     ; 914   assert_param(IS_TIM5_FORCED_ACTION(TIM5_ForcedAction));
2272                     ; 916   tmpccmr2 = TIM5->CCMR2;
2274  0002 c6530a        	ld	a,21258
2275  0005 6b01          	ld	(OFST+0,sp),a
2277                     ; 919   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
2279  0007 7b01          	ld	a,(OFST+0,sp)
2280  0009 a48f          	and	a,#143
2281  000b 6b01          	ld	(OFST+0,sp),a
2283                     ; 922   tmpccmr2 |= (uint8_t)TIM5_ForcedAction;
2285  000d 7b01          	ld	a,(OFST+0,sp)
2286  000f 1a02          	or	a,(OFST+1,sp)
2287  0011 6b01          	ld	(OFST+0,sp),a
2289                     ; 924   TIM5->CCMR2 = tmpccmr2;
2291  0013 7b01          	ld	a,(OFST+0,sp)
2292  0015 c7530a        	ld	21258,a
2293                     ; 925 }
2296  0018 85            	popw	x
2297  0019 81            	ret
2333                     ; 933 void TIM5_OC1PreloadConfig(FunctionalState NewState)
2333                     ; 934 {
2334                     .text:	section	.text,new
2335  0000               _TIM5_OC1PreloadConfig:
2339                     ; 936   assert_param(IS_FUNCTIONAL_STATE(NewState));
2341                     ; 939   if (NewState != DISABLE)
2343  0000 4d            	tnz	a
2344  0001 2706          	jreq	L5711
2345                     ; 941     TIM5->CCMR1 |= TIM_CCMR_OCxPE ;
2347  0003 72165309      	bset	21257,#3
2349  0007 2004          	jra	L7711
2350  0009               L5711:
2351                     ; 945     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2353  0009 72175309      	bres	21257,#3
2354  000d               L7711:
2355                     ; 947 }
2358  000d 81            	ret
2394                     ; 955 void TIM5_OC2PreloadConfig(FunctionalState NewState)
2394                     ; 956 {
2395                     .text:	section	.text,new
2396  0000               _TIM5_OC2PreloadConfig:
2400                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
2402                     ; 961   if (NewState != DISABLE)
2404  0000 4d            	tnz	a
2405  0001 2706          	jreq	L7121
2406                     ; 963     TIM5->CCMR2 |= TIM_CCMR_OCxPE ;
2408  0003 7216530a      	bset	21258,#3
2410  0007 2004          	jra	L1221
2411  0009               L7121:
2412                     ; 967     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2414  0009 7217530a      	bres	21258,#3
2415  000d               L1221:
2416                     ; 969 }
2419  000d 81            	ret
2454                     ; 977 void TIM5_OC1FastConfig(FunctionalState NewState)
2454                     ; 978 {
2455                     .text:	section	.text,new
2456  0000               _TIM5_OC1FastConfig:
2460                     ; 980   assert_param(IS_FUNCTIONAL_STATE(NewState));
2462                     ; 983   if (NewState != DISABLE)
2464  0000 4d            	tnz	a
2465  0001 2706          	jreq	L1421
2466                     ; 985     TIM5->CCMR1 |= TIM_CCMR_OCxFE ;
2468  0003 72145309      	bset	21257,#2
2470  0007 2004          	jra	L3421
2471  0009               L1421:
2472                     ; 989     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2474  0009 72155309      	bres	21257,#2
2475  000d               L3421:
2476                     ; 991 }
2479  000d 81            	ret
2514                     ; 1000 void TIM5_OC2FastConfig(FunctionalState NewState)
2514                     ; 1001 {
2515                     .text:	section	.text,new
2516  0000               _TIM5_OC2FastConfig:
2520                     ; 1003   assert_param(IS_FUNCTIONAL_STATE(NewState));
2522                     ; 1006   if (NewState != DISABLE)
2524  0000 4d            	tnz	a
2525  0001 2706          	jreq	L3621
2526                     ; 1008     TIM5->CCMR2 |= TIM_CCMR_OCxFE ;
2528  0003 7214530a      	bset	21258,#2
2530  0007 2004          	jra	L5621
2531  0009               L3621:
2532                     ; 1012     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2534  0009 7215530a      	bres	21258,#2
2535  000d               L5621:
2536                     ; 1014 }
2539  000d 81            	ret
2575                     ; 1024 void TIM5_OC1PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2575                     ; 1025 {
2576                     .text:	section	.text,new
2577  0000               _TIM5_OC1PolarityConfig:
2581                     ; 1027   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
2583                     ; 1030   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
2585  0000 a101          	cp	a,#1
2586  0002 2606          	jrne	L5031
2587                     ; 1032     TIM5->CCER1 |= TIM_CCER1_CC1P ;
2589  0004 7212530b      	bset	21259,#1
2591  0008 2004          	jra	L7031
2592  000a               L5031:
2593                     ; 1036     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
2595  000a 7213530b      	bres	21259,#1
2596  000e               L7031:
2597                     ; 1038 }
2600  000e 81            	ret
2636                     ; 1048 void TIM5_OC2PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2636                     ; 1049 {
2637                     .text:	section	.text,new
2638  0000               _TIM5_OC2PolarityConfig:
2642                     ; 1051   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
2644                     ; 1054   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
2646  0000 a101          	cp	a,#1
2647  0002 2606          	jrne	L7231
2648                     ; 1056     TIM5->CCER1 |= TIM_CCER1_CC2P ;
2650  0004 721a530b      	bset	21259,#5
2652  0008 2004          	jra	L1331
2653  000a               L7231:
2654                     ; 1060     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
2656  000a 721b530b      	bres	21259,#5
2657  000e               L1331:
2658                     ; 1062 }
2661  000e 81            	ret
2706                     ; 1074 void TIM5_CCxCmd(TIM5_Channel_TypeDef TIM5_Channel,
2706                     ; 1075                  FunctionalState NewState)
2706                     ; 1076 {
2707                     .text:	section	.text,new
2708  0000               _TIM5_CCxCmd:
2710  0000 89            	pushw	x
2711       00000000      OFST:	set	0
2714                     ; 1078   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
2716                     ; 1079   assert_param(IS_FUNCTIONAL_STATE(NewState));
2718                     ; 1081   if (TIM5_Channel == TIM5_Channel_1)
2720  0001 9e            	ld	a,xh
2721  0002 4d            	tnz	a
2722  0003 2610          	jrne	L5531
2723                     ; 1084     if (NewState != DISABLE)
2725  0005 9f            	ld	a,xl
2726  0006 4d            	tnz	a
2727  0007 2706          	jreq	L7531
2728                     ; 1086       TIM5->CCER1 |= TIM_CCER1_CC1E ;
2730  0009 7210530b      	bset	21259,#0
2732  000d 2014          	jra	L3631
2733  000f               L7531:
2734                     ; 1090       TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
2736  000f 7211530b      	bres	21259,#0
2737  0013 200e          	jra	L3631
2738  0015               L5531:
2739                     ; 1097     if (NewState != DISABLE)
2741  0015 0d02          	tnz	(OFST+2,sp)
2742  0017 2706          	jreq	L5631
2743                     ; 1099       TIM5->CCER1 |= TIM_CCER1_CC2E;
2745  0019 7218530b      	bset	21259,#4
2747  001d 2004          	jra	L3631
2748  001f               L5631:
2749                     ; 1103       TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
2751  001f 7219530b      	bres	21259,#4
2752  0023               L3631:
2753                     ; 1106 }
2756  0023 85            	popw	x
2757  0024 81            	ret
2921                     ; 1184 void TIM5_ICInit(TIM5_Channel_TypeDef TIM5_Channel,
2921                     ; 1185                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
2921                     ; 1186                  TIM5_ICSelection_TypeDef TIM5_ICSelection,
2921                     ; 1187                  TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
2921                     ; 1188                  uint8_t TIM5_ICFilter)
2921                     ; 1189 {
2922                     .text:	section	.text,new
2923  0000               _TIM5_ICInit:
2925  0000 89            	pushw	x
2926       00000000      OFST:	set	0
2929                     ; 1191   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
2931                     ; 1193   if (TIM5_Channel == TIM5_Channel_1)
2933  0001 9e            	ld	a,xh
2934  0002 4d            	tnz	a
2935  0003 2614          	jrne	L5641
2936                     ; 1196     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection, TIM5_ICFilter);
2938  0005 7b07          	ld	a,(OFST+7,sp)
2939  0007 88            	push	a
2940  0008 7b06          	ld	a,(OFST+6,sp)
2941  000a 97            	ld	xl,a
2942  000b 7b03          	ld	a,(OFST+3,sp)
2943  000d 95            	ld	xh,a
2944  000e cd0000        	call	L3_TI1_Config
2946  0011 84            	pop	a
2947                     ; 1199     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
2949  0012 7b06          	ld	a,(OFST+6,sp)
2950  0014 cd0000        	call	_TIM5_SetIC1Prescaler
2953  0017 2012          	jra	L7641
2954  0019               L5641:
2955                     ; 1204     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection, TIM5_ICFilter);
2957  0019 7b07          	ld	a,(OFST+7,sp)
2958  001b 88            	push	a
2959  001c 7b06          	ld	a,(OFST+6,sp)
2960  001e 97            	ld	xl,a
2961  001f 7b03          	ld	a,(OFST+3,sp)
2962  0021 95            	ld	xh,a
2963  0022 cd0000        	call	L5_TI2_Config
2965  0025 84            	pop	a
2966                     ; 1207     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
2968  0026 7b06          	ld	a,(OFST+6,sp)
2969  0028 cd0000        	call	_TIM5_SetIC2Prescaler
2971  002b               L7641:
2972                     ; 1209 }
2975  002b 85            	popw	x
2976  002c 81            	ret
3072                     ; 1235 void TIM5_PWMIConfig(TIM5_Channel_TypeDef TIM5_Channel,
3072                     ; 1236                      TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
3072                     ; 1237                      TIM5_ICSelection_TypeDef TIM5_ICSelection,
3072                     ; 1238                      TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
3072                     ; 1239                      uint8_t TIM5_ICFilter)
3072                     ; 1240 {
3073                     .text:	section	.text,new
3074  0000               _TIM5_PWMIConfig:
3076  0000 89            	pushw	x
3077  0001 89            	pushw	x
3078       00000002      OFST:	set	2
3081                     ; 1241   uint8_t icpolarity = TIM5_ICPolarity_Rising;
3083                     ; 1242   uint8_t icselection = TIM5_ICSelection_DirectTI;
3085                     ; 1245   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
3087                     ; 1248   if (TIM5_ICPolarity == TIM5_ICPolarity_Rising)
3089  0002 9f            	ld	a,xl
3090  0003 4d            	tnz	a
3091  0004 2606          	jrne	L7351
3092                     ; 1250     icpolarity = TIM5_ICPolarity_Falling;
3094  0006 a601          	ld	a,#1
3095  0008 6b01          	ld	(OFST-1,sp),a
3098  000a 2002          	jra	L1451
3099  000c               L7351:
3100                     ; 1254     icpolarity = TIM5_ICPolarity_Rising;
3102  000c 0f01          	clr	(OFST-1,sp)
3104  000e               L1451:
3105                     ; 1258   if (TIM5_ICSelection == TIM5_ICSelection_DirectTI)
3107  000e 7b07          	ld	a,(OFST+5,sp)
3108  0010 a101          	cp	a,#1
3109  0012 2606          	jrne	L3451
3110                     ; 1260     icselection = TIM5_ICSelection_IndirectTI;
3112  0014 a602          	ld	a,#2
3113  0016 6b02          	ld	(OFST+0,sp),a
3116  0018 2004          	jra	L5451
3117  001a               L3451:
3118                     ; 1264     icselection = TIM5_ICSelection_DirectTI;
3120  001a a601          	ld	a,#1
3121  001c 6b02          	ld	(OFST+0,sp),a
3123  001e               L5451:
3124                     ; 1267   if (TIM5_Channel == TIM5_Channel_1)
3126  001e 0d03          	tnz	(OFST+1,sp)
3127  0020 2626          	jrne	L7451
3128                     ; 1270     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection,
3128                     ; 1271                TIM5_ICFilter);
3130  0022 7b09          	ld	a,(OFST+7,sp)
3131  0024 88            	push	a
3132  0025 7b08          	ld	a,(OFST+6,sp)
3133  0027 97            	ld	xl,a
3134  0028 7b05          	ld	a,(OFST+3,sp)
3135  002a 95            	ld	xh,a
3136  002b cd0000        	call	L3_TI1_Config
3138  002e 84            	pop	a
3139                     ; 1274     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
3141  002f 7b08          	ld	a,(OFST+6,sp)
3142  0031 cd0000        	call	_TIM5_SetIC1Prescaler
3144                     ; 1277     TI2_Config((TIM5_ICPolarity_TypeDef)icpolarity, (TIM5_ICSelection_TypeDef)icselection, TIM5_ICFilter);
3146  0034 7b09          	ld	a,(OFST+7,sp)
3147  0036 88            	push	a
3148  0037 7b03          	ld	a,(OFST+1,sp)
3149  0039 97            	ld	xl,a
3150  003a 7b02          	ld	a,(OFST+0,sp)
3151  003c 95            	ld	xh,a
3152  003d cd0000        	call	L5_TI2_Config
3154  0040 84            	pop	a
3155                     ; 1280     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
3157  0041 7b08          	ld	a,(OFST+6,sp)
3158  0043 cd0000        	call	_TIM5_SetIC2Prescaler
3161  0046 2024          	jra	L1551
3162  0048               L7451:
3163                     ; 1285     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection,
3163                     ; 1286                TIM5_ICFilter);
3165  0048 7b09          	ld	a,(OFST+7,sp)
3166  004a 88            	push	a
3167  004b 7b08          	ld	a,(OFST+6,sp)
3168  004d 97            	ld	xl,a
3169  004e 7b05          	ld	a,(OFST+3,sp)
3170  0050 95            	ld	xh,a
3171  0051 cd0000        	call	L5_TI2_Config
3173  0054 84            	pop	a
3174                     ; 1289     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
3176  0055 7b08          	ld	a,(OFST+6,sp)
3177  0057 cd0000        	call	_TIM5_SetIC2Prescaler
3179                     ; 1292     TI1_Config((TIM5_ICPolarity_TypeDef)icpolarity, (TIM5_ICSelection_TypeDef)icselection, TIM5_ICFilter);
3181  005a 7b09          	ld	a,(OFST+7,sp)
3182  005c 88            	push	a
3183  005d 7b03          	ld	a,(OFST+1,sp)
3184  005f 97            	ld	xl,a
3185  0060 7b02          	ld	a,(OFST+0,sp)
3186  0062 95            	ld	xh,a
3187  0063 cd0000        	call	L3_TI1_Config
3189  0066 84            	pop	a
3190                     ; 1295     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
3192  0067 7b08          	ld	a,(OFST+6,sp)
3193  0069 cd0000        	call	_TIM5_SetIC1Prescaler
3195  006c               L1551:
3196                     ; 1297 }
3199  006c 5b04          	addw	sp,#4
3200  006e 81            	ret
3252                     ; 1304 uint16_t TIM5_GetCapture1(void)
3252                     ; 1305 {
3253                     .text:	section	.text,new
3254  0000               _TIM5_GetCapture1:
3256  0000 5204          	subw	sp,#4
3257       00000004      OFST:	set	4
3260                     ; 1306   uint16_t tmpccr1 = 0;
3262                     ; 1309   tmpccr1h = TIM5->CCR1H;
3264  0002 c65311        	ld	a,21265
3265  0005 6b02          	ld	(OFST-2,sp),a
3267                     ; 1310   tmpccr1l = TIM5->CCR1L;
3269  0007 c65312        	ld	a,21266
3270  000a 6b01          	ld	(OFST-3,sp),a
3272                     ; 1312   tmpccr1 = (uint16_t)(tmpccr1l);
3274  000c 7b01          	ld	a,(OFST-3,sp)
3275  000e 5f            	clrw	x
3276  000f 97            	ld	xl,a
3277  0010 1f03          	ldw	(OFST-1,sp),x
3279                     ; 1313   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3281  0012 7b02          	ld	a,(OFST-2,sp)
3282  0014 5f            	clrw	x
3283  0015 97            	ld	xl,a
3284  0016 4f            	clr	a
3285  0017 02            	rlwa	x,a
3286  0018 01            	rrwa	x,a
3287  0019 1a04          	or	a,(OFST+0,sp)
3288  001b 01            	rrwa	x,a
3289  001c 1a03          	or	a,(OFST-1,sp)
3290  001e 01            	rrwa	x,a
3291  001f 1f03          	ldw	(OFST-1,sp),x
3293                     ; 1315   return ((uint16_t)tmpccr1);
3295  0021 1e03          	ldw	x,(OFST-1,sp)
3298  0023 5b04          	addw	sp,#4
3299  0025 81            	ret
3351                     ; 1323 uint16_t TIM5_GetCapture2(void)
3351                     ; 1324 {
3352                     .text:	section	.text,new
3353  0000               _TIM5_GetCapture2:
3355  0000 5204          	subw	sp,#4
3356       00000004      OFST:	set	4
3359                     ; 1325   uint16_t tmpccr2 = 0;
3361                     ; 1328   tmpccr2h = TIM5->CCR2H;
3363  0002 c65313        	ld	a,21267
3364  0005 6b02          	ld	(OFST-2,sp),a
3366                     ; 1329   tmpccr2l = TIM5->CCR2L;
3368  0007 c65314        	ld	a,21268
3369  000a 6b01          	ld	(OFST-3,sp),a
3371                     ; 1331   tmpccr2 = (uint16_t)(tmpccr2l);
3373  000c 7b01          	ld	a,(OFST-3,sp)
3374  000e 5f            	clrw	x
3375  000f 97            	ld	xl,a
3376  0010 1f03          	ldw	(OFST-1,sp),x
3378                     ; 1332   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3380  0012 7b02          	ld	a,(OFST-2,sp)
3381  0014 5f            	clrw	x
3382  0015 97            	ld	xl,a
3383  0016 4f            	clr	a
3384  0017 02            	rlwa	x,a
3385  0018 01            	rrwa	x,a
3386  0019 1a04          	or	a,(OFST+0,sp)
3387  001b 01            	rrwa	x,a
3388  001c 1a03          	or	a,(OFST-1,sp)
3389  001e 01            	rrwa	x,a
3390  001f 1f03          	ldw	(OFST-1,sp),x
3392                     ; 1334   return ((uint16_t)tmpccr2);
3394  0021 1e03          	ldw	x,(OFST-1,sp)
3397  0023 5b04          	addw	sp,#4
3398  0025 81            	ret
3443                     ; 1347 void TIM5_SetIC1Prescaler(TIM5_ICPSC_TypeDef TIM5_IC1Prescaler)
3443                     ; 1348 {
3444                     .text:	section	.text,new
3445  0000               _TIM5_SetIC1Prescaler:
3447  0000 88            	push	a
3448  0001 88            	push	a
3449       00000001      OFST:	set	1
3452                     ; 1349   uint8_t tmpccmr1 = 0;
3454                     ; 1352   assert_param(IS_TIM5_IC_PRESCALER(TIM5_IC1Prescaler));
3456                     ; 1354   tmpccmr1 = TIM5->CCMR1;
3458  0002 c65309        	ld	a,21257
3459  0005 6b01          	ld	(OFST+0,sp),a
3461                     ; 1357   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3463  0007 7b01          	ld	a,(OFST+0,sp)
3464  0009 a4f3          	and	a,#243
3465  000b 6b01          	ld	(OFST+0,sp),a
3467                     ; 1360   tmpccmr1 |= (uint8_t)TIM5_IC1Prescaler;
3469  000d 7b01          	ld	a,(OFST+0,sp)
3470  000f 1a02          	or	a,(OFST+1,sp)
3471  0011 6b01          	ld	(OFST+0,sp),a
3473                     ; 1362   TIM5->CCMR1 = tmpccmr1;
3475  0013 7b01          	ld	a,(OFST+0,sp)
3476  0015 c75309        	ld	21257,a
3477                     ; 1363 }
3480  0018 85            	popw	x
3481  0019 81            	ret
3526                     ; 1375 void TIM5_SetIC2Prescaler(TIM5_ICPSC_TypeDef TIM5_IC2Prescaler)
3526                     ; 1376 {
3527                     .text:	section	.text,new
3528  0000               _TIM5_SetIC2Prescaler:
3530  0000 88            	push	a
3531  0001 88            	push	a
3532       00000001      OFST:	set	1
3535                     ; 1377   uint8_t tmpccmr2 = 0;
3537                     ; 1380   assert_param(IS_TIM5_IC_PRESCALER(TIM5_IC2Prescaler));
3539                     ; 1382   tmpccmr2 = TIM5->CCMR2;
3541  0002 c6530a        	ld	a,21258
3542  0005 6b01          	ld	(OFST+0,sp),a
3544                     ; 1385   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3546  0007 7b01          	ld	a,(OFST+0,sp)
3547  0009 a4f3          	and	a,#243
3548  000b 6b01          	ld	(OFST+0,sp),a
3550                     ; 1388   tmpccmr2 |= (uint8_t)TIM5_IC2Prescaler;
3552  000d 7b01          	ld	a,(OFST+0,sp)
3553  000f 1a02          	or	a,(OFST+1,sp)
3554  0011 6b01          	ld	(OFST+0,sp),a
3556                     ; 1390   TIM5->CCMR2 = tmpccmr2;
3558  0013 7b01          	ld	a,(OFST+0,sp)
3559  0015 c7530a        	ld	21258,a
3560                     ; 1391 }
3563  0018 85            	popw	x
3564  0019 81            	ret
3650                     ; 1422 void TIM5_ITConfig(TIM5_IT_TypeDef TIM5_IT, FunctionalState NewState)
3650                     ; 1423 {
3651                     .text:	section	.text,new
3652  0000               _TIM5_ITConfig:
3654  0000 89            	pushw	x
3655       00000000      OFST:	set	0
3658                     ; 1425   assert_param(IS_TIM5_IT(TIM5_IT));
3660                     ; 1426   assert_param(IS_FUNCTIONAL_STATE(NewState));
3662                     ; 1428   if (NewState != DISABLE)
3664  0001 9f            	ld	a,xl
3665  0002 4d            	tnz	a
3666  0003 2709          	jreq	L3371
3667                     ; 1431     TIM5->IER |= (uint8_t)TIM5_IT;
3669  0005 9e            	ld	a,xh
3670  0006 ca5305        	or	a,21253
3671  0009 c75305        	ld	21253,a
3673  000c 2009          	jra	L5371
3674  000e               L3371:
3675                     ; 1436     TIM5->IER &= (uint8_t)(~(uint8_t)TIM5_IT);
3677  000e 7b01          	ld	a,(OFST+1,sp)
3678  0010 43            	cpl	a
3679  0011 c45305        	and	a,21253
3680  0014 c75305        	ld	21253,a
3681  0017               L5371:
3682                     ; 1438 }
3685  0017 85            	popw	x
3686  0018 81            	ret
3767                     ; 1451 void TIM5_GenerateEvent(TIM5_EventSource_TypeDef TIM5_EventSource)
3767                     ; 1452 {
3768                     .text:	section	.text,new
3769  0000               _TIM5_GenerateEvent:
3773                     ; 1454   assert_param(IS_TIM5_EVENT_SOURCE((uint8_t)TIM5_EventSource));
3775                     ; 1457   TIM5->EGR |= (uint8_t)TIM5_EventSource;
3777  0000 ca5308        	or	a,21256
3778  0003 c75308        	ld	21256,a
3779                     ; 1458 }
3782  0006 81            	ret
3921                     ; 1473 FlagStatus TIM5_GetFlagStatus(TIM5_FLAG_TypeDef TIM5_FLAG)
3921                     ; 1474 {
3922                     .text:	section	.text,new
3923  0000               _TIM5_GetFlagStatus:
3925  0000 89            	pushw	x
3926  0001 89            	pushw	x
3927       00000002      OFST:	set	2
3930                     ; 1475   FlagStatus bitstatus = RESET;
3932                     ; 1476   uint8_t tim5_flag_l = 0, tim5_flag_h = 0;
3936                     ; 1479   assert_param(IS_TIM5_GET_FLAG(TIM5_FLAG));
3938                     ; 1481   tim5_flag_l = (uint8_t)(TIM5->SR1 & (uint8_t)(TIM5_FLAG));
3940  0002 9f            	ld	a,xl
3941  0003 c45306        	and	a,21254
3942  0006 6b01          	ld	(OFST-1,sp),a
3944                     ; 1482   tim5_flag_h = (uint8_t)(TIM5->SR2 & (uint8_t)((uint16_t)TIM5_FLAG >> 8));
3946  0008 c65307        	ld	a,21255
3947  000b 1403          	and	a,(OFST+1,sp)
3948  000d 6b02          	ld	(OFST+0,sp),a
3950                     ; 1484   if ((uint8_t)(tim5_flag_l | tim5_flag_h) != 0)
3952  000f 7b01          	ld	a,(OFST-1,sp)
3953  0011 1a02          	or	a,(OFST+0,sp)
3954  0013 2706          	jreq	L7502
3955                     ; 1486     bitstatus = SET;
3957  0015 a601          	ld	a,#1
3958  0017 6b02          	ld	(OFST+0,sp),a
3961  0019 2002          	jra	L1602
3962  001b               L7502:
3963                     ; 1490     bitstatus = RESET;
3965  001b 0f02          	clr	(OFST+0,sp)
3967  001d               L1602:
3968                     ; 1492   return ((FlagStatus)bitstatus);
3970  001d 7b02          	ld	a,(OFST+0,sp)
3973  001f 5b04          	addw	sp,#4
3974  0021 81            	ret
4009                     ; 1506 void TIM5_ClearFlag(TIM5_FLAG_TypeDef TIM5_FLAG)
4009                     ; 1507 {
4010                     .text:	section	.text,new
4011  0000               _TIM5_ClearFlag:
4013  0000 89            	pushw	x
4014       00000000      OFST:	set	0
4017                     ; 1509   assert_param(IS_TIM5_CLEAR_FLAG((uint16_t)TIM5_FLAG));
4019                     ; 1511   TIM5->SR1 = (uint8_t)(~(uint8_t)(TIM5_FLAG));
4021  0001 9f            	ld	a,xl
4022  0002 43            	cpl	a
4023  0003 c75306        	ld	21254,a
4024                     ; 1512   TIM5->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM5_FLAG >> 8));
4026  0006 7b01          	ld	a,(OFST+1,sp)
4027  0008 43            	cpl	a
4028  0009 c75307        	ld	21255,a
4029                     ; 1513 }
4032  000c 85            	popw	x
4033  000d 81            	ret
4097                     ; 1526 ITStatus TIM5_GetITStatus(TIM5_IT_TypeDef TIM5_IT)
4097                     ; 1527 {
4098                     .text:	section	.text,new
4099  0000               _TIM5_GetITStatus:
4101  0000 88            	push	a
4102  0001 89            	pushw	x
4103       00000002      OFST:	set	2
4106                     ; 1528   ITStatus bitstatus = RESET;
4108                     ; 1530   uint8_t TIM5_itStatus = 0x0, TIM5_itEnable = 0x0;
4112                     ; 1533   assert_param(IS_TIM5_GET_IT(TIM5_IT));
4114                     ; 1535   TIM5_itStatus = (uint8_t)(TIM5->SR1 & (uint8_t)TIM5_IT);
4116  0002 c45306        	and	a,21254
4117  0005 6b01          	ld	(OFST-1,sp),a
4119                     ; 1537   TIM5_itEnable = (uint8_t)(TIM5->IER & (uint8_t)TIM5_IT);
4121  0007 c65305        	ld	a,21253
4122  000a 1403          	and	a,(OFST+1,sp)
4123  000c 6b02          	ld	(OFST+0,sp),a
4125                     ; 1539   if ((TIM5_itStatus != (uint8_t)RESET ) && (TIM5_itEnable != (uint8_t)RESET))
4127  000e 0d01          	tnz	(OFST-1,sp)
4128  0010 270a          	jreq	L3312
4130  0012 0d02          	tnz	(OFST+0,sp)
4131  0014 2706          	jreq	L3312
4132                     ; 1541     bitstatus = (ITStatus)SET;
4134  0016 a601          	ld	a,#1
4135  0018 6b02          	ld	(OFST+0,sp),a
4138  001a 2002          	jra	L5312
4139  001c               L3312:
4140                     ; 1545     bitstatus = (ITStatus)RESET;
4142  001c 0f02          	clr	(OFST+0,sp)
4144  001e               L5312:
4145                     ; 1547   return ((ITStatus)bitstatus);
4147  001e 7b02          	ld	a,(OFST+0,sp)
4150  0020 5b03          	addw	sp,#3
4151  0022 81            	ret
4187                     ; 1561 void TIM5_ClearITPendingBit(TIM5_IT_TypeDef TIM5_IT)
4187                     ; 1562 {
4188                     .text:	section	.text,new
4189  0000               _TIM5_ClearITPendingBit:
4193                     ; 1564   assert_param(IS_TIM5_IT(TIM5_IT));
4195                     ; 1567   TIM5->SR1 = (uint8_t)(~(uint8_t)TIM5_IT);
4197  0000 43            	cpl	a
4198  0001 c75306        	ld	21254,a
4199                     ; 1568 }
4202  0004 81            	ret
4275                     ; 1581 void TIM5_DMACmd( TIM5_DMASource_TypeDef TIM5_DMASource, FunctionalState NewState)
4275                     ; 1582 {
4276                     .text:	section	.text,new
4277  0000               _TIM5_DMACmd:
4279  0000 89            	pushw	x
4280       00000000      OFST:	set	0
4283                     ; 1584   assert_param(IS_FUNCTIONAL_STATE(NewState));
4285                     ; 1585   assert_param(IS_TIM5_DMA_SOURCE(TIM5_DMASource));
4287                     ; 1587   if (NewState != DISABLE)
4289  0001 9f            	ld	a,xl
4290  0002 4d            	tnz	a
4291  0003 2709          	jreq	L1122
4292                     ; 1590     TIM5->DER |= TIM5_DMASource;
4294  0005 9e            	ld	a,xh
4295  0006 ca5304        	or	a,21252
4296  0009 c75304        	ld	21252,a
4298  000c 2009          	jra	L3122
4299  000e               L1122:
4300                     ; 1595     TIM5->DER &= (uint8_t)(~TIM5_DMASource);
4302  000e 7b01          	ld	a,(OFST+1,sp)
4303  0010 43            	cpl	a
4304  0011 c45304        	and	a,21252
4305  0014 c75304        	ld	21252,a
4306  0017               L3122:
4307                     ; 1597 }
4310  0017 85            	popw	x
4311  0018 81            	ret
4346                     ; 1605 void TIM5_SelectCCDMA(FunctionalState NewState)
4346                     ; 1606 {
4347                     .text:	section	.text,new
4348  0000               _TIM5_SelectCCDMA:
4352                     ; 1608   assert_param(IS_FUNCTIONAL_STATE(NewState));
4354                     ; 1610   if (NewState != DISABLE)
4356  0000 4d            	tnz	a
4357  0001 2706          	jreq	L3322
4358                     ; 1613     TIM5->CR2 |= TIM_CR2_CCDS;
4360  0003 72165301      	bset	21249,#3
4362  0007 2004          	jra	L5322
4363  0009               L3322:
4364                     ; 1618     TIM5->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
4366  0009 72175301      	bres	21249,#3
4367  000d               L5322:
4368                     ; 1620 }
4371  000d 81            	ret
4395                     ; 1644 void TIM5_InternalClockConfig(void)
4395                     ; 1645 {
4396                     .text:	section	.text,new
4397  0000               _TIM5_InternalClockConfig:
4401                     ; 1647   TIM5->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
4403  0000 c65302        	ld	a,21250
4404  0003 a4f8          	and	a,#248
4405  0005 c75302        	ld	21250,a
4406                     ; 1648 }
4409  0008 81            	ret
4498                     ; 1665 void TIM5_TIxExternalClockConfig(TIM5_TIxExternalCLK1Source_TypeDef TIM5_TIxExternalCLKSource,
4498                     ; 1666                                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
4498                     ; 1667                                  uint8_t ICFilter)
4498                     ; 1668 {
4499                     .text:	section	.text,new
4500  0000               _TIM5_TIxExternalClockConfig:
4502  0000 89            	pushw	x
4503       00000000      OFST:	set	0
4506                     ; 1670   assert_param(IS_TIM5_TIXCLK_SOURCE(TIM5_TIxExternalCLKSource));
4508                     ; 1671   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
4510                     ; 1672   assert_param(IS_TIM5_IC_FILTER(ICFilter));
4512                     ; 1675   if (TIM5_TIxExternalCLKSource == TIM5_TIxExternalCLK1Source_TI2)
4514  0001 9e            	ld	a,xh
4515  0002 a160          	cp	a,#96
4516  0004 260e          	jrne	L7032
4517                     ; 1677     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection_DirectTI, ICFilter);
4519  0006 7b05          	ld	a,(OFST+5,sp)
4520  0008 88            	push	a
4521  0009 9f            	ld	a,xl
4522  000a ae0001        	ldw	x,#1
4523  000d 95            	ld	xh,a
4524  000e cd0000        	call	L5_TI2_Config
4526  0011 84            	pop	a
4528  0012 200d          	jra	L1132
4529  0014               L7032:
4530                     ; 1681     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection_DirectTI, ICFilter);
4532  0014 7b05          	ld	a,(OFST+5,sp)
4533  0016 88            	push	a
4534  0017 7b03          	ld	a,(OFST+3,sp)
4535  0019 ae0001        	ldw	x,#1
4536  001c 95            	ld	xh,a
4537  001d cd0000        	call	L3_TI1_Config
4539  0020 84            	pop	a
4540  0021               L1132:
4541                     ; 1685   TIM5_SelectInputTrigger((TIM5_TRGSelection_TypeDef)TIM5_TIxExternalCLKSource);
4543  0021 7b01          	ld	a,(OFST+1,sp)
4544  0023 cd0000        	call	_TIM5_SelectInputTrigger
4546                     ; 1688   TIM5->SMCR |= (uint8_t)(TIM5_SlaveMode_External1);
4548  0026 c65302        	ld	a,21250
4549  0029 aa07          	or	a,#7
4550  002b c75302        	ld	21250,a
4551                     ; 1689 }
4554  002e 85            	popw	x
4555  002f 81            	ret
4672                     ; 1707 void TIM5_ETRClockMode1Config(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
4672                     ; 1708                               TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
4672                     ; 1709                               uint8_t ExtTRGFilter)
4672                     ; 1710 {
4673                     .text:	section	.text,new
4674  0000               _TIM5_ETRClockMode1Config:
4676  0000 89            	pushw	x
4677       00000000      OFST:	set	0
4680                     ; 1712   TIM5_ETRConfig(TIM5_ExtTRGPrescaler, TIM5_ExtTRGPolarity, ExtTRGFilter);
4682  0001 7b05          	ld	a,(OFST+5,sp)
4683  0003 88            	push	a
4684  0004 9f            	ld	a,xl
4685  0005 97            	ld	xl,a
4686  0006 7b02          	ld	a,(OFST+2,sp)
4687  0008 95            	ld	xh,a
4688  0009 cd0000        	call	_TIM5_ETRConfig
4690  000c 84            	pop	a
4691                     ; 1715   TIM5->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
4693  000d c65302        	ld	a,21250
4694  0010 a4f8          	and	a,#248
4695  0012 c75302        	ld	21250,a
4696                     ; 1716   TIM5->SMCR |= (uint8_t)(TIM5_SlaveMode_External1);
4698  0015 c65302        	ld	a,21250
4699  0018 aa07          	or	a,#7
4700  001a c75302        	ld	21250,a
4701                     ; 1719   TIM5->SMCR &= (uint8_t)(~TIM_SMCR_TS);
4703  001d c65302        	ld	a,21250
4704  0020 a48f          	and	a,#143
4705  0022 c75302        	ld	21250,a
4706                     ; 1720   TIM5->SMCR |= (uint8_t)((TIM5_TRGSelection_TypeDef)TIM5_TRGSelection_ETRF);
4708  0025 c65302        	ld	a,21250
4709  0028 aa70          	or	a,#112
4710  002a c75302        	ld	21250,a
4711                     ; 1721 }
4714  002d 85            	popw	x
4715  002e 81            	ret
4773                     ; 1739 void TIM5_ETRClockMode2Config(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
4773                     ; 1740                               TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
4773                     ; 1741                               uint8_t ExtTRGFilter)
4773                     ; 1742 {
4774                     .text:	section	.text,new
4775  0000               _TIM5_ETRClockMode2Config:
4777  0000 89            	pushw	x
4778       00000000      OFST:	set	0
4781                     ; 1744   TIM5_ETRConfig(TIM5_ExtTRGPrescaler, TIM5_ExtTRGPolarity, ExtTRGFilter);
4783  0001 7b05          	ld	a,(OFST+5,sp)
4784  0003 88            	push	a
4785  0004 9f            	ld	a,xl
4786  0005 97            	ld	xl,a
4787  0006 7b02          	ld	a,(OFST+2,sp)
4788  0008 95            	ld	xh,a
4789  0009 cd0000        	call	_TIM5_ETRConfig
4791  000c 84            	pop	a
4792                     ; 1747   TIM5->ETR |= TIM_ETR_ECE ;
4794  000d 721c5303      	bset	21251,#6
4795                     ; 1748 }
4798  0011 85            	popw	x
4799  0012 81            	ret
4915                     ; 1799 void TIM5_SelectInputTrigger(TIM5_TRGSelection_TypeDef TIM5_InputTriggerSource)
4915                     ; 1800 {
4916                     .text:	section	.text,new
4917  0000               _TIM5_SelectInputTrigger:
4919  0000 88            	push	a
4920  0001 88            	push	a
4921       00000001      OFST:	set	1
4924                     ; 1801   uint8_t tmpsmcr = 0;
4926                     ; 1804   assert_param(IS_TIM5_TRIGGER_SELECTION(TIM5_InputTriggerSource));
4928                     ; 1806   tmpsmcr = TIM5->SMCR;
4930  0002 c65302        	ld	a,21250
4931  0005 6b01          	ld	(OFST+0,sp),a
4933                     ; 1809   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
4935  0007 7b01          	ld	a,(OFST+0,sp)
4936  0009 a48f          	and	a,#143
4937  000b 6b01          	ld	(OFST+0,sp),a
4939                     ; 1810   tmpsmcr |= (uint8_t)TIM5_InputTriggerSource;
4941  000d 7b01          	ld	a,(OFST+0,sp)
4942  000f 1a02          	or	a,(OFST+1,sp)
4943  0011 6b01          	ld	(OFST+0,sp),a
4945                     ; 1812   TIM5->SMCR = (uint8_t)tmpsmcr;
4947  0013 7b01          	ld	a,(OFST+0,sp)
4948  0015 c75302        	ld	21250,a
4949                     ; 1813 }
4952  0018 85            	popw	x
4953  0019 81            	ret
5052                     ; 1827 void TIM5_SelectOutputTrigger(TIM5_TRGOSource_TypeDef TIM5_TRGOSource)
5052                     ; 1828 {
5053                     .text:	section	.text,new
5054  0000               _TIM5_SelectOutputTrigger:
5056  0000 88            	push	a
5057  0001 88            	push	a
5058       00000001      OFST:	set	1
5061                     ; 1829   uint8_t tmpcr2 = 0;
5063                     ; 1832   assert_param(IS_TIM5_TRGO_SOURCE(TIM5_TRGOSource));
5065                     ; 1834   tmpcr2 = TIM5->CR2;
5067  0002 c65301        	ld	a,21249
5068  0005 6b01          	ld	(OFST+0,sp),a
5070                     ; 1837   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
5072  0007 7b01          	ld	a,(OFST+0,sp)
5073  0009 a48f          	and	a,#143
5074  000b 6b01          	ld	(OFST+0,sp),a
5076                     ; 1840   tmpcr2 |=  (uint8_t)TIM5_TRGOSource;
5078  000d 7b01          	ld	a,(OFST+0,sp)
5079  000f 1a02          	or	a,(OFST+1,sp)
5080  0011 6b01          	ld	(OFST+0,sp),a
5082                     ; 1842   TIM5->CR2 = tmpcr2;
5084  0013 7b01          	ld	a,(OFST+0,sp)
5085  0015 c75301        	ld	21249,a
5086                     ; 1843 }
5089  0018 85            	popw	x
5090  0019 81            	ret
5173                     ; 1855 void TIM5_SelectSlaveMode(TIM5_SlaveMode_TypeDef TIM5_SlaveMode)
5173                     ; 1856 {
5174                     .text:	section	.text,new
5175  0000               _TIM5_SelectSlaveMode:
5177  0000 88            	push	a
5178  0001 88            	push	a
5179       00000001      OFST:	set	1
5182                     ; 1857   uint8_t tmpsmcr = 0;
5184                     ; 1860   assert_param(IS_TIM5_SLAVE_MODE(TIM5_SlaveMode));
5186                     ; 1862   tmpsmcr = TIM5->SMCR;
5188  0002 c65302        	ld	a,21250
5189  0005 6b01          	ld	(OFST+0,sp),a
5191                     ; 1865   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
5193  0007 7b01          	ld	a,(OFST+0,sp)
5194  0009 a4f8          	and	a,#248
5195  000b 6b01          	ld	(OFST+0,sp),a
5197                     ; 1868   tmpsmcr |= (uint8_t)TIM5_SlaveMode;
5199  000d 7b01          	ld	a,(OFST+0,sp)
5200  000f 1a02          	or	a,(OFST+1,sp)
5201  0011 6b01          	ld	(OFST+0,sp),a
5203                     ; 1870   TIM5->SMCR = tmpsmcr;
5205  0013 7b01          	ld	a,(OFST+0,sp)
5206  0015 c75302        	ld	21250,a
5207                     ; 1871 }
5210  0018 85            	popw	x
5211  0019 81            	ret
5247                     ; 1879 void TIM5_SelectMasterSlaveMode(FunctionalState NewState)
5247                     ; 1880 {
5248                     .text:	section	.text,new
5249  0000               _TIM5_SelectMasterSlaveMode:
5253                     ; 1882   assert_param(IS_FUNCTIONAL_STATE(NewState));
5255                     ; 1885   if (NewState != DISABLE)
5257  0000 4d            	tnz	a
5258  0001 2706          	jreq	L7752
5259                     ; 1887     TIM5->SMCR |= TIM_SMCR_MSM;
5261  0003 721e5302      	bset	21250,#7
5263  0007 2004          	jra	L1062
5264  0009               L7752:
5265                     ; 1891     TIM5->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
5267  0009 721f5302      	bres	21250,#7
5268  000d               L1062:
5269                     ; 1893 }
5272  000d 81            	ret
5328                     ; 1911 void TIM5_ETRConfig(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
5328                     ; 1912                     TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
5328                     ; 1913                     uint8_t ExtTRGFilter)
5328                     ; 1914 {
5329                     .text:	section	.text,new
5330  0000               _TIM5_ETRConfig:
5332  0000 89            	pushw	x
5333       00000000      OFST:	set	0
5336                     ; 1916   assert_param(IS_TIM5_EXT_PRESCALER(TIM5_ExtTRGPrescaler));
5338                     ; 1917   assert_param(IS_TIM5_EXT_POLARITY(TIM5_ExtTRGPolarity));
5340                     ; 1918   assert_param(IS_TIM5_EXT_FILTER(ExtTRGFilter));
5342                     ; 1921   TIM5->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM5_ExtTRGPrescaler | (uint8_t)TIM5_ExtTRGPolarity)
5342                     ; 1922                          | (uint8_t)ExtTRGFilter);
5344  0001 9f            	ld	a,xl
5345  0002 1a01          	or	a,(OFST+1,sp)
5346  0004 1a05          	or	a,(OFST+5,sp)
5347  0006 ca5303        	or	a,21251
5348  0009 c75303        	ld	21251,a
5349                     ; 1923 }
5352  000c 85            	popw	x
5353  000d 81            	ret
5466                     ; 1958 void TIM5_EncoderInterfaceConfig(TIM5_EncoderMode_TypeDef TIM5_EncoderMode,
5466                     ; 1959                                  TIM5_ICPolarity_TypeDef TIM5_IC1Polarity,
5466                     ; 1960                                  TIM5_ICPolarity_TypeDef TIM5_IC2Polarity)
5466                     ; 1961 {
5467                     .text:	section	.text,new
5468  0000               _TIM5_EncoderInterfaceConfig:
5470  0000 89            	pushw	x
5471  0001 5203          	subw	sp,#3
5472       00000003      OFST:	set	3
5475                     ; 1962   uint8_t tmpsmcr = 0;
5477                     ; 1963   uint8_t tmpccmr1 = 0;
5479                     ; 1964   uint8_t tmpccmr2 = 0;
5481                     ; 1967   assert_param(IS_TIM5_ENCODER_MODE(TIM5_EncoderMode));
5483                     ; 1968   assert_param(IS_TIM5_IC_POLARITY(TIM5_IC1Polarity));
5485                     ; 1969   assert_param(IS_TIM5_IC_POLARITY(TIM5_IC2Polarity));
5487                     ; 1971   tmpsmcr = TIM5->SMCR;
5489  0003 c65302        	ld	a,21250
5490  0006 6b01          	ld	(OFST-2,sp),a
5492                     ; 1972   tmpccmr1 = TIM5->CCMR1;
5494  0008 c65309        	ld	a,21257
5495  000b 6b02          	ld	(OFST-1,sp),a
5497                     ; 1973   tmpccmr2 = TIM5->CCMR2;
5499  000d c6530a        	ld	a,21258
5500  0010 6b03          	ld	(OFST+0,sp),a
5502                     ; 1976   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
5504  0012 7b01          	ld	a,(OFST-2,sp)
5505  0014 a4f0          	and	a,#240
5506  0016 6b01          	ld	(OFST-2,sp),a
5508                     ; 1977   tmpsmcr |= (uint8_t)TIM5_EncoderMode;
5510  0018 9e            	ld	a,xh
5511  0019 1a01          	or	a,(OFST-2,sp)
5512  001b 6b01          	ld	(OFST-2,sp),a
5514                     ; 1980   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
5516  001d 7b02          	ld	a,(OFST-1,sp)
5517  001f a4fc          	and	a,#252
5518  0021 6b02          	ld	(OFST-1,sp),a
5520                     ; 1981   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
5522  0023 7b03          	ld	a,(OFST+0,sp)
5523  0025 a4fc          	and	a,#252
5524  0027 6b03          	ld	(OFST+0,sp),a
5526                     ; 1982   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
5528  0029 7b02          	ld	a,(OFST-1,sp)
5529  002b aa01          	or	a,#1
5530  002d 6b02          	ld	(OFST-1,sp),a
5532                     ; 1983   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
5534  002f 7b03          	ld	a,(OFST+0,sp)
5535  0031 aa01          	or	a,#1
5536  0033 6b03          	ld	(OFST+0,sp),a
5538                     ; 1986   if (TIM5_IC1Polarity == TIM5_ICPolarity_Falling)
5540  0035 9f            	ld	a,xl
5541  0036 a101          	cp	a,#1
5542  0038 2606          	jrne	L5072
5543                     ; 1988     TIM5->CCER1 |= TIM_CCER1_CC1P ;
5545  003a 7212530b      	bset	21259,#1
5547  003e 2004          	jra	L7072
5548  0040               L5072:
5549                     ; 1992     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
5551  0040 7213530b      	bres	21259,#1
5552  0044               L7072:
5553                     ; 1995   if (TIM5_IC2Polarity == TIM5_ICPolarity_Falling)
5555  0044 7b08          	ld	a,(OFST+5,sp)
5556  0046 a101          	cp	a,#1
5557  0048 2606          	jrne	L1172
5558                     ; 1997     TIM5->CCER1 |= TIM_CCER1_CC2P ;
5560  004a 721a530b      	bset	21259,#5
5562  004e 2004          	jra	L3172
5563  0050               L1172:
5564                     ; 2001     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5566  0050 721b530b      	bres	21259,#5
5567  0054               L3172:
5568                     ; 2004   TIM5->SMCR = tmpsmcr;
5570  0054 7b01          	ld	a,(OFST-2,sp)
5571  0056 c75302        	ld	21250,a
5572                     ; 2005   TIM5->CCMR1 = tmpccmr1;
5574  0059 7b02          	ld	a,(OFST-1,sp)
5575  005b c75309        	ld	21257,a
5576                     ; 2006   TIM5->CCMR2 = tmpccmr2;
5578  005e 7b03          	ld	a,(OFST+0,sp)
5579  0060 c7530a        	ld	21258,a
5580                     ; 2007 }
5583  0063 5b05          	addw	sp,#5
5584  0065 81            	ret
5620                     ; 2015 void TIM5_SelectHallSensor(FunctionalState NewState)
5620                     ; 2016 {
5621                     .text:	section	.text,new
5622  0000               _TIM5_SelectHallSensor:
5626                     ; 2018   assert_param(IS_FUNCTIONAL_STATE(NewState));
5628                     ; 2021   if (NewState != DISABLE)
5630  0000 4d            	tnz	a
5631  0001 2706          	jreq	L3372
5632                     ; 2023     TIM5->CR2 |= TIM_CR2_TI1S;
5634  0003 721e5301      	bset	21249,#7
5636  0007 2004          	jra	L5372
5637  0009               L3372:
5638                     ; 2027     TIM5->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
5640  0009 721f5301      	bres	21249,#7
5641  000d               L5372:
5642                     ; 2029 }
5645  000d 81            	ret
5717                     ; 2050 static void TI1_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity, \
5717                     ; 2051                        TIM5_ICSelection_TypeDef TIM5_ICSelection, \
5717                     ; 2052                        uint8_t TIM5_ICFilter)
5717                     ; 2053 {
5718                     .text:	section	.text,new
5719  0000               L3_TI1_Config:
5721  0000 89            	pushw	x
5722  0001 89            	pushw	x
5723       00000002      OFST:	set	2
5726                     ; 2054   uint8_t tmpccmr1 = 0;
5728                     ; 2055   uint8_t tmpicpolarity = TIM5_ICPolarity;
5730  0002 9e            	ld	a,xh
5731  0003 6b01          	ld	(OFST-1,sp),a
5733                     ; 2056   tmpccmr1 = TIM5->CCMR1;
5735  0005 c65309        	ld	a,21257
5736  0008 6b02          	ld	(OFST+0,sp),a
5738                     ; 2059   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
5740                     ; 2060   assert_param(IS_TIM5_IC_SELECTION(TIM5_ICSelection));
5742                     ; 2061   assert_param(IS_TIM5_IC_FILTER(TIM5_ICFilter));
5744                     ; 2064   TIM5->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
5746  000a 7211530b      	bres	21259,#0
5747                     ; 2067   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5749  000e 7b02          	ld	a,(OFST+0,sp)
5750  0010 a40c          	and	a,#12
5751  0012 6b02          	ld	(OFST+0,sp),a
5753                     ; 2068   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM5_ICSelection)) | ((uint8_t)(TIM5_ICFilter << 4)));
5755  0014 7b07          	ld	a,(OFST+5,sp)
5756  0016 97            	ld	xl,a
5757  0017 a610          	ld	a,#16
5758  0019 42            	mul	x,a
5759  001a 9f            	ld	a,xl
5760  001b 1a04          	or	a,(OFST+2,sp)
5761  001d 1a02          	or	a,(OFST+0,sp)
5762  001f 6b02          	ld	(OFST+0,sp),a
5764                     ; 2070   TIM5->CCMR1 = tmpccmr1;
5766  0021 7b02          	ld	a,(OFST+0,sp)
5767  0023 c75309        	ld	21257,a
5768                     ; 2073   if (tmpicpolarity == (uint8_t)(TIM5_ICPolarity_Falling))
5770  0026 7b01          	ld	a,(OFST-1,sp)
5771  0028 a101          	cp	a,#1
5772  002a 2606          	jrne	L5772
5773                     ; 2075     TIM5->CCER1 |= TIM_CCER1_CC1P;
5775  002c 7212530b      	bset	21259,#1
5777  0030 2004          	jra	L7772
5778  0032               L5772:
5779                     ; 2079     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5781  0032 7213530b      	bres	21259,#1
5782  0036               L7772:
5783                     ; 2083   TIM5->CCER1 |=  TIM_CCER1_CC1E;
5785  0036 7210530b      	bset	21259,#0
5786                     ; 2084 }
5789  003a 5b04          	addw	sp,#4
5790  003c 81            	ret
5862                     ; 2101 static void TI2_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
5862                     ; 2102                        TIM5_ICSelection_TypeDef TIM5_ICSelection,
5862                     ; 2103                        uint8_t TIM5_ICFilter)
5862                     ; 2104 {
5863                     .text:	section	.text,new
5864  0000               L5_TI2_Config:
5866  0000 89            	pushw	x
5867  0001 89            	pushw	x
5868       00000002      OFST:	set	2
5871                     ; 2105   uint8_t tmpccmr2 = 0;
5873                     ; 2106   uint8_t tmpicpolarity = TIM5_ICPolarity;
5875  0002 9e            	ld	a,xh
5876  0003 6b01          	ld	(OFST-1,sp),a
5878                     ; 2109   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
5880                     ; 2110   assert_param(IS_TIM5_IC_SELECTION(TIM5_ICSelection));
5882                     ; 2111   assert_param(IS_TIM5_IC_FILTER(TIM5_ICFilter));
5884                     ; 2113   tmpccmr2 = TIM5->CCMR2;
5886  0005 c6530a        	ld	a,21258
5887  0008 6b02          	ld	(OFST+0,sp),a
5889                     ; 2116   TIM5->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
5891  000a 7219530b      	bres	21259,#4
5892                     ; 2119   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5894  000e 7b02          	ld	a,(OFST+0,sp)
5895  0010 a40c          	and	a,#12
5896  0012 6b02          	ld	(OFST+0,sp),a
5898                     ; 2120   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM5_ICSelection)) | ((uint8_t)(TIM5_ICFilter << 4)));
5900  0014 7b07          	ld	a,(OFST+5,sp)
5901  0016 97            	ld	xl,a
5902  0017 a610          	ld	a,#16
5903  0019 42            	mul	x,a
5904  001a 9f            	ld	a,xl
5905  001b 1a04          	or	a,(OFST+2,sp)
5906  001d 1a02          	or	a,(OFST+0,sp)
5907  001f 6b02          	ld	(OFST+0,sp),a
5909                     ; 2122   TIM5->CCMR2 = tmpccmr2;
5911  0021 7b02          	ld	a,(OFST+0,sp)
5912  0023 c7530a        	ld	21258,a
5913                     ; 2125   if (tmpicpolarity == TIM5_ICPolarity_Falling)
5915  0026 7b01          	ld	a,(OFST-1,sp)
5916  0028 a101          	cp	a,#1
5917  002a 2606          	jrne	L7303
5918                     ; 2127     TIM5->CCER1 |= TIM_CCER1_CC2P ;
5920  002c 721a530b      	bset	21259,#5
5922  0030 2004          	jra	L1403
5923  0032               L7303:
5924                     ; 2131     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5926  0032 721b530b      	bres	21259,#5
5927  0036               L1403:
5928                     ; 2135   TIM5->CCER1 |=  TIM_CCER1_CC2E;
5930  0036 7218530b      	bset	21259,#4
5931                     ; 2136 }
5934  003a 5b04          	addw	sp,#4
5935  003c 81            	ret
5948                     	xdef	_TIM5_SelectHallSensor
5949                     	xdef	_TIM5_EncoderInterfaceConfig
5950                     	xdef	_TIM5_ETRConfig
5951                     	xdef	_TIM5_SelectMasterSlaveMode
5952                     	xdef	_TIM5_SelectSlaveMode
5953                     	xdef	_TIM5_SelectOutputTrigger
5954                     	xdef	_TIM5_SelectInputTrigger
5955                     	xdef	_TIM5_ETRClockMode2Config
5956                     	xdef	_TIM5_ETRClockMode1Config
5957                     	xdef	_TIM5_TIxExternalClockConfig
5958                     	xdef	_TIM5_InternalClockConfig
5959                     	xdef	_TIM5_SelectCCDMA
5960                     	xdef	_TIM5_DMACmd
5961                     	xdef	_TIM5_ClearITPendingBit
5962                     	xdef	_TIM5_GetITStatus
5963                     	xdef	_TIM5_ClearFlag
5964                     	xdef	_TIM5_GetFlagStatus
5965                     	xdef	_TIM5_GenerateEvent
5966                     	xdef	_TIM5_ITConfig
5967                     	xdef	_TIM5_SetIC2Prescaler
5968                     	xdef	_TIM5_SetIC1Prescaler
5969                     	xdef	_TIM5_GetCapture2
5970                     	xdef	_TIM5_GetCapture1
5971                     	xdef	_TIM5_PWMIConfig
5972                     	xdef	_TIM5_ICInit
5973                     	xdef	_TIM5_CCxCmd
5974                     	xdef	_TIM5_OC2PolarityConfig
5975                     	xdef	_TIM5_OC1PolarityConfig
5976                     	xdef	_TIM5_OC2FastConfig
5977                     	xdef	_TIM5_OC1FastConfig
5978                     	xdef	_TIM5_OC2PreloadConfig
5979                     	xdef	_TIM5_OC1PreloadConfig
5980                     	xdef	_TIM5_ForcedOC2Config
5981                     	xdef	_TIM5_ForcedOC1Config
5982                     	xdef	_TIM5_SetCompare2
5983                     	xdef	_TIM5_SetCompare1
5984                     	xdef	_TIM5_SelectOCxM
5985                     	xdef	_TIM5_CtrlPWMOutputs
5986                     	xdef	_TIM5_BKRConfig
5987                     	xdef	_TIM5_OC2Init
5988                     	xdef	_TIM5_OC1Init
5989                     	xdef	_TIM5_Cmd
5990                     	xdef	_TIM5_SelectOnePulseMode
5991                     	xdef	_TIM5_ARRPreloadConfig
5992                     	xdef	_TIM5_UpdateRequestConfig
5993                     	xdef	_TIM5_UpdateDisableConfig
5994                     	xdef	_TIM5_GetPrescaler
5995                     	xdef	_TIM5_GetCounter
5996                     	xdef	_TIM5_SetAutoreload
5997                     	xdef	_TIM5_SetCounter
5998                     	xdef	_TIM5_CounterModeConfig
5999                     	xdef	_TIM5_PrescalerConfig
6000                     	xdef	_TIM5_TimeBaseInit
6001                     	xdef	_TIM5_DeInit
6020                     	end
