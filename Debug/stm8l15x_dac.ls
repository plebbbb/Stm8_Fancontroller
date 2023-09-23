   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  42                     ; 142 void DAC_DeInit(void)
  42                     ; 143 {
  44                     	switch	.text
  45  0000               _DAC_DeInit:
  49                     ; 145   DAC->CH1CR1 = DAC_CR1_RESET_VALUE;
  51  0000 725f5380      	clr	21376
  52                     ; 146   DAC->CH1CR2 = DAC_CR2_RESET_VALUE;
  54  0004 725f5381      	clr	21377
  55                     ; 149   DAC->CH2CR1 = DAC_CR1_RESET_VALUE;
  57  0008 725f5382      	clr	21378
  58                     ; 150   DAC->CH2CR2 = DAC_CR2_RESET_VALUE;
  60  000c 725f5383      	clr	21379
  61                     ; 153   DAC->SWTRIGR = DAC_SWTRIGR_RESET_VALUE;
  63  0010 725f5384      	clr	21380
  64                     ; 156   DAC->SR = (uint8_t)~DAC_SR_RESET_VALUE;
  66  0014 35ff5385      	mov	21381,#255
  67                     ; 159   DAC->CH1RDHRH = DAC_RDHRH_RESET_VALUE;
  69  0018 725f5388      	clr	21384
  70                     ; 160   DAC->CH1RDHRL = DAC_RDHRL_RESET_VALUE;
  72  001c 725f5389      	clr	21385
  73                     ; 161   DAC->CH1LDHRH = DAC_LDHRH_RESET_VALUE;
  75  0020 725f538c      	clr	21388
  76                     ; 162   DAC->CH1LDHRL = DAC_LDHRL_RESET_VALUE;
  78  0024 725f538d      	clr	21389
  79                     ; 163   DAC->CH1DHR8 = DAC_DHR8_RESET_VALUE;
  81  0028 725f5390      	clr	21392
  82                     ; 166   DAC->CH2RDHRH = DAC_RDHRH_RESET_VALUE;
  84  002c 725f5394      	clr	21396
  85                     ; 167   DAC->CH2RDHRL = DAC_RDHRL_RESET_VALUE;
  87  0030 725f5395      	clr	21397
  88                     ; 168   DAC->CH2LDHRH = DAC_LDHRH_RESET_VALUE;
  90  0034 725f5398      	clr	21400
  91                     ; 169   DAC->CH2LDHRL = DAC_LDHRL_RESET_VALUE;
  93  0038 725f5399      	clr	21401
  94                     ; 170   DAC->CH2DHR8 = DAC_DHR8_RESET_VALUE;
  96  003c 725f539c      	clr	21404
  97                     ; 173   DAC->DCH1RDHRH = DAC_RDHRH_RESET_VALUE;
  99  0040 725f53a0      	clr	21408
 100                     ; 174   DAC->DCH1RDHRL = DAC_RDHRL_RESET_VALUE;
 102  0044 725f53a1      	clr	21409
 103                     ; 175   DAC->DCH2RDHRH = DAC_RDHRH_RESET_VALUE;
 105  0048 725f53a2      	clr	21410
 106                     ; 176   DAC->DCH2RDHRL = DAC_RDHRL_RESET_VALUE;
 108  004c 725f53a3      	clr	21411
 109                     ; 179   DAC->DCH1LDHRH = DAC_LDHRH_RESET_VALUE;
 111  0050 725f53a4      	clr	21412
 112                     ; 180   DAC->DCH1LDHRL = DAC_LDHRL_RESET_VALUE;
 114  0054 725f53a5      	clr	21413
 115                     ; 181   DAC->DCH2LDHRH = DAC_LDHRH_RESET_VALUE;
 117  0058 725f53a6      	clr	21414
 118                     ; 182   DAC->DCH2LDHRL = DAC_LDHRL_RESET_VALUE;
 120  005c 725f53a7      	clr	21415
 121                     ; 185   DAC->DCH1DHR8 = DAC_DHR8_RESET_VALUE;
 123  0060 725f53a8      	clr	21416
 124                     ; 186   DAC->DCH2DHR8 = DAC_DHR8_RESET_VALUE;
 126  0064 725f53a9      	clr	21417
 127                     ; 187 }
 130  0068 81            	ret
 289                     ; 208 void DAC_Init(DAC_Channel_TypeDef DAC_Channel,
 289                     ; 209               DAC_Trigger_TypeDef DAC_Trigger,
 289                     ; 210               DAC_OutputBuffer_TypeDef DAC_OutputBuffer)
 289                     ; 211 {
 290                     	switch	.text
 291  0069               _DAC_Init:
 293  0069 89            	pushw	x
 294  006a 5203          	subw	sp,#3
 295       00000003      OFST:	set	3
 298                     ; 212   uint8_t tmpreg = 0;
 300                     ; 213   uint16_t tmpreg2 = 0;
 302                     ; 216   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 304                     ; 217   assert_param(IS_DAC_TRIGGER(DAC_Trigger));
 306                     ; 218   assert_param(IS_DAC_OUTPUT_BUFFER_STATE(DAC_OutputBuffer));
 308                     ; 221   tmpreg2 =  (uint16_t)((uint8_t)((uint8_t)DAC_Channel << 1));
 310  006c 9e            	ld	a,xh
 311  006d 48            	sll	a
 312  006e 5f            	clrw	x
 313  006f 97            	ld	xl,a
 314  0070 1f01          	ldw	(OFST-2,sp),x
 316                     ; 222   tmpreg = *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2));
 318  0072 1e01          	ldw	x,(OFST-2,sp)
 319  0074 d65380        	ld	a,(21376,x)
 320  0077 6b03          	ld	(OFST+0,sp),a
 322                     ; 225   tmpreg &= (uint8_t)~(DAC_CR1_BOFF | DAC_CR1_TEN | DAC_CR1_TSEL );
 324  0079 7b03          	ld	a,(OFST+0,sp)
 325  007b a4c1          	and	a,#193
 326  007d 6b03          	ld	(OFST+0,sp),a
 328                     ; 228   tmpreg |= (uint8_t)(DAC_OutputBuffer);
 330  007f 7b03          	ld	a,(OFST+0,sp)
 331  0081 1a08          	or	a,(OFST+5,sp)
 332  0083 6b03          	ld	(OFST+0,sp),a
 334                     ; 232   if (DAC_Trigger != DAC_Trigger_None)
 336  0085 7b05          	ld	a,(OFST+2,sp)
 337  0087 a130          	cp	a,#48
 338  0089 2708          	jreq	L511
 339                     ; 235     tmpreg |= (uint8_t)(DAC_CR1_TEN | DAC_Trigger) ;
 341  008b 7b05          	ld	a,(OFST+2,sp)
 342  008d aa04          	or	a,#4
 343  008f 1a03          	or	a,(OFST+0,sp)
 344  0091 6b03          	ld	(OFST+0,sp),a
 346  0093               L511:
 347                     ; 239   *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2)) = (uint8_t)tmpreg;
 349  0093 7b03          	ld	a,(OFST+0,sp)
 350  0095 1e01          	ldw	x,(OFST-2,sp)
 351  0097 d75380        	ld	(21376,x),a
 352                     ; 240 }
 355  009a 5b05          	addw	sp,#5
 356  009c 81            	ret
 430                     ; 254 void DAC_Cmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 430                     ; 255 {
 431                     	switch	.text
 432  009d               _DAC_Cmd:
 434  009d 89            	pushw	x
 435  009e 89            	pushw	x
 436       00000002      OFST:	set	2
 439                     ; 256   uint16_t cr1addr = 0;
 441                     ; 258   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 443                     ; 259   assert_param(IS_FUNCTIONAL_STATE(NewState));
 445                     ; 262   cr1addr = DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
 447  009f 9e            	ld	a,xh
 448  00a0 48            	sll	a
 449  00a1 5f            	clrw	x
 450  00a2 97            	ld	xl,a
 451  00a3 1c5380        	addw	x,#21376
 452  00a6 1f01          	ldw	(OFST-1,sp),x
 454                     ; 264   if (NewState != DISABLE)
 456  00a8 0d04          	tnz	(OFST+2,sp)
 457  00aa 2708          	jreq	L551
 458                     ; 267     (*(uint8_t*)(cr1addr)) |= DAC_CR1_EN;
 460  00ac 1e01          	ldw	x,(OFST-1,sp)
 461  00ae f6            	ld	a,(x)
 462  00af aa01          	or	a,#1
 463  00b1 f7            	ld	(x),a
 465  00b2 2006          	jra	L751
 466  00b4               L551:
 467                     ; 272     (*(uint8_t*)(cr1addr)) &= (uint8_t) ~(DAC_CR1_EN);
 469  00b4 1e01          	ldw	x,(OFST-1,sp)
 470  00b6 f6            	ld	a,(x)
 471  00b7 a4fe          	and	a,#254
 472  00b9 f7            	ld	(x),a
 473  00ba               L751:
 474                     ; 274 }
 477  00ba 5b04          	addw	sp,#4
 478  00bc 81            	ret
 524                     ; 286 void DAC_SoftwareTriggerCmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 524                     ; 287 {
 525                     	switch	.text
 526  00bd               _DAC_SoftwareTriggerCmd:
 528  00bd 89            	pushw	x
 529       00000000      OFST:	set	0
 532                     ; 289   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 534                     ; 290   assert_param(IS_FUNCTIONAL_STATE(NewState));
 536                     ; 292   if (NewState != DISABLE)
 538  00be 9f            	ld	a,xl
 539  00bf 4d            	tnz	a
 540  00c0 2714          	jreq	L302
 541                     ; 295     DAC->SWTRIGR |= (uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel);
 543  00c2 9e            	ld	a,xh
 544  00c3 5f            	clrw	x
 545  00c4 97            	ld	xl,a
 546  00c5 a601          	ld	a,#1
 547  00c7 5d            	tnzw	x
 548  00c8 2704          	jreq	L41
 549  00ca               L61:
 550  00ca 48            	sll	a
 551  00cb 5a            	decw	x
 552  00cc 26fc          	jrne	L61
 553  00ce               L41:
 554  00ce ca5384        	or	a,21380
 555  00d1 c75384        	ld	21380,a
 557  00d4 2014          	jra	L502
 558  00d6               L302:
 559                     ; 300     DAC->SWTRIGR &= (uint8_t)~((uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel));
 561  00d6 7b01          	ld	a,(OFST+1,sp)
 562  00d8 5f            	clrw	x
 563  00d9 97            	ld	xl,a
 564  00da a601          	ld	a,#1
 565  00dc 5d            	tnzw	x
 566  00dd 2704          	jreq	L02
 567  00df               L22:
 568  00df 48            	sll	a
 569  00e0 5a            	decw	x
 570  00e1 26fc          	jrne	L22
 571  00e3               L02:
 572  00e3 43            	cpl	a
 573  00e4 c45384        	and	a,21380
 574  00e7 c75384        	ld	21380,a
 575  00ea               L502:
 576                     ; 302 }
 579  00ea 85            	popw	x
 580  00eb 81            	ret
 616                     ; 311 void DAC_DualSoftwareTriggerCmd(FunctionalState NewState)
 616                     ; 312 {
 617                     	switch	.text
 618  00ec               _DAC_DualSoftwareTriggerCmd:
 622                     ; 314   assert_param(IS_FUNCTIONAL_STATE(NewState));
 624                     ; 316   if (NewState != DISABLE)
 626  00ec 4d            	tnz	a
 627  00ed 270a          	jreq	L522
 628                     ; 319     DAC->SWTRIGR |= (DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2) ;
 630  00ef c65384        	ld	a,21380
 631  00f2 aa03          	or	a,#3
 632  00f4 c75384        	ld	21380,a
 634  00f7 2008          	jra	L722
 635  00f9               L522:
 636                     ; 324     DAC->SWTRIGR &= (uint8_t)~(DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2);
 638  00f9 c65384        	ld	a,21380
 639  00fc a4fc          	and	a,#252
 640  00fe c75384        	ld	21380,a
 641  0101               L722:
 642                     ; 326 }
 645  0101 81            	ret
 730                     ; 342 void DAC_WaveGenerationCmd(DAC_Channel_TypeDef DAC_Channel,
 730                     ; 343                            DAC_Wave_TypeDef DAC_Wave,
 730                     ; 344                            FunctionalState NewState)
 730                     ; 345 {
 731                     	switch	.text
 732  0102               _DAC_WaveGenerationCmd:
 734  0102 89            	pushw	x
 735  0103 88            	push	a
 736       00000001      OFST:	set	1
 739                     ; 346   uint8_t tmpreg = 0;
 741                     ; 349   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 743                     ; 350   assert_param(IS_DAC_WAVE(DAC_Wave));
 745                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
 747                     ; 354   tmpreg = (uint8_t)((*(uint8_t*)(uint16_t)(DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1))) & (uint8_t)~(DAC_CR1_WAVEN));
 749  0104 9e            	ld	a,xh
 750  0105 48            	sll	a
 751  0106 5f            	clrw	x
 752  0107 97            	ld	xl,a
 753  0108 d65380        	ld	a,(21376,x)
 754  010b a43f          	and	a,#63
 755  010d 6b01          	ld	(OFST+0,sp),a
 757                     ; 356   if (NewState != DISABLE)
 759  010f 0d06          	tnz	(OFST+5,sp)
 760  0111 2706          	jreq	L372
 761                     ; 358     tmpreg |= (uint8_t)(DAC_Wave);
 763  0113 7b01          	ld	a,(OFST+0,sp)
 764  0115 1a03          	or	a,(OFST+2,sp)
 765  0117 6b01          	ld	(OFST+0,sp),a
 767  0119               L372:
 768                     ; 362   (*(uint8_t*) (uint16_t)(DAC_BASE + CR1_Offset +  (uint8_t)((uint8_t)DAC_Channel << 1))) = tmpreg;
 770  0119 7b02          	ld	a,(OFST+1,sp)
 771  011b 48            	sll	a
 772  011c 5f            	clrw	x
 773  011d 97            	ld	xl,a
 774  011e 7b01          	ld	a,(OFST+0,sp)
 775  0120 d75380        	ld	(21376,x),a
 776                     ; 364 }
 779  0123 5b03          	addw	sp,#3
 780  0125 81            	ret
 946                     ; 388 void DAC_SetNoiseWaveLFSR(DAC_Channel_TypeDef DAC_Channel, DAC_LFSRUnmask_TypeDef DAC_LFSRUnmask)
 946                     ; 389 {
 947                     	switch	.text
 948  0126               _DAC_SetNoiseWaveLFSR:
 950  0126 89            	pushw	x
 951  0127 5203          	subw	sp,#3
 952       00000003      OFST:	set	3
 955                     ; 390   uint8_t tmpreg = 0;
 957                     ; 391   uint16_t cr2addr = 0;
 959                     ; 394   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 961                     ; 395   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_LFSRUnmask));
 963                     ; 398   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
 965  0129 9e            	ld	a,xh
 966  012a 48            	sll	a
 967  012b 5f            	clrw	x
 968  012c 97            	ld	xl,a
 969  012d 1c5381        	addw	x,#21377
 970  0130 1f02          	ldw	(OFST-1,sp),x
 972                     ; 399   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
 974  0132 1e02          	ldw	x,(OFST-1,sp)
 975  0134 f6            	ld	a,(x)
 976  0135 a4f0          	and	a,#240
 977  0137 6b01          	ld	(OFST-2,sp),a
 979                     ; 402   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_LFSRUnmask);
 981  0139 7b01          	ld	a,(OFST-2,sp)
 982  013b 1a05          	or	a,(OFST+2,sp)
 983  013d 1e02          	ldw	x,(OFST-1,sp)
 984  013f f7            	ld	(x),a
 985                     ; 403 }
 988  0140 5b05          	addw	sp,#5
 989  0142 81            	ret
