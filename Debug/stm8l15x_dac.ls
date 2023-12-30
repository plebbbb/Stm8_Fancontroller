   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  43                     ; 142 void DAC_DeInit(void)
  43                     ; 143 {
  45                     .text:	section	.text,new
  46  0000               _DAC_DeInit:
  50                     ; 145   DAC->CH1CR1 = DAC_CR1_RESET_VALUE;
  52  0000 725f5380      	clr	21376
  53                     ; 146   DAC->CH1CR2 = DAC_CR2_RESET_VALUE;
  55  0004 725f5381      	clr	21377
  56                     ; 149   DAC->CH2CR1 = DAC_CR1_RESET_VALUE;
  58  0008 725f5382      	clr	21378
  59                     ; 150   DAC->CH2CR2 = DAC_CR2_RESET_VALUE;
  61  000c 725f5383      	clr	21379
  62                     ; 153   DAC->SWTRIGR = DAC_SWTRIGR_RESET_VALUE;
  64  0010 725f5384      	clr	21380
  65                     ; 156   DAC->SR = (uint8_t)~DAC_SR_RESET_VALUE;
  67  0014 35ff5385      	mov	21381,#255
  68                     ; 159   DAC->CH1RDHRH = DAC_RDHRH_RESET_VALUE;
  70  0018 725f5388      	clr	21384
  71                     ; 160   DAC->CH1RDHRL = DAC_RDHRL_RESET_VALUE;
  73  001c 725f5389      	clr	21385
  74                     ; 161   DAC->CH1LDHRH = DAC_LDHRH_RESET_VALUE;
  76  0020 725f538c      	clr	21388
  77                     ; 162   DAC->CH1LDHRL = DAC_LDHRL_RESET_VALUE;
  79  0024 725f538d      	clr	21389
  80                     ; 163   DAC->CH1DHR8 = DAC_DHR8_RESET_VALUE;
  82  0028 725f5390      	clr	21392
  83                     ; 166   DAC->CH2RDHRH = DAC_RDHRH_RESET_VALUE;
  85  002c 725f5394      	clr	21396
  86                     ; 167   DAC->CH2RDHRL = DAC_RDHRL_RESET_VALUE;
  88  0030 725f5395      	clr	21397
  89                     ; 168   DAC->CH2LDHRH = DAC_LDHRH_RESET_VALUE;
  91  0034 725f5398      	clr	21400
  92                     ; 169   DAC->CH2LDHRL = DAC_LDHRL_RESET_VALUE;
  94  0038 725f5399      	clr	21401
  95                     ; 170   DAC->CH2DHR8 = DAC_DHR8_RESET_VALUE;
  97  003c 725f539c      	clr	21404
  98                     ; 173   DAC->DCH1RDHRH = DAC_RDHRH_RESET_VALUE;
 100  0040 725f53a0      	clr	21408
 101                     ; 174   DAC->DCH1RDHRL = DAC_RDHRL_RESET_VALUE;
 103  0044 725f53a1      	clr	21409
 104                     ; 175   DAC->DCH2RDHRH = DAC_RDHRH_RESET_VALUE;
 106  0048 725f53a2      	clr	21410
 107                     ; 176   DAC->DCH2RDHRL = DAC_RDHRL_RESET_VALUE;
 109  004c 725f53a3      	clr	21411
 110                     ; 179   DAC->DCH1LDHRH = DAC_LDHRH_RESET_VALUE;
 112  0050 725f53a4      	clr	21412
 113                     ; 180   DAC->DCH1LDHRL = DAC_LDHRL_RESET_VALUE;
 115  0054 725f53a5      	clr	21413
 116                     ; 181   DAC->DCH2LDHRH = DAC_LDHRH_RESET_VALUE;
 118  0058 725f53a6      	clr	21414
 119                     ; 182   DAC->DCH2LDHRL = DAC_LDHRL_RESET_VALUE;
 121  005c 725f53a7      	clr	21415
 122                     ; 185   DAC->DCH1DHR8 = DAC_DHR8_RESET_VALUE;
 124  0060 725f53a8      	clr	21416
 125                     ; 186   DAC->DCH2DHR8 = DAC_DHR8_RESET_VALUE;
 127  0064 725f53a9      	clr	21417
 128                     ; 187 }
 131  0068 81            	ret
 290                     ; 208 void DAC_Init(DAC_Channel_TypeDef DAC_Channel,
 290                     ; 209               DAC_Trigger_TypeDef DAC_Trigger,
 290                     ; 210               DAC_OutputBuffer_TypeDef DAC_OutputBuffer)
 290                     ; 211 {
 291                     .text:	section	.text,new
 292  0000               _DAC_Init:
 294  0000 89            	pushw	x
 295  0001 5203          	subw	sp,#3
 296       00000003      OFST:	set	3
 299                     ; 212   uint8_t tmpreg = 0;
 301                     ; 213   uint16_t tmpreg2 = 0;
 303                     ; 216   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 305                     ; 217   assert_param(IS_DAC_TRIGGER(DAC_Trigger));
 307                     ; 218   assert_param(IS_DAC_OUTPUT_BUFFER_STATE(DAC_OutputBuffer));
 309                     ; 221   tmpreg2 =  (uint16_t)((uint8_t)((uint8_t)DAC_Channel << 1));
 311  0003 9e            	ld	a,xh
 312  0004 48            	sll	a
 313  0005 5f            	clrw	x
 314  0006 97            	ld	xl,a
 315  0007 1f01          	ldw	(OFST-2,sp),x
 317                     ; 222   tmpreg = *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2));
 319  0009 1e01          	ldw	x,(OFST-2,sp)
 320  000b d65380        	ld	a,(21376,x)
 321  000e 6b03          	ld	(OFST+0,sp),a
 323                     ; 225   tmpreg &= (uint8_t)~(DAC_CR1_BOFF | DAC_CR1_TEN | DAC_CR1_TSEL );
 325  0010 7b03          	ld	a,(OFST+0,sp)
 326  0012 a4c1          	and	a,#193
 327  0014 6b03          	ld	(OFST+0,sp),a
 329                     ; 228   tmpreg |= (uint8_t)(DAC_OutputBuffer);
 331  0016 7b03          	ld	a,(OFST+0,sp)
 332  0018 1a08          	or	a,(OFST+5,sp)
 333  001a 6b03          	ld	(OFST+0,sp),a
 335                     ; 232   if (DAC_Trigger != DAC_Trigger_None)
 337  001c 7b05          	ld	a,(OFST+2,sp)
 338  001e a130          	cp	a,#48
 339  0020 2708          	jreq	L511
 340                     ; 235     tmpreg |= (uint8_t)(DAC_CR1_TEN | DAC_Trigger) ;
 342  0022 7b05          	ld	a,(OFST+2,sp)
 343  0024 aa04          	or	a,#4
 344  0026 1a03          	or	a,(OFST+0,sp)
 345  0028 6b03          	ld	(OFST+0,sp),a
 347  002a               L511:
 348                     ; 239   *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2)) = (uint8_t)tmpreg;
 350  002a 7b03          	ld	a,(OFST+0,sp)
 351  002c 1e01          	ldw	x,(OFST-2,sp)
 352  002e d75380        	ld	(21376,x),a
 353                     ; 240 }
 356  0031 5b05          	addw	sp,#5
 357  0033 81            	ret
 431                     ; 254 void DAC_Cmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 431                     ; 255 {
 432                     .text:	section	.text,new
 433  0000               _DAC_Cmd:
 435  0000 89            	pushw	x
 436  0001 89            	pushw	x
 437       00000002      OFST:	set	2
 440                     ; 256   uint16_t cr1addr = 0;
 442                     ; 258   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 444                     ; 259   assert_param(IS_FUNCTIONAL_STATE(NewState));
 446                     ; 262   cr1addr = DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
 448  0002 9e            	ld	a,xh
 449  0003 48            	sll	a
 450  0004 5f            	clrw	x
 451  0005 97            	ld	xl,a
 452  0006 1c5380        	addw	x,#21376
 453  0009 1f01          	ldw	(OFST-1,sp),x
 455                     ; 264   if (NewState != DISABLE)
 457  000b 0d04          	tnz	(OFST+2,sp)
 458  000d 2708          	jreq	L551
 459                     ; 267     (*(uint8_t*)(cr1addr)) |= DAC_CR1_EN;
 461  000f 1e01          	ldw	x,(OFST-1,sp)
 462  0011 f6            	ld	a,(x)
 463  0012 aa01          	or	a,#1
 464  0014 f7            	ld	(x),a
 466  0015 2006          	jra	L751
 467  0017               L551:
 468                     ; 272     (*(uint8_t*)(cr1addr)) &= (uint8_t) ~(DAC_CR1_EN);
 470  0017 1e01          	ldw	x,(OFST-1,sp)
 471  0019 f6            	ld	a,(x)
 472  001a a4fe          	and	a,#254
 473  001c f7            	ld	(x),a
 474  001d               L751:
 475                     ; 274 }
 478  001d 5b04          	addw	sp,#4
 479  001f 81            	ret
 525                     ; 286 void DAC_SoftwareTriggerCmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 525                     ; 287 {
 526                     .text:	section	.text,new
 527  0000               _DAC_SoftwareTriggerCmd:
 529  0000 89            	pushw	x
 530       00000000      OFST:	set	0
 533                     ; 289   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 535                     ; 290   assert_param(IS_FUNCTIONAL_STATE(NewState));
 537                     ; 292   if (NewState != DISABLE)
 539  0001 9f            	ld	a,xl
 540  0002 4d            	tnz	a
 541  0003 2714          	jreq	L302
 542                     ; 295     DAC->SWTRIGR |= (uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel);
 544  0005 9e            	ld	a,xh
 545  0006 5f            	clrw	x
 546  0007 97            	ld	xl,a
 547  0008 a601          	ld	a,#1
 548  000a 5d            	tnzw	x
 549  000b 2704          	jreq	L41
 550  000d               L61:
 551  000d 48            	sll	a
 552  000e 5a            	decw	x
 553  000f 26fc          	jrne	L61
 554  0011               L41:
 555  0011 ca5384        	or	a,21380
 556  0014 c75384        	ld	21380,a
 558  0017 2014          	jra	L502
 559  0019               L302:
 560                     ; 300     DAC->SWTRIGR &= (uint8_t)~((uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel));
 562  0019 7b01          	ld	a,(OFST+1,sp)
 563  001b 5f            	clrw	x
 564  001c 97            	ld	xl,a
 565  001d a601          	ld	a,#1
 566  001f 5d            	tnzw	x
 567  0020 2704          	jreq	L02
 568  0022               L22:
 569  0022 48            	sll	a
 570  0023 5a            	decw	x
 571  0024 26fc          	jrne	L22
 572  0026               L02:
 573  0026 43            	cpl	a
 574  0027 c45384        	and	a,21380
 575  002a c75384        	ld	21380,a
 576  002d               L502:
 577                     ; 302 }
 580  002d 85            	popw	x
 581  002e 81            	ret
 617                     ; 311 void DAC_DualSoftwareTriggerCmd(FunctionalState NewState)
 617                     ; 312 {
 618                     .text:	section	.text,new
 619  0000               _DAC_DualSoftwareTriggerCmd:
 623                     ; 314   assert_param(IS_FUNCTIONAL_STATE(NewState));
 625                     ; 316   if (NewState != DISABLE)
 627  0000 4d            	tnz	a
 628  0001 270a          	jreq	L522
 629                     ; 319     DAC->SWTRIGR |= (DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2) ;
 631  0003 c65384        	ld	a,21380
 632  0006 aa03          	or	a,#3
 633  0008 c75384        	ld	21380,a
 635  000b 2008          	jra	L722
 636  000d               L522:
 637                     ; 324     DAC->SWTRIGR &= (uint8_t)~(DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2);
 639  000d c65384        	ld	a,21380
 640  0010 a4fc          	and	a,#252
 641  0012 c75384        	ld	21380,a
 642  0015               L722:
 643                     ; 326 }
 646  0015 81            	ret
 731                     ; 342 void DAC_WaveGenerationCmd(DAC_Channel_TypeDef DAC_Channel,
 731                     ; 343                            DAC_Wave_TypeDef DAC_Wave,
 731                     ; 344                            FunctionalState NewState)
 731                     ; 345 {
 732                     .text:	section	.text,new
 733  0000               _DAC_WaveGenerationCmd:
 735  0000 89            	pushw	x
 736  0001 88            	push	a
 737       00000001      OFST:	set	1
 740                     ; 346   uint8_t tmpreg = 0;
 742                     ; 349   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 744                     ; 350   assert_param(IS_DAC_WAVE(DAC_Wave));
 746                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
 748                     ; 354   tmpreg = (uint8_t)((*(uint8_t*)(uint16_t)(DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1))) & (uint8_t)~(DAC_CR1_WAVEN));
 750  0002 9e            	ld	a,xh
 751  0003 48            	sll	a
 752  0004 5f            	clrw	x
 753  0005 97            	ld	xl,a
 754  0006 d65380        	ld	a,(21376,x)
 755  0009 a43f          	and	a,#63
 756  000b 6b01          	ld	(OFST+0,sp),a
 758                     ; 356   if (NewState != DISABLE)
 760  000d 0d06          	tnz	(OFST+5,sp)
 761  000f 2706          	jreq	L372
 762                     ; 358     tmpreg |= (uint8_t)(DAC_Wave);
 764  0011 7b01          	ld	a,(OFST+0,sp)
 765  0013 1a03          	or	a,(OFST+2,sp)
 766  0015 6b01          	ld	(OFST+0,sp),a
 768  0017               L372:
 769                     ; 362   (*(uint8_t*) (uint16_t)(DAC_BASE + CR1_Offset +  (uint8_t)((uint8_t)DAC_Channel << 1))) = tmpreg;
 771  0017 7b02          	ld	a,(OFST+1,sp)
 772  0019 48            	sll	a
 773  001a 5f            	clrw	x
 774  001b 97            	ld	xl,a
 775  001c 7b01          	ld	a,(OFST+0,sp)
 776  001e d75380        	ld	(21376,x),a
 777                     ; 364 }
 780  0021 5b03          	addw	sp,#3
 781  0023 81            	ret
 947                     ; 388 void DAC_SetNoiseWaveLFSR(DAC_Channel_TypeDef DAC_Channel, DAC_LFSRUnmask_TypeDef DAC_LFSRUnmask)
 947                     ; 389 {
 948                     .text:	section	.text,new
 949  0000               _DAC_SetNoiseWaveLFSR:
 951  0000 89            	pushw	x
 952  0001 5203          	subw	sp,#3
 953       00000003      OFST:	set	3
 956                     ; 390   uint8_t tmpreg = 0;
 958                     ; 391   uint16_t cr2addr = 0;
 960                     ; 394   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 962                     ; 395   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_LFSRUnmask));
 964                     ; 398   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
 966  0003 9e            	ld	a,xh
 967  0004 48            	sll	a
 968  0005 5f            	clrw	x
 969  0006 97            	ld	xl,a
 970  0007 1c5381        	addw	x,#21377
 971  000a 1f02          	ldw	(OFST-1,sp),x
 973                     ; 399   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
 975  000c 1e02          	ldw	x,(OFST-1,sp)
 976  000e f6            	ld	a,(x)
 977  000f a4f0          	and	a,#240
 978  0011 6b01          	ld	(OFST-2,sp),a
 980                     ; 402   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_LFSRUnmask);
 982  0013 7b01          	ld	a,(OFST-2,sp)
 983  0015 1a05          	or	a,(OFST+2,sp)
 984  0017 1e02          	ldw	x,(OFST-1,sp)
 985  0019 f7            	ld	(x),a
 986                     ; 403 }
 989  001a 5b05          	addw	sp,#5
 990  001c 81            	ret
