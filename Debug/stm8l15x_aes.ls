   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  43                     ; 93 void AES_DeInit(void)
  43                     ; 94 {
  45                     .text:	section	.text,new
  46  0000               _AES_DeInit:
  50                     ; 96   AES->CR = AES_CR_ERRC | AES_CR_CCFC;
  52  0000 351853d0      	mov	21456,#24
  53                     ; 97   AES->DINR = AES_DINR_RESET_VALUE;       /* Set AES_DINR to reset value 0x00 */
  55  0004 725f53d2      	clr	21458
  56                     ; 98   AES->DOUTR = AES_DOUTR_RESET_VALUE;     /* Set AES_DOUTR to reset value 0x00 */
  58  0008 725f53d3      	clr	21459
  59                     ; 99 }
  62  000c 81            	ret
 136                     ; 112 void AES_OperationModeConfig(AES_Operation_TypeDef AES_Operation)
 136                     ; 113 {
 137                     .text:	section	.text,new
 138  0000               _AES_OperationModeConfig:
 140  0000 88            	push	a
 141       00000000      OFST:	set	0
 144                     ; 115   assert_param(IS_AES_MODE(AES_Operation));
 146                     ; 118   AES->CR &= (uint8_t) (~AES_CR_MODE);
 148  0001 c653d0        	ld	a,21456
 149  0004 a4f9          	and	a,#249
 150  0006 c753d0        	ld	21456,a
 151                     ; 121   AES->CR |= (uint8_t) (AES_Operation);
 153  0009 c653d0        	ld	a,21456
 154  000c 1a01          	or	a,(OFST+1,sp)
 155  000e c753d0        	ld	21456,a
 156                     ; 122 }
 159  0011 84            	pop	a
 160  0012 81            	ret
 215                     ; 132 void AES_Cmd(FunctionalState NewState)
 215                     ; 133 {
 216                     .text:	section	.text,new
 217  0000               _AES_Cmd:
 221                     ; 135   assert_param(IS_FUNCTIONAL_STATE(NewState));
 223                     ; 137   if (NewState != DISABLE)
 225  0000 4d            	tnz	a
 226  0001 2706          	jreq	L101
 227                     ; 139     AES->CR |= (uint8_t) AES_CR_EN;   /**< AES Enable */
 229  0003 721053d0      	bset	21456,#0
 231  0007 2004          	jra	L301
 232  0009               L101:
 233                     ; 143     AES->CR &= (uint8_t)(~AES_CR_EN);  /**< AES Disable */
 235  0009 721153d0      	bres	21456,#0
 236  000d               L301:
 237                     ; 145 }
 240  000d 81            	ret
 274                     ; 170 void AES_WriteSubData(uint8_t Data)
 274                     ; 171 {
 275                     .text:	section	.text,new
 276  0000               _AES_WriteSubData:
 280                     ; 173   AES->DINR = Data;
 282  0000 c753d2        	ld	21458,a
 283                     ; 174 }
 286  0003 81            	ret
 320                     ; 183 void AES_WriteSubKey(uint8_t Key)
 320                     ; 184 {
 321                     .text:	section	.text,new
 322  0000               _AES_WriteSubKey:
 326                     ; 186   AES->DINR = Key;
 328  0000 c753d2        	ld	21458,a
 329                     ; 187 }
 332  0003 81            	ret
 355                     ; 195 uint8_t AES_ReadSubData(void)
 355                     ; 196 {
 356                     .text:	section	.text,new
 357  0000               _AES_ReadSubData:
 361                     ; 197   return AES->DOUTR;
 363  0000 c653d3        	ld	a,21459
 366  0003 81            	ret
 389                     ; 206 uint8_t AES_ReadSubKey(void)
 389                     ; 207 {
 390                     .text:	section	.text,new
 391  0000               _AES_ReadSubKey:
 395                     ; 208   return AES->DOUTR;
 397  0000 c653d3        	ld	a,21459
 400  0003 81            	ret
 459                     ; 237 void AES_DMAConfig(AES_DMATransfer_TypeDef AES_DMATransfer, FunctionalState NewState)
 459                     ; 238 {
 460                     .text:	section	.text,new
 461  0000               _AES_DMAConfig:
 463  0000 89            	pushw	x
 464       00000000      OFST:	set	0
 467                     ; 240   assert_param(IS_AES_DMATRANSFER(AES_DMATransfer));
 469                     ; 242   if (NewState != DISABLE)
 471  0001 9f            	ld	a,xl
 472  0002 4d            	tnz	a
 473  0003 2709          	jreq	L112
 474                     ; 245     AES->CR |= (uint8_t) AES_DMATransfer;
 476  0005 9e            	ld	a,xh
 477  0006 ca53d0        	or	a,21456
 478  0009 c753d0        	ld	21456,a
 480  000c 2009          	jra	L312
 481  000e               L112:
 482                     ; 250     AES->CR &= (uint8_t)(~AES_DMATransfer);
 484  000e 7b01          	ld	a,(OFST+1,sp)
 485  0010 43            	cpl	a
 486  0011 c453d0        	and	a,21456
 487  0014 c753d0        	ld	21456,a
 488  0017               L312:
 489                     ; 252 }
 492  0017 85            	popw	x
 493  0018 81            	ret
 558                     ; 281 void AES_ITConfig(AES_IT_TypeDef AES_IT, FunctionalState NewState)
 558                     ; 282 {
 559                     .text:	section	.text,new
 560  0000               _AES_ITConfig:
 562  0000 89            	pushw	x
 563       00000000      OFST:	set	0
 566                     ; 284   assert_param(IS_FUNCTIONAL_STATE(NewState));
 568                     ; 285   assert_param(IS_AES_IT(AES_IT));
 570                     ; 287   if (NewState != DISABLE)
 572  0001 9f            	ld	a,xl
 573  0002 4d            	tnz	a
 574  0003 2709          	jreq	L742
 575                     ; 289     AES->CR |= (uint8_t) AES_IT;    /**< AES_IT Enable */
 577  0005 9e            	ld	a,xh
 578  0006 ca53d0        	or	a,21456
 579  0009 c753d0        	ld	21456,a
 581  000c 2009          	jra	L152
 582  000e               L742:
 583                     ; 293     AES->CR &= (uint8_t)(~AES_IT);  /**< AES_IT Disable */
 585  000e 7b01          	ld	a,(OFST+1,sp)
 586  0010 43            	cpl	a
 587  0011 c453d0        	and	a,21456
 588  0014 c753d0        	ld	21456,a
 589  0017               L152:
 590                     ; 295 }
 593  0017 85            	popw	x
 594  0018 81            	ret
 687                     ; 307 FlagStatus AES_GetFlagStatus(AES_FLAG_TypeDef AES_FLAG)
 687                     ; 308 {
 688                     .text:	section	.text,new
 689  0000               _AES_GetFlagStatus:
 691  0000 88            	push	a
 692  0001 88            	push	a
 693       00000001      OFST:	set	1
 696                     ; 309   FlagStatus status = RESET;
 698                     ; 312   assert_param(IS_AES_FLAG(AES_FLAG));
 700                     ; 314   if (AES_FLAG == AES_FLAG_CCF)
 702  0002 a101          	cp	a,#1
 703  0004 2611          	jrne	L713
 704                     ; 316     if ((AES->SR & (uint8_t)AES_FLAG_CCF) != (uint8_t)0x00)
 706  0006 c653d1        	ld	a,21457
 707  0009 a501          	bcp	a,#1
 708  000b 2706          	jreq	L123
 709                     ; 319       status = (FlagStatus) SET;
 711  000d a601          	ld	a,#1
 712  000f 6b01          	ld	(OFST+0,sp),a
 715  0011 202a          	jra	L523
 716  0013               L123:
 717                     ; 324       status = (FlagStatus) RESET;
 719  0013 0f01          	clr	(OFST+0,sp)
 721  0015 2026          	jra	L523
 722  0017               L713:
 723                     ; 327   else if (AES_FLAG == AES_FLAG_RDERR)
 725  0017 7b02          	ld	a,(OFST+1,sp)
 726  0019 a102          	cp	a,#2
 727  001b 2611          	jrne	L723
 728                     ; 329     if ((AES->SR & (uint8_t)AES_FLAG_RDERR) != (uint8_t)0x00)
 730  001d c653d1        	ld	a,21457
 731  0020 a502          	bcp	a,#2
 732  0022 2706          	jreq	L133
 733                     ; 332       status = (FlagStatus) SET;
 735  0024 a601          	ld	a,#1
 736  0026 6b01          	ld	(OFST+0,sp),a
 739  0028 2013          	jra	L523
 740  002a               L133:
 741                     ; 337       status = (FlagStatus) RESET;
 743  002a 0f01          	clr	(OFST+0,sp)
 745  002c 200f          	jra	L523
 746  002e               L723:
 747                     ; 342     if ((AES->SR & (uint8_t)AES_FLAG_WRERR) != (uint8_t)0x00)
 749  002e c653d1        	ld	a,21457
 750  0031 a504          	bcp	a,#4
 751  0033 2706          	jreq	L733
 752                     ; 345       status = (FlagStatus) SET;
 754  0035 a601          	ld	a,#1
 755  0037 6b01          	ld	(OFST+0,sp),a
 758  0039 2002          	jra	L523
 759  003b               L733:
 760                     ; 350       status = (FlagStatus) RESET;
 762  003b 0f01          	clr	(OFST+0,sp)
 764  003d               L523:
 765                     ; 354   return ((FlagStatus) status);
 767  003d 7b01          	ld	a,(OFST+0,sp)
 770  003f 85            	popw	x
 771  0040 81            	ret
 806                     ; 366 void AES_ClearFlag(AES_FLAG_TypeDef AES_FLAG)
 806                     ; 367 {
 807                     .text:	section	.text,new
 808  0000               _AES_ClearFlag:
 812                     ; 369   assert_param(IS_AES_FLAG(AES_FLAG));
 814                     ; 372   if (AES_FLAG == AES_FLAG_CCF)
 816  0000 a101          	cp	a,#1
 817  0002 2606          	jrne	L163
 818                     ; 375     AES->CR |= (uint8_t) AES_CR_CCFC;
 820  0004 721653d0      	bset	21456,#3
 822  0008 2004          	jra	L363
 823  000a               L163:
 824                     ; 380     AES->CR |= (uint8_t) AES_CR_ERRC;
 826  000a 721853d0      	bset	21456,#4
 827  000e               L363:
 828                     ; 382 }
 831  000e 81            	ret
 897                     ; 392 ITStatus AES_GetITStatus(AES_IT_TypeDef AES_IT)
 897                     ; 393 {
 898                     .text:	section	.text,new
 899  0000               _AES_GetITStatus:
 901  0000 88            	push	a
 902  0001 89            	pushw	x
 903       00000002      OFST:	set	2
 906                     ; 394   ITStatus itstatus = RESET;
 908                     ; 395   BitStatus cciebitstatus, ccfbitstatus = RESET;
 910                     ; 398   assert_param(IS_AES_IT(AES_IT));
 912                     ; 400   cciebitstatus = (BitStatus) (AES->CR & AES_CR_CCIE);
 914  0002 c653d0        	ld	a,21456
 915  0005 a420          	and	a,#32
 916  0007 6b01          	ld	(OFST-1,sp),a
 918                     ; 401   ccfbitstatus =  (BitStatus) (AES->SR & AES_SR_CCF);
 920  0009 c653d1        	ld	a,21457
 921  000c a401          	and	a,#1
 922  000e 6b02          	ld	(OFST+0,sp),a
 924                     ; 404   if (AES_IT == AES_IT_CCIE)
 926  0010 7b03          	ld	a,(OFST+1,sp)
 927  0012 a120          	cp	a,#32
 928  0014 2612          	jrne	L714
 929                     ; 407     if (((cciebitstatus) != RESET) && ((ccfbitstatus) != RESET))
 931  0016 0d01          	tnz	(OFST-1,sp)
 932  0018 270a          	jreq	L124
 934  001a 0d02          	tnz	(OFST+0,sp)
 935  001c 2706          	jreq	L124
 936                     ; 410       itstatus = (ITStatus) SET;
 938  001e a601          	ld	a,#1
 939  0020 6b02          	ld	(OFST+0,sp),a
 942  0022 201e          	jra	L524
 943  0024               L124:
 944                     ; 415       itstatus = (ITStatus) RESET;
 946  0024 0f02          	clr	(OFST+0,sp)
 948  0026 201a          	jra	L524
 949  0028               L714:
 950                     ; 421     if ((AES->CR & AES_CR_ERRIE) != RESET)
 952  0028 c653d0        	ld	a,21456
 953  002b a540          	bcp	a,#64
 954  002d 2711          	jreq	L724
 955                     ; 424       if ((AES->SR & (uint8_t)(AES_SR_WRERR | AES_SR_RDERR)) != RESET)
 957  002f c653d1        	ld	a,21457
 958  0032 a506          	bcp	a,#6
 959  0034 2706          	jreq	L134
 960                     ; 427         itstatus = (ITStatus) SET;
 962  0036 a601          	ld	a,#1
 963  0038 6b02          	ld	(OFST+0,sp),a
 966  003a 2006          	jra	L524
 967  003c               L134:
 968                     ; 432         itstatus = (ITStatus) RESET;
 970  003c 0f02          	clr	(OFST+0,sp)
 972  003e 2002          	jra	L524
 973  0040               L724:
 974                     ; 438       itstatus = (ITStatus) RESET;
 976  0040 0f02          	clr	(OFST+0,sp)
 978  0042               L524:
 979                     ; 443   return ((ITStatus)itstatus);
 981  0042 7b02          	ld	a,(OFST+0,sp)
 984  0044 5b03          	addw	sp,#3
 985  0046 81            	ret
1021                     ; 454 void AES_ClearITPendingBit(AES_IT_TypeDef AES_IT)
1021                     ; 455 {
1022                     .text:	section	.text,new
1023  0000               _AES_ClearITPendingBit:
1027                     ; 457   assert_param(IS_AES_IT(AES_IT));
1029                     ; 460   if (AES_IT == AES_IT_CCIE)
1031  0000 a120          	cp	a,#32
1032  0002 2606          	jrne	L554
1033                     ; 463     AES->CR |= (uint8_t) AES_CR_CCFC;
1035  0004 721653d0      	bset	21456,#3
1037  0008 2004          	jra	L754
1038  000a               L554:
1039                     ; 468     AES->CR |= (uint8_t) AES_CR_ERRC;
1041  000a 721853d0      	bset	21456,#4
1042  000e               L754:
1043                     ; 470 }
1046  000e 81            	ret
1059                     	xdef	_AES_ClearITPendingBit
1060                     	xdef	_AES_GetITStatus
1061                     	xdef	_AES_ClearFlag
1062                     	xdef	_AES_GetFlagStatus
1063                     	xdef	_AES_ITConfig
1064                     	xdef	_AES_DMAConfig
1065                     	xdef	_AES_ReadSubKey
1066                     	xdef	_AES_ReadSubData
1067                     	xdef	_AES_WriteSubKey
1068                     	xdef	_AES_WriteSubData
1069                     	xdef	_AES_Cmd
1070                     	xdef	_AES_OperationModeConfig
1071                     	xdef	_AES_DeInit
1090                     	end
