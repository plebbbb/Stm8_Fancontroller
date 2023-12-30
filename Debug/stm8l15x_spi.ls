   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
 136                     ; 128 void SPI_DeInit(SPI_TypeDef* SPIx)
 136                     ; 129 {
 138                     .text:	section	.text,new
 139  0000               _SPI_DeInit:
 143                     ; 130   SPIx->CR1    = SPI_CR1_RESET_VALUE;
 145  0000 7f            	clr	(x)
 146                     ; 131   SPIx->CR2    = SPI_CR2_RESET_VALUE;
 148  0001 6f01          	clr	(1,x)
 149                     ; 132   SPIx->CR3    = SPI_CR3_RESET_VALUE;
 151  0003 6f02          	clr	(2,x)
 152                     ; 133   SPIx->SR     = SPI_SR_RESET_VALUE;
 154  0005 a602          	ld	a,#2
 155  0007 e703          	ld	(3,x),a
 156                     ; 134   SPIx->CRCPR  = SPI_CRCPR_RESET_VALUE;
 158  0009 a607          	ld	a,#7
 159  000b e705          	ld	(5,x),a
 160                     ; 135 }
 163  000d 81            	ret
 489                     ; 177 void SPI_Init(SPI_TypeDef* SPIx, SPI_FirstBit_TypeDef SPI_FirstBit,
 489                     ; 178               SPI_BaudRatePrescaler_TypeDef SPI_BaudRatePrescaler,
 489                     ; 179               SPI_Mode_TypeDef SPI_Mode, SPI_CPOL_TypeDef SPI_CPOL,
 489                     ; 180               SPI_CPHA_TypeDef SPI_CPHA, SPI_DirectionMode_TypeDef SPI_Data_Direction,
 489                     ; 181               SPI_NSS_TypeDef SPI_Slave_Management, uint8_t CRCPolynomial)
 489                     ; 182 {
 490                     .text:	section	.text,new
 491  0000               _SPI_Init:
 493  0000 89            	pushw	x
 494  0001 88            	push	a
 495       00000001      OFST:	set	1
 498                     ; 184   assert_param(IS_SPI_FIRSTBIT(SPI_FirstBit));
 500                     ; 185   assert_param(IS_SPI_BAUDRATE_PRESCALER(SPI_BaudRatePrescaler));
 502                     ; 186   assert_param(IS_SPI_MODE(SPI_Mode));
 504                     ; 187   assert_param(IS_SPI_POLARITY(SPI_CPOL));
 506                     ; 188   assert_param(IS_SPI_PHASE(SPI_CPHA));
 508                     ; 189   assert_param(IS_SPI_DATA_DIRECTION(SPI_Data_Direction));
 510                     ; 190   assert_param(IS_SPI_SLAVEMANAGEMENT(SPI_Slave_Management));
 512                     ; 191   assert_param(IS_SPI_CRC_POLYNOMIAL(CRCPolynomial));
 514                     ; 194   SPIx->CR1 = (uint8_t)((uint8_t)((uint8_t)SPI_FirstBit |
 514                     ; 195                                   (uint8_t)SPI_BaudRatePrescaler) |
 514                     ; 196                         (uint8_t)((uint8_t)SPI_CPOL |
 514                     ; 197                                   SPI_CPHA));
 516  0002 7b09          	ld	a,(OFST+8,sp)
 517  0004 1a0a          	or	a,(OFST+9,sp)
 518  0006 6b01          	ld	(OFST+0,sp),a
 520  0008 7b06          	ld	a,(OFST+5,sp)
 521  000a 1a07          	or	a,(OFST+6,sp)
 522  000c 1a01          	or	a,(OFST+0,sp)
 523  000e 1e02          	ldw	x,(OFST+1,sp)
 524  0010 f7            	ld	(x),a
 525                     ; 200   SPIx->CR2 = (uint8_t)((uint8_t)(SPI_Data_Direction) | (uint8_t)(SPI_Slave_Management));
 527  0011 7b0b          	ld	a,(OFST+10,sp)
 528  0013 1a0c          	or	a,(OFST+11,sp)
 529  0015 1e02          	ldw	x,(OFST+1,sp)
 530  0017 e701          	ld	(1,x),a
 531                     ; 202   if (SPI_Mode == SPI_Mode_Master)
 533  0019 7b08          	ld	a,(OFST+7,sp)
 534  001b a104          	cp	a,#4
 535  001d 260a          	jrne	L562
 536                     ; 204     SPIx->CR2 |= (uint8_t)SPI_CR2_SSI;
 538  001f 1e02          	ldw	x,(OFST+1,sp)
 539  0021 e601          	ld	a,(1,x)
 540  0023 aa01          	or	a,#1
 541  0025 e701          	ld	(1,x),a
 543  0027 2008          	jra	L762
 544  0029               L562:
 545                     ; 208     SPIx->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 547  0029 1e02          	ldw	x,(OFST+1,sp)
 548  002b e601          	ld	a,(1,x)
 549  002d a4fe          	and	a,#254
 550  002f e701          	ld	(1,x),a
 551  0031               L762:
 552                     ; 212   SPIx->CR1 |= (uint8_t)(SPI_Mode);
 554  0031 1e02          	ldw	x,(OFST+1,sp)
 555  0033 f6            	ld	a,(x)
 556  0034 1a08          	or	a,(OFST+7,sp)
 557  0036 f7            	ld	(x),a
 558                     ; 215   SPIx->CRCPR = (uint8_t)CRCPolynomial;
 560  0037 7b0d          	ld	a,(OFST+12,sp)
 561  0039 1e02          	ldw	x,(OFST+1,sp)
 562  003b e705          	ld	(5,x),a
 563                     ; 216 }
 566  003d 5b03          	addw	sp,#3
 567  003f 81            	ret
 634                     ; 225 void SPI_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 634                     ; 226 {
 635                     .text:	section	.text,new
 636  0000               _SPI_Cmd:
 638  0000 89            	pushw	x
 639       00000000      OFST:	set	0
 642                     ; 228   assert_param(IS_FUNCTIONAL_STATE(NewState));
 644                     ; 230   if (NewState != DISABLE)
 646  0001 0d05          	tnz	(OFST+5,sp)
 647  0003 2706          	jreq	L523
 648                     ; 232     SPIx->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 650  0005 f6            	ld	a,(x)
 651  0006 aa40          	or	a,#64
 652  0008 f7            	ld	(x),a
 654  0009 2006          	jra	L723
 655  000b               L523:
 656                     ; 236     SPIx->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 658  000b 1e01          	ldw	x,(OFST+1,sp)
 659  000d f6            	ld	a,(x)
 660  000e a4bf          	and	a,#191
 661  0010 f7            	ld	(x),a
 662  0011               L723:
 663                     ; 238 }
 666  0011 85            	popw	x
 667  0012 81            	ret
 715                     ; 247 void SPI_NSSInternalSoftwareCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 715                     ; 248 {
 716                     .text:	section	.text,new
 717  0000               _SPI_NSSInternalSoftwareCmd:
 719  0000 89            	pushw	x
 720       00000000      OFST:	set	0
 723                     ; 250   assert_param(IS_FUNCTIONAL_STATE(NewState));
 725                     ; 252   if (NewState != DISABLE)
 727  0001 0d05          	tnz	(OFST+5,sp)
 728  0003 2708          	jreq	L553
 729                     ; 254     SPIx->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 731  0005 e601          	ld	a,(1,x)
 732  0007 aa01          	or	a,#1
 733  0009 e701          	ld	(1,x),a
 735  000b 2008          	jra	L753
 736  000d               L553:
 737                     ; 258     SPIx->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 739  000d 1e01          	ldw	x,(OFST+1,sp)
 740  000f e601          	ld	a,(1,x)
 741  0011 a4fe          	and	a,#254
 742  0013 e701          	ld	(1,x),a
 743  0015               L753:
 744                     ; 260 }
 747  0015 85            	popw	x
 748  0016 81            	ret
 816                     ; 271 void SPI_BiDirectionalLineConfig(SPI_TypeDef* SPIx, SPI_Direction_TypeDef SPI_Direction)
 816                     ; 272 {
 817                     .text:	section	.text,new
 818  0000               _SPI_BiDirectionalLineConfig:
 820  0000 89            	pushw	x
 821       00000000      OFST:	set	0
 824                     ; 274   assert_param(IS_SPI_DIRECTION(SPI_Direction));
 826                     ; 276   if (SPI_Direction != SPI_Direction_Rx)
 828  0001 0d05          	tnz	(OFST+5,sp)
 829  0003 2708          	jreq	L514
 830                     ; 278     SPIx->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
 832  0005 e601          	ld	a,(1,x)
 833  0007 aa40          	or	a,#64
 834  0009 e701          	ld	(1,x),a
 836  000b 2008          	jra	L714
 837  000d               L514:
 838                     ; 282     SPIx->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
 840  000d 1e01          	ldw	x,(OFST+1,sp)
 841  000f e601          	ld	a,(1,x)
 842  0011 a4bf          	and	a,#191
 843  0013 e701          	ld	(1,x),a
 844  0015               L714:
 845                     ; 284 }
 848  0015 85            	popw	x
 849  0016 81            	ret
 895                     ; 319 void SPI_SendData(SPI_TypeDef* SPIx, uint8_t Data)
 895                     ; 320 {
 896                     .text:	section	.text,new
 897  0000               _SPI_SendData:
 899  0000 89            	pushw	x
 900       00000000      OFST:	set	0
 903                     ; 321   SPIx->DR = Data; /* Write in the DR register the data to be sent*/
 905  0001 7b05          	ld	a,(OFST+5,sp)
 906  0003 1e01          	ldw	x,(OFST+1,sp)
 907  0005 e704          	ld	(4,x),a
 908                     ; 322 }
 911  0007 85            	popw	x
 912  0008 81            	ret
 949                     ; 329 uint8_t SPI_ReceiveData(SPI_TypeDef* SPIx)
 949                     ; 330 {
 950                     .text:	section	.text,new
 951  0000               _SPI_ReceiveData:
 955                     ; 331   return ((uint8_t)SPIx->DR); /* Return the data in the DR register*/
 957  0000 e604          	ld	a,(4,x)
 960  0002 81            	ret
 997                     ; 414 void SPI_TransmitCRC(SPI_TypeDef* SPIx)
 997                     ; 415 {
 998                     .text:	section	.text,new
 999  0000               _SPI_TransmitCRC:
1003                     ; 416   SPIx->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
1005  0000 e601          	ld	a,(1,x)
1006  0002 aa10          	or	a,#16
1007  0004 e701          	ld	(1,x),a
1008                     ; 417 }
1011  0006 81            	ret
1060                     ; 426 void SPI_CalculateCRCCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
1060                     ; 427 {
1061                     .text:	section	.text,new
1062  0000               _SPI_CalculateCRCCmd:
1064  0000 89            	pushw	x
1065       00000000      OFST:	set	0
1068                     ; 429   assert_param(IS_FUNCTIONAL_STATE(NewState));
1070                     ; 432   SPI_Cmd(SPI1, DISABLE);
1072  0001 4b00          	push	#0
1073  0003 ae5200        	ldw	x,#20992
1074  0006 cd0000        	call	_SPI_Cmd
1076  0009 84            	pop	a
1077                     ; 434   if (NewState != DISABLE)
1079  000a 0d05          	tnz	(OFST+5,sp)
1080  000c 270a          	jreq	L135
1081                     ; 436     SPIx->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1083  000e 1e01          	ldw	x,(OFST+1,sp)
1084  0010 e601          	ld	a,(1,x)
1085  0012 aa20          	or	a,#32
1086  0014 e701          	ld	(1,x),a
1088  0016 2008          	jra	L335
1089  0018               L135:
1090                     ; 440     SPIx->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1092  0018 1e01          	ldw	x,(OFST+1,sp)
1093  001a e601          	ld	a,(1,x)
1094  001c a4df          	and	a,#223
1095  001e e701          	ld	(1,x),a
1096  0020               L335:
1097                     ; 442 }
1100  0020 85            	popw	x
1101  0021 81            	ret
1177                     ; 453 uint8_t SPI_GetCRC(SPI_TypeDef* SPIx, SPI_CRC_TypeDef SPI_CRC)
1177                     ; 454 {
1178                     .text:	section	.text,new
1179  0000               _SPI_GetCRC:
1181  0000 89            	pushw	x
1182  0001 88            	push	a
1183       00000001      OFST:	set	1
1186                     ; 455   uint8_t crcreg = 0;
1188                     ; 458   assert_param(IS_SPI_CRC(SPI_CRC));
1190                     ; 460   if (SPI_CRC != SPI_CRC_RX)
1192  0002 0d06          	tnz	(OFST+5,sp)
1193  0004 2706          	jreq	L575
1194                     ; 462     crcreg = SPIx->TXCRCR;  /* Get the Tx CRC register*/
1196  0006 e607          	ld	a,(7,x)
1197  0008 6b01          	ld	(OFST+0,sp),a
1200  000a 2006          	jra	L775
1201  000c               L575:
1202                     ; 466     crcreg = SPIx->RXCRCR; /* Get the Rx CRC register*/
1204  000c 1e02          	ldw	x,(OFST+1,sp)
1205  000e e606          	ld	a,(6,x)
1206  0010 6b01          	ld	(OFST+0,sp),a
1208  0012               L775:
1209                     ; 470   return crcreg;
1211  0012 7b01          	ld	a,(OFST+0,sp)
1214  0014 5b03          	addw	sp,#3
1215  0016 81            	ret
1254                     ; 478 void SPI_ResetCRC(SPI_TypeDef* SPIx)
1254                     ; 479 {
1255                     .text:	section	.text,new
1256  0000               _SPI_ResetCRC:
1258  0000 89            	pushw	x
1259       00000000      OFST:	set	0
1262                     ; 482   SPI_CalculateCRCCmd(SPIx, ENABLE);
1264  0001 4b01          	push	#1
1265  0003 cd0000        	call	_SPI_CalculateCRCCmd
1267  0006 84            	pop	a
1268                     ; 485   SPI_Cmd(SPIx, ENABLE);
1270  0007 4b01          	push	#1
1271  0009 1e02          	ldw	x,(OFST+2,sp)
1272  000b cd0000        	call	_SPI_Cmd
1274  000e 84            	pop	a
1275                     ; 486 }
1278  000f 85            	popw	x
1279  0010 81            	ret
1317                     ; 493 uint8_t SPI_GetCRCPolynomial(SPI_TypeDef* SPIx)
1317                     ; 494 {
1318                     .text:	section	.text,new
1319  0000               _SPI_GetCRCPolynomial:
1323                     ; 495   return SPIx->CRCPR; /* Return the CRC polynomial register */
1325  0000 e605          	ld	a,(5,x)
1328  0002 81            	ret
1405                     ; 525 void SPI_DMACmd(SPI_TypeDef* SPIx, SPI_DMAReq_TypeDef SPI_DMAReq, FunctionalState NewState)
1405                     ; 526 {
1406                     .text:	section	.text,new
1407  0000               _SPI_DMACmd:
1409  0000 89            	pushw	x
1410       00000000      OFST:	set	0
1413                     ; 528   assert_param(IS_FUNCTIONAL_STATE(NewState));
1415                     ; 529   assert_param(IS_SPI_DMAREQ(SPI_DMAReq));
1417                     ; 531   if (NewState != DISABLE)
1419  0001 0d06          	tnz	(OFST+6,sp)
1420  0003 2708          	jreq	L107
1421                     ; 534     SPIx->CR3 |= (uint8_t) SPI_DMAReq;
1423  0005 e602          	ld	a,(2,x)
1424  0007 1a05          	or	a,(OFST+5,sp)
1425  0009 e702          	ld	(2,x),a
1427  000b 2009          	jra	L307
1428  000d               L107:
1429                     ; 539     SPIx->CR3 &= (uint8_t)~SPI_DMAReq;
1431  000d 1e01          	ldw	x,(OFST+1,sp)
1432  000f 7b05          	ld	a,(OFST+5,sp)
1433  0011 43            	cpl	a
1434  0012 e402          	and	a,(2,x)
1435  0014 e702          	ld	(2,x),a
1436  0016               L307:
1437                     ; 541 }
1440  0016 85            	popw	x
1441  0017 81            	ret
1562                     ; 626 void SPI_ITConfig(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
1562                     ; 627 {
1563                     .text:	section	.text,new
1564  0000               _SPI_ITConfig:
1566  0000 89            	pushw	x
1567  0001 88            	push	a
1568       00000001      OFST:	set	1
1571                     ; 628   uint8_t itpos = 0;
1573                     ; 630   assert_param(IS_SPI_CONFIG_IT(SPI_IT));
1575                     ; 631   assert_param(IS_FUNCTIONAL_STATE(NewState));
1577                     ; 634   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
1579  0002 7b06          	ld	a,(OFST+5,sp)
1580  0004 a40f          	and	a,#15
1581  0006 5f            	clrw	x
1582  0007 97            	ld	xl,a
1583  0008 a601          	ld	a,#1
1584  000a 5d            	tnzw	x
1585  000b 2704          	jreq	L04
1586  000d               L24:
1587  000d 48            	sll	a
1588  000e 5a            	decw	x
1589  000f 26fc          	jrne	L24
1590  0011               L04:
1591  0011 6b01          	ld	(OFST+0,sp),a
1593                     ; 636   if (NewState != DISABLE)
1595  0013 0d07          	tnz	(OFST+6,sp)
1596  0015 270a          	jreq	L367
1597                     ; 638     SPIx->CR3 |= itpos; /* Enable interrupt*/
1599  0017 1e02          	ldw	x,(OFST+1,sp)
1600  0019 e602          	ld	a,(2,x)
1601  001b 1a01          	or	a,(OFST+0,sp)
1602  001d e702          	ld	(2,x),a
1604  001f 2009          	jra	L567
1605  0021               L367:
1606                     ; 642     SPIx->CR3 &= (uint8_t)(~itpos); /* Disable interrupt*/
1608  0021 1e02          	ldw	x,(OFST+1,sp)
1609  0023 7b01          	ld	a,(OFST+0,sp)
1610  0025 43            	cpl	a
1611  0026 e402          	and	a,(2,x)
1612  0028 e702          	ld	(2,x),a
1613  002a               L567:
1614                     ; 644 }
1617  002a 5b03          	addw	sp,#3
1618  002c 81            	ret
1751                     ; 661 FlagStatus SPI_GetFlagStatus(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1751                     ; 662 {
1752                     .text:	section	.text,new
1753  0000               _SPI_GetFlagStatus:
1755  0000 89            	pushw	x
1756  0001 88            	push	a
1757       00000001      OFST:	set	1
1760                     ; 663   FlagStatus status = RESET;
1762                     ; 665   assert_param(IS_SPI_FLAG(SPI_FLAG));
1764                     ; 668   if ((SPIx->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1766  0002 e603          	ld	a,(3,x)
1767  0004 1506          	bcp	a,(OFST+5,sp)
1768  0006 2706          	jreq	L1501
1769                     ; 670     status = SET; /* SPI_FLAG is set */
1771  0008 a601          	ld	a,#1
1772  000a 6b01          	ld	(OFST+0,sp),a
1775  000c 2002          	jra	L3501
1776  000e               L1501:
1777                     ; 674     status = RESET; /* SPI_FLAG is reset*/
1779  000e 0f01          	clr	(OFST+0,sp)
1781  0010               L3501:
1782                     ; 678   return status;
1784  0010 7b01          	ld	a,(OFST+0,sp)
1787  0012 5b03          	addw	sp,#3
1788  0014 81            	ret
1835                     ; 696 void SPI_ClearFlag(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1835                     ; 697 {
1836                     .text:	section	.text,new
1837  0000               _SPI_ClearFlag:
1839  0000 89            	pushw	x
1840       00000000      OFST:	set	0
1843                     ; 698   assert_param(IS_SPI_CLEAR_FLAG(SPI_FLAG));
1845                     ; 700   SPIx->SR = (uint8_t)(~SPI_FLAG);
1847  0001 7b05          	ld	a,(OFST+5,sp)
1848  0003 43            	cpl	a
1849  0004 1e01          	ldw	x,(OFST+1,sp)
1850  0006 e703          	ld	(3,x),a
1851                     ; 701 }
1854  0008 85            	popw	x
1855  0009 81            	ret
1949                     ; 717 ITStatus SPI_GetITStatus(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
1949                     ; 718 {
1950                     .text:	section	.text,new
1951  0000               _SPI_GetITStatus:
1953  0000 89            	pushw	x
1954  0001 5203          	subw	sp,#3
1955       00000003      OFST:	set	3
1958                     ; 719   ITStatus pendingbitstatus = RESET;
1960                     ; 720   uint8_t itpos = 0;
1962                     ; 721   uint8_t itmask1 = 0;
1964                     ; 722   uint8_t itmask2 = 0;
1966                     ; 723   __IO uint8_t enablestatus = 0;
1968  0003 0f02          	clr	(OFST-1,sp)
1970                     ; 724   assert_param(IS_SPI_GET_IT(SPI_IT));
1972                     ; 726   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1974  0005 7b08          	ld	a,(OFST+5,sp)
1975  0007 a40f          	and	a,#15
1976  0009 5f            	clrw	x
1977  000a 97            	ld	xl,a
1978  000b a601          	ld	a,#1
1979  000d 5d            	tnzw	x
1980  000e 2704          	jreq	L25
1981  0010               L45:
1982  0010 48            	sll	a
1983  0011 5a            	decw	x
1984  0012 26fc          	jrne	L45
1985  0014               L25:
1986  0014 6b01          	ld	(OFST-2,sp),a
1988                     ; 729   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1990  0016 7b08          	ld	a,(OFST+5,sp)
1991  0018 4e            	swap	a
1992  0019 a40f          	and	a,#15
1993  001b 6b03          	ld	(OFST+0,sp),a
1995                     ; 731   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1997  001d 7b03          	ld	a,(OFST+0,sp)
1998  001f 5f            	clrw	x
1999  0020 97            	ld	xl,a
2000  0021 a601          	ld	a,#1
2001  0023 5d            	tnzw	x
2002  0024 2704          	jreq	L65
2003  0026               L06:
2004  0026 48            	sll	a
2005  0027 5a            	decw	x
2006  0028 26fc          	jrne	L06
2007  002a               L65:
2008  002a 6b03          	ld	(OFST+0,sp),a
2010                     ; 733   enablestatus = (uint8_t)((uint8_t)SPIx->SR & itmask2);
2012  002c 1e04          	ldw	x,(OFST+1,sp)
2013  002e e603          	ld	a,(3,x)
2014  0030 1403          	and	a,(OFST+0,sp)
2015  0032 6b02          	ld	(OFST-1,sp),a
2017                     ; 735   if (((SPIx->CR3 & itpos) != RESET) && enablestatus)
2019  0034 1e04          	ldw	x,(OFST+1,sp)
2020  0036 e602          	ld	a,(2,x)
2021  0038 1501          	bcp	a,(OFST-2,sp)
2022  003a 270a          	jreq	L1511
2024  003c 0d02          	tnz	(OFST-1,sp)
2025  003e 2706          	jreq	L1511
2026                     ; 738     pendingbitstatus = SET;
2028  0040 a601          	ld	a,#1
2029  0042 6b03          	ld	(OFST+0,sp),a
2032  0044 2002          	jra	L3511
2033  0046               L1511:
2034                     ; 743     pendingbitstatus = RESET;
2036  0046 0f03          	clr	(OFST+0,sp)
2038  0048               L3511:
2039                     ; 746   return  pendingbitstatus;
2041  0048 7b03          	ld	a,(OFST+0,sp)
2044  004a 5b05          	addw	sp,#5
2045  004c 81            	ret
2102                     ; 764 void SPI_ClearITPendingBit(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
2102                     ; 765 {
2103                     .text:	section	.text,new
2104  0000               _SPI_ClearITPendingBit:
2106  0000 89            	pushw	x
2107  0001 88            	push	a
2108       00000001      OFST:	set	1
2111                     ; 766   uint8_t itpos = 0;
2113                     ; 767   assert_param(IS_SPI_CLEAR_IT(SPI_IT));
2115                     ; 772   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
2117  0002 7b06          	ld	a,(OFST+5,sp)
2118  0004 a4f0          	and	a,#240
2119  0006 4e            	swap	a
2120  0007 a40f          	and	a,#15
2121  0009 5f            	clrw	x
2122  000a 97            	ld	xl,a
2123  000b a601          	ld	a,#1
2124  000d 5d            	tnzw	x
2125  000e 2704          	jreq	L46
2126  0010               L66:
2127  0010 48            	sll	a
2128  0011 5a            	decw	x
2129  0012 26fc          	jrne	L66
2130  0014               L46:
2131  0014 6b01          	ld	(OFST+0,sp),a
2133                     ; 774   SPIx->SR = (uint8_t)(~itpos);
2135  0016 7b01          	ld	a,(OFST+0,sp)
2136  0018 43            	cpl	a
2137  0019 1e02          	ldw	x,(OFST+1,sp)
2138  001b e703          	ld	(3,x),a
2139                     ; 776 }
2142  001d 5b03          	addw	sp,#3
2143  001f 81            	ret
2156                     	xdef	_SPI_ClearITPendingBit
2157                     	xdef	_SPI_GetITStatus
2158                     	xdef	_SPI_ClearFlag
2159                     	xdef	_SPI_GetFlagStatus
2160                     	xdef	_SPI_ITConfig
2161                     	xdef	_SPI_DMACmd
2162                     	xdef	_SPI_GetCRCPolynomial
2163                     	xdef	_SPI_ResetCRC
2164                     	xdef	_SPI_GetCRC
2165                     	xdef	_SPI_CalculateCRCCmd
2166                     	xdef	_SPI_TransmitCRC
2167                     	xdef	_SPI_ReceiveData
2168                     	xdef	_SPI_SendData
2169                     	xdef	_SPI_BiDirectionalLineConfig
2170                     	xdef	_SPI_NSSInternalSoftwareCmd
2171                     	xdef	_SPI_Cmd
2172                     	xdef	_SPI_Init
2173                     	xdef	_SPI_DeInit
2192                     	end
