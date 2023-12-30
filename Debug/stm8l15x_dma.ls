   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  43                     ; 140 void DMA_GlobalDeInit(void)
  43                     ; 141 {
  45                     .text:	section	.text,new
  46  0000               _DMA_GlobalDeInit:
  50                     ; 143   DMA1->GCSR &= (uint8_t)~(DMA_GCSR_GE);
  52  0000 72115070      	bres	20592,#0
  53                     ; 146   DMA1->GCSR  = (uint8_t)DMA_GCSR_RESET_VALUE;
  55  0004 35fc5070      	mov	20592,#252
  56                     ; 147 }
  59  0008 81            	ret
 175                     ; 155 void DMA_DeInit(DMA_Channel_TypeDef* DMA_Channelx)
 175                     ; 156 {
 176                     .text:	section	.text,new
 177  0000               _DMA_DeInit:
 179  0000 89            	pushw	x
 180       00000000      OFST:	set	0
 183                     ; 158   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 185                     ; 161   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 187  0001 f6            	ld	a,(x)
 188  0002 a4fe          	and	a,#254
 189  0004 f7            	ld	(x),a
 190                     ; 164   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 192  0005 7f            	clr	(x)
 193                     ; 167   DMA_Channelx->CNBTR = DMA_CNBTR_RESET_VALUE;
 195  0006 6f02          	clr	(2,x)
 196                     ; 170   if (DMA_Channelx == DMA1_Channel3)
 198  0008 a35093        	cpw	x,#20627
 199  000b 2608          	jrne	L501
 200                     ; 172     DMA_Channelx->CPARH  = DMA_C3PARH_RESET_VALUE;
 202  000d a640          	ld	a,#64
 203  000f e703          	ld	(3,x),a
 204                     ; 173     DMA_Channelx->CM0EAR = DMA_C3M0EAR_RESET_VALUE;
 206  0011 6f05          	clr	(5,x)
 208  0013 2006          	jra	L701
 209  0015               L501:
 210                     ; 177     DMA_Channelx->CPARH  = DMA_CPARH_RESET_VALUE;
 212  0015 1e01          	ldw	x,(OFST+1,sp)
 213  0017 a652          	ld	a,#82
 214  0019 e703          	ld	(3,x),a
 215  001b               L701:
 216                     ; 179   DMA_Channelx->CPARL  = DMA_CPARL_RESET_VALUE;
 218  001b 1e01          	ldw	x,(OFST+1,sp)
 219  001d 6f04          	clr	(4,x)
 220                     ; 182   DMA_Channelx->CM0ARH = DMA_CM0ARH_RESET_VALUE;
 222  001f 1e01          	ldw	x,(OFST+1,sp)
 223  0021 6f06          	clr	(6,x)
 224                     ; 183   DMA_Channelx->CM0ARL = DMA_CM0ARL_RESET_VALUE;
 226  0023 1e01          	ldw	x,(OFST+1,sp)
 227  0025 6f07          	clr	(7,x)
 228                     ; 186   DMA_Channelx->CSPR = DMA_CSPR_RESET_VALUE;
 230  0027 1e01          	ldw	x,(OFST+1,sp)
 231  0029 6f01          	clr	(1,x)
 232                     ; 187 }
 235  002b 85            	popw	x
 236  002c 81            	ret
 482                     ; 224 void DMA_Init(DMA_Channel_TypeDef* DMA_Channelx,
 482                     ; 225               uint32_t DMA_Memory0BaseAddr,
 482                     ; 226               uint16_t DMA_PeripheralMemory1BaseAddr,
 482                     ; 227               uint8_t DMA_BufferSize,
 482                     ; 228               DMA_DIR_TypeDef DMA_DIR,
 482                     ; 229               DMA_Mode_TypeDef DMA_Mode,
 482                     ; 230               DMA_MemoryIncMode_TypeDef DMA_MemoryIncMode,
 482                     ; 231               DMA_Priority_TypeDef DMA_Priority,
 482                     ; 232               DMA_MemoryDataSize_TypeDef DMA_MemoryDataSize )
 482                     ; 233 {
 483                     .text:	section	.text,new
 484  0000               _DMA_Init:
 486  0000 89            	pushw	x
 487       00000000      OFST:	set	0
 490                     ; 235   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 492                     ; 236   assert_param(IS_DMA_DIR(DMA_DIR));
 494                     ; 237   assert_param(IS_DMA_BUFFER_SIZE(DMA_BufferSize));
 496                     ; 238   assert_param(IS_DMA_MODE(DMA_Mode));
 498                     ; 239   assert_param(IS_DMA_MEMORY_INC_MODE(DMA_MemoryIncMode));
 500                     ; 240   assert_param(IS_DMA_PRIORITY(DMA_Priority));
 502                     ; 244   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 504  0001 f6            	ld	a,(x)
 505  0002 a4fe          	and	a,#254
 506  0004 f7            	ld	(x),a
 507                     ; 247   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 509  0005 7f            	clr	(x)
 510                     ; 250   DMA_Channelx->CCR |= (uint8_t)((uint8_t)((uint8_t)DMA_DIR | \
 510                     ; 251                                            (uint8_t)DMA_Mode) | \
 510                     ; 252                                            (uint8_t)DMA_MemoryIncMode);
 512  0006 7b0c          	ld	a,(OFST+12,sp)
 513  0008 1a0d          	or	a,(OFST+13,sp)
 514  000a 1a0e          	or	a,(OFST+14,sp)
 515  000c fa            	or	a,(x)
 516  000d f7            	ld	(x),a
 517                     ; 255   DMA_Channelx->CSPR &= (uint8_t)(~(uint8_t)(DMA_CSPR_PL | DMA_CSPR_16BM));
 519  000e e601          	ld	a,(1,x)
 520  0010 a4c7          	and	a,#199
 521  0012 e701          	ld	(1,x),a
 522                     ; 258   DMA_Channelx->CSPR |= (uint8_t)((uint8_t)DMA_Priority | \
 522                     ; 259                                   (uint8_t)DMA_MemoryDataSize);
 524  0014 7b0f          	ld	a,(OFST+15,sp)
 525  0016 1a10          	or	a,(OFST+16,sp)
 526  0018 ea01          	or	a,(1,x)
 527  001a e701          	ld	(1,x),a
 528                     ; 263   DMA_Channelx->CNBTR = (uint8_t)DMA_BufferSize;
 530  001c 7b0b          	ld	a,(OFST+11,sp)
 531  001e 1e01          	ldw	x,(OFST+1,sp)
 532  0020 e702          	ld	(2,x),a
 533                     ; 268   DMA_Channelx->CPARH = (uint8_t)(DMA_PeripheralMemory1BaseAddr >> (uint8_t)8);
 535  0022 7b09          	ld	a,(OFST+9,sp)
 536  0024 1e01          	ldw	x,(OFST+1,sp)
 537  0026 e703          	ld	(3,x),a
 538                     ; 269   DMA_Channelx->CPARL = (uint8_t)(DMA_PeripheralMemory1BaseAddr);
 540  0028 7b0a          	ld	a,(OFST+10,sp)
 541  002a 1e01          	ldw	x,(OFST+1,sp)
 542  002c e704          	ld	(4,x),a
 543                     ; 273   if (DMA_Channelx == DMA1_Channel3)
 545  002e 1e01          	ldw	x,(OFST+1,sp)
 546  0030 a35093        	cpw	x,#20627
 547  0033 2606          	jrne	L742
 548                     ; 275     DMA_Channelx->CM0EAR = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)16);
 550  0035 7b06          	ld	a,(OFST+6,sp)
 551  0037 1e01          	ldw	x,(OFST+1,sp)
 552  0039 e705          	ld	(5,x),a
 553  003b               L742:
 554                     ; 277   DMA_Channelx->CM0ARH = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)8);
 556  003b 7b07          	ld	a,(OFST+7,sp)
 557  003d 1e01          	ldw	x,(OFST+1,sp)
 558  003f e706          	ld	(6,x),a
 559                     ; 278   DMA_Channelx->CM0ARL = (uint8_t)(DMA_Memory0BaseAddr);
 561  0041 7b08          	ld	a,(OFST+8,sp)
 562  0043 1e01          	ldw	x,(OFST+1,sp)
 563  0045 e707          	ld	(7,x),a
 564                     ; 280 }
 567  0047 85            	popw	x
 568  0048 81            	ret
 623                     ; 288 void DMA_GlobalCmd(FunctionalState NewState)
 623                     ; 289 {
 624                     .text:	section	.text,new
 625  0000               _DMA_GlobalCmd:
 629                     ; 291   assert_param(IS_FUNCTIONAL_STATE(NewState));
 631                     ; 293   if (NewState != DISABLE)
 633  0000 4d            	tnz	a
 634  0001 2706          	jreq	L772
 635                     ; 296     DMA1->GCSR |= (uint8_t)DMA_GCSR_GE;
 637  0003 72105070      	bset	20592,#0
 639  0007 2004          	jra	L103
 640  0009               L772:
 641                     ; 301     DMA1->GCSR &= (uint8_t)(~DMA_GCSR_GE);
 643  0009 72115070      	bres	20592,#0
 644  000d               L103:
 645                     ; 303 }
 648  000d 81            	ret
 695                     ; 314 void DMA_Cmd(DMA_Channel_TypeDef* DMA_Channelx, FunctionalState NewState)
 695                     ; 315 {
 696                     .text:	section	.text,new
 697  0000               _DMA_Cmd:
 699  0000 89            	pushw	x
 700       00000000      OFST:	set	0
 703                     ; 317   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 705                     ; 318   assert_param(IS_FUNCTIONAL_STATE(NewState));
 707                     ; 320   if (NewState != DISABLE)
 709  0001 0d05          	tnz	(OFST+5,sp)
 710  0003 2706          	jreq	L723
 711                     ; 323     DMA_Channelx->CCR |= DMA_CCR_CE;
 713  0005 f6            	ld	a,(x)
 714  0006 aa01          	or	a,#1
 715  0008 f7            	ld	(x),a
 717  0009 2006          	jra	L133
 718  000b               L723:
 719                     ; 328     DMA_Channelx->CCR &= (uint8_t)(~DMA_CCR_CE);
 721  000b 1e01          	ldw	x,(OFST+1,sp)
 722  000d f6            	ld	a,(x)
 723  000e a4fe          	and	a,#254
 724  0010 f7            	ld	(x),a
 725  0011               L133:
 726                     ; 330 }
 729  0011 85            	popw	x
 730  0012 81            	ret
 764                     ; 342 void DMA_SetTimeOut(uint8_t DMA_TimeOut)
 764                     ; 343 {
 765                     .text:	section	.text,new
 766  0000               _DMA_SetTimeOut:
 770                     ; 345   assert_param(IS_DMA_TIMEOUT(DMA_TimeOut));
 772                     ; 348   DMA1->GCSR = 0;
 774  0000 725f5070      	clr	20592
 775                     ; 349   DMA1->GCSR = (uint8_t)(DMA_TimeOut << (uint8_t)2);
 777  0004 48            	sll	a
 778  0005 48            	sll	a
 779  0006 c75070        	ld	20592,a
 780                     ; 351 }
 783  0009 81            	ret
 830                     ; 401 void DMA_SetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx, uint8_t DataNumber)
 830                     ; 402 {
 831                     .text:	section	.text,new
 832  0000               _DMA_SetCurrDataCounter:
 834  0000 89            	pushw	x
 835       00000000      OFST:	set	0
 838                     ; 404   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 840                     ; 407   DMA_Channelx->CNBTR = DataNumber;
 842  0001 7b05          	ld	a,(OFST+5,sp)
 843  0003 1e01          	ldw	x,(OFST+1,sp)
 844  0005 e702          	ld	(2,x),a
 845                     ; 408 }
 848  0007 85            	popw	x
 849  0008 81            	ret
 887                     ; 415 uint8_t DMA_GetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx)
 887                     ; 416 {
 888                     .text:	section	.text,new
 889  0000               _DMA_GetCurrDataCounter:
 893                     ; 418   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 895                     ; 421   return ((uint8_t)(DMA_Channelx->CNBTR));
 897  0000 e602          	ld	a,(2,x)
 900  0002 81            	ret
 977                     ; 482 void DMA_ITConfig(DMA_Channel_TypeDef* DMA_Channelx, 
 977                     ; 483                   DMA_ITx_TypeDef DMA_ITx,
 977                     ; 484                   FunctionalState NewState)
 977                     ; 485 {
 978                     .text:	section	.text,new
 979  0000               _DMA_ITConfig:
 981  0000 89            	pushw	x
 982       00000000      OFST:	set	0
 985                     ; 487   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 987                     ; 488   assert_param(IS_DMA_CONFIG_ITX(DMA_ITx));
 989                     ; 489   assert_param(IS_FUNCTIONAL_STATE(NewState));
 991                     ; 491   if (NewState != DISABLE)
 993  0001 0d06          	tnz	(OFST+6,sp)
 994  0003 2706          	jreq	L554
 995                     ; 494     DMA_Channelx->CCR |= (uint8_t)(DMA_ITx);
 997  0005 f6            	ld	a,(x)
 998  0006 1a05          	or	a,(OFST+5,sp)
 999  0008 f7            	ld	(x),a
1001  0009 2007          	jra	L754
1002  000b               L554:
1003                     ; 499     DMA_Channelx->CCR &= (uint8_t)~(DMA_ITx);
1005  000b 1e01          	ldw	x,(OFST+1,sp)
1006  000d 7b05          	ld	a,(OFST+5,sp)
1007  000f 43            	cpl	a
1008  0010 f4            	and	a,(x)
1009  0011 f7            	ld	(x),a
1010  0012               L754:
1011                     ; 501 }
1014  0012 85            	popw	x
1015  0013 81            	ret
1264                     ; 530 FlagStatus DMA_GetFlagStatus(DMA_FLAG_TypeDef DMA_FLAG)
1264                     ; 531 {
1265                     .text:	section	.text,new
1266  0000               _DMA_GetFlagStatus:
1268  0000 89            	pushw	x
1269  0001 5204          	subw	sp,#4
1270       00000004      OFST:	set	4
1273                     ; 532   FlagStatus flagstatus = RESET;
1275                     ; 533   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1277                     ; 534   uint8_t tmpgir1 = 0;
1279                     ; 535   uint8_t tmpgcsr = 0;
1281                     ; 538   assert_param(IS_DMA_GET_FLAG(DMA_FLAG));
1283                     ; 541   tmpgcsr = DMA1->GCSR;
1285  0003 c65070        	ld	a,20592
1286  0006 6b04          	ld	(OFST+0,sp),a
1288                     ; 542   tmpgir1 = DMA1->GIR1;
1290  0008 c65071        	ld	a,20593
1291  000b 6b01          	ld	(OFST-3,sp),a
1293                     ; 544   if (((uint16_t)DMA_FLAG & (uint16_t)0x0F00) != (uint16_t)RESET)
1295  000d 01            	rrwa	x,a
1296  000e 9f            	ld	a,xl
1297  000f a40f          	and	a,#15
1298  0011 97            	ld	xl,a
1299  0012 4f            	clr	a
1300  0013 02            	rlwa	x,a
1301  0014 5d            	tnzw	x
1302  0015 2736          	jreq	L706
1303                     ; 547     if (((uint16_t)DMA_FLAG & 0x0100) != (uint16_t)RESET)
1305  0017 7b05          	ld	a,(OFST+1,sp)
1306  0019 a501          	bcp	a,#1
1307  001b 2707          	jreq	L116
1308                     ; 549       DMA_Channelx = DMA1_Channel0;
1310  001d ae5075        	ldw	x,#20597
1311  0020 1f02          	ldw	(OFST-2,sp),x
1314  0022 201f          	jra	L316
1315  0024               L116:
1316                     ; 551     else if  (((uint16_t)DMA_FLAG & 0x0200) != (uint16_t)RESET)
1318  0024 7b05          	ld	a,(OFST+1,sp)
1319  0026 a502          	bcp	a,#2
1320  0028 2707          	jreq	L516
1321                     ; 553       DMA_Channelx = DMA1_Channel1;
1323  002a ae507f        	ldw	x,#20607
1324  002d 1f02          	ldw	(OFST-2,sp),x
1327  002f 2012          	jra	L316
1328  0031               L516:
1329                     ; 555     else if  (((uint16_t)DMA_FLAG & 0x0400) != (uint16_t)RESET)
1331  0031 7b05          	ld	a,(OFST+1,sp)
1332  0033 a504          	bcp	a,#4
1333  0035 2707          	jreq	L126
1334                     ; 557       DMA_Channelx = DMA1_Channel2;
1336  0037 ae5089        	ldw	x,#20617
1337  003a 1f02          	ldw	(OFST-2,sp),x
1340  003c 2005          	jra	L316
1341  003e               L126:
1342                     ; 561       DMA_Channelx = DMA1_Channel3;
1344  003e ae5093        	ldw	x,#20627
1345  0041 1f02          	ldw	(OFST-2,sp),x
1347  0043               L316:
1348                     ; 565     flagstatus = (FlagStatus)((uint8_t)(DMA_Channelx->CSPR) & (uint8_t)DMA_FLAG);
1350  0043 1e02          	ldw	x,(OFST-2,sp)
1351  0045 e601          	ld	a,(1,x)
1352  0047 1406          	and	a,(OFST+2,sp)
1353  0049 6b04          	ld	(OFST+0,sp),a
1356  004b 2014          	jra	L526
1357  004d               L706:
1358                     ; 567   else if (((uint16_t)DMA_FLAG & 0x1000) != (uint16_t)RESET)
1360  004d 7b05          	ld	a,(OFST+1,sp)
1361  004f a510          	bcp	a,#16
1362  0051 2708          	jreq	L726
1363                     ; 570     flagstatus = (FlagStatus)(tmpgir1 & (uint8_t)DMA_FLAG);
1365  0053 7b06          	ld	a,(OFST+2,sp)
1366  0055 1401          	and	a,(OFST-3,sp)
1367  0057 6b04          	ld	(OFST+0,sp),a
1370  0059 2006          	jra	L526
1371  005b               L726:
1372                     ; 575     flagstatus = (FlagStatus)(tmpgcsr & DMA_GCSR_GB);
1374  005b 7b04          	ld	a,(OFST+0,sp)
1375  005d a402          	and	a,#2
1376  005f 6b04          	ld	(OFST+0,sp),a
1378  0061               L526:
1379                     ; 579   return (flagstatus);
1381  0061 7b04          	ld	a,(OFST+0,sp)
1384  0063 5b06          	addw	sp,#6
1385  0065 81            	ret
1432                     ; 597 void DMA_ClearFlag(DMA_FLAG_TypeDef DMA_FLAG)
1432                     ; 598 {
1433                     .text:	section	.text,new
1434  0000               _DMA_ClearFlag:
1436  0000 89            	pushw	x
1437  0001 89            	pushw	x
1438       00000002      OFST:	set	2
1441                     ; 599   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1443                     ; 602   assert_param(IS_DMA_CLEAR_FLAG(DMA_FLAG));
1445                     ; 605   if (((uint16_t)DMA_FLAG & (uint16_t)0x0100) != (uint16_t)RESET)
1447  0002 01            	rrwa	x,a
1448  0003 9f            	ld	a,xl
1449  0004 a401          	and	a,#1
1450  0006 97            	ld	xl,a
1451  0007 4f            	clr	a
1452  0008 02            	rlwa	x,a
1453  0009 5d            	tnzw	x
1454  000a 2707          	jreq	L756
1455                     ; 607     DMA_Channelx = DMA1_Channel0;
1457  000c ae5075        	ldw	x,#20597
1458  000f 1f01          	ldw	(OFST-1,sp),x
1461  0011 201f          	jra	L166
1462  0013               L756:
1463                     ; 611     if (((uint16_t)DMA_FLAG & (uint16_t)0x0200) != (uint16_t)RESET)
1465  0013 7b03          	ld	a,(OFST+1,sp)
1466  0015 a502          	bcp	a,#2
1467  0017 2707          	jreq	L366
1468                     ; 613       DMA_Channelx = DMA1_Channel1;
1470  0019 ae507f        	ldw	x,#20607
1471  001c 1f01          	ldw	(OFST-1,sp),x
1474  001e 2012          	jra	L166
1475  0020               L366:
1476                     ; 617       if (((uint16_t)DMA_FLAG & (uint16_t)0x0400) != (uint16_t)RESET)
1478  0020 7b03          	ld	a,(OFST+1,sp)
1479  0022 a504          	bcp	a,#4
1480  0024 2707          	jreq	L766
1481                     ; 619         DMA_Channelx = DMA1_Channel2;
1483  0026 ae5089        	ldw	x,#20617
1484  0029 1f01          	ldw	(OFST-1,sp),x
1487  002b 2005          	jra	L166
1488  002d               L766:
1489                     ; 623         DMA_Channelx = DMA1_Channel3;
1491  002d ae5093        	ldw	x,#20627
1492  0030 1f01          	ldw	(OFST-1,sp),x
1494  0032               L166:
1495                     ; 629   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)((uint8_t)DMA_FLAG & (uint8_t)0x06);
1497  0032 1e01          	ldw	x,(OFST-1,sp)
1498  0034 7b04          	ld	a,(OFST+2,sp)
1499  0036 a406          	and	a,#6
1500  0038 43            	cpl	a
1501  0039 e401          	and	a,(1,x)
1502  003b e701          	ld	(1,x),a
1503                     ; 630 }
1506  003d 5b04          	addw	sp,#4
1507  003f 81            	ret
1645                     ; 646 ITStatus DMA_GetITStatus(DMA_IT_TypeDef DMA_IT)
1645                     ; 647 {
1646                     .text:	section	.text,new
1647  0000               _DMA_GetITStatus:
1649  0000 88            	push	a
1650  0001 5204          	subw	sp,#4
1651       00000004      OFST:	set	4
1654                     ; 648   ITStatus itstatus = RESET;
1656                     ; 649   uint8_t tmpreg = 0;
1658                     ; 650   uint8_t tmp2 = 0;
1660                     ; 651   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1662                     ; 654   assert_param(IS_DMA_GET_IT(DMA_IT));
1664                     ; 657   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1666  0003 a510          	bcp	a,#16
1667  0005 2707          	jreq	L757
1668                     ; 659     DMA_Channelx = DMA1_Channel0;
1670  0007 ae5075        	ldw	x,#20597
1671  000a 1f03          	ldw	(OFST-1,sp),x
1674  000c 201f          	jra	L167
1675  000e               L757:
1676                     ; 663     if  ((DMA_IT & 0x20) != (uint8_t)RESET)
1678  000e 7b05          	ld	a,(OFST+1,sp)
1679  0010 a520          	bcp	a,#32
1680  0012 2707          	jreq	L367
1681                     ; 665       DMA_Channelx = DMA1_Channel1;
1683  0014 ae507f        	ldw	x,#20607
1684  0017 1f03          	ldw	(OFST-1,sp),x
1687  0019 2012          	jra	L167
1688  001b               L367:
1689                     ; 669       if  ((DMA_IT & 0x40) != (uint8_t)RESET)
1691  001b 7b05          	ld	a,(OFST+1,sp)
1692  001d a540          	bcp	a,#64
1693  001f 2707          	jreq	L767
1694                     ; 671         DMA_Channelx = DMA1_Channel2;
1696  0021 ae5089        	ldw	x,#20617
1697  0024 1f03          	ldw	(OFST-1,sp),x
1700  0026 2005          	jra	L167
1701  0028               L767:
1702                     ; 675         DMA_Channelx = DMA1_Channel3;
1704  0028 ae5093        	ldw	x,#20627
1705  002b 1f03          	ldw	(OFST-1,sp),x
1707  002d               L167:
1708                     ; 680   tmpreg =  DMA_Channelx->CSPR ;
1710  002d 1e03          	ldw	x,(OFST-1,sp)
1711  002f e601          	ld	a,(1,x)
1712  0031 6b01          	ld	(OFST-3,sp),a
1714                     ; 681   tmpreg &= DMA_Channelx->CCR ;
1716  0033 1e03          	ldw	x,(OFST-1,sp)
1717  0035 7b01          	ld	a,(OFST-3,sp)
1718  0037 f4            	and	a,(x)
1719  0038 6b01          	ld	(OFST-3,sp),a
1721                     ; 682   tmp2 = (uint8_t)(DMA_IT & (uint8_t)(DMA_CCR_TCIE | DMA_CCR_HTIE));
1723  003a 7b05          	ld	a,(OFST+1,sp)
1724  003c a406          	and	a,#6
1725  003e 6b02          	ld	(OFST-2,sp),a
1727                     ; 683   itstatus = (ITStatus)((uint8_t)tmpreg & (uint8_t)tmp2);
1729  0040 7b01          	ld	a,(OFST-3,sp)
1730  0042 1402          	and	a,(OFST-2,sp)
1731  0044 6b02          	ld	(OFST-2,sp),a
1733                     ; 686   return (itstatus);
1735  0046 7b02          	ld	a,(OFST-2,sp)
1738  0048 5b05          	addw	sp,#5
1739  004a 81            	ret
1787                     ; 704 void DMA_ClearITPendingBit(DMA_IT_TypeDef DMA_IT)
1787                     ; 705 {
1788                     .text:	section	.text,new
1789  0000               _DMA_ClearITPendingBit:
1791  0000 88            	push	a
1792  0001 89            	pushw	x
1793       00000002      OFST:	set	2
1796                     ; 706   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1798                     ; 709   assert_param(IS_DMA_CLEAR_IT(DMA_IT));
1800                     ; 711   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1802  0002 a510          	bcp	a,#16
1803  0004 2707          	jreq	L7101
1804                     ; 713     DMA_Channelx = DMA1_Channel0;
1806  0006 ae5075        	ldw	x,#20597
1807  0009 1f01          	ldw	(OFST-1,sp),x
1810  000b 201f          	jra	L1201
1811  000d               L7101:
1812                     ; 717     if ((DMA_IT & 0x20) != (uint8_t)RESET)
1814  000d 7b03          	ld	a,(OFST+1,sp)
1815  000f a520          	bcp	a,#32
1816  0011 2707          	jreq	L3201
1817                     ; 719       DMA_Channelx = DMA1_Channel1;
1819  0013 ae507f        	ldw	x,#20607
1820  0016 1f01          	ldw	(OFST-1,sp),x
1823  0018 2012          	jra	L1201
1824  001a               L3201:
1825                     ; 723       if ((DMA_IT & 0x40) != (uint8_t)RESET)
1827  001a 7b03          	ld	a,(OFST+1,sp)
1828  001c a540          	bcp	a,#64
1829  001e 2707          	jreq	L7201
1830                     ; 725         DMA_Channelx = DMA1_Channel2;
1832  0020 ae5089        	ldw	x,#20617
1833  0023 1f01          	ldw	(OFST-1,sp),x
1836  0025 2005          	jra	L1201
1837  0027               L7201:
1838                     ; 729         DMA_Channelx = DMA1_Channel3;
1840  0027 ae5093        	ldw	x,#20627
1841  002a 1f01          	ldw	(OFST-1,sp),x
1843  002c               L1201:
1844                     ; 734   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)(DMA_IT & (uint8_t)0x06);
1846  002c 1e01          	ldw	x,(OFST-1,sp)
1847  002e 7b03          	ld	a,(OFST+1,sp)
1848  0030 a406          	and	a,#6
1849  0032 43            	cpl	a
1850  0033 e401          	and	a,(1,x)
1851  0035 e701          	ld	(1,x),a
1852                     ; 735 }
1855  0037 5b03          	addw	sp,#3
1856  0039 81            	ret
1869                     	xdef	_DMA_ClearITPendingBit
1870                     	xdef	_DMA_GetITStatus
1871                     	xdef	_DMA_ClearFlag
1872                     	xdef	_DMA_GetFlagStatus
1873                     	xdef	_DMA_ITConfig
1874                     	xdef	_DMA_GetCurrDataCounter
1875                     	xdef	_DMA_SetCurrDataCounter
1876                     	xdef	_DMA_SetTimeOut
1877                     	xdef	_DMA_Cmd
1878                     	xdef	_DMA_GlobalCmd
1879                     	xdef	_DMA_Init
1880                     	xdef	_DMA_DeInit
1881                     	xdef	_DMA_GlobalDeInit
1900                     	end