1156                     ; 427 void DAC_SetTriangleWaveAmplitude(DAC_Channel_TypeDef DAC_Channel, DAC_TriangleAmplitude_TypeDef DAC_TriangleAmplitude)
1156                     ; 428 {
1157                     	switch	.text
1158  0143               _DAC_SetTriangleWaveAmplitude:
1160  0143 89            	pushw	x
1161  0144 5203          	subw	sp,#3
1162       00000003      OFST:	set	3
1165                     ; 429   uint8_t tmpreg = 0;
1167                     ; 430   uint16_t cr2addr = 0;
1169                     ; 433   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1171                     ; 434   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_TriangleAmplitude));
1173                     ; 438   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
1175  0146 9e            	ld	a,xh
1176  0147 48            	sll	a
1177  0148 5f            	clrw	x
1178  0149 97            	ld	xl,a
1179  014a 1c5381        	addw	x,#21377
1180  014d 1f02          	ldw	(OFST-1,sp),x
1182                     ; 439   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
1184  014f 1e02          	ldw	x,(OFST-1,sp)
1185  0151 f6            	ld	a,(x)
1186  0152 a4f0          	and	a,#240
1187  0154 6b01          	ld	(OFST-2,sp),a
1189                     ; 442   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_TriangleAmplitude);
1191  0156 7b01          	ld	a,(OFST-2,sp)
1192  0158 1a05          	or	a,(OFST+2,sp)
1193  015a 1e02          	ldw	x,(OFST-1,sp)
1194  015c f7            	ld	(x),a
1195                     ; 443 }
1198  015d 5b05          	addw	sp,#5
1199  015f 81            	ret
1271                     ; 455 void DAC_SetChannel1Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1271                     ; 456 {
1272                     	switch	.text
1273  0160               _DAC_SetChannel1Data:
1275  0160 88            	push	a
1276       00000000      OFST:	set	0
1279                     ; 458   assert_param(IS_DAC_ALIGN(DAC_Align));
1281                     ; 460   if (DAC_Align != DAC_Align_8b_R)
1283  0161 a108          	cp	a,#8
1284  0163 2712          	jreq	L505
1285                     ; 463     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1287  0165 5f            	clrw	x
1288  0166 97            	ld	xl,a
1289  0167 7b04          	ld	a,(OFST+4,sp)
1290  0169 d75388        	ld	(21384,x),a
1291                     ; 464     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1293  016c 7b01          	ld	a,(OFST+1,sp)
1294  016e 5f            	clrw	x
1295  016f 97            	ld	xl,a
1296  0170 7b05          	ld	a,(OFST+5,sp)
1297  0172 d75389        	ld	(21385,x),a
1299  0175 2005          	jra	L705
1300  0177               L505:
1301                     ; 469     assert_param(IS_DAC_DATA_08R(DAC_Data));
1303                     ; 472     DAC->CH1DHR8 = (uint8_t)(DAC_Data);
1305  0177 7b05          	ld	a,(OFST+5,sp)
1306  0179 c75390        	ld	21392,a
1307  017c               L705:
1308                     ; 474 }
1311  017c 84            	pop	a
1312  017d 81            	ret
1357                     ; 486 void DAC_SetChannel2Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1357                     ; 487 {
1358                     	switch	.text
1359  017e               _DAC_SetChannel2Data:
1361  017e 88            	push	a
1362       00000000      OFST:	set	0
1365                     ; 489   assert_param(IS_DAC_ALIGN(DAC_Align));
1367                     ; 491   if (DAC_Align != DAC_Align_8b_R)
1369  017f a108          	cp	a,#8
1370  0181 2712          	jreq	L335
1371                     ; 494     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1373  0183 5f            	clrw	x
1374  0184 97            	ld	xl,a
1375  0185 7b04          	ld	a,(OFST+4,sp)
1376  0187 d75394        	ld	(21396,x),a
1377                     ; 495     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1379  018a 7b01          	ld	a,(OFST+1,sp)
1380  018c 5f            	clrw	x
1381  018d 97            	ld	xl,a
1382  018e 7b05          	ld	a,(OFST+5,sp)
1383  0190 d75395        	ld	(21397,x),a
1385  0193 2005          	jra	L535
1386  0195               L335:
1387                     ; 500     assert_param(IS_DAC_DATA_08R(DAC_Data));
1389                     ; 503     DAC->CH2DHR8 = (uint8_t)(DAC_Data);
1391  0195 7b05          	ld	a,(OFST+5,sp)
1392  0197 c7539c        	ld	21404,a
1393  019a               L535:
1394                     ; 505 }
1397  019a 84            	pop	a
1398  019b 81            	ret
1461                     ; 522 void DAC_SetDualChannelData(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data2, uint16_t DAC_Data1)
1461                     ; 523 {
1462                     	switch	.text
1463  019c               _DAC_SetDualChannelData:
1465  019c 88            	push	a
1466  019d 89            	pushw	x
1467       00000002      OFST:	set	2
1470                     ; 524   uint16_t dchxrdhrhaddr = 0;
1472                     ; 527   assert_param(IS_DAC_ALIGN(DAC_Align));
1474                     ; 529   if (DAC_Align != DAC_Align_8b_R)
1476  019e a108          	cp	a,#8
1477  01a0 2720          	jreq	L175
1478                     ; 532     dchxrdhrhaddr = (uint16_t)(DAC_BASE + DCH1RDHRH_Offset + DAC_Align);
1480  01a2 5f            	clrw	x
1481  01a3 97            	ld	xl,a
1482  01a4 1c53a0        	addw	x,#21408
1483  01a7 1f01          	ldw	(OFST-1,sp),x
1485                     ; 535     *(uint8_t*)(uint16_t)dchxrdhrhaddr = (uint8_t)(((uint16_t)DAC_Data1) >> 8);
1487  01a9 7b08          	ld	a,(OFST+6,sp)
1488  01ab 1e01          	ldw	x,(OFST-1,sp)
1489  01ad f7            	ld	(x),a
1490                     ; 536     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 1) = (uint8_t)DAC_Data1;
1492  01ae 7b09          	ld	a,(OFST+7,sp)
1493  01b0 1e01          	ldw	x,(OFST-1,sp)
1494  01b2 e701          	ld	(1,x),a
1495                     ; 537     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 2) = (uint8_t)(((uint16_t)DAC_Data2) >> 8);
1497  01b4 7b06          	ld	a,(OFST+4,sp)
1498  01b6 1e01          	ldw	x,(OFST-1,sp)
1499  01b8 e702          	ld	(2,x),a
1500                     ; 538     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 3) = (uint8_t)DAC_Data2;
1502  01ba 7b07          	ld	a,(OFST+5,sp)
1503  01bc 1e01          	ldw	x,(OFST-1,sp)
1504  01be e703          	ld	(3,x),a
1506  01c0 200a          	jra	L375
1507  01c2               L175:
1508                     ; 543     assert_param(IS_DAC_DATA_08R(DAC_Data1 | DAC_Data2));
1510                     ; 546     DAC->DCH1DHR8 = (uint8_t)(DAC_Data1);
1512  01c2 7b09          	ld	a,(OFST+7,sp)
1513  01c4 c753a8        	ld	21416,a
1514                     ; 547     DAC->DCH2DHR8 = (uint8_t)(DAC_Data2);
1516  01c7 7b07          	ld	a,(OFST+5,sp)
1517  01c9 c753a9        	ld	21417,a
1518  01cc               L375:
1519                     ; 549 }
1522  01cc 5b03          	addw	sp,#3
1523  01ce 81            	ret
1577                     ; 559 uint16_t DAC_GetDataOutputValue(DAC_Channel_TypeDef DAC_Channel)
1577                     ; 560 {
1578                     	switch	.text
1579  01cf               _DAC_GetDataOutputValue:
1581  01cf 89            	pushw	x
1582       00000002      OFST:	set	2
1585                     ; 561   uint16_t outputdata = 0;
1587                     ; 562   uint16_t tmp = 0;
1589                     ; 565   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1591                     ; 567   if ( DAC_Channel ==  DAC_Channel_1)
1593  01d0 4d            	tnz	a
1594  01d1 2619          	jrne	L326
1595                     ; 570     tmp = (uint16_t)((uint16_t)DAC->CH1DORH << 8);
1597  01d3 c653ac        	ld	a,21420
1598  01d6 5f            	clrw	x
1599  01d7 97            	ld	xl,a
1600  01d8 4f            	clr	a
1601  01d9 02            	rlwa	x,a
1602  01da 1f01          	ldw	(OFST-1,sp),x
1604                     ; 571     outputdata = (uint16_t)(tmp | (DAC->CH1DORL));
1606  01dc c653ad        	ld	a,21421
1607  01df 5f            	clrw	x
1608  01e0 97            	ld	xl,a
1609  01e1 01            	rrwa	x,a
1610  01e2 1a02          	or	a,(OFST+0,sp)
1611  01e4 01            	rrwa	x,a
1612  01e5 1a01          	or	a,(OFST-1,sp)
1613  01e7 01            	rrwa	x,a
1614  01e8 1f01          	ldw	(OFST-1,sp),x
1617  01ea 2017          	jra	L526
1618  01ec               L326:
1619                     ; 576     tmp = (uint16_t)((uint16_t)DAC->CH2DORH << 8);
1621  01ec c653b0        	ld	a,21424
1622  01ef 5f            	clrw	x
1623  01f0 97            	ld	xl,a
1624  01f1 4f            	clr	a
1625  01f2 02            	rlwa	x,a
1626  01f3 1f01          	ldw	(OFST-1,sp),x
1628                     ; 577     outputdata = (uint16_t)(tmp | (DAC->CH2DORL));
1630  01f5 c653b1        	ld	a,21425
1631  01f8 5f            	clrw	x
1632  01f9 97            	ld	xl,a
1633  01fa 01            	rrwa	x,a
1634  01fb 1a02          	or	a,(OFST+0,sp)
1635  01fd 01            	rrwa	x,a
1636  01fe 1a01          	or	a,(OFST-1,sp)
1637  0200 01            	rrwa	x,a
1638  0201 1f01          	ldw	(OFST-1,sp),x
1640  0203               L526:
1641                     ; 581   return (uint16_t)outputdata;
1643  0203 1e01          	ldw	x,(OFST-1,sp)
1646  0205 5b02          	addw	sp,#2
1647  0207 81            	ret
1701                     ; 613 void DAC_DMACmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
1701                     ; 614 {
1702                     	switch	.text
1703  0208               _DAC_DMACmd:
1705  0208 89            	pushw	x
1706  0209 89            	pushw	x
1707       00000002      OFST:	set	2
1710                     ; 615   uint16_t cr2addr = 0;
1712                     ; 618   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1714                     ; 619   assert_param(IS_FUNCTIONAL_STATE(NewState));
1716                     ; 622   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1718  020a 9e            	ld	a,xh
1719  020b 48            	sll	a
1720  020c 5f            	clrw	x
1721  020d 97            	ld	xl,a
1722  020e 1c5381        	addw	x,#21377
1723  0211 1f01          	ldw	(OFST-1,sp),x
1725                     ; 624   if (NewState != DISABLE)
1727  0213 0d04          	tnz	(OFST+2,sp)
1728  0215 2708          	jreq	L556
1729                     ; 627     (*(uint8_t*)(cr2addr)) |= DAC_CR2_DMAEN;
1731  0217 1e01          	ldw	x,(OFST-1,sp)
1732  0219 f6            	ld	a,(x)
1733  021a aa10          	or	a,#16
1734  021c f7            	ld	(x),a
1736  021d 2006          	jra	L756
1737  021f               L556:
1738                     ; 632     (*(uint8_t*)(cr2addr)) &= (uint8_t)~(DAC_CR2_DMAEN);
1740  021f 1e01          	ldw	x,(OFST-1,sp)
1741  0221 f6            	ld	a,(x)
1742  0222 a4ef          	and	a,#239
1743  0224 f7            	ld	(x),a
1744  0225               L756:
1745                     ; 634 }
1748  0225 5b04          	addw	sp,#4
1749  0227 81            	ret
1826                     ; 667 void DAC_ITConfig(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT, FunctionalState NewState)
1826                     ; 668 {
1827                     	switch	.text
1828  0228               _DAC_ITConfig:
1830  0228 89            	pushw	x
1831  0229 89            	pushw	x
1832       00000002      OFST:	set	2
1835                     ; 669   uint16_t cr2addr = 0;
1837                     ; 672   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1839                     ; 673   assert_param(IS_FUNCTIONAL_STATE(NewState));
1841                     ; 674   assert_param(IS_DAC_IT(DAC_IT));
1843                     ; 677   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1845  022a 9e            	ld	a,xh
1846  022b 48            	sll	a
1847  022c 5f            	clrw	x
1848  022d 97            	ld	xl,a
1849  022e 1c5381        	addw	x,#21377
1850  0231 1f01          	ldw	(OFST-1,sp),x
1852                     ; 679   if (NewState != DISABLE)
1854  0233 0d07          	tnz	(OFST+5,sp)
1855  0235 2708          	jreq	L127
1856                     ; 682     (*(uint8_t*)(cr2addr)) |=  (uint8_t)(DAC_IT);
1858  0237 1e01          	ldw	x,(OFST-1,sp)
1859  0239 f6            	ld	a,(x)
1860  023a 1a04          	or	a,(OFST+2,sp)
1861  023c f7            	ld	(x),a
1863  023d 2007          	jra	L327
1864  023f               L127:
1865                     ; 687     (*(uint8_t*)(cr2addr)) &= (uint8_t)(~(DAC_IT));
1867  023f 1e01          	ldw	x,(OFST-1,sp)
1868  0241 7b04          	ld	a,(OFST+2,sp)
1869  0243 43            	cpl	a
1870  0244 f4            	and	a,(x)
1871  0245 f7            	ld	(x),a
1872  0246               L327:
1873                     ; 689 }
1876  0246 5b04          	addw	sp,#4
1877  0248 81            	ret
1975                     ; 704 FlagStatus DAC_GetFlagStatus(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
1975                     ; 705 {
1976                     	switch	.text
1977  0249               _DAC_GetFlagStatus:
1979  0249 89            	pushw	x
1980  024a 88            	push	a
1981       00000001      OFST:	set	1
1984                     ; 706   FlagStatus flagstatus = RESET;
1986                     ; 707   uint8_t flag = 0;
1988                     ; 710   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1990                     ; 711   assert_param(IS_DAC_FLAG(DAC_FLAG));
1992                     ; 713   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
1994  024b 9e            	ld	a,xh
1995  024c 5f            	clrw	x
1996  024d 97            	ld	xl,a
1997  024e 7b03          	ld	a,(OFST+2,sp)
1998  0250 5d            	tnzw	x
1999  0251 2704          	jreq	L25
2000  0253               L45:
2001  0253 48            	sll	a
2002  0254 5a            	decw	x
2003  0255 26fc          	jrne	L45
2004  0257               L25:
2005  0257 6b01          	ld	(OFST+0,sp),a
2007                     ; 716   if ((DAC->SR & flag ) != (uint8_t)RESET)
2009  0259 c65385        	ld	a,21381
2010  025c 1501          	bcp	a,(OFST+0,sp)
2011  025e 2706          	jreq	L577
2012                     ; 719     flagstatus = SET;
2014  0260 a601          	ld	a,#1
2015  0262 6b01          	ld	(OFST+0,sp),a
2018  0264 2002          	jra	L777
2019  0266               L577:
2020                     ; 724     flagstatus = RESET;
2022  0266 0f01          	clr	(OFST+0,sp)
2024  0268               L777:
2025                     ; 728   return  flagstatus;
2027  0268 7b01          	ld	a,(OFST+0,sp)
2030  026a 5b03          	addw	sp,#3
2031  026c 81            	ret
2085                     ; 742 void DAC_ClearFlag(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
2085                     ; 743 {
2086                     	switch	.text
2087  026d               _DAC_ClearFlag:
2089  026d 89            	pushw	x
2090  026e 88            	push	a
2091       00000001      OFST:	set	1
2094                     ; 744   uint8_t flag = 0;
2096                     ; 747   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2098                     ; 748   assert_param(IS_DAC_FLAG(DAC_FLAG));
2100                     ; 751   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
2102  026f 9e            	ld	a,xh
2103  0270 5f            	clrw	x
2104  0271 97            	ld	xl,a
2105  0272 7b03          	ld	a,(OFST+2,sp)
2106  0274 5d            	tnzw	x
2107  0275 2704          	jreq	L06
2108  0277               L26:
2109  0277 48            	sll	a
2110  0278 5a            	decw	x
2111  0279 26fc          	jrne	L26
2112  027b               L06:
2113  027b 6b01          	ld	(OFST+0,sp),a
2115                     ; 754   DAC->SR = (uint8_t)(~flag);
2117  027d 7b01          	ld	a,(OFST+0,sp)
2118  027f 43            	cpl	a
2119  0280 c75385        	ld	21381,a
2120                     ; 755 }
2123  0283 5b03          	addw	sp,#3
2124  0285 81            	ret
2207                     ; 770 ITStatus DAC_GetITStatus(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2207                     ; 771 {
2208                     	switch	.text
2209  0286               _DAC_GetITStatus:
2211  0286 89            	pushw	x
2212  0287 89            	pushw	x
2213       00000002      OFST:	set	2
2216                     ; 772   ITStatus itstatus = RESET;
2218                     ; 773   uint8_t enablestatus = 0;
2220                     ; 774   uint8_t flagstatus = 0;
2222                     ; 775   uint8_t tempreg = 0;
2224                     ; 778   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2226                     ; 779   assert_param(IS_DAC_IT(DAC_IT));
2228                     ; 782   tempreg = *(uint8_t*)(uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 2));
2230  0288 9e            	ld	a,xh
2231  0289 48            	sll	a
2232  028a 48            	sll	a
2233  028b 5f            	clrw	x
2234  028c 97            	ld	xl,a
2235  028d d65381        	ld	a,(21377,x)
2236  0290 6b02          	ld	(OFST+0,sp),a
2238                     ; 783   enablestatus = (uint8_t)( tempreg & (uint8_t)((uint8_t)DAC_IT << DAC_Channel));
2240  0292 7b03          	ld	a,(OFST+1,sp)
2241  0294 5f            	clrw	x
2242  0295 97            	ld	xl,a
2243  0296 7b04          	ld	a,(OFST+2,sp)
2244  0298 5d            	tnzw	x
2245  0299 2704          	jreq	L66
2246  029b               L07:
2247  029b 48            	sll	a
2248  029c 5a            	decw	x
2249  029d 26fc          	jrne	L07
2250  029f               L66:
2251  029f 1402          	and	a,(OFST+0,sp)
2252  02a1 6b01          	ld	(OFST-1,sp),a
2254                     ; 784   flagstatus = (uint8_t)(DAC->SR & (uint8_t)(DAC_IT >> ((uint8_t)0x05 - DAC_Channel)));
2256  02a3 a605          	ld	a,#5
2257  02a5 1003          	sub	a,(OFST+1,sp)
2258  02a7 5f            	clrw	x
2259  02a8 97            	ld	xl,a
2260  02a9 7b04          	ld	a,(OFST+2,sp)
2261  02ab 5d            	tnzw	x
2262  02ac 2704          	jreq	L27
2263  02ae               L47:
2264  02ae 44            	srl	a
2265  02af 5a            	decw	x
2266  02b0 26fc          	jrne	L47
2267  02b2               L27:
2268  02b2 c45385        	and	a,21381
2269  02b5 6b02          	ld	(OFST+0,sp),a
2271                     ; 787   if (((flagstatus) != (uint8_t)RESET) && enablestatus)
2273  02b7 0d02          	tnz	(OFST+0,sp)
2274  02b9 270a          	jreq	L1701
2276  02bb 0d01          	tnz	(OFST-1,sp)
2277  02bd 2706          	jreq	L1701
2278                     ; 790     itstatus = SET;
2280  02bf a601          	ld	a,#1
2281  02c1 6b02          	ld	(OFST+0,sp),a
2284  02c3 2002          	jra	L3701
2285  02c5               L1701:
2286                     ; 795     itstatus = RESET;
2288  02c5 0f02          	clr	(OFST+0,sp)
2290  02c7               L3701:
2291                     ; 799   return  itstatus;
2293  02c7 7b02          	ld	a,(OFST+0,sp)
2296  02c9 5b04          	addw	sp,#4
2297  02cb 81            	ret
2343                     ; 813 void DAC_ClearITPendingBit(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2343                     ; 814 {
2344                     	switch	.text
2345  02cc               _DAC_ClearITPendingBit:
2347  02cc 89            	pushw	x
2348       00000000      OFST:	set	0
2351                     ; 816   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2353                     ; 817   assert_param(IS_DAC_IT(DAC_IT));
2355                     ; 820   DAC->SR = (uint8_t)~(uint8_t)((uint8_t)DAC_IT >> (0x05 - DAC_Channel));
2357  02cd 9e            	ld	a,xh
2358  02ce a005          	sub	a,#5
2359  02d0 40            	neg	a
2360  02d1 5f            	clrw	x
2361  02d2 97            	ld	xl,a
2362  02d3 7b02          	ld	a,(OFST+2,sp)
2363  02d5 5d            	tnzw	x
2364  02d6 2704          	jreq	L001
2365  02d8               L201:
2366  02d8 44            	srl	a
2367  02d9 5a            	decw	x
2368  02da 26fc          	jrne	L201
2369  02dc               L001:
2370  02dc 43            	cpl	a
2371  02dd c75385        	ld	21381,a
2372                     ; 821 }
2375  02e0 85            	popw	x
2376  02e1 81            	ret
2389                     	xdef	_DAC_ClearITPendingBit
2390                     	xdef	_DAC_GetITStatus
2391                     	xdef	_DAC_ClearFlag
2392                     	xdef	_DAC_GetFlagStatus
2393                     	xdef	_DAC_ITConfig
2394                     	xdef	_DAC_DMACmd
2395                     	xdef	_DAC_GetDataOutputValue
2396                     	xdef	_DAC_SetDualChannelData
2397                     	xdef	_DAC_SetChannel2Data
2398                     	xdef	_DAC_SetChannel1Data
2399                     	xdef	_DAC_SetTriangleWaveAmplitude
2400                     	xdef	_DAC_SetNoiseWaveLFSR
2401                     	xdef	_DAC_WaveGenerationCmd
2402                     	xdef	_DAC_DualSoftwareTriggerCmd
2403                     	xdef	_DAC_SoftwareTriggerCmd
2404                     	xdef	_DAC_Cmd
2405                     	xdef	_DAC_Init
2406                     	xdef	_DAC_DeInit
2425                     	end
