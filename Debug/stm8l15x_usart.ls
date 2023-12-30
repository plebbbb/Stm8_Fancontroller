   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
 163                     ; 148 void USART_DeInit(USART_TypeDef* USARTx)
 163                     ; 149 {
 165                     .text:	section	.text,new
 166  0000               _USART_DeInit:
 170                     ; 153   (void) USARTx->SR;
 172  0000 f6            	ld	a,(x)
 173                     ; 154   (void) USARTx->DR;
 175  0001 e601          	ld	a,(1,x)
 176                     ; 156   USARTx->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
 178  0003 6f03          	clr	(3,x)
 179                     ; 157   USARTx->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
 181  0005 6f02          	clr	(2,x)
 182                     ; 159   USARTx->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
 184  0007 6f04          	clr	(4,x)
 185                     ; 160   USARTx->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
 187  0009 6f05          	clr	(5,x)
 188                     ; 161   USARTx->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
 190  000b 6f06          	clr	(6,x)
 191                     ; 162   USARTx->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
 193  000d 6f07          	clr	(7,x)
 194                     ; 163 }
 197  000f 81            	ret
 389                     ; 192 void USART_Init(USART_TypeDef* USARTx, uint32_t BaudRate, USART_WordLength_TypeDef
 389                     ; 193                 USART_WordLength, USART_StopBits_TypeDef USART_StopBits,
 389                     ; 194                 USART_Parity_TypeDef USART_Parity,  USART_Mode_TypeDef USART_Mode)
 389                     ; 195 {
 390                     .text:	section	.text,new
 391  0000               _USART_Init:
 393  0000 89            	pushw	x
 394  0001 5204          	subw	sp,#4
 395       00000004      OFST:	set	4
 398                     ; 196   uint32_t BaudRate_Mantissa = 0;
 400                     ; 199   assert_param(IS_USART_BAUDRATE(BaudRate));
 402                     ; 201   assert_param(IS_USART_WORDLENGTH(USART_WordLength));
 404                     ; 203   assert_param(IS_USART_STOPBITS(USART_StopBits));
 406                     ; 205   assert_param(IS_USART_PARITY(USART_Parity));
 408                     ; 207   assert_param(IS_USART_MODE(USART_Mode));
 410                     ; 210   USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
 412  0003 e604          	ld	a,(4,x)
 413  0005 a4e9          	and	a,#233
 414  0007 e704          	ld	(4,x),a
 415                     ; 213   USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
 417  0009 7b0d          	ld	a,(OFST+9,sp)
 418  000b 1a0f          	or	a,(OFST+11,sp)
 419  000d ea04          	or	a,(4,x)
 420  000f e704          	ld	(4,x),a
 421                     ; 216   USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
 423  0011 e606          	ld	a,(6,x)
 424  0013 a4cf          	and	a,#207
 425  0015 e706          	ld	(6,x),a
 426                     ; 218   USARTx->CR3 |= (uint8_t)USART_StopBits;
 428  0017 e606          	ld	a,(6,x)
 429  0019 1a0e          	or	a,(OFST+10,sp)
 430  001b e706          	ld	(6,x),a
 431                     ; 221   USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 433  001d 6f02          	clr	(2,x)
 434                     ; 223   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 436  001f e603          	ld	a,(3,x)
 437  0021 a40f          	and	a,#15
 438  0023 e703          	ld	(3,x),a
 439                     ; 225   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 441  0025 e603          	ld	a,(3,x)
 442  0027 a4f0          	and	a,#240
 443  0029 e703          	ld	(3,x),a
 444                     ; 227   BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
 446  002b cd0000        	call	_CLK_GetClockFreq
 448  002e 96            	ldw	x,sp
 449  002f 1c0009        	addw	x,#OFST+5
 450  0032 cd0000        	call	c_ludv
 452  0035 96            	ldw	x,sp
 453  0036 1c0001        	addw	x,#OFST-3
 454  0039 cd0000        	call	c_rtol
 457                     ; 229   USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
 459  003c 7b03          	ld	a,(OFST-1,sp)
 460  003e a4f0          	and	a,#240
 461  0040 1e05          	ldw	x,(OFST+1,sp)
 462  0042 e703          	ld	(3,x),a
 463                     ; 231   USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 465  0044 1e05          	ldw	x,(OFST+1,sp)
 466  0046 7b04          	ld	a,(OFST+0,sp)
 467  0048 a40f          	and	a,#15
 468  004a ea03          	or	a,(3,x)
 469  004c e703          	ld	(3,x),a
 470                     ; 233   USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 472  004e 96            	ldw	x,sp
 473  004f 1c0001        	addw	x,#OFST-3
 474  0052 cd0000        	call	c_ltor
 476  0055 a604          	ld	a,#4
 477  0057 cd0000        	call	c_lursh
 479  005a b603          	ld	a,c_lreg+3
 480  005c 1e05          	ldw	x,(OFST+1,sp)
 481  005e e702          	ld	(2,x),a
 482                     ; 236   USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 484  0060 1e05          	ldw	x,(OFST+1,sp)
 485  0062 e605          	ld	a,(5,x)
 486  0064 a4f3          	and	a,#243
 487  0066 e705          	ld	(5,x),a
 488                     ; 238   USARTx->CR2 |= (uint8_t)USART_Mode;
 490  0068 1e05          	ldw	x,(OFST+1,sp)
 491  006a e605          	ld	a,(5,x)
 492  006c 1a10          	or	a,(OFST+12,sp)
 493  006e e705          	ld	(5,x),a
 494                     ; 239 }
 497  0070 5b06          	addw	sp,#6
 498  0072 81            	ret
 658                     ; 264 void USART_ClockInit(USART_TypeDef* USARTx, USART_Clock_TypeDef USART_Clock,
 658                     ; 265                      USART_CPOL_TypeDef USART_CPOL, USART_CPHA_TypeDef USART_CPHA,
 658                     ; 266                      USART_LastBit_TypeDef USART_LastBit)
 658                     ; 267 {
 659                     .text:	section	.text,new
 660  0000               _USART_ClockInit:
 662  0000 89            	pushw	x
 663       00000000      OFST:	set	0
 666                     ; 269   assert_param(IS_USART_CLOCK(USART_Clock));
 668                     ; 270   assert_param(IS_USART_CPOL(USART_CPOL));
 670                     ; 271   assert_param(IS_USART_CPHA(USART_CPHA));
 672                     ; 272   assert_param(IS_USART_LASTBIT(USART_LastBit));
 674                     ; 275   USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 676  0001 e606          	ld	a,(6,x)
 677  0003 a4f8          	and	a,#248
 678  0005 e706          	ld	(6,x),a
 679                     ; 277   USARTx->CR3 |= (uint8_t)((uint8_t)((uint8_t)(USART_CPOL | (uint8_t)USART_CPHA ) | USART_LastBit));
 681  0007 7b06          	ld	a,(OFST+6,sp)
 682  0009 1a07          	or	a,(OFST+7,sp)
 683  000b 1a08          	or	a,(OFST+8,sp)
 684  000d ea06          	or	a,(6,x)
 685  000f e706          	ld	(6,x),a
 686                     ; 279   if (USART_Clock != USART_Clock_Disable)
 688  0011 0d05          	tnz	(OFST+5,sp)
 689  0013 2708          	jreq	L523
 690                     ; 281     USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 692  0015 e606          	ld	a,(6,x)
 693  0017 aa08          	or	a,#8
 694  0019 e706          	ld	(6,x),a
 696  001b 2008          	jra	L723
 697  001d               L523:
 698                     ; 285     USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 700  001d 1e01          	ldw	x,(OFST+1,sp)
 701  001f e606          	ld	a,(6,x)
 702  0021 a4f7          	and	a,#247
 703  0023 e706          	ld	(6,x),a
 704  0025               L723:
 705                     ; 287 }
 708  0025 85            	popw	x
 709  0026 81            	ret
 776                     ; 296 void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
 776                     ; 297 {
 777                     .text:	section	.text,new
 778  0000               _USART_Cmd:
 780  0000 89            	pushw	x
 781       00000000      OFST:	set	0
 784                     ; 298   if (NewState != DISABLE)
 786  0001 0d05          	tnz	(OFST+5,sp)
 787  0003 2708          	jreq	L563
 788                     ; 300     USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 790  0005 e604          	ld	a,(4,x)
 791  0007 a4df          	and	a,#223
 792  0009 e704          	ld	(4,x),a
 794  000b 2008          	jra	L763
 795  000d               L563:
 796                     ; 304     USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
 798  000d 1e01          	ldw	x,(OFST+1,sp)
 799  000f e604          	ld	a,(4,x)
 800  0011 aa20          	or	a,#32
 801  0013 e704          	ld	(4,x),a
 802  0015               L763:
 803                     ; 306 }
 806  0015 85            	popw	x
 807  0016 81            	ret
 853                     ; 329 void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
 853                     ; 330 {
 854                     .text:	section	.text,new
 855  0000               _USART_SetPrescaler:
 857  0000 89            	pushw	x
 858       00000000      OFST:	set	0
 861                     ; 332   USARTx->PSCR = USART_Prescaler;
 863  0001 7b05          	ld	a,(OFST+5,sp)
 864  0003 1e01          	ldw	x,(OFST+1,sp)
 865  0005 e70a          	ld	(10,x),a
 866                     ; 333 }
 869  0007 85            	popw	x
 870  0008 81            	ret
 907                     ; 340 void USART_SendBreak(USART_TypeDef* USARTx)
 907                     ; 341 {
 908                     .text:	section	.text,new
 909  0000               _USART_SendBreak:
 913                     ; 342   USARTx->CR2 |= USART_CR2_SBK;
 915  0000 e605          	ld	a,(5,x)
 916  0002 aa01          	or	a,#1
 917  0004 e705          	ld	(5,x),a
 918                     ; 343 }
 921  0006 81            	ret
 958                     ; 382 uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
 958                     ; 383 {
 959                     .text:	section	.text,new
 960  0000               _USART_ReceiveData8:
 964                     ; 384   return USARTx->DR;
 966  0000 e601          	ld	a,(1,x)
 969  0002 81            	ret
1015                     ; 392 uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
1015                     ; 393 {
1016                     .text:	section	.text,new
1017  0000               _USART_ReceiveData9:
1019  0000 89            	pushw	x
1020  0001 89            	pushw	x
1021       00000002      OFST:	set	2
1024                     ; 394   uint16_t temp = 0;
1026                     ; 396   temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
1028  0002 e604          	ld	a,(4,x)
1029  0004 5f            	clrw	x
1030  0005 a480          	and	a,#128
1031  0007 5f            	clrw	x
1032  0008 02            	rlwa	x,a
1033  0009 58            	sllw	x
1034  000a 1f01          	ldw	(OFST-1,sp),x
1036                     ; 397   return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
1038  000c 1e03          	ldw	x,(OFST+1,sp)
1039  000e e601          	ld	a,(1,x)
1040  0010 5f            	clrw	x
1041  0011 97            	ld	xl,a
1042  0012 01            	rrwa	x,a
1043  0013 1a02          	or	a,(OFST+0,sp)
1044  0015 01            	rrwa	x,a
1045  0016 1a01          	or	a,(OFST-1,sp)
1046  0018 01            	rrwa	x,a
1047  0019 01            	rrwa	x,a
1048  001a a4ff          	and	a,#255
1049  001c 01            	rrwa	x,a
1050  001d a401          	and	a,#1
1051  001f 01            	rrwa	x,a
1054  0020 5b04          	addw	sp,#4
1055  0022 81            	ret
1101                     ; 405 void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
1101                     ; 406 {
1102                     .text:	section	.text,new
1103  0000               _USART_SendData8:
1105  0000 89            	pushw	x
1106       00000000      OFST:	set	0
1109                     ; 408   USARTx->DR = Data;
1111  0001 7b05          	ld	a,(OFST+5,sp)
1112  0003 1e01          	ldw	x,(OFST+1,sp)
1113  0005 e701          	ld	(1,x),a
1114                     ; 409 }
1117  0007 85            	popw	x
1118  0008 81            	ret
1164                     ; 418 void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
1164                     ; 419 {
1165                     .text:	section	.text,new
1166  0000               _USART_SendData9:
1168  0000 89            	pushw	x
1169       00000000      OFST:	set	0
1172                     ; 420   assert_param(IS_USART_DATA_9BITS(Data));
1174                     ; 423   USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
1176  0001 e604          	ld	a,(4,x)
1177  0003 a4bf          	and	a,#191
1178  0005 e704          	ld	(4,x),a
1179                     ; 426   USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
1181  0007 1605          	ldw	y,(OFST+5,sp)
1182  0009 9054          	srlw	y
1183  000b 9054          	srlw	y
1184  000d 909f          	ld	a,yl
1185  000f a440          	and	a,#64
1186  0011 ea04          	or	a,(4,x)
1187  0013 e704          	ld	(4,x),a
1188                     ; 429   USARTx->DR   = (uint8_t)(Data);
1190  0015 7b06          	ld	a,(OFST+6,sp)
1191  0017 1e01          	ldw	x,(OFST+1,sp)
1192  0019 e701          	ld	(1,x),a
1193                     ; 430 }
1196  001b 85            	popw	x
1197  001c 81            	ret
1245                     ; 473 void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1245                     ; 474 {
1246                     .text:	section	.text,new
1247  0000               _USART_ReceiverWakeUpCmd:
1249  0000 89            	pushw	x
1250       00000000      OFST:	set	0
1253                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
1255                     ; 477   if (NewState != DISABLE)
1257  0001 0d05          	tnz	(OFST+5,sp)
1258  0003 2708          	jreq	L575
1259                     ; 480     USARTx->CR2 |= USART_CR2_RWU;
1261  0005 e605          	ld	a,(5,x)
1262  0007 aa02          	or	a,#2
1263  0009 e705          	ld	(5,x),a
1265  000b 2008          	jra	L775
1266  000d               L575:
1267                     ; 485     USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
1269  000d 1e01          	ldw	x,(OFST+1,sp)
1270  000f e605          	ld	a,(5,x)
1271  0011 a4fd          	and	a,#253
1272  0013 e705          	ld	(5,x),a
1273  0015               L775:
1274                     ; 487 }
1277  0015 85            	popw	x
1278  0016 81            	ret
1324                     ; 496 void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
1324                     ; 497 {
1325                     .text:	section	.text,new
1326  0000               _USART_SetAddress:
1328  0000 89            	pushw	x
1329       00000000      OFST:	set	0
1332                     ; 499   assert_param(IS_USART_ADDRESS(USART_Address));
1334                     ; 502   USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
1336  0001 e607          	ld	a,(7,x)
1337  0003 a4f0          	and	a,#240
1338  0005 e707          	ld	(7,x),a
1339                     ; 504   USARTx->CR4 |= USART_Address;
1341  0007 e607          	ld	a,(7,x)
1342  0009 1a05          	or	a,(OFST+5,sp)
1343  000b e707          	ld	(7,x),a
1344                     ; 505 }
1347  000d 85            	popw	x
1348  000e 81            	ret
1417                     ; 515 void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
1417                     ; 516 {
1418                     .text:	section	.text,new
1419  0000               _USART_WakeUpConfig:
1421  0000 89            	pushw	x
1422       00000000      OFST:	set	0
1425                     ; 517   assert_param(IS_USART_WAKEUP(USART_WakeUp));
1427                     ; 519   USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
1429  0001 e604          	ld	a,(4,x)
1430  0003 a4f7          	and	a,#247
1431  0005 e704          	ld	(4,x),a
1432                     ; 520   USARTx->CR1 |= (uint8_t)USART_WakeUp;
1434  0007 e604          	ld	a,(4,x)
1435  0009 1a05          	or	a,(OFST+5,sp)
1436  000b e704          	ld	(4,x),a
1437                     ; 521 }
1440  000d 85            	popw	x
1441  000e 81            	ret
1489                     ; 566 void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1489                     ; 567 {
1490                     .text:	section	.text,new
1491  0000               _USART_HalfDuplexCmd:
1493  0000 89            	pushw	x
1494       00000000      OFST:	set	0
1497                     ; 568   assert_param(IS_FUNCTIONAL_STATE(NewState));
1499                     ; 570   if (NewState != DISABLE)
1501  0001 0d05          	tnz	(OFST+5,sp)
1502  0003 2708          	jreq	L507
1503                     ; 572     USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
1505  0005 e608          	ld	a,(8,x)
1506  0007 aa08          	or	a,#8
1507  0009 e708          	ld	(8,x),a
1509  000b 2008          	jra	L707
1510  000d               L507:
1511                     ; 576     USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
1513  000d 1e01          	ldw	x,(OFST+1,sp)
1514  000f e608          	ld	a,(8,x)
1515  0011 a4f7          	and	a,#247
1516  0013 e708          	ld	(8,x),a
1517  0015               L707:
1518                     ; 578 }
1521  0015 85            	popw	x
1522  0016 81            	ret
1569                     ; 644 void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1569                     ; 645 {
1570                     .text:	section	.text,new
1571  0000               _USART_SmartCardCmd:
1573  0000 89            	pushw	x
1574       00000000      OFST:	set	0
1577                     ; 646   assert_param(IS_FUNCTIONAL_STATE(NewState));
1579                     ; 648   if (NewState != DISABLE)
1581  0001 0d05          	tnz	(OFST+5,sp)
1582  0003 2708          	jreq	L537
1583                     ; 651     USARTx->CR5 |= USART_CR5_SCEN;
1585  0005 e608          	ld	a,(8,x)
1586  0007 aa20          	or	a,#32
1587  0009 e708          	ld	(8,x),a
1589  000b 2008          	jra	L737
1590  000d               L537:
1591                     ; 656     USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
1593  000d 1e01          	ldw	x,(OFST+1,sp)
1594  000f e608          	ld	a,(8,x)
1595  0011 a4df          	and	a,#223
1596  0013 e708          	ld	(8,x),a
1597  0015               L737:
1598                     ; 658 }
1601  0015 85            	popw	x
1602  0016 81            	ret
1650                     ; 667 void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1650                     ; 668 {
1651                     .text:	section	.text,new
1652  0000               _USART_SmartCardNACKCmd:
1654  0000 89            	pushw	x
1655       00000000      OFST:	set	0
1658                     ; 669   assert_param(IS_FUNCTIONAL_STATE(NewState));
1660                     ; 671   if (NewState != DISABLE)
1662  0001 0d05          	tnz	(OFST+5,sp)
1663  0003 2708          	jreq	L567
1664                     ; 674     USARTx->CR5 |= USART_CR5_NACK;
1666  0005 e608          	ld	a,(8,x)
1667  0007 aa10          	or	a,#16
1668  0009 e708          	ld	(8,x),a
1670  000b 2008          	jra	L767
1671  000d               L567:
1672                     ; 679     USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
1674  000d 1e01          	ldw	x,(OFST+1,sp)
1675  000f e608          	ld	a,(8,x)
1676  0011 a4ef          	and	a,#239
1677  0013 e708          	ld	(8,x),a
1678  0015               L767:
1679                     ; 681 }
1682  0015 85            	popw	x
1683  0016 81            	ret
1729                     ; 690 void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
1729                     ; 691 {
1730                     .text:	section	.text,new
1731  0000               _USART_SetGuardTime:
1733  0000 89            	pushw	x
1734       00000000      OFST:	set	0
1737                     ; 693   USARTx->GTR = USART_GuardTime;
1739  0001 7b05          	ld	a,(OFST+5,sp)
1740  0003 1e01          	ldw	x,(OFST+1,sp)
1741  0005 e709          	ld	(9,x),a
1742                     ; 694 }
1745  0007 85            	popw	x
1746  0008 81            	ret
1815                     ; 751 void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
1815                     ; 752 {
1816                     .text:	section	.text,new
1817  0000               _USART_IrDAConfig:
1819  0000 89            	pushw	x
1820       00000000      OFST:	set	0
1823                     ; 753   assert_param(IS_USART_IRDAMODE(USART_IrDAMode));
1825                     ; 755   if (USART_IrDAMode != USART_IrDAMode_Normal)
1827  0001 0d05          	tnz	(OFST+5,sp)
1828  0003 2708          	jreq	L1501
1829                     ; 757     USARTx->CR5 |= USART_CR5_IRLP;
1831  0005 e608          	ld	a,(8,x)
1832  0007 aa04          	or	a,#4
1833  0009 e708          	ld	(8,x),a
1835  000b 2008          	jra	L3501
1836  000d               L1501:
1837                     ; 761     USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
1839  000d 1e01          	ldw	x,(OFST+1,sp)
1840  000f e608          	ld	a,(8,x)
1841  0011 a4fb          	and	a,#251
1842  0013 e708          	ld	(8,x),a
1843  0015               L3501:
1844                     ; 763 }
1847  0015 85            	popw	x
1848  0016 81            	ret
1895                     ; 772 void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
1895                     ; 773 {
1896                     .text:	section	.text,new
1897  0000               _USART_IrDACmd:
1899  0000 89            	pushw	x
1900       00000000      OFST:	set	0
1903                     ; 776   assert_param(IS_FUNCTIONAL_STATE(NewState));
1905                     ; 778   if (NewState != DISABLE)
1907  0001 0d05          	tnz	(OFST+5,sp)
1908  0003 2708          	jreq	L1011
1909                     ; 781     USARTx->CR5 |= USART_CR5_IREN;
1911  0005 e608          	ld	a,(8,x)
1912  0007 aa02          	or	a,#2
1913  0009 e708          	ld	(8,x),a
1915  000b 2008          	jra	L3011
1916  000d               L1011:
1917                     ; 786     USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
1919  000d 1e01          	ldw	x,(OFST+1,sp)
1920  000f e608          	ld	a,(8,x)
1921  0011 a4fd          	and	a,#253
1922  0013 e708          	ld	(8,x),a
1923  0015               L3011:
1924                     ; 788 }
1927  0015 85            	popw	x
1928  0016 81            	ret
2005                     ; 818 void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
2005                     ; 819                   FunctionalState NewState)
2005                     ; 820 {
2006                     .text:	section	.text,new
2007  0000               _USART_DMACmd:
2009  0000 89            	pushw	x
2010       00000000      OFST:	set	0
2013                     ; 822   assert_param(IS_USART_DMAREQ(USART_DMAReq));
2015                     ; 823   assert_param(IS_FUNCTIONAL_STATE(NewState));
2017                     ; 825   if (NewState != DISABLE)
2019  0001 0d06          	tnz	(OFST+6,sp)
2020  0003 2708          	jreq	L5411
2021                     ; 829     USARTx->CR5 |= (uint8_t) USART_DMAReq;
2023  0005 e608          	ld	a,(8,x)
2024  0007 1a05          	or	a,(OFST+5,sp)
2025  0009 e708          	ld	(8,x),a
2027  000b 2009          	jra	L7411
2028  000d               L5411:
2029                     ; 835     USARTx->CR5 &= (uint8_t)~USART_DMAReq;
2031  000d 1e01          	ldw	x,(OFST+1,sp)
2032  000f 7b05          	ld	a,(OFST+5,sp)
2033  0011 43            	cpl	a
2034  0012 e408          	and	a,(8,x)
2035  0014 e708          	ld	(8,x),a
2036  0016               L7411:
2037                     ; 837 }
2040  0016 85            	popw	x
2041  0017 81            	ret
2185                     ; 939 void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
2185                     ; 940 {
2186                     .text:	section	.text,new
2187  0000               _USART_ITConfig:
2189  0000 89            	pushw	x
2190  0001 89            	pushw	x
2191       00000002      OFST:	set	2
2194                     ; 941   uint8_t usartreg, itpos = 0x00;
2196                     ; 942   assert_param(IS_USART_CONFIG_IT(USART_IT));
2198                     ; 943   assert_param(IS_FUNCTIONAL_STATE(NewState));
2200                     ; 946   usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
2202  0002 7b07          	ld	a,(OFST+5,sp)
2203  0004 6b01          	ld	(OFST-1,sp),a
2205                     ; 948   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2207  0006 7b08          	ld	a,(OFST+6,sp)
2208  0008 a40f          	and	a,#15
2209  000a 5f            	clrw	x
2210  000b 97            	ld	xl,a
2211  000c a601          	ld	a,#1
2212  000e 5d            	tnzw	x
2213  000f 2704          	jreq	L65
2214  0011               L06:
2215  0011 48            	sll	a
2216  0012 5a            	decw	x
2217  0013 26fc          	jrne	L06
2218  0015               L65:
2219  0015 6b02          	ld	(OFST+0,sp),a
2221                     ; 950   if (NewState != DISABLE)
2223  0017 0d09          	tnz	(OFST+7,sp)
2224  0019 272a          	jreq	L7321
2225                     ; 953     if (usartreg == 0x01)
2227  001b 7b01          	ld	a,(OFST-1,sp)
2228  001d a101          	cp	a,#1
2229  001f 260a          	jrne	L1421
2230                     ; 955       USARTx->CR1 |= itpos;
2232  0021 1e03          	ldw	x,(OFST+1,sp)
2233  0023 e604          	ld	a,(4,x)
2234  0025 1a02          	or	a,(OFST+0,sp)
2235  0027 e704          	ld	(4,x),a
2237  0029 2045          	jra	L1521
2238  002b               L1421:
2239                     ; 957     else if (usartreg == 0x05)
2241  002b 7b01          	ld	a,(OFST-1,sp)
2242  002d a105          	cp	a,#5
2243  002f 260a          	jrne	L5421
2244                     ; 959       USARTx->CR5 |= itpos;
2246  0031 1e03          	ldw	x,(OFST+1,sp)
2247  0033 e608          	ld	a,(8,x)
2248  0035 1a02          	or	a,(OFST+0,sp)
2249  0037 e708          	ld	(8,x),a
2251  0039 2035          	jra	L1521
2252  003b               L5421:
2253                     ; 964       USARTx->CR2 |= itpos;
2255  003b 1e03          	ldw	x,(OFST+1,sp)
2256  003d e605          	ld	a,(5,x)
2257  003f 1a02          	or	a,(OFST+0,sp)
2258  0041 e705          	ld	(5,x),a
2259  0043 202b          	jra	L1521
2260  0045               L7321:
2261                     ; 970     if (usartreg == 0x01)
2263  0045 7b01          	ld	a,(OFST-1,sp)
2264  0047 a101          	cp	a,#1
2265  0049 260b          	jrne	L3521
2266                     ; 972       USARTx->CR1 &= (uint8_t)(~itpos);
2268  004b 1e03          	ldw	x,(OFST+1,sp)
2269  004d 7b02          	ld	a,(OFST+0,sp)
2270  004f 43            	cpl	a
2271  0050 e404          	and	a,(4,x)
2272  0052 e704          	ld	(4,x),a
2274  0054 201a          	jra	L1521
2275  0056               L3521:
2276                     ; 974     else if (usartreg == 0x05)
2278  0056 7b01          	ld	a,(OFST-1,sp)
2279  0058 a105          	cp	a,#5
2280  005a 260b          	jrne	L7521
2281                     ; 976       USARTx->CR5 &= (uint8_t)(~itpos);
2283  005c 1e03          	ldw	x,(OFST+1,sp)
2284  005e 7b02          	ld	a,(OFST+0,sp)
2285  0060 43            	cpl	a
2286  0061 e408          	and	a,(8,x)
2287  0063 e708          	ld	(8,x),a
2289  0065 2009          	jra	L1521
2290  0067               L7521:
2291                     ; 981       USARTx->CR2 &= (uint8_t)(~itpos);
2293  0067 1e03          	ldw	x,(OFST+1,sp)
2294  0069 7b02          	ld	a,(OFST+0,sp)
2295  006b 43            	cpl	a
2296  006c e405          	and	a,(5,x)
2297  006e e705          	ld	(5,x),a
2298  0070               L1521:
2299                     ; 984 }
2302  0070 5b04          	addw	sp,#4
2303  0072 81            	ret
2451                     ; 1002 FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2451                     ; 1003 {
2452                     .text:	section	.text,new
2453  0000               _USART_GetFlagStatus:
2455  0000 89            	pushw	x
2456  0001 88            	push	a
2457       00000001      OFST:	set	1
2460                     ; 1004   FlagStatus status = RESET;
2462                     ; 1007   assert_param(IS_USART_FLAG(USART_FLAG));
2464                     ; 1009   if (USART_FLAG == USART_FLAG_SBK)
2466  0002 1e06          	ldw	x,(OFST+5,sp)
2467  0004 a30101        	cpw	x,#257
2468  0007 2612          	jrne	L1531
2469                     ; 1011     if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2471  0009 1e02          	ldw	x,(OFST+1,sp)
2472  000b e605          	ld	a,(5,x)
2473  000d 1507          	bcp	a,(OFST+6,sp)
2474  000f 2706          	jreq	L3531
2475                     ; 1014       status = SET;
2477  0011 a601          	ld	a,#1
2478  0013 6b01          	ld	(OFST+0,sp),a
2481  0015 2013          	jra	L7531
2482  0017               L3531:
2483                     ; 1019       status = RESET;
2485  0017 0f01          	clr	(OFST+0,sp)
2487  0019 200f          	jra	L7531
2488  001b               L1531:
2489                     ; 1024     if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2491  001b 1e02          	ldw	x,(OFST+1,sp)
2492  001d f6            	ld	a,(x)
2493  001e 1507          	bcp	a,(OFST+6,sp)
2494  0020 2706          	jreq	L1631
2495                     ; 1027       status = SET;
2497  0022 a601          	ld	a,#1
2498  0024 6b01          	ld	(OFST+0,sp),a
2501  0026 2002          	jra	L7531
2502  0028               L1631:
2503                     ; 1032       status = RESET;
2505  0028 0f01          	clr	(OFST+0,sp)
2507  002a               L7531:
2508                     ; 1036   return status;
2510  002a 7b01          	ld	a,(OFST+0,sp)
2513  002c 5b03          	addw	sp,#3
2514  002e 81            	ret
2561                     ; 1060 void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2561                     ; 1061 {
2562                     .text:	section	.text,new
2563  0000               _USART_ClearFlag:
2565  0000 89            	pushw	x
2566       00000000      OFST:	set	0
2569                     ; 1063   assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));
2571                     ; 1065   USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
2573  0001 7b06          	ld	a,(OFST+6,sp)
2574  0003 43            	cpl	a
2575  0004 1e01          	ldw	x,(OFST+1,sp)
2576  0006 f7            	ld	(x),a
2577                     ; 1066 }
2580  0007 85            	popw	x
2581  0008 81            	ret
2684                     ; 1083 ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2684                     ; 1084 {
2685                     .text:	section	.text,new
2686  0000               _USART_GetITStatus:
2688  0000 89            	pushw	x
2689  0001 5203          	subw	sp,#3
2690       00000003      OFST:	set	3
2693                     ; 1085   ITStatus pendingbitstatus = RESET;
2695                     ; 1086   uint8_t temp = 0;
2697                     ; 1087   uint8_t itpos = 0;
2699                     ; 1088   uint8_t itmask1 = 0;
2701                     ; 1089   uint8_t itmask2 = 0;
2703                     ; 1090   uint8_t enablestatus = 0;
2705                     ; 1093   assert_param(IS_USART_GET_IT(USART_IT));
2707                     ; 1096   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2709  0003 7b09          	ld	a,(OFST+6,sp)
2710  0005 a40f          	and	a,#15
2711  0007 5f            	clrw	x
2712  0008 97            	ld	xl,a
2713  0009 a601          	ld	a,#1
2714  000b 5d            	tnzw	x
2715  000c 2704          	jreq	L07
2716  000e               L27:
2717  000e 48            	sll	a
2718  000f 5a            	decw	x
2719  0010 26fc          	jrne	L27
2720  0012               L07:
2721  0012 6b02          	ld	(OFST-1,sp),a
2723                     ; 1098   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
2725  0014 7b09          	ld	a,(OFST+6,sp)
2726  0016 4e            	swap	a
2727  0017 a40f          	and	a,#15
2728  0019 6b03          	ld	(OFST+0,sp),a
2730                     ; 1100   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2732  001b 7b03          	ld	a,(OFST+0,sp)
2733  001d 5f            	clrw	x
2734  001e 97            	ld	xl,a
2735  001f a601          	ld	a,#1
2736  0021 5d            	tnzw	x
2737  0022 2704          	jreq	L47
2738  0024               L67:
2739  0024 48            	sll	a
2740  0025 5a            	decw	x
2741  0026 26fc          	jrne	L67
2742  0028               L47:
2743  0028 6b03          	ld	(OFST+0,sp),a
2745                     ; 1103   if (USART_IT == USART_IT_PE)
2747  002a 1e08          	ldw	x,(OFST+5,sp)
2748  002c a30100        	cpw	x,#256
2749  002f 261d          	jrne	L5641
2750                     ; 1106     enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
2752  0031 1e04          	ldw	x,(OFST+1,sp)
2753  0033 e604          	ld	a,(4,x)
2754  0035 1403          	and	a,(OFST+0,sp)
2755  0037 6b03          	ld	(OFST+0,sp),a
2757                     ; 1109     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2759  0039 1e04          	ldw	x,(OFST+1,sp)
2760  003b f6            	ld	a,(x)
2761  003c 1502          	bcp	a,(OFST-1,sp)
2762  003e 270a          	jreq	L7641
2764  0040 0d03          	tnz	(OFST+0,sp)
2765  0042 2706          	jreq	L7641
2766                     ; 1112       pendingbitstatus = SET;
2768  0044 a601          	ld	a,#1
2769  0046 6b03          	ld	(OFST+0,sp),a
2772  0048 204f          	jra	L3741
2773  004a               L7641:
2774                     ; 1117       pendingbitstatus = RESET;
2776  004a 0f03          	clr	(OFST+0,sp)
2778  004c 204b          	jra	L3741
2779  004e               L5641:
2780                     ; 1121   else if (USART_IT == USART_IT_OR)
2782  004e 1e08          	ldw	x,(OFST+5,sp)
2783  0050 a30235        	cpw	x,#565
2784  0053 2629          	jrne	L5741
2785                     ; 1124     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2787  0055 1e04          	ldw	x,(OFST+1,sp)
2788  0057 e605          	ld	a,(5,x)
2789  0059 1403          	and	a,(OFST+0,sp)
2790  005b 6b03          	ld	(OFST+0,sp),a
2792                     ; 1127     temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
2794  005d 1e04          	ldw	x,(OFST+1,sp)
2795  005f e608          	ld	a,(8,x)
2796  0061 a401          	and	a,#1
2797  0063 6b01          	ld	(OFST-2,sp),a
2799                     ; 1129     if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
2801  0065 1e04          	ldw	x,(OFST+1,sp)
2802  0067 f6            	ld	a,(x)
2803  0068 1502          	bcp	a,(OFST-1,sp)
2804  006a 270e          	jreq	L7741
2806  006c 0d03          	tnz	(OFST+0,sp)
2807  006e 2604          	jrne	L1051
2809  0070 0d01          	tnz	(OFST-2,sp)
2810  0072 2706          	jreq	L7741
2811  0074               L1051:
2812                     ; 1132       pendingbitstatus = SET;
2814  0074 a601          	ld	a,#1
2815  0076 6b03          	ld	(OFST+0,sp),a
2818  0078 201f          	jra	L3741
2819  007a               L7741:
2820                     ; 1137       pendingbitstatus = RESET;
2822  007a 0f03          	clr	(OFST+0,sp)
2824  007c 201b          	jra	L3741
2825  007e               L5741:
2826                     ; 1144     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2828  007e 1e04          	ldw	x,(OFST+1,sp)
2829  0080 e605          	ld	a,(5,x)
2830  0082 1403          	and	a,(OFST+0,sp)
2831  0084 6b03          	ld	(OFST+0,sp),a
2833                     ; 1146     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2835  0086 1e04          	ldw	x,(OFST+1,sp)
2836  0088 f6            	ld	a,(x)
2837  0089 1502          	bcp	a,(OFST-1,sp)
2838  008b 270a          	jreq	L7051
2840  008d 0d03          	tnz	(OFST+0,sp)
2841  008f 2706          	jreq	L7051
2842                     ; 1149       pendingbitstatus = SET;
2844  0091 a601          	ld	a,#1
2845  0093 6b03          	ld	(OFST+0,sp),a
2848  0095 2002          	jra	L3741
2849  0097               L7051:
2850                     ; 1154       pendingbitstatus = RESET;
2852  0097 0f03          	clr	(OFST+0,sp)
2854  0099               L3741:
2855                     ; 1159   return  pendingbitstatus;
2857  0099 7b03          	ld	a,(OFST+0,sp)
2860  009b 5b05          	addw	sp,#5
2861  009d 81            	ret
2899                     ; 1183 void USART_ClearITPendingBit(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2899                     ; 1184 {
2900                     .text:	section	.text,new
2901  0000               _USART_ClearITPendingBit:
2905                     ; 1185   assert_param(IS_USART_CLEAR_IT(USART_IT));
2907                     ; 1188   USARTx->SR &= (uint8_t)(~USART_SR_TC);
2909  0000 f6            	ld	a,(x)
2910  0001 a4bf          	and	a,#191
2911  0003 f7            	ld	(x),a
2912                     ; 1189 }
2915  0004 81            	ret
2928                     	xdef	_USART_ClearITPendingBit
2929                     	xdef	_USART_GetITStatus
2930                     	xdef	_USART_ClearFlag
2931                     	xdef	_USART_GetFlagStatus
2932                     	xdef	_USART_ITConfig
2933                     	xdef	_USART_DMACmd
2934                     	xdef	_USART_IrDACmd
2935                     	xdef	_USART_IrDAConfig
2936                     	xdef	_USART_SetGuardTime
2937                     	xdef	_USART_SmartCardNACKCmd
2938                     	xdef	_USART_SmartCardCmd
2939                     	xdef	_USART_HalfDuplexCmd
2940                     	xdef	_USART_SetAddress
2941                     	xdef	_USART_ReceiverWakeUpCmd
2942                     	xdef	_USART_WakeUpConfig
2943                     	xdef	_USART_ReceiveData9
2944                     	xdef	_USART_ReceiveData8
2945                     	xdef	_USART_SendData9
2946                     	xdef	_USART_SendData8
2947                     	xdef	_USART_SendBreak
2948                     	xdef	_USART_SetPrescaler
2949                     	xdef	_USART_Cmd
2950                     	xdef	_USART_ClockInit
2951                     	xdef	_USART_Init
2952                     	xdef	_USART_DeInit
2953                     	xref	_CLK_GetClockFreq
2954                     	xref.b	c_lreg
2955                     	xref.b	c_x
2974                     	xref	c_lursh
2975                     	xref	c_ltor
2976                     	xref	c_rtol
2977                     	xref	c_ludv
2978                     	end
