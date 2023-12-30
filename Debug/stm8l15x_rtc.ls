   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  96                     ; 232 ErrorStatus RTC_DeInit(void)
  96                     ; 233 {
  98                     .text:	section	.text,new
  99  0000               _RTC_DeInit:
 101  0000 5205          	subw	sp,#5
 102       00000005      OFST:	set	5
 105                     ; 234   ErrorStatus status = ERROR;
 107                     ; 235   uint16_t wutwfcount = 0;
 109  0002 5f            	clrw	x
 110  0003 1f02          	ldw	(OFST-3,sp),x
 112                     ; 236   uint16_t recalpfcount = 0;
 114  0005 5f            	clrw	x
 115  0006 1f04          	ldw	(OFST-1,sp),x
 117                     ; 239   RTC->WPR = 0xCA;
 119  0008 35ca5159      	mov	20825,#202
 120                     ; 240   RTC->WPR = 0x53;
 122  000c 35535159      	mov	20825,#83
 123                     ; 243   if (RTC_EnterInitMode() == ERROR)
 125  0010 cd0000        	call	_RTC_EnterInitMode
 127  0013 4d            	tnz	a
 128  0014 260b          	jrne	L35
 129                     ; 245     status = ERROR;
 131  0016 0f01          	clr	(OFST-4,sp)
 133                     ; 247     RTC->WPR = 0xFF; 
 135  0018 35ff5159      	mov	20825,#255
 137  001c               L55:
 138                     ; 343   return (ErrorStatus)status;
 140  001c 7b01          	ld	a,(OFST-4,sp)
 143  001e 5b05          	addw	sp,#5
 144  0020 81            	ret
 145  0021               L35:
 146                     ; 252     RTC->TR1 = RTC_TR1_RESET_VALUE;
 148  0021 725f5140      	clr	20800
 149                     ; 253     RTC->TR2 = RTC_TR2_RESET_VALUE;
 151  0025 725f5141      	clr	20801
 152                     ; 254     RTC->TR3 = RTC_TR3_RESET_VALUE;
 154  0029 725f5142      	clr	20802
 155                     ; 257     RTC->DR1 = RTC_DR1_RESET_VALUE;
 157  002d 35015144      	mov	20804,#1
 158                     ; 258     RTC->DR2 = RTC_DR2_RESET_VALUE;
 160  0031 35215145      	mov	20805,#33
 161                     ; 259     RTC->DR3 = RTC_DR3_RESET_VALUE;
 163  0035 725f5146      	clr	20806
 164                     ; 262     RTC->SPRERH = RTC_SPRERH_RESET_VALUE;
 166  0039 725f5150      	clr	20816
 167                     ; 263     RTC->SPRERL = RTC_SPRERL_RESET_VALUE;
 169  003d 35ff5151      	mov	20817,#255
 170                     ; 264     RTC->APRER  = RTC_APRER_RESET_VALUE;
 172  0041 357f5152      	mov	20818,#127
 173                     ; 266     RTC->TCR1 = RTC_TCR1_RESET_VALUE;
 175  0045 725f516c      	clr	20844
 176                     ; 267     RTC->TCR2 = RTC_TCR2_RESET_VALUE;
 178  0049 725f516d      	clr	20845
 179                     ; 271     RTC->CR1 = RTC_CR1_RESET_VALUE;
 181  004d 725f5148      	clr	20808
 182                     ; 272     RTC->CR2 = RTC_CR2_RESET_VALUE;
 184  0051 725f5149      	clr	20809
 185                     ; 273     RTC->CR3 = RTC_CR3_RESET_VALUE;
 187  0055 725f514a      	clr	20810
 189  0059 200b          	jra	L36
 190  005b               L75:
 191                     ; 278       wutwfcount++;
 193  005b 1e02          	ldw	x,(OFST-3,sp)
 194  005d 1c0001        	addw	x,#1
 195  0060 1f02          	ldw	(OFST-3,sp),x
 197                     ; 279       RTC->ISR1 = 0;
 199  0062 725f514c      	clr	20812
 200  0066               L36:
 201                     ; 276     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
 203  0066 c6514c        	ld	a,20812
 204  0069 a504          	bcp	a,#4
 205  006b 2607          	jrne	L76
 207  006d 1e02          	ldw	x,(OFST-3,sp)
 208  006f a3ffff        	cpw	x,#65535
 209  0072 26e7          	jrne	L75
 210  0074               L76:
 211                     ; 282     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
 213  0074 c6514c        	ld	a,20812
 214  0077 a504          	bcp	a,#4
 215  0079 2608          	jrne	L17
 216                     ; 284       status = ERROR;
 218  007b 0f01          	clr	(OFST-4,sp)
 220                     ; 286       RTC->WPR = 0xFF; 
 222  007d 35ff5159      	mov	20825,#255
 224  0081 2099          	jra	L55
 225  0083               L17:
 226                     ; 291       RTC->CR1 = RTC_CR1_RESET_VALUE;
 228  0083 725f5148      	clr	20808
 229                     ; 294       RTC->WUTRH = RTC_WUTRH_RESET_VALUE;
 231  0087 35ff5154      	mov	20820,#255
 232                     ; 295       RTC->WUTRL = RTC_WUTRL_RESET_VALUE;
 234  008b 35ff5155      	mov	20821,#255
 235                     ; 298       RTC->ALRMAR1 = RTC_ALRMAR1_RESET_VALUE;
 237  008f 725f515c      	clr	20828
 238                     ; 299       RTC->ALRMAR2 = RTC_ALRMAR2_RESET_VALUE;
 240  0093 725f515d      	clr	20829
 241                     ; 300       RTC->ALRMAR3 = RTC_ALRMAR3_RESET_VALUE;
 243  0097 725f515e      	clr	20830
 244                     ; 301       RTC->ALRMAR4 = RTC_ALRMAR4_RESET_VALUE;
 246  009b 725f515f      	clr	20831
 247                     ; 303       RTC->ALRMASSRH = RTC_ALRMASSRH_RESET_VALUE;
 249  009f 725f5164      	clr	20836
 250                     ; 304       RTC->ALRMASSRL = RTC_ALRMASSRL_RESET_VALUE;
 252  00a3 725f5165      	clr	20837
 253                     ; 305       RTC->ALRMASSMSKR = RTC_ALRMASSMSKR_RESET_VALUE;
 255  00a7 725f5166      	clr	20838
 256                     ; 308       RTC->ISR1 = (uint8_t)0x00;
 258  00ab 725f514c      	clr	20812
 259                     ; 309       RTC->ISR2 = RTC_ISR2_RESET_VALUE;
 261  00af 725f514d      	clr	20813
 262                     ; 311       if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
 264  00b3 c6514c        	ld	a,20812
 265  00b6 a502          	bcp	a,#2
 266  00b8 2717          	jreq	L57
 268  00ba 2007          	jra	L101
 269  00bc               L77:
 270                     ; 315           recalpfcount++;
 272  00bc 1e04          	ldw	x,(OFST-1,sp)
 273  00be 1c0001        	addw	x,#1
 274  00c1 1f04          	ldw	(OFST-1,sp),x
 276  00c3               L101:
 277                     ; 313         while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
 279  00c3 c6514c        	ld	a,20812
 280  00c6 a502          	bcp	a,#2
 281  00c8 2707          	jreq	L57
 283  00ca 1e04          	ldw	x,(OFST-1,sp)
 284  00cc a3ffff        	cpw	x,#65535
 285  00cf 26eb          	jrne	L77
 286  00d1               L57:
 287                     ; 318       if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
 289  00d1 c6514c        	ld	a,20812
 290  00d4 a502          	bcp	a,#2
 291  00d6 2618          	jrne	L701
 292                     ; 320         RTC->CALRH = RTC_CALRH_RESET_VALUE;
 294  00d8 725f516a      	clr	20842
 295                     ; 321         RTC->CALRL = RTC_CALRL_RESET_VALUE;
 297  00dc 725f516b      	clr	20843
 298                     ; 323         if (RTC_WaitForSynchro() == ERROR)
 300  00e0 cd0000        	call	_RTC_WaitForSynchro
 302  00e3 4d            	tnz	a
 303  00e4 2604          	jrne	L111
 304                     ; 325           status = ERROR;
 306  00e6 0f01          	clr	(OFST-4,sp)
 309  00e8 2008          	jra	L511
 310  00ea               L111:
 311                     ; 329           status = SUCCESS;
 313  00ea a601          	ld	a,#1
 314  00ec 6b01          	ld	(OFST-4,sp),a
 316  00ee 2002          	jra	L511
 317  00f0               L701:
 318                     ; 334         status = ERROR;
 320  00f0 0f01          	clr	(OFST-4,sp)
 322  00f2               L511:
 323                     ; 338       RTC->WPR = 0xFF; 
 325  00f2 35ff5159      	mov	20825,#255
 326  00f6 ac1c001c      	jpf	L55
 426                     ; 359 ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct)
 426                     ; 360 {
 427                     .text:	section	.text,new
 428  0000               _RTC_Init:
 430  0000 89            	pushw	x
 431  0001 88            	push	a
 432       00000001      OFST:	set	1
 435                     ; 361   ErrorStatus status = ERROR;
 437                     ; 364   assert_param(IS_RTC_HOUR_FORMAT(RTC_InitStruct->RTC_HourFormat));
 439                     ; 365   assert_param(IS_RTC_ASYNCH_PREDIV(RTC_InitStruct->RTC_AsynchPrediv));
 441                     ; 366   assert_param(IS_RTC_SYNCH_PREDIV(RTC_InitStruct->RTC_SynchPrediv));
 443                     ; 369   RTC->WPR = 0xCA;
 445  0002 35ca5159      	mov	20825,#202
 446                     ; 370   RTC->WPR = 0x53;
 448  0006 35535159      	mov	20825,#83
 449                     ; 373   if (RTC_EnterInitMode() == ERROR)
 451  000a cd0000        	call	_RTC_EnterInitMode
 453  000d 4d            	tnz	a
 454  000e 2604          	jrne	L761
 455                     ; 375     status = ERROR;
 457  0010 0f01          	clr	(OFST+0,sp)
 460  0012 202d          	jra	L171
 461  0014               L761:
 462                     ; 380     RTC->CR1 &= ((uint8_t)~( RTC_CR1_FMT ));
 464  0014 721d5148      	bres	20808,#6
 465                     ; 383     RTC->CR1 |=  ((uint8_t)(RTC_InitStruct->RTC_HourFormat));
 467  0018 1e02          	ldw	x,(OFST+1,sp)
 468  001a c65148        	ld	a,20808
 469  001d fa            	or	a,(x)
 470  001e c75148        	ld	20808,a
 471                     ; 386     RTC->SPRERH = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv >> 8);
 473  0021 1e02          	ldw	x,(OFST+1,sp)
 474  0023 ee02          	ldw	x,(2,x)
 475  0025 4f            	clr	a
 476  0026 01            	rrwa	x,a
 477  0027 9f            	ld	a,xl
 478  0028 c75150        	ld	20816,a
 479                     ; 387     RTC->SPRERL = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv);
 481  002b 1e02          	ldw	x,(OFST+1,sp)
 482  002d e603          	ld	a,(3,x)
 483  002f c75151        	ld	20817,a
 484                     ; 388     RTC->APRER =  (uint8_t)(RTC_InitStruct->RTC_AsynchPrediv);
 486  0032 1e02          	ldw	x,(OFST+1,sp)
 487  0034 e601          	ld	a,(1,x)
 488  0036 c75152        	ld	20818,a
 489                     ; 391     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 491  0039 721f514c      	bres	20812,#7
 492                     ; 393     status = SUCCESS;
 494  003d a601          	ld	a,#1
 495  003f 6b01          	ld	(OFST+0,sp),a
 497  0041               L171:
 498                     ; 397   RTC->WPR = 0xFF; 
 500  0041 35ff5159      	mov	20825,#255
 501                     ; 400   return (ErrorStatus)(status);
 503  0045 7b01          	ld	a,(OFST+0,sp)
 506  0047 5b03          	addw	sp,#3
 507  0049 81            	ret
 544                     ; 410 void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct)
 544                     ; 411 {
 545                     .text:	section	.text,new
 546  0000               _RTC_StructInit:
 550                     ; 413   RTC_InitStruct->RTC_HourFormat = RTC_HourFormat_24;
 552  0000 7f            	clr	(x)
 553                     ; 416   RTC_InitStruct->RTC_AsynchPrediv = RTC_APRER_RESET_VALUE;
 555  0001 a67f          	ld	a,#127
 556  0003 e701          	ld	(1,x),a
 557                     ; 419   RTC_InitStruct->RTC_SynchPrediv = RTC_SPRERL_RESET_VALUE;
 559  0005 90ae00ff      	ldw	y,#255
 560  0009 ef02          	ldw	(2,x),y
 561                     ; 420 }
 564  000b 81            	ret
 620                     ; 430 void RTC_WriteProtectionCmd(FunctionalState NewState)
 620                     ; 431 {
 621                     .text:	section	.text,new
 622  0000               _RTC_WriteProtectionCmd:
 626                     ; 433   assert_param(IS_FUNCTIONAL_STATE(NewState));
 628                     ; 435   if (NewState != DISABLE)
 630  0000 4d            	tnz	a
 631  0001 2706          	jreq	L142
 632                     ; 438     RTC->WPR = RTC_WPR_EnableKey;
 634  0003 35ff5159      	mov	20825,#255
 636  0007 2008          	jra	L342
 637  0009               L142:
 638                     ; 443     RTC->WPR = RTC_WPR_DisableKey1;
 640  0009 35ca5159      	mov	20825,#202
 641                     ; 444     RTC->WPR = RTC_WPR_DisableKey2;
 643  000d 35535159      	mov	20825,#83
 644  0011               L342:
 645                     ; 446 }
 648  0011 81            	ret
 693                     ; 458 ErrorStatus RTC_EnterInitMode(void)
 693                     ; 459 {
 694                     .text:	section	.text,new
 695  0000               _RTC_EnterInitMode:
 697  0000 5203          	subw	sp,#3
 698       00000003      OFST:	set	3
 701                     ; 460   ErrorStatus status = ERROR;
 703                     ; 461   uint16_t initfcount = 0;
 705  0002 5f            	clrw	x
 706  0003 1f02          	ldw	(OFST-1,sp),x
 708                     ; 464   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 710  0005 c6514c        	ld	a,20812
 711  0008 a540          	bcp	a,#64
 712  000a 261b          	jrne	L762
 713                     ; 467     RTC->ISR1 = (uint8_t)RTC_ISR1_INIT;
 715  000c 3580514c      	mov	20812,#128
 717  0010 2007          	jra	L572
 718  0012               L172:
 719                     ; 472       initfcount++;
 721  0012 1e02          	ldw	x,(OFST-1,sp)
 722  0014 1c0001        	addw	x,#1
 723  0017 1f02          	ldw	(OFST-1,sp),x
 725  0019               L572:
 726                     ; 470     while (((RTC->ISR1 & RTC_ISR1_INITF) == RESET) && ( initfcount != INITF_TIMEOUT))
 728  0019 c6514c        	ld	a,20812
 729  001c a540          	bcp	a,#64
 730  001e 2607          	jrne	L762
 732  0020 1e02          	ldw	x,(OFST-1,sp)
 733  0022 a3ffff        	cpw	x,#65535
 734  0025 26eb          	jrne	L172
 735  0027               L762:
 736                     ; 476   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 738  0027 c6514c        	ld	a,20812
 739  002a a540          	bcp	a,#64
 740  002c 2604          	jrne	L303
 741                     ; 478     status = ERROR;
 743  002e 0f01          	clr	(OFST-2,sp)
 746  0030 2004          	jra	L503
 747  0032               L303:
 748                     ; 482     status = SUCCESS;
 750  0032 a601          	ld	a,#1
 751  0034 6b01          	ld	(OFST-2,sp),a
 753  0036               L503:
 754                     ; 485   return (ErrorStatus)status;
 756  0036 7b01          	ld	a,(OFST-2,sp)
 759  0038 5b03          	addw	sp,#3
 760  003a 81            	ret
 783                     ; 498 void RTC_ExitInitMode(void)
 783                     ; 499 {
 784                     .text:	section	.text,new
 785  0000               _RTC_ExitInitMode:
 789                     ; 501   RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 791  0000 721f514c      	bres	20812,#7
 792                     ; 502 }
 795  0004 81            	ret
 840                     ; 527 ErrorStatus RTC_WaitForSynchro(void)
 840                     ; 528 {
 841                     .text:	section	.text,new
 842  0000               _RTC_WaitForSynchro:
 844  0000 5203          	subw	sp,#3
 845       00000003      OFST:	set	3
 848                     ; 529   uint16_t rsfcount = 0;
 850  0002 5f            	clrw	x
 851  0003 1f02          	ldw	(OFST-1,sp),x
 853                     ; 530   ErrorStatus status = ERROR;
 855                     ; 533   RTC->WPR = 0xCA;
 857  0005 35ca5159      	mov	20825,#202
 858                     ; 534   RTC->WPR = 0x53;
 860  0009 35535159      	mov	20825,#83
 861                     ; 537   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF | RTC_ISR1_INIT);
 863  000d c6514c        	ld	a,20812
 864  0010 a45f          	and	a,#95
 865  0012 c7514c        	ld	20812,a
 867  0015 2007          	jra	L343
 868  0017               L143:
 869                     ; 542     rsfcount++;
 871  0017 1e02          	ldw	x,(OFST-1,sp)
 872  0019 1c0001        	addw	x,#1
 873  001c 1f02          	ldw	(OFST-1,sp),x
 875  001e               L343:
 876                     ; 540   while (((RTC->ISR1 & RTC_ISR1_RSF) == RESET) && ( rsfcount != RSF_TIMEOUT))
 878  001e c6514c        	ld	a,20812
 879  0021 a520          	bcp	a,#32
 880  0023 2607          	jrne	L743
 882  0025 1e02          	ldw	x,(OFST-1,sp)
 883  0027 a3ffff        	cpw	x,#65535
 884  002a 26eb          	jrne	L143
 885  002c               L743:
 886                     ; 546   if ((RTC->ISR1 & RTC_ISR1_RSF) != RESET)
 888  002c c6514c        	ld	a,20812
 889  002f a520          	bcp	a,#32
 890  0031 2706          	jreq	L153
 891                     ; 548     status = SUCCESS;
 893  0033 a601          	ld	a,#1
 894  0035 6b01          	ld	(OFST-2,sp),a
 897  0037 2002          	jra	L353
 898  0039               L153:
 899                     ; 552     status = ERROR;
 901  0039 0f01          	clr	(OFST-2,sp)
 903  003b               L353:
 904                     ; 556   RTC->WPR = 0xFF; 
 906  003b 35ff5159      	mov	20825,#255
 907                     ; 558   return (ErrorStatus)status;
 909  003f 7b01          	ld	a,(OFST-2,sp)
 912  0041 5b03          	addw	sp,#3
 913  0043 81            	ret
 948                     ; 568 void RTC_RatioCmd(FunctionalState NewState)
 948                     ; 569 {
 949                     .text:	section	.text,new
 950  0000               _RTC_RatioCmd:
 954                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
 956                     ; 574   RTC->WPR = 0xCA;
 958  0000 35ca5159      	mov	20825,#202
 959                     ; 575   RTC->WPR = 0x53;
 961  0004 35535159      	mov	20825,#83
 962                     ; 577   if (NewState != DISABLE)
 964  0008 4d            	tnz	a
 965  0009 2706          	jreq	L373
 966                     ; 580     RTC->CR1 |= (uint8_t)RTC_CR1_RATIO;
 968  000b 721a5148      	bset	20808,#5
 970  000f 2004          	jra	L573
 971  0011               L373:
 972                     ; 585     RTC->CR1 &= (uint8_t)~RTC_CR1_RATIO;
 974  0011 721b5148      	bres	20808,#5
 975  0015               L573:
 976                     ; 589   RTC->WPR = 0xFF; 
 978  0015 35ff5159      	mov	20825,#255
 979                     ; 590 }
 982  0019 81            	ret
1018                     ; 598 void RTC_BypassShadowCmd(FunctionalState NewState)
1018                     ; 599 {
1019                     .text:	section	.text,new
1020  0000               _RTC_BypassShadowCmd:
1024                     ; 601   assert_param(IS_FUNCTIONAL_STATE(NewState));
1026                     ; 604   RTC->WPR = 0xCA;
1028  0000 35ca5159      	mov	20825,#202
1029                     ; 605   RTC->WPR = 0x53;
1031  0004 35535159      	mov	20825,#83
1032                     ; 607   if (NewState != DISABLE)
1034  0008 4d            	tnz	a
1035  0009 2706          	jreq	L514
1036                     ; 610     RTC->CR1 |= (uint8_t)RTC_CR1_BYPSHAD;
1038  000b 72185148      	bset	20808,#4
1040  000f 2004          	jra	L714
1041  0011               L514:
1042                     ; 615     RTC->CR1 &= (uint8_t)~RTC_CR1_BYPSHAD;
1044  0011 72195148      	bres	20808,#4
1045  0015               L714:
1046                     ; 619   RTC->WPR = 0xFF; 
1048  0015 35ff5159      	mov	20825,#255
1049                     ; 620 }
1052  0019 81            	ret
1200                     ; 659 ErrorStatus RTC_SetTime(RTC_Format_TypeDef RTC_Format,
1200                     ; 660                         RTC_TimeTypeDef* RTC_TimeStruct)
1200                     ; 661 {
1201                     .text:	section	.text,new
1202  0000               _RTC_SetTime:
1204  0000 88            	push	a
1205  0001 88            	push	a
1206       00000001      OFST:	set	1
1209                     ; 662   ErrorStatus status = ERROR;
1211                     ; 663   uint8_t temp = 0;
1213                     ; 666   assert_param(IS_RTC_FORMAT(RTC_Format));
1215                     ; 668   if (RTC_Format == RTC_Format_BIN)
1217  0002 4d            	tnz	a
1218  0003 2609          	jrne	L315
1219                     ; 671     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1221  0005 c65148        	ld	a,20808
1222  0008 a540          	bcp	a,#64
1223  000a 2700          	jreq	L515
1224                     ; 673       assert_param(IS_RTC_HOUR12_MAX(RTC_TimeStruct->RTC_Hours));
1226                     ; 674       assert_param(IS_RTC_HOUR12_MIN(RTC_TimeStruct->RTC_Hours));
1229  000c               L515:
1230                     ; 678       assert_param(IS_RTC_HOUR24(RTC_TimeStruct->RTC_Hours));
1232                     ; 680     assert_param(IS_RTC_MINUTES(RTC_TimeStruct->RTC_Minutes));
1234                     ; 681     assert_param(IS_RTC_SECONDS(RTC_TimeStruct->RTC_Seconds));
1237  000c 2007          	jra	L125
1238  000e               L315:
1239                     ; 686     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1241  000e c65148        	ld	a,20808
1242  0011 a540          	bcp	a,#64
1243  0013 2700          	jreq	L325
1244                     ; 688       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1246                     ; 689       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1249  0015               L325:
1250                     ; 693       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1252                     ; 695     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_TimeStruct->RTC_Minutes)));
1254                     ; 696     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_TimeStruct->RTC_Seconds)));
1256  0015               L125:
1257                     ; 701   RTC->WPR = 0xCA;
1259  0015 35ca5159      	mov	20825,#202
1260                     ; 702   RTC->WPR = 0x53;
1262  0019 35535159      	mov	20825,#83
1263                     ; 705   if (RTC_EnterInitMode() == ERROR)
1265  001d cd0000        	call	_RTC_EnterInitMode
1267  0020 4d            	tnz	a
1268  0021 2608          	jrne	L725
1269                     ; 707     status = ERROR;
1271  0023 0f01          	clr	(OFST+0,sp)
1273                     ; 709     RTC->WPR = 0xFF; 
1275  0025 35ff5159      	mov	20825,#255
1277  0029 2072          	jra	L135
1278  002b               L725:
1279                     ; 714     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1281  002b c65148        	ld	a,20808
1282  002e a540          	bcp	a,#64
1283  0030 2708          	jreq	L335
1284                     ; 716       assert_param(IS_RTC_H12(RTC_TimeStruct->RTC_H12));
1286                     ; 717       temp = RTC_TimeStruct->RTC_H12;
1288  0032 1e05          	ldw	x,(OFST+4,sp)
1289  0034 e603          	ld	a,(3,x)
1290  0036 6b01          	ld	(OFST+0,sp),a
1293  0038 2002          	jra	L535
1294  003a               L335:
1295                     ; 721       temp = 0;
1297  003a 0f01          	clr	(OFST+0,sp)
1299  003c               L535:
1300                     ; 724     if (RTC_Format != RTC_Format_BIN)
1302  003c 0d02          	tnz	(OFST+1,sp)
1303  003e 2718          	jreq	L735
1304                     ; 726       RTC->TR1 = (uint8_t)(RTC_TimeStruct->RTC_Seconds);
1306  0040 1e05          	ldw	x,(OFST+4,sp)
1307  0042 e602          	ld	a,(2,x)
1308  0044 c75140        	ld	20800,a
1309                     ; 727       RTC->TR2 = (uint8_t)(RTC_TimeStruct->RTC_Minutes) ;
1311  0047 1e05          	ldw	x,(OFST+4,sp)
1312  0049 e601          	ld	a,(1,x)
1313  004b c75141        	ld	20801,a
1314                     ; 728       RTC->TR3 = (uint8_t)( temp | RTC_TimeStruct->RTC_Hours) ;
1316  004e 1e05          	ldw	x,(OFST+4,sp)
1317  0050 f6            	ld	a,(x)
1318  0051 1a01          	or	a,(OFST+0,sp)
1319  0053 c75142        	ld	20802,a
1321  0056 201f          	jra	L145
1322  0058               L735:
1323                     ; 732       RTC->TR1 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Seconds));
1325  0058 1e05          	ldw	x,(OFST+4,sp)
1326  005a e602          	ld	a,(2,x)
1327  005c cd0000        	call	L3_ByteToBcd2
1329  005f c75140        	ld	20800,a
1330                     ; 733       RTC->TR2 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Minutes)) ;
1332  0062 1e05          	ldw	x,(OFST+4,sp)
1333  0064 e601          	ld	a,(1,x)
1334  0066 cd0000        	call	L3_ByteToBcd2
1336  0069 c75141        	ld	20801,a
1337                     ; 734       RTC->TR3 = (uint8_t)( temp | ByteToBcd2(RTC_TimeStruct->RTC_Hours));
1339  006c 1e05          	ldw	x,(OFST+4,sp)
1340  006e f6            	ld	a,(x)
1341  006f cd0000        	call	L3_ByteToBcd2
1343  0072 1a01          	or	a,(OFST+0,sp)
1344  0074 c75142        	ld	20802,a
1345  0077               L145:
1346                     ; 737     (void)(RTC->DR3);
1348  0077 c65146        	ld	a,20806
1349                     ; 740     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1351  007a 721f514c      	bres	20812,#7
1352                     ; 743     RTC->WPR = 0xFF; 
1354  007e 35ff5159      	mov	20825,#255
1355                     ; 746     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
1357  0082 c65148        	ld	a,20808
1358  0085 a510          	bcp	a,#16
1359  0087 2610          	jrne	L345
1360                     ; 748       if (RTC_WaitForSynchro() == ERROR)
1362  0089 cd0000        	call	_RTC_WaitForSynchro
1364  008c 4d            	tnz	a
1365  008d 2604          	jrne	L545
1366                     ; 750         status = ERROR;
1368  008f 0f01          	clr	(OFST+0,sp)
1371  0091 200a          	jra	L135
1372  0093               L545:
1373                     ; 754         status = SUCCESS;
1375  0093 a601          	ld	a,#1
1376  0095 6b01          	ld	(OFST+0,sp),a
1378  0097 2004          	jra	L135
1379  0099               L345:
1380                     ; 759       status = SUCCESS;
1382  0099 a601          	ld	a,#1
1383  009b 6b01          	ld	(OFST+0,sp),a
1385  009d               L135:
1386                     ; 763   return (ErrorStatus)status;
1388  009d 7b01          	ld	a,(OFST+0,sp)
1391  009f 85            	popw	x
1392  00a0 81            	ret
1429                     ; 775 void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct)
1429                     ; 776 {
1430                     .text:	section	.text,new
1431  0000               _RTC_TimeStructInit:
1435                     ; 778   RTC_TimeStruct->RTC_H12 = RTC_H12_AM;
1437  0000 6f03          	clr	(3,x)
1438                     ; 779   RTC_TimeStruct->RTC_Hours = 0;
1440  0002 7f            	clr	(x)
1441                     ; 780   RTC_TimeStruct->RTC_Minutes = 0;
1443  0003 6f01          	clr	(1,x)
1444                     ; 781   RTC_TimeStruct->RTC_Seconds = 0;
1446  0005 6f02          	clr	(2,x)
1447                     ; 782 }
1450  0007 81            	ret
1507                     ; 798 void RTC_GetTime(RTC_Format_TypeDef RTC_Format,
1507                     ; 799                  RTC_TimeTypeDef* RTC_TimeStruct)
1507                     ; 800 {
1508                     .text:	section	.text,new
1509  0000               _RTC_GetTime:
1511  0000 88            	push	a
1512  0001 88            	push	a
1513       00000001      OFST:	set	1
1516                     ; 801   uint8_t  tmpreg = 0;
1518                     ; 804   assert_param(IS_RTC_FORMAT(RTC_Format));
1520                     ; 808   RTC_TimeStruct->RTC_Seconds = RTC->TR1;
1522  0002 1e05          	ldw	x,(OFST+4,sp)
1523  0004 c65140        	ld	a,20800
1524  0007 e702          	ld	(2,x),a
1525                     ; 811   RTC_TimeStruct->RTC_Minutes = RTC->TR2;
1527  0009 1e05          	ldw	x,(OFST+4,sp)
1528  000b c65141        	ld	a,20801
1529  000e e701          	ld	(1,x),a
1530                     ; 814   tmpreg = (uint8_t)RTC->TR3;
1532  0010 c65142        	ld	a,20802
1533  0013 6b01          	ld	(OFST+0,sp),a
1535                     ; 817   (void) (RTC->DR3) ;
1537  0015 c65146        	ld	a,20806
1538                     ; 821   RTC_TimeStruct->RTC_Hours = (uint8_t)(tmpreg & (uint8_t)~(RTC_TR3_PM));
1540  0018 7b01          	ld	a,(OFST+0,sp)
1541  001a a4bf          	and	a,#191
1542  001c 1e05          	ldw	x,(OFST+4,sp)
1543  001e f7            	ld	(x),a
1544                     ; 824   RTC_TimeStruct->RTC_H12 = (RTC_H12_TypeDef)(tmpreg & RTC_TR3_PM);
1546  001f 7b01          	ld	a,(OFST+0,sp)
1547  0021 a440          	and	a,#64
1548  0023 1e05          	ldw	x,(OFST+4,sp)
1549  0025 e703          	ld	(3,x),a
1550                     ; 827   if (RTC_Format == RTC_Format_BIN)
1552  0027 0d02          	tnz	(OFST+1,sp)
1553  0029 261f          	jrne	L326
1554                     ; 830     RTC_TimeStruct->RTC_Hours = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
1556  002b 1e05          	ldw	x,(OFST+4,sp)
1557  002d f6            	ld	a,(x)
1558  002e cd0000        	call	L5_Bcd2ToByte
1560  0031 1e05          	ldw	x,(OFST+4,sp)
1561  0033 f7            	ld	(x),a
1562                     ; 831     RTC_TimeStruct->RTC_Minutes = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Minutes);
1564  0034 1e05          	ldw	x,(OFST+4,sp)
1565  0036 e601          	ld	a,(1,x)
1566  0038 cd0000        	call	L5_Bcd2ToByte
1568  003b 1e05          	ldw	x,(OFST+4,sp)
1569  003d e701          	ld	(1,x),a
1570                     ; 832     RTC_TimeStruct->RTC_Seconds = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Seconds);
1572  003f 1e05          	ldw	x,(OFST+4,sp)
1573  0041 e602          	ld	a,(2,x)
1574  0043 cd0000        	call	L5_Bcd2ToByte
1576  0046 1e05          	ldw	x,(OFST+4,sp)
1577  0048 e702          	ld	(2,x),a
1578  004a               L326:
1579                     ; 834 }
1582  004a 85            	popw	x
1583  004b 81            	ret
1635                     ; 845 uint16_t RTC_GetSubSecond(void)
1635                     ; 846 {
1636                     .text:	section	.text,new
1637  0000               _RTC_GetSubSecond:
1639  0000 5206          	subw	sp,#6
1640       00000006      OFST:	set	6
1643                     ; 847   uint8_t ssrhreg = 0, ssrlreg = 0;
1647                     ; 848   uint16_t ssrreg = 0;
1649                     ; 851   ssrhreg = RTC->SSRH;
1651  0002 c65157        	ld	a,20823
1652  0005 6b03          	ld	(OFST-3,sp),a
1654                     ; 852   ssrlreg = RTC->SSRL;
1656  0007 c65158        	ld	a,20824
1657  000a 6b04          	ld	(OFST-2,sp),a
1659                     ; 855   (void) (RTC->DR3);
1661  000c c65146        	ld	a,20806
1662                     ; 858   ssrreg = (uint16_t)((uint16_t)((uint16_t)ssrhreg << 8) | (uint16_t)(ssrlreg));
1664  000f 7b04          	ld	a,(OFST-2,sp)
1665  0011 5f            	clrw	x
1666  0012 97            	ld	xl,a
1667  0013 1f01          	ldw	(OFST-5,sp),x
1669  0015 7b03          	ld	a,(OFST-3,sp)
1670  0017 5f            	clrw	x
1671  0018 97            	ld	xl,a
1672  0019 4f            	clr	a
1673  001a 02            	rlwa	x,a
1674  001b 01            	rrwa	x,a
1675  001c 1a02          	or	a,(OFST-4,sp)
1676  001e 01            	rrwa	x,a
1677  001f 1a01          	or	a,(OFST-5,sp)
1678  0021 01            	rrwa	x,a
1679  0022 1f05          	ldw	(OFST-1,sp),x
1681                     ; 859   return (uint16_t)(ssrreg);
1683  0024 1e05          	ldw	x,(OFST-1,sp)
1686  0026 5b06          	addw	sp,#6
1687  0028 81            	ret
1939                     ; 876 ErrorStatus RTC_SetDate(RTC_Format_TypeDef RTC_Format,
1939                     ; 877                         RTC_DateTypeDef* RTC_DateStruct)
1939                     ; 878 {
1940                     .text:	section	.text,new
1941  0000               _RTC_SetDate:
1943  0000 88            	push	a
1944  0001 89            	pushw	x
1945       00000002      OFST:	set	2
1948                     ; 879   ErrorStatus status = ERROR;
1950                     ; 881   if ((RTC_Format == RTC_Format_BIN) && ((RTC_DateStruct->RTC_Month & TEN_VALUE_BCD) == TEN_VALUE_BCD))
1952  0002 4d            	tnz	a
1953  0003 2616          	jrne	L1001
1955  0005 1e06          	ldw	x,(OFST+4,sp)
1956  0007 e601          	ld	a,(1,x)
1957  0009 a410          	and	a,#16
1958  000b a110          	cp	a,#16
1959  000d 260c          	jrne	L1001
1960                     ; 883     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)((RTC_DateStruct->RTC_Month & (uint8_t)~(TEN_VALUE_BCD)) + TEN_VALUE_BIN);
1962  000f 1e06          	ldw	x,(OFST+4,sp)
1963  0011 e601          	ld	a,(1,x)
1964  0013 a4ef          	and	a,#239
1965  0015 ab0a          	add	a,#10
1966  0017 1e06          	ldw	x,(OFST+4,sp)
1967  0019 e701          	ld	(1,x),a
1968  001b               L1001:
1969                     ; 887   assert_param(IS_RTC_FORMAT(RTC_Format));
1971                     ; 888   if (RTC_Format == RTC_Format_BIN)
1973  001b 0d03          	tnz	(OFST+1,sp)
1974  001d 2600          	jrne	L3001
1975                     ; 890     assert_param(IS_RTC_YEAR(RTC_DateStruct->RTC_Year));
1977                     ; 891     assert_param(IS_RTC_MONTH_MIN(RTC_DateStruct->RTC_Month));
1979                     ; 892     assert_param(IS_RTC_MONTH_MAX(RTC_DateStruct->RTC_Month));
1981                     ; 893     assert_param(IS_RTC_DATE_MIN(RTC_DateStruct->RTC_Date));
1983                     ; 894     assert_param(IS_RTC_DATE_MAX(RTC_DateStruct->RTC_Date));
1986  001f               L3001:
1987                     ; 898     assert_param(IS_RTC_YEAR(Bcd2ToByte(RTC_DateStruct->RTC_Year)));
1989                     ; 899     assert_param(IS_RTC_MONTH_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1991                     ; 900     assert_param(IS_RTC_MONTH_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1993                     ; 901     assert_param(IS_RTC_DATE_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1995                     ; 902     assert_param(IS_RTC_DATE_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1997                     ; 904   assert_param(IS_RTC_WEEKDAY(RTC_DateStruct->RTC_WeekDay));
1999                     ; 907   RTC->WPR = 0xCA;
2001  001f 35ca5159      	mov	20825,#202
2002                     ; 908   RTC->WPR = 0x53;
2004  0023 35535159      	mov	20825,#83
2005                     ; 911   if (RTC_EnterInitMode() == ERROR)
2007  0027 cd0000        	call	_RTC_EnterInitMode
2009  002a 4d            	tnz	a
2010  002b 2608          	jrne	L7001
2011                     ; 913     status = ERROR;
2013  002d 0f02          	clr	(OFST+0,sp)
2015                     ; 915     RTC->WPR = 0xFF; 
2017  002f 35ff5159      	mov	20825,#255
2019  0033 2073          	jra	L1101
2020  0035               L7001:
2021                     ; 919     (void)(RTC->TR1);
2023  0035 c65140        	ld	a,20800
2024                     ; 922     if (RTC_Format != RTC_Format_BIN)
2026  0038 0d03          	tnz	(OFST+1,sp)
2027  003a 271f          	jreq	L3101
2028                     ; 924       RTC->DR1 = (uint8_t)(RTC_DateStruct->RTC_Date);
2030  003c 1e06          	ldw	x,(OFST+4,sp)
2031  003e e602          	ld	a,(2,x)
2032  0040 c75144        	ld	20804,a
2033                     ; 925       RTC->DR2 = (uint8_t)((RTC_DateStruct->RTC_Month) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
2035  0043 1e06          	ldw	x,(OFST+4,sp)
2036  0045 f6            	ld	a,(x)
2037  0046 97            	ld	xl,a
2038  0047 a620          	ld	a,#32
2039  0049 42            	mul	x,a
2040  004a 9f            	ld	a,xl
2041  004b 1e06          	ldw	x,(OFST+4,sp)
2042  004d ea01          	or	a,(1,x)
2043  004f c75145        	ld	20805,a
2044                     ; 926       RTC->DR3 = (uint8_t)((RTC_DateStruct->RTC_Year));
2046  0052 1e06          	ldw	x,(OFST+4,sp)
2047  0054 e603          	ld	a,(3,x)
2048  0056 c75146        	ld	20806,a
2050  0059 202a          	jra	L5101
2051  005b               L3101:
2052                     ; 930       RTC->DR1 = (uint8_t)(ByteToBcd2 ((uint8_t)RTC_DateStruct->RTC_Date));
2054  005b 1e06          	ldw	x,(OFST+4,sp)
2055  005d e602          	ld	a,(2,x)
2056  005f cd0000        	call	L3_ByteToBcd2
2058  0062 c75144        	ld	20804,a
2059                     ; 931       RTC->DR2 = (uint8_t)((ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Month)) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
2061  0065 1e06          	ldw	x,(OFST+4,sp)
2062  0067 f6            	ld	a,(x)
2063  0068 97            	ld	xl,a
2064  0069 a620          	ld	a,#32
2065  006b 42            	mul	x,a
2066  006c 9f            	ld	a,xl
2067  006d 6b01          	ld	(OFST-1,sp),a
2069  006f 1e06          	ldw	x,(OFST+4,sp)
2070  0071 e601          	ld	a,(1,x)
2071  0073 cd0000        	call	L3_ByteToBcd2
2073  0076 1a01          	or	a,(OFST-1,sp)
2074  0078 c75145        	ld	20805,a
2075                     ; 932       RTC->DR3 = (uint8_t)(ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Year));
2077  007b 1e06          	ldw	x,(OFST+4,sp)
2078  007d e603          	ld	a,(3,x)
2079  007f cd0000        	call	L3_ByteToBcd2
2081  0082 c75146        	ld	20806,a
2082  0085               L5101:
2083                     ; 936     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
2085  0085 721f514c      	bres	20812,#7
2086                     ; 939     RTC->WPR = 0xFF; 
2088  0089 35ff5159      	mov	20825,#255
2089                     ; 942     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
2091  008d c65148        	ld	a,20808
2092  0090 a510          	bcp	a,#16
2093  0092 2610          	jrne	L7101
2094                     ; 944       if (RTC_WaitForSynchro() == ERROR)
2096  0094 cd0000        	call	_RTC_WaitForSynchro
2098  0097 4d            	tnz	a
2099  0098 2604          	jrne	L1201
2100                     ; 946         status = ERROR;
2102  009a 0f02          	clr	(OFST+0,sp)
2105  009c 200a          	jra	L1101
2106  009e               L1201:
2107                     ; 950         status = SUCCESS;
2109  009e a601          	ld	a,#1
2110  00a0 6b02          	ld	(OFST+0,sp),a
2112  00a2 2004          	jra	L1101
2113  00a4               L7101:
2114                     ; 955       status = SUCCESS;
2116  00a4 a601          	ld	a,#1
2117  00a6 6b02          	ld	(OFST+0,sp),a
2119  00a8               L1101:
2120                     ; 959   return (ErrorStatus)status;
2122  00a8 7b02          	ld	a,(OFST+0,sp)
2125  00aa 5b03          	addw	sp,#3
2126  00ac 81            	ret
2163                     ; 968 void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct)
2163                     ; 969 {
2164                     .text:	section	.text,new
2165  0000               _RTC_DateStructInit:
2169                     ; 971   RTC_DateStruct->RTC_WeekDay = RTC_Weekday_Monday;
2171  0000 a601          	ld	a,#1
2172  0002 f7            	ld	(x),a
2173                     ; 972   RTC_DateStruct->RTC_Date = 1;
2175  0003 a601          	ld	a,#1
2176  0005 e702          	ld	(2,x),a
2177                     ; 973   RTC_DateStruct->RTC_Month = RTC_Month_January;
2179  0007 a601          	ld	a,#1
2180  0009 e701          	ld	(1,x),a
2181                     ; 974   RTC_DateStruct->RTC_Year = 0;
2183  000b 6f03          	clr	(3,x)
2184                     ; 975 }
2187  000d 81            	ret
2244                     ; 988 void RTC_GetDate(RTC_Format_TypeDef RTC_Format,
2244                     ; 989                  RTC_DateTypeDef* RTC_DateStruct)
2244                     ; 990 {
2245                     .text:	section	.text,new
2246  0000               _RTC_GetDate:
2248  0000 88            	push	a
2249  0001 88            	push	a
2250       00000001      OFST:	set	1
2253                     ; 991   uint8_t tmpreg = 0;
2255                     ; 994   assert_param(IS_RTC_FORMAT(RTC_Format));
2257                     ; 997   (void) (RTC->TR1) ;
2259  0002 c65140        	ld	a,20800
2260                     ; 998   RTC_DateStruct->RTC_Date = (uint8_t)(RTC->DR1);
2262  0005 1e05          	ldw	x,(OFST+4,sp)
2263  0007 c65144        	ld	a,20804
2264  000a e702          	ld	(2,x),a
2265                     ; 999   tmpreg = (uint8_t)RTC->DR2;
2267  000c c65145        	ld	a,20805
2268  000f 6b01          	ld	(OFST+0,sp),a
2270                     ; 1000   RTC_DateStruct->RTC_Year = (uint8_t)(RTC->DR3);
2272  0011 1e05          	ldw	x,(OFST+4,sp)
2273  0013 c65146        	ld	a,20806
2274  0016 e703          	ld	(3,x),a
2275                     ; 1003   RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)(tmpreg & (uint8_t)(RTC_DR2_MT | RTC_DR2_MU));
2277  0018 7b01          	ld	a,(OFST+0,sp)
2278  001a a41f          	and	a,#31
2279  001c 1e05          	ldw	x,(OFST+4,sp)
2280  001e e701          	ld	(1,x),a
2281                     ; 1004   RTC_DateStruct->RTC_WeekDay = (RTC_Weekday_TypeDef)((uint8_t)((uint8_t)tmpreg & (uint8_t)(RTC_DR2_WDU)) >> (uint8_t)5);
2283  0020 7b01          	ld	a,(OFST+0,sp)
2284  0022 a4e0          	and	a,#224
2285  0024 4e            	swap	a
2286  0025 44            	srl	a
2287  0026 a407          	and	a,#7
2288  0028 1e05          	ldw	x,(OFST+4,sp)
2289  002a f7            	ld	(x),a
2290                     ; 1007   if (RTC_Format == RTC_Format_BIN)
2292  002b 0d02          	tnz	(OFST+1,sp)
2293  002d 2621          	jrne	L7701
2294                     ; 1010     RTC_DateStruct->RTC_Year = (uint8_t)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Year);
2296  002f 1e05          	ldw	x,(OFST+4,sp)
2297  0031 e603          	ld	a,(3,x)
2298  0033 cd0000        	call	L5_Bcd2ToByte
2300  0036 1e05          	ldw	x,(OFST+4,sp)
2301  0038 e703          	ld	(3,x),a
2302                     ; 1011     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month);
2304  003a 1e05          	ldw	x,(OFST+4,sp)
2305  003c e601          	ld	a,(1,x)
2306  003e cd0000        	call	L5_Bcd2ToByte
2308  0041 1e05          	ldw	x,(OFST+4,sp)
2309  0043 e701          	ld	(1,x),a
2310                     ; 1012     RTC_DateStruct->RTC_Date = (uint8_t)(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date));
2312  0045 1e05          	ldw	x,(OFST+4,sp)
2313  0047 e602          	ld	a,(2,x)
2314  0049 cd0000        	call	L5_Bcd2ToByte
2316  004c 1e05          	ldw	x,(OFST+4,sp)
2317  004e e702          	ld	(2,x),a
2318  0050               L7701:
2319                     ; 1014 }
2322  0050 85            	popw	x
2323  0051 81            	ret
2472                     ; 1044 void RTC_SetAlarm(RTC_Format_TypeDef RTC_Format,
2472                     ; 1045                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2472                     ; 1046 {
2473                     .text:	section	.text,new
2474  0000               _RTC_SetAlarm:
2476  0000 88            	push	a
2477  0001 5205          	subw	sp,#5
2478       00000005      OFST:	set	5
2481                     ; 1047   uint8_t tmpreg1 = 0;
2483                     ; 1048   uint8_t tmpreg2 = 0;
2485                     ; 1049   uint8_t tmpreg3 = 0;
2487                     ; 1050   uint8_t tmpreg4 = 0;
2489                     ; 1053   assert_param(IS_RTC_ALARM_MASK(RTC_AlarmStruct->RTC_AlarmMask));
2491                     ; 1054   assert_param(IS_RTC_FORMAT(RTC_Format));
2493                     ; 1055   assert_param(IS_RTC_H12(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12));
2495                     ; 1056   assert_param(IS_RTC_ALARM_DATEWEEKDAY_SEL(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel));
2497                     ; 1059   if (RTC_Format == RTC_Format_BIN)
2499  0003 4d            	tnz	a
2500  0004 2609          	jrne	L5711
2501                     ; 1062     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2503  0006 c65148        	ld	a,20808
2504  0009 a540          	bcp	a,#64
2505  000b 2700          	jreq	L7711
2506                     ; 1064       assert_param(IS_RTC_HOUR12_MAX(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2508                     ; 1065       assert_param(IS_RTC_HOUR12_MIN(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2511  000d               L7711:
2512                     ; 1069       assert_param(IS_RTC_HOUR24(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2514                     ; 1071     assert_param(IS_RTC_MINUTES(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes));
2516                     ; 1072     assert_param(IS_RTC_SECONDS(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds));
2519  000d 2007          	jra	L3021
2520  000f               L5711:
2521                     ; 1077     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2523  000f c65148        	ld	a,20808
2524  0012 a540          	bcp	a,#64
2525  0014 2700          	jreq	L5021
2526                     ; 1079       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2528                     ; 1080       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2531  0016               L5021:
2532                     ; 1084       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2534                     ; 1087     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)));
2536                     ; 1089     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)));
2538  0016               L3021:
2539                     ; 1094   if ((RTC_AlarmStruct->RTC_AlarmMask & RTC_AlarmMask_DateWeekDay) == RESET )
2541  0016 1e09          	ldw	x,(OFST+4,sp)
2542  0018 e604          	ld	a,(4,x)
2543  001a a510          	bcp	a,#16
2544  001c 2608          	jrne	L1121
2545                     ; 1096     if (RTC_AlarmStruct->RTC_AlarmDateWeekDaySel == RTC_AlarmDateWeekDaySel_WeekDay)
2547  001e 1e09          	ldw	x,(OFST+4,sp)
2548  0020 e605          	ld	a,(5,x)
2549  0022 a140          	cp	a,#64
2550  0024 2600          	jrne	L3121
2551                     ; 1098       assert_param(IS_RTC_WEEKDAY(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2554  0026               L3121:
2555                     ; 1102       assert_param(IS_RTC_DATE_MIN(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2557                     ; 1103       assert_param(IS_RTC_DATE_MAX(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2559  0026               L1121:
2560                     ; 1108   RTC->WPR = 0xCA;
2562  0026 35ca5159      	mov	20825,#202
2563                     ; 1109   RTC->WPR = 0x53;
2565  002a 35535159      	mov	20825,#83
2566                     ; 1113   if (RTC_Format != RTC_Format_BIN)
2568  002e 0d06          	tnz	(OFST+1,sp)
2569  0030 2747          	jreq	L7121
2570                     ; 1115     tmpreg1 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds) | \
2570                     ; 1116                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask) & (uint8_t)RTC_ALRMAR1_MSK1));
2572  0032 1e09          	ldw	x,(OFST+4,sp)
2573  0034 e604          	ld	a,(4,x)
2574  0036 a480          	and	a,#128
2575  0038 1e09          	ldw	x,(OFST+4,sp)
2576  003a ea02          	or	a,(2,x)
2577  003c 6b02          	ld	(OFST-3,sp),a
2579                     ; 1118     tmpreg2 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes) | \
2579                     ; 1119                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2581  003e 1e09          	ldw	x,(OFST+4,sp)
2582  0040 e604          	ld	a,(4,x)
2583  0042 48            	sll	a
2584  0043 a480          	and	a,#128
2585  0045 1e09          	ldw	x,(OFST+4,sp)
2586  0047 ea01          	or	a,(1,x)
2587  0049 6b03          	ld	(OFST-2,sp),a
2589                     ; 1121     tmpreg3 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours) | \
2589                     ; 1122                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2589                     ; 1123                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2591  004b 1e09          	ldw	x,(OFST+4,sp)
2592  004d e604          	ld	a,(4,x)
2593  004f 48            	sll	a
2594  0050 48            	sll	a
2595  0051 a480          	and	a,#128
2596  0053 6b01          	ld	(OFST-4,sp),a
2598  0055 1e09          	ldw	x,(OFST+4,sp)
2599  0057 e603          	ld	a,(3,x)
2600  0059 1e09          	ldw	x,(OFST+4,sp)
2601  005b fa            	or	a,(x)
2602  005c 1a01          	or	a,(OFST-4,sp)
2603  005e 6b04          	ld	(OFST-1,sp),a
2605                     ; 1125     tmpreg4 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDay) | \
2605                     ; 1126                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2605                     ; 1127                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)RTC_ALRMAR4_MSK4));
2607  0060 1e09          	ldw	x,(OFST+4,sp)
2608  0062 e604          	ld	a,(4,x)
2609  0064 48            	sll	a
2610  0065 48            	sll	a
2611  0066 48            	sll	a
2612  0067 a480          	and	a,#128
2613  0069 6b01          	ld	(OFST-4,sp),a
2615  006b 1e09          	ldw	x,(OFST+4,sp)
2616  006d e605          	ld	a,(5,x)
2617  006f 1e09          	ldw	x,(OFST+4,sp)
2618  0071 ea06          	or	a,(6,x)
2619  0073 1a01          	or	a,(OFST-4,sp)
2620  0075 6b05          	ld	(OFST+0,sp),a
2623  0077 2059          	jra	L1221
2624  0079               L7121:
2625                     ; 1132     tmpreg1 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)) | \
2625                     ; 1133                         (uint8_t)(RTC_AlarmStruct->RTC_AlarmMask & RTC_ALRMAR1_MSK1));
2627  0079 1e09          	ldw	x,(OFST+4,sp)
2628  007b e604          	ld	a,(4,x)
2629  007d a480          	and	a,#128
2630  007f 6b01          	ld	(OFST-4,sp),a
2632  0081 1e09          	ldw	x,(OFST+4,sp)
2633  0083 e602          	ld	a,(2,x)
2634  0085 cd0000        	call	L3_ByteToBcd2
2636  0088 1a01          	or	a,(OFST-4,sp)
2637  008a 6b02          	ld	(OFST-3,sp),a
2639                     ; 1135     tmpreg2 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)) | \
2639                     ; 1136                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2641  008c 1e09          	ldw	x,(OFST+4,sp)
2642  008e e604          	ld	a,(4,x)
2643  0090 48            	sll	a
2644  0091 a480          	and	a,#128
2645  0093 6b01          	ld	(OFST-4,sp),a
2647  0095 1e09          	ldw	x,(OFST+4,sp)
2648  0097 e601          	ld	a,(1,x)
2649  0099 cd0000        	call	L3_ByteToBcd2
2651  009c 1a01          	or	a,(OFST-4,sp)
2652  009e 6b03          	ld	(OFST-2,sp),a
2654                     ; 1138     tmpreg3 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)) | \
2654                     ; 1139                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2654                     ; 1140                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2656  00a0 1e09          	ldw	x,(OFST+4,sp)
2657  00a2 e604          	ld	a,(4,x)
2658  00a4 48            	sll	a
2659  00a5 48            	sll	a
2660  00a6 a480          	and	a,#128
2661  00a8 6b01          	ld	(OFST-4,sp),a
2663  00aa 1e09          	ldw	x,(OFST+4,sp)
2664  00ac f6            	ld	a,(x)
2665  00ad cd0000        	call	L3_ByteToBcd2
2667  00b0 1e09          	ldw	x,(OFST+4,sp)
2668  00b2 ea03          	or	a,(3,x)
2669  00b4 1a01          	or	a,(OFST-4,sp)
2670  00b6 6b04          	ld	(OFST-1,sp),a
2672                     ; 1142     tmpreg4 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmDateWeekDay)) | \
2672                     ; 1143                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2672                     ; 1144                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)(RTC_ALRMAR4_MSK4)));
2674  00b8 1e09          	ldw	x,(OFST+4,sp)
2675  00ba e604          	ld	a,(4,x)
2676  00bc 48            	sll	a
2677  00bd 48            	sll	a
2678  00be 48            	sll	a
2679  00bf a480          	and	a,#128
2680  00c1 6b01          	ld	(OFST-4,sp),a
2682  00c3 1e09          	ldw	x,(OFST+4,sp)
2683  00c5 e606          	ld	a,(6,x)
2684  00c7 cd0000        	call	L3_ByteToBcd2
2686  00ca 1e09          	ldw	x,(OFST+4,sp)
2687  00cc ea05          	or	a,(5,x)
2688  00ce 1a01          	or	a,(OFST-4,sp)
2689  00d0 6b05          	ld	(OFST+0,sp),a
2691  00d2               L1221:
2692                     ; 1148   RTC->ALRMAR1 = tmpreg1;
2694  00d2 7b02          	ld	a,(OFST-3,sp)
2695  00d4 c7515c        	ld	20828,a
2696                     ; 1149   RTC->ALRMAR2 = tmpreg2;
2698  00d7 7b03          	ld	a,(OFST-2,sp)
2699  00d9 c7515d        	ld	20829,a
2700                     ; 1150   RTC->ALRMAR3 = tmpreg3;
2702  00dc 7b04          	ld	a,(OFST-1,sp)
2703  00de c7515e        	ld	20830,a
2704                     ; 1151   RTC->ALRMAR4 = tmpreg4;
2706  00e1 7b05          	ld	a,(OFST+0,sp)
2707  00e3 c7515f        	ld	20831,a
2708                     ; 1154   RTC->WPR = 0xFF; 
2710  00e6 35ff5159      	mov	20825,#255
2711                     ; 1155 }
2714  00ea 5b06          	addw	sp,#6
2715  00ec 81            	ret
2753                     ; 1165 void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct)
2753                     ; 1166 {
2754                     .text:	section	.text,new
2755  0000               _RTC_AlarmStructInit:
2759                     ; 1168   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = RTC_H12_AM;
2761  0000 6f03          	clr	(3,x)
2762                     ; 1169   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = 0;
2764  0002 7f            	clr	(x)
2765                     ; 1170   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = 0;
2767  0003 6f01          	clr	(1,x)
2768                     ; 1171   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = 0;
2770  0005 6f02          	clr	(2,x)
2771                     ; 1174   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = RTC_AlarmDateWeekDaySel_Date;
2773  0007 6f05          	clr	(5,x)
2774                     ; 1175   RTC_AlarmStruct->RTC_AlarmDateWeekDay = 1;
2776  0009 a601          	ld	a,#1
2777  000b e706          	ld	(6,x),a
2778                     ; 1178   RTC_AlarmStruct->RTC_AlarmMask = RTC_AlarmMask_All;
2780  000d a6f0          	ld	a,#240
2781  000f e704          	ld	(4,x),a
2782                     ; 1179 }
2785  0011 81            	ret
2878                     ; 1188 void RTC_GetAlarm(RTC_Format_TypeDef RTC_Format,
2878                     ; 1189                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2878                     ; 1190 {
2879                     .text:	section	.text,new
2880  0000               _RTC_GetAlarm:
2882  0000 88            	push	a
2883  0001 5204          	subw	sp,#4
2884       00000004      OFST:	set	4
2887                     ; 1191   uint8_t tmpreg1 = 0;
2889                     ; 1192   uint8_t tmpreg2 = 0;
2891                     ; 1193   uint8_t tmpreg3 = 0;
2893                     ; 1194   uint8_t tmpreg4 = 0;
2895                     ; 1195   uint8_t alarmmask = 0;
2897                     ; 1198   assert_param(IS_RTC_FORMAT(RTC_Format));
2899                     ; 1201   tmpreg1 = (uint8_t)RTC->ALRMAR1;
2901  0003 c6515c        	ld	a,20828
2902  0006 6b04          	ld	(OFST+0,sp),a
2904                     ; 1202   tmpreg2 = (uint8_t)RTC->ALRMAR2;
2906  0008 c6515d        	ld	a,20829
2907  000b 6b01          	ld	(OFST-3,sp),a
2909                     ; 1203   tmpreg3 = (uint8_t)RTC->ALRMAR3;
2911  000d c6515e        	ld	a,20830
2912  0010 6b02          	ld	(OFST-2,sp),a
2914                     ; 1204   tmpreg4 = (uint8_t)RTC->ALRMAR4;
2916  0012 c6515f        	ld	a,20831
2917  0015 6b03          	ld	(OFST-1,sp),a
2919                     ; 1207   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = (uint8_t)((uint8_t)tmpreg1 & (uint8_t)((uint8_t)RTC_ALRMAR1_ST | (uint8_t)RTC_ALRMAR1_SU));
2921  0017 7b04          	ld	a,(OFST+0,sp)
2922  0019 a47f          	and	a,#127
2923  001b 1e08          	ldw	x,(OFST+4,sp)
2924  001d e702          	ld	(2,x),a
2925                     ; 1208   alarmmask = (uint8_t)(tmpreg1 & RTC_ALRMAR1_MSK1);
2927  001f 7b04          	ld	a,(OFST+0,sp)
2928  0021 a480          	and	a,#128
2929  0023 6b04          	ld	(OFST+0,sp),a
2931                     ; 1211   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = (uint8_t)((uint8_t)tmpreg2 & (uint8_t)((uint8_t)RTC_ALRMAR2_MNT | (uint8_t)RTC_ALRMAR2_MNU));
2933  0025 7b01          	ld	a,(OFST-3,sp)
2934  0027 a47f          	and	a,#127
2935  0029 1e08          	ldw	x,(OFST+4,sp)
2936  002b e701          	ld	(1,x),a
2937                     ; 1212   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)(tmpreg2 & RTC_ALRMAR2_MSK2) >> 1));
2939  002d 7b01          	ld	a,(OFST-3,sp)
2940  002f a480          	and	a,#128
2941  0031 44            	srl	a
2942  0032 1a04          	or	a,(OFST+0,sp)
2943  0034 6b04          	ld	(OFST+0,sp),a
2945                     ; 1215   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = (uint8_t)((uint8_t)tmpreg3 & (uint8_t)((uint8_t)RTC_ALRMAR3_HT | (uint8_t)RTC_ALRMAR3_HU));
2947  0036 7b02          	ld	a,(OFST-2,sp)
2948  0038 a43f          	and	a,#63
2949  003a 1e08          	ldw	x,(OFST+4,sp)
2950  003c f7            	ld	(x),a
2951                     ; 1216   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = (RTC_H12_TypeDef)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_PM);
2953  003d 7b02          	ld	a,(OFST-2,sp)
2954  003f a440          	and	a,#64
2955  0041 1e08          	ldw	x,(OFST+4,sp)
2956  0043 e703          	ld	(3,x),a
2957                     ; 1217   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_MSK3) >> 2));
2959  0045 7b02          	ld	a,(OFST-2,sp)
2960  0047 a480          	and	a,#128
2961  0049 44            	srl	a
2962  004a 44            	srl	a
2963  004b 1a04          	or	a,(OFST+0,sp)
2964  004d 6b04          	ld	(OFST+0,sp),a
2966                     ; 1220   RTC_AlarmStruct->RTC_AlarmDateWeekDay = (uint8_t)((uint8_t)tmpreg4 & (uint8_t)((uint8_t)RTC_ALRMAR4_DT | (uint8_t)RTC_ALRMAR4_DU));
2968  004f 7b03          	ld	a,(OFST-1,sp)
2969  0051 a43f          	and	a,#63
2970  0053 1e08          	ldw	x,(OFST+4,sp)
2971  0055 e706          	ld	(6,x),a
2972                     ; 1221   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = (RTC_AlarmDateWeekDaySel_TypeDef)((uint8_t)tmpreg4 & (uint8_t)RTC_ALRMAR4_WDSEL);
2974  0057 7b03          	ld	a,(OFST-1,sp)
2975  0059 a440          	and	a,#64
2976  005b 1e08          	ldw	x,(OFST+4,sp)
2977  005d e705          	ld	(5,x),a
2978                     ; 1222   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg4 & RTC_ALRMAR4_MSK4) >> 3));
2980  005f 7b03          	ld	a,(OFST-1,sp)
2981  0061 a480          	and	a,#128
2982  0063 44            	srl	a
2983  0064 44            	srl	a
2984  0065 44            	srl	a
2985  0066 1a04          	or	a,(OFST+0,sp)
2986  0068 6b04          	ld	(OFST+0,sp),a
2988                     ; 1224   RTC_AlarmStruct->RTC_AlarmMask = alarmmask;
2990  006a 7b04          	ld	a,(OFST+0,sp)
2991  006c 1e08          	ldw	x,(OFST+4,sp)
2992  006e e704          	ld	(4,x),a
2993                     ; 1226   if (RTC_Format == RTC_Format_BIN)
2995  0070 0d05          	tnz	(OFST+1,sp)
2996  0072 262a          	jrne	L3131
2997                     ; 1228     RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours);
2999  0074 1e08          	ldw	x,(OFST+4,sp)
3000  0076 f6            	ld	a,(x)
3001  0077 cd0000        	call	L5_Bcd2ToByte
3003  007a 1e08          	ldw	x,(OFST+4,sp)
3004  007c f7            	ld	(x),a
3005                     ; 1229     RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes);
3007  007d 1e08          	ldw	x,(OFST+4,sp)
3008  007f e601          	ld	a,(1,x)
3009  0081 cd0000        	call	L5_Bcd2ToByte
3011  0084 1e08          	ldw	x,(OFST+4,sp)
3012  0086 e701          	ld	(1,x),a
3013                     ; 1230     RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds);
3015  0088 1e08          	ldw	x,(OFST+4,sp)
3016  008a e602          	ld	a,(2,x)
3017  008c cd0000        	call	L5_Bcd2ToByte
3019  008f 1e08          	ldw	x,(OFST+4,sp)
3020  0091 e702          	ld	(2,x),a
3021                     ; 1231     RTC_AlarmStruct->RTC_AlarmDateWeekDay = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
3023  0093 1e08          	ldw	x,(OFST+4,sp)
3024  0095 e606          	ld	a,(6,x)
3025  0097 cd0000        	call	L5_Bcd2ToByte
3027  009a 1e08          	ldw	x,(OFST+4,sp)
3028  009c e706          	ld	(6,x),a
3029  009e               L3131:
3030                     ; 1233 }
3033  009e 5b05          	addw	sp,#5
3034  00a0 81            	ret
3098                     ; 1242 ErrorStatus RTC_AlarmCmd(FunctionalState NewState)
3098                     ; 1243 {
3099                     .text:	section	.text,new
3100  0000               _RTC_AlarmCmd:
3102  0000 5203          	subw	sp,#3
3103       00000003      OFST:	set	3
3106                     ; 1244   __IO uint16_t alrawfcount = 0;
3108  0002 5f            	clrw	x
3109  0003 1f01          	ldw	(OFST-2,sp),x
3111                     ; 1245   ErrorStatus status = ERROR;
3113                     ; 1246   uint8_t temp1 = 0;
3115                     ; 1249   assert_param(IS_FUNCTIONAL_STATE(NewState));
3117                     ; 1252   RTC->WPR = 0xCA;
3119  0005 35ca5159      	mov	20825,#202
3120                     ; 1253   RTC->WPR = 0x53;
3122  0009 35535159      	mov	20825,#83
3123                     ; 1256   if (NewState != DISABLE)
3125  000d 4d            	tnz	a
3126  000e 2711          	jreq	L7431
3127                     ; 1258     RTC->CR2 |= (uint8_t)(RTC_CR2_ALRAE);
3129  0010 72105149      	bset	20809,#0
3130                     ; 1259     status = SUCCESS;
3132  0014 a601          	ld	a,#1
3133  0016 6b03          	ld	(OFST+0,sp),a
3136  0018               L1531:
3137                     ; 1283   RTC->WPR = 0xFF; 
3139  0018 35ff5159      	mov	20825,#255
3140                     ; 1286   return (ErrorStatus)status;
3142  001c 7b03          	ld	a,(OFST+0,sp)
3145  001e 5b03          	addw	sp,#3
3146  0020 81            	ret
3147  0021               L7431:
3148                     ; 1263     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE) ;
3150  0021 72115149      	bres	20809,#0
3151                     ; 1266     temp1 = (uint8_t)(RTC->ISR1 & RTC_ISR1_ALRAWF);
3153  0025 c6514c        	ld	a,20812
3154  0028 a401          	and	a,#1
3155  002a 6b03          	ld	(OFST+0,sp),a
3158  002c 2007          	jra	L7531
3159  002e               L3531:
3160                     ; 1269       alrawfcount++;
3162  002e 1e01          	ldw	x,(OFST-2,sp)
3163  0030 1c0001        	addw	x,#1
3164  0033 1f01          	ldw	(OFST-2,sp),x
3166  0035               L7531:
3167                     ; 1267     while ((alrawfcount != ALRAWF_TIMEOUT) && (temp1 == RESET))
3169  0035 1e01          	ldw	x,(OFST-2,sp)
3170  0037 a3ffff        	cpw	x,#65535
3171  003a 2704          	jreq	L3631
3173  003c 0d03          	tnz	(OFST+0,sp)
3174  003e 27ee          	jreq	L3531
3175  0040               L3631:
3176                     ; 1272     if ((RTC->ISR1 &  RTC_ISR1_ALRAWF) == RESET)
3178  0040 c6514c        	ld	a,20812
3179  0043 a501          	bcp	a,#1
3180  0045 2604          	jrne	L5631
3181                     ; 1274       status = ERROR;
3183  0047 0f03          	clr	(OFST+0,sp)
3186  0049 20cd          	jra	L1531
3187  004b               L5631:
3188                     ; 1278       status = SUCCESS;
3190  004b a601          	ld	a,#1
3191  004d 6b03          	ld	(OFST+0,sp),a
3193  004f 20c7          	jra	L1531
3394                     ; 1298 ErrorStatus RTC_AlarmSubSecondConfig(uint16_t RTC_AlarmSubSecondValue,
3394                     ; 1299                                      RTC_AlarmSubSecondMask_TypeDef RTC_AlarmSubSecondMask)
3394                     ; 1300 {
3395                     .text:	section	.text,new
3396  0000               _RTC_AlarmSubSecondConfig:
3398  0000 89            	pushw	x
3399  0001 88            	push	a
3400       00000001      OFST:	set	1
3403                     ; 1301   uint8_t alarmstatus = 0;
3405                     ; 1302   ErrorStatus status = ERROR;
3407                     ; 1305   assert_param(IS_RTC_ALARM_SS_VALUE(RTC_AlarmSubSecondValue));
3409                     ; 1306   assert_param(IS_RTC_ALARM_SS_MASK(RTC_AlarmSubSecondMask));
3411                     ; 1309   RTC->WPR = 0xCA;
3413  0002 35ca5159      	mov	20825,#202
3414                     ; 1310   RTC->WPR = 0x53;
3416  0006 35535159      	mov	20825,#83
3417                     ; 1313   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
3419  000a c6514c        	ld	a,20812
3420  000d a540          	bcp	a,#64
3421  000f 2626          	jrne	L7641
3422                     ; 1316     alarmstatus = (uint8_t)(RTC->CR2 | RTC_CR2_ALRAE);
3424  0011 c65149        	ld	a,20809
3425  0014 aa01          	or	a,#1
3426  0016 6b01          	ld	(OFST+0,sp),a
3428                     ; 1319     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE);
3430  0018 72115149      	bres	20809,#0
3431                     ; 1322     RTC->ALRMASSRH = (uint8_t)(RTC_AlarmSubSecondValue >> 8);
3433  001c 9e            	ld	a,xh
3434  001d c75164        	ld	20836,a
3435                     ; 1323     RTC->ALRMASSRL = (uint8_t)(RTC_AlarmSubSecondValue);
3437  0020 9f            	ld	a,xl
3438  0021 c75165        	ld	20837,a
3439                     ; 1324     RTC->ALRMASSMSKR = (uint8_t)RTC_AlarmSubSecondMask;
3441  0024 7b06          	ld	a,(OFST+5,sp)
3442  0026 c75166        	ld	20838,a
3443                     ; 1327     RTC->CR2 |= alarmstatus;
3445  0029 c65149        	ld	a,20809
3446  002c 1a01          	or	a,(OFST+0,sp)
3447  002e c75149        	ld	20809,a
3448                     ; 1329     status = SUCCESS;
3450  0031 a601          	ld	a,#1
3451  0033 6b01          	ld	(OFST+0,sp),a
3454  0035 2002          	jra	L1741
3455  0037               L7641:
3456                     ; 1333     status = ERROR;
3458  0037 0f01          	clr	(OFST+0,sp)
3460  0039               L1741:
3461                     ; 1337   RTC->WPR = 0xFF; 
3463  0039 35ff5159      	mov	20825,#255
3464                     ; 1339   return (ErrorStatus)status;
3466  003d 7b01          	ld	a,(OFST+0,sp)
3469  003f 5b03          	addw	sp,#3
3470  0041 81            	ret
3560                     ; 1369 void RTC_WakeUpClockConfig(RTC_WakeUpClock_TypeDef RTC_WakeUpClock)
3560                     ; 1370 {
3561                     .text:	section	.text,new
3562  0000               _RTC_WakeUpClockConfig:
3564  0000 88            	push	a
3565       00000000      OFST:	set	0
3568                     ; 1373   assert_param(IS_RTC_WAKEUP_CLOCK(RTC_WakeUpClock));
3570                     ; 1376   RTC->WPR = 0xCA;
3572  0001 35ca5159      	mov	20825,#202
3573                     ; 1377   RTC->WPR = 0x53;
3575  0005 35535159      	mov	20825,#83
3576                     ; 1380   RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3578  0009 72155149      	bres	20809,#2
3579                     ; 1383   RTC->CR1 &= (uint8_t)~RTC_CR1_WUCKSEL;
3581  000d c65148        	ld	a,20808
3582  0010 a4f8          	and	a,#248
3583  0012 c75148        	ld	20808,a
3584                     ; 1386   RTC->CR1 |= (uint8_t)RTC_WakeUpClock;
3586  0015 c65148        	ld	a,20808
3587  0018 1a01          	or	a,(OFST+1,sp)
3588  001a c75148        	ld	20808,a
3589                     ; 1389   RTC->WPR = 0xFF; 
3591  001d 35ff5159      	mov	20825,#255
3592                     ; 1390 }
3595  0021 84            	pop	a
3596  0022 81            	ret
3631                     ; 1400 void RTC_SetWakeUpCounter(uint16_t RTC_WakeupCounter)
3631                     ; 1401 {
3632                     .text:	section	.text,new
3633  0000               _RTC_SetWakeUpCounter:
3637                     ; 1403   RTC->WPR = 0xCA;
3639  0000 35ca5159      	mov	20825,#202
3640                     ; 1404   RTC->WPR = 0x53;
3642  0004 35535159      	mov	20825,#83
3643                     ; 1408   RTC->WUTRH = (uint8_t)(RTC_WakeupCounter >> 8);
3645  0008 9e            	ld	a,xh
3646  0009 c75154        	ld	20820,a
3647                     ; 1409   RTC->WUTRL = (uint8_t)(RTC_WakeupCounter);
3649  000c 9f            	ld	a,xl
3650  000d c75155        	ld	20821,a
3651                     ; 1412   RTC->WPR = 0xFF; 
3653  0010 35ff5159      	mov	20825,#255
3654                     ; 1413 }
3657  0014 81            	ret
3692                     ; 1420 uint16_t RTC_GetWakeUpCounter(void)
3692                     ; 1421 {
3693                     .text:	section	.text,new
3694  0000               _RTC_GetWakeUpCounter:
3696  0000 89            	pushw	x
3697       00000002      OFST:	set	2
3700                     ; 1422   uint16_t tmpreg = 0;
3702                     ; 1425   tmpreg = ((uint16_t)RTC->WUTRH) << 8;
3704  0001 c65154        	ld	a,20820
3705  0004 5f            	clrw	x
3706  0005 97            	ld	xl,a
3707  0006 4f            	clr	a
3708  0007 02            	rlwa	x,a
3709  0008 1f01          	ldw	(OFST-1,sp),x
3711                     ; 1426   tmpreg |= RTC->WUTRL;
3713  000a c65155        	ld	a,20821
3714  000d 5f            	clrw	x
3715  000e 97            	ld	xl,a
3716  000f 01            	rrwa	x,a
3717  0010 1a02          	or	a,(OFST+0,sp)
3718  0012 01            	rrwa	x,a
3719  0013 1a01          	or	a,(OFST-1,sp)
3720  0015 01            	rrwa	x,a
3721  0016 1f01          	ldw	(OFST-1,sp),x
3723                     ; 1429   return (uint16_t)tmpreg;
3725  0018 1e01          	ldw	x,(OFST-1,sp)
3728  001a 5b02          	addw	sp,#2
3729  001c 81            	ret
3784                     ; 1440 ErrorStatus RTC_WakeUpCmd(FunctionalState NewState)
3784                     ; 1441 {
3785                     .text:	section	.text,new
3786  0000               _RTC_WakeUpCmd:
3788  0000 5203          	subw	sp,#3
3789       00000003      OFST:	set	3
3792                     ; 1442   ErrorStatus status = ERROR;
3794                     ; 1443   uint16_t wutwfcount = 0;
3796  0002 5f            	clrw	x
3797  0003 1f02          	ldw	(OFST-1,sp),x
3799                     ; 1446   assert_param(IS_FUNCTIONAL_STATE(NewState));
3801                     ; 1449   RTC->WPR = 0xCA;
3803  0005 35ca5159      	mov	20825,#202
3804                     ; 1450   RTC->WPR = 0x53;
3806  0009 35535159      	mov	20825,#83
3807                     ; 1452   if (NewState != DISABLE)
3809  000d 4d            	tnz	a
3810  000e 2711          	jreq	L3161
3811                     ; 1455     RTC->CR2 |= (uint8_t)RTC_CR2_WUTE;
3813  0010 72145149      	bset	20809,#2
3814                     ; 1457     status = SUCCESS;
3816  0014 a601          	ld	a,#1
3817  0016 6b01          	ld	(OFST-2,sp),a
3820  0018               L5161:
3821                     ; 1482   RTC->WPR = 0xFF; 
3823  0018 35ff5159      	mov	20825,#255
3824                     ; 1485   return (ErrorStatus)status;
3826  001c 7b01          	ld	a,(OFST-2,sp)
3829  001e 5b03          	addw	sp,#3
3830  0020 81            	ret
3831  0021               L3161:
3832                     ; 1462     RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3834  0021 72155149      	bres	20809,#2
3836  0025 2007          	jra	L1261
3837  0027               L7161:
3838                     ; 1467       wutwfcount++;
3840  0027 1e02          	ldw	x,(OFST-1,sp)
3841  0029 1c0001        	addw	x,#1
3842  002c 1f02          	ldw	(OFST-1,sp),x
3844  002e               L1261:
3845                     ; 1465     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
3847  002e c6514c        	ld	a,20812
3848  0031 a504          	bcp	a,#4
3849  0033 2607          	jrne	L5261
3851  0035 1e02          	ldw	x,(OFST-1,sp)
3852  0037 a3ffff        	cpw	x,#65535
3853  003a 26eb          	jrne	L7161
3854  003c               L5261:
3855                     ; 1471     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
3857  003c c6514c        	ld	a,20812
3858  003f a504          	bcp	a,#4
3859  0041 2604          	jrne	L7261
3860                     ; 1473       status = ERROR;
3862  0043 0f01          	clr	(OFST-2,sp)
3865  0045 20d1          	jra	L5161
3866  0047               L7261:
3867                     ; 1477       status = SUCCESS;
3869  0047 a601          	ld	a,#1
3870  0049 6b01          	ld	(OFST-2,sp),a
3872  004b 20cb          	jra	L5161
3962                     ; 1522 void RTC_DayLightSavingConfig(RTC_DayLightSaving_TypeDef RTC_DayLightSaving,
3962                     ; 1523                               RTC_StoreOperation_TypeDef RTC_StoreOperation)
3962                     ; 1524 {
3963                     .text:	section	.text,new
3964  0000               _RTC_DayLightSavingConfig:
3966  0000 89            	pushw	x
3967       00000000      OFST:	set	0
3970                     ; 1526   assert_param(IS_RTC_DAYLIGHT_SAVING(RTC_DayLightSaving));
3972                     ; 1527   assert_param(IS_RTC_STORE_OPERATION(RTC_StoreOperation));
3974                     ; 1530   RTC->WPR = 0xCA;
3976  0001 35ca5159      	mov	20825,#202
3977                     ; 1531   RTC->WPR = 0x53;
3979  0005 35535159      	mov	20825,#83
3980                     ; 1534   RTC->CR3 &= (uint8_t)~(RTC_CR3_BCK);
3982  0009 7215514a      	bres	20810,#2
3983                     ; 1537   RTC->CR3 |= (uint8_t)((uint8_t)RTC_DayLightSaving | (uint8_t)RTC_StoreOperation);
3985  000d 9f            	ld	a,xl
3986  000e 1a01          	or	a,(OFST+1,sp)
3987  0010 ca514a        	or	a,20810
3988  0013 c7514a        	ld	20810,a
3989                     ; 1540   RTC->WPR = 0xFF; 
3991  0016 35ff5159      	mov	20825,#255
3992                     ; 1541 }
3995  001a 85            	popw	x
3996  001b 81            	ret
4021                     ; 1549 RTC_StoreOperation_TypeDef  RTC_GetStoreOperation(void)
4021                     ; 1550 {
4022                     .text:	section	.text,new
4023  0000               _RTC_GetStoreOperation:
4027                     ; 1552   return (RTC_StoreOperation_TypeDef)(RTC->CR3 & RTC_CR3_BCK);
4029  0000 c6514a        	ld	a,20810
4030  0003 a404          	and	a,#4
4033  0005 81            	ret
4127                     ; 1587 void RTC_OutputConfig(RTC_Output_TypeDef RTC_Output,
4127                     ; 1588                       RTC_OutputPolarity_TypeDef RTC_OutputPolarity)
4127                     ; 1589 {
4128                     .text:	section	.text,new
4129  0000               _RTC_OutputConfig:
4131  0000 89            	pushw	x
4132       00000000      OFST:	set	0
4135                     ; 1591   assert_param(IS_RTC_OUTPUT_SEL(RTC_Output));
4137                     ; 1592   assert_param(IS_RTC_OUTPUT_POL(RTC_OutputPolarity));
4139                     ; 1595   RTC->WPR = 0xCA;
4141  0001 35ca5159      	mov	20825,#202
4142                     ; 1596   RTC->WPR = 0x53;
4144  0005 35535159      	mov	20825,#83
4145                     ; 1599   RTC->CR3 &= (uint8_t)~(RTC_CR3_OSEL | RTC_CR3_POL);
4147  0009 c6514a        	ld	a,20810
4148  000c a48f          	and	a,#143
4149  000e c7514a        	ld	20810,a
4150                     ; 1602   RTC->CR3 |= (uint8_t)((uint8_t)RTC_Output | (uint8_t)RTC_OutputPolarity);
4152  0011 9f            	ld	a,xl
4153  0012 1a01          	or	a,(OFST+1,sp)
4154  0014 ca514a        	or	a,20810
4155  0017 c7514a        	ld	20810,a
4156                     ; 1605   RTC->WPR = 0xFF; 
4158  001a 35ff5159      	mov	20825,#255
4159                     ; 1606 }
4162  001e 85            	popw	x
4163  001f 81            	ret
4258                     ; 1639 ErrorStatus RTC_SynchroShiftConfig(RTC_ShiftAdd1S_TypeDef RTC_ShiftAdd1S,
4258                     ; 1640                                    uint16_t RTC_ShiftSubFS)
4258                     ; 1641 {
4259                     .text:	section	.text,new
4260  0000               _RTC_SynchroShiftConfig:
4262  0000 88            	push	a
4263  0001 5203          	subw	sp,#3
4264       00000003      OFST:	set	3
4267                     ; 1642   uint8_t shiftrhreg = 0;
4269                     ; 1643   ErrorStatus status = ERROR;
4271                     ; 1644   uint16_t shpfcount = 0;
4273  0003 5f            	clrw	x
4274  0004 1f02          	ldw	(OFST-1,sp),x
4276                     ; 1647   assert_param(IS_RTC_SHIFT_ADD1S(RTC_ShiftAdd1S));
4278                     ; 1648   assert_param(IS_RTC_SHIFT_SUBFS(RTC_ShiftSubFS));
4280                     ; 1651   RTC->WPR = 0xCA;
4282  0006 35ca5159      	mov	20825,#202
4283                     ; 1652   RTC->WPR = 0x53;
4285  000a 35535159      	mov	20825,#83
4286                     ; 1655   if ((RTC->ISR1 & RTC_ISR1_SHPF) != RESET)
4288  000e c6514c        	ld	a,20812
4289  0011 a508          	bcp	a,#8
4290  0013 2717          	jreq	L7102
4292  0015 2007          	jra	L3202
4293  0017               L1202:
4294                     ; 1660       shpfcount++;
4296  0017 1e02          	ldw	x,(OFST-1,sp)
4297  0019 1c0001        	addw	x,#1
4298  001c 1f02          	ldw	(OFST-1,sp),x
4300  001e               L3202:
4301                     ; 1658     while (((RTC->ISR1 & RTC_ISR1_SHPF) != RESET) && (shpfcount != SHPF_TIMEOUT))
4303  001e c6514c        	ld	a,20812
4304  0021 a508          	bcp	a,#8
4305  0023 2707          	jreq	L7102
4307  0025 1e02          	ldw	x,(OFST-1,sp)
4308  0027 a3ffff        	cpw	x,#65535
4309  002a 26eb          	jrne	L1202
4310  002c               L7102:
4311                     ; 1665   if ((RTC->ISR1 & RTC_ISR1_SHPF) == RESET)
4313  002c c6514c        	ld	a,20812
4314  002f a508          	bcp	a,#8
4315  0031 2616          	jrne	L1302
4316                     ; 1668     shiftrhreg = (uint8_t)((uint8_t)(RTC_ShiftSubFS >> 8) | (uint8_t)(RTC_ShiftAdd1S));
4318  0033 7b07          	ld	a,(OFST+4,sp)
4319  0035 1a04          	or	a,(OFST+1,sp)
4320  0037 6b01          	ld	(OFST-2,sp),a
4322                     ; 1669     RTC->SHIFTRH = (uint8_t)(shiftrhreg);
4324  0039 7b01          	ld	a,(OFST-2,sp)
4325  003b c7515a        	ld	20826,a
4326                     ; 1670     RTC->SHIFTRL = (uint8_t)(RTC_ShiftSubFS);
4328  003e 7b08          	ld	a,(OFST+5,sp)
4329  0040 c7515b        	ld	20827,a
4330                     ; 1672     status = SUCCESS;
4332  0043 a601          	ld	a,#1
4333  0045 6b01          	ld	(OFST-2,sp),a
4336  0047 2002          	jra	L3302
4337  0049               L1302:
4338                     ; 1676     status = ERROR;
4340  0049 0f01          	clr	(OFST-2,sp)
4342  004b               L3302:
4343                     ; 1680   RTC->WPR = 0xFF; 
4345  004b 35ff5159      	mov	20825,#255
4346                     ; 1682   return (ErrorStatus)(status);
4348  004f 7b01          	ld	a,(OFST-2,sp)
4351  0051 5b04          	addw	sp,#4
4352  0053 81            	ret
4482                     ; 1718 ErrorStatus RTC_SmoothCalibConfig(RTC_SmoothCalibPeriod_TypeDef RTC_SmoothCalibPeriod,
4482                     ; 1719                                   RTC_SmoothCalibPlusPulses_TypeDef RTC_SmoothCalibPlusPulses,
4482                     ; 1720                                   uint16_t RTC_SmouthCalibMinusPulsesValue)
4482                     ; 1721 {
4483                     .text:	section	.text,new
4484  0000               _RTC_SmoothCalibConfig:
4486  0000 89            	pushw	x
4487  0001 5203          	subw	sp,#3
4488       00000003      OFST:	set	3
4491                     ; 1722   ErrorStatus status = ERROR;
4493                     ; 1723   uint16_t recalpfcount = 0;
4495  0003 5f            	clrw	x
4496  0004 1f02          	ldw	(OFST-1,sp),x
4498                     ; 1726   assert_param(IS_RTC_SMOOTH_CALIB_PERIOD(RTC_SmoothCalibPeriod));
4500                     ; 1727   assert_param(IS_RTC_SMOOTH_CALIB_PLUS(RTC_SmoothCalibPlusPulses));
4502                     ; 1728   assert_param(IS_RTC_SMOOTH_CALIB_MINUS(RTC_SmouthCalibMinusPulsesValue));
4504                     ; 1731   RTC->WPR = 0xCA;
4506  0006 35ca5159      	mov	20825,#202
4507                     ; 1732   RTC->WPR = 0x53;
4509  000a 35535159      	mov	20825,#83
4510                     ; 1735   if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
4512  000e c6514c        	ld	a,20812
4513  0011 a502          	bcp	a,#2
4514  0013 2717          	jreq	L5112
4516  0015 2007          	jra	L1212
4517  0017               L7112:
4518                     ; 1740       recalpfcount++;
4520  0017 1e02          	ldw	x,(OFST-1,sp)
4521  0019 1c0001        	addw	x,#1
4522  001c 1f02          	ldw	(OFST-1,sp),x
4524  001e               L1212:
4525                     ; 1738     while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
4527  001e c6514c        	ld	a,20812
4528  0021 a502          	bcp	a,#2
4529  0023 2707          	jreq	L5112
4531  0025 1e02          	ldw	x,(OFST-1,sp)
4532  0027 a3ffff        	cpw	x,#65535
4533  002a 26eb          	jrne	L7112
4534  002c               L5112:
4535                     ; 1746   if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
4537  002c c6514c        	ld	a,20812
4538  002f a502          	bcp	a,#2
4539  0031 2614          	jrne	L7212
4540                     ; 1749     RTC->CALRH = (uint8_t)((uint8_t)((uint8_t)RTC_SmoothCalibPeriod | \
4540                     ; 1750                            (uint8_t)RTC_SmoothCalibPlusPulses) | \
4540                     ; 1751                            (uint8_t)((uint16_t)RTC_SmouthCalibMinusPulsesValue >> 8));
4542  0033 7b04          	ld	a,(OFST+1,sp)
4543  0035 1a05          	or	a,(OFST+2,sp)
4544  0037 1a08          	or	a,(OFST+5,sp)
4545  0039 c7516a        	ld	20842,a
4546                     ; 1752     RTC->CALRL = (uint8_t)(RTC_SmouthCalibMinusPulsesValue);
4548  003c 7b09          	ld	a,(OFST+6,sp)
4549  003e c7516b        	ld	20843,a
4550                     ; 1754     status = SUCCESS;
4552  0041 a601          	ld	a,#1
4553  0043 6b01          	ld	(OFST-2,sp),a
4556  0045 2002          	jra	L1312
4557  0047               L7212:
4558                     ; 1758     status = ERROR;
4560  0047 0f01          	clr	(OFST-2,sp)
4562  0049               L1312:
4563                     ; 1762   RTC->WPR = 0xFF; 
4565  0049 35ff5159      	mov	20825,#255
4566                     ; 1764   return (ErrorStatus)(status);
4568  004d 7b01          	ld	a,(OFST-2,sp)
4571  004f 5b05          	addw	sp,#5
4572  0051 81            	ret
4630                     ; 1790 void RTC_CalibOutputConfig(RTC_CalibOutput_TypeDef RTC_CalibOutput)
4630                     ; 1791 {
4631                     .text:	section	.text,new
4632  0000               _RTC_CalibOutputConfig:
4636                     ; 1793   assert_param(IS_RTC_CALOUTPUT_SELECT(RTC_CalibOutput));
4638                     ; 1796   RTC->WPR = 0xCA;
4640  0000 35ca5159      	mov	20825,#202
4641                     ; 1797   RTC->WPR = 0x53;
4643  0004 35535159      	mov	20825,#83
4644                     ; 1799   if (RTC_CalibOutput != RTC_CalibOutput_512Hz)
4646  0008 4d            	tnz	a
4647  0009 2706          	jreq	L1612
4648                     ; 1802     RTC->CR3 |= (uint8_t)RTC_CR3_COSEL;
4650  000b 7216514a      	bset	20810,#3
4652  000f 2004          	jra	L3612
4653  0011               L1612:
4654                     ; 1807     RTC->CR3 &= (uint8_t)~RTC_CR3_COSEL;
4656  0011 7217514a      	bres	20810,#3
4657  0015               L3612:
4658                     ; 1811   RTC->WPR = 0xFF; 
4660  0015 35ff5159      	mov	20825,#255
4661                     ; 1812 }
4664  0019 81            	ret
4699                     ; 1820 void RTC_CalibOutputCmd(FunctionalState NewState)
4699                     ; 1821 {
4700                     .text:	section	.text,new
4701  0000               _RTC_CalibOutputCmd:
4705                     ; 1823   assert_param(IS_FUNCTIONAL_STATE(NewState));
4707                     ; 1826   RTC->WPR = 0xCA;
4709  0000 35ca5159      	mov	20825,#202
4710                     ; 1827   RTC->WPR = 0x53;
4712  0004 35535159      	mov	20825,#83
4713                     ; 1829   if (NewState != DISABLE)
4715  0008 4d            	tnz	a
4716  0009 2706          	jreq	L3022
4717                     ; 1832     RTC->CR3 |= (uint8_t)RTC_CR3_COE;
4719  000b 721e514a      	bset	20810,#7
4721  000f 2004          	jra	L5022
4722  0011               L3022:
4723                     ; 1837     RTC->CR3 &= (uint8_t)~RTC_CR3_COE;
4725  0011 721f514a      	bres	20810,#7
4726  0015               L5022:
4727                     ; 1841   RTC->WPR = 0xFF; 
4729  0015 35ff5159      	mov	20825,#255
4730                     ; 1842 }
4733  0019 81            	ret
4828                     ; 1871 void RTC_TamperLevelConfig(RTC_Tamper_TypeDef RTC_Tamper,
4828                     ; 1872                            RTC_TamperLevel_TypeDef RTC_TamperLevel)
4828                     ; 1873 {
4829                     .text:	section	.text,new
4830  0000               _RTC_TamperLevelConfig:
4832  0000 89            	pushw	x
4833       00000000      OFST:	set	0
4836                     ; 1875   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
4838                     ; 1876   assert_param(IS_RTC_TAMPER_LEVEL(RTC_TamperLevel));
4840                     ; 1879   RTC->WPR = 0xCA;
4842  0001 35ca5159      	mov	20825,#202
4843                     ; 1880   RTC->WPR = 0x53;
4845  0005 35535159      	mov	20825,#83
4846                     ; 1882   if (RTC_TamperLevel != RTC_TamperLevel_Low)
4848  0009 9f            	ld	a,xl
4849  000a 4d            	tnz	a
4850  000b 270a          	jreq	L3522
4851                     ; 1885     RTC->TCR1 |= (uint8_t)(RTC_Tamper << 1);
4853  000d 9e            	ld	a,xh
4854  000e 48            	sll	a
4855  000f ca516c        	or	a,20844
4856  0012 c7516c        	ld	20844,a
4858  0015 200a          	jra	L5522
4859  0017               L3522:
4860                     ; 1890     RTC->TCR1 &= (uint8_t)~(uint8_t)(RTC_Tamper << 1);
4862  0017 7b01          	ld	a,(OFST+1,sp)
4863  0019 48            	sll	a
4864  001a 43            	cpl	a
4865  001b c4516c        	and	a,20844
4866  001e c7516c        	ld	20844,a
4867  0021               L5522:
4868                     ; 1894   RTC->WPR = 0xFF; 
4870  0021 35ff5159      	mov	20825,#255
4871                     ; 1895 }
4874  0025 85            	popw	x
4875  0026 81            	ret
4949                     ; 1903 void RTC_TamperFilterConfig(RTC_TamperFilter_TypeDef RTC_TamperFilter)
4949                     ; 1904 {
4950                     .text:	section	.text,new
4951  0000               _RTC_TamperFilterConfig:
4953  0000 88            	push	a
4954       00000000      OFST:	set	0
4957                     ; 1907   assert_param(IS_RTC_TAMPER_FILTER(RTC_TamperFilter));
4959                     ; 1910   RTC->WPR = 0xCA;
4961  0001 35ca5159      	mov	20825,#202
4962                     ; 1911   RTC->WPR = 0x53;
4964  0005 35535159      	mov	20825,#83
4965                     ; 1914   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFLT);
4967  0009 c6516d        	ld	a,20845
4968  000c a4e7          	and	a,#231
4969  000e c7516d        	ld	20845,a
4970                     ; 1917   RTC->TCR2 |= (uint8_t)RTC_TamperFilter;
4972  0011 c6516d        	ld	a,20845
4973  0014 1a01          	or	a,(OFST+1,sp)
4974  0016 c7516d        	ld	20845,a
4975                     ; 1920   RTC->WPR = 0xFF; 
4977  0019 35ff5159      	mov	20825,#255
4978                     ; 1922 }
4981  001d 84            	pop	a
4982  001e 81            	ret
5095                     ; 1931 void RTC_TamperSamplingFreqConfig(RTC_TamperSamplingFreq_TypeDef RTC_TamperSamplingFreq)
5095                     ; 1932 {
5096                     .text:	section	.text,new
5097  0000               _RTC_TamperSamplingFreqConfig:
5099  0000 88            	push	a
5100       00000000      OFST:	set	0
5103                     ; 1934   assert_param(IS_RTC_TAMPER_SAMPLING_FREQ(RTC_TamperSamplingFreq));
5105                     ; 1937   RTC->WPR = 0xCA;
5107  0001 35ca5159      	mov	20825,#202
5108                     ; 1938   RTC->WPR = 0x53;
5110  0005 35535159      	mov	20825,#83
5111                     ; 1941   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFREQ);
5113  0009 c6516d        	ld	a,20845
5114  000c a4f8          	and	a,#248
5115  000e c7516d        	ld	20845,a
5116                     ; 1944   RTC->TCR2 |= (uint8_t)RTC_TamperSamplingFreq;
5118  0011 c6516d        	ld	a,20845
5119  0014 1a01          	or	a,(OFST+1,sp)
5120  0016 c7516d        	ld	20845,a
5121                     ; 1947   RTC->WPR = 0xFF; 
5123  0019 35ff5159      	mov	20825,#255
5124                     ; 1948 }
5127  001d 84            	pop	a
5128  001e 81            	ret
5211                     ; 1958 void RTC_TamperPinsPrechargeDuration(RTC_TamperPrechargeDuration_TypeDef RTC_TamperPrechargeDuration)
5211                     ; 1959 {
5212                     .text:	section	.text,new
5213  0000               _RTC_TamperPinsPrechargeDuration:
5215  0000 88            	push	a
5216       00000000      OFST:	set	0
5219                     ; 1961   assert_param(IS_RTC_TAMPER_PINS_PRECHAR_DURATION(RTC_TamperPrechargeDuration));
5221                     ; 1964   RTC->WPR = 0xCA;
5223  0001 35ca5159      	mov	20825,#202
5224                     ; 1965   RTC->WPR = 0x53;
5226  0005 35535159      	mov	20825,#83
5227                     ; 1968   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPPUDIS | RTC_TCR2_TAMPPRCH);
5229  0009 c6516d        	ld	a,20845
5230  000c a41f          	and	a,#31
5231  000e c7516d        	ld	20845,a
5232                     ; 1971   RTC->TCR2 |= (uint8_t)RTC_TamperPrechargeDuration;
5234  0011 c6516d        	ld	a,20845
5235  0014 1a01          	or	a,(OFST+1,sp)
5236  0016 c7516d        	ld	20845,a
5237                     ; 1974   RTC->WPR = 0xFF; 
5239  0019 35ff5159      	mov	20825,#255
5240                     ; 1975 }
5243  001d 84            	pop	a
5244  001e 81            	ret
5289                     ; 1987 void RTC_TamperCmd(RTC_Tamper_TypeDef RTC_Tamper,
5289                     ; 1988                    FunctionalState NewState)
5289                     ; 1989 {
5290                     .text:	section	.text,new
5291  0000               _RTC_TamperCmd:
5293  0000 89            	pushw	x
5294       00000000      OFST:	set	0
5297                     ; 1992   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
5299                     ; 1993   assert_param(IS_FUNCTIONAL_STATE(NewState));
5301                     ; 1996   RTC->WPR = 0xCA;
5303  0001 35ca5159      	mov	20825,#202
5304                     ; 1997   RTC->WPR = 0x53;
5306  0005 35535159      	mov	20825,#83
5307                     ; 2000   if (NewState != DISABLE)
5309  0009 9f            	ld	a,xl
5310  000a 4d            	tnz	a
5311  000b 2709          	jreq	L1342
5312                     ; 2003     RTC->TCR1 |= (uint8_t)RTC_Tamper;
5314  000d 9e            	ld	a,xh
5315  000e ca516c        	or	a,20844
5316  0011 c7516c        	ld	20844,a
5318  0014 2009          	jra	L3342
5319  0016               L1342:
5320                     ; 2008     RTC->TCR1 &= (uint8_t)~RTC_Tamper;
5322  0016 7b01          	ld	a,(OFST+1,sp)
5323  0018 43            	cpl	a
5324  0019 c4516c        	and	a,20844
5325  001c c7516c        	ld	20844,a
5326  001f               L3342:
5327                     ; 2013   RTC->WPR = 0xFF; 
5329  001f 35ff5159      	mov	20825,#255
5330                     ; 2014 }
5333  0023 85            	popw	x
5334  0024 81            	ret
5406                     ; 2058 void RTC_ITConfig(RTC_IT_TypeDef RTC_IT, FunctionalState NewState)
5406                     ; 2059 {
5407                     .text:	section	.text,new
5408  0000               _RTC_ITConfig:
5410  0000 89            	pushw	x
5411       00000000      OFST:	set	0
5414                     ; 2061   assert_param(IS_RTC_CONFIG_IT(RTC_IT));
5416                     ; 2062   assert_param(IS_FUNCTIONAL_STATE(NewState));
5418                     ; 2065   RTC->WPR = 0xCA;
5420  0001 35ca5159      	mov	20825,#202
5421                     ; 2066   RTC->WPR = 0x53;
5423  0005 35535159      	mov	20825,#83
5424                     ; 2068   if (NewState != DISABLE)
5426  0009 0d05          	tnz	(OFST+5,sp)
5427  000b 2715          	jreq	L1742
5428                     ; 2071     RTC->CR2 |= (uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5430  000d 9f            	ld	a,xl
5431  000e a4f0          	and	a,#240
5432  0010 ca5149        	or	a,20809
5433  0013 c75149        	ld	20809,a
5434                     ; 2072     RTC->TCR1 |= (uint8_t)((uint16_t)RTC_IT & RTC_TCR1_TAMPIE);
5436  0016 7b02          	ld	a,(OFST+2,sp)
5437  0018 a401          	and	a,#1
5438  001a ca516c        	or	a,20844
5439  001d c7516c        	ld	20844,a
5441  0020 2016          	jra	L3742
5442  0022               L1742:
5443                     ; 2077     RTC->CR2  &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5445  0022 7b02          	ld	a,(OFST+2,sp)
5446  0024 a4f0          	and	a,#240
5447  0026 43            	cpl	a
5448  0027 c45149        	and	a,20809
5449  002a c75149        	ld	20809,a
5450                     ; 2078     RTC->TCR1 &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)RTC_TCR1_TAMPIE);
5452  002d 7b02          	ld	a,(OFST+2,sp)
5453  002f a401          	and	a,#1
5454  0031 43            	cpl	a
5455  0032 c4516c        	and	a,20844
5456  0035 c7516c        	ld	20844,a
5457  0038               L3742:
5458                     ; 2082   RTC->WPR = 0xFF; 
5460  0038 35ff5159      	mov	20825,#255
5461                     ; 2083 }
5464  003c 85            	popw	x
5465  003d 81            	ret
5639                     ; 2090 FlagStatus RTC_GetFlagStatus(RTC_Flag_TypeDef RTC_FLAG)
5639                     ; 2091 {
5640                     .text:	section	.text,new
5641  0000               _RTC_GetFlagStatus:
5643  0000 89            	pushw	x
5644  0001 5203          	subw	sp,#3
5645       00000003      OFST:	set	3
5648                     ; 2092   FlagStatus flagstatus = RESET;
5650                     ; 2093   uint16_t tmpreg1 = 0;
5652                     ; 2094   uint16_t tmpreg2 = 0;
5654                     ; 2097   assert_param(IS_RTC_GET_FLAG(RTC_FLAG));
5656                     ; 2100   tmpreg2 = (uint16_t)((uint16_t)RTC->ISR1 << 8);
5658  0003 c6514c        	ld	a,20812
5659  0006 5f            	clrw	x
5660  0007 97            	ld	xl,a
5661  0008 4f            	clr	a
5662  0009 02            	rlwa	x,a
5663  000a 1f02          	ldw	(OFST-1,sp),x
5665                     ; 2101   tmpreg1 = (uint16_t)((uint16_t)((uint16_t)(RTC->ISR2)) | tmpreg2);
5667  000c c6514d        	ld	a,20813
5668  000f 5f            	clrw	x
5669  0010 97            	ld	xl,a
5670  0011 01            	rrwa	x,a
5671  0012 1a03          	or	a,(OFST+0,sp)
5672  0014 01            	rrwa	x,a
5673  0015 1a02          	or	a,(OFST-1,sp)
5674  0017 01            	rrwa	x,a
5675  0018 1f02          	ldw	(OFST-1,sp),x
5677                     ; 2104   if ((tmpreg1 & (uint16_t)RTC_FLAG) != RESET)
5679  001a 1e02          	ldw	x,(OFST-1,sp)
5680  001c 01            	rrwa	x,a
5681  001d 1405          	and	a,(OFST+2,sp)
5682  001f 01            	rrwa	x,a
5683  0020 1404          	and	a,(OFST+1,sp)
5684  0022 01            	rrwa	x,a
5685  0023 a30000        	cpw	x,#0
5686  0026 2706          	jreq	L3752
5687                     ; 2106     flagstatus = SET;
5689  0028 a601          	ld	a,#1
5690  002a 6b01          	ld	(OFST-2,sp),a
5693  002c 2002          	jra	L5752
5694  002e               L3752:
5695                     ; 2110     flagstatus = RESET;
5697  002e 0f01          	clr	(OFST-2,sp)
5699  0030               L5752:
5700                     ; 2112   return (FlagStatus)flagstatus;
5702  0030 7b01          	ld	a,(OFST-2,sp)
5705  0032 5b05          	addw	sp,#5
5706  0034 81            	ret
5741                     ; 2122 void RTC_ClearFlag(RTC_Flag_TypeDef RTC_FLAG)
5741                     ; 2123 {
5742                     .text:	section	.text,new
5743  0000               _RTC_ClearFlag:
5745  0000 89            	pushw	x
5746       00000000      OFST:	set	0
5749                     ; 2125   assert_param(IS_RTC_CLEAR_FLAG((uint16_t)RTC_FLAG));
5751                     ; 2128   RTC->ISR2 = (uint8_t)~((uint8_t)RTC_FLAG) ;
5753  0001 9f            	ld	a,xl
5754  0002 43            	cpl	a
5755  0003 c7514d        	ld	20813,a
5756                     ; 2129   RTC->ISR1 = (uint8_t)(((uint8_t)~(uint8_t)((uint16_t)RTC_FLAG >> (uint8_t)8)) & ((uint8_t)~(uint8_t)(RTC_ISR1_INIT)));
5758  0006 7b01          	ld	a,(OFST+1,sp)
5759  0008 43            	cpl	a
5760  0009 a47f          	and	a,#127
5761  000b c7514c        	ld	20812,a
5762                     ; 2130 }
5765  000e 85            	popw	x
5766  000f 81            	ret
5830                     ; 2138 ITStatus RTC_GetITStatus(RTC_IT_TypeDef RTC_IT)
5830                     ; 2139 {
5831                     .text:	section	.text,new
5832  0000               _RTC_GetITStatus:
5834  0000 89            	pushw	x
5835  0001 89            	pushw	x
5836       00000002      OFST:	set	2
5839                     ; 2140   ITStatus itstatus = RESET;
5841                     ; 2141   uint8_t enablestatus = 0, tmpreg = 0;
5845                     ; 2144   assert_param(IS_RTC_GET_IT(RTC_IT));
5847                     ; 2147   enablestatus = (uint8_t)(RTC->CR2 & (uint16_t)RTC_IT);
5849  0002 9f            	ld	a,xl
5850  0003 c45149        	and	a,20809
5851  0006 6b01          	ld	(OFST-1,sp),a
5853                     ; 2150   tmpreg = (uint8_t)(RTC->ISR2 & (uint8_t)((uint16_t)RTC_IT >> 4));
5855  0008 1e03          	ldw	x,(OFST+1,sp)
5856  000a 54            	srlw	x
5857  000b 54            	srlw	x
5858  000c 54            	srlw	x
5859  000d 54            	srlw	x
5860  000e 9f            	ld	a,xl
5861  000f c4514d        	and	a,20813
5862  0012 6b02          	ld	(OFST+0,sp),a
5864                     ; 2153   if ((enablestatus != (uint8_t)RESET) && (tmpreg != (uint8_t)RESET))
5866  0014 0d01          	tnz	(OFST-1,sp)
5867  0016 270a          	jreq	L7462
5869  0018 0d02          	tnz	(OFST+0,sp)
5870  001a 2706          	jreq	L7462
5871                     ; 2155     itstatus = SET;
5873  001c a601          	ld	a,#1
5874  001e 6b02          	ld	(OFST+0,sp),a
5877  0020 2002          	jra	L1562
5878  0022               L7462:
5879                     ; 2159     itstatus = RESET;
5881  0022 0f02          	clr	(OFST+0,sp)
5883  0024               L1562:
5884                     ; 2162   return (ITStatus)itstatus;
5886  0024 7b02          	ld	a,(OFST+0,sp)
5889  0026 5b04          	addw	sp,#4
5890  0028 81            	ret
5926                     ; 2172 void RTC_ClearITPendingBit(RTC_IT_TypeDef RTC_IT)
5926                     ; 2173 {
5927                     .text:	section	.text,new
5928  0000               _RTC_ClearITPendingBit:
5932                     ; 2175   assert_param(IS_RTC_CLEAR_IT((uint16_t)RTC_IT));
5934                     ; 2178   RTC->ISR2 = (uint8_t)~(uint8_t)((uint16_t)RTC_IT >> 4);
5936  0000 54            	srlw	x
5937  0001 54            	srlw	x
5938  0002 54            	srlw	x
5939  0003 54            	srlw	x
5940  0004 9f            	ld	a,xl
5941  0005 43            	cpl	a
5942  0006 c7514d        	ld	20813,a
5943                     ; 2179 }
5946  0009 81            	ret
5989                     ; 2202 static uint8_t ByteToBcd2(uint8_t Value)
5989                     ; 2203 {
5990                     .text:	section	.text,new
5991  0000               L3_ByteToBcd2:
5993  0000 88            	push	a
5994  0001 88            	push	a
5995       00000001      OFST:	set	1
5998                     ; 2204   uint8_t bcdhigh = 0;
6000  0002 0f01          	clr	(OFST+0,sp)
6003  0004 2008          	jra	L7172
6004  0006               L3172:
6005                     ; 2208     bcdhigh++;
6007  0006 0c01          	inc	(OFST+0,sp)
6009                     ; 2209     Value -= 10;
6011  0008 7b02          	ld	a,(OFST+1,sp)
6012  000a a00a          	sub	a,#10
6013  000c 6b02          	ld	(OFST+1,sp),a
6014  000e               L7172:
6015                     ; 2206   while (Value >= 10)
6017  000e 7b02          	ld	a,(OFST+1,sp)
6018  0010 a10a          	cp	a,#10
6019  0012 24f2          	jruge	L3172
6020                     ; 2212   return  (uint8_t)((uint8_t)(bcdhigh << 4) | Value);
6022  0014 7b01          	ld	a,(OFST+0,sp)
6023  0016 97            	ld	xl,a
6024  0017 a610          	ld	a,#16
6025  0019 42            	mul	x,a
6026  001a 9f            	ld	a,xl
6027  001b 1a02          	or	a,(OFST+1,sp)
6030  001d 85            	popw	x
6031  001e 81            	ret
6074                     ; 2220 static uint8_t Bcd2ToByte(uint8_t Value)
6074                     ; 2221 {
6075                     .text:	section	.text,new
6076  0000               L5_Bcd2ToByte:
6078  0000 88            	push	a
6079  0001 88            	push	a
6080       00000001      OFST:	set	1
6083                     ; 2222   uint8_t tmp = 0;
6085                     ; 2224   tmp = (uint8_t)((uint8_t)((uint8_t)(Value & (uint8_t)0xF0) >> 4) * (uint8_t)10);
6087  0002 a4f0          	and	a,#240
6088  0004 4e            	swap	a
6089  0005 a40f          	and	a,#15
6090  0007 97            	ld	xl,a
6091  0008 a60a          	ld	a,#10
6092  000a 42            	mul	x,a
6093  000b 9f            	ld	a,xl
6094  000c 6b01          	ld	(OFST+0,sp),a
6096                     ; 2226   return (uint8_t)(tmp + (Value & (uint8_t)0x0F));
6098  000e 7b02          	ld	a,(OFST+1,sp)
6099  0010 a40f          	and	a,#15
6100  0012 1b01          	add	a,(OFST+0,sp)
6103  0014 85            	popw	x
6104  0015 81            	ret
6117                     	xdef	_RTC_ClearITPendingBit
6118                     	xdef	_RTC_GetITStatus
6119                     	xdef	_RTC_ClearFlag
6120                     	xdef	_RTC_GetFlagStatus
6121                     	xdef	_RTC_ITConfig
6122                     	xdef	_RTC_TamperCmd
6123                     	xdef	_RTC_TamperPinsPrechargeDuration
6124                     	xdef	_RTC_TamperSamplingFreqConfig
6125                     	xdef	_RTC_TamperFilterConfig
6126                     	xdef	_RTC_TamperLevelConfig
6127                     	xdef	_RTC_CalibOutputCmd
6128                     	xdef	_RTC_CalibOutputConfig
6129                     	xdef	_RTC_SmoothCalibConfig
6130                     	xdef	_RTC_SynchroShiftConfig
6131                     	xdef	_RTC_OutputConfig
6132                     	xdef	_RTC_GetStoreOperation
6133                     	xdef	_RTC_DayLightSavingConfig
6134                     	xdef	_RTC_WakeUpCmd
6135                     	xdef	_RTC_GetWakeUpCounter
6136                     	xdef	_RTC_SetWakeUpCounter
6137                     	xdef	_RTC_WakeUpClockConfig
6138                     	xdef	_RTC_AlarmSubSecondConfig
6139                     	xdef	_RTC_AlarmCmd
6140                     	xdef	_RTC_GetAlarm
6141                     	xdef	_RTC_AlarmStructInit
6142                     	xdef	_RTC_SetAlarm
6143                     	xdef	_RTC_GetDate
6144                     	xdef	_RTC_DateStructInit
6145                     	xdef	_RTC_SetDate
6146                     	xdef	_RTC_GetSubSecond
6147                     	xdef	_RTC_GetTime
6148                     	xdef	_RTC_TimeStructInit
6149                     	xdef	_RTC_SetTime
6150                     	xdef	_RTC_BypassShadowCmd
6151                     	xdef	_RTC_RatioCmd
6152                     	xdef	_RTC_WaitForSynchro
6153                     	xdef	_RTC_ExitInitMode
6154                     	xdef	_RTC_EnterInitMode
6155                     	xdef	_RTC_WriteProtectionCmd
6156                     	xdef	_RTC_StructInit
6157                     	xdef	_RTC_Init
6158                     	xdef	_RTC_DeInit
6177                     	end
