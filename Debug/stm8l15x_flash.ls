   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  78                     ; 174 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
  78                     ; 175 {
  80                     .text:	section	.text,new
  81  0000               _FLASH_SetProgrammingTime:
  85                     ; 177   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgTime));
  87                     ; 179   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  89  0000 72115050      	bres	20560,#0
  90                     ; 180   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
  92  0004 ca5050        	or	a,20560
  93  0007 c75050        	ld	20560,a
  94                     ; 181 }
  97  000a 81            	ret
 122                     ; 188 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 122                     ; 189 {
 123                     .text:	section	.text,new
 124  0000               _FLASH_GetProgrammingTime:
 128                     ; 190   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 130  0000 c65050        	ld	a,20560
 131  0003 a401          	and	a,#1
 134  0005 81            	ret
 190                     ; 203 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
 190                     ; 204 {
 191                     .text:	section	.text,new
 192  0000               _FLASH_PowerWaitModeConfig:
 196                     ; 206   assert_param(IS_FLASH_POWER(FLASH_Power));
 198                     ; 209   if(FLASH_Power != FLASH_Power_On)
 200  0000 a101          	cp	a,#1
 201  0002 2706          	jreq	L57
 202                     ; 211     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
 204  0004 72145050      	bset	20560,#2
 206  0008 2004          	jra	L77
 207  000a               L57:
 208                     ; 216     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
 210  000a 72155050      	bres	20560,#2
 211  000e               L77:
 212                     ; 218 }
 215  000e 81            	ret
 238                     ; 259 void FLASH_DeInit(void)
 238                     ; 260 {
 239                     .text:	section	.text,new
 240  0000               _FLASH_DeInit:
 244                     ; 261   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 246  0000 725f5050      	clr	20560
 247                     ; 262   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 249  0004 725f5051      	clr	20561
 250                     ; 263   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 252  0008 35405054      	mov	20564,#64
 253                     ; 264   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 255  000c c65054        	ld	a,20564
 256                     ; 265 }
 259  000f 81            	ret
 315                     ; 275 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 315                     ; 276 {
 316                     .text:	section	.text,new
 317  0000               _FLASH_Unlock:
 319  0000 88            	push	a
 320       00000000      OFST:	set	0
 323                     ; 278   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 325                     ; 281   if(FLASH_MemType == FLASH_MemType_Program)
 327  0001 a1fd          	cp	a,#253
 328  0003 2608          	jrne	L731
 329                     ; 283     FLASH->PUKR = FLASH_RASS_KEY1;
 331  0005 35565052      	mov	20562,#86
 332                     ; 284     FLASH->PUKR = FLASH_RASS_KEY2;
 334  0009 35ae5052      	mov	20562,#174
 335  000d               L731:
 336                     ; 288   if(FLASH_MemType == FLASH_MemType_Data)
 338  000d 7b01          	ld	a,(OFST+1,sp)
 339  000f a1f7          	cp	a,#247
 340  0011 2608          	jrne	L141
 341                     ; 290     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 343  0013 35ae5053      	mov	20563,#174
 344                     ; 291     FLASH->DUKR = FLASH_RASS_KEY1;
 346  0017 35565053      	mov	20563,#86
 347  001b               L141:
 348                     ; 293 }
 351  001b 84            	pop	a
 352  001c 81            	ret
 387                     ; 303 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 387                     ; 304 {
 388                     .text:	section	.text,new
 389  0000               _FLASH_Lock:
 393                     ; 306   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 395                     ; 309   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 397  0000 c45054        	and	a,20564
 398  0003 c75054        	ld	20564,a
 399                     ; 310 }
 402  0006 81            	ret
 445                     ; 318 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 445                     ; 319 {
 446                     .text:	section	.text,new
 447  0000               _FLASH_ProgramByte:
 449       00000000      OFST:	set	0
 452                     ; 321   assert_param(IS_FLASH_ADDRESS(Address));
 454                     ; 323   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 456  0000 7b07          	ld	a,(OFST+7,sp)
 457  0002 1e05          	ldw	x,(OFST+5,sp)
 458  0004 f7            	ld	(x),a
 459                     ; 324 }
 462  0005 81            	ret
 496                     ; 331 void FLASH_EraseByte(uint32_t Address)
 496                     ; 332 {
 497                     .text:	section	.text,new
 498  0000               _FLASH_EraseByte:
 500       00000000      OFST:	set	0
 503                     ; 334   assert_param(IS_FLASH_ADDRESS(Address));
 505                     ; 336   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 507  0000 1e05          	ldw	x,(OFST+5,sp)
 508  0002 7f            	clr	(x)
 509                     ; 337 }
 512  0003 81            	ret
 555                     ; 345 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 555                     ; 346 {
 556                     .text:	section	.text,new
 557  0000               _FLASH_ProgramWord:
 559       00000000      OFST:	set	0
 562                     ; 348   assert_param(IS_FLASH_ADDRESS(Address));
 564                     ; 350   FLASH->CR2 |= FLASH_CR2_WPRG;
 566  0000 721c5051      	bset	20561,#6
 567                     ; 353   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));   
 569  0004 7b07          	ld	a,(OFST+7,sp)
 570  0006 1e05          	ldw	x,(OFST+5,sp)
 571  0008 f7            	ld	(x),a
 572                     ; 355   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data) + 1);
 574  0009 7b08          	ld	a,(OFST+8,sp)
 575  000b 1e05          	ldw	x,(OFST+5,sp)
 576  000d e701          	ld	(1,x),a
 577                     ; 357   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 579  000f 7b09          	ld	a,(OFST+9,sp)
 580  0011 1e05          	ldw	x,(OFST+5,sp)
 581  0013 e702          	ld	(2,x),a
 582                     ; 359   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 584  0015 7b0a          	ld	a,(OFST+10,sp)
 585  0017 1e05          	ldw	x,(OFST+5,sp)
 586  0019 e703          	ld	(3,x),a
 587                     ; 360 }
 590  001b 81            	ret
 624                     ; 367 uint8_t FLASH_ReadByte(uint32_t Address)
 624                     ; 368 {
 625                     .text:	section	.text,new
 626  0000               _FLASH_ReadByte:
 628       00000000      OFST:	set	0
 631                     ; 370   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
 633  0000 1e05          	ldw	x,(OFST+5,sp)
 634  0002 f6            	ld	a,(x)
 637  0003 81            	ret
 682                     ; 417 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 682                     ; 418 {
 683                     .text:	section	.text,new
 684  0000               _FLASH_ProgramOptionByte:
 686  0000 89            	pushw	x
 687       00000000      OFST:	set	0
 690                     ; 420   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 692                     ; 423   FLASH->CR2 |= FLASH_CR2_OPT;
 694  0001 721e5051      	bset	20561,#7
 695                     ; 426   *((PointerAttr uint8_t*)Address) = Data;
 697  0005 7b05          	ld	a,(OFST+5,sp)
 698  0007 1e01          	ldw	x,(OFST+1,sp)
 699  0009 f7            	ld	(x),a
 700                     ; 428   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 702  000a a6fd          	ld	a,#253
 703  000c cd0000        	call	_FLASH_WaitForLastOperation
 705                     ; 431   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 707  000f 721f5051      	bres	20561,#7
 708                     ; 432 }
 711  0013 85            	popw	x
 712  0014 81            	ret
 748                     ; 439 void FLASH_EraseOptionByte(uint16_t Address)
 748                     ; 440 {
 749                     .text:	section	.text,new
 750  0000               _FLASH_EraseOptionByte:
 754                     ; 442   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 756                     ; 445   FLASH->CR2 |= FLASH_CR2_OPT;
 758  0000 721e5051      	bset	20561,#7
 759                     ; 448   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
 761  0004 7f            	clr	(x)
 762                     ; 450   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 764  0005 a6fd          	ld	a,#253
 765  0007 cd0000        	call	_FLASH_WaitForLastOperation
 767                     ; 453   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 769  000a 721f5051      	bres	20561,#7
 770                     ; 454 }
 773  000e 81            	ret
 830                     ; 462 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 830                     ; 463 {
 831                     .text:	section	.text,new
 832  0000               _FLASH_GetReadOutProtectionStatus:
 834  0000 88            	push	a
 835       00000001      OFST:	set	1
 838                     ; 464   FunctionalState state = DISABLE;
 840                     ; 466   if(OPT->ROP == FLASH_READOUTPROTECTION_KEY)
 842  0001 c64800        	ld	a,18432
 843  0004 a1aa          	cp	a,#170
 844  0006 2606          	jrne	L743
 845                     ; 469     state =  ENABLE;
 847  0008 a601          	ld	a,#1
 848  000a 6b01          	ld	(OFST+0,sp),a
 851  000c 2002          	jra	L153
 852  000e               L743:
 853                     ; 474     state =  DISABLE;
 855  000e 0f01          	clr	(OFST+0,sp)
 857  0010               L153:
 858                     ; 477   return state;
 860  0010 7b01          	ld	a,(OFST+0,sp)
 863  0012 5b01          	addw	sp,#1
 864  0014 81            	ret
 898                     ; 485 uint16_t FLASH_GetBootSize(void)
 898                     ; 486 {
 899                     .text:	section	.text,new
 900  0000               _FLASH_GetBootSize:
 902  0000 89            	pushw	x
 903       00000002      OFST:	set	2
 906                     ; 487   uint16_t temp = 0;
 908                     ; 490   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
 910  0001 c64802        	ld	a,18434
 911  0004 5f            	clrw	x
 912  0005 97            	ld	xl,a
 913  0006 4f            	clr	a
 914  0007 02            	rlwa	x,a
 915  0008 44            	srl	a
 916  0009 56            	rrcw	x
 917  000a 1f01          	ldw	(OFST-1,sp),x
 919                     ; 493   if(OPT->UBC > 0x7F)
 921  000c c64802        	ld	a,18434
 922  000f a180          	cp	a,#128
 923  0011 2505          	jrult	L173
 924                     ; 495     temp = 8192;
 926  0013 ae2000        	ldw	x,#8192
 927  0016 1f01          	ldw	(OFST-1,sp),x
 929  0018               L173:
 930                     ; 499   return(temp);
 932  0018 1e01          	ldw	x,(OFST-1,sp)
 935  001a 5b02          	addw	sp,#2
 936  001c 81            	ret
 970                     ; 508 uint16_t FLASH_GetCodeSize(void)
 970                     ; 509 {
 971                     .text:	section	.text,new
 972  0000               _FLASH_GetCodeSize:
 974  0000 89            	pushw	x
 975       00000002      OFST:	set	2
 978                     ; 510   uint16_t temp = 0;
 980                     ; 513   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
 982  0001 c64807        	ld	a,18439
 983  0004 5f            	clrw	x
 984  0005 97            	ld	xl,a
 985  0006 4f            	clr	a
 986  0007 02            	rlwa	x,a
 987  0008 44            	srl	a
 988  0009 56            	rrcw	x
 989  000a 1f01          	ldw	(OFST-1,sp),x
 991                     ; 516   if(OPT->PCODESIZE > 0x7F)
 993  000c c64807        	ld	a,18439
 994  000f a180          	cp	a,#128
 995  0011 2505          	jrult	L114
 996                     ; 518     temp = 8192;
 998  0013 ae2000        	ldw	x,#8192
 999  0016 1f01          	ldw	(OFST-1,sp),x
1001  0018               L114:
1002                     ; 522   return(temp);
1004  0018 1e01          	ldw	x,(OFST-1,sp)
1007  001a 5b02          	addw	sp,#2
1008  001c 81            	ret
1043                     ; 547 void FLASH_ITConfig(FunctionalState NewState)
1043                     ; 548 {
1044                     .text:	section	.text,new
1045  0000               _FLASH_ITConfig:
1049                     ; 550   assert_param(IS_FUNCTIONAL_STATE(NewState));
1051                     ; 552   if(NewState != DISABLE)
1053  0000 4d            	tnz	a
1054  0001 2706          	jreq	L134
1055                     ; 555     FLASH->CR1 |= FLASH_CR1_IE;
1057  0003 72125050      	bset	20560,#1
1059  0007 2004          	jra	L334
1060  0009               L134:
1061                     ; 560     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
1063  0009 72135050      	bres	20560,#1
1064  000d               L334:
1065                     ; 562 }
1068  000d 81            	ret
1177                     ; 576 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
1177                     ; 577 {
1178                     .text:	section	.text,new
1179  0000               _FLASH_GetFlagStatus:
1181  0000 88            	push	a
1182       00000001      OFST:	set	1
1185                     ; 578   FlagStatus status = RESET;
1187                     ; 579   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
1189                     ; 582   if((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1191  0001 c45054        	and	a,20564
1192  0004 2706          	jreq	L505
1193                     ; 584     status = SET; /* Flash_FLAG is set*/
1195  0006 a601          	ld	a,#1
1196  0008 6b01          	ld	(OFST+0,sp),a
1199  000a 2002          	jra	L705
1200  000c               L505:
1201                     ; 588     status = RESET; /* Flash_FLAG is reset*/
1203  000c 0f01          	clr	(OFST+0,sp)
1205  000e               L705:
1206                     ; 592   return status;
1208  000e 7b01          	ld	a,(OFST+0,sp)
1211  0010 5b01          	addw	sp,#1
1212  0012 81            	ret
1248                     ; 719 IN_RAM(void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power))
1248                     ; 720 {
1249                     .text:	section	.text,new
1250  0000               _FLASH_PowerRunModeConfig:
1254                     ; 722   assert_param(IS_FLASH_POWER(FLASH_Power));
1256                     ; 724   if(FLASH_Power != FLASH_Power_On)
1258  0000 a101          	cp	a,#1
1259  0002 2706          	jreq	L725
1260                     ; 726     FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
1262  0004 72165050      	bset	20560,#3
1264  0008 2004          	jra	L135
1265  000a               L725:
1266                     ; 730     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
1268  000a 72175050      	bres	20560,#3
1269  000e               L135:
1270                     ; 732 }
1273  000e 81            	ret
1337                     ; 745 IN_RAM(FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void))
1337                     ; 746 {
1338                     .text:	section	.text,new
1339  0000               _FLASH_GetPowerStatus:
1343                     ; 747   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
1345  0000 c65050        	ld	a,20560
1346  0003 a40c          	and	a,#12
1349  0005 81            	ret
1453                     ; 765 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
1453                     ; 766                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1453                     ; 767 {
1454                     .text:	section	.text,new
1455  0000               _FLASH_ProgramBlock:
1457  0000 89            	pushw	x
1458  0001 5206          	subw	sp,#6
1459       00000006      OFST:	set	6
1462                     ; 768   uint16_t Count = 0;
1464                     ; 769   uint32_t startaddress = 0;
1466                     ; 772   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1468                     ; 773   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
1470                     ; 774   if(FLASH_MemType == FLASH_MemType_Program)
1472  0003 7b0b          	ld	a,(OFST+5,sp)
1473  0005 a1fd          	cp	a,#253
1474  0007 260c          	jrne	L136
1475                     ; 776     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1477                     ; 777     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1479  0009 ae8000        	ldw	x,#32768
1480  000c 1f03          	ldw	(OFST-3,sp),x
1481  000e ae0000        	ldw	x,#0
1482  0011 1f01          	ldw	(OFST-5,sp),x
1485  0013 200a          	jra	L336
1486  0015               L136:
1487                     ; 781     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1489                     ; 782     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1491  0015 ae1000        	ldw	x,#4096
1492  0018 1f03          	ldw	(OFST-3,sp),x
1493  001a ae0000        	ldw	x,#0
1494  001d 1f01          	ldw	(OFST-5,sp),x
1496  001f               L336:
1497                     ; 786   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1499  001f 1e07          	ldw	x,(OFST+1,sp)
1500  0021 a680          	ld	a,#128
1501  0023 cd0000        	call	c_cmulx
1503  0026 96            	ldw	x,sp
1504  0027 1c0001        	addw	x,#OFST-5
1505  002a cd0000        	call	c_lgadd
1508                     ; 789   if(FLASH_ProgMode == FLASH_ProgramMode_Standard)
1510  002d 0d0c          	tnz	(OFST+6,sp)
1511  002f 2606          	jrne	L536
1512                     ; 792     FLASH->CR2 |= FLASH_CR2_PRG;
1514  0031 72105051      	bset	20561,#0
1516  0035 2004          	jra	L736
1517  0037               L536:
1518                     ; 797     FLASH->CR2 |= FLASH_CR2_FPRG;
1520  0037 72185051      	bset	20561,#4
1521  003b               L736:
1522                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1524  003b 5f            	clrw	x
1525  003c 1f05          	ldw	(OFST-1,sp),x
1527  003e               L146:
1528                     ; 803     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1530  003e 1e0d          	ldw	x,(OFST+7,sp)
1531  0040 72fb05        	addw	x,(OFST-1,sp)
1532  0043 f6            	ld	a,(x)
1533  0044 1e03          	ldw	x,(OFST-3,sp)
1534  0046 72fb05        	addw	x,(OFST-1,sp)
1535  0049 f7            	ld	(x),a
1536                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1538  004a 1e05          	ldw	x,(OFST-1,sp)
1539  004c 1c0001        	addw	x,#1
1540  004f 1f05          	ldw	(OFST-1,sp),x
1544  0051 1e05          	ldw	x,(OFST-1,sp)
1545  0053 a30080        	cpw	x,#128
1546  0056 25e6          	jrult	L146
1547                     ; 805 }
1550  0058 5b08          	addw	sp,#8
1551  005a 81            	ret
1614                     ; 817 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1614                     ; 818 {
1615                     .text:	section	.text,new
1616  0000               _FLASH_EraseBlock:
1618  0000 89            	pushw	x
1619  0001 5206          	subw	sp,#6
1620       00000006      OFST:	set	6
1623                     ; 819   uint32_t startaddress = 0;
1625                     ; 829   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1627                     ; 830   if(FLASH_MemType == FLASH_MemType_Program)
1629  0003 7b0b          	ld	a,(OFST+5,sp)
1630  0005 a1fd          	cp	a,#253
1631  0007 260c          	jrne	L107
1632                     ; 832     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1634                     ; 833     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1636  0009 ae8000        	ldw	x,#32768
1637  000c 1f05          	ldw	(OFST-1,sp),x
1638  000e ae0000        	ldw	x,#0
1639  0011 1f03          	ldw	(OFST-3,sp),x
1642  0013 200a          	jra	L307
1643  0015               L107:
1644                     ; 837     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1646                     ; 838     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1648  0015 ae1000        	ldw	x,#4096
1649  0018 1f05          	ldw	(OFST-1,sp),x
1650  001a ae0000        	ldw	x,#0
1651  001d 1f03          	ldw	(OFST-3,sp),x
1653  001f               L307:
1654                     ; 844     pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1656  001f 1e07          	ldw	x,(OFST+1,sp)
1657  0021 a680          	ld	a,#128
1658  0023 cd0000        	call	c_cmulx
1660  0026 96            	ldw	x,sp
1661  0027 1c0003        	addw	x,#OFST-3
1662  002a cd0000        	call	c_ladd
1664  002d be02          	ldw	x,c_lreg+2
1665  002f 1f01          	ldw	(OFST-5,sp),x
1667                     ; 851   FLASH->CR2 |= FLASH_CR2_ERASE;
1669  0031 721a5051      	bset	20561,#5
1670                     ; 855     *pwFlash = (uint32_t)0;  
1672  0035 1e01          	ldw	x,(OFST-5,sp)
1673  0037 a600          	ld	a,#0
1674  0039 e703          	ld	(3,x),a
1675  003b a600          	ld	a,#0
1676  003d e702          	ld	(2,x),a
1677  003f a600          	ld	a,#0
1678  0041 e701          	ld	(1,x),a
1679  0043 a600          	ld	a,#0
1680  0045 f7            	ld	(x),a
1681                     ; 863 }
1684  0046 5b08          	addw	sp,#8
1685  0048 81            	ret
1770                     ; 875 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
1770                     ; 876 {
1771                     .text:	section	.text,new
1772  0000               _FLASH_WaitForLastOperation:
1774  0000 5203          	subw	sp,#3
1775       00000003      OFST:	set	3
1778                     ; 877   uint16_t timeout = OPERATION_TIMEOUT;
1780  0002 aeffff        	ldw	x,#65535
1781  0005 1f01          	ldw	(OFST-2,sp),x
1783                     ; 878   uint8_t flagstatus = 0x00;
1785  0007 0f03          	clr	(OFST+0,sp)
1787                     ; 881   if(FLASH_MemType == FLASH_MemType_Program)
1789  0009 a1fd          	cp	a,#253
1790  000b 2628          	jrne	L367
1792  000d 200e          	jra	L157
1793  000f               L747:
1794                     ; 885       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1794                     ; 886                                                       FLASH_IAPSR_WR_PG_DIS));
1796  000f c65054        	ld	a,20564
1797  0012 a405          	and	a,#5
1798  0014 6b03          	ld	(OFST+0,sp),a
1800                     ; 887       timeout--;
1802  0016 1e01          	ldw	x,(OFST-2,sp)
1803  0018 1d0001        	subw	x,#1
1804  001b 1f01          	ldw	(OFST-2,sp),x
1806  001d               L157:
1807                     ; 883     while((flagstatus == 0x00) && (timeout != 0x00))
1809  001d 0d03          	tnz	(OFST+0,sp)
1810  001f 261c          	jrne	L757
1812  0021 1e01          	ldw	x,(OFST-2,sp)
1813  0023 26ea          	jrne	L747
1814  0025 2016          	jra	L757
1815  0027               L167:
1816                     ; 894       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1816                     ; 895                                                       FLASH_IAPSR_WR_PG_DIS));
1818  0027 c65054        	ld	a,20564
1819  002a a441          	and	a,#65
1820  002c 6b03          	ld	(OFST+0,sp),a
1822                     ; 896       timeout--;
1824  002e 1e01          	ldw	x,(OFST-2,sp)
1825  0030 1d0001        	subw	x,#1
1826  0033 1f01          	ldw	(OFST-2,sp),x
1828  0035               L367:
1829                     ; 892     while((flagstatus == 0x00) && (timeout != 0x00))
1831  0035 0d03          	tnz	(OFST+0,sp)
1832  0037 2604          	jrne	L757
1834  0039 1e01          	ldw	x,(OFST-2,sp)
1835  003b 26ea          	jrne	L167
1836  003d               L757:
1837                     ; 900   if(timeout == 0x00)
1839  003d 1e01          	ldw	x,(OFST-2,sp)
1840  003f 2604          	jrne	L177
1841                     ; 902     flagstatus = FLASH_Status_TimeOut;
1843  0041 a602          	ld	a,#2
1844  0043 6b03          	ld	(OFST+0,sp),a
1846  0045               L177:
1847                     ; 905   return((FLASH_Status_TypeDef)flagstatus);
1849  0045 7b03          	ld	a,(OFST+0,sp)
1852  0047 5b03          	addw	sp,#3
1853  0049 81            	ret
1866                     	xdef	_FLASH_WaitForLastOperation
1867                     	xdef	_FLASH_EraseBlock
1868                     	xdef	_FLASH_ProgramBlock
1869                     	xdef	_FLASH_GetPowerStatus
1870                     	xdef	_FLASH_PowerRunModeConfig
1871                     	xdef	_FLASH_GetFlagStatus
1872                     	xdef	_FLASH_ITConfig
1873                     	xdef	_FLASH_EraseOptionByte
1874                     	xdef	_FLASH_ProgramOptionByte
1875                     	xdef	_FLASH_GetReadOutProtectionStatus
1876                     	xdef	_FLASH_GetCodeSize
1877                     	xdef	_FLASH_GetBootSize
1878                     	xdef	_FLASH_ReadByte
1879                     	xdef	_FLASH_ProgramWord
1880                     	xdef	_FLASH_EraseByte
1881                     	xdef	_FLASH_ProgramByte
1882                     	xdef	_FLASH_Lock
1883                     	xdef	_FLASH_Unlock
1884                     	xdef	_FLASH_DeInit
1885                     	xdef	_FLASH_PowerWaitModeConfig
1886                     	xdef	_FLASH_SetProgrammingTime
1887                     	xdef	_FLASH_GetProgrammingTime
1888                     	xref.b	c_lreg
1907                     	xref	c_ladd
1908                     	xref	c_lgadd
1909                     	xref	c_cmulx
1910                     	end
