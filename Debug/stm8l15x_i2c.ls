   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
 199                     ; 141 void I2C_DeInit(I2C_TypeDef* I2Cx)
 199                     ; 142 {
 201                     .text:	section	.text,new
 202  0000               _I2C_DeInit:
 206                     ; 143   I2Cx->CR1 = I2C_CR1_RESET_VALUE;
 208  0000 7f            	clr	(x)
 209                     ; 144   I2Cx->CR2 = I2C_CR2_RESET_VALUE;
 211  0001 6f01          	clr	(1,x)
 212                     ; 145   I2Cx->FREQR = I2C_FREQR_RESET_VALUE;
 214  0003 6f02          	clr	(2,x)
 215                     ; 146   I2Cx->OARL = I2C_OARL_RESET_VALUE;
 217  0005 6f03          	clr	(3,x)
 218                     ; 147   I2Cx->OARH = I2C_OARH_RESET_VALUE;
 220  0007 6f04          	clr	(4,x)
 221                     ; 148   I2Cx->OAR2 = I2C_OAR2_RESET_VALUE;
 223  0009 6f05          	clr	(5,x)
 224                     ; 149   I2Cx->ITR = I2C_ITR_RESET_VALUE;
 226  000b 6f0a          	clr	(10,x)
 227                     ; 150   I2Cx->CCRL = I2C_CCRL_RESET_VALUE;
 229  000d 6f0b          	clr	(11,x)
 230                     ; 151   I2Cx->CCRH = I2C_CCRH_RESET_VALUE;
 232  000f 6f0c          	clr	(12,x)
 233                     ; 152   I2Cx->TRISER = I2C_TRISER_RESET_VALUE;
 235  0011 a602          	ld	a,#2
 236  0013 e70d          	ld	(13,x),a
 237                     ; 153 }
 240  0015 81            	ret
 464                     .const:	section	.text
 465  0000               L01:
 466  0000 000f4240      	dc.l	1000000
 467  0004               L21:
 468  0004 000186a1      	dc.l	100001
 469  0008               L41:
 470  0008 00000004      	dc.l	4
 471                     ; 184 void I2C_Init(I2C_TypeDef* I2Cx, uint32_t OutputClockFrequency, uint16_t OwnAddress,
 471                     ; 185               I2C_Mode_TypeDef I2C_Mode, I2C_DutyCycle_TypeDef I2C_DutyCycle,
 471                     ; 186               I2C_Ack_TypeDef I2C_Ack, I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
 471                     ; 187 {
 472                     .text:	section	.text,new
 473  0000               _I2C_Init:
 475  0000 89            	pushw	x
 476  0001 520c          	subw	sp,#12
 477       0000000c      OFST:	set	12
 480                     ; 188   uint32_t result = 0x0004;
 482                     ; 189   uint16_t tmpval = 0;
 484                     ; 190   uint8_t tmpccrh = 0;
 486  0003 0f07          	clr	(OFST-5,sp)
 488                     ; 191   uint8_t input_clock = 0;
 490                     ; 194   assert_param(IS_I2C_MODE(I2C_Mode));
 492                     ; 195   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
 494                     ; 196   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
 496                     ; 197   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 498                     ; 198   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
 500                     ; 199   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
 502                     ; 203   input_clock = (uint8_t) (CLK_GetClockFreq() / 1000000);
 504  0005 cd0000        	call	_CLK_GetClockFreq
 506  0008 ae0000        	ldw	x,#L01
 507  000b cd0000        	call	c_ludv
 509  000e b603          	ld	a,c_lreg+3
 510  0010 6b08          	ld	(OFST-4,sp),a
 512                     ; 207   I2Cx->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 514  0012 1e0d          	ldw	x,(OFST+1,sp)
 515  0014 e602          	ld	a,(2,x)
 516  0016 a4c0          	and	a,#192
 517  0018 e702          	ld	(2,x),a
 518                     ; 209   I2Cx->FREQR |= input_clock;
 520  001a 1e0d          	ldw	x,(OFST+1,sp)
 521  001c e602          	ld	a,(2,x)
 522  001e 1a08          	or	a,(OFST-4,sp)
 523  0020 e702          	ld	(2,x),a
 524                     ; 213   I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 526  0022 1e0d          	ldw	x,(OFST+1,sp)
 527  0024 f6            	ld	a,(x)
 528  0025 a4fe          	and	a,#254
 529  0027 f7            	ld	(x),a
 530                     ; 216   I2Cx->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 532  0028 1e0d          	ldw	x,(OFST+1,sp)
 533  002a e60c          	ld	a,(12,x)
 534  002c a430          	and	a,#48
 535  002e e70c          	ld	(12,x),a
 536                     ; 217   I2Cx->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 538  0030 1e0d          	ldw	x,(OFST+1,sp)
 539  0032 6f0b          	clr	(11,x)
 540                     ; 220   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 542  0034 96            	ldw	x,sp
 543  0035 1c0011        	addw	x,#OFST+5
 544  0038 cd0000        	call	c_ltor
 546  003b ae0004        	ldw	x,#L21
 547  003e cd0000        	call	c_lcmp
 549  0041 2403          	jruge	L61
 550  0043 cc00e1        	jp	L362
 551  0046               L61:
 552                     ; 223     tmpccrh = I2C_CCRH_FS;
 554  0046 a680          	ld	a,#128
 555  0048 6b07          	ld	(OFST-5,sp),a
 557                     ; 225     if (I2C_DutyCycle == I2C_DutyCycle_2)
 559  004a 0d18          	tnz	(OFST+12,sp)
 560  004c 2633          	jrne	L562
 561                     ; 228       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 563  004e 96            	ldw	x,sp
 564  004f 1c0011        	addw	x,#OFST+5
 565  0052 cd0000        	call	c_ltor
 567  0055 a603          	ld	a,#3
 568  0057 cd0000        	call	c_smul
 570  005a 96            	ldw	x,sp
 571  005b 1c0001        	addw	x,#OFST-11
 572  005e cd0000        	call	c_rtol
 575  0061 7b08          	ld	a,(OFST-4,sp)
 576  0063 b703          	ld	c_lreg+3,a
 577  0065 3f02          	clr	c_lreg+2
 578  0067 3f01          	clr	c_lreg+1
 579  0069 3f00          	clr	c_lreg
 580  006b ae0000        	ldw	x,#L01
 581  006e cd0000        	call	c_lmul
 583  0071 96            	ldw	x,sp
 584  0072 1c0001        	addw	x,#OFST-11
 585  0075 cd0000        	call	c_ludv
 587  0078 96            	ldw	x,sp
 588  0079 1c0009        	addw	x,#OFST-3
 589  007c cd0000        	call	c_rtol
 593  007f 2037          	jra	L762
 594  0081               L562:
 595                     ; 233       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 597  0081 96            	ldw	x,sp
 598  0082 1c0011        	addw	x,#OFST+5
 599  0085 cd0000        	call	c_ltor
 601  0088 a619          	ld	a,#25
 602  008a cd0000        	call	c_smul
 604  008d 96            	ldw	x,sp
 605  008e 1c0001        	addw	x,#OFST-11
 606  0091 cd0000        	call	c_rtol
 609  0094 7b08          	ld	a,(OFST-4,sp)
 610  0096 b703          	ld	c_lreg+3,a
 611  0098 3f02          	clr	c_lreg+2
 612  009a 3f01          	clr	c_lreg+1
 613  009c 3f00          	clr	c_lreg
 614  009e ae0000        	ldw	x,#L01
 615  00a1 cd0000        	call	c_lmul
 617  00a4 96            	ldw	x,sp
 618  00a5 1c0001        	addw	x,#OFST-11
 619  00a8 cd0000        	call	c_ludv
 621  00ab 96            	ldw	x,sp
 622  00ac 1c0009        	addw	x,#OFST-3
 623  00af cd0000        	call	c_rtol
 626                     ; 235       tmpccrh |= I2C_CCRH_DUTY;
 628  00b2 7b07          	ld	a,(OFST-5,sp)
 629  00b4 aa40          	or	a,#64
 630  00b6 6b07          	ld	(OFST-5,sp),a
 632  00b8               L762:
 633                     ; 239     if (result < (uint16_t)0x01)
 635  00b8 96            	ldw	x,sp
 636  00b9 1c0009        	addw	x,#OFST-3
 637  00bc cd0000        	call	c_lzmp
 639  00bf 260a          	jrne	L172
 640                     ; 242       result = (uint16_t)0x0001;
 642  00c1 ae0001        	ldw	x,#1
 643  00c4 1f0b          	ldw	(OFST-1,sp),x
 644  00c6 ae0000        	ldw	x,#0
 645  00c9 1f09          	ldw	(OFST-3,sp),x
 647  00cb               L172:
 648                     ; 248     tmpval = ((input_clock * 3) / 10) + 1;
 650  00cb 7b08          	ld	a,(OFST-4,sp)
 651  00cd 97            	ld	xl,a
 652  00ce a603          	ld	a,#3
 653  00d0 42            	mul	x,a
 654  00d1 a60a          	ld	a,#10
 655  00d3 cd0000        	call	c_sdivx
 657  00d6 5c            	incw	x
 658  00d7 1f05          	ldw	(OFST-7,sp),x
 660                     ; 249     I2Cx->TRISER = (uint8_t)tmpval;
 662  00d9 7b06          	ld	a,(OFST-6,sp)
 663  00db 1e0d          	ldw	x,(OFST+1,sp)
 664  00dd e70d          	ld	(13,x),a
 666  00df 205c          	jra	L372
 667  00e1               L362:
 668                     ; 256     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 670  00e1 96            	ldw	x,sp
 671  00e2 1c0011        	addw	x,#OFST+5
 672  00e5 cd0000        	call	c_ltor
 674  00e8 3803          	sll	c_lreg+3
 675  00ea 3902          	rlc	c_lreg+2
 676  00ec 3901          	rlc	c_lreg+1
 677  00ee 3900          	rlc	c_lreg
 678  00f0 96            	ldw	x,sp
 679  00f1 1c0001        	addw	x,#OFST-11
 680  00f4 cd0000        	call	c_rtol
 683  00f7 7b08          	ld	a,(OFST-4,sp)
 684  00f9 b703          	ld	c_lreg+3,a
 685  00fb 3f02          	clr	c_lreg+2
 686  00fd 3f01          	clr	c_lreg+1
 687  00ff 3f00          	clr	c_lreg
 688  0101 ae0000        	ldw	x,#L01
 689  0104 cd0000        	call	c_lmul
 691  0107 96            	ldw	x,sp
 692  0108 1c0001        	addw	x,#OFST-11
 693  010b cd0000        	call	c_ludv
 695  010e b602          	ld	a,c_lreg+2
 696  0110 97            	ld	xl,a
 697  0111 b603          	ld	a,c_lreg+3
 698  0113 cd0000        	call	c_uitol
 700  0116 96            	ldw	x,sp
 701  0117 1c0009        	addw	x,#OFST-3
 702  011a cd0000        	call	c_rtol
 705                     ; 259     if (result < (uint16_t)0x0004)
 707  011d 96            	ldw	x,sp
 708  011e 1c0009        	addw	x,#OFST-3
 709  0121 cd0000        	call	c_ltor
 711  0124 ae0008        	ldw	x,#L41
 712  0127 cd0000        	call	c_lcmp
 714  012a 240a          	jruge	L572
 715                     ; 262       result = (uint16_t)0x0004;
 717  012c ae0004        	ldw	x,#4
 718  012f 1f0b          	ldw	(OFST-1,sp),x
 719  0131 ae0000        	ldw	x,#0
 720  0134 1f09          	ldw	(OFST-3,sp),x
 722  0136               L572:
 723                     ; 268     I2Cx->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 725  0136 7b08          	ld	a,(OFST-4,sp)
 726  0138 4c            	inc	a
 727  0139 1e0d          	ldw	x,(OFST+1,sp)
 728  013b e70d          	ld	(13,x),a
 729  013d               L372:
 730                     ; 273   I2Cx->CCRL = (uint8_t)result;
 732  013d 7b0c          	ld	a,(OFST+0,sp)
 733  013f 1e0d          	ldw	x,(OFST+1,sp)
 734  0141 e70b          	ld	(11,x),a
 735                     ; 274   I2Cx->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 737  0143 7b07          	ld	a,(OFST-5,sp)
 738  0145 1e0d          	ldw	x,(OFST+1,sp)
 739  0147 e70c          	ld	(12,x),a
 740                     ; 277   I2Cx->CR1 |= (uint8_t)(I2C_CR1_PE | I2C_Mode);
 742  0149 1e0d          	ldw	x,(OFST+1,sp)
 743  014b 7b17          	ld	a,(OFST+11,sp)
 744  014d aa01          	or	a,#1
 745  014f fa            	or	a,(x)
 746  0150 f7            	ld	(x),a
 747                     ; 280   I2Cx->CR2 |= (uint8_t)I2C_Ack;
 749  0151 1e0d          	ldw	x,(OFST+1,sp)
 750  0153 e601          	ld	a,(1,x)
 751  0155 1a19          	or	a,(OFST+13,sp)
 752  0157 e701          	ld	(1,x),a
 753                     ; 283   I2Cx->OARL = (uint8_t)(OwnAddress);
 755  0159 7b16          	ld	a,(OFST+10,sp)
 756  015b 1e0d          	ldw	x,(OFST+1,sp)
 757  015d e703          	ld	(3,x),a
 758                     ; 284   I2Cx->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF ) | \
 758                     ; 285                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 760  015f 1e15          	ldw	x,(OFST+9,sp)
 761  0161 4f            	clr	a
 762  0162 01            	rrwa	x,a
 763  0163 48            	sll	a
 764  0164 59            	rlcw	x
 765  0165 01            	rrwa	x,a
 766  0166 a406          	and	a,#6
 767  0168 5f            	clrw	x
 768  0169 6b04          	ld	(OFST-8,sp),a
 770  016b 7b1a          	ld	a,(OFST+14,sp)
 771  016d aa40          	or	a,#64
 772  016f 1a04          	or	a,(OFST-8,sp)
 773  0171 1e0d          	ldw	x,(OFST+1,sp)
 774  0173 e704          	ld	(4,x),a
 775                     ; 286 }
 778  0175 5b0e          	addw	sp,#14
 779  0177 81            	ret
 846                     ; 295 void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 846                     ; 296 {
 847                     .text:	section	.text,new
 848  0000               _I2C_Cmd:
 850  0000 89            	pushw	x
 851       00000000      OFST:	set	0
 854                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 856                     ; 301   if (NewState != DISABLE)
 858  0001 0d05          	tnz	(OFST+5,sp)
 859  0003 2706          	jreq	L333
 860                     ; 304     I2Cx->CR1 |= I2C_CR1_PE;
 862  0005 f6            	ld	a,(x)
 863  0006 aa01          	or	a,#1
 864  0008 f7            	ld	(x),a
 866  0009 2006          	jra	L533
 867  000b               L333:
 868                     ; 309     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 870  000b 1e01          	ldw	x,(OFST+1,sp)
 871  000d f6            	ld	a,(x)
 872  000e a4fe          	and	a,#254
 873  0010 f7            	ld	(x),a
 874  0011               L533:
 875                     ; 311 }
 878  0011 85            	popw	x
 879  0012 81            	ret
 926                     ; 320 void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 926                     ; 321 {
 927                     .text:	section	.text,new
 928  0000               _I2C_GeneralCallCmd:
 930  0000 89            	pushw	x
 931       00000000      OFST:	set	0
 934                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
 936                     ; 326   if (NewState != DISABLE)
 938  0001 0d05          	tnz	(OFST+5,sp)
 939  0003 2706          	jreq	L363
 940                     ; 329     I2Cx->CR1 |= I2C_CR1_ENGC;
 942  0005 f6            	ld	a,(x)
 943  0006 aa40          	or	a,#64
 944  0008 f7            	ld	(x),a
 946  0009 2006          	jra	L563
 947  000b               L363:
 948                     ; 334     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 950  000b 1e01          	ldw	x,(OFST+1,sp)
 951  000d f6            	ld	a,(x)
 952  000e a4bf          	and	a,#191
 953  0010 f7            	ld	(x),a
 954  0011               L563:
 955                     ; 336 }
 958  0011 85            	popw	x
 959  0012 81            	ret
