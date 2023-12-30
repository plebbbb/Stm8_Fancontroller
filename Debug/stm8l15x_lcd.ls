   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  54                     ; 121 void LCD_DeInit(void)
  54                     ; 122 {
  56                     .text:	section	.text,new
  57  0000               _LCD_DeInit:
  59  0000 88            	push	a
  60       00000001      OFST:	set	1
  63                     ; 123   uint8_t counter = 0;
  65                     ; 125   LCD->CR1 = LCD_CR1_RESET_VALUE;
  67  0001 725f5400      	clr	21504
  68                     ; 126   LCD->CR2 = LCD_CR2_RESET_VALUE;
  70  0005 725f5401      	clr	21505
  71                     ; 127   LCD->CR3 = LCD_CR3_RESET_VALUE;
  73  0009 725f5402      	clr	21506
  74                     ; 128   LCD->FRQ = LCD_FRQ_RESET_VALUE;
  76  000d 725f5403      	clr	21507
  77                     ; 130   for (counter = 0;counter < 0x05; counter++)
  79  0011 0f01          	clr	(OFST+0,sp)
  81  0013               L72:
  82                     ; 132     LCD->PM[counter] = LCD_PM_RESET_VALUE;
  84  0013 7b01          	ld	a,(OFST+0,sp)
  85  0015 5f            	clrw	x
  86  0016 97            	ld	xl,a
  87  0017 724f5404      	clr	(21508,x)
  88                     ; 130   for (counter = 0;counter < 0x05; counter++)
  90  001b 0c01          	inc	(OFST+0,sp)
  94  001d 7b01          	ld	a,(OFST+0,sp)
  95  001f a105          	cp	a,#5
  96  0021 25f0          	jrult	L72
  97                     ; 135   for (counter = 0;counter < 0x16; counter++)
  99  0023 0f01          	clr	(OFST+0,sp)
 101  0025               L53:
 102                     ; 137     LCD->RAM[counter] =  LCD_RAM_RESET_VALUE;
 104  0025 7b01          	ld	a,(OFST+0,sp)
 105  0027 5f            	clrw	x
 106  0028 97            	ld	xl,a
 107  0029 724f540c      	clr	(21516,x)
 108                     ; 135   for (counter = 0;counter < 0x16; counter++)
 110  002d 0c01          	inc	(OFST+0,sp)
 114  002f 7b01          	ld	a,(OFST+0,sp)
 115  0031 a116          	cp	a,#22
 116  0033 25f0          	jrult	L53
 117                     ; 140   LCD->CR4 = LCD_CR4_RESET_VALUE;
 119  0035 725f542f      	clr	21551
 120                     ; 142 }
 123  0039 84            	pop	a
 124  003a 81            	ret
 527                     ; 200 void LCD_Init(LCD_Prescaler_TypeDef LCD_Prescaler, LCD_Divider_TypeDef LCD_Divider,
 527                     ; 201               LCD_Duty_TypeDef LCD_Duty, LCD_Bias_TypeDef LCD_Bias,
 527                     ; 202               LCD_VoltageSource_TypeDef LCD_VoltageSource)
 527                     ; 203 {
 528                     .text:	section	.text,new
 529  0000               _LCD_Init:
 531  0000 89            	pushw	x
 532       00000000      OFST:	set	0
 535                     ; 205   assert_param(IS_LCD_CLOCK_PRESCALER(LCD_Prescaler));
 537                     ; 206   assert_param(IS_LCD_CLOCK_DIVIDER(LCD_Divider));
 539                     ; 207   assert_param(IS_LCD_DUTY(LCD_Duty));
 541                     ; 208   assert_param(IS_LCD_BIAS(LCD_Bias));
 543                     ; 209   assert_param(IS_LCD_VOLTAGE_SOURCE(LCD_VoltageSource));
 545                     ; 211   LCD->FRQ &= (uint8_t)(~LCD_FRQ_PS);     /* Clear the prescaler bits */
 547  0001 c65403        	ld	a,21507
 548  0004 a40f          	and	a,#15
 549  0006 c75403        	ld	21507,a
 550                     ; 212   LCD->FRQ |= LCD_Prescaler;
 552  0009 9e            	ld	a,xh
 553  000a ca5403        	or	a,21507
 554  000d c75403        	ld	21507,a
 555                     ; 214   LCD->FRQ &= (uint8_t)(~LCD_FRQ_DIV);     /* Clear the divider bits */
 557  0010 c65403        	ld	a,21507
 558  0013 a4f0          	and	a,#240
 559  0015 c75403        	ld	21507,a
 560                     ; 215   LCD->FRQ |= LCD_Divider;
 562  0018 9f            	ld	a,xl
 563  0019 ca5403        	or	a,21507
 564  001c c75403        	ld	21507,a
 565                     ; 218   LCD->CR1 &= (uint8_t)(~LCD_CR1_DUTY);    /* Clear the duty bits */
 567  001f c65400        	ld	a,21504
 568  0022 a4f9          	and	a,#249
 569  0024 c75400        	ld	21504,a
 570                     ; 219   LCD->CR4 &= (uint8_t)(~LCD_CR4_DUTY8);   /* Clear the DUTY8 bit */
 572  0027 7213542f      	bres	21551,#1
 573                     ; 221   if (LCD_Duty == LCD_Duty_1_8)
 575  002b 7b05          	ld	a,(OFST+5,sp)
 576  002d a120          	cp	a,#32
 577  002f 260f          	jrne	L152
 578                     ; 223     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Duty & (uint8_t)0xF0) >> 4);
 580  0031 7b05          	ld	a,(OFST+5,sp)
 581  0033 a4f0          	and	a,#240
 582  0035 4e            	swap	a
 583  0036 a40f          	and	a,#15
 584  0038 ca542f        	or	a,21551
 585  003b c7542f        	ld	21551,a
 587  003e 200a          	jra	L352
 588  0040               L152:
 589                     ; 227     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Duty & (uint8_t)0x0F);
 591  0040 7b05          	ld	a,(OFST+5,sp)
 592  0042 a40f          	and	a,#15
 593  0044 ca5400        	or	a,21504
 594  0047 c75400        	ld	21504,a
 595  004a               L352:
 596                     ; 231   LCD->CR1 &= (uint8_t)(~LCD_CR1_B2);      /* Clear the B2 bit */
 598  004a 72115400      	bres	21504,#0
 599                     ; 232   LCD->CR4 &= (uint8_t)(~LCD_CR4_B4);      /* Clear the B4 bit */
 601  004e 7211542f      	bres	21551,#0
 602                     ; 234   if (LCD_Bias == LCD_Bias_1_4)
 604  0052 7b06          	ld	a,(OFST+6,sp)
 605  0054 a110          	cp	a,#16
 606  0056 2619          	jrne	L552
 607                     ; 236     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 609  0058 7b06          	ld	a,(OFST+6,sp)
 610  005a a40f          	and	a,#15
 611  005c ca5400        	or	a,21504
 612  005f c75400        	ld	21504,a
 613                     ; 237     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Bias & (uint8_t)0xF0) >> 4);
 615  0062 7b06          	ld	a,(OFST+6,sp)
 616  0064 a4f0          	and	a,#240
 617  0066 4e            	swap	a
 618  0067 a40f          	and	a,#15
 619  0069 ca542f        	or	a,21551
 620  006c c7542f        	ld	21551,a
 622  006f 200a          	jra	L752
 623  0071               L552:
 624                     ; 241     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 626  0071 7b06          	ld	a,(OFST+6,sp)
 627  0073 a40f          	and	a,#15
 628  0075 ca5400        	or	a,21504
 629  0078 c75400        	ld	21504,a
 630  007b               L752:
 631                     ; 244   LCD->CR2 &= (uint8_t)(~LCD_CR2_VSEL);    /* Clear the voltage source bit */
 633  007b 72115401      	bres	21505,#0
 634                     ; 245   LCD->CR2 |= LCD_VoltageSource;
 636  007f c65401        	ld	a,21505
 637  0082 1a07          	or	a,(OFST+7,sp)
 638  0084 c75401        	ld	21505,a
 639                     ; 247 }
 642  0087 85            	popw	x
 643  0088 81            	ret
 742                     ; 262 void LCD_PortMaskConfig(LCD_PortMaskRegister_TypeDef LCD_PortMaskRegister, uint8_t LCD_Mask)
 742                     ; 263 {
 743                     .text:	section	.text,new
 744  0000               _LCD_PortMaskConfig:
 746  0000 89            	pushw	x
 747       00000000      OFST:	set	0
 750                     ; 265   assert_param(IS_LCD_PORT_MASK(LCD_PortMaskRegister));
 752                     ; 268   LCD->PM[LCD_PortMaskRegister] =  LCD_Mask;
 754  0001 9e            	ld	a,xh
 755  0002 5f            	clrw	x
 756  0003 97            	ld	xl,a
 757  0004 7b02          	ld	a,(OFST+2,sp)
 758  0006 d75404        	ld	(21508,x),a
 759                     ; 270 }
 762  0009 85            	popw	x
 763  000a 81            	ret
 818                     ; 279 void LCD_Cmd(FunctionalState NewState)
 818                     ; 280 {
 819                     .text:	section	.text,new
 820  0000               _LCD_Cmd:
 824                     ; 282   assert_param(IS_FUNCTIONAL_STATE(NewState));
 826                     ; 284   if (NewState != DISABLE)
 828  0000 4d            	tnz	a
 829  0001 2706          	jreq	L153
 830                     ; 286     LCD->CR3 |= LCD_CR3_LCDEN; /* Enable the LCD peripheral*/
 832  0003 721c5402      	bset	21506,#6
 834  0007 2004          	jra	L353
 835  0009               L153:
 836                     ; 290     LCD->CR3 &= (uint8_t)(~LCD_CR3_LCDEN); /* Disable the LCD peripheral*/
 838  0009 721d5402      	bres	21506,#6
 839  000d               L353:
 840                     ; 292 }
 843  000d 81            	ret
 878                     ; 305 void LCD_HighDriveCmd(FunctionalState NewState)
 878                     ; 306 {
 879                     .text:	section	.text,new
 880  0000               _LCD_HighDriveCmd:
 884                     ; 308   assert_param(IS_FUNCTIONAL_STATE(NewState));
 886                     ; 310   if (NewState != DISABLE)
 888  0000 4d            	tnz	a
 889  0001 2706          	jreq	L373
 890                     ; 312     LCD->CR2 |= LCD_CR2_HD; /* Permanently enable low resistance divider */
 892  0003 72185401      	bset	21505,#4
 894  0007 2004          	jra	L573
 895  0009               L373:
 896                     ; 316     LCD->CR2 &= (uint8_t)(~LCD_CR2_HD); /* Permanently disable low resistance divider */
 898  0009 72195401      	bres	21505,#4
 899  000d               L573:
 900                     ; 318 }
 903  000d 81            	ret
