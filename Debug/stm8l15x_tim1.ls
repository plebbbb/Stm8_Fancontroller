   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  43                     ; 181 void TIM1_DeInit(void)
  43                     ; 182 {
  45                     .text:	section	.text,new
  46  0000               _TIM1_DeInit:
  50                     ; 183   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  52  0000 725f52b0      	clr	21168
  53                     ; 184   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  55  0004 725f52b1      	clr	21169
  56                     ; 185   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  58  0008 725f52b2      	clr	21170
  59                     ; 186   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  61  000c 725f52b3      	clr	21171
  62                     ; 187   TIM1->IER  = TIM1_IER_RESET_VALUE;
  64  0010 725f52b5      	clr	21173
  65                     ; 190   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  67  0014 725f52bd      	clr	21181
  68                     ; 191   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  70  0018 725f52be      	clr	21182
  71                     ; 193   TIM1->CCMR1 = 0x01;
  73  001c 350152b9      	mov	21177,#1
  74                     ; 194   TIM1->CCMR2 = 0x01;
  76  0020 350152ba      	mov	21178,#1
  77                     ; 195   TIM1->CCMR3 = 0x01;
  79  0024 350152bb      	mov	21179,#1
  80                     ; 196   TIM1->CCMR4 = 0x01;
  82  0028 350152bc      	mov	21180,#1
  83                     ; 198   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  85  002c 725f52bd      	clr	21181
  86                     ; 199   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  88  0030 725f52be      	clr	21182
  89                     ; 200   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  91  0034 725f52b9      	clr	21177
  92                     ; 201   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  94  0038 725f52ba      	clr	21178
  95                     ; 202   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
  97  003c 725f52bb      	clr	21179
  98                     ; 203   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 100  0040 725f52bc      	clr	21180
 101                     ; 204   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 103  0044 725f52bf      	clr	21183
 104                     ; 205   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 106  0048 725f52c0      	clr	21184
 107                     ; 206   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 109  004c 725f52c1      	clr	21185
 110                     ; 207   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 112  0050 725f52c2      	clr	21186
 113                     ; 208   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 115  0054 35ff52c3      	mov	21187,#255
 116                     ; 209   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 118  0058 35ff52c4      	mov	21188,#255
 119                     ; 210   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 121  005c 725f52c6      	clr	21190
 122                     ; 211   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 124  0060 725f52c7      	clr	21191
 125                     ; 212   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 127  0064 725f52c8      	clr	21192
 128                     ; 213   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 130  0068 725f52c9      	clr	21193
 131                     ; 214   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 133  006c 725f52ca      	clr	21194
 134                     ; 215   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 136  0070 725f52cb      	clr	21195
 137                     ; 216   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 139  0074 725f52cc      	clr	21196
 140                     ; 217   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 142  0078 725f52cd      	clr	21197
 143                     ; 218   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 145  007c 725f52d0      	clr	21200
 146                     ; 219   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 148  0080 350152b8      	mov	21176,#1
 149                     ; 220   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 151  0084 725f52cf      	clr	21199
 152                     ; 221   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 154  0088 725f52ce      	clr	21198
 155                     ; 222   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 157  008c 725f52c5      	clr	21189
 158                     ; 223   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 160  0090 725f52b6      	clr	21174
 161                     ; 224   TIM1->SR2   = TIM1_SR2_RESET_VALUE;
 163  0094 725f52b7      	clr	21175
 164                     ; 225 }
 167  0098 81            	ret
 276                     ; 241 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 276                     ; 242                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 276                     ; 243                        uint16_t TIM1_Period,
 276                     ; 244                        uint8_t TIM1_RepetitionCounter)
 276                     ; 245 {
 277                     .text:	section	.text,new
 278  0000               _TIM1_TimeBaseInit:
 280  0000 89            	pushw	x
 281       00000000      OFST:	set	0
 284                     ; 247   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 286                     ; 251   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 288  0001 7b06          	ld	a,(OFST+6,sp)
 289  0003 c752c3        	ld	21187,a
 290                     ; 252   TIM1->ARRL = (uint8_t)(TIM1_Period);
 292  0006 7b07          	ld	a,(OFST+7,sp)
 293  0008 c752c4        	ld	21188,a
 294                     ; 255   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 296  000b 9e            	ld	a,xh
 297  000c c752c1        	ld	21185,a
 298                     ; 256   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 300  000f 9f            	ld	a,xl
 301  0010 c752c2        	ld	21186,a
 302                     ; 259   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 302                     ; 260                         | (uint8_t)(TIM1_CounterMode));
 304  0013 c652b0        	ld	a,21168
 305  0016 a48f          	and	a,#143
 306  0018 1a05          	or	a,(OFST+5,sp)
 307  001a c752b0        	ld	21168,a
 308                     ; 263   TIM1->RCR = TIM1_RepetitionCounter;
 310  001d 7b08          	ld	a,(OFST+8,sp)
 311  001f c752c5        	ld	21189,a
 312                     ; 265 }
 315  0022 85            	popw	x
 316  0023 81            	ret
 383                     ; 279 void TIM1_PrescalerConfig(uint16_t Prescaler, TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
 383                     ; 280 {
 384                     .text:	section	.text,new
 385  0000               _TIM1_PrescalerConfig:
 387  0000 89            	pushw	x
 388       00000000      OFST:	set	0
 391                     ; 282   assert_param(IS_TIM1_PRESCALER_RELOAD(TIM1_PSCReloadMode));
 393                     ; 285   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
 395  0001 9e            	ld	a,xh
 396  0002 c752c1        	ld	21185,a
 397                     ; 286   TIM1->PSCRL = (uint8_t)(Prescaler);
 399  0005 9f            	ld	a,xl
 400  0006 c752c2        	ld	21186,a
 401                     ; 289   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
 403  0009 7b05          	ld	a,(OFST+5,sp)
 404  000b c752b8        	ld	21176,a
 405                     ; 290 }
 408  000e 85            	popw	x
 409  000f 81            	ret
 445                     ; 303 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
 445                     ; 304 {
 446                     .text:	section	.text,new
 447  0000               _TIM1_CounterModeConfig:
 449  0000 88            	push	a
 450       00000000      OFST:	set	0
 453                     ; 306   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 455                     ; 310   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
 455                     ; 311                         | (uint8_t)TIM1_CounterMode);
 457  0001 c652b0        	ld	a,21168
 458  0004 a48f          	and	a,#143
 459  0006 1a01          	or	a,(OFST+1,sp)
 460  0008 c752b0        	ld	21168,a
 461                     ; 312 }
 464  000b 84            	pop	a
 465  000c 81            	ret
 499                     ; 320 void TIM1_SetCounter(uint16_t Counter)
 499                     ; 321 {
 500                     .text:	section	.text,new
 501  0000               _TIM1_SetCounter:
 505                     ; 323   TIM1->CNTRH = (uint8_t)(Counter >> 8);
 507  0000 9e            	ld	a,xh
 508  0001 c752bf        	ld	21183,a
 509                     ; 324   TIM1->CNTRL = (uint8_t)(Counter);
 511  0004 9f            	ld	a,xl
 512  0005 c752c0        	ld	21184,a
 513                     ; 325 }
 516  0008 81            	ret
 550                     ; 333 void TIM1_SetAutoreload(uint16_t Autoreload)
 550                     ; 334 {
 551                     .text:	section	.text,new
 552  0000               _TIM1_SetAutoreload:
 556                     ; 336   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
 558  0000 9e            	ld	a,xh
 559  0001 c752c3        	ld	21187,a
 560                     ; 337   TIM1->ARRL = (uint8_t)(Autoreload);
 562  0004 9f            	ld	a,xl
 563  0005 c752c4        	ld	21188,a
 564                     ; 338 }
 567  0008 81            	ret
 619                     ; 345 uint16_t TIM1_GetCounter(void)
 619                     ; 346 {
 620                     .text:	section	.text,new
 621  0000               _TIM1_GetCounter:
 623  0000 5204          	subw	sp,#4
 624       00000004      OFST:	set	4
 627                     ; 348   uint16_t tmpcntr = 0;
 629                     ; 349   uint8_t tmpcntrl = 0, tmpcntrh = 0;
 633                     ; 351   tmpcntrh = TIM1->CNTRH;
 635  0002 c652bf        	ld	a,21183
 636  0005 6b02          	ld	(OFST-2,sp),a
 638                     ; 352   tmpcntrl = TIM1->CNTRL;
 640  0007 c652c0        	ld	a,21184
 641  000a 6b01          	ld	(OFST-3,sp),a
 643                     ; 354   tmpcntr  = (uint16_t)(tmpcntrl);
 645  000c 7b01          	ld	a,(OFST-3,sp)
 646  000e 5f            	clrw	x
 647  000f 97            	ld	xl,a
 648  0010 1f03          	ldw	(OFST-1,sp),x
 650                     ; 355   tmpcntr |= (uint16_t)((uint16_t)tmpcntrh << 8);
 652  0012 7b02          	ld	a,(OFST-2,sp)
 653  0014 5f            	clrw	x
 654  0015 97            	ld	xl,a
 655  0016 4f            	clr	a
 656  0017 02            	rlwa	x,a
 657  0018 01            	rrwa	x,a
 658  0019 1a04          	or	a,(OFST+0,sp)
 659  001b 01            	rrwa	x,a
 660  001c 1a03          	or	a,(OFST-1,sp)
 661  001e 01            	rrwa	x,a
 662  001f 1f03          	ldw	(OFST-1,sp),x
 664                     ; 358   return (uint16_t)tmpcntr;
 666  0021 1e03          	ldw	x,(OFST-1,sp)
 669  0023 5b04          	addw	sp,#4
 670  0025 81            	ret
 704                     ; 366 uint16_t TIM1_GetPrescaler(void)
 704                     ; 367 {
 705                     .text:	section	.text,new
 706  0000               _TIM1_GetPrescaler:
 708  0000 89            	pushw	x
 709       00000002      OFST:	set	2
 712                     ; 368   uint16_t tmpreg = 0;
 714                     ; 369   tmpreg = (uint16_t)((uint16_t)TIM1->PSCRH << 8);
 716  0001 c652c1        	ld	a,21185
 717  0004 5f            	clrw	x
 718  0005 97            	ld	xl,a
 719  0006 4f            	clr	a
 720  0007 02            	rlwa	x,a
 721  0008 1f01          	ldw	(OFST-1,sp),x
 723                     ; 371   return (uint16_t)(tmpreg | TIM1->PSCRL);
 725  000a c652c2        	ld	a,21186
 726  000d 5f            	clrw	x
 727  000e 97            	ld	xl,a
 728  000f 01            	rrwa	x,a
 729  0010 1a02          	or	a,(OFST+0,sp)
 730  0012 01            	rrwa	x,a
 731  0013 1a01          	or	a,(OFST-1,sp)
 732  0015 01            	rrwa	x,a
 735  0016 5b02          	addw	sp,#2
 736  0018 81            	ret
 792                     ; 380 void TIM1_UpdateDisableConfig(FunctionalState NewState)
 792                     ; 381 {
 793                     .text:	section	.text,new
 794  0000               _TIM1_UpdateDisableConfig:
 798                     ; 383   assert_param(IS_FUNCTIONAL_STATE(NewState));
 800                     ; 386   if (NewState != DISABLE)
 802  0000 4d            	tnz	a
 803  0001 2706          	jreq	L772
 804                     ; 388     TIM1->CR1 |= TIM1_CR1_UDIS;
 806  0003 721252b0      	bset	21168,#1
 808  0007 2004          	jra	L103
 809  0009               L772:
 810                     ; 392     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
 812  0009 721352b0      	bres	21168,#1
 813  000d               L103:
 814                     ; 394 }
 817  000d 81            	ret
 875                     ; 404 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
 875                     ; 405 {
 876                     .text:	section	.text,new
 877  0000               _TIM1_UpdateRequestConfig:
 881                     ; 407   assert_param(IS_TIM1_UPDATE_SOURCE(TIM1_UpdateSource));
 883                     ; 410   if (TIM1_UpdateSource != TIM1_UpdateSource_Global)
 885  0000 4d            	tnz	a
 886  0001 2706          	jreq	L133
 887                     ; 412     TIM1->CR1 |= TIM1_CR1_URS;
 889  0003 721452b0      	bset	21168,#2
 891  0007 2004          	jra	L333
 892  0009               L133:
 893                     ; 416     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
 895  0009 721552b0      	bres	21168,#2
 896  000d               L333:
 897                     ; 418 }
 900  000d 81            	ret
 936                     ; 426 void TIM1_ARRPreloadConfig(FunctionalState NewState)
 936                     ; 427 {
 937                     .text:	section	.text,new
 938  0000               _TIM1_ARRPreloadConfig:
 942                     ; 429   assert_param(IS_FUNCTIONAL_STATE(NewState));
 944                     ; 432   if (NewState != DISABLE)
 946  0000 4d            	tnz	a
 947  0001 2706          	jreq	L353
 948                     ; 434     TIM1->CR1 |= TIM1_CR1_ARPE;
 950  0003 721e52b0      	bset	21168,#7
 952  0007 2004          	jra	L553
 953  0009               L353:
 954                     ; 438     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
 956  0009 721f52b0      	bres	21168,#7
 957  000d               L553:
 958                     ; 440 }
 961  000d 81            	ret
1018                     ; 450 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
1018                     ; 451 {
1019                     .text:	section	.text,new
1020  0000               _TIM1_SelectOnePulseMode:
1024                     ; 453   assert_param(IS_TIM1_OPM_MODE(TIM1_OPMode));
1026                     ; 456   if (TIM1_OPMode != TIM1_OPMode_Repetitive)
1028  0000 4d            	tnz	a
1029  0001 2706          	jreq	L504
1030                     ; 458     TIM1->CR1 |= TIM1_CR1_OPM;
1032  0003 721652b0      	bset	21168,#3
1034  0007 2004          	jra	L704
1035  0009               L504:
1036                     ; 462     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
1038  0009 721752b0      	bres	21168,#3
1039  000d               L704:
1040                     ; 464 }
1043  000d 81            	ret
1078                     ; 472 void TIM1_Cmd(FunctionalState NewState)
1078                     ; 473 {
1079                     .text:	section	.text,new
1080  0000               _TIM1_Cmd:
1084                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
1086                     ; 478   if (NewState != DISABLE)
1088  0000 4d            	tnz	a
1089  0001 2706          	jreq	L724
1090                     ; 480     TIM1->CR1 |= TIM1_CR1_CEN;
1092  0003 721052b0      	bset	21168,#0
1094  0007 2004          	jra	L134
1095  0009               L724:
1096                     ; 484     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
1098  0009 721152b0      	bres	21168,#0
1099  000d               L134:
1100                     ; 486 }
1103  000d 81            	ret
1388                     ; 577 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1388                     ; 578                   TIM1_OutputState_TypeDef TIM1_OutputState,
1388                     ; 579                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1388                     ; 580                   uint16_t TIM1_Pulse,
1388                     ; 581                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1388                     ; 582                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1388                     ; 583                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1388                     ; 584                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1388                     ; 585 {
1389                     .text:	section	.text,new
1390  0000               _TIM1_OC1Init:
1392  0000 89            	pushw	x
1393  0001 5203          	subw	sp,#3
1394       00000003      OFST:	set	3
1397                     ; 587   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1399                     ; 588   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1401                     ; 589   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1403                     ; 590   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1405                     ; 591   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1407                     ; 592   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1409                     ; 593   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1411                     ; 597   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE
1411                     ; 598                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
1413  0003 c652bd        	ld	a,21181
1414  0006 a4f0          	and	a,#240
1415  0008 c752bd        	ld	21181,a
1416                     ; 601   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
1416                     ; 602                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
1416                     ; 603                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
1416                     ; 604                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
1418  000b 7b0c          	ld	a,(OFST+9,sp)
1419  000d a408          	and	a,#8
1420  000f 6b03          	ld	(OFST+0,sp),a
1422  0011 7b0b          	ld	a,(OFST+8,sp)
1423  0013 a402          	and	a,#2
1424  0015 1a03          	or	a,(OFST+0,sp)
1425  0017 6b02          	ld	(OFST-1,sp),a
1427  0019 7b08          	ld	a,(OFST+5,sp)
1428  001b a404          	and	a,#4
1429  001d 6b01          	ld	(OFST-2,sp),a
1431  001f 9f            	ld	a,xl
1432  0020 a401          	and	a,#1
1433  0022 1a01          	or	a,(OFST-2,sp)
1434  0024 1a02          	or	a,(OFST-1,sp)
1435  0026 ca52bd        	or	a,21181
1436  0029 c752bd        	ld	21181,a
1437                     ; 607   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))
1437                     ; 608                           | (uint8_t)TIM1_OCMode);
1439  002c c652b9        	ld	a,21177
1440  002f a48f          	and	a,#143
1441  0031 1a04          	or	a,(OFST+1,sp)
1442  0033 c752b9        	ld	21177,a
1443                     ; 611   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
1445  0036 c652d0        	ld	a,21200
1446  0039 a4fc          	and	a,#252
1447  003b c752d0        	ld	21200,a
1448                     ; 613   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OCIdleState & TIM1_OISR_OIS1)
1448                     ; 614                           | (uint8_t)(TIM1_OCNIdleState & TIM1_OISR_OIS1N));
1450  003e 7b0e          	ld	a,(OFST+11,sp)
1451  0040 a402          	and	a,#2
1452  0042 6b03          	ld	(OFST+0,sp),a
1454  0044 7b0d          	ld	a,(OFST+10,sp)
1455  0046 a401          	and	a,#1
1456  0048 1a03          	or	a,(OFST+0,sp)
1457  004a ca52d0        	or	a,21200
1458  004d c752d0        	ld	21200,a
1459                     ; 617   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
1461  0050 7b09          	ld	a,(OFST+6,sp)
1462  0052 c752c6        	ld	21190,a
1463                     ; 618   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
1465  0055 7b0a          	ld	a,(OFST+7,sp)
1466  0057 c752c7        	ld	21191,a
1467                     ; 619 }
1470  005a 5b05          	addw	sp,#5
1471  005c 81            	ret
1575                     ; 658 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1575                     ; 659                   TIM1_OutputState_TypeDef TIM1_OutputState,
1575                     ; 660                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1575                     ; 661                   uint16_t TIM1_Pulse,
1575                     ; 662                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1575                     ; 663                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1575                     ; 664                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1575                     ; 665                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1575                     ; 666 {
1576                     .text:	section	.text,new
1577  0000               _TIM1_OC2Init:
1579  0000 89            	pushw	x
1580  0001 5203          	subw	sp,#3
1581       00000003      OFST:	set	3
1584                     ; 669   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1586                     ; 670   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1588                     ; 671   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1590                     ; 672   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1592                     ; 673   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1594                     ; 674   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1596                     ; 675   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1598                     ; 679   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1600  0003 c652bd        	ld	a,21181
1601  0006 a40f          	and	a,#15
1602  0008 c752bd        	ld	21181,a
1603                     ; 682   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE))
1603                     ; 683                            | (uint8_t) ((uint8_t)(TIM1_OCPolarity & TIM1_CCER1_CC2P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP)));
1605  000b 7b0c          	ld	a,(OFST+9,sp)
1606  000d a480          	and	a,#128
1607  000f 6b03          	ld	(OFST+0,sp),a
1609  0011 7b0b          	ld	a,(OFST+8,sp)
1610  0013 a420          	and	a,#32
1611  0015 1a03          	or	a,(OFST+0,sp)
1612  0017 6b02          	ld	(OFST-1,sp),a
1614  0019 7b08          	ld	a,(OFST+5,sp)
1615  001b a440          	and	a,#64
1616  001d 6b01          	ld	(OFST-2,sp),a
1618  001f 9f            	ld	a,xl
1619  0020 a410          	and	a,#16
1620  0022 1a01          	or	a,(OFST-2,sp)
1621  0024 1a02          	or	a,(OFST-1,sp)
1622  0026 ca52bd        	or	a,21181
1623  0029 c752bd        	ld	21181,a
1624                     ; 686   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1626  002c c652ba        	ld	a,21178
1627  002f a48f          	and	a,#143
1628  0031 1a04          	or	a,(OFST+1,sp)
1629  0033 c752ba        	ld	21178,a
1630                     ; 689   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1632  0036 c652d0        	ld	a,21200
1633  0039 a4f3          	and	a,#243
1634  003b c752d0        	ld	21200,a
1635                     ; 691   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1637  003e 7b0e          	ld	a,(OFST+11,sp)
1638  0040 a408          	and	a,#8
1639  0042 6b03          	ld	(OFST+0,sp),a
1641  0044 7b0d          	ld	a,(OFST+10,sp)
1642  0046 a404          	and	a,#4
1643  0048 1a03          	or	a,(OFST+0,sp)
1644  004a ca52d0        	or	a,21200
1645  004d c752d0        	ld	21200,a
1646                     ; 694   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1648  0050 7b09          	ld	a,(OFST+6,sp)
1649  0052 c752c8        	ld	21192,a
1650                     ; 695   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1652  0055 7b0a          	ld	a,(OFST+7,sp)
1653  0057 c752c9        	ld	21193,a
1654                     ; 696 }
1657  005a 5b05          	addw	sp,#5
1658  005c 81            	ret
1762                     ; 735 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1762                     ; 736                   TIM1_OutputState_TypeDef TIM1_OutputState,
1762                     ; 737                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1762                     ; 738                   uint16_t TIM1_Pulse,
1762                     ; 739                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1762                     ; 740                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1762                     ; 741                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1762                     ; 742                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1762                     ; 743 {
1763                     .text:	section	.text,new
1764  0000               _TIM1_OC3Init:
1766  0000 89            	pushw	x
1767  0001 5203          	subw	sp,#3
1768       00000003      OFST:	set	3
1771                     ; 746   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1773                     ; 747   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1775                     ; 748   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1777                     ; 749   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1779                     ; 750   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1781                     ; 751   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1783                     ; 752   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1785                     ; 756   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1787  0003 c652be        	ld	a,21182
1788  0006 a4f0          	and	a,#240
1789  0008 c752be        	ld	21182,a
1790                     ; 759   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC3E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE))
1790                     ; 760                            | (uint8_t)((uint8_t)(TIM1_OCPolarity & TIM1_CCER2_CC3P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER2_CC3NP)));
1792  000b 7b0c          	ld	a,(OFST+9,sp)
1793  000d a408          	and	a,#8
1794  000f 6b03          	ld	(OFST+0,sp),a
1796  0011 7b0b          	ld	a,(OFST+8,sp)
1797  0013 a402          	and	a,#2
1798  0015 1a03          	or	a,(OFST+0,sp)
1799  0017 6b02          	ld	(OFST-1,sp),a
1801  0019 7b08          	ld	a,(OFST+5,sp)
1802  001b a404          	and	a,#4
1803  001d 6b01          	ld	(OFST-2,sp),a
1805  001f 9f            	ld	a,xl
1806  0020 a401          	and	a,#1
1807  0022 1a01          	or	a,(OFST-2,sp)
1808  0024 1a02          	or	a,(OFST-1,sp)
1809  0026 ca52be        	or	a,21182
1810  0029 c752be        	ld	21182,a
1811                     ; 763   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1813  002c c652bb        	ld	a,21179
1814  002f a48f          	and	a,#143
1815  0031 1a04          	or	a,(OFST+1,sp)
1816  0033 c752bb        	ld	21179,a
1817                     ; 766   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1819  0036 c652d0        	ld	a,21200
1820  0039 a4cf          	and	a,#207
1821  003b c752d0        	ld	21200,a
1822                     ; 768   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | (uint8_t) (TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1824  003e 7b0e          	ld	a,(OFST+11,sp)
1825  0040 a420          	and	a,#32
1826  0042 6b03          	ld	(OFST+0,sp),a
1828  0044 7b0d          	ld	a,(OFST+10,sp)
1829  0046 a410          	and	a,#16
1830  0048 1a03          	or	a,(OFST+0,sp)
1831  004a ca52d0        	or	a,21200
1832  004d c752d0        	ld	21200,a
1833                     ; 771   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1835  0050 7b09          	ld	a,(OFST+6,sp)
1836  0052 c752ca        	ld	21194,a
1837                     ; 772   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1839  0055 7b0a          	ld	a,(OFST+7,sp)
1840  0057 c752cb        	ld	21195,a
1841                     ; 773 }
1844  005a 5b05          	addw	sp,#5
1845  005c 81            	ret
2052                     ; 803 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
2052                     ; 804                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
2052                     ; 805                      uint8_t TIM1_DeadTime,
2052                     ; 806                      TIM1_BreakState_TypeDef TIM1_Break,
2052                     ; 807                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
2052                     ; 808                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
2052                     ; 809 {
2053                     .text:	section	.text,new
2054  0000               _TIM1_BDTRConfig:
2056  0000 89            	pushw	x
2057  0001 88            	push	a
2058       00000001      OFST:	set	1
2061                     ; 812   assert_param(IS_TIM1_OSSI_STATE(TIM1_OSSIState));
2063                     ; 813   assert_param(IS_TIM1_LOCK_LEVEL(TIM1_LockLevel));
2065                     ; 814   assert_param(IS_TIM1_BREAK_STATE(TIM1_Break));
2067                     ; 815   assert_param(IS_TIM1_BREAK_POLARITY(TIM1_BreakPolarity));
2069                     ; 816   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE(TIM1_AutomaticOutput));
2071                     ; 818   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
2073  0002 7b06          	ld	a,(OFST+5,sp)
2074  0004 c752cf        	ld	21199,a
2075                     ; 822   TIM1->BKR  =  (uint8_t)((uint8_t)((uint8_t)TIM1_OSSIState | (uint8_t)TIM1_LockLevel)
2075                     ; 823                           | (uint8_t)((uint8_t)((uint8_t)TIM1_Break | (uint8_t)TIM1_BreakPolarity)
2075                     ; 824                                       | (uint8_t)TIM1_AutomaticOutput));
2077  0007 7b07          	ld	a,(OFST+6,sp)
2078  0009 1a08          	or	a,(OFST+7,sp)
2079  000b 1a09          	or	a,(OFST+8,sp)
2080  000d 6b01          	ld	(OFST+0,sp),a
2082  000f 9f            	ld	a,xl
2083  0010 1a02          	or	a,(OFST+1,sp)
2084  0012 1a01          	or	a,(OFST+0,sp)
2085  0014 c752ce        	ld	21198,a
2086                     ; 826 }
2089  0017 5b03          	addw	sp,#3
2090  0019 81            	ret
2126                     ; 834 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2126                     ; 835 {
2127                     .text:	section	.text,new
2128  0000               _TIM1_CtrlPWMOutputs:
2132                     ; 837   assert_param(IS_FUNCTIONAL_STATE(NewState));
2134                     ; 841   if (NewState != DISABLE)
2136  0000 4d            	tnz	a
2137  0001 2706          	jreq	L5601
2138                     ; 843     TIM1->BKR |= TIM1_BKR_MOE;
2140  0003 721e52ce      	bset	21198,#7
2142  0007 2004          	jra	L7601
2143  0009               L5601:
2144                     ; 847     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2146  0009 721f52ce      	bres	21198,#7
2147  000d               L7601:
2148                     ; 849 }
2151  000d 81            	ret
2230                     ; 871 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
2230                     ; 872 {
2231                     .text:	section	.text,new
2232  0000               _TIM1_SelectOCxM:
2234  0000 89            	pushw	x
2235       00000000      OFST:	set	0
2238                     ; 874   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
2240                     ; 875   assert_param(IS_TIM1_OCM(TIM1_OCMode));
2242                     ; 877   if (TIM1_Channel == TIM1_Channel_1)
2244  0001 9e            	ld	a,xh
2245  0002 4d            	tnz	a
2246  0003 2610          	jrne	L7211
2247                     ; 880     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
2249  0005 721152bd      	bres	21181,#0
2250                     ; 883     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2252  0009 c652b9        	ld	a,21177
2253  000c a48f          	and	a,#143
2254  000e 1a02          	or	a,(OFST+2,sp)
2255  0010 c752b9        	ld	21177,a
2257  0013 2024          	jra	L1311
2258  0015               L7211:
2259                     ; 885   else if (TIM1_Channel == TIM1_Channel_2)
2261  0015 7b01          	ld	a,(OFST+1,sp)
2262  0017 a101          	cp	a,#1
2263  0019 2610          	jrne	L3311
2264                     ; 888     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
2266  001b 721952bd      	bres	21181,#4
2267                     ; 891     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2269  001f c652ba        	ld	a,21178
2270  0022 a48f          	and	a,#143
2271  0024 1a02          	or	a,(OFST+2,sp)
2272  0026 c752ba        	ld	21178,a
2274  0029 200e          	jra	L1311
2275  002b               L3311:
2276                     ; 896     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
2278  002b 721152be      	bres	21182,#0
2279                     ; 899     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2281  002f c652bb        	ld	a,21179
2282  0032 a48f          	and	a,#143
2283  0034 1a02          	or	a,(OFST+2,sp)
2284  0036 c752bb        	ld	21179,a
2285  0039               L1311:
2286                     ; 902 }
2289  0039 85            	popw	x
2290  003a 81            	ret
2324                     ; 910 void TIM1_SetCompare1(uint16_t Compare1)
2324                     ; 911 {
2325                     .text:	section	.text,new
2326  0000               _TIM1_SetCompare1:
2330                     ; 913   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
2332  0000 9e            	ld	a,xh
2333  0001 c752c6        	ld	21190,a
2334                     ; 914   TIM1->CCR1L = (uint8_t)(Compare1);
2336  0004 9f            	ld	a,xl
2337  0005 c752c7        	ld	21191,a
2338                     ; 916 }
2341  0008 81            	ret
2375                     ; 924 void TIM1_SetCompare2(uint16_t Compare2)
2375                     ; 925 {
2376                     .text:	section	.text,new
2377  0000               _TIM1_SetCompare2:
2381                     ; 927   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
2383  0000 9e            	ld	a,xh
2384  0001 c752c8        	ld	21192,a
2385                     ; 928   TIM1->CCR2L = (uint8_t)(Compare2);
2387  0004 9f            	ld	a,xl
2388  0005 c752c9        	ld	21193,a
2389                     ; 929 }
2392  0008 81            	ret
2426                     ; 937 void TIM1_SetCompare3(uint16_t Compare3)
2426                     ; 938 {
2427                     .text:	section	.text,new
2428  0000               _TIM1_SetCompare3:
2432                     ; 940   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
2434  0000 9e            	ld	a,xh
2435  0001 c752ca        	ld	21194,a
2436                     ; 941   TIM1->CCR3L = (uint8_t)(Compare3);
2438  0004 9f            	ld	a,xl
2439  0005 c752cb        	ld	21195,a
2440                     ; 942 }
2443  0008 81            	ret
2477                     ; 950 void TIM1_SetCompare4(uint16_t Compare4)
2477                     ; 951 {
2478                     .text:	section	.text,new
2479  0000               _TIM1_SetCompare4:
2483                     ; 953   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
2485  0000 9e            	ld	a,xh
2486  0001 c752cc        	ld	21196,a
2487                     ; 954   TIM1->CCR4L = (uint8_t)(Compare4);
2489  0004 9f            	ld	a,xl
2490  0005 c752cd        	ld	21197,a
2491                     ; 955 }
2494  0008 81            	ret
2530                     ; 963 void TIM1_CCPreloadControl(FunctionalState NewState)
2530                     ; 964 {
2531                     .text:	section	.text,new
2532  0000               _TIM1_CCPreloadControl:
2536                     ; 966   assert_param(IS_FUNCTIONAL_STATE(NewState));
2538                     ; 969   if (NewState != DISABLE)
2540  0000 4d            	tnz	a
2541  0001 2706          	jreq	L5421
2542                     ; 971     TIM1->CR2 |= TIM1_CR2_CCPC;
2544  0003 721052b1      	bset	21169,#0
2546  0007 2004          	jra	L7421
2547  0009               L5421:
2548                     ; 975     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
2550  0009 721152b1      	bres	21169,#0
2551  000d               L7421:
2552                     ; 977 }
2555  000d 81            	ret
2613                     ; 987 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2613                     ; 988 {
2614                     .text:	section	.text,new
2615  0000               _TIM1_ForcedOC1Config:
2617  0000 88            	push	a
2618       00000000      OFST:	set	0
2621                     ; 990   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2623                     ; 993   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2625  0001 c652b9        	ld	a,21177
2626  0004 a48f          	and	a,#143
2627  0006 1a01          	or	a,(OFST+1,sp)
2628  0008 c752b9        	ld	21177,a
2629                     ; 994 }
2632  000b 84            	pop	a
2633  000c 81            	ret
2669                     ; 1004 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2669                     ; 1005 {
2670                     .text:	section	.text,new
2671  0000               _TIM1_ForcedOC2Config:
2673  0000 88            	push	a
2674       00000000      OFST:	set	0
2677                     ; 1007   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2679                     ; 1010   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2681  0001 c652ba        	ld	a,21178
2682  0004 a48f          	and	a,#143
2683  0006 1a01          	or	a,(OFST+1,sp)
2684  0008 c752ba        	ld	21178,a
2685                     ; 1011 }
2688  000b 84            	pop	a
2689  000c 81            	ret
2725                     ; 1021 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2725                     ; 1022 {
2726                     .text:	section	.text,new
2727  0000               _TIM1_ForcedOC3Config:
2729  0000 88            	push	a
2730       00000000      OFST:	set	0
2733                     ; 1024   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2735                     ; 1027   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2737  0001 c652bb        	ld	a,21179
2738  0004 a48f          	and	a,#143
2739  0006 1a01          	or	a,(OFST+1,sp)
2740  0008 c752bb        	ld	21179,a
2741                     ; 1028 }
2744  000b 84            	pop	a
2745  000c 81            	ret
2781                     ; 1036 void TIM1_OC1PreloadConfig(FunctionalState NewState)
2781                     ; 1037 {
2782                     .text:	section	.text,new
2783  0000               _TIM1_OC1PreloadConfig:
2787                     ; 1039   assert_param(IS_FUNCTIONAL_STATE(NewState));
2789                     ; 1042   if (NewState != DISABLE)
2791  0000 4d            	tnz	a
2792  0001 2706          	jreq	L1531
2793                     ; 1044     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
2795  0003 721652b9      	bset	21177,#3
2797  0007 2004          	jra	L3531
2798  0009               L1531:
2799                     ; 1048     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2801  0009 721752b9      	bres	21177,#3
2802  000d               L3531:
2803                     ; 1050 }
2806  000d 81            	ret
2842                     ; 1058 void TIM1_OC2PreloadConfig(FunctionalState NewState)
2842                     ; 1059 {
2843                     .text:	section	.text,new
2844  0000               _TIM1_OC2PreloadConfig:
2848                     ; 1061   assert_param(IS_FUNCTIONAL_STATE(NewState));
2850                     ; 1064   if (NewState != DISABLE)
2852  0000 4d            	tnz	a
2853  0001 2706          	jreq	L3731
2854                     ; 1066     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
2856  0003 721652ba      	bset	21178,#3
2858  0007 2004          	jra	L5731
2859  0009               L3731:
2860                     ; 1070     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2862  0009 721752ba      	bres	21178,#3
2863  000d               L5731:
2864                     ; 1072 }
2867  000d 81            	ret
2903                     ; 1080 void TIM1_OC3PreloadConfig(FunctionalState NewState)
2903                     ; 1081 {
2904                     .text:	section	.text,new
2905  0000               _TIM1_OC3PreloadConfig:
2909                     ; 1083   assert_param(IS_FUNCTIONAL_STATE(NewState));
2911                     ; 1086   if (NewState != DISABLE)
2913  0000 4d            	tnz	a
2914  0001 2706          	jreq	L5141
2915                     ; 1088     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
2917  0003 721652bb      	bset	21179,#3
2919  0007 2004          	jra	L7141
2920  0009               L5141:
2921                     ; 1092     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2923  0009 721752bb      	bres	21179,#3
2924  000d               L7141:
2925                     ; 1094 }
2928  000d 81            	ret
2964                     ; 1102 void TIM1_OC4PreloadConfig(FunctionalState NewState)
2964                     ; 1103 {
2965                     .text:	section	.text,new
2966  0000               _TIM1_OC4PreloadConfig:
2970                     ; 1105   assert_param(IS_FUNCTIONAL_STATE(NewState));
2972                     ; 1108   if (NewState != DISABLE)
2974  0000 4d            	tnz	a
2975  0001 2706          	jreq	L7341
2976                     ; 1110     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
2978  0003 721652bc      	bset	21180,#3
2980  0007 2004          	jra	L1441
2981  0009               L7341:
2982                     ; 1114     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2984  0009 721752bc      	bres	21180,#3
2985  000d               L1441:
2986                     ; 1116 }
2989  000d 81            	ret
3024                     ; 1124 void TIM1_OC1FastConfig(FunctionalState NewState)
3024                     ; 1125 {
3025                     .text:	section	.text,new
3026  0000               _TIM1_OC1FastConfig:
3030                     ; 1127   assert_param(IS_FUNCTIONAL_STATE(NewState));
3032                     ; 1130   if (NewState != DISABLE)
3034  0000 4d            	tnz	a
3035  0001 2706          	jreq	L1641
3036                     ; 1132     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
3038  0003 721452b9      	bset	21177,#2
3040  0007 2004          	jra	L3641
3041  0009               L1641:
3042                     ; 1136     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3044  0009 721552b9      	bres	21177,#2
3045  000d               L3641:
3046                     ; 1138 }
3049  000d 81            	ret
3084                     ; 1146 void TIM1_OC2FastConfig(FunctionalState NewState)
3084                     ; 1147 {
3085                     .text:	section	.text,new
3086  0000               _TIM1_OC2FastConfig:
3090                     ; 1149   assert_param(IS_FUNCTIONAL_STATE(NewState));
3092                     ; 1152   if (NewState != DISABLE)
3094  0000 4d            	tnz	a
3095  0001 2706          	jreq	L3051
3096                     ; 1154     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
3098  0003 721452ba      	bset	21178,#2
3100  0007 2004          	jra	L5051
3101  0009               L3051:
3102                     ; 1158     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3104  0009 721552ba      	bres	21178,#2
3105  000d               L5051:
3106                     ; 1160 }
3109  000d 81            	ret
3144                     ; 1168 void TIM1_OC3FastConfig(FunctionalState NewState)
3144                     ; 1169 {
3145                     .text:	section	.text,new
3146  0000               _TIM1_OC3FastConfig:
3150                     ; 1171   assert_param(IS_FUNCTIONAL_STATE(NewState));
3152                     ; 1174   if (NewState != DISABLE)
3154  0000 4d            	tnz	a
3155  0001 2706          	jreq	L5251
3156                     ; 1176     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
3158  0003 721452bb      	bset	21179,#2
3160  0007 2004          	jra	L7251
3161  0009               L5251:
3162                     ; 1180     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3164  0009 721552bb      	bres	21179,#2
3165  000d               L7251:
3166                     ; 1182 }
3169  000d 81            	ret
3204                     ; 1190 void TIM1_ClearOC1Ref(FunctionalState NewState)
3204                     ; 1191 {
3205                     .text:	section	.text,new
3206  0000               _TIM1_ClearOC1Ref:
3210                     ; 1193   assert_param(IS_FUNCTIONAL_STATE(NewState));
3212                     ; 1196   if (NewState != DISABLE)
3214  0000 4d            	tnz	a
3215  0001 2706          	jreq	L7451
3216                     ; 1198     TIM1->CCMR1 |= TIM1_CCMR_OCxCE;
3218  0003 721e52b9      	bset	21177,#7
3220  0007 2004          	jra	L1551
3221  0009               L7451:
3222                     ; 1202     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3224  0009 721f52b9      	bres	21177,#7
3225  000d               L1551:
3226                     ; 1204 }
3229  000d 81            	ret
3264                     ; 1212 void TIM1_ClearOC2Ref(FunctionalState NewState)
3264                     ; 1213 {
3265                     .text:	section	.text,new
3266  0000               _TIM1_ClearOC2Ref:
3270                     ; 1215   assert_param(IS_FUNCTIONAL_STATE(NewState));
3272                     ; 1218   if (NewState != DISABLE)
3274  0000 4d            	tnz	a
3275  0001 2706          	jreq	L1751
3276                     ; 1220     TIM1->CCMR2 |= TIM1_CCMR_OCxCE;
3278  0003 721e52ba      	bset	21178,#7
3280  0007 2004          	jra	L3751
3281  0009               L1751:
3282                     ; 1224     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3284  0009 721f52ba      	bres	21178,#7
3285  000d               L3751:
3286                     ; 1226 }
3289  000d 81            	ret
3324                     ; 1234 void TIM1_ClearOC3Ref(FunctionalState NewState)
3324                     ; 1235 {
3325                     .text:	section	.text,new
3326  0000               _TIM1_ClearOC3Ref:
3330                     ; 1237   assert_param(IS_FUNCTIONAL_STATE(NewState));
3332                     ; 1240   if (NewState != DISABLE)
3334  0000 4d            	tnz	a
3335  0001 2706          	jreq	L3161
3336                     ; 1242     TIM1->CCMR3 |= TIM1_CCMR_OCxCE;
3338  0003 721e52bb      	bset	21179,#7
3340  0007 2004          	jra	L5161
3341  0009               L3161:
3342                     ; 1246     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3344  0009 721f52bb      	bres	21179,#7
3345  000d               L5161:
3346                     ; 1248 }
3349  000d 81            	ret
3384                     ; 1256 void TIM1_ClearOC4Ref(FunctionalState NewState)
3384                     ; 1257 {
3385                     .text:	section	.text,new
3386  0000               _TIM1_ClearOC4Ref:
3390                     ; 1259   assert_param(IS_FUNCTIONAL_STATE(NewState));
3392                     ; 1262   if (NewState != DISABLE)
3394  0000 4d            	tnz	a
3395  0001 2706          	jreq	L5361
3396                     ; 1264     TIM1->CCMR4 |= TIM1_CCMR_OCxCE;
3398  0003 721e52bc      	bset	21180,#7
3400  0007 2004          	jra	L7361
3401  0009               L5361:
3402                     ; 1268     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3404  0009 721f52bc      	bres	21180,#7
3405  000d               L7361:
3406                     ; 1270 }
3409  000d 81            	ret
3445                     ; 1280 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3445                     ; 1281 {
3446                     .text:	section	.text,new
3447  0000               _TIM1_OC1PolarityConfig:
3451                     ; 1283   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3453                     ; 1286   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3455  0000 4d            	tnz	a
3456  0001 2706          	jreq	L7561
3457                     ; 1288     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3459  0003 721252bd      	bset	21181,#1
3461  0007 2004          	jra	L1661
3462  0009               L7561:
3463                     ; 1292     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3465  0009 721352bd      	bres	21181,#1
3466  000d               L1661:
3467                     ; 1294 }
3470  000d 81            	ret
3506                     ; 1304 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3506                     ; 1305 {
3507                     .text:	section	.text,new
3508  0000               _TIM1_OC1NPolarityConfig:
3512                     ; 1307   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3514                     ; 1310   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3516  0000 4d            	tnz	a
3517  0001 2706          	jreq	L1071
3518                     ; 1312     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
3520  0003 721652bd      	bset	21181,#3
3522  0007 2004          	jra	L3071
3523  0009               L1071:
3524                     ; 1316     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
3526  0009 721752bd      	bres	21181,#3
3527  000d               L3071:
3528                     ; 1318 }
3531  000d 81            	ret
3567                     ; 1328 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3567                     ; 1329 {
3568                     .text:	section	.text,new
3569  0000               _TIM1_OC2PolarityConfig:
3573                     ; 1331   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3575                     ; 1334   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3577  0000 4d            	tnz	a
3578  0001 2706          	jreq	L3271
3579                     ; 1336     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3581  0003 721a52bd      	bset	21181,#5
3583  0007 2004          	jra	L5271
3584  0009               L3271:
3585                     ; 1340     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3587  0009 721b52bd      	bres	21181,#5
3588  000d               L5271:
3589                     ; 1342 }
3592  000d 81            	ret
3628                     ; 1352 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3628                     ; 1353 {
3629                     .text:	section	.text,new
3630  0000               _TIM1_OC2NPolarityConfig:
3634                     ; 1355   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3636                     ; 1358   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3638  0000 4d            	tnz	a
3639  0001 2706          	jreq	L5471
3640                     ; 1360     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
3642  0003 721e52bd      	bset	21181,#7
3644  0007 2004          	jra	L7471
3645  0009               L5471:
3646                     ; 1364     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
3648  0009 721f52bd      	bres	21181,#7
3649  000d               L7471:
3650                     ; 1366 }
3653  000d 81            	ret
3689                     ; 1376 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3689                     ; 1377 {
3690                     .text:	section	.text,new
3691  0000               _TIM1_OC3PolarityConfig:
3695                     ; 1379   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3697                     ; 1382   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3699  0000 4d            	tnz	a
3700  0001 2706          	jreq	L7671
3701                     ; 1384     TIM1->CCER2 |= TIM1_CCER2_CC3P;
3703  0003 721252be      	bset	21182,#1
3705  0007 2004          	jra	L1771
3706  0009               L7671:
3707                     ; 1388     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
3709  0009 721352be      	bres	21182,#1
3710  000d               L1771:
3711                     ; 1390 }
3714  000d 81            	ret
3750                     ; 1400 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3750                     ; 1401 {
3751                     .text:	section	.text,new
3752  0000               _TIM1_OC3NPolarityConfig:
3756                     ; 1403   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3758                     ; 1406   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3760  0000 4d            	tnz	a
3761  0001 2706          	jreq	L1102
3762                     ; 1408     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
3764  0003 721652be      	bset	21182,#3
3766  0007 2004          	jra	L3102
3767  0009               L1102:
3768                     ; 1412     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
3770  0009 721752be      	bres	21182,#3
3771  000d               L3102:
3772                     ; 1414 }
3775  000d 81            	ret
3834                     ; 1424 void TIM1_SelectOCREFClear(TIM1_OCReferenceClear_TypeDef TIM1_OCReferenceClear)
3834                     ; 1425 {
3835                     .text:	section	.text,new
3836  0000               _TIM1_SelectOCREFClear:
3840                     ; 1427   assert_param(IS_TIM1_OCREFERENCECECLEAR_SOURCE(TIM1_OCReferenceClear));
3842                     ; 1430   TIM1->SMCR &=  (uint8_t) (~TIM1_SMCR_OCCS);
3844  0000 721752b2      	bres	21170,#3
3845                     ; 1431   TIM1->SMCR |=  (uint8_t) TIM1_OCReferenceClear;
3847  0004 ca52b2        	or	a,21170
3848  0007 c752b2        	ld	21170,a
3849                     ; 1432 }
3852  000a 81            	ret
3887                     ; 1440 void TIM1_SelectCOM(FunctionalState NewState)
3887                     ; 1441 {
3888                     .text:	section	.text,new
3889  0000               _TIM1_SelectCOM:
3893                     ; 1443   assert_param(IS_FUNCTIONAL_STATE(NewState));
3895                     ; 1446   if (NewState != DISABLE)
3897  0000 4d            	tnz	a
3898  0001 2706          	jreq	L1602
3899                     ; 1448     TIM1->CR2 |= TIM1_CR2_CCUS;
3901  0003 721452b1      	bset	21169,#2
3903  0007 2004          	jra	L3602
3904  0009               L1602:
3905                     ; 1452     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCUS);
3907  0009 721552b1      	bres	21169,#2
3908  000d               L3602:
3909                     ; 1454 }
3912  000d 81            	ret
3957                     ; 1468 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
3957                     ; 1469 {
3958                     .text:	section	.text,new
3959  0000               _TIM1_CCxCmd:
3961  0000 89            	pushw	x
3962       00000000      OFST:	set	0
3965                     ; 1471   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
3967                     ; 1472   assert_param(IS_FUNCTIONAL_STATE(NewState));
3969                     ; 1474   if (TIM1_Channel == TIM1_Channel_1)
3971  0001 9e            	ld	a,xh
3972  0002 4d            	tnz	a
3973  0003 2610          	jrne	L7012
3974                     ; 1477     if (NewState != DISABLE)
3976  0005 9f            	ld	a,xl
3977  0006 4d            	tnz	a
3978  0007 2706          	jreq	L1112
3979                     ; 1479       TIM1->CCER1 |= TIM1_CCER1_CC1E;
3981  0009 721052bd      	bset	21181,#0
3983  000d 2040          	jra	L5112
3984  000f               L1112:
3985                     ; 1483       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
3987  000f 721152bd      	bres	21181,#0
3988  0013 203a          	jra	L5112
3989  0015               L7012:
3990                     ; 1486   else if (TIM1_Channel == TIM1_Channel_2)
3992  0015 7b01          	ld	a,(OFST+1,sp)
3993  0017 a101          	cp	a,#1
3994  0019 2610          	jrne	L7112
3995                     ; 1489     if (NewState != DISABLE)
3997  001b 0d02          	tnz	(OFST+2,sp)
3998  001d 2706          	jreq	L1212
3999                     ; 1491       TIM1->CCER1 |= TIM1_CCER1_CC2E;
4001  001f 721852bd      	bset	21181,#4
4003  0023 202a          	jra	L5112
4004  0025               L1212:
4005                     ; 1495       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
4007  0025 721952bd      	bres	21181,#4
4008  0029 2024          	jra	L5112
4009  002b               L7112:
4010                     ; 1498   else if (TIM1_Channel == TIM1_Channel_3)
4012  002b 7b01          	ld	a,(OFST+1,sp)
4013  002d a102          	cp	a,#2
4014  002f 2610          	jrne	L7212
4015                     ; 1501     if (NewState != DISABLE)
4017  0031 0d02          	tnz	(OFST+2,sp)
4018  0033 2706          	jreq	L1312
4019                     ; 1503       TIM1->CCER2 |= TIM1_CCER2_CC3E;
4021  0035 721052be      	bset	21182,#0
4023  0039 2014          	jra	L5112
4024  003b               L1312:
4025                     ; 1507       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
4027  003b 721152be      	bres	21182,#0
4028  003f 200e          	jra	L5112
4029  0041               L7212:
4030                     ; 1513     if (NewState != DISABLE)
4032  0041 0d02          	tnz	(OFST+2,sp)
4033  0043 2706          	jreq	L7312
4034                     ; 1515       TIM1->CCER2 |= TIM1_CCER2_CC4E;
4036  0045 721852be      	bset	21182,#4
4038  0049 2004          	jra	L5112
4039  004b               L7312:
4040                     ; 1519       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
4042  004b 721952be      	bres	21182,#4
4043  004f               L5112:
4044                     ; 1522 }
4047  004f 85            	popw	x
4048  0050 81            	ret
4093                     ; 1535 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
4093                     ; 1536 {
4094                     .text:	section	.text,new
4095  0000               _TIM1_CCxNCmd:
4097  0000 89            	pushw	x
4098       00000000      OFST:	set	0
4101                     ; 1538   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL(TIM1_Channel));
4103                     ; 1539   assert_param(IS_FUNCTIONAL_STATE(NewState));
4105                     ; 1541   if (TIM1_Channel == TIM1_Channel_1)
4107  0001 9e            	ld	a,xh
4108  0002 4d            	tnz	a
4109  0003 2610          	jrne	L5612
4110                     ; 1544     if (NewState != DISABLE)
4112  0005 9f            	ld	a,xl
4113  0006 4d            	tnz	a
4114  0007 2706          	jreq	L7612
4115                     ; 1546       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
4117  0009 721452bd      	bset	21181,#2
4119  000d 202a          	jra	L3712
4120  000f               L7612:
4121                     ; 1550       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
4123  000f 721552bd      	bres	21181,#2
4124  0013 2024          	jra	L3712
4125  0015               L5612:
4126                     ; 1553   else if (TIM1_Channel == TIM1_Channel_2)
4128  0015 7b01          	ld	a,(OFST+1,sp)
4129  0017 a101          	cp	a,#1
4130  0019 2610          	jrne	L5712
4131                     ; 1556     if (NewState != DISABLE)
4133  001b 0d02          	tnz	(OFST+2,sp)
4134  001d 2706          	jreq	L7712
4135                     ; 1558       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
4137  001f 721c52bd      	bset	21181,#6
4139  0023 2014          	jra	L3712
4140  0025               L7712:
4141                     ; 1562       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
4143  0025 721d52bd      	bres	21181,#6
4144  0029 200e          	jra	L3712
4145  002b               L5712:
4146                     ; 1568     if (NewState != DISABLE)
4148  002b 0d02          	tnz	(OFST+2,sp)
4149  002d 2706          	jreq	L5022
4150                     ; 1570       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
4152  002f 721452be      	bset	21182,#2
4154  0033 2004          	jra	L3712
4155  0035               L5022:
4156                     ; 1574       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
4158  0035 721552be      	bres	21182,#2
4159  0039               L3712:
4160                     ; 1577 }
4163  0039 85            	popw	x
4164  003a 81            	ret
4332                     ; 1664 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
4332                     ; 1665                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4332                     ; 1666                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
4332                     ; 1667                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4332                     ; 1668                  uint8_t TIM1_ICFilter)
4332                     ; 1669 {
4333                     .text:	section	.text,new
4334  0000               _TIM1_ICInit:
4336  0000 89            	pushw	x
4337       00000000      OFST:	set	0
4340                     ; 1672   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
4342                     ; 1673   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4344                     ; 1674   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4346                     ; 1675   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4348                     ; 1676   assert_param(IS_TIM1_IC_FILTER(TIM1_ICFilter));
4350                     ; 1678   if (TIM1_Channel == TIM1_Channel_1)
4352  0001 9e            	ld	a,xh
4353  0002 4d            	tnz	a
4354  0003 2614          	jrne	L5032
4355                     ; 1681     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4357  0005 7b07          	ld	a,(OFST+7,sp)
4358  0007 88            	push	a
4359  0008 7b06          	ld	a,(OFST+6,sp)
4360  000a 97            	ld	xl,a
4361  000b 7b03          	ld	a,(OFST+3,sp)
4362  000d 95            	ld	xh,a
4363  000e cd0000        	call	L3_TI1_Config
4365  0011 84            	pop	a
4366                     ; 1683     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4368  0012 7b06          	ld	a,(OFST+6,sp)
4369  0014 cd0000        	call	_TIM1_SetIC1Prescaler
4372  0017 2046          	jra	L7032
4373  0019               L5032:
4374                     ; 1685   else if (TIM1_Channel == TIM1_Channel_2)
4376  0019 7b01          	ld	a,(OFST+1,sp)
4377  001b a101          	cp	a,#1
4378  001d 2614          	jrne	L1132
4379                     ; 1688     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4381  001f 7b07          	ld	a,(OFST+7,sp)
4382  0021 88            	push	a
4383  0022 7b06          	ld	a,(OFST+6,sp)
4384  0024 97            	ld	xl,a
4385  0025 7b03          	ld	a,(OFST+3,sp)
4386  0027 95            	ld	xh,a
4387  0028 cd0000        	call	L5_TI2_Config
4389  002b 84            	pop	a
4390                     ; 1690     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4392  002c 7b06          	ld	a,(OFST+6,sp)
4393  002e cd0000        	call	_TIM1_SetIC2Prescaler
4396  0031 202c          	jra	L7032
4397  0033               L1132:
4398                     ; 1692   else if (TIM1_Channel == TIM1_Channel_3)
4400  0033 7b01          	ld	a,(OFST+1,sp)
4401  0035 a102          	cp	a,#2
4402  0037 2614          	jrne	L5132
4403                     ; 1695     TI3_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4405  0039 7b07          	ld	a,(OFST+7,sp)
4406  003b 88            	push	a
4407  003c 7b06          	ld	a,(OFST+6,sp)
4408  003e 97            	ld	xl,a
4409  003f 7b03          	ld	a,(OFST+3,sp)
4410  0041 95            	ld	xh,a
4411  0042 cd0000        	call	L7_TI3_Config
4413  0045 84            	pop	a
4414                     ; 1697     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
4416  0046 7b06          	ld	a,(OFST+6,sp)
4417  0048 cd0000        	call	_TIM1_SetIC3Prescaler
4420  004b 2012          	jra	L7032
4421  004d               L5132:
4422                     ; 1702     TI4_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4424  004d 7b07          	ld	a,(OFST+7,sp)
4425  004f 88            	push	a
4426  0050 7b06          	ld	a,(OFST+6,sp)
4427  0052 97            	ld	xl,a
4428  0053 7b03          	ld	a,(OFST+3,sp)
4429  0055 95            	ld	xh,a
4430  0056 cd0000        	call	L11_TI4_Config
4432  0059 84            	pop	a
4433                     ; 1704     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
4435  005a 7b06          	ld	a,(OFST+6,sp)
4436  005c cd0000        	call	_TIM1_SetIC4Prescaler
4438  005f               L7032:
4439                     ; 1706 }
4442  005f 85            	popw	x
4443  0060 81            	ret
4541                     ; 1733 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
4541                     ; 1734                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4541                     ; 1735                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
4541                     ; 1736                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4541                     ; 1737                      uint8_t TIM1_ICFilter)
4541                     ; 1738 {
4542                     .text:	section	.text,new
4543  0000               _TIM1_PWMIConfig:
4545  0000 89            	pushw	x
4546  0001 89            	pushw	x
4547       00000002      OFST:	set	2
4550                     ; 1739   TIM1_ICPolarity_TypeDef icpolarity = TIM1_ICPolarity_Rising;
4552                     ; 1740   TIM1_ICSelection_TypeDef icselection = TIM1_ICSelection_DirectTI;
4554                     ; 1743   assert_param(IS_TIM1_PWMI_CHANNEL(TIM1_Channel));
4556                     ; 1744   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4558                     ; 1745   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4560                     ; 1746   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4562                     ; 1749   if (TIM1_ICPolarity != TIM1_ICPolarity_Falling)
4564  0002 9f            	ld	a,xl
4565  0003 a101          	cp	a,#1
4566  0005 2706          	jreq	L7632
4567                     ; 1751     icpolarity = TIM1_ICPolarity_Falling;
4569  0007 a601          	ld	a,#1
4570  0009 6b01          	ld	(OFST-1,sp),a
4573  000b 2002          	jra	L1732
4574  000d               L7632:
4575                     ; 1755     icpolarity = TIM1_ICPolarity_Rising;
4577  000d 0f01          	clr	(OFST-1,sp)
4579  000f               L1732:
4580                     ; 1759   if (TIM1_ICSelection == TIM1_ICSelection_DirectTI)
4582  000f 7b07          	ld	a,(OFST+5,sp)
4583  0011 a101          	cp	a,#1
4584  0013 2606          	jrne	L3732
4585                     ; 1761     icselection = TIM1_ICSelection_IndirectTI;
4587  0015 a602          	ld	a,#2
4588  0017 6b02          	ld	(OFST+0,sp),a
4591  0019 2004          	jra	L5732
4592  001b               L3732:
4593                     ; 1765     icselection = TIM1_ICSelection_DirectTI;
4595  001b a601          	ld	a,#1
4596  001d 6b02          	ld	(OFST+0,sp),a
4598  001f               L5732:
4599                     ; 1768   if (TIM1_Channel == TIM1_Channel_1)
4601  001f 0d03          	tnz	(OFST+1,sp)
4602  0021 2626          	jrne	L7732
4603                     ; 1771     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4605  0023 7b09          	ld	a,(OFST+7,sp)
4606  0025 88            	push	a
4607  0026 7b08          	ld	a,(OFST+6,sp)
4608  0028 97            	ld	xl,a
4609  0029 7b05          	ld	a,(OFST+3,sp)
4610  002b 95            	ld	xh,a
4611  002c cd0000        	call	L3_TI1_Config
4613  002f 84            	pop	a
4614                     ; 1774     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4616  0030 7b08          	ld	a,(OFST+6,sp)
4617  0032 cd0000        	call	_TIM1_SetIC1Prescaler
4619                     ; 1777     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
4621  0035 7b09          	ld	a,(OFST+7,sp)
4622  0037 88            	push	a
4623  0038 7b03          	ld	a,(OFST+1,sp)
4624  003a 97            	ld	xl,a
4625  003b 7b02          	ld	a,(OFST+0,sp)
4626  003d 95            	ld	xh,a
4627  003e cd0000        	call	L5_TI2_Config
4629  0041 84            	pop	a
4630                     ; 1780     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4632  0042 7b08          	ld	a,(OFST+6,sp)
4633  0044 cd0000        	call	_TIM1_SetIC2Prescaler
4636  0047 2024          	jra	L1042
4637  0049               L7732:
4638                     ; 1785     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4640  0049 7b09          	ld	a,(OFST+7,sp)
4641  004b 88            	push	a
4642  004c 7b08          	ld	a,(OFST+6,sp)
4643  004e 97            	ld	xl,a
4644  004f 7b05          	ld	a,(OFST+3,sp)
4645  0051 95            	ld	xh,a
4646  0052 cd0000        	call	L5_TI2_Config
4648  0055 84            	pop	a
4649                     ; 1788     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4651  0056 7b08          	ld	a,(OFST+6,sp)
4652  0058 cd0000        	call	_TIM1_SetIC2Prescaler
4654                     ; 1791     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
4656  005b 7b09          	ld	a,(OFST+7,sp)
4657  005d 88            	push	a
4658  005e 7b03          	ld	a,(OFST+1,sp)
4659  0060 97            	ld	xl,a
4660  0061 7b02          	ld	a,(OFST+0,sp)
4661  0063 95            	ld	xh,a
4662  0064 cd0000        	call	L3_TI1_Config
4664  0067 84            	pop	a
4665                     ; 1794     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4667  0068 7b08          	ld	a,(OFST+6,sp)
4668  006a cd0000        	call	_TIM1_SetIC1Prescaler
4670  006d               L1042:
4671                     ; 1796 }
4674  006d 5b04          	addw	sp,#4
4675  006f 81            	ret
4727                     ; 1803 uint16_t TIM1_GetCapture1(void)
4727                     ; 1804 {
4728                     .text:	section	.text,new
4729  0000               _TIM1_GetCapture1:
4731  0000 5204          	subw	sp,#4
4732       00000004      OFST:	set	4
4735                     ; 1807   uint16_t tmpccr1 = 0;
4737                     ; 1808   uint8_t tmpccr1l = 0, tmpccr1h = 0;
4741                     ; 1810   tmpccr1h = TIM1->CCR1H;
4743  0002 c652c6        	ld	a,21190
4744  0005 6b02          	ld	(OFST-2,sp),a
4746                     ; 1811   tmpccr1l = TIM1->CCR1L;
4748  0007 c652c7        	ld	a,21191
4749  000a 6b01          	ld	(OFST-3,sp),a
4751                     ; 1813   tmpccr1 = (uint16_t)(tmpccr1l);
4753  000c 7b01          	ld	a,(OFST-3,sp)
4754  000e 5f            	clrw	x
4755  000f 97            	ld	xl,a
4756  0010 1f03          	ldw	(OFST-1,sp),x
4758                     ; 1814   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4760  0012 7b02          	ld	a,(OFST-2,sp)
4761  0014 5f            	clrw	x
4762  0015 97            	ld	xl,a
4763  0016 4f            	clr	a
4764  0017 02            	rlwa	x,a
4765  0018 01            	rrwa	x,a
4766  0019 1a04          	or	a,(OFST+0,sp)
4767  001b 01            	rrwa	x,a
4768  001c 1a03          	or	a,(OFST-1,sp)
4769  001e 01            	rrwa	x,a
4770  001f 1f03          	ldw	(OFST-1,sp),x
4772                     ; 1816   return (uint16_t)tmpccr1;
4774  0021 1e03          	ldw	x,(OFST-1,sp)
4777  0023 5b04          	addw	sp,#4
4778  0025 81            	ret
4830                     ; 1824 uint16_t TIM1_GetCapture2(void)
4830                     ; 1825 {
4831                     .text:	section	.text,new
4832  0000               _TIM1_GetCapture2:
4834  0000 5204          	subw	sp,#4
4835       00000004      OFST:	set	4
4838                     ; 1828   uint16_t tmpccr2 = 0;
4840                     ; 1829   uint8_t tmpccr2l = 0, tmpccr2h = 0;
4844                     ; 1831   tmpccr2h = TIM1->CCR2H;
4846  0002 c652c8        	ld	a,21192
4847  0005 6b02          	ld	(OFST-2,sp),a
4849                     ; 1832   tmpccr2l = TIM1->CCR2L;
4851  0007 c652c9        	ld	a,21193
4852  000a 6b01          	ld	(OFST-3,sp),a
4854                     ; 1834   tmpccr2 = (uint16_t)(tmpccr2l);
4856  000c 7b01          	ld	a,(OFST-3,sp)
4857  000e 5f            	clrw	x
4858  000f 97            	ld	xl,a
4859  0010 1f03          	ldw	(OFST-1,sp),x
4861                     ; 1835   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4863  0012 7b02          	ld	a,(OFST-2,sp)
4864  0014 5f            	clrw	x
4865  0015 97            	ld	xl,a
4866  0016 4f            	clr	a
4867  0017 02            	rlwa	x,a
4868  0018 01            	rrwa	x,a
4869  0019 1a04          	or	a,(OFST+0,sp)
4870  001b 01            	rrwa	x,a
4871  001c 1a03          	or	a,(OFST-1,sp)
4872  001e 01            	rrwa	x,a
4873  001f 1f03          	ldw	(OFST-1,sp),x
4875                     ; 1837   return (uint16_t)tmpccr2;
4877  0021 1e03          	ldw	x,(OFST-1,sp)
4880  0023 5b04          	addw	sp,#4
4881  0025 81            	ret
4933                     ; 1845 uint16_t TIM1_GetCapture3(void)
4933                     ; 1846 {
4934                     .text:	section	.text,new
4935  0000               _TIM1_GetCapture3:
4937  0000 5204          	subw	sp,#4
4938       00000004      OFST:	set	4
4941                     ; 1848   uint16_t tmpccr3 = 0;
4943                     ; 1849   uint8_t tmpccr3l = 0, tmpccr3h = 0;
4947                     ; 1851   tmpccr3h = TIM1->CCR3H;
4949  0002 c652ca        	ld	a,21194
4950  0005 6b02          	ld	(OFST-2,sp),a
4952                     ; 1852   tmpccr3l = TIM1->CCR3L;
4954  0007 c652cb        	ld	a,21195
4955  000a 6b01          	ld	(OFST-3,sp),a
4957                     ; 1854   tmpccr3 = (uint16_t)(tmpccr3l);
4959  000c 7b01          	ld	a,(OFST-3,sp)
4960  000e 5f            	clrw	x
4961  000f 97            	ld	xl,a
4962  0010 1f03          	ldw	(OFST-1,sp),x
4964                     ; 1855   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4966  0012 7b02          	ld	a,(OFST-2,sp)
4967  0014 5f            	clrw	x
4968  0015 97            	ld	xl,a
4969  0016 4f            	clr	a
4970  0017 02            	rlwa	x,a
4971  0018 01            	rrwa	x,a
4972  0019 1a04          	or	a,(OFST+0,sp)
4973  001b 01            	rrwa	x,a
4974  001c 1a03          	or	a,(OFST-1,sp)
4975  001e 01            	rrwa	x,a
4976  001f 1f03          	ldw	(OFST-1,sp),x
4978                     ; 1857   return (uint16_t)tmpccr3;
4980  0021 1e03          	ldw	x,(OFST-1,sp)
4983  0023 5b04          	addw	sp,#4
4984  0025 81            	ret
5036                     ; 1865 uint16_t TIM1_GetCapture4(void)
5036                     ; 1866 {
5037                     .text:	section	.text,new
5038  0000               _TIM1_GetCapture4:
5040  0000 5204          	subw	sp,#4
5041       00000004      OFST:	set	4
5044                     ; 1868   uint16_t tmpccr4 = 0;
5046                     ; 1869   uint8_t tmpccr4l = 0, tmpccr4h = 0;
5050                     ; 1871   tmpccr4h = TIM1->CCR4H;
5052  0002 c652cc        	ld	a,21196
5053  0005 6b02          	ld	(OFST-2,sp),a
5055                     ; 1872   tmpccr4l = TIM1->CCR4L;
5057  0007 c652cd        	ld	a,21197
5058  000a 6b01          	ld	(OFST-3,sp),a
5060                     ; 1874   tmpccr4 = (uint16_t)(tmpccr4l);
5062  000c 7b01          	ld	a,(OFST-3,sp)
5063  000e 5f            	clrw	x
5064  000f 97            	ld	xl,a
5065  0010 1f03          	ldw	(OFST-1,sp),x
5067                     ; 1875   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
5069  0012 7b02          	ld	a,(OFST-2,sp)
5070  0014 5f            	clrw	x
5071  0015 97            	ld	xl,a
5072  0016 4f            	clr	a
5073  0017 02            	rlwa	x,a
5074  0018 01            	rrwa	x,a
5075  0019 1a04          	or	a,(OFST+0,sp)
5076  001b 01            	rrwa	x,a
5077  001c 1a03          	or	a,(OFST-1,sp)
5078  001e 01            	rrwa	x,a
5079  001f 1f03          	ldw	(OFST-1,sp),x
5081                     ; 1877   return (uint16_t)tmpccr4;
5083  0021 1e03          	ldw	x,(OFST-1,sp)
5086  0023 5b04          	addw	sp,#4
5087  0025 81            	ret
5123                     ; 1890 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5123                     ; 1891 {
5124                     .text:	section	.text,new
5125  0000               _TIM1_SetIC1Prescaler:
5127  0000 88            	push	a
5128       00000000      OFST:	set	0
5131                     ; 1893   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC1Prescaler));
5133                     ; 1896   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC1Prescaler);
5135  0001 c652b9        	ld	a,21177
5136  0004 a4f3          	and	a,#243
5137  0006 1a01          	or	a,(OFST+1,sp)
5138  0008 c752b9        	ld	21177,a
5139                     ; 1897 }
5142  000b 84            	pop	a
5143  000c 81            	ret
5179                     ; 1909 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5179                     ; 1910 {
5180                     .text:	section	.text,new
5181  0000               _TIM1_SetIC2Prescaler:
5183  0000 88            	push	a
5184       00000000      OFST:	set	0
5187                     ; 1912   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC2Prescaler));
5189                     ; 1915   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC2Prescaler);
5191  0001 c652ba        	ld	a,21178
5192  0004 a4f3          	and	a,#243
5193  0006 1a01          	or	a,(OFST+1,sp)
5194  0008 c752ba        	ld	21178,a
5195                     ; 1916 }
5198  000b 84            	pop	a
5199  000c 81            	ret
5235                     ; 1928 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5235                     ; 1929 {
5236                     .text:	section	.text,new
5237  0000               _TIM1_SetIC3Prescaler:
5239  0000 88            	push	a
5240       00000000      OFST:	set	0
5243                     ; 1932   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC3Prescaler));
5245                     ; 1935   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC3Prescaler);
5247  0001 c652bb        	ld	a,21179
5248  0004 a4f3          	and	a,#243
5249  0006 1a01          	or	a,(OFST+1,sp)
5250  0008 c752bb        	ld	21179,a
5251                     ; 1936 }
5254  000b 84            	pop	a
5255  000c 81            	ret
5291                     ; 1948 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
5291                     ; 1949 {
5292                     .text:	section	.text,new
5293  0000               _TIM1_SetIC4Prescaler:
5295  0000 88            	push	a
5296       00000000      OFST:	set	0
5299                     ; 1952   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC4Prescaler));
5301                     ; 1955   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC4Prescaler);
5303  0001 c652bc        	ld	a,21180
5304  0004 a4f3          	and	a,#243
5305  0006 1a01          	or	a,(OFST+1,sp)
5306  0008 c752bc        	ld	21180,a
5307                     ; 1956 }
5310  000b 84            	pop	a
5311  000c 81            	ret
5418                     ; 1991 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
5418                     ; 1992 {
5419                     .text:	section	.text,new
5420  0000               _TIM1_ITConfig:
5422  0000 89            	pushw	x
5423       00000000      OFST:	set	0
5426                     ; 1994   assert_param(IS_TIM1_IT(TIM1_IT));
5428                     ; 1995   assert_param(IS_FUNCTIONAL_STATE(NewState));
5430                     ; 1997   if (NewState != DISABLE)
5432  0001 9f            	ld	a,xl
5433  0002 4d            	tnz	a
5434  0003 2709          	jreq	L1762
5435                     ; 2000     TIM1->IER |= (uint8_t)TIM1_IT;
5437  0005 9e            	ld	a,xh
5438  0006 ca52b5        	or	a,21173
5439  0009 c752b5        	ld	21173,a
5441  000c 2009          	jra	L3762
5442  000e               L1762:
5443                     ; 2005     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
5445  000e 7b01          	ld	a,(OFST+1,sp)
5446  0010 43            	cpl	a
5447  0011 c452b5        	and	a,21173
5448  0014 c752b5        	ld	21173,a
5449  0017               L3762:
5450                     ; 2007 }
5453  0017 85            	popw	x
5454  0018 81            	ret
5559                     ; 2023 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
5559                     ; 2024 {
5560                     .text:	section	.text,new
5561  0000               _TIM1_GenerateEvent:
5565                     ; 2026   assert_param(IS_TIM1_EVENT_SOURCE(TIM1_EventSource));
5567                     ; 2029   TIM1->EGR = (uint8_t)TIM1_EventSource;
5569  0000 c752b8        	ld	21176,a
5570                     ; 2030 }
5573  0003 81            	ret
5747                     ; 2049 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
5747                     ; 2050 {
5748                     .text:	section	.text,new
5749  0000               _TIM1_GetFlagStatus:
5751  0000 89            	pushw	x
5752  0001 89            	pushw	x
5753       00000002      OFST:	set	2
5756                     ; 2051   FlagStatus bitstatus = RESET;
5758                     ; 2052   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
5762                     ; 2055   assert_param(IS_TIM1_GET_FLAG(TIM1_FLAG));
5764                     ; 2057   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
5766  0002 9f            	ld	a,xl
5767  0003 c452b6        	and	a,21174
5768  0006 6b01          	ld	(OFST-1,sp),a
5770                     ; 2058   tim1_flag_h = (uint8_t)(TIM1->SR2 & (uint8_t)((uint16_t)TIM1_FLAG >> 8));
5772  0008 c652b7        	ld	a,21175
5773  000b 1403          	and	a,(OFST+1,sp)
5774  000d 6b02          	ld	(OFST+0,sp),a
5776                     ; 2060   if ((uint8_t)((uint8_t)tim1_flag_l | (uint8_t)tim1_flag_h) != 0)
5778  000f 7b01          	ld	a,(OFST-1,sp)
5779  0011 1a02          	or	a,(OFST+0,sp)
5780  0013 2706          	jreq	L5303
5781                     ; 2062     bitstatus = SET;
5783  0015 a601          	ld	a,#1
5784  0017 6b02          	ld	(OFST+0,sp),a
5787  0019 2002          	jra	L7303
5788  001b               L5303:
5789                     ; 2066     bitstatus = RESET;
5791  001b 0f02          	clr	(OFST+0,sp)
5793  001d               L7303:
5794                     ; 2068   return (FlagStatus)(bitstatus);
5796  001d 7b02          	ld	a,(OFST+0,sp)
5799  001f 5b04          	addw	sp,#4
5800  0021 81            	ret
5835                     ; 2089 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
5835                     ; 2090 {
5836                     .text:	section	.text,new
5837  0000               _TIM1_ClearFlag:
5839  0000 89            	pushw	x
5840       00000000      OFST:	set	0
5843                     ; 2092   assert_param(IS_TIM1_CLEAR_FLAG(TIM1_FLAG));
5845                     ; 2095   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
5847  0001 9f            	ld	a,xl
5848  0002 43            	cpl	a
5849  0003 c752b6        	ld	21174,a
5850                     ; 2096   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & (uint8_t)0x1E);
5852  0006 7b01          	ld	a,(OFST+1,sp)
5853  0008 43            	cpl	a
5854  0009 a41e          	and	a,#30
5855  000b c752b7        	ld	21175,a
5856                     ; 2097 }
5859  000e 85            	popw	x
5860  000f 81            	ret
5924                     ; 2114 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
5924                     ; 2115 {
5925                     .text:	section	.text,new
5926  0000               _TIM1_GetITStatus:
5928  0000 88            	push	a
5929  0001 89            	pushw	x
5930       00000002      OFST:	set	2
5933                     ; 2116   ITStatus bitstatus = RESET;
5935                     ; 2118   uint8_t TIM1_itStatus = 0x0, TIM1_itEnable = 0x0;
5939                     ; 2121   assert_param(IS_TIM1_GET_IT(TIM1_IT));
5941                     ; 2123   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
5943  0002 c452b6        	and	a,21174
5944  0005 6b01          	ld	(OFST-1,sp),a
5946                     ; 2125   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
5948  0007 c652b5        	ld	a,21173
5949  000a 1403          	and	a,(OFST+1,sp)
5950  000c 6b02          	ld	(OFST+0,sp),a
5952                     ; 2127   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
5954  000e 0d01          	tnz	(OFST-1,sp)
5955  0010 270a          	jreq	L1113
5957  0012 0d02          	tnz	(OFST+0,sp)
5958  0014 2706          	jreq	L1113
5959                     ; 2129     bitstatus = SET;
5961  0016 a601          	ld	a,#1
5962  0018 6b02          	ld	(OFST+0,sp),a
5965  001a 2002          	jra	L3113
5966  001c               L1113:
5967                     ; 2133     bitstatus = RESET;
5969  001c 0f02          	clr	(OFST+0,sp)
5971  001e               L3113:
5972                     ; 2135   return (ITStatus)(bitstatus);
5974  001e 7b02          	ld	a,(OFST+0,sp)
5977  0020 5b03          	addw	sp,#3
5978  0022 81            	ret
6014                     ; 2152 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
6014                     ; 2153 {
6015                     .text:	section	.text,new
6016  0000               _TIM1_ClearITPendingBit:
6020                     ; 2155   assert_param(IS_TIM1_IT(TIM1_IT));
6022                     ; 2158   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
6024  0000 43            	cpl	a
6025  0001 c752b6        	ld	21174,a
6026                     ; 2159 }
6029  0004 81            	ret
6567                     ; 2167 void TIM1_DMAConfig(TIM1_DMABase_TypeDef TIM1_DMABase,
6567                     ; 2168                     TIM1_DMABurstLength_TypeDef TIM1_DMABurstLength)
6567                     ; 2169 {
6568                     .text:	section	.text,new
6569  0000               _TIM1_DMAConfig:
6573                     ; 2171   assert_param(IS_TIM1_DMABase(TIM1_DMABase));
6575                     ; 2172   assert_param(IS_TIM1_DMABurstLength(TIM1_DMABurstLength));
6577                     ; 2175   TIM1->DCR1 = (uint8_t)TIM1_DMABase;
6579  0000 9e            	ld	a,xh
6580  0001 c752d1        	ld	21201,a
6581                     ; 2176   TIM1->DCR2 = (uint8_t)TIM1_DMABurstLength;
6583  0004 9f            	ld	a,xl
6584  0005 c752d2        	ld	21202,a
6585                     ; 2177 }
6588  0008 81            	ret
6682                     ; 2189 void TIM1_DMACmd(TIM1_DMASource_TypeDef TIM1_DMASource, FunctionalState NewState)
6682                     ; 2190 {
6683                     .text:	section	.text,new
6684  0000               _TIM1_DMACmd:
6686  0000 89            	pushw	x
6687       00000000      OFST:	set	0
6690                     ; 2192   assert_param(IS_FUNCTIONAL_STATE(NewState));
6692                     ; 2193   assert_param(IS_TIM1_DMA_SOURCE(TIM1_DMASource));
6694                     ; 2195   if (NewState != DISABLE)
6696  0001 9f            	ld	a,xl
6697  0002 4d            	tnz	a
6698  0003 2709          	jreq	L7243
6699                     ; 2198     TIM1->DER |= (uint8_t)TIM1_DMASource;
6701  0005 9e            	ld	a,xh
6702  0006 ca52b4        	or	a,21172
6703  0009 c752b4        	ld	21172,a
6705  000c 2009          	jra	L1343
6706  000e               L7243:
6707                     ; 2203     TIM1->DER &= (uint8_t)(~TIM1_DMASource);
6709  000e 7b01          	ld	a,(OFST+1,sp)
6710  0010 43            	cpl	a
6711  0011 c452b4        	and	a,21172
6712  0014 c752b4        	ld	21172,a
6713  0017               L1343:
6714                     ; 2205 }
6717  0017 85            	popw	x
6718  0018 81            	ret
6753                     ; 2213 void TIM1_SelectCCDMA(FunctionalState NewState)
6753                     ; 2214 {
6754                     .text:	section	.text,new
6755  0000               _TIM1_SelectCCDMA:
6759                     ; 2216   assert_param(IS_FUNCTIONAL_STATE(NewState));
6761                     ; 2218   if (NewState != DISABLE)
6763  0000 4d            	tnz	a
6764  0001 2706          	jreq	L1543
6765                     ; 2221     TIM1->CR2 |= TIM1_CR2_CCDS;
6767  0003 721652b1      	bset	21169,#3
6769  0007 2004          	jra	L3543
6770  0009               L1543:
6771                     ; 2226     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCDS);
6773  0009 721752b1      	bres	21169,#3
6774  000d               L3543:
6775                     ; 2228 }
6778  000d 81            	ret
6802                     ; 2251 void TIM1_InternalClockConfig(void)
6802                     ; 2252 {
6803                     .text:	section	.text,new
6804  0000               _TIM1_InternalClockConfig:
6808                     ; 2254   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
6810  0000 c652b2        	ld	a,21170
6811  0003 a4f8          	and	a,#248
6812  0005 c752b2        	ld	21170,a
6813                     ; 2255 }
6816  0008 81            	ret
6905                     ; 2272 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
6905                     ; 2273                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
6905                     ; 2274                                  uint8_t ICFilter)
6905                     ; 2275 {
6906                     .text:	section	.text,new
6907  0000               _TIM1_TIxExternalClockConfig:
6909  0000 89            	pushw	x
6910       00000000      OFST:	set	0
6913                     ; 2277   assert_param(IS_TIM1_TIXCLK_SOURCE(TIM1_TIxExternalCLKSource));
6915                     ; 2278   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
6917                     ; 2279   assert_param(IS_TIM1_IC_FILTER(ICFilter));
6919                     ; 2282   if (TIM1_TIxExternalCLKSource == TIM1_TIxExternalCLK1Source_TI2)
6921  0001 9e            	ld	a,xh
6922  0002 a160          	cp	a,#96
6923  0004 260e          	jrne	L5253
6924                     ; 2284     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6926  0006 7b05          	ld	a,(OFST+5,sp)
6927  0008 88            	push	a
6928  0009 9f            	ld	a,xl
6929  000a ae0001        	ldw	x,#1
6930  000d 95            	ld	xh,a
6931  000e cd0000        	call	L5_TI2_Config
6933  0011 84            	pop	a
6935  0012 200d          	jra	L7253
6936  0014               L5253:
6937                     ; 2288     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6939  0014 7b05          	ld	a,(OFST+5,sp)
6940  0016 88            	push	a
6941  0017 7b03          	ld	a,(OFST+3,sp)
6942  0019 ae0001        	ldw	x,#1
6943  001c 95            	ld	xh,a
6944  001d cd0000        	call	L3_TI1_Config
6946  0020 84            	pop	a
6947  0021               L7253:
6948                     ; 2292   TIM1_SelectInputTrigger((TIM1_TRGSelection_TypeDef)TIM1_TIxExternalCLKSource);
6950  0021 7b01          	ld	a,(OFST+1,sp)
6951  0023 cd0000        	call	_TIM1_SelectInputTrigger
6953                     ; 2295   TIM1->SMCR |= (uint8_t)(TIM1_SlaveMode_External1);
6955  0026 c652b2        	ld	a,21170
6956  0029 aa07          	or	a,#7
6957  002b c752b2        	ld	21170,a
6958                     ; 2296 }
6961  002e 85            	popw	x
6962  002f 81            	ret
7079                     ; 2314 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7079                     ; 2315                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7079                     ; 2316                               uint8_t ExtTRGFilter)
7079                     ; 2317 {
7080                     .text:	section	.text,new
7081  0000               _TIM1_ETRClockMode1Config:
7083  0000 89            	pushw	x
7084       00000000      OFST:	set	0
7087                     ; 2319   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
7089                     ; 2320   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
7091                     ; 2321   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7093                     ; 2324   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
7095  0001 7b05          	ld	a,(OFST+5,sp)
7096  0003 88            	push	a
7097  0004 9f            	ld	a,xl
7098  0005 97            	ld	xl,a
7099  0006 7b02          	ld	a,(OFST+2,sp)
7100  0008 95            	ld	xh,a
7101  0009 cd0000        	call	_TIM1_ETRConfig
7103  000c 84            	pop	a
7104                     ; 2327   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(TIM1_SMCR_SMS | TIM1_SMCR_TS)))
7104                     ; 2328                          | (uint8_t)((uint8_t)TIM1_SlaveMode_External1 | (uint8_t) TIM1_TRGSelection_ETRF));
7106  000d c652b2        	ld	a,21170
7107  0010 a488          	and	a,#136
7108  0012 aa77          	or	a,#119
7109  0014 c752b2        	ld	21170,a
7110                     ; 2329 }
7113  0017 85            	popw	x
7114  0018 81            	ret
7172                     ; 2347 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7172                     ; 2348                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7172                     ; 2349                               uint8_t ExtTRGFilter)
7172                     ; 2350 {
7173                     .text:	section	.text,new
7174  0000               _TIM1_ETRClockMode2Config:
7176  0000 89            	pushw	x
7177       00000000      OFST:	set	0
7180                     ; 2352   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
7182                     ; 2353   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
7184                     ; 2356   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
7186  0001 7b05          	ld	a,(OFST+5,sp)
7187  0003 88            	push	a
7188  0004 9f            	ld	a,xl
7189  0005 97            	ld	xl,a
7190  0006 7b02          	ld	a,(OFST+2,sp)
7191  0008 95            	ld	xh,a
7192  0009 cd0000        	call	_TIM1_ETRConfig
7194  000c 84            	pop	a
7195                     ; 2359   TIM1->ETR |= TIM1_ETR_ECE;
7197  000d 721c52b3      	bset	21171,#6
7198                     ; 2360 }
7201  0011 85            	popw	x
7202  0012 81            	ret
7309                     ; 2410 void TIM1_SelectInputTrigger(TIM1_TRGSelection_TypeDef TIM1_InputTriggerSource)
7309                     ; 2411 {
7310                     .text:	section	.text,new
7311  0000               _TIM1_SelectInputTrigger:
7313  0000 88            	push	a
7314       00000000      OFST:	set	0
7317                     ; 2413   assert_param(IS_TIM1_TRIGGER_SELECTION(TIM1_InputTriggerSource));
7319                     ; 2416   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
7321  0001 c652b2        	ld	a,21170
7322  0004 a48f          	and	a,#143
7323  0006 1a01          	or	a,(OFST+1,sp)
7324  0008 c752b2        	ld	21170,a
7325                     ; 2417 }
7328  000b 84            	pop	a
7329  000c 81            	ret
7435                     ; 2433 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
7435                     ; 2434 {
7436                     .text:	section	.text,new
7437  0000               _TIM1_SelectOutputTrigger:
7439  0000 88            	push	a
7440       00000000      OFST:	set	0
7443                     ; 2436   assert_param(IS_TIM1_TRGO_SOURCE(TIM1_TRGOSource));
7445                     ; 2438   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | (uint8_t) TIM1_TRGOSource);
7447  0001 c652b1        	ld	a,21169
7448  0004 a48f          	and	a,#143
7449  0006 1a01          	or	a,(OFST+1,sp)
7450  0008 c752b1        	ld	21169,a
7451                     ; 2439 }
7454  000b 84            	pop	a
7455  000c 81            	ret
7529                     ; 2451 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
7529                     ; 2452 {
7530                     .text:	section	.text,new
7531  0000               _TIM1_SelectSlaveMode:
7533  0000 88            	push	a
7534       00000000      OFST:	set	0
7537                     ; 2454   assert_param(IS_TIM1_SLAVE_MODE(TIM1_SlaveMode));
7539                     ; 2457   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) | (uint8_t)TIM1_SlaveMode);
7541  0001 c652b2        	ld	a,21170
7542  0004 a4f8          	and	a,#248
7543  0006 1a01          	or	a,(OFST+1,sp)
7544  0008 c752b2        	ld	21170,a
7545                     ; 2459 }
7548  000b 84            	pop	a
7549  000c 81            	ret
7585                     ; 2467 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
7585                     ; 2468 {
7586                     .text:	section	.text,new
7587  0000               _TIM1_SelectMasterSlaveMode:
7591                     ; 2470   assert_param(IS_FUNCTIONAL_STATE(NewState));
7593                     ; 2473   if (NewState != DISABLE)
7595  0000 4d            	tnz	a
7596  0001 2706          	jreq	L5004
7597                     ; 2475     TIM1->SMCR |= TIM1_SMCR_MSM;
7599  0003 721e52b2      	bset	21170,#7
7601  0007 2004          	jra	L7004
7602  0009               L5004:
7603                     ; 2479     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
7605  0009 721f52b2      	bres	21170,#7
7606  000d               L7004:
7607                     ; 2481 }
7610  000d 81            	ret
7666                     ; 2499 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7666                     ; 2500                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7666                     ; 2501                     uint8_t ExtTRGFilter)
7666                     ; 2502 {
7667                     .text:	section	.text,new
7668  0000               _TIM1_ETRConfig:
7670  0000 89            	pushw	x
7671       00000000      OFST:	set	0
7674                     ; 2503   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7676                     ; 2506   TIM1->ETR |= (uint8_t)((uint8_t)((uint8_t) TIM1_ExtTRGPrescaler
7676                     ; 2507                                    | (uint8_t) TIM1_ExtTRGPolarity)
7676                     ; 2508                          | (uint8_t) ExtTRGFilter);
7678  0001 9f            	ld	a,xl
7679  0002 1a01          	or	a,(OFST+1,sp)
7680  0004 1a05          	or	a,(OFST+5,sp)
7681  0006 ca52b3        	or	a,21171
7682  0009 c752b3        	ld	21171,a
7683                     ; 2509 }
7686  000c 85            	popw	x
7687  000d 81            	ret
7773                     ; 2547 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
7773                     ; 2548                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
7773                     ; 2549                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
7773                     ; 2550 {
7774                     .text:	section	.text,new
7775  0000               _TIM1_EncoderInterfaceConfig:
7777  0000 89            	pushw	x
7778       00000000      OFST:	set	0
7781                     ; 2552   assert_param(IS_TIM1_ENCODER_MODE(TIM1_EncoderMode));
7783                     ; 2553   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC1Polarity));
7785                     ; 2554   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC2Polarity));
7787                     ; 2557   if (TIM1_IC1Polarity != TIM1_ICPolarity_Rising)
7789  0001 9f            	ld	a,xl
7790  0002 4d            	tnz	a
7791  0003 2706          	jreq	L7704
7792                     ; 2559     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7794  0005 721252bd      	bset	21181,#1
7796  0009 2004          	jra	L1014
7797  000b               L7704:
7798                     ; 2563     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7800  000b 721352bd      	bres	21181,#1
7801  000f               L1014:
7802                     ; 2566   if (TIM1_IC2Polarity != TIM1_ICPolarity_Rising)
7804  000f 0d05          	tnz	(OFST+5,sp)
7805  0011 2706          	jreq	L3014
7806                     ; 2568     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7808  0013 721a52bd      	bset	21181,#5
7810  0017 2004          	jra	L5014
7811  0019               L3014:
7812                     ; 2572     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7814  0019 721b52bd      	bres	21181,#5
7815  001d               L5014:
7816                     ; 2575   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS)) | (uint8_t) TIM1_EncoderMode);
7818  001d c652b2        	ld	a,21170
7819  0020 a4f0          	and	a,#240
7820  0022 1a01          	or	a,(OFST+1,sp)
7821  0024 c752b2        	ld	21170,a
7822                     ; 2578   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS))  | (uint8_t) CCMR_TIxDirect_Set);
7824  0027 c652b9        	ld	a,21177
7825  002a a4fc          	and	a,#252
7826  002c aa01          	or	a,#1
7827  002e c752b9        	ld	21177,a
7828                     ; 2579   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS)) | (uint8_t) CCMR_TIxDirect_Set);
7830  0031 c652ba        	ld	a,21178
7831  0034 a4fc          	and	a,#252
7832  0036 aa01          	or	a,#1
7833  0038 c752ba        	ld	21178,a
7834                     ; 2581 }
7837  003b 85            	popw	x
7838  003c 81            	ret
7874                     ; 2589 void TIM1_SelectHallSensor(FunctionalState NewState)
7874                     ; 2590 {
7875                     .text:	section	.text,new
7876  0000               _TIM1_SelectHallSensor:
7880                     ; 2592   assert_param(IS_FUNCTIONAL_STATE(NewState));
7882                     ; 2595   if (NewState != DISABLE)
7884  0000 4d            	tnz	a
7885  0001 2706          	jreq	L5214
7886                     ; 2597     TIM1->CR2 |= TIM1_CR2_TI1S;
7888  0003 721e52b1      	bset	21169,#7
7890  0007 2004          	jra	L7214
7891  0009               L5214:
7892                     ; 2601     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
7894  0009 721f52b1      	bres	21169,#7
7895  000d               L7214:
7896                     ; 2603 }
7899  000d 81            	ret
7951                     ; 2623 static void TI1_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7951                     ; 2624 {
7952                     .text:	section	.text,new
7953  0000               L3_TI1_Config:
7955  0000 89            	pushw	x
7956  0001 88            	push	a
7957       00000001      OFST:	set	1
7960                     ; 2627   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7962  0002 721152bd      	bres	21181,#0
7963                     ; 2630   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7963                     ; 2631                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7965  0006 7b06          	ld	a,(OFST+5,sp)
7966  0008 97            	ld	xl,a
7967  0009 a610          	ld	a,#16
7968  000b 42            	mul	x,a
7969  000c 9f            	ld	a,xl
7970  000d 1a03          	or	a,(OFST+2,sp)
7971  000f 6b01          	ld	(OFST+0,sp),a
7973  0011 c652b9        	ld	a,21177
7974  0014 a40c          	and	a,#12
7975  0016 1a01          	or	a,(OFST+0,sp)
7976  0018 c752b9        	ld	21177,a
7977                     ; 2636   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7979  001b 0d02          	tnz	(OFST+1,sp)
7980  001d 2706          	jreq	L7514
7981                     ; 2638     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7983  001f 721252bd      	bset	21181,#1
7985  0023 2004          	jra	L1614
7986  0025               L7514:
7987                     ; 2642     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7989  0025 721352bd      	bres	21181,#1
7990  0029               L1614:
7991                     ; 2646   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7993  0029 721052bd      	bset	21181,#0
7994                     ; 2647 }
7997  002d 5b03          	addw	sp,#3
7998  002f 81            	ret
8050                     ; 2663 static void TI2_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8050                     ; 2664 {
8051                     .text:	section	.text,new
8052  0000               L5_TI2_Config:
8054  0000 89            	pushw	x
8055  0001 88            	push	a
8056       00000001      OFST:	set	1
8059                     ; 2666   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
8061  0002 721952bd      	bres	21181,#4
8062                     ; 2669   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8062                     ; 2670                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8064  0006 7b06          	ld	a,(OFST+5,sp)
8065  0008 97            	ld	xl,a
8066  0009 a610          	ld	a,#16
8067  000b 42            	mul	x,a
8068  000c 9f            	ld	a,xl
8069  000d 1a03          	or	a,(OFST+2,sp)
8070  000f 6b01          	ld	(OFST+0,sp),a
8072  0011 c652ba        	ld	a,21178
8073  0014 a40c          	and	a,#12
8074  0016 1a01          	or	a,(OFST+0,sp)
8075  0018 c752ba        	ld	21178,a
8076                     ; 2672   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8078  001b 0d02          	tnz	(OFST+1,sp)
8079  001d 2706          	jreq	L1124
8080                     ; 2674     TIM1->CCER1 |= TIM1_CCER1_CC2P;
8082  001f 721a52bd      	bset	21181,#5
8084  0023 2004          	jra	L3124
8085  0025               L1124:
8086                     ; 2678     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
8088  0025 721b52bd      	bres	21181,#5
8089  0029               L3124:
8090                     ; 2681   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
8092  0029 721852bd      	bset	21181,#4
8093                     ; 2682 }
8096  002d 5b03          	addw	sp,#3
8097  002f 81            	ret
8149                     ; 2698 static void TI3_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8149                     ; 2699 {
8150                     .text:	section	.text,new
8151  0000               L7_TI3_Config:
8153  0000 89            	pushw	x
8154  0001 88            	push	a
8155       00000001      OFST:	set	1
8158                     ; 2701   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
8160  0002 721152be      	bres	21182,#0
8161                     ; 2704   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8161                     ; 2705                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8163  0006 7b06          	ld	a,(OFST+5,sp)
8164  0008 97            	ld	xl,a
8165  0009 a610          	ld	a,#16
8166  000b 42            	mul	x,a
8167  000c 9f            	ld	a,xl
8168  000d 1a03          	or	a,(OFST+2,sp)
8169  000f 6b01          	ld	(OFST+0,sp),a
8171  0011 c652bb        	ld	a,21179
8172  0014 a40c          	and	a,#12
8173  0016 1a01          	or	a,(OFST+0,sp)
8174  0018 c752bb        	ld	21179,a
8175                     ; 2708   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8177  001b 0d02          	tnz	(OFST+1,sp)
8178  001d 2706          	jreq	L3424
8179                     ; 2710     TIM1->CCER2 |= TIM1_CCER2_CC3P;
8181  001f 721252be      	bset	21182,#1
8183  0023 2004          	jra	L5424
8184  0025               L3424:
8185                     ; 2714     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
8187  0025 721352be      	bres	21182,#1
8188  0029               L5424:
8189                     ; 2717   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
8191  0029 721052be      	bset	21182,#0
8192                     ; 2718 }
8195  002d 5b03          	addw	sp,#3
8196  002f 81            	ret
8248                     ; 2733 static void TI4_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8248                     ; 2734 {
8249                     .text:	section	.text,new
8250  0000               L11_TI4_Config:
8252  0000 89            	pushw	x
8253  0001 88            	push	a
8254       00000001      OFST:	set	1
8257                     ; 2737   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
8259  0002 721952be      	bres	21182,#4
8260                     ; 2740   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8260                     ; 2741                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8262  0006 7b06          	ld	a,(OFST+5,sp)
8263  0008 97            	ld	xl,a
8264  0009 a610          	ld	a,#16
8265  000b 42            	mul	x,a
8266  000c 9f            	ld	a,xl
8267  000d 1a03          	or	a,(OFST+2,sp)
8268  000f 6b01          	ld	(OFST+0,sp),a
8270  0011 c652bc        	ld	a,21180
8271  0014 a40c          	and	a,#12
8272  0016 1a01          	or	a,(OFST+0,sp)
8273  0018 c752bc        	ld	21180,a
8274                     ; 2744   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8276  001b 0d02          	tnz	(OFST+1,sp)
8277  001d 2706          	jreq	L5724
8278                     ; 2746     TIM1->CCER2 |= TIM1_CCER2_CC4P;
8280  001f 721a52be      	bset	21182,#5
8282  0023 2004          	jra	L7724
8283  0025               L5724:
8284                     ; 2750     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
8286  0025 721b52be      	bres	21182,#5
8287  0029               L7724:
8288                     ; 2754   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
8290  0029 721852be      	bset	21182,#4
8291                     ; 2755 }
8294  002d 5b03          	addw	sp,#3
8295  002f 81            	ret
8308                     	xdef	_TIM1_SelectHallSensor
8309                     	xdef	_TIM1_EncoderInterfaceConfig
8310                     	xdef	_TIM1_ETRConfig
8311                     	xdef	_TIM1_SelectMasterSlaveMode
8312                     	xdef	_TIM1_SelectSlaveMode
8313                     	xdef	_TIM1_SelectOutputTrigger
8314                     	xdef	_TIM1_SelectInputTrigger
8315                     	xdef	_TIM1_ETRClockMode2Config
8316                     	xdef	_TIM1_ETRClockMode1Config
8317                     	xdef	_TIM1_TIxExternalClockConfig
8318                     	xdef	_TIM1_InternalClockConfig
8319                     	xdef	_TIM1_SelectCCDMA
8320                     	xdef	_TIM1_DMACmd
8321                     	xdef	_TIM1_DMAConfig
8322                     	xdef	_TIM1_ClearITPendingBit
8323                     	xdef	_TIM1_GetITStatus
8324                     	xdef	_TIM1_ClearFlag
8325                     	xdef	_TIM1_GetFlagStatus
8326                     	xdef	_TIM1_GenerateEvent
8327                     	xdef	_TIM1_ITConfig
8328                     	xdef	_TIM1_SetIC4Prescaler
8329                     	xdef	_TIM1_SetIC3Prescaler
8330                     	xdef	_TIM1_SetIC2Prescaler
8331                     	xdef	_TIM1_SetIC1Prescaler
8332                     	xdef	_TIM1_GetCapture4
8333                     	xdef	_TIM1_GetCapture3
8334                     	xdef	_TIM1_GetCapture2
8335                     	xdef	_TIM1_GetCapture1
8336                     	xdef	_TIM1_PWMIConfig
8337                     	xdef	_TIM1_ICInit
8338                     	xdef	_TIM1_CCxNCmd
8339                     	xdef	_TIM1_CCxCmd
8340                     	xdef	_TIM1_SelectCOM
8341                     	xdef	_TIM1_SelectOCREFClear
8342                     	xdef	_TIM1_OC3NPolarityConfig
8343                     	xdef	_TIM1_OC3PolarityConfig
8344                     	xdef	_TIM1_OC2NPolarityConfig
8345                     	xdef	_TIM1_OC2PolarityConfig
8346                     	xdef	_TIM1_OC1NPolarityConfig
8347                     	xdef	_TIM1_OC1PolarityConfig
8348                     	xdef	_TIM1_ClearOC4Ref
8349                     	xdef	_TIM1_ClearOC3Ref
8350                     	xdef	_TIM1_ClearOC2Ref
8351                     	xdef	_TIM1_ClearOC1Ref
8352                     	xdef	_TIM1_OC3FastConfig
8353                     	xdef	_TIM1_OC2FastConfig
8354                     	xdef	_TIM1_OC1FastConfig
8355                     	xdef	_TIM1_OC4PreloadConfig
8356                     	xdef	_TIM1_OC3PreloadConfig
8357                     	xdef	_TIM1_OC2PreloadConfig
8358                     	xdef	_TIM1_OC1PreloadConfig
8359                     	xdef	_TIM1_ForcedOC3Config
8360                     	xdef	_TIM1_ForcedOC2Config
8361                     	xdef	_TIM1_ForcedOC1Config
8362                     	xdef	_TIM1_CCPreloadControl
8363                     	xdef	_TIM1_SetCompare4
8364                     	xdef	_TIM1_SetCompare3
8365                     	xdef	_TIM1_SetCompare2
8366                     	xdef	_TIM1_SetCompare1
8367                     	xdef	_TIM1_SelectOCxM
8368                     	xdef	_TIM1_CtrlPWMOutputs
8369                     	xdef	_TIM1_BDTRConfig
8370                     	xdef	_TIM1_OC3Init
8371                     	xdef	_TIM1_OC2Init
8372                     	xdef	_TIM1_OC1Init
8373                     	xdef	_TIM1_Cmd
8374                     	xdef	_TIM1_SelectOnePulseMode
8375                     	xdef	_TIM1_ARRPreloadConfig
8376                     	xdef	_TIM1_UpdateRequestConfig
8377                     	xdef	_TIM1_UpdateDisableConfig
8378                     	xdef	_TIM1_GetPrescaler
8379                     	xdef	_TIM1_GetCounter
8380                     	xdef	_TIM1_SetAutoreload
8381                     	xdef	_TIM1_SetCounter
8382                     	xdef	_TIM1_CounterModeConfig
8383                     	xdef	_TIM1_PrescalerConfig
8384                     	xdef	_TIM1_TimeBaseInit
8385                     	xdef	_TIM1_DeInit
8404                     	end
