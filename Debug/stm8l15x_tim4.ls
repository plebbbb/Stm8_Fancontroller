   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  43                     ; 130 void TIM4_DeInit(void)
  43                     ; 131 {
  45                     .text:	section	.text,new
  46  0000               _TIM4_DeInit:
  50                     ; 132   TIM4->CR1   = TIM4_CR1_RESET_VALUE;
  52  0000 725f52e0      	clr	21216
  53                     ; 133   TIM4->CR2   = TIM4_CR2_RESET_VALUE;
  55  0004 725f52e1      	clr	21217
  56                     ; 134   TIM4->SMCR   = TIM4_SMCR_RESET_VALUE;
  58  0008 725f52e2      	clr	21218
  59                     ; 135   TIM4->IER   = TIM4_IER_RESET_VALUE;
  61  000c 725f52e4      	clr	21220
  62                     ; 136   TIM4->CNTR   = TIM4_CNTR_RESET_VALUE;
  64  0010 725f52e7      	clr	21223
  65                     ; 137   TIM4->PSCR  = TIM4_PSCR_RESET_VALUE;
  67  0014 725f52e8      	clr	21224
  68                     ; 138   TIM4->ARR   = TIM4_ARR_RESET_VALUE;
  70  0018 35ff52e9      	mov	21225,#255
  71                     ; 139   TIM4->SR1   = TIM4_SR1_RESET_VALUE;
  73  001c 725f52e5      	clr	21221
  74                     ; 140 }
  77  0020 81            	ret
 245                     ; 165 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
 245                     ; 166                        uint8_t TIM4_Period)
 245                     ; 167 {
 246                     .text:	section	.text,new
 247  0000               _TIM4_TimeBaseInit:
 251                     ; 169   assert_param(IS_TIM4_Prescaler(TIM4_Prescaler));
 253                     ; 171   TIM4->ARR = (uint8_t)(TIM4_Period);
 255  0000 9f            	ld	a,xl
 256  0001 c752e9        	ld	21225,a
 257                     ; 173   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 259  0004 9e            	ld	a,xh
 260  0005 c752e8        	ld	21224,a
 261                     ; 176   TIM4->EGR = TIM4_EventSource_Update;
 263  0008 350152e6      	mov	21222,#1
 264                     ; 177 }
 267  000c 81            	ret
 335                     ; 205 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler,
 335                     ; 206                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 335                     ; 207 {
 336                     .text:	section	.text,new
 337  0000               _TIM4_PrescalerConfig:
 341                     ; 209   assert_param(IS_TIM4_Prescaler_RELOAD(TIM4_PSCReloadMode));
 343                     ; 210   assert_param(IS_TIM4_Prescaler(Prescaler));
 345                     ; 213   TIM4->PSCR = (uint8_t) Prescaler;
 347  0000 9e            	ld	a,xh
 348  0001 c752e8        	ld	21224,a
 349                     ; 216   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
 351  0004 9f            	ld	a,xl
 352  0005 a101          	cp	a,#1
 353  0007 2606          	jrne	L141
 354                     ; 218     TIM4->EGR |= TIM4_EGR_UG ;
 356  0009 721052e6      	bset	21222,#0
 358  000d 2004          	jra	L341
 359  000f               L141:
 360                     ; 222     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
 362  000f 721152e6      	bres	21222,#0
 363  0013               L341:
 364                     ; 224 }
 367  0013 81            	ret
 401                     ; 232 void TIM4_SetCounter(uint8_t Counter)
 401                     ; 233 {
 402                     .text:	section	.text,new
 403  0000               _TIM4_SetCounter:
 407                     ; 235   TIM4->CNTR = (uint8_t)(Counter);
 409  0000 c752e7        	ld	21223,a
 410                     ; 236 }
 413  0003 81            	ret
 447                     ; 244 void TIM4_SetAutoreload(uint8_t Autoreload)
 447                     ; 245 {
 448                     .text:	section	.text,new
 449  0000               _TIM4_SetAutoreload:
 453                     ; 247   TIM4->ARR = (uint8_t)(Autoreload);
 455  0000 c752e9        	ld	21225,a
 456                     ; 248 }
 459  0003 81            	ret
 493                     ; 255 uint8_t TIM4_GetCounter(void)
 493                     ; 256 {
 494                     .text:	section	.text,new
 495  0000               _TIM4_GetCounter:
 497  0000 88            	push	a
 498       00000001      OFST:	set	1
 501                     ; 257   uint8_t tmpcntr = 0;
 503                     ; 258   tmpcntr = TIM4->CNTR;
 505  0001 c652e7        	ld	a,21223
 506  0004 6b01          	ld	(OFST+0,sp),a
 508                     ; 260   return ((uint8_t)tmpcntr);
 510  0006 7b01          	ld	a,(OFST+0,sp)
 513  0008 5b01          	addw	sp,#1
 514  000a 81            	ret
 538                     ; 284 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 538                     ; 285 {
 539                     .text:	section	.text,new
 540  0000               _TIM4_GetPrescaler:
 544                     ; 287   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
 546  0000 c652e8        	ld	a,21224
 549  0003 81            	ret
 605                     ; 296 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 605                     ; 297 {
 606                     .text:	section	.text,new
 607  0000               _TIM4_UpdateDisableConfig:
 611                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 613                     ; 302   if (NewState != DISABLE)
 615  0000 4d            	tnz	a
 616  0001 2706          	jreq	L552
 617                     ; 304     TIM4->CR1 |= TIM4_CR1_UDIS ;
 619  0003 721252e0      	bset	21216,#1
 621  0007 2004          	jra	L752
 622  0009               L552:
 623                     ; 308     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 625  0009 721352e0      	bres	21216,#1
 626  000d               L752:
 627                     ; 310 }
 630  000d 81            	ret
 688                     ; 320 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 688                     ; 321 {
 689                     .text:	section	.text,new
 690  0000               _TIM4_UpdateRequestConfig:
 694                     ; 323   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 696                     ; 326   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 698  0000 a101          	cp	a,#1
 699  0002 2606          	jrne	L703
 700                     ; 328     TIM4->CR1 |= TIM4_CR1_URS ;
 702  0004 721452e0      	bset	21216,#2
 704  0008 2004          	jra	L113
 705  000a               L703:
 706                     ; 332     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 708  000a 721552e0      	bres	21216,#2
 709  000e               L113:
 710                     ; 334 }
 713  000e 81            	ret
 749                     ; 342 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 749                     ; 343 {
 750                     .text:	section	.text,new
 751  0000               _TIM4_ARRPreloadConfig:
 755                     ; 345   assert_param(IS_FUNCTIONAL_STATE(NewState));
 757                     ; 348   if (NewState != DISABLE)
 759  0000 4d            	tnz	a
 760  0001 2706          	jreq	L133
 761                     ; 350     TIM4->CR1 |= TIM4_CR1_ARPE ;
 763  0003 721e52e0      	bset	21216,#7
 765  0007 2004          	jra	L333
 766  0009               L133:
 767                     ; 354     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
 769  0009 721f52e0      	bres	21216,#7
 770  000d               L333:
 771                     ; 356 }
 774  000d 81            	ret
 831                     ; 366 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 831                     ; 367 {
 832                     .text:	section	.text,new
 833  0000               _TIM4_SelectOnePulseMode:
 837                     ; 369   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 839                     ; 372   if (TIM4_OPMode == TIM4_OPMode_Single)
 841  0000 a101          	cp	a,#1
 842  0002 2606          	jrne	L363
 843                     ; 374     TIM4->CR1 |= TIM4_CR1_OPM ;
 845  0004 721652e0      	bset	21216,#3
 847  0008 2004          	jra	L563
 848  000a               L363:
 849                     ; 378     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 851  000a 721752e0      	bres	21216,#3
 852  000e               L563:
 853                     ; 380 }
 856  000e 81            	ret
 891                     ; 388 void TIM4_Cmd(FunctionalState NewState)
 891                     ; 389 {
 892                     .text:	section	.text,new
 893  0000               _TIM4_Cmd:
 897                     ; 391   assert_param(IS_FUNCTIONAL_STATE(NewState));
 899                     ; 394   if (NewState != DISABLE)
 901  0000 4d            	tnz	a
 902  0001 2706          	jreq	L504
 903                     ; 396     TIM4->CR1 |= TIM4_CR1_CEN ;
 905  0003 721052e0      	bset	21216,#0
 907  0007 2004          	jra	L704
 908  0009               L504:
 909                     ; 400     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 911  0009 721152e0      	bres	21216,#0
 912  000d               L704:
 913                     ; 402 }
 916  000d 81            	ret
 981                     ; 430 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 981                     ; 431 {
 982                     .text:	section	.text,new
 983  0000               _TIM4_ITConfig:
 985  0000 89            	pushw	x
 986       00000000      OFST:	set	0
 989                     ; 433   assert_param(IS_TIM4_IT(TIM4_IT));
 991                     ; 434   assert_param(IS_FUNCTIONAL_STATE(NewState));
 993                     ; 436   if (NewState != DISABLE)
 995  0001 9f            	ld	a,xl
 996  0002 4d            	tnz	a
 997  0003 2709          	jreq	L344
 998                     ; 439     TIM4->IER |= (uint8_t)TIM4_IT;
1000  0005 9e            	ld	a,xh
1001  0006 ca52e4        	or	a,21220
1002  0009 c752e4        	ld	21220,a
1004  000c 2009          	jra	L544
1005  000e               L344:
1006                     ; 444     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
1008  000e 7b01          	ld	a,(OFST+1,sp)
1009  0010 43            	cpl	a
1010  0011 c452e4        	and	a,21220
1011  0014 c752e4        	ld	21220,a
1012  0017               L544:
1013                     ; 446 }
1016  0017 85            	popw	x
1017  0018 81            	ret
1074                     ; 456 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1074                     ; 457 {
1075                     .text:	section	.text,new
1076  0000               _TIM4_GenerateEvent:
1080                     ; 459   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
1082                     ; 462   TIM4->EGR |= (uint8_t)TIM4_EventSource;
1084  0000 ca52e6        	or	a,21222
1085  0003 c752e6        	ld	21222,a
1086                     ; 463 }
1089  0006 81            	ret
1175                     ; 474 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1175                     ; 475 {
1176                     .text:	section	.text,new
1177  0000               _TIM4_GetFlagStatus:
1179  0000 88            	push	a
1180       00000001      OFST:	set	1
1183                     ; 476   FlagStatus bitstatus = RESET;
1185                     ; 479   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
1187                     ; 481   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1189  0001 c452e5        	and	a,21221
1190  0004 2706          	jreq	L735
1191                     ; 483     bitstatus = SET;
1193  0006 a601          	ld	a,#1
1194  0008 6b01          	ld	(OFST+0,sp),a
1197  000a 2002          	jra	L145
1198  000c               L735:
1199                     ; 487     bitstatus = RESET;
1201  000c 0f01          	clr	(OFST+0,sp)
1203  000e               L145:
1204                     ; 489   return ((FlagStatus)bitstatus);
1206  000e 7b01          	ld	a,(OFST+0,sp)
1209  0010 5b01          	addw	sp,#1
1210  0012 81            	ret
1245                     ; 500 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1245                     ; 501 {
1246                     .text:	section	.text,new
1247  0000               _TIM4_ClearFlag:
1251                     ; 503   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1253                     ; 505   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1255  0000 43            	cpl	a
1256  0001 c752e5        	ld	21221,a
1257                     ; 506 }
1260  0004 81            	ret
1324                     ; 518 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1324                     ; 519 {
1325                     .text:	section	.text,new
1326  0000               _TIM4_GetITStatus:
1328  0000 88            	push	a
1329  0001 89            	pushw	x
1330       00000002      OFST:	set	2
1333                     ; 520   ITStatus bitstatus = RESET;
1335                     ; 522   uint8_t itStatus = 0x0, itEnable = 0x0;
1339                     ; 525   assert_param(IS_TIM4_GET_IT(TIM4_IT));
1341                     ; 527   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1343  0002 c452e5        	and	a,21221
1344  0005 6b01          	ld	(OFST-1,sp),a
1346                     ; 529   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1348  0007 c652e4        	ld	a,21220
1349  000a 1403          	and	a,(OFST+1,sp)
1350  000c 6b02          	ld	(OFST+0,sp),a
1352                     ; 531   if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
1354  000e 0d01          	tnz	(OFST-1,sp)
1355  0010 270a          	jreq	L316
1357  0012 0d02          	tnz	(OFST+0,sp)
1358  0014 2706          	jreq	L316
1359                     ; 533     bitstatus = (ITStatus)SET;
1361  0016 a601          	ld	a,#1
1362  0018 6b02          	ld	(OFST+0,sp),a
1365  001a 2002          	jra	L516
1366  001c               L316:
1367                     ; 537     bitstatus = (ITStatus)RESET;
1369  001c 0f02          	clr	(OFST+0,sp)
1371  001e               L516:
1372                     ; 539   return ((ITStatus)bitstatus);
1374  001e 7b02          	ld	a,(OFST+0,sp)
1377  0020 5b03          	addw	sp,#3
1378  0022 81            	ret
1414                     ; 550 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1414                     ; 551 {
1415                     .text:	section	.text,new
1416  0000               _TIM4_ClearITPendingBit:
1420                     ; 553   assert_param(IS_TIM4_IT(TIM4_IT));
1422                     ; 556   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1424  0000 43            	cpl	a
1425  0001 c752e5        	ld	21221,a
1426                     ; 557 }
1429  0004 81            	ret
1488                     ; 568 void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
1488                     ; 569 {
1489                     .text:	section	.text,new
1490  0000               _TIM4_DMACmd:
1492  0000 89            	pushw	x
1493       00000000      OFST:	set	0
1496                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
1498                     ; 572   assert_param(IS_TIM4_DMA_SOURCE(TIM4_DMASource));
1500                     ; 574   if (NewState != DISABLE)
1502  0001 9f            	ld	a,xl
1503  0002 4d            	tnz	a
1504  0003 2709          	jreq	L566
1505                     ; 577     TIM4->DER |= (uint8_t)TIM4_DMASource;
1507  0005 9e            	ld	a,xh
1508  0006 ca52e3        	or	a,21219
1509  0009 c752e3        	ld	21219,a
1511  000c 2009          	jra	L766
1512  000e               L566:
1513                     ; 582     TIM4->DER &= (uint8_t)~TIM4_DMASource;
1515  000e 7b01          	ld	a,(OFST+1,sp)
1516  0010 43            	cpl	a
1517  0011 c452e3        	and	a,21219
1518  0014 c752e3        	ld	21219,a
1519  0017               L766:
1520                     ; 584 }
1523  0017 85            	popw	x
1524  0018 81            	ret
1548                     ; 607 void TIM4_InternalClockConfig(void)
1548                     ; 608 {
1549                     .text:	section	.text,new
1550  0000               _TIM4_InternalClockConfig:
1554                     ; 610   TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
1556  0000 c652e2        	ld	a,21218
1557  0003 a4f8          	and	a,#248
1558  0005 c752e2        	ld	21218,a
1559                     ; 611 }
1562  0008 81            	ret
1646                     ; 651 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
1646                     ; 652 {
1647                     .text:	section	.text,new
1648  0000               _TIM4_SelectInputTrigger:
1650  0000 88            	push	a
1651  0001 88            	push	a
1652       00000001      OFST:	set	1
1655                     ; 653   uint8_t tmpsmcr = 0;
1657                     ; 656   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
1659                     ; 658   tmpsmcr = TIM4->SMCR;
1661  0002 c652e2        	ld	a,21218
1662  0005 6b01          	ld	(OFST+0,sp),a
1664                     ; 661   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
1666  0007 7b01          	ld	a,(OFST+0,sp)
1667  0009 a48f          	and	a,#143
1668  000b 6b01          	ld	(OFST+0,sp),a
1670                     ; 662   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
1672  000d 7b01          	ld	a,(OFST+0,sp)
1673  000f 1a02          	or	a,(OFST+1,sp)
1674  0011 6b01          	ld	(OFST+0,sp),a
1676                     ; 664   TIM4->SMCR = (uint8_t)tmpsmcr;
1678  0013 7b01          	ld	a,(OFST+0,sp)
1679  0015 c752e2        	ld	21218,a
1680                     ; 665 }
1683  0018 85            	popw	x
1684  0019 81            	ret
1759                     ; 676 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
1759                     ; 677 {
1760                     .text:	section	.text,new
1761  0000               _TIM4_SelectOutputTrigger:
1763  0000 88            	push	a
1764  0001 88            	push	a
1765       00000001      OFST:	set	1
1768                     ; 678   uint8_t tmpcr2 = 0;
1770                     ; 681   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
1772                     ; 683   tmpcr2 = TIM4->CR2;
1774  0002 c652e1        	ld	a,21217
1775  0005 6b01          	ld	(OFST+0,sp),a
1777                     ; 686   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
1779  0007 7b01          	ld	a,(OFST+0,sp)
1780  0009 a48f          	and	a,#143
1781  000b 6b01          	ld	(OFST+0,sp),a
1783                     ; 689   tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
1785  000d 7b01          	ld	a,(OFST+0,sp)
1786  000f 1a02          	or	a,(OFST+1,sp)
1787  0011 6b01          	ld	(OFST+0,sp),a
1789                     ; 691   TIM4->CR2 = tmpcr2;
1791  0013 7b01          	ld	a,(OFST+0,sp)
1792  0015 c752e1        	ld	21217,a
1793                     ; 692 }
1796  0018 85            	popw	x
1797  0019 81            	ret
1888                     ; 706 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1888                     ; 707 {
1889                     .text:	section	.text,new
1890  0000               _TIM4_SelectSlaveMode:
1892  0000 88            	push	a
1893  0001 88            	push	a
1894       00000001      OFST:	set	1
1897                     ; 708   uint8_t tmpsmcr = 0;
1899                     ; 711   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1901                     ; 713   tmpsmcr = TIM4->SMCR;
1903  0002 c652e2        	ld	a,21218
1904  0005 6b01          	ld	(OFST+0,sp),a
1906                     ; 716   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1908  0007 7b01          	ld	a,(OFST+0,sp)
1909  0009 a4f8          	and	a,#248
1910  000b 6b01          	ld	(OFST+0,sp),a
1912                     ; 719   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1914  000d 7b01          	ld	a,(OFST+0,sp)
1915  000f 1a02          	or	a,(OFST+1,sp)
1916  0011 6b01          	ld	(OFST+0,sp),a
1918                     ; 721   TIM4->SMCR = tmpsmcr;
1920  0013 7b01          	ld	a,(OFST+0,sp)
1921  0015 c752e2        	ld	21218,a
1922                     ; 722 }
1925  0018 85            	popw	x
1926  0019 81            	ret
1962                     ; 730 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1962                     ; 731 {
1963                     .text:	section	.text,new
1964  0000               _TIM4_SelectMasterSlaveMode:
1968                     ; 733   assert_param(IS_FUNCTIONAL_STATE(NewState));
1970                     ; 736   if (NewState != DISABLE)
1972  0000 4d            	tnz	a
1973  0001 2706          	jreq	L1501
1974                     ; 738     TIM4->SMCR |= TIM4_SMCR_MSM;
1976  0003 721e52e2      	bset	21218,#7
1978  0007 2004          	jra	L3501
1979  0009               L1501:
1980                     ; 742     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1982  0009 721f52e2      	bres	21218,#7
1983  000d               L3501:
1984                     ; 744 }
1987  000d 81            	ret
2000                     	xdef	_TIM4_SelectMasterSlaveMode
2001                     	xdef	_TIM4_SelectSlaveMode
2002                     	xdef	_TIM4_SelectOutputTrigger
2003                     	xdef	_TIM4_SelectInputTrigger
2004                     	xdef	_TIM4_InternalClockConfig
2005                     	xdef	_TIM4_DMACmd
2006                     	xdef	_TIM4_ClearITPendingBit
2007                     	xdef	_TIM4_GetITStatus
2008                     	xdef	_TIM4_ClearFlag
2009                     	xdef	_TIM4_GetFlagStatus
2010                     	xdef	_TIM4_GenerateEvent
2011                     	xdef	_TIM4_ITConfig
2012                     	xdef	_TIM4_Cmd
2013                     	xdef	_TIM4_SelectOnePulseMode
2014                     	xdef	_TIM4_ARRPreloadConfig
2015                     	xdef	_TIM4_UpdateRequestConfig
2016                     	xdef	_TIM4_UpdateDisableConfig
2017                     	xdef	_TIM4_GetPrescaler
2018                     	xdef	_TIM4_GetCounter
2019                     	xdef	_TIM4_SetAutoreload
2020                     	xdef	_TIM4_SetCounter
2021                     	xdef	_TIM4_PrescalerConfig
2022                     	xdef	_TIM4_TimeBaseInit
2023                     	xdef	_TIM4_DeInit
2042                     	end
