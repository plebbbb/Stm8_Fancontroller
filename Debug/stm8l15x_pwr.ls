   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  43                     ; 82 void PWR_DeInit(void)
  43                     ; 83 {
  45                     .text:	section	.text,new
  46  0000               _PWR_DeInit:
  50                     ; 84   PWR->CSR1 = PWR_CSR1_PVDIF;
  52  0000 352050b2      	mov	20658,#32
  53                     ; 85   PWR->CSR2 = PWR_CSR2_RESET_VALUE;
  55  0004 725f50b3      	clr	20659
  56                     ; 86 }
  59  0008 81            	ret
 156                     ; 102 void PWR_PVDLevelConfig(PWR_PVDLevel_TypeDef PWR_PVDLevel)
 156                     ; 103 {
 157                     .text:	section	.text,new
 158  0000               _PWR_PVDLevelConfig:
 160  0000 88            	push	a
 161       00000000      OFST:	set	0
 164                     ; 105   assert_param(IS_PWR_PVD_LEVEL(PWR_PVDLevel));
 166                     ; 108   PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PLS);
 168  0001 c650b2        	ld	a,20658
 169  0004 a4f1          	and	a,#241
 170  0006 c750b2        	ld	20658,a
 171                     ; 111   PWR->CSR1 |= PWR_PVDLevel;
 173  0009 c650b2        	ld	a,20658
 174  000c 1a01          	or	a,(OFST+1,sp)
 175  000e c750b2        	ld	20658,a
 176                     ; 113 }
 179  0011 84            	pop	a
 180  0012 81            	ret
 235                     ; 121 void PWR_PVDCmd(FunctionalState NewState)
 235                     ; 122 {
 236                     .text:	section	.text,new
 237  0000               _PWR_PVDCmd:
 241                     ; 124   assert_param(IS_FUNCTIONAL_STATE(NewState));
 243                     ; 126   if (NewState != DISABLE)
 245  0000 4d            	tnz	a
 246  0001 2706          	jreq	L111
 247                     ; 129     PWR->CSR1 |= PWR_CSR1_PVDE;
 249  0003 721050b2      	bset	20658,#0
 251  0007 2004          	jra	L311
 252  0009               L111:
 253                     ; 134     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDE);
 255  0009 721150b2      	bres	20658,#0
 256  000d               L311:
 257                     ; 136 }
 260  000d 81            	ret
 295                     ; 171 void PWR_FastWakeUpCmd(FunctionalState NewState)
 295                     ; 172 {
 296                     .text:	section	.text,new
 297  0000               _PWR_FastWakeUpCmd:
 301                     ; 174   assert_param(IS_FUNCTIONAL_STATE(NewState));
 303                     ; 176   if (NewState != DISABLE)
 305  0000 4d            	tnz	a
 306  0001 2706          	jreq	L331
 307                     ; 179     PWR->CSR2 |= PWR_CSR2_FWU;
 309  0003 721450b3      	bset	20659,#2
 311  0007 2004          	jra	L531
 312  0009               L331:
 313                     ; 184     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_FWU);
 315  0009 721550b3      	bres	20659,#2
 316  000d               L531:
 317                     ; 186 }
 320  000d 81            	ret
 356                     ; 194 void PWR_UltraLowPowerCmd(FunctionalState NewState)
 356                     ; 195 {
 357                     .text:	section	.text,new
 358  0000               _PWR_UltraLowPowerCmd:
 362                     ; 197   assert_param(IS_FUNCTIONAL_STATE(NewState));
 364                     ; 199   if (NewState != DISABLE)
 366  0000 4d            	tnz	a
 367  0001 2706          	jreq	L551
 368                     ; 202     PWR->CSR2 |= PWR_CSR2_ULP;
 370  0003 721250b3      	bset	20659,#1
 372  0007 2004          	jra	L751
 373  0009               L551:
 374                     ; 207     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_ULP);
 376  0009 721350b3      	bres	20659,#1
 377  000d               L751:
 378                     ; 209 }
 381  000d 81            	ret
 416                     ; 232 void PWR_PVDITConfig(FunctionalState NewState)
 416                     ; 233 {
 417                     .text:	section	.text,new
 418  0000               _PWR_PVDITConfig:
 422                     ; 235   assert_param(IS_FUNCTIONAL_STATE(NewState));
 424                     ; 237   if (NewState != DISABLE)
 426  0000 4d            	tnz	a
 427  0001 2706          	jreq	L771
 428                     ; 240     PWR->CSR1 |= PWR_CSR1_PVDIEN;
 430  0003 721850b2      	bset	20658,#4
 432  0007 2004          	jra	L102
 433  0009               L771:
 434                     ; 245     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDIEN);
 436  0009 721950b2      	bres	20658,#4
 437  000d               L102:
 438                     ; 247 }
 441  000d 81            	ret
 534                     ; 261 FlagStatus PWR_GetFlagStatus(PWR_FLAG_TypeDef PWR_FLAG)
 534                     ; 262 {
 535                     .text:	section	.text,new
 536  0000               _PWR_GetFlagStatus:
 538  0000 88            	push	a
 539  0001 88            	push	a
 540       00000001      OFST:	set	1
 543                     ; 263   FlagStatus bitstatus = RESET;
 545                     ; 266   assert_param(IS_PWR_FLAG(PWR_FLAG));
 547                     ; 268   if ((PWR_FLAG & PWR_FLAG_VREFINTF) != 0)
 549  0002 a501          	bcp	a,#1
 550  0004 2711          	jreq	L742
 551                     ; 270     if ((PWR->CSR2 & PWR_CR2_VREFINTF) != (uint8_t)RESET )
 553  0006 c650b3        	ld	a,20659
 554  0009 a501          	bcp	a,#1
 555  000b 2706          	jreq	L152
 556                     ; 272       bitstatus = SET;
 558  000d a601          	ld	a,#1
 559  000f 6b01          	ld	(OFST+0,sp),a
 562  0011 2013          	jra	L552
 563  0013               L152:
 564                     ; 276       bitstatus = RESET;
 566  0013 0f01          	clr	(OFST+0,sp)
 568  0015 200f          	jra	L552
 569  0017               L742:
 570                     ; 281     if ((PWR->CSR1 & PWR_FLAG) != (uint8_t)RESET )
 572  0017 c650b2        	ld	a,20658
 573  001a 1502          	bcp	a,(OFST+1,sp)
 574  001c 2706          	jreq	L752
 575                     ; 283       bitstatus = SET;
 577  001e a601          	ld	a,#1
 578  0020 6b01          	ld	(OFST+0,sp),a
 581  0022 2002          	jra	L552
 582  0024               L752:
 583                     ; 287       bitstatus = RESET;
 585  0024 0f01          	clr	(OFST+0,sp)
 587  0026               L552:
 588                     ; 292   return((FlagStatus)bitstatus);
 590  0026 7b01          	ld	a,(OFST+0,sp)
 593  0028 85            	popw	x
 594  0029 81            	ret
 617                     ; 300 void PWR_PVDClearFlag(void)
 617                     ; 301 {
 618                     .text:	section	.text,new
 619  0000               _PWR_PVDClearFlag:
 623                     ; 303   PWR->CSR1 |= PWR_CSR1_PVDIF;
 625  0000 721a50b2      	bset	20658,#5
 626                     ; 304 }
 629  0004 81            	ret
 683                     ; 311 ITStatus PWR_PVDGetITStatus(void)
 683                     ; 312 {
 684                     .text:	section	.text,new
 685  0000               _PWR_PVDGetITStatus:
 687  0000 89            	pushw	x
 688       00000002      OFST:	set	2
 691                     ; 313   ITStatus bitstatus = RESET;
 693                     ; 315   uint8_t PVD_itStatus = 0x0, PVD_itEnable = 0x0;
 697                     ; 317   PVD_itStatus = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIF);
 699  0001 c650b2        	ld	a,20658
 700  0004 a420          	and	a,#32
 701  0006 6b01          	ld	(OFST-1,sp),a
 703                     ; 318   PVD_itEnable = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIEN);
 705  0008 c650b2        	ld	a,20658
 706  000b a410          	and	a,#16
 707  000d 6b02          	ld	(OFST+0,sp),a
 709                     ; 320   if ((PVD_itStatus != (uint8_t)RESET ) && (PVD_itEnable != (uint8_t)RESET))
 711  000f 0d01          	tnz	(OFST-1,sp)
 712  0011 270a          	jreq	L123
 714  0013 0d02          	tnz	(OFST+0,sp)
 715  0015 2706          	jreq	L123
 716                     ; 322     bitstatus = (ITStatus)SET;
 718  0017 a601          	ld	a,#1
 719  0019 6b02          	ld	(OFST+0,sp),a
 722  001b 2002          	jra	L323
 723  001d               L123:
 724                     ; 326     bitstatus = (ITStatus)RESET;
 726  001d 0f02          	clr	(OFST+0,sp)
 728  001f               L323:
 729                     ; 328   return ((ITStatus)bitstatus);
 731  001f 7b02          	ld	a,(OFST+0,sp)
 734  0021 85            	popw	x
 735  0022 81            	ret
 759                     ; 336 void PWR_PVDClearITPendingBit(void)
 759                     ; 337 {
 760                     .text:	section	.text,new
 761  0000               _PWR_PVDClearITPendingBit:
 765                     ; 339   PWR->CSR1 |= PWR_CSR1_PVDIF;
 767  0000 721a50b2      	bset	20658,#5
 768                     ; 340 }
 771  0004 81            	ret
 784                     	xdef	_PWR_PVDClearITPendingBit
 785                     	xdef	_PWR_PVDClearFlag
 786                     	xdef	_PWR_GetFlagStatus
 787                     	xdef	_PWR_PVDGetITStatus
 788                     	xdef	_PWR_PVDITConfig
 789                     	xdef	_PWR_UltraLowPowerCmd
 790                     	xdef	_PWR_FastWakeUpCmd
 791                     	xdef	_PWR_PVDCmd
 792                     	xdef	_PWR_PVDLevelConfig
 793                     	xdef	_PWR_DeInit
 812                     	end
