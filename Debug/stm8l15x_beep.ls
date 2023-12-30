   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  43                     ; 92 void BEEP_DeInit(void)
  43                     ; 93 {
  45                     .text:	section	.text,new
  46  0000               _BEEP_DeInit:
  50                     ; 94   BEEP->CSR1 = BEEP_CSR1_RESET_VALUE;
  52  0000 725f50f0      	clr	20720
  53                     ; 95   BEEP->CSR2 = BEEP_CSR2_RESET_VALUE;
  55  0004 351f50f3      	mov	20723,#31
  56                     ; 96 }
  59  0008 81            	ret
 124                     ; 105 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 124                     ; 106 {
 125                     .text:	section	.text,new
 126  0000               _BEEP_Init:
 128  0000 88            	push	a
 129       00000000      OFST:	set	0
 132                     ; 109   assert_param(IS_BEEP_FREQUENCY(BEEP_Frequency));
 134                     ; 112   if ((BEEP->CSR2 & BEEP_CSR2_BEEPDIV) == BEEP_CSR2_BEEPDIV)
 136  0001 c650f3        	ld	a,20723
 137  0004 a41f          	and	a,#31
 138  0006 a11f          	cp	a,#31
 139  0008 260c          	jrne	L15
 140                     ; 114     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 142  000a c650f3        	ld	a,20723
 143  000d a4e0          	and	a,#224
 144  000f c750f3        	ld	20723,a
 145                     ; 115     BEEP->CSR2 |= BEEP_CALIBRATION_DEFAULT;
 147  0012 721050f3      	bset	20723,#0
 148  0016               L15:
 149                     ; 119   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPSEL);
 151  0016 c650f3        	ld	a,20723
 152  0019 a43f          	and	a,#63
 153  001b c750f3        	ld	20723,a
 154                     ; 120   BEEP->CSR2 |= (uint8_t)(BEEP_Frequency);
 156  001e c650f3        	ld	a,20723
 157  0021 1a01          	or	a,(OFST+1,sp)
 158  0023 c750f3        	ld	20723,a
 159                     ; 122 }
 162  0026 84            	pop	a
 163  0027 81            	ret
 218                     ; 130 void BEEP_Cmd(FunctionalState NewState)
 218                     ; 131 {
 219                     .text:	section	.text,new
 220  0000               _BEEP_Cmd:
 224                     ; 133   assert_param(IS_FUNCTIONAL_STATE(NewState));
 226                     ; 135   if (NewState != DISABLE)
 228  0000 4d            	tnz	a
 229  0001 2706          	jreq	L101
 230                     ; 138     BEEP->CSR2 |= BEEP_CSR2_BEEPEN;
 232  0003 721a50f3      	bset	20723,#5
 234  0007 2004          	jra	L301
 235  0009               L101:
 236                     ; 143     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPEN);
 238  0009 721b50f3      	bres	20723,#5
 239  000d               L301:
 240                     ; 145 }
 243  000d 81            	ret
 279                     ; 178 void BEEP_LSClockToTIMConnectCmd(FunctionalState NewState)
 279                     ; 179 {
 280                     .text:	section	.text,new
 281  0000               _BEEP_LSClockToTIMConnectCmd:
 285                     ; 181   assert_param(IS_FUNCTIONAL_STATE(NewState));
 287                     ; 183   if (NewState != DISABLE)
 289  0000 4d            	tnz	a
 290  0001 2706          	jreq	L321
 291                     ; 186     BEEP->CSR1 |= BEEP_CSR1_MSR;
 293  0003 721050f0      	bset	20720,#0
 295  0007 2004          	jra	L521
 296  0009               L321:
 297                     ; 191     BEEP->CSR1 &= (uint8_t)(~BEEP_CSR1_MSR);
 299  0009 721150f0      	bres	20720,#0
 300  000d               L521:
 301                     ; 193 }
 304  000d 81            	ret
 357                     .const:	section	.text
 358  0000               L61:
 359  0000 000003e8      	dc.l	1000
 360                     ; 207 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 360                     ; 208 {
 361                     .text:	section	.text,new
 362  0000               _BEEP_LSICalibrationConfig:
 364  0000 5206          	subw	sp,#6
 365       00000006      OFST:	set	6
 368                     ; 213   assert_param(IS_LSI_FREQUENCY(LSIFreqHz));
 370                     ; 215   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 372  0002 96            	ldw	x,sp
 373  0003 1c0009        	addw	x,#OFST+3
 374  0006 cd0000        	call	c_ltor
 376  0009 ae0000        	ldw	x,#L61
 377  000c cd0000        	call	c_ludv
 379  000f be02          	ldw	x,c_lreg+2
 380  0011 1f03          	ldw	(OFST-3,sp),x
 382                     ; 219   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 384  0013 c650f3        	ld	a,20723
 385  0016 a4e0          	and	a,#224
 386  0018 c750f3        	ld	20723,a
 387                     ; 221   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 389  001b 1e03          	ldw	x,(OFST-3,sp)
 390  001d 54            	srlw	x
 391  001e 54            	srlw	x
 392  001f 54            	srlw	x
 393  0020 1f05          	ldw	(OFST-1,sp),x
 395                     ; 223   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 397  0022 1e05          	ldw	x,(OFST-1,sp)
 398  0024 58            	sllw	x
 399  0025 58            	sllw	x
 400  0026 58            	sllw	x
 401  0027 1f01          	ldw	(OFST-5,sp),x
 403  0029 1e03          	ldw	x,(OFST-3,sp)
 404  002b 72f001        	subw	x,(OFST-5,sp)
 405  002e 1605          	ldw	y,(OFST-1,sp)
 406  0030 9058          	sllw	y
 407  0032 905c          	incw	y
 408  0034 cd0000        	call	c_imul
 410  0037 1605          	ldw	y,(OFST-1,sp)
 411  0039 9058          	sllw	y
 412  003b 9058          	sllw	y
 413  003d 9058          	sllw	y
 414  003f bf00          	ldw	c_x,x
 415  0041 90b300        	cpw	y,c_x
 416  0044 250c          	jrult	L551
 417                     ; 225     BEEP->CSR2 |= (uint8_t)(A - 2U);
 419  0046 7b06          	ld	a,(OFST+0,sp)
 420  0048 a002          	sub	a,#2
 421  004a ca50f3        	or	a,20723
 422  004d c750f3        	ld	20723,a
 424  0050 2009          	jra	L751
 425  0052               L551:
 426                     ; 229     BEEP->CSR2 |= (uint8_t)(A - 1U);
 428  0052 7b06          	ld	a,(OFST+0,sp)
 429  0054 4a            	dec	a
 430  0055 ca50f3        	or	a,20723
 431  0058 c750f3        	ld	20723,a
 432  005b               L751:
 433                     ; 231 }
 436  005b 5b06          	addw	sp,#6
 437  005d 81            	ret
 450                     	xdef	_BEEP_LSICalibrationConfig
 451                     	xdef	_BEEP_LSClockToTIMConnectCmd
 452                     	xdef	_BEEP_Cmd
 453                     	xdef	_BEEP_Init
 454                     	xdef	_BEEP_DeInit
 455                     	xref.b	c_lreg
 456                     	xref.b	c_x
 475                     	xref	c_imul
 476                     	xref	c_ludv
 477                     	xref	c_ltor
 478                     	end
