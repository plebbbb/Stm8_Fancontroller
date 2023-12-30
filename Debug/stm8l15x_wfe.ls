   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  43                     ; 95 void WFE_DeInit(void)
  43                     ; 96 {
  45                     .text:	section	.text,new
  46  0000               _WFE_DeInit:
  50                     ; 97   WFE->CR1 = WFE_CRX_RESET_VALUE;
  52  0000 725f50a6      	clr	20646
  53                     ; 98   WFE->CR2 = WFE_CRX_RESET_VALUE;
  55  0004 725f50a7      	clr	20647
  56                     ; 99   WFE->CR3 = WFE_CRX_RESET_VALUE;
  58  0008 725f50a8      	clr	20648
  59                     ; 100   WFE->CR4 = WFE_CRX_RESET_VALUE;
  61  000c 725f50a9      	clr	20649
  62                     ; 101 }
  65  0010 81            	ret
 389                     ; 141 void WFE_WakeUpSourceEventCmd(WFE_Source_TypeDef WFE_Source, FunctionalState NewState)
 389                     ; 142 {
 390                     .text:	section	.text,new
 391  0000               _WFE_WakeUpSourceEventCmd:
 393  0000 89            	pushw	x
 394  0001 88            	push	a
 395       00000001      OFST:	set	1
 398                     ; 143   uint8_t register_index = 0;
 400                     ; 145   assert_param(IS_WFE_SOURCE(WFE_Source));
 402                     ; 146   assert_param(IS_FUNCTIONAL_STATE(NewState));
 404                     ; 149   register_index = (uint8_t)((uint16_t)WFE_Source >> 0x08);
 406  0002 9e            	ld	a,xh
 407  0003 6b01          	ld	(OFST+0,sp),a
 409                     ; 151   if (NewState != DISABLE)
 411  0005 0d06          	tnz	(OFST+5,sp)
 412  0007 273c          	jreq	L502
 413                     ; 153     switch (register_index)
 415  0009 7b01          	ld	a,(OFST+0,sp)
 417                     ; 171       default:
 417                     ; 172         break;
 418  000b 4a            	dec	a
 419  000c 270b          	jreq	L12
 420  000e 4a            	dec	a
 421  000f 2712          	jreq	L32
 422  0011 4a            	dec	a
 423  0012 2719          	jreq	L52
 424  0014 4a            	dec	a
 425  0015 2720          	jreq	L72
 426  0017 2045          	jra	L312
 427  0019               L12:
 428                     ; 155       case 1:
 428                     ; 156         WFE->CR1 |= (uint8_t)WFE_Source;
 430  0019 c650a6        	ld	a,20646
 431  001c 1a03          	or	a,(OFST+2,sp)
 432  001e c750a6        	ld	20646,a
 433                     ; 157         break;
 435  0021 203b          	jra	L312
 436  0023               L32:
 437                     ; 159       case 2:
 437                     ; 160         WFE->CR2 |= (uint8_t)WFE_Source;
 439  0023 c650a7        	ld	a,20647
 440  0026 1a03          	or	a,(OFST+2,sp)
 441  0028 c750a7        	ld	20647,a
 442                     ; 161         break;
 444  002b 2031          	jra	L312
 445  002d               L52:
 446                     ; 163       case 3:
 446                     ; 164         WFE->CR3 |= (uint8_t)WFE_Source;
 448  002d c650a8        	ld	a,20648
 449  0030 1a03          	or	a,(OFST+2,sp)
 450  0032 c750a8        	ld	20648,a
 451                     ; 165         break;
 453  0035 2027          	jra	L312
 454  0037               L72:
 455                     ; 167       case 4:
 455                     ; 168         WFE->CR4 |= (uint8_t)WFE_Source;
 457  0037 c650a9        	ld	a,20649
 458  003a 1a03          	or	a,(OFST+2,sp)
 459  003c c750a9        	ld	20649,a
 460                     ; 169         break;
 462  003f 201d          	jra	L312
 463  0041               L13:
 464                     ; 171       default:
 464                     ; 172         break;
 466  0041 201b          	jra	L312
 467  0043               L112:
 469  0043 2019          	jra	L312
 470  0045               L502:
 471                     ; 177     switch (register_index)
 473  0045 7b01          	ld	a,(OFST+0,sp)
 475                     ; 195       default:
 475                     ; 196         break;
 476  0047 4a            	dec	a
 477  0048 270b          	jreq	L33
 478  004a 4a            	dec	a
 479  004b 2714          	jreq	L53
 480  004d 4a            	dec	a
 481  004e 271c          	jreq	L73
 482  0050 4a            	dec	a
 483  0051 2724          	jreq	L14
 484  0053 2009          	jra	L312
 485  0055               L33:
 486                     ; 179       case 1:
 486                     ; 180         WFE->CR1 &= (uint8_t)(~(uint8_t)WFE_Source);
 488  0055 7b03          	ld	a,(OFST+2,sp)
 489  0057 43            	cpl	a
 490  0058 c450a6        	and	a,20646
 491  005b c750a6        	ld	20646,a
 492                     ; 181         break;
 493  005e               L312:
 494                     ; 199 }
 497  005e 5b03          	addw	sp,#3
 498  0060 81            	ret
 499  0061               L53:
 500                     ; 183       case 2:
 500                     ; 184         WFE->CR2 &= (uint8_t)(~ (uint8_t)WFE_Source);
 502  0061 7b03          	ld	a,(OFST+2,sp)
 503  0063 43            	cpl	a
 504  0064 c450a7        	and	a,20647
 505  0067 c750a7        	ld	20647,a
 506                     ; 185         break;
 508  006a 20f2          	jra	L312
 509  006c               L73:
 510                     ; 187       case 3:
 510                     ; 188         WFE->CR3 &= (uint8_t)(~(uint8_t)WFE_Source);
 512  006c 7b03          	ld	a,(OFST+2,sp)
 513  006e 43            	cpl	a
 514  006f c450a8        	and	a,20648
 515  0072 c750a8        	ld	20648,a
 516                     ; 189         break;
 518  0075 20e7          	jra	L312
 519  0077               L14:
 520                     ; 191       case 4:
 520                     ; 192         WFE->CR4 &= (uint8_t)(~(uint8_t)WFE_Source);
 522  0077 7b03          	ld	a,(OFST+2,sp)
 523  0079 43            	cpl	a
 524  007a c450a9        	and	a,20649
 525  007d c750a9        	ld	20649,a
 526                     ; 193         break;
 528  0080 20dc          	jra	L312
 529  0082               L34:
 530                     ; 195       default:
 530                     ; 196         break;
 532  0082 20da          	jra	L312
 533  0084               L712:
 534  0084 20d8          	jra	L312
 581                     ; 237 FunctionalState WFE_GetWakeUpSourceEventStatus(WFE_Source_TypeDef WFE_Source)
 581                     ; 238 {
 582                     .text:	section	.text,new
 583  0000               _WFE_GetWakeUpSourceEventStatus:
 585  0000 89            	pushw	x
 586  0001 88            	push	a
 587       00000001      OFST:	set	1
 590                     ; 239   FunctionalState status = DISABLE;
 592  0002 0f01          	clr	(OFST+0,sp)
 594                     ; 241   assert_param(IS_WFE_SOURCE(WFE_Source));
 596                     ; 243   switch (WFE_Source)
 599                     ; 326     default:
 599                     ; 327       break;
 600  0004 1d0101        	subw	x,#257
 601  0007 2603          	jrne	L21
 602  0009 cc00a7        	jp	L122
 603  000c               L21:
 604  000c 5a            	decw	x
 605  000d 2603          	jrne	L41
 606  000f cc00a7        	jp	L122
 607  0012               L41:
 608  0012 1d0002        	subw	x,#2
 609  0015 2603          	jrne	L61
 610  0017 cc00a7        	jp	L122
 611  001a               L61:
 612  001a 1d0004        	subw	x,#4
 613  001d 2603          	jrne	L02
 614  001f cc00a7        	jp	L122
 615  0022               L02:
 616  0022 1d0008        	subw	x,#8
 617  0025 2602          	jrne	L22
 618  0027 207e          	jp	L122
 619  0029               L22:
 620  0029 1d0010        	subw	x,#16
 621  002c 2779          	jreq	L122
 622  002e 1d0020        	subw	x,#32
 623  0031 2774          	jreq	L122
 624  0033 1d0040        	subw	x,#64
 625  0036 276f          	jreq	L122
 626  0038 1d0081        	subw	x,#129
 627  003b 277b          	jreq	L322
 628  003d 5a            	decw	x
 629  003e 2778          	jreq	L322
 630  0040 1d0002        	subw	x,#2
 631  0043 2773          	jreq	L322
 632  0045 1d0004        	subw	x,#4
 633  0048 276e          	jreq	L322
 634  004a 1d0008        	subw	x,#8
 635  004d 2769          	jreq	L322
 636  004f 1d0010        	subw	x,#16
 637  0052 2764          	jreq	L322
 638  0054 1d0020        	subw	x,#32
 639  0057 275f          	jreq	L322
 640  0059 1d0040        	subw	x,#64
 641  005c 275a          	jreq	L322
 642  005e 1d0081        	subw	x,#129
 643  0061 2766          	jreq	L522
 644  0063 5a            	decw	x
 645  0064 2763          	jreq	L522
 646  0066 1d0002        	subw	x,#2
 647  0069 275e          	jreq	L522
 648  006b 1d0004        	subw	x,#4
 649  006e 2759          	jreq	L522
 650  0070 1d0008        	subw	x,#8
 651  0073 2754          	jreq	L522
 652  0075 1d0010        	subw	x,#16
 653  0078 274f          	jreq	L522
 654  007a 1d0020        	subw	x,#32
 655  007d 274a          	jreq	L522
 656  007f 1d0040        	subw	x,#64
 657  0082 2745          	jreq	L522
 658  0084 1d0081        	subw	x,#129
 659  0087 2751          	jreq	L722
 660  0089 5a            	decw	x
 661  008a 274e          	jreq	L722
 662  008c 1d0002        	subw	x,#2
 663  008f 2749          	jreq	L722
 664  0091 1d0004        	subw	x,#4
 665  0094 2744          	jreq	L722
 666  0096 1d0008        	subw	x,#8
 667  0099 273f          	jreq	L722
 668  009b 1d0010        	subw	x,#16
 669  009e 273a          	jreq	L722
 670  00a0 1d0020        	subw	x,#32
 671  00a3 2735          	jreq	L722
 672  00a5 2042          	jra	L752
 673  00a7               L122:
 674                     ; 245     case WFE_Source_TIM2_EV0:
 674                     ; 246     case WFE_Source_TIM2_EV1:
 674                     ; 247     case WFE_Source_TIM1_EV0:
 674                     ; 248     case WFE_Source_TIM1_EV1:
 674                     ; 249     case WFE_Source_EXTI_EV0:
 674                     ; 250     case WFE_Source_EXTI_EV1:
 674                     ; 251     case WFE_Source_EXTI_EV2:
 674                     ; 252     case WFE_Source_EXTI_EV3:
 674                     ; 253 
 674                     ; 254       if ((WFE->CR1 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 676  00a7 c650a6        	ld	a,20646
 677  00aa 1503          	bcp	a,(OFST+2,sp)
 678  00ac 2706          	jreq	L162
 679                     ; 257         status = ENABLE;
 681  00ae a601          	ld	a,#1
 682  00b0 6b01          	ld	(OFST+0,sp),a
 685  00b2 2035          	jra	L752
 686  00b4               L162:
 687                     ; 262         status = DISABLE;
 689  00b4 0f01          	clr	(OFST+0,sp)
 691  00b6 2031          	jra	L752
 692  00b8               L322:
 693                     ; 266     case WFE_Source_EXTI_EV4:
 693                     ; 267     case WFE_Source_EXTI_EV5:
 693                     ; 268     case WFE_Source_EXTI_EV6:
 693                     ; 269     case WFE_Source_EXTI_EV7:
 693                     ; 270     case WFE_Source_EXTI_EVB_G:
 693                     ; 271     case WFE_Source_EXTI_EVD_H:
 693                     ; 272     case WFE_Source_EXTI_EVE_F:
 693                     ; 273     case WFE_Source_ADC1_COMP_EV:
 693                     ; 274 
 693                     ; 275       if ((WFE->CR2 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 695  00b8 c650a7        	ld	a,20647
 696  00bb 1503          	bcp	a,(OFST+2,sp)
 697  00bd 2706          	jreq	L562
 698                     ; 278         status = ENABLE;
 700  00bf a601          	ld	a,#1
 701  00c1 6b01          	ld	(OFST+0,sp),a
 704  00c3 2024          	jra	L752
 705  00c5               L562:
 706                     ; 283         status = DISABLE;
 708  00c5 0f01          	clr	(OFST+0,sp)
 710  00c7 2020          	jra	L752
 711  00c9               L522:
 712                     ; 286     case WFE_Source_TIM3_EV0:
 712                     ; 287     case WFE_Source_TIM3_EV1:
 712                     ; 288     case WFE_Source_TIM4_EV:
 712                     ; 289     case WFE_Source_SPI1_EV:
 712                     ; 290     case WFE_Source_I2C1_EV:
 712                     ; 291     case WFE_Source_USART1_EV:
 712                     ; 292     case WFE_Source_DMA1CH01_EV:
 712                     ; 293     case WFE_Source_DMA1CH23_EV:
 712                     ; 294 
 712                     ; 295       if ((WFE->CR3 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 714  00c9 c650a8        	ld	a,20648
 715  00cc 1503          	bcp	a,(OFST+2,sp)
 716  00ce 2706          	jreq	L172
 717                     ; 298         status = ENABLE;
 719  00d0 a601          	ld	a,#1
 720  00d2 6b01          	ld	(OFST+0,sp),a
 723  00d4 2013          	jra	L752
 724  00d6               L172:
 725                     ; 303         status = DISABLE;
 727  00d6 0f01          	clr	(OFST+0,sp)
 729  00d8 200f          	jra	L752
 730  00da               L722:
 731                     ; 307     case WFE_Source_TIM5_EV0:
 731                     ; 308     case WFE_Source_TIM5_EV1:
 731                     ; 309     case WFE_Source_AES_EV:
 731                     ; 310     case WFE_Source_SPI2_EV:
 731                     ; 311     case WFE_Source_USART2_EV:
 731                     ; 312     case WFE_Source_USART3_EV:
 731                     ; 313     case WFE_Source_RTC_CSS_EV:
 731                     ; 314 
 731                     ; 315       if ((WFE->CR4 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 733  00da c650a9        	ld	a,20649
 734  00dd 1503          	bcp	a,(OFST+2,sp)
 735  00df 2706          	jreq	L572
 736                     ; 318         status = ENABLE;
 738  00e1 a601          	ld	a,#1
 739  00e3 6b01          	ld	(OFST+0,sp),a
 742  00e5 2002          	jra	L752
 743  00e7               L572:
 744                     ; 323         status = DISABLE;
 746  00e7 0f01          	clr	(OFST+0,sp)
 748  00e9               L132:
 749                     ; 326     default:
 749                     ; 327       break;
 751  00e9               L752:
 752                     ; 329   return status;
 754  00e9 7b01          	ld	a,(OFST+0,sp)
 757  00eb 5b03          	addw	sp,#3
 758  00ed 81            	ret
 771                     	xdef	_WFE_GetWakeUpSourceEventStatus
 772                     	xdef	_WFE_WakeUpSourceEventCmd
 773                     	xdef	_WFE_DeInit
 792                     	end