1010                     ; 335 void LCD_PulseOnDurationConfig(LCD_PulseOnDuration_TypeDef LCD_PulseOnDuration)
1010                     ; 336 {
1011                     .text:	section	.text,new
1012  0000               _LCD_PulseOnDurationConfig:
1014  0000 88            	push	a
1015       00000000      OFST:	set	0
1018                     ; 338   assert_param(IS_LCD_PULSE_DURATION(LCD_PulseOnDuration));
1020                     ; 340   LCD->CR2 &= (uint8_t)(~LCD_CR2_PON); /* Clear the pulses on duration bits */
1022  0001 c65401        	ld	a,21505
1023  0004 a41f          	and	a,#31
1024  0006 c75401        	ld	21505,a
1025                     ; 341   LCD->CR2 |= LCD_PulseOnDuration;
1027  0009 c65401        	ld	a,21505
1028  000c 1a01          	or	a,(OFST+1,sp)
1029  000e c75401        	ld	21505,a
1030                     ; 342 }
1033  0011 84            	pop	a
1034  0012 81            	ret
1131                     ; 358 void LCD_DeadTimeConfig(LCD_DeadTime_TypeDef LCD_DeadTime)
1131                     ; 359 {
1132                     .text:	section	.text,new
1133  0000               _LCD_DeadTimeConfig:
1135  0000 88            	push	a
1136       00000000      OFST:	set	0
1139                     ; 361   assert_param(IS_LCD_DEAD_TIME(LCD_DeadTime));
1141                     ; 363   LCD->CR3 &= (uint8_t)(~LCD_CR3_DEAD);  /* Clear the dead time bits  */
1143  0001 c65402        	ld	a,21506
1144  0004 a4f8          	and	a,#248
1145  0006 c75402        	ld	21506,a
1146                     ; 365   LCD->CR3 |= LCD_DeadTime;
1148  0009 c65402        	ld	a,21506
1149  000c 1a01          	or	a,(OFST+1,sp)
1150  000e c75402        	ld	21506,a
1151                     ; 367 }
1154  0011 84            	pop	a
1155  0012 81            	ret
1307                     ; 391 void LCD_BlinkConfig(LCD_BlinkMode_TypeDef LCD_BlinkMode, LCD_BlinkFrequency_TypeDef LCD_BlinkFrequency)
1307                     ; 392 {
1308                     .text:	section	.text,new
1309  0000               _LCD_BlinkConfig:
1313                     ; 394   assert_param(IS_LCD_BLINK_MODE(LCD_BlinkMode));
1315                     ; 395   assert_param(IS_LCD_BLINK_FREQUENCY(LCD_BlinkFrequency));
1317                     ; 397   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINK); /* Clear the blink mode bits */
1319  0000 c65400        	ld	a,21504
1320  0003 a43f          	and	a,#63
1321  0005 c75400        	ld	21504,a
1322                     ; 398   LCD->CR1 |= LCD_BlinkMode; /* Config the LCD Blink Mode */
1324  0008 9e            	ld	a,xh
1325  0009 ca5400        	or	a,21504
1326  000c c75400        	ld	21504,a
1327                     ; 400   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINKF); /* Clear the blink frequency bits */
1329  000f c65400        	ld	a,21504
1330  0012 a4c7          	and	a,#199
1331  0014 c75400        	ld	21504,a
1332                     ; 401   LCD->CR1 |= LCD_BlinkFrequency; /* Config the LCD Blink Frequency */
1334  0017 9f            	ld	a,xl
1335  0018 ca5400        	or	a,21504
1336  001b c75400        	ld	21504,a
1337                     ; 403 }
1340  001e 81            	ret
1445                     ; 419 void LCD_ContrastConfig(LCD_Contrast_TypeDef LCD_Contrast)
1445                     ; 420 {
1446                     .text:	section	.text,new
1447  0000               _LCD_ContrastConfig:
1449  0000 88            	push	a
1450       00000000      OFST:	set	0
1453                     ; 422   assert_param(IS_LCD_CONTRAST(LCD_Contrast));
1455                     ; 424   LCD->CR2 &= (uint8_t)(~LCD_CR2_CC); /* Clear the contrast bits  */
1457  0001 c65401        	ld	a,21505
1458  0004 a4f1          	and	a,#241
1459  0006 c75401        	ld	21505,a
1460                     ; 425   LCD->CR2 |= LCD_Contrast; /* Select the maximum voltage value Vlcd */
1462  0009 c65401        	ld	a,21505
1463  000c 1a01          	or	a,(OFST+1,sp)
1464  000e c75401        	ld	21505,a
1465                     ; 427 }
1468  0011 84            	pop	a
1469  0012 81            	ret
1673                     ; 474 void LCD_WriteRAM(LCD_RAMRegister_TypeDef LCD_RAMRegister, uint8_t LCD_Data)
1673                     ; 475 {
1674                     .text:	section	.text,new
1675  0000               _LCD_WriteRAM:
1677  0000 89            	pushw	x
1678       00000000      OFST:	set	0
1681                     ; 477   assert_param(IS_LCD_RAM_REGISTER(LCD_RAMRegister));
1683                     ; 480   LCD->RAM[LCD_RAMRegister] =  LCD_Data;
1685  0001 9e            	ld	a,xh
1686  0002 5f            	clrw	x
1687  0003 97            	ld	xl,a
1688  0004 7b02          	ld	a,(OFST+2,sp)
1689  0006 d7540c        	ld	(21516,x),a
1690                     ; 482 }
1693  0009 85            	popw	x
1694  000a 81            	ret
1751                     ; 492 void LCD_PageSelect(LCD_PageSelection_TypeDef LCD_PageSelection)
1751                     ; 493 {
1752                     .text:	section	.text,new
1753  0000               _LCD_PageSelect:
1757                     ; 495   assert_param(IS_LCD_PAGE_SELECT(LCD_PageSelection));
1759                     ; 497   LCD->CR4 &= (uint8_t)(~LCD_CR4_PAGECOM); /* Clear the PAGE COM bit */
1761  0000 7215542f      	bres	21551,#2
1762                     ; 498   LCD->CR4 |= LCD_PageSelection; /* Select the LCD page */
1764  0004 ca542f        	or	a,21551
1765  0007 c7542f        	ld	21551,a
1766                     ; 500 }
1769  000a 81            	ret
1804                     ; 525 void LCD_ITConfig(FunctionalState NewState)
1804                     ; 526 {
1805                     .text:	section	.text,new
1806  0000               _LCD_ITConfig:
1810                     ; 528   assert_param(IS_FUNCTIONAL_STATE(NewState));
1812                     ; 530   if (NewState != DISABLE)
1814  0000 4d            	tnz	a
1815  0001 2706          	jreq	L577
1816                     ; 532     LCD->CR3 |= LCD_CR3_SOFIE; /* Enable interrupt*/
1818  0003 721a5402      	bset	21506,#5
1820  0007 2004          	jra	L777
1821  0009               L577:
1822                     ; 536     LCD->CR3 &= (uint8_t)(~LCD_CR3_SOFIE); /* Disable interrupt*/
1824  0009 721b5402      	bres	21506,#5
1825  000d               L777:
1826                     ; 539 }
1829  000d 81            	ret
1885                     ; 546 FlagStatus LCD_GetFlagStatus(void)
1885                     ; 547 {
1886                     .text:	section	.text,new
1887  0000               _LCD_GetFlagStatus:
1889  0000 88            	push	a
1890       00000001      OFST:	set	1
1893                     ; 548   FlagStatus status = RESET;
1895                     ; 551   if ((LCD->CR3 & (uint8_t)LCD_CR3_SOF) != (uint8_t)RESET)
1897  0001 c65402        	ld	a,21506
1898  0004 a510          	bcp	a,#16
1899  0006 2706          	jreq	L7201
1900                     ; 553     status = SET; /* Flag is set */
1902  0008 a601          	ld	a,#1
1903  000a 6b01          	ld	(OFST+0,sp),a
1906  000c 2002          	jra	L1301
1907  000e               L7201:
1908                     ; 557     status = RESET; /* Flag is reset*/
1910  000e 0f01          	clr	(OFST+0,sp)
1912  0010               L1301:
1913                     ; 560   return status;
1915  0010 7b01          	ld	a,(OFST+0,sp)
1918  0012 5b01          	addw	sp,#1
1919  0014 81            	ret
1942                     ; 569 void LCD_ClearFlag(void)
1942                     ; 570 {
1943                     .text:	section	.text,new
1944  0000               _LCD_ClearFlag:
1948                     ; 572   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
1950  0000 72165402      	bset	21506,#3
1951                     ; 574 }
1954  0004 81            	ret
1999                     ; 582 ITStatus LCD_GetITStatus(void)
1999                     ; 583 {
2000                     .text:	section	.text,new
2001  0000               _LCD_GetITStatus:
2003  0000 88            	push	a
2004       00000001      OFST:	set	1
2007                     ; 584   ITStatus pendingbitstatus = RESET;
2009                     ; 585   uint8_t enablestatus = 0;
2011                     ; 587   enablestatus = (uint8_t)((uint8_t)LCD->CR3 & LCD_CR3_SOFIE);
2013  0001 c65402        	ld	a,21506
2014  0004 a420          	and	a,#32
2015  0006 6b01          	ld	(OFST+0,sp),a
2017                     ; 589   if (((LCD->CR3 & LCD_CR3_SOF) != RESET) && enablestatus)
2019  0008 c65402        	ld	a,21506
2020  000b a510          	bcp	a,#16
2021  000d 270a          	jreq	L5601
2023  000f 0d01          	tnz	(OFST+0,sp)
2024  0011 2706          	jreq	L5601
2025                     ; 592     pendingbitstatus = SET;
2027  0013 a601          	ld	a,#1
2028  0015 6b01          	ld	(OFST+0,sp),a
2031  0017 2002          	jra	L7601
2032  0019               L5601:
2033                     ; 597     pendingbitstatus = RESET;
2035  0019 0f01          	clr	(OFST+0,sp)
2037  001b               L7601:
2038                     ; 600   return  pendingbitstatus;
2040  001b 7b01          	ld	a,(OFST+0,sp)
2043  001d 5b01          	addw	sp,#1
2044  001f 81            	ret
2068                     ; 609 void LCD_ClearITPendingBit(void)
2068                     ; 610 {
2069                     .text:	section	.text,new
2070  0000               _LCD_ClearITPendingBit:
2074                     ; 612   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
2076  0000 72165402      	bset	21506,#3
2077                     ; 614 }
2080  0004 81            	ret
2093                     	xdef	_LCD_ClearITPendingBit
2094                     	xdef	_LCD_GetITStatus
2095                     	xdef	_LCD_ClearFlag
2096                     	xdef	_LCD_GetFlagStatus
2097                     	xdef	_LCD_ITConfig
2098                     	xdef	_LCD_PageSelect
2099                     	xdef	_LCD_WriteRAM
2100                     	xdef	_LCD_ContrastConfig
2101                     	xdef	_LCD_BlinkConfig
2102                     	xdef	_LCD_DeadTimeConfig
2103                     	xdef	_LCD_PulseOnDurationConfig
2104                     	xdef	_LCD_HighDriveCmd
2105                     	xdef	_LCD_Cmd
2106                     	xdef	_LCD_PortMaskConfig
2107                     	xdef	_LCD_Init
2108                     	xdef	_LCD_DeInit
2127                     	end