1006                     ; 347 void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
1006                     ; 348 {
1007                     .text:	section	.text,new
1008  0000               _I2C_GenerateSTART:
1010  0000 89            	pushw	x
1011       00000000      OFST:	set	0
1014                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
1016                     ; 353   if (NewState != DISABLE)
1018  0001 0d05          	tnz	(OFST+5,sp)
1019  0003 2708          	jreq	L314
1020                     ; 356     I2Cx->CR2 |= I2C_CR2_START;
1022  0005 e601          	ld	a,(1,x)
1023  0007 aa01          	or	a,#1
1024  0009 e701          	ld	(1,x),a
1026  000b 2008          	jra	L514
1027  000d               L314:
1028                     ; 361     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_START);
1030  000d 1e01          	ldw	x,(OFST+1,sp)
1031  000f e601          	ld	a,(1,x)
1032  0011 a4fe          	and	a,#254
1033  0013 e701          	ld	(1,x),a
1034  0015               L514:
1035                     ; 363 }
1038  0015 85            	popw	x
1039  0016 81            	ret
1086                     ; 372 void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
1086                     ; 373 {
1087                     .text:	section	.text,new
1088  0000               _I2C_GenerateSTOP:
1090  0000 89            	pushw	x
1091       00000000      OFST:	set	0
1094                     ; 376   assert_param(IS_FUNCTIONAL_STATE(NewState));
1096                     ; 378   if (NewState != DISABLE)
1098  0001 0d05          	tnz	(OFST+5,sp)
1099  0003 2708          	jreq	L344
1100                     ; 381     I2Cx->CR2 |= I2C_CR2_STOP;
1102  0005 e601          	ld	a,(1,x)
1103  0007 aa02          	or	a,#2
1104  0009 e701          	ld	(1,x),a
1106  000b 2008          	jra	L544
1107  000d               L344:
1108                     ; 386     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_STOP);
1110  000d 1e01          	ldw	x,(OFST+1,sp)
1111  000f e601          	ld	a,(1,x)
1112  0011 a4fd          	and	a,#253
1113  0013 e701          	ld	(1,x),a
1114  0015               L544:
1115                     ; 388 }
1118  0015 85            	popw	x
1119  0016 81            	ret
1167                     ; 397 void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1167                     ; 398 {
1168                     .text:	section	.text,new
1169  0000               _I2C_SoftwareResetCmd:
1171  0000 89            	pushw	x
1172       00000000      OFST:	set	0
1175                     ; 400   assert_param(IS_FUNCTIONAL_STATE(NewState));
1177                     ; 402   if (NewState != DISABLE)
1179  0001 0d05          	tnz	(OFST+5,sp)
1180  0003 2708          	jreq	L374
1181                     ; 405     I2Cx->CR2 |= I2C_CR2_SWRST;
1183  0005 e601          	ld	a,(1,x)
1184  0007 aa80          	or	a,#128
1185  0009 e701          	ld	(1,x),a
1187  000b 2008          	jra	L574
1188  000d               L374:
1189                     ; 410     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1191  000d 1e01          	ldw	x,(OFST+1,sp)
1192  000f e601          	ld	a,(1,x)
1193  0011 a47f          	and	a,#127
1194  0013 e701          	ld	(1,x),a
1195  0015               L574:
1196                     ; 412 }
1199  0015 85            	popw	x
1200  0016 81            	ret
1248                     ; 421 void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1248                     ; 422 {
1249                     .text:	section	.text,new
1250  0000               _I2C_StretchClockCmd:
1252  0000 89            	pushw	x
1253       00000000      OFST:	set	0
1256                     ; 424   assert_param(IS_FUNCTIONAL_STATE(NewState));
1258                     ; 426   if (NewState != DISABLE)
1260  0001 0d05          	tnz	(OFST+5,sp)
1261  0003 2706          	jreq	L325
1262                     ; 429     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1264  0005 f6            	ld	a,(x)
1265  0006 a47f          	and	a,#127
1266  0008 f7            	ld	(x),a
1268  0009 2006          	jra	L525
1269  000b               L325:
1270                     ; 435     I2Cx->CR1 |= I2C_CR1_NOSTRETCH;
1272  000b 1e01          	ldw	x,(OFST+1,sp)
1273  000d f6            	ld	a,(x)
1274  000e aa80          	or	a,#128
1275  0010 f7            	ld	(x),a
1276  0011               L525:
1277                     ; 437 }
1280  0011 85            	popw	x
1281  0012 81            	ret
1328                     ; 446 void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1328                     ; 447 {
1329                     .text:	section	.text,new
1330  0000               _I2C_ARPCmd:
1332  0000 89            	pushw	x
1333       00000000      OFST:	set	0
1336                     ; 449   assert_param(IS_FUNCTIONAL_STATE(NewState));
1338                     ; 451   if (NewState != DISABLE)
1340  0001 0d05          	tnz	(OFST+5,sp)
1341  0003 2706          	jreq	L355
1342                     ; 454     I2Cx->CR1 |= I2C_CR1_ARP;
1344  0005 f6            	ld	a,(x)
1345  0006 aa10          	or	a,#16
1346  0008 f7            	ld	(x),a
1348  0009 2006          	jra	L555
1349  000b               L355:
1350                     ; 460     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ARP);
1352  000b 1e01          	ldw	x,(OFST+1,sp)
1353  000d f6            	ld	a,(x)
1354  000e a4ef          	and	a,#239
1355  0010 f7            	ld	(x),a
1356  0011               L555:
1357                     ; 462 }
1360  0011 85            	popw	x
1361  0012 81            	ret
1409                     ; 471 void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
1409                     ; 472 {
1410                     .text:	section	.text,new
1411  0000               _I2C_AcknowledgeConfig:
1413  0000 89            	pushw	x
1414       00000000      OFST:	set	0
1417                     ; 474   assert_param(IS_FUNCTIONAL_STATE(NewState));
1419                     ; 476   if (NewState != DISABLE)
1421  0001 0d05          	tnz	(OFST+5,sp)
1422  0003 2708          	jreq	L306
1423                     ; 479     I2Cx->CR2 |= I2C_CR2_ACK;
1425  0005 e601          	ld	a,(1,x)
1426  0007 aa04          	or	a,#4
1427  0009 e701          	ld	(1,x),a
1429  000b 2008          	jra	L506
1430  000d               L306:
1431                     ; 484     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1433  000d 1e01          	ldw	x,(OFST+1,sp)
1434  000f e601          	ld	a,(1,x)
1435  0011 a4fb          	and	a,#251
1436  0013 e701          	ld	(1,x),a
1437  0015               L506:
1438                     ; 486 }
1441  0015 85            	popw	x
1442  0016 81            	ret
1498                     ; 494 void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint8_t Address)
1498                     ; 495 {
1499                     .text:	section	.text,new
1500  0000               _I2C_OwnAddress2Config:
1502  0000 89            	pushw	x
1503  0001 88            	push	a
1504       00000001      OFST:	set	1
1507                     ; 496   uint8_t tmpreg = 0;
1509                     ; 499   tmpreg = I2Cx->OAR2;
1511  0002 e605          	ld	a,(5,x)
1512  0004 6b01          	ld	(OFST+0,sp),a
1514                     ; 502   tmpreg &= (uint8_t)(~I2C_OAR2_ADD2);
1516  0006 7b01          	ld	a,(OFST+0,sp)
1517  0008 a401          	and	a,#1
1518  000a 6b01          	ld	(OFST+0,sp),a
1520                     ; 505   tmpreg |= (uint8_t) ((uint8_t)Address & (uint8_t)0xFE);
1522  000c 7b06          	ld	a,(OFST+5,sp)
1523  000e a4fe          	and	a,#254
1524  0010 1a01          	or	a,(OFST+0,sp)
1525  0012 6b01          	ld	(OFST+0,sp),a
1527                     ; 508   I2Cx->OAR2 = tmpreg;
1529  0014 7b01          	ld	a,(OFST+0,sp)
1530  0016 1e02          	ldw	x,(OFST+1,sp)
1531  0018 e705          	ld	(5,x),a
1532                     ; 509 }
1535  001a 5b03          	addw	sp,#3
1536  001c 81            	ret
1583                     ; 518 void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1583                     ; 519 {
1584                     .text:	section	.text,new
1585  0000               _I2C_DualAddressCmd:
1587  0000 89            	pushw	x
1588       00000000      OFST:	set	0
1591                     ; 521   assert_param(IS_FUNCTIONAL_STATE(NewState));
1593                     ; 523   if (NewState != DISABLE)
1595  0001 0d05          	tnz	(OFST+5,sp)
1596  0003 2708          	jreq	L366
1597                     ; 526     I2Cx->OAR2 |= I2C_OAR2_ENDUAL;
1599  0005 e605          	ld	a,(5,x)
1600  0007 aa01          	or	a,#1
1601  0009 e705          	ld	(5,x),a
1603  000b 2008          	jra	L566
1604  000d               L366:
1605                     ; 531     I2Cx->OAR2 &= (uint8_t)(~I2C_OAR2_ENDUAL);
1607  000d 1e01          	ldw	x,(OFST+1,sp)
1608  000f e605          	ld	a,(5,x)
1609  0011 a4fe          	and	a,#254
1610  0013 e705          	ld	(5,x),a
1611  0015               L566:
1612                     ; 533 }
1615  0015 85            	popw	x
1616  0016 81            	ret
1686                     ; 545 void I2C_AckPositionConfig(I2C_TypeDef* I2Cx, I2C_AckPosition_TypeDef I2C_AckPosition)
1686                     ; 546 {
1687                     .text:	section	.text,new
1688  0000               _I2C_AckPositionConfig:
1690  0000 89            	pushw	x
1691       00000000      OFST:	set	0
1694                     ; 548   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
1696                     ; 551   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
1698  0001 e601          	ld	a,(1,x)
1699  0003 a4f7          	and	a,#247
1700  0005 e701          	ld	(1,x),a
1701                     ; 553   I2Cx->CR2 |= (uint8_t)I2C_AckPosition;
1703  0007 e601          	ld	a,(1,x)
1704  0009 1a05          	or	a,(OFST+5,sp)
1705  000b e701          	ld	(1,x),a
1706                     ; 554 }
1709  000d 85            	popw	x
1710  000e 81            	ret
1779                     ; 565 void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, I2C_SMBusAlert_TypeDef I2C_SMBusAlert)
1779                     ; 566 {
1780                     .text:	section	.text,new
1781  0000               _I2C_SMBusAlertConfig:
1783  0000 89            	pushw	x
1784       00000000      OFST:	set	0
1787                     ; 569   assert_param(IS_I2C_SMBUS_ALERT(I2C_SMBusAlert));
1789                     ; 571   if (I2C_SMBusAlert != I2C_SMBusAlert_High)
1791  0001 0d05          	tnz	(OFST+5,sp)
1792  0003 2708          	jreq	L757
1793                     ; 574     I2Cx->CR2 |= (uint8_t)I2C_CR2_ALERT;
1795  0005 e601          	ld	a,(1,x)
1796  0007 aa20          	or	a,#32
1797  0009 e701          	ld	(1,x),a
1799  000b 2008          	jra	L167
1800  000d               L757:
1801                     ; 579     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ALERT);
1803  000d 1e01          	ldw	x,(OFST+1,sp)
1804  000f e601          	ld	a,(1,x)
1805  0011 a4df          	and	a,#223
1806  0013 e701          	ld	(1,x),a
1807  0015               L167:
1808                     ; 581 }
1811  0015 85            	popw	x
1812  0016 81            	ret
1860                     ; 592 void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, I2C_DutyCycle_TypeDef I2C_DutyCycle)
1860                     ; 593 {
1861                     .text:	section	.text,new
1862  0000               _I2C_FastModeDutyCycleConfig:
1864  0000 89            	pushw	x
1865       00000000      OFST:	set	0
1868                     ; 596   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
1870                     ; 598   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
1872  0001 7b05          	ld	a,(OFST+5,sp)
1873  0003 a140          	cp	a,#64
1874  0005 2608          	jrne	L7001
1875                     ; 601     I2Cx->CCRH |= I2C_CCRH_DUTY;
1877  0007 e60c          	ld	a,(12,x)
1878  0009 aa40          	or	a,#64
1879  000b e70c          	ld	(12,x),a
1881  000d 2008          	jra	L1101
1882  000f               L7001:
1883                     ; 606     I2Cx->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1885  000f 1e01          	ldw	x,(OFST+1,sp)
1886  0011 e60c          	ld	a,(12,x)
1887  0013 a4bf          	and	a,#191
1888  0015 e70c          	ld	(12,x),a
1889  0017               L1101:
1890                     ; 608 }
1893  0017 85            	popw	x
1894  0018 81            	ret
1973                     ; 621 void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
1973                     ; 622 {
1974                     .text:	section	.text,new
1975  0000               _I2C_Send7bitAddress:
1977  0000 89            	pushw	x
1978       00000000      OFST:	set	0
1981                     ; 624   assert_param(IS_I2C_ADDRESS(Address));
1983                     ; 625   assert_param(IS_I2C_DIRECTION(I2C_Direction));
1985                     ; 628   if (I2C_Direction != I2C_Direction_Transmitter)
1987  0001 0d06          	tnz	(OFST+6,sp)
1988  0003 2708          	jreq	L3501
1989                     ; 631     Address |= OAR1_ADD0_Set;
1991  0005 7b05          	ld	a,(OFST+5,sp)
1992  0007 aa01          	or	a,#1
1993  0009 6b05          	ld	(OFST+5,sp),a
1995  000b 2006          	jra	L5501
1996  000d               L3501:
1997                     ; 636     Address &= OAR1_ADD0_Reset;
1999  000d 7b05          	ld	a,(OFST+5,sp)
2000  000f a4fe          	and	a,#254
2001  0011 6b05          	ld	(OFST+5,sp),a
2002  0013               L5501:
2003                     ; 639   I2Cx->DR = Address;
2005  0013 7b05          	ld	a,(OFST+5,sp)
2006  0015 1e01          	ldw	x,(OFST+1,sp)
2007  0017 e706          	ld	(6,x),a
2008                     ; 640 }
2011  0019 85            	popw	x
2012  001a 81            	ret
2058                     ; 664 void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
2058                     ; 665 {
2059                     .text:	section	.text,new
2060  0000               _I2C_SendData:
2062  0000 89            	pushw	x
2063       00000000      OFST:	set	0
2066                     ; 667   I2Cx->DR = Data;
2068  0001 7b05          	ld	a,(OFST+5,sp)
2069  0003 1e01          	ldw	x,(OFST+1,sp)
2070  0005 e706          	ld	(6,x),a
2071                     ; 668 }
2074  0007 85            	popw	x
2075  0008 81            	ret
2112                     ; 676 uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx)
2112                     ; 677 {
2113                     .text:	section	.text,new
2114  0000               _I2C_ReceiveData:
2118                     ; 679   return ((uint8_t)I2Cx->DR);
2120  0000 e606          	ld	a,(6,x)
2123  0002 81            	ret
2170                     ; 705 void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2170                     ; 706 {
2171                     .text:	section	.text,new
2172  0000               _I2C_TransmitPEC:
2174  0000 89            	pushw	x
2175       00000000      OFST:	set	0
2178                     ; 708   assert_param(IS_FUNCTIONAL_STATE(NewState));
2180                     ; 710   if (NewState != DISABLE)
2182  0001 0d05          	tnz	(OFST+5,sp)
2183  0003 2708          	jreq	L7411
2184                     ; 713     I2Cx->CR2 |= I2C_CR2_PEC;
2186  0005 e601          	ld	a,(1,x)
2187  0007 aa10          	or	a,#16
2188  0009 e701          	ld	(1,x),a
2190  000b 2008          	jra	L1511
2191  000d               L7411:
2192                     ; 718     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_PEC);
2194  000d 1e01          	ldw	x,(OFST+1,sp)
2195  000f e601          	ld	a,(1,x)
2196  0011 a4ef          	and	a,#239
2197  0013 e701          	ld	(1,x),a
2198  0015               L1511:
2199                     ; 720 }
2202  0015 85            	popw	x
2203  0016 81            	ret
2250                     ; 729 void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2250                     ; 730 {
2251                     .text:	section	.text,new
2252  0000               _I2C_CalculatePEC:
2254  0000 89            	pushw	x
2255       00000000      OFST:	set	0
2258                     ; 732   assert_param(IS_FUNCTIONAL_STATE(NewState));
2260                     ; 734   if (NewState != DISABLE)
2262  0001 0d05          	tnz	(OFST+5,sp)
2263  0003 2706          	jreq	L7711
2264                     ; 737     I2Cx->CR1 |= I2C_CR1_ENPEC;
2266  0005 f6            	ld	a,(x)
2267  0006 aa20          	or	a,#32
2268  0008 f7            	ld	(x),a
2270  0009 2006          	jra	L1021
2271  000b               L7711:
2272                     ; 742     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENPEC);
2274  000b 1e01          	ldw	x,(OFST+1,sp)
2275  000d f6            	ld	a,(x)
2276  000e a4df          	and	a,#223
2277  0010 f7            	ld	(x),a
2278  0011               L1021:
2279                     ; 744 }
2282  0011 85            	popw	x
2283  0012 81            	ret
2353                     ; 755 void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, I2C_PECPosition_TypeDef I2C_PECPosition)
2353                     ; 756 {
2354                     .text:	section	.text,new
2355  0000               _I2C_PECPositionConfig:
2357  0000 89            	pushw	x
2358       00000000      OFST:	set	0
2361                     ; 758   assert_param(IS_I2C_PEC_POSITION(I2C_PECPosition));
2363                     ; 761   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
2365  0001 e601          	ld	a,(1,x)
2366  0003 a4f7          	and	a,#247
2367  0005 e701          	ld	(1,x),a
2368                     ; 763   I2Cx->CR2 |= (uint8_t)I2C_PECPosition;
2370  0007 e601          	ld	a,(1,x)
2371  0009 1a05          	or	a,(OFST+5,sp)
2372  000b e701          	ld	(1,x),a
2373                     ; 764 }
2376  000d 85            	popw	x
2377  000e 81            	ret
2414                     ; 772 uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx)
2414                     ; 773 {
2415                     .text:	section	.text,new
2416  0000               _I2C_GetPEC:
2420                     ; 775   return (I2Cx->PECR);
2422  0000 e60e          	ld	a,(14,x)
2425  0002 81            	ret
2472                     ; 803 void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2472                     ; 804 {
2473                     .text:	section	.text,new
2474  0000               _I2C_DMACmd:
2476  0000 89            	pushw	x
2477       00000000      OFST:	set	0
2480                     ; 806   assert_param(IS_FUNCTIONAL_STATE(NewState));
2482                     ; 808   if (NewState != DISABLE)
2484  0001 0d05          	tnz	(OFST+5,sp)
2485  0003 2708          	jreq	L3031
2486                     ; 811     I2Cx->ITR |= I2C_ITR_DMAEN;
2488  0005 e60a          	ld	a,(10,x)
2489  0007 aa08          	or	a,#8
2490  0009 e70a          	ld	(10,x),a
2492  000b 2008          	jra	L5031
2493  000d               L3031:
2494                     ; 816     I2Cx->ITR &= (uint8_t)(~I2C_ITR_DMAEN);
2496  000d 1e01          	ldw	x,(OFST+1,sp)
2497  000f e60a          	ld	a,(10,x)
2498  0011 a4f7          	and	a,#247
2499  0013 e70a          	ld	(10,x),a
2500  0015               L5031:
2501                     ; 818 }
2504  0015 85            	popw	x
2505  0016 81            	ret
2553                     ; 827 void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2553                     ; 828 {
2554                     .text:	section	.text,new
2555  0000               _I2C_DMALastTransferCmd:
2557  0000 89            	pushw	x
2558       00000000      OFST:	set	0
2561                     ; 830   assert_param(IS_FUNCTIONAL_STATE(NewState));
2563                     ; 832   if (NewState != DISABLE)
2565  0001 0d05          	tnz	(OFST+5,sp)
2566  0003 2708          	jreq	L3331
2567                     ; 835     I2Cx->ITR |= I2C_ITR_LAST;
2569  0005 e60a          	ld	a,(10,x)
2570  0007 aa10          	or	a,#16
2571  0009 e70a          	ld	(10,x),a
2573  000b 2008          	jra	L5331
2574  000d               L3331:
2575                     ; 840     I2Cx->ITR &= (uint8_t)(~I2C_ITR_LAST);
2577  000d 1e01          	ldw	x,(OFST+1,sp)
2578  000f e60a          	ld	a,(10,x)
2579  0011 a4ef          	and	a,#239
2580  0013 e70a          	ld	(10,x),a
2581  0015               L5331:
2582                     ; 842 }
2585  0015 85            	popw	x
2586  0016 81            	ret
2775                     ; 954 void I2C_ITConfig(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
2775                     ; 955 {
2776                     .text:	section	.text,new
2777  0000               _I2C_ITConfig:
2779  0000 89            	pushw	x
2780       00000000      OFST:	set	0
2783                     ; 957   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
2785                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
2787                     ; 960   if (NewState != DISABLE)
2789  0001 0d07          	tnz	(OFST+7,sp)
2790  0003 2708          	jreq	L7341
2791                     ; 963     I2Cx->ITR |= (uint8_t)I2C_IT;
2793  0005 e60a          	ld	a,(10,x)
2794  0007 1a06          	or	a,(OFST+6,sp)
2795  0009 e70a          	ld	(10,x),a
2797  000b 2009          	jra	L1441
2798  000d               L7341:
2799                     ; 968     I2Cx->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
2801  000d 1e01          	ldw	x,(OFST+1,sp)
2802  000f 7b06          	ld	a,(OFST+6,sp)
2803  0011 43            	cpl	a
2804  0012 e40a          	and	a,(10,x)
2805  0014 e70a          	ld	(10,x),a
2806  0016               L1441:
2807                     ; 970 }
2810  0016 85            	popw	x
2811  0017 81            	ret
2972                     ; 994 uint8_t I2C_ReadRegister(I2C_TypeDef* I2Cx, I2C_Register_TypeDef I2C_Register)
2972                     ; 995 {
2973                     .text:	section	.text,new
2974  0000               _I2C_ReadRegister:
2976  0000 89            	pushw	x
2977  0001 5204          	subw	sp,#4
2978       00000004      OFST:	set	4
2981                     ; 996   __IO uint16_t tmp = 0;
2983  0003 5f            	clrw	x
2984  0004 1f03          	ldw	(OFST-1,sp),x
2986                     ; 998   assert_param(IS_I2C_REGISTER(I2C_Register));
2988                     ; 1000   tmp = (uint16_t) I2Cx;
2990  0006 1e05          	ldw	x,(OFST+1,sp)
2991  0008 1f03          	ldw	(OFST-1,sp),x
2993                     ; 1001   tmp += I2C_Register;
2995  000a 7b09          	ld	a,(OFST+5,sp)
2996  000c 5f            	clrw	x
2997  000d 97            	ld	xl,a
2998  000e 1f01          	ldw	(OFST-3,sp),x
3000  0010 1e03          	ldw	x,(OFST-1,sp)
3001  0012 72fb01        	addw	x,(OFST-3,sp)
3002  0015 1f03          	ldw	(OFST-1,sp),x
3004                     ; 1004   return (*(__IO uint8_t *) tmp);
3006  0017 1e03          	ldw	x,(OFST-1,sp)
3007  0019 f6            	ld	a,(x)
3010  001a 5b06          	addw	sp,#6
3011  001c 81            	ret
3265                     ; 1044 ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, I2C_Event_TypeDef I2C_Event)
3265                     ; 1045 {
3266                     .text:	section	.text,new
3267  0000               _I2C_CheckEvent:
3269  0000 89            	pushw	x
3270  0001 5206          	subw	sp,#6
3271       00000006      OFST:	set	6
3274                     ; 1046   __IO uint16_t lastevent = 0x00;
3276  0003 5f            	clrw	x
3277  0004 1f04          	ldw	(OFST-2,sp),x
3279                     ; 1047   uint8_t flag1 = 0x00 ;
3281                     ; 1048   uint8_t flag2 = 0x00;
3283                     ; 1049   ErrorStatus status = ERROR;
3285                     ; 1052   assert_param(IS_I2C_EVENT(I2C_Event));
3287                     ; 1054   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
3289  0006 1e0b          	ldw	x,(OFST+5,sp)
3290  0008 a30004        	cpw	x,#4
3291  000b 260c          	jrne	L5561
3292                     ; 1056     lastevent = I2Cx->SR2 & I2C_SR2_AF;
3294  000d 1e07          	ldw	x,(OFST+1,sp)
3295  000f e608          	ld	a,(8,x)
3296  0011 a404          	and	a,#4
3297  0013 5f            	clrw	x
3298  0014 97            	ld	xl,a
3299  0015 1f04          	ldw	(OFST-2,sp),x
3302  0017 2021          	jra	L7561
3303  0019               L5561:
3304                     ; 1060     flag1 = I2Cx->SR1;
3306  0019 1e07          	ldw	x,(OFST+1,sp)
3307  001b e607          	ld	a,(7,x)
3308  001d 6b03          	ld	(OFST-3,sp),a
3310                     ; 1061     flag2 = I2Cx->SR3;
3312  001f 1e07          	ldw	x,(OFST+1,sp)
3313  0021 e609          	ld	a,(9,x)
3314  0023 6b06          	ld	(OFST+0,sp),a
3316                     ; 1062     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
3318  0025 7b03          	ld	a,(OFST-3,sp)
3319  0027 5f            	clrw	x
3320  0028 97            	ld	xl,a
3321  0029 1f01          	ldw	(OFST-5,sp),x
3323  002b 7b06          	ld	a,(OFST+0,sp)
3324  002d 5f            	clrw	x
3325  002e 97            	ld	xl,a
3326  002f 4f            	clr	a
3327  0030 02            	rlwa	x,a
3328  0031 01            	rrwa	x,a
3329  0032 1a02          	or	a,(OFST-4,sp)
3330  0034 01            	rrwa	x,a
3331  0035 1a01          	or	a,(OFST-5,sp)
3332  0037 01            	rrwa	x,a
3333  0038 1f04          	ldw	(OFST-2,sp),x
3335  003a               L7561:
3336                     ; 1065   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
3338  003a 1e04          	ldw	x,(OFST-2,sp)
3339  003c 01            	rrwa	x,a
3340  003d 140c          	and	a,(OFST+6,sp)
3341  003f 01            	rrwa	x,a
3342  0040 140b          	and	a,(OFST+5,sp)
3343  0042 01            	rrwa	x,a
3344  0043 130b          	cpw	x,(OFST+5,sp)
3345  0045 2606          	jrne	L1661
3346                     ; 1068     status = SUCCESS;
3348  0047 a601          	ld	a,#1
3349  0049 6b06          	ld	(OFST+0,sp),a
3352  004b 2002          	jra	L3661
3353  004d               L1661:
3354                     ; 1073     status = ERROR;
3356  004d 0f06          	clr	(OFST+0,sp)
3358  004f               L3661:
3359                     ; 1077   return status;
3361  004f 7b06          	ld	a,(OFST+0,sp)
3364  0051 5b08          	addw	sp,#8
3365  0053 81            	ret
3430                     ; 1095 I2C_Event_TypeDef I2C_GetLastEvent(I2C_TypeDef* I2Cx)
3430                     ; 1096 {
3431                     .text:	section	.text,new
3432  0000               _I2C_GetLastEvent:
3434  0000 89            	pushw	x
3435  0001 5206          	subw	sp,#6
3436       00000006      OFST:	set	6
3439                     ; 1097   __IO uint16_t lastevent = 0;
3441  0003 5f            	clrw	x
3442  0004 1f05          	ldw	(OFST-1,sp),x
3444                     ; 1098   uint16_t flag1 = 0;
3446                     ; 1099   uint16_t flag2 = 0;
3448                     ; 1101   if ((I2Cx->SR2 & I2C_SR2_AF) != 0x00)
3450  0006 1e07          	ldw	x,(OFST+1,sp)
3451  0008 e608          	ld	a,(8,x)
3452  000a a504          	bcp	a,#4
3453  000c 2707          	jreq	L1271
3454                     ; 1103     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
3456  000e ae0004        	ldw	x,#4
3457  0011 1f05          	ldw	(OFST-1,sp),x
3460  0013 201d          	jra	L3271
3461  0015               L1271:
3462                     ; 1108     flag1 = I2Cx->SR1;
3464  0015 1e07          	ldw	x,(OFST+1,sp)
3465  0017 e607          	ld	a,(7,x)
3466  0019 5f            	clrw	x
3467  001a 97            	ld	xl,a
3468  001b 1f01          	ldw	(OFST-5,sp),x
3470                     ; 1109     flag2 = I2Cx->SR3;
3472  001d 1e07          	ldw	x,(OFST+1,sp)
3473  001f e609          	ld	a,(9,x)
3474  0021 5f            	clrw	x
3475  0022 97            	ld	xl,a
3476  0023 1f03          	ldw	(OFST-3,sp),x
3478                     ; 1112     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
3480  0025 1e03          	ldw	x,(OFST-3,sp)
3481  0027 4f            	clr	a
3482  0028 02            	rlwa	x,a
3483  0029 01            	rrwa	x,a
3484  002a 1a02          	or	a,(OFST-4,sp)
3485  002c 01            	rrwa	x,a
3486  002d 1a01          	or	a,(OFST-5,sp)
3487  002f 01            	rrwa	x,a
3488  0030 1f05          	ldw	(OFST-1,sp),x
3490  0032               L3271:
3491                     ; 1115   return (I2C_Event_TypeDef)lastevent;
3493  0032 1e05          	ldw	x,(OFST-1,sp)
3496  0034 5b08          	addw	sp,#8
3497  0036 81            	ret
3754                     ; 1152 FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3754                     ; 1153 {
3755                     .text:	section	.text,new
3756  0000               _I2C_GetFlagStatus:
3758  0000 89            	pushw	x
3759  0001 89            	pushw	x
3760       00000002      OFST:	set	2
3763                     ; 1154   uint8_t tempreg = 0;
3765  0002 0f02          	clr	(OFST+0,sp)
3767                     ; 1155   uint8_t regindex = 0;
3769                     ; 1156   FlagStatus bitstatus = RESET;
3771                     ; 1159   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
3773                     ; 1162   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
3775  0004 7b07          	ld	a,(OFST+5,sp)
3776  0006 6b01          	ld	(OFST-1,sp),a
3778                     ; 1164   switch (regindex)
3780  0008 7b01          	ld	a,(OFST-1,sp)
3782                     ; 1181     default:
3782                     ; 1182       break;
3783  000a 4a            	dec	a
3784  000b 2708          	jreq	L5271
3785  000d 4a            	dec	a
3786  000e 270d          	jreq	L7271
3787  0010 4a            	dec	a
3788  0011 2712          	jreq	L1371
3789  0013 2016          	jra	L7602
3790  0015               L5271:
3791                     ; 1167     case 0x01:
3791                     ; 1168       tempreg = (uint8_t)I2Cx->SR1;
3793  0015 1e03          	ldw	x,(OFST+1,sp)
3794  0017 e607          	ld	a,(7,x)
3795  0019 6b02          	ld	(OFST+0,sp),a
3797                     ; 1169       break;
3799  001b 200e          	jra	L7602
3800  001d               L7271:
3801                     ; 1172     case 0x02:
3801                     ; 1173       tempreg = (uint8_t)I2Cx->SR2;
3803  001d 1e03          	ldw	x,(OFST+1,sp)
3804  001f e608          	ld	a,(8,x)
3805  0021 6b02          	ld	(OFST+0,sp),a
3807                     ; 1174       break;
3809  0023 2006          	jra	L7602
3810  0025               L1371:
3811                     ; 1177     case 0x03:
3811                     ; 1178       tempreg = (uint8_t)I2Cx->SR3;
3813  0025 1e03          	ldw	x,(OFST+1,sp)
3814  0027 e609          	ld	a,(9,x)
3815  0029 6b02          	ld	(OFST+0,sp),a
3817                     ; 1179       break;
3819  002b               L3371:
3820                     ; 1181     default:
3820                     ; 1182       break;
3822  002b               L7602:
3823                     ; 1186   if ((tempreg & (uint8_t)I2C_FLAG ) != 0)
3825  002b 7b08          	ld	a,(OFST+6,sp)
3826  002d 1502          	bcp	a,(OFST+0,sp)
3827  002f 2706          	jreq	L1702
3828                     ; 1189     bitstatus = SET;
3830  0031 a601          	ld	a,#1
3831  0033 6b02          	ld	(OFST+0,sp),a
3834  0035 2002          	jra	L3702
3835  0037               L1702:
3836                     ; 1194     bitstatus = RESET;
3838  0037 0f02          	clr	(OFST+0,sp)
3840  0039               L3702:
3841                     ; 1197   return bitstatus;
3843  0039 7b02          	ld	a,(OFST+0,sp)
3846  003b 5b04          	addw	sp,#4
3847  003d 81            	ret
3903                     ; 1229 void I2C_ClearFlag(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3903                     ; 1230 {
3904                     .text:	section	.text,new
3905  0000               _I2C_ClearFlag:
3907  0000 89            	pushw	x
3908  0001 89            	pushw	x
3909       00000002      OFST:	set	2
3912                     ; 1231   uint16_t flagpos = 0;
3914                     ; 1233   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
3916                     ; 1236   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
3918  0002 7b07          	ld	a,(OFST+5,sp)
3919  0004 97            	ld	xl,a
3920  0005 7b08          	ld	a,(OFST+6,sp)
3921  0007 a4ff          	and	a,#255
3922  0009 5f            	clrw	x
3923  000a 02            	rlwa	x,a
3924  000b 1f01          	ldw	(OFST-1,sp),x
3925  000d 01            	rrwa	x,a
3927                     ; 1238   I2Cx->SR2 = (uint8_t)((uint16_t)(~flagpos));
3929  000e 7b02          	ld	a,(OFST+0,sp)
3930  0010 43            	cpl	a
3931  0011 1e03          	ldw	x,(OFST+1,sp)
3932  0013 e708          	ld	(8,x),a
3933                     ; 1239 }
3936  0015 5b04          	addw	sp,#4
3937  0017 81            	ret
4013                     ; 1264 ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
4013                     ; 1265 {
4014                     .text:	section	.text,new
4015  0000               _I2C_GetITStatus:
4017  0000 89            	pushw	x
4018  0001 5204          	subw	sp,#4
4019       00000004      OFST:	set	4
4022                     ; 1266   ITStatus bitstatus = RESET;
4024                     ; 1267   __IO uint8_t enablestatus = 0;
4026  0003 0f03          	clr	(OFST-1,sp)
4028                     ; 1268   uint16_t tempregister = 0;
4030                     ; 1271   assert_param(IS_I2C_GET_IT(I2C_IT));
4032                     ; 1273   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
4034  0005 7b09          	ld	a,(OFST+5,sp)
4035  0007 a407          	and	a,#7
4036  0009 5f            	clrw	x
4037  000a 97            	ld	xl,a
4038  000b 1f01          	ldw	(OFST-3,sp),x
4040                     ; 1276   enablestatus = (uint8_t)(I2Cx->ITR & ( uint8_t)tempregister);
4042  000d 1e05          	ldw	x,(OFST+1,sp)
4043  000f e60a          	ld	a,(10,x)
4044  0011 1402          	and	a,(OFST-2,sp)
4045  0013 6b03          	ld	(OFST-1,sp),a
4047                     ; 1278   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
4049  0015 7b09          	ld	a,(OFST+5,sp)
4050  0017 97            	ld	xl,a
4051  0018 7b0a          	ld	a,(OFST+6,sp)
4052  001a 9f            	ld	a,xl
4053  001b a430          	and	a,#48
4054  001d 97            	ld	xl,a
4055  001e 4f            	clr	a
4056  001f 02            	rlwa	x,a
4057  0020 a30100        	cpw	x,#256
4058  0023 2616          	jrne	L5612
4059                     ; 1281     if (((I2Cx->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
4061  0025 1e05          	ldw	x,(OFST+1,sp)
4062  0027 e607          	ld	a,(7,x)
4063  0029 150a          	bcp	a,(OFST+6,sp)
4064  002b 270a          	jreq	L7612
4066  002d 0d03          	tnz	(OFST-1,sp)
4067  002f 2706          	jreq	L7612
4068                     ; 1284       bitstatus = SET;
4070  0031 a601          	ld	a,#1
4071  0033 6b04          	ld	(OFST+0,sp),a
4074  0035 2018          	jra	L3712
4075  0037               L7612:
4076                     ; 1289       bitstatus = RESET;
4078  0037 0f04          	clr	(OFST+0,sp)
4080  0039 2014          	jra	L3712
4081  003b               L5612:
4082                     ; 1295     if (((I2Cx->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
4084  003b 1e05          	ldw	x,(OFST+1,sp)
4085  003d e608          	ld	a,(8,x)
4086  003f 150a          	bcp	a,(OFST+6,sp)
4087  0041 270a          	jreq	L5712
4089  0043 0d03          	tnz	(OFST-1,sp)
4090  0045 2706          	jreq	L5712
4091                     ; 1298       bitstatus = SET;
4093  0047 a601          	ld	a,#1
4094  0049 6b04          	ld	(OFST+0,sp),a
4097  004b 2002          	jra	L3712
4098  004d               L5712:
4099                     ; 1303       bitstatus = RESET;
4101  004d 0f04          	clr	(OFST+0,sp)
4103  004f               L3712:
4104                     ; 1307   return  bitstatus;
4106  004f 7b04          	ld	a,(OFST+0,sp)
4109  0051 5b06          	addw	sp,#6
4110  0053 81            	ret
4167                     ; 1340 void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
4167                     ; 1341 {
4168                     .text:	section	.text,new
4169  0000               _I2C_ClearITPendingBit:
4171  0000 89            	pushw	x
4172  0001 89            	pushw	x
4173       00000002      OFST:	set	2
4176                     ; 1342   uint16_t flagpos = 0;
4178                     ; 1345   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
4180                     ; 1348   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
4182  0002 7b07          	ld	a,(OFST+5,sp)
4183  0004 97            	ld	xl,a
4184  0005 7b08          	ld	a,(OFST+6,sp)
4185  0007 a4ff          	and	a,#255
4186  0009 5f            	clrw	x
4187  000a 02            	rlwa	x,a
4188  000b 1f01          	ldw	(OFST-1,sp),x
4189  000d 01            	rrwa	x,a
4191                     ; 1351   I2Cx->SR2 = (uint8_t)((uint16_t)~flagpos);
4193  000e 7b02          	ld	a,(OFST+0,sp)
4194  0010 43            	cpl	a
4195  0011 1e03          	ldw	x,(OFST+1,sp)
4196  0013 e708          	ld	(8,x),a
4197                     ; 1352 }
4200  0015 5b04          	addw	sp,#4
4201  0017 81            	ret
4214                     	xdef	_I2C_ClearITPendingBit
4215                     	xdef	_I2C_GetITStatus
4216                     	xdef	_I2C_ClearFlag
4217                     	xdef	_I2C_GetFlagStatus
4218                     	xdef	_I2C_GetLastEvent
4219                     	xdef	_I2C_CheckEvent
4220                     	xdef	_I2C_ReadRegister
4221                     	xdef	_I2C_ITConfig
4222                     	xdef	_I2C_DMALastTransferCmd
4223                     	xdef	_I2C_DMACmd
4224                     	xdef	_I2C_CalculatePEC
4225                     	xdef	_I2C_TransmitPEC
4226                     	xdef	_I2C_GetPEC
4227                     	xdef	_I2C_PECPositionConfig
4228                     	xdef	_I2C_ReceiveData
4229                     	xdef	_I2C_SendData
4230                     	xdef	_I2C_Send7bitAddress
4231                     	xdef	_I2C_SMBusAlertConfig
4232                     	xdef	_I2C_FastModeDutyCycleConfig
4233                     	xdef	_I2C_AckPositionConfig
4234                     	xdef	_I2C_DualAddressCmd
4235                     	xdef	_I2C_OwnAddress2Config
4236                     	xdef	_I2C_AcknowledgeConfig
4237                     	xdef	_I2C_GenerateSTOP
4238                     	xdef	_I2C_GenerateSTART
4239                     	xdef	_I2C_ARPCmd
4240                     	xdef	_I2C_StretchClockCmd
4241                     	xdef	_I2C_SoftwareResetCmd
4242                     	xdef	_I2C_GeneralCallCmd
4243                     	xdef	_I2C_Cmd
4244                     	xdef	_I2C_Init
4245                     	xdef	_I2C_DeInit
4246                     	xref	_CLK_GetClockFreq
4247                     	xref.b	c_lreg
4248                     	xref.b	c_x
4267                     	xref	c_uitol
4268                     	xref	c_sdivx
4269                     	xref	c_lzmp
4270                     	xref	c_rtol
4271                     	xref	c_smul
4272                     	xref	c_lmul
4273                     	xref	c_lcmp
4274                     	xref	c_ltor
4275                     	xref	c_ludv
4276                     	end