1157                     ; 427 void DAC_SetTriangleWaveAmplitude(DAC_Channel_TypeDef DAC_Channel, DAC_TriangleAmplitude_TypeDef DAC_TriangleAmplitude)
1157                     ; 428 {
1158                     .text:	section	.text,new
1159  0000               _DAC_SetTriangleWaveAmplitude:
1161  0000 89            	pushw	x
1162  0001 5203          	subw	sp,#3
1163       00000003      OFST:	set	3
1166                     ; 429   uint8_t tmpreg = 0;
1168                     ; 430   uint16_t cr2addr = 0;
1170                     ; 433   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1172                     ; 434   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_TriangleAmplitude));
1174                     ; 438   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
1176  0003 9e            	ld	a,xh
1177  0004 48            	sll	a
1178  0005 5f            	clrw	x
1179  0006 97            	ld	xl,a
1180  0007 1c5381        	addw	x,#21377
1181  000a 1f02          	ldw	(OFST-1,sp),x
1183                     ; 439   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
1185  000c 1e02          	ldw	x,(OFST-1,sp)
1186  000e f6            	ld	a,(x)
1187  000f a4f0          	and	a,#240
1188  0011 6b01          	ld	(OFST-2,sp),a
1190                     ; 442   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_TriangleAmplitude);
1192  0013 7b01          	ld	a,(OFST-2,sp)
1193  0015 1a05          	or	a,(OFST+2,sp)
1194  0017 1e02          	ldw	x,(OFST-1,sp)
1195  0019 f7            	ld	(x),a
1196                     ; 443 }
1199  001a 5b05          	addw	sp,#5
1200  001c 81            	ret
1272                     ; 455 void DAC_SetChannel1Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1272                     ; 456 {
1273                     .text:	section	.text,new
1274  0000               _DAC_SetChannel1Data:
1276  0000 88            	push	a
1277       00000000      OFST:	set	0
1280                     ; 458   assert_param(IS_DAC_ALIGN(DAC_Align));
1282                     ; 460   if (DAC_Align != DAC_Align_8b_R)
1284  0001 a108          	cp	a,#8
1285  0003 2712          	jreq	L505
1286                     ; 463     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1288  0005 5f            	clrw	x
1289  0006 97            	ld	xl,a
1290  0007 7b04          	ld	a,(OFST+4,sp)
1291  0009 d75388        	ld	(21384,x),a
1292                     ; 464     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1294  000c 7b01          	ld	a,(OFST+1,sp)
1295  000e 5f            	clrw	x
1296  000f 97            	ld	xl,a
1297  0010 7b05          	ld	a,(OFST+5,sp)
1298  0012 d75389        	ld	(21385,x),a
1300  0015 2005          	jra	L705
1301  0017               L505:
1302                     ; 469     assert_param(IS_DAC_DATA_08R(DAC_Data));
1304                     ; 472     DAC->CH1DHR8 = (uint8_t)(DAC_Data);
1306  0017 7b05          	ld	a,(OFST+5,sp)
1307  0019 c75390        	ld	21392,a
1308  001c               L705:
1309                     ; 474 }
1312  001c 84            	pop	a
1313  001d 81            	ret
1358                     ; 486 void DAC_SetChannel2Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1358                     ; 487 {
1359                     .text:	section	.text,new
1360  0000               _DAC_SetChannel2Data:
1362  0000 88            	push	a
1363       00000000      OFST:	set	0
1366                     ; 489   assert_param(IS_DAC_ALIGN(DAC_Align));
1368                     ; 491   if (DAC_Align != DAC_Align_8b_R)
1370  0001 a108          	cp	a,#8
1371  0003 2712          	jreq	L335
1372                     ; 494     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1374  0005 5f            	clrw	x
1375  0006 97            	ld	xl,a
1376  0007 7b04          	ld	a,(OFST+4,sp)
1377  0009 d75394        	ld	(21396,x),a
1378                     ; 495     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1380  000c 7b01          	ld	a,(OFST+1,sp)
1381  000e 5f            	clrw	x
1382  000f 97            	ld	xl,a
1383  0010 7b05          	ld	a,(OFST+5,sp)
1384  0012 d75395        	ld	(21397,x),a
1386  0015 2005          	jra	L535
1387  0017               L335:
1388                     ; 500     assert_param(IS_DAC_DATA_08R(DAC_Data));
1390                     ; 503     DAC->CH2DHR8 = (uint8_t)(DAC_Data);
1392  0017 7b05          	ld	a,(OFST+5,sp)
1393  0019 c7539c        	ld	21404,a
1394  001c               L535:
1395                     ; 505 }
1398  001c 84            	pop	a
1399  001d 81            	ret
1462                     ; 522 void DAC_SetDualChannelData(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data2, uint16_t DAC_Data1)
1462                     ; 523 {
1463                     .text:	section	.text,new
1464  0000               _DAC_SetDualChannelData:
1466  0000 88            	push	a
1467  0001 89            	pushw	x
1468       00000002      OFST:	set	2
1471                     ; 524   uint16_t dchxrdhrhaddr = 0;
1473                     ; 527   assert_param(IS_DAC_ALIGN(DAC_Align));
1475                     ; 529   if (DAC_Align != DAC_Align_8b_R)
1477  0002 a108          	cp	a,#8
1478  0004 2720          	jreq	L175
1479                     ; 532     dchxrdhrhaddr = (uint16_t)(DAC_BASE + DCH1RDHRH_Offset + DAC_Align);
1481  0006 5f            	clrw	x
1482  0007 97            	ld	xl,a
1483  0008 1c53a0        	addw	x,#21408
1484  000b 1f01          	ldw	(OFST-1,sp),x
1486                     ; 535     *(uint8_t*)(uint16_t)dchxrdhrhaddr = (uint8_t)(((uint16_t)DAC_Data1) >> 8);
1488  000d 7b08          	ld	a,(OFST+6,sp)
1489  000f 1e01          	ldw	x,(OFST-1,sp)
1490  0011 f7            	ld	(x),a
1491                     ; 536     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 1) = (uint8_t)DAC_Data1;
1493  0012 7b09          	ld	a,(OFST+7,sp)
1494  0014 1e01          	ldw	x,(OFST-1,sp)
1495  0016 e701          	ld	(1,x),a
1496                     ; 537     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 2) = (uint8_t)(((uint16_t)DAC_Data2) >> 8);
1498  0018 7b06          	ld	a,(OFST+4,sp)
1499  001a 1e01          	ldw	x,(OFST-1,sp)
1500  001c e702          	ld	(2,x),a
1501                     ; 538     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 3) = (uint8_t)DAC_Data2;
1503  001e 7b07          	ld	a,(OFST+5,sp)
1504  0020 1e01          	ldw	x,(OFST-1,sp)
1505  0022 e703          	ld	(3,x),a
1507  0024 200a          	jra	L375
1508  0026               L175:
1509                     ; 543     assert_param(IS_DAC_DATA_08R(DAC_Data1 | DAC_Data2));
1511                     ; 546     DAC->DCH1DHR8 = (uint8_t)(DAC_Data1);
1513  0026 7b09          	ld	a,(OFST+7,sp)
1514  0028 c753a8        	ld	21416,a
1515                     ; 547     DAC->DCH2DHR8 = (uint8_t)(DAC_Data2);
1517  002b 7b07          	ld	a,(OFST+5,sp)
1518  002d c753a9        	ld	21417,a
1519  0030               L375:
1520                     ; 549 }
1523  0030 5b03          	addw	sp,#3
1524  0032 81            	ret
1578                     ; 559 uint16_t DAC_GetDataOutputValue(DAC_Channel_TypeDef DAC_Channel)
1578                     ; 560 {
1579                     .text:	section	.text,new
1580  0000               _DAC_GetDataOutputValue:
1582  0000 89            	pushw	x
1583       00000002      OFST:	set	2
1586                     ; 561   uint16_t outputdata = 0;
1588                     ; 562   uint16_t tmp = 0;
1590                     ; 565   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1592                     ; 567   if ( DAC_Channel ==  DAC_Channel_1)
1594  0001 4d            	tnz	a
1595  0002 2619          	jrne	L326
1596                     ; 570     tmp = (uint16_t)((uint16_t)DAC->CH1DORH << 8);
1598  0004 c653ac        	ld	a,21420
1599  0007 5f            	clrw	x
1600  0008 97            	ld	xl,a
1601  0009 4f            	clr	a
1602  000a 02            	rlwa	x,a
1603  000b 1f01          	ldw	(OFST-1,sp),x
1605                     ; 571     outputdata = (uint16_t)(tmp | (DAC->CH1DORL));
1607  000d c653ad        	ld	a,21421
1608  0010 5f            	clrw	x
1609  0011 97            	ld	xl,a
1610  0012 01            	rrwa	x,a
1611  0013 1a02          	or	a,(OFST+0,sp)
1612  0015 01            	rrwa	x,a
1613  0016 1a01          	or	a,(OFST-1,sp)
1614  0018 01            	rrwa	x,a
1615  0019 1f01          	ldw	(OFST-1,sp),x
1618  001b 2017          	jra	L526
1619  001d               L326:
1620                     ; 576     tmp = (uint16_t)((uint16_t)DAC->CH2DORH << 8);
1622  001d c653b0        	ld	a,21424
1623  0020 5f            	clrw	x
1624  0021 97            	ld	xl,a
1625  0022 4f            	clr	a
1626  0023 02            	rlwa	x,a
1627  0024 1f01          	ldw	(OFST-1,sp),x
1629                     ; 577     outputdata = (uint16_t)(tmp | (DAC->CH2DORL));
1631  0026 c653b1        	ld	a,21425
1632  0029 5f            	clrw	x
1633  002a 97            	ld	xl,a
1634  002b 01            	rrwa	x,a
1635  002c 1a02          	or	a,(OFST+0,sp)
1636  002e 01            	rrwa	x,a
1637  002f 1a01          	or	a,(OFST-1,sp)
1638  0031 01            	rrwa	x,a
1639  0032 1f01          	ldw	(OFST-1,sp),x
1641  0034               L526:
1642                     ; 581   return (uint16_t)outputdata;
1644  0034 1e01          	ldw	x,(OFST-1,sp)
1647  0036 5b02          	addw	sp,#2
1648  0038 81            	ret
1702                     ; 613 void DAC_DMACmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
1702                     ; 614 {
1703                     .text:	section	.text,new
1704  0000               _DAC_DMACmd:
1706  0000 89            	pushw	x
1707  0001 89            	pushw	x
1708       00000002      OFST:	set	2
1711                     ; 615   uint16_t cr2addr = 0;
1713                     ; 618   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1715                     ; 619   assert_param(IS_FUNCTIONAL_STATE(NewState));
1717                     ; 622   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1719  0002 9e            	ld	a,xh
1720  0003 48            	sll	a
1721  0004 5f            	clrw	x
1722  0005 97            	ld	xl,a
1723  0006 1c5381        	addw	x,#21377
1724  0009 1f01          	ldw	(OFST-1,sp),x
1726                     ; 624   if (NewState != DISABLE)
1728  000b 0d04          	tnz	(OFST+2,sp)
1729  000d 2708          	jreq	L556
1730                     ; 627     (*(uint8_t*)(cr2addr)) |= DAC_CR2_DMAEN;
1732  000f 1e01          	ldw	x,(OFST-1,sp)
1733  0011 f6            	ld	a,(x)
1734  0012 aa10          	or	a,#16
1735  0014 f7            	ld	(x),a
1737  0015 2006          	jra	L756
1738  0017               L556:
1739                     ; 632     (*(uint8_t*)(cr2addr)) &= (uint8_t)~(DAC_CR2_DMAEN);
1741  0017 1e01          	ldw	x,(OFST-1,sp)
1742  0019 f6            	ld	a,(x)
1743  001a a4ef          	and	a,#239
1744  001c f7            	ld	(x),a
1745  001d               L756:
1746                     ; 634 }
1749  001d 5b04          	addw	sp,#4
1750  001f 81            	ret
1827                     ; 667 void DAC_ITConfig(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT, FunctionalState NewState)
1827                     ; 668 {
1828                     .text:	section	.text,new
1829  0000               _DAC_ITConfig:
1831  0000 89            	pushw	x
1832  0001 89            	pushw	x
1833       00000002      OFST:	set	2
1836                     ; 669   uint16_t cr2addr = 0;
1838                     ; 672   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1840                     ; 673   assert_param(IS_FUNCTIONAL_STATE(NewState));
1842                     ; 674   assert_param(IS_DAC_IT(DAC_IT));
1844                     ; 677   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1846  0002 9e            	ld	a,xh
1847  0003 48            	sll	a
1848  0004 5f            	clrw	x
1849  0005 97            	ld	xl,a
1850  0006 1c5381        	addw	x,#21377
1851  0009 1f01          	ldw	(OFST-1,sp),x
1853                     ; 679   if (NewState != DISABLE)
1855  000b 0d07          	tnz	(OFST+5,sp)
1856  000d 2708          	jreq	L127
1857                     ; 682     (*(uint8_t*)(cr2addr)) |=  (uint8_t)(DAC_IT);
1859  000f 1e01          	ldw	x,(OFST-1,sp)
1860  0011 f6            	ld	a,(x)
1861  0012 1a04          	or	a,(OFST+2,sp)
1862  0014 f7            	ld	(x),a
1864  0015 2007          	jra	L327
1865  0017               L127:
1866                     ; 687     (*(uint8_t*)(cr2addr)) &= (uint8_t)(~(DAC_IT));
1868  0017 1e01          	ldw	x,(OFST-1,sp)
1869  0019 7b04          	ld	a,(OFST+2,sp)
1870  001b 43            	cpl	a
1871  001c f4            	and	a,(x)
1872  001d f7            	ld	(x),a
1873  001e               L327:
1874                     ; 689 }
1877  001e 5b04          	addw	sp,#4
1878  0020 81            	ret
1976                     ; 704 FlagStatus DAC_GetFlagStatus(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
1976                     ; 705 {
1977                     .text:	section	.text,new
1978  0000               _DAC_GetFlagStatus:
1980  0000 89            	pushw	x
1981  0001 88            	push	a
1982       00000001      OFST:	set	1
1985                     ; 706   FlagStatus flagstatus = RESET;
1987                     ; 707   uint8_t flag = 0;
1989                     ; 710   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1991                     ; 711   assert_param(IS_DAC_FLAG(DAC_FLAG));
1993                     ; 713   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
1995  0002 9e            	ld	a,xh
1996  0003 5f            	clrw	x
1997  0004 97            	ld	xl,a
1998  0005 7b03          	ld	a,(OFST+2,sp)
1999  0007 5d            	tnzw	x
2000  0008 2704          	jreq	L25
2001  000a               L45:
2002  000a 48            	sll	a
2003  000b 5a            	decw	x
2004  000c 26fc          	jrne	L45
2005  000e               L25:
2006  000e 6b01          	ld	(OFST+0,sp),a
2008                     ; 716   if ((DAC->SR & flag ) != (uint8_t)RESET)
2010  0010 c65385        	ld	a,21381
2011  0013 1501          	bcp	a,(OFST+0,sp)
2012  0015 2706          	jreq	L577
2013                     ; 719     flagstatus = SET;
2015  0017 a601          	ld	a,#1
2016  0019 6b01          	ld	(OFST+0,sp),a
2019  001b 2002          	jra	L777
2020  001d               L577:
2021                     ; 724     flagstatus = RESET;
2023  001d 0f01          	clr	(OFST+0,sp)
2025  001f               L777:
2026                     ; 728   return  flagstatus;
2028  001f 7b01          	ld	a,(OFST+0,sp)
2031  0021 5b03          	addw	sp,#3
2032  0023 81            	ret
2086                     ; 742 void DAC_ClearFlag(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
2086                     ; 743 {
2087                     .text:	section	.text,new
2088  0000               _DAC_ClearFlag:
2090  0000 89            	pushw	x
2091  0001 88            	push	a
2092       00000001      OFST:	set	1
2095                     ; 744   uint8_t flag = 0;
2097                     ; 747   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2099                     ; 748   assert_param(IS_DAC_FLAG(DAC_FLAG));
2101                     ; 751   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
2103  0002 9e            	ld	a,xh
2104  0003 5f            	clrw	x
2105  0004 97            	ld	xl,a
2106  0005 7b03          	ld	a,(OFST+2,sp)
2107  0007 5d            	tnzw	x
2108  0008 2704          	jreq	L06
2109  000a               L26:
2110  000a 48            	sll	a
2111  000b 5a            	decw	x
2112  000c 26fc          	jrne	L26
2113  000e               L06:
2114  000e 6b01          	ld	(OFST+0,sp),a
2116                     ; 754   DAC->SR = (uint8_t)(~flag);
2118  0010 7b01          	ld	a,(OFST+0,sp)
2119  0012 43            	cpl	a
2120  0013 c75385        	ld	21381,a
2121                     ; 755 }
2124  0016 5b03          	addw	sp,#3
2125  0018 81            	ret
2208                     ; 770 ITStatus DAC_GetITStatus(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2208                     ; 771 {
2209                     .text:	section	.text,new
2210  0000               _DAC_GetITStatus:
2212  0000 89            	pushw	x
2213  0001 89            	pushw	x
2214       00000002      OFST:	set	2
2217                     ; 772   ITStatus itstatus = RESET;
2219                     ; 773   uint8_t enablestatus = 0;
2221                     ; 774   uint8_t flagstatus = 0;
2223                     ; 775   uint8_t tempreg = 0;
2225                     ; 778   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2227                     ; 779   assert_param(IS_DAC_IT(DAC_IT));
2229                     ; 782   tempreg = *(uint8_t*)(uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 2));
2231  0002 9e            	ld	a,xh
2232  0003 48            	sll	a
2233  0004 48            	sll	a
2234  0005 5f            	clrw	x
2235  0006 97            	ld	xl,a
2236  0007 d65381        	ld	a,(21377,x)
2237  000a 6b02          	ld	(OFST+0,sp),a
2239                     ; 783   enablestatus = (uint8_t)( tempreg & (uint8_t)((uint8_t)DAC_IT << DAC_Channel));
2241  000c 7b03          	ld	a,(OFST+1,sp)
2242  000e 5f            	clrw	x
2243  000f 97            	ld	xl,a
2244  0010 7b04          	ld	a,(OFST+2,sp)
2245  0012 5d            	tnzw	x
2246  0013 2704          	jreq	L66
2247  0015               L07:
2248  0015 48            	sll	a
2249  0016 5a            	decw	x
2250  0017 26fc          	jrne	L07
2251  0019               L66:
2252  0019 1402          	and	a,(OFST+0,sp)
2253  001b 6b01          	ld	(OFST-1,sp),a
2255                     ; 784   flagstatus = (uint8_t)(DAC->SR & (uint8_t)(DAC_IT >> ((uint8_t)0x05 - DAC_Channel)));
2257  001d a605          	ld	a,#5
2258  001f 1003          	sub	a,(OFST+1,sp)
2259  0021 5f            	clrw	x
2260  0022 97            	ld	xl,a
2261  0023 7b04          	ld	a,(OFST+2,sp)
2262  0025 5d            	tnzw	x
2263  0026 2704          	jreq	L27
2264  0028               L47:
2265  0028 44            	srl	a
2266  0029 5a            	decw	x
2267  002a 26fc          	jrne	L47
2268  002c               L27:
2269  002c c45385        	and	a,21381
2270  002f 6b02          	ld	(OFST+0,sp),a
2272                     ; 787   if (((flagstatus) != (uint8_t)RESET) && enablestatus)
2274  0031 0d02          	tnz	(OFST+0,sp)
2275  0033 270a          	jreq	L1701
2277  0035 0d01          	tnz	(OFST-1,sp)
2278  0037 2706          	jreq	L1701
2279                     ; 790     itstatus = SET;
2281  0039 a601          	ld	a,#1
2282  003b 6b02          	ld	(OFST+0,sp),a
2285  003d 2002          	jra	L3701
2286  003f               L1701:
2287                     ; 795     itstatus = RESET;
2289  003f 0f02          	clr	(OFST+0,sp)
2291  0041               L3701:
2292                     ; 799   return  itstatus;
2294  0041 7b02          	ld	a,(OFST+0,sp)
2297  0043 5b04          	addw	sp,#4
2298  0045 81            	ret
2344                     ; 813 void DAC_ClearITPendingBit(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2344                     ; 814 {
2345                     .text:	section	.text,new
2346  0000               _DAC_ClearITPendingBit:
2348  0000 89            	pushw	x
2349       00000000      OFST:	set	0
2352                     ; 816   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2354                     ; 817   assert_param(IS_DAC_IT(DAC_IT));
2356                     ; 820   DAC->SR = (uint8_t)~(uint8_t)((uint8_t)DAC_IT >> (0x05 - DAC_Channel));
2358  0001 9e            	ld	a,xh
2359  0002 a005          	sub	a,#5
2360  0004 40            	neg	a
2361  0005 5f            	clrw	x
2362  0006 97            	ld	xl,a
2363  0007 7b02          	ld	a,(OFST+2,sp)
2364  0009 5d            	tnzw	x
2365  000a 2704          	jreq	L001
2366  000c               L201:
2367  000c 44            	srl	a
2368  000d 5a            	decw	x
2369  000e 26fc          	jrne	L201
2370  0010               L001:
2371  0010 43            	cpl	a
2372  0011 c75385        	ld	21381,a
2373                     ; 821 }
2376  0014 85            	popw	x
2377  0015 81            	ret
2390                     	xdef	_DAC_ClearITPendingBit
2391                     	xdef	_DAC_GetITStatus
2392                     	xdef	_DAC_ClearFlag
2393                     	xdef	_DAC_GetFlagStatus
2394                     	xdef	_DAC_ITConfig
2395                     	xdef	_DAC_DMACmd
2396                     	xdef	_DAC_GetDataOutputValue
2397                     	xdef	_DAC_SetDualChannelData
2398                     	xdef	_DAC_SetChannel2Data
2399                     	xdef	_DAC_SetChannel1Data
2400                     	xdef	_DAC_SetTriangleWaveAmplitude
2401                     	xdef	_DAC_SetNoiseWaveLFSR
2402                     	xdef	_DAC_WaveGenerationCmd
2403                     	xdef	_DAC_DualSoftwareTriggerCmd
2404                     	xdef	_DAC_SoftwareTriggerCmd
2405                     	xdef	_DAC_Cmd
2406                     	xdef	_DAC_Init
2407                     	xdef	_DAC_DeInit
2426                     	end
