   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
 173                     ; 135 void ADC_DeInit(ADC_TypeDef* ADCx)
 173                     ; 136 {
 175                     	switch	.text
 176  0000               _ADC_DeInit:
 180                     ; 138   ADCx->CR1 =  ADC_CR1_RESET_VALUE;
 182  0000 7f            	clr	(x)
 183                     ; 139   ADCx->CR2 =  ADC_CR2_RESET_VALUE;
 185  0001 6f01          	clr	(1,x)
 186                     ; 140   ADCx->CR3 =  ADC_CR3_RESET_VALUE;
 188  0003 a61f          	ld	a,#31
 189  0005 e702          	ld	(2,x),a
 190                     ; 143   ADCx->SR =  (uint8_t)~ADC_SR_RESET_VALUE;
 192  0007 a6ff          	ld	a,#255
 193  0009 e703          	ld	(3,x),a
 194                     ; 146   ADCx->HTRH =  ADC_HTRH_RESET_VALUE;
 196  000b a60f          	ld	a,#15
 197  000d e706          	ld	(6,x),a
 198                     ; 147   ADCx->HTRL =  ADC_HTRL_RESET_VALUE;
 200  000f a6ff          	ld	a,#255
 201  0011 e707          	ld	(7,x),a
 202                     ; 150   ADCx->LTRH =  ADC_LTRH_RESET_VALUE;
 204  0013 6f08          	clr	(8,x)
 205                     ; 151   ADCx->LTRL =  ADC_LTRL_RESET_VALUE;
 207  0015 6f09          	clr	(9,x)
 208                     ; 154   ADCx->SQR[0] =  ADC_SQR1_RESET_VALUE;
 210  0017 6f0a          	clr	(10,x)
 211                     ; 155   ADCx->SQR[1] =  ADC_SQR2_RESET_VALUE;
 213  0019 6f0b          	clr	(11,x)
 214                     ; 156   ADCx->SQR[2] =  ADC_SQR3_RESET_VALUE;
 216  001b 6f0c          	clr	(12,x)
 217                     ; 157   ADCx->SQR[3] =  ADC_SQR4_RESET_VALUE;
 219  001d 6f0d          	clr	(13,x)
 220                     ; 160   ADCx->TRIGR[0] =  ADC_TRIGR1_RESET_VALUE;
 222  001f 6f0e          	clr	(14,x)
 223                     ; 161   ADCx->TRIGR[1] =  ADC_TRIGR2_RESET_VALUE;
 225  0021 6f0f          	clr	(15,x)
 226                     ; 162   ADCx->TRIGR[2] =  ADC_TRIGR3_RESET_VALUE;
 228  0023 6f10          	clr	(16,x)
 229                     ; 163   ADCx->TRIGR[3] =  ADC_TRIGR4_RESET_VALUE;
 231  0025 6f11          	clr	(17,x)
 232                     ; 164 }
 235  0027 81            	ret
 382                     ; 186 void ADC_Init(ADC_TypeDef* ADCx,
 382                     ; 187               ADC_ConversionMode_TypeDef ADC_ConversionMode,
 382                     ; 188               ADC_Resolution_TypeDef ADC_Resolution,
 382                     ; 189               ADC_Prescaler_TypeDef ADC_Prescaler)
 382                     ; 190 {
 383                     	switch	.text
 384  0028               _ADC_Init:
 386  0028 89            	pushw	x
 387       00000000      OFST:	set	0
 390                     ; 192   assert_param(IS_ADC_CONVERSION_MODE(ADC_ConversionMode));
 392                     ; 193   assert_param(IS_ADC_RESOLUTION(ADC_Resolution));
 394                     ; 194   assert_param(IS_ADC_PRESCALER(ADC_Prescaler));
 396                     ; 197   ADCx->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);
 398  0029 f6            	ld	a,(x)
 399  002a a49b          	and	a,#155
 400  002c f7            	ld	(x),a
 401                     ; 200   ADCx->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode | (uint8_t)ADC_Resolution);
 403  002d 7b05          	ld	a,(OFST+5,sp)
 404  002f 1a06          	or	a,(OFST+6,sp)
 405  0031 fa            	or	a,(x)
 406  0032 f7            	ld	(x),a
 407                     ; 203   ADCx->CR2 &= (uint8_t)~(ADC_CR2_PRESC);
 409  0033 e601          	ld	a,(1,x)
 410  0035 a47f          	and	a,#127
 411  0037 e701          	ld	(1,x),a
 412                     ; 206   ADCx->CR2 |= (uint8_t) ADC_Prescaler;
 414  0039 e601          	ld	a,(1,x)
 415  003b 1a07          	or	a,(OFST+7,sp)
 416  003d e701          	ld	(1,x),a
 417                     ; 207 }
 420  003f 85            	popw	x
 421  0040 81            	ret
 488                     ; 216 void ADC_Cmd(ADC_TypeDef* ADCx,
 488                     ; 217              FunctionalState NewState)
 488                     ; 218 {
 489                     	switch	.text
 490  0041               _ADC_Cmd:
 492  0041 89            	pushw	x
 493       00000000      OFST:	set	0
 496                     ; 220   assert_param(IS_FUNCTIONAL_STATE(NewState));
 498                     ; 222   if (NewState != DISABLE)
 500  0042 0d05          	tnz	(OFST+5,sp)
 501  0044 2706          	jreq	L142
 502                     ; 225     ADCx->CR1 |= ADC_CR1_ADON;
 504  0046 f6            	ld	a,(x)
 505  0047 aa01          	or	a,#1
 506  0049 f7            	ld	(x),a
 508  004a 2006          	jra	L342
 509  004c               L142:
 510                     ; 230     ADCx->CR1 &= (uint8_t)~ADC_CR1_ADON;
 512  004c 1e01          	ldw	x,(OFST+1,sp)
 513  004e f6            	ld	a,(x)
 514  004f a4fe          	and	a,#254
 515  0051 f7            	ld	(x),a
 516  0052               L342:
 517                     ; 232 }
 520  0052 85            	popw	x
 521  0053 81            	ret
 559                     ; 239 void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
 559                     ; 240 {
 560                     	switch	.text
 561  0054               _ADC_SoftwareStartConv:
 565                     ; 242   ADCx->CR1 |= ADC_CR1_START;
 567  0054 f6            	ld	a,(x)
 568  0055 aa02          	or	a,#2
 569  0057 f7            	ld	(x),a
 570                     ; 243 }
 573  0058 81            	ret
 701                     ; 261 void ADC_ExternalTrigConfig(ADC_TypeDef* ADCx,
 701                     ; 262                             ADC_ExtEventSelection_TypeDef ADC_ExtEventSelection,
 701                     ; 263                             ADC_ExtTRGSensitivity_TypeDef ADC_ExtTRGSensitivity)
 701                     ; 264 {
 702                     	switch	.text
 703  0059               _ADC_ExternalTrigConfig:
 705  0059 89            	pushw	x
 706       00000000      OFST:	set	0
 709                     ; 266   assert_param(IS_ADC_EXT_EVENT_SELECTION(ADC_ExtEventSelection));
 711                     ; 267   assert_param(IS_ADC_EXT_TRG_SENSITIVITY(ADC_ExtTRGSensitivity));
 713                     ; 270   ADCx->CR2 &= (uint8_t)~(ADC_CR2_TRIGEDGE | ADC_CR2_EXTSEL);
 715  005a e601          	ld	a,(1,x)
 716  005c a487          	and	a,#135
 717  005e e701          	ld	(1,x),a
 718                     ; 274   ADCx->CR2 |= (uint8_t)( (uint8_t)ADC_ExtTRGSensitivity | \
 718                     ; 275                           (uint8_t)ADC_ExtEventSelection);
 720  0060 7b06          	ld	a,(OFST+6,sp)
 721  0062 1a05          	or	a,(OFST+5,sp)
 722  0064 ea01          	or	a,(1,x)
 723  0066 e701          	ld	(1,x),a
 724                     ; 276 }
 727  0068 85            	popw	x
 728  0069 81            	ret
1042                     ; 339 void ADC_AnalogWatchdogChannelSelect(ADC_TypeDef* ADCx,
1042                     ; 340                                      ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection)
1042                     ; 341 {
1043                     	switch	.text
1044  006a               _ADC_AnalogWatchdogChannelSelect:
1046  006a 89            	pushw	x
1047       00000000      OFST:	set	0
1050                     ; 343   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1052                     ; 346   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1054  006b e602          	ld	a,(2,x)
1055  006d a4e0          	and	a,#224
1056  006f e702          	ld	(2,x),a
1057                     ; 349   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1059  0071 e602          	ld	a,(2,x)
1060  0073 1a05          	or	a,(OFST+5,sp)
1061  0075 e702          	ld	(2,x),a
1062                     ; 350 }
1065  0077 85            	popw	x
1066  0078 81            	ret
1122                     ; 361 void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, uint16_t HighThreshold, uint16_t LowThreshold)
1122                     ; 362 {
1123                     	switch	.text
1124  0079               _ADC_AnalogWatchdogThresholdsConfig:
1126  0079 89            	pushw	x
1127       00000000      OFST:	set	0
1130                     ; 364   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1132                     ; 365   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1134                     ; 368   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1136  007a 7b05          	ld	a,(OFST+5,sp)
1137  007c 1e01          	ldw	x,(OFST+1,sp)
1138  007e e706          	ld	(6,x),a
1139                     ; 369   ADCx->HTRL = (uint8_t)(HighThreshold);
1141  0080 7b06          	ld	a,(OFST+6,sp)
1142  0082 1e01          	ldw	x,(OFST+1,sp)
1143  0084 e707          	ld	(7,x),a
1144                     ; 372   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1146  0086 7b07          	ld	a,(OFST+7,sp)
1147  0088 1e01          	ldw	x,(OFST+1,sp)
1148  008a e708          	ld	(8,x),a
1149                     ; 373   ADCx->LTRL = (uint8_t)(LowThreshold);
1151  008c 7b08          	ld	a,(OFST+8,sp)
1152  008e 1e01          	ldw	x,(OFST+1,sp)
1153  0090 e709          	ld	(9,x),a
1154                     ; 374 }
1157  0092 85            	popw	x
1158  0093 81            	ret
1225                     ; 412 void ADC_AnalogWatchdogConfig(ADC_TypeDef* ADCx,
1225                     ; 413                               ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection,
1225                     ; 414                               uint16_t HighThreshold,
1225                     ; 415                               uint16_t LowThreshold)
1225                     ; 416 {
1226                     	switch	.text
1227  0094               _ADC_AnalogWatchdogConfig:
1229  0094 89            	pushw	x
1230       00000000      OFST:	set	0
1233                     ; 418   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1235                     ; 419   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1237                     ; 420   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1239                     ; 423   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1241  0095 e602          	ld	a,(2,x)
1242  0097 a4e0          	and	a,#224
1243  0099 e702          	ld	(2,x),a
1244                     ; 426   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1246  009b e602          	ld	a,(2,x)
1247  009d 1a05          	or	a,(OFST+5,sp)
1248  009f e702          	ld	(2,x),a
1249                     ; 429   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1251  00a1 7b06          	ld	a,(OFST+6,sp)
1252  00a3 1e01          	ldw	x,(OFST+1,sp)
1253  00a5 e706          	ld	(6,x),a
1254                     ; 430   ADCx->HTRL = (uint8_t)(HighThreshold);
1256  00a7 7b07          	ld	a,(OFST+7,sp)
1257  00a9 1e01          	ldw	x,(OFST+1,sp)
1258  00ab e707          	ld	(7,x),a
1259                     ; 433   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1261  00ad 7b08          	ld	a,(OFST+8,sp)
1262  00af 1e01          	ldw	x,(OFST+1,sp)
1263  00b1 e708          	ld	(8,x),a
1264                     ; 434   ADCx->LTRL = (uint8_t)LowThreshold;
1266  00b3 7b09          	ld	a,(OFST+9,sp)
1267  00b5 1e01          	ldw	x,(OFST+1,sp)
1268  00b7 e709          	ld	(9,x),a
1269                     ; 435 }
1272  00b9 85            	popw	x
1273  00ba 81            	ret
1308                     ; 474 void ADC_TempSensorCmd(FunctionalState NewState)
1308                     ; 475 {
1309                     	switch	.text
1310  00bb               _ADC_TempSensorCmd:
1314                     ; 477   assert_param(IS_FUNCTIONAL_STATE(NewState));
1316                     ; 479   if (NewState != DISABLE)
1318  00bb 4d            	tnz	a
1319  00bc 2706          	jreq	L175
1320                     ; 482     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_TSON);
1322  00be 721a534e      	bset	21326,#5
1324  00c2 2004          	jra	L375
1325  00c4               L175:
1326                     ; 487     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_TSON);
1328  00c4 721b534e      	bres	21326,#5
1329  00c8               L375:
1330                     ; 489 }
1333  00c8 81            	ret
1368                     ; 497 void ADC_VrefintCmd(FunctionalState NewState)
1368                     ; 498 {
1369                     	switch	.text
1370  00c9               _ADC_VrefintCmd:
1374                     ; 500   assert_param(IS_FUNCTIONAL_STATE(NewState));
1376                     ; 502   if (NewState != DISABLE)
1378  00c9 4d            	tnz	a
1379  00ca 2706          	jreq	L316
1380                     ; 505     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
1382  00cc 7218534e      	bset	21326,#4
1384  00d0 2004          	jra	L516
1385  00d2               L316:
1386                     ; 510     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_VREFINTON);
1388  00d2 7219534e      	bres	21326,#4
1389  00d6               L516:
1390                     ; 512 }
1393  00d6 81            	ret
1705                     ; 583 void ADC_ChannelCmd(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels, FunctionalState NewState)
1705                     ; 584 {
1706                     	switch	.text
1707  00d7               _ADC_ChannelCmd:
1709  00d7 89            	pushw	x
1710  00d8 88            	push	a
1711       00000001      OFST:	set	1
1714                     ; 585   uint8_t regindex = 0;
1716                     ; 587   assert_param(IS_FUNCTIONAL_STATE(NewState));
1718                     ; 589   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
1720  00d9 7b06          	ld	a,(OFST+5,sp)
1721  00db 6b01          	ld	(OFST+0,sp),a
1723                     ; 591   if (NewState != DISABLE)
1725  00dd 0d08          	tnz	(OFST+7,sp)
1726  00df 270f          	jreq	L367
1727                     ; 594     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
1729  00e1 01            	rrwa	x,a
1730  00e2 1b01          	add	a,(OFST+0,sp)
1731  00e4 2401          	jrnc	L23
1732  00e6 5c            	incw	x
1733  00e7               L23:
1734  00e7 02            	rlwa	x,a
1735  00e8 e60a          	ld	a,(10,x)
1736  00ea 1a07          	or	a,(OFST+6,sp)
1737  00ec e70a          	ld	(10,x),a
1739  00ee 200e          	jra	L567
1740  00f0               L367:
1741                     ; 599     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
1743  00f0 7b01          	ld	a,(OFST+0,sp)
1744  00f2 5f            	clrw	x
1745  00f3 97            	ld	xl,a
1746  00f4 72fb02        	addw	x,(OFST+1,sp)
1747  00f7 7b07          	ld	a,(OFST+6,sp)
1748  00f9 43            	cpl	a
1749  00fa e40a          	and	a,(10,x)
1750  00fc e70a          	ld	(10,x),a
1751  00fe               L567:
1752                     ; 601 }
1755  00fe 5b03          	addw	sp,#3
1756  0100 81            	ret
1906                     ; 625 void ADC_SamplingTimeConfig(ADC_TypeDef* ADCx,
1906                     ; 626                             ADC_Group_TypeDef ADC_GroupChannels,
1906                     ; 627                             ADC_SamplingTime_TypeDef ADC_SamplingTime)
1906                     ; 628 {
1907                     	switch	.text
1908  0101               _ADC_SamplingTimeConfig:
1910  0101 89            	pushw	x
1911       00000000      OFST:	set	0
1914                     ; 630   assert_param(IS_ADC_GROUP(ADC_GroupChannels));
1916                     ; 631   assert_param(IS_ADC_SAMPLING_TIME_CYCLES(ADC_SamplingTime));
1918                     ; 633   if ( ADC_GroupChannels != ADC_Group_SlowChannels)
1920  0102 0d05          	tnz	(OFST+5,sp)
1921  0104 2712          	jreq	L3501
1922                     ; 636     ADCx->CR3 &= (uint8_t)~ADC_CR3_SMPT2;
1924  0106 e602          	ld	a,(2,x)
1925  0108 a41f          	and	a,#31
1926  010a e702          	ld	(2,x),a
1927                     ; 637     ADCx->CR3 |= (uint8_t)(ADC_SamplingTime << 5);
1929  010c 7b06          	ld	a,(OFST+6,sp)
1930  010e 4e            	swap	a
1931  010f 48            	sll	a
1932  0110 a4e0          	and	a,#224
1933  0112 ea02          	or	a,(2,x)
1934  0114 e702          	ld	(2,x),a
1936  0116 2010          	jra	L5501
1937  0118               L3501:
1938                     ; 642     ADCx->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
1940  0118 1e01          	ldw	x,(OFST+1,sp)
1941  011a e601          	ld	a,(1,x)
1942  011c a4f8          	and	a,#248
1943  011e e701          	ld	(1,x),a
1944                     ; 643     ADCx->CR2 |= (uint8_t)ADC_SamplingTime;
1946  0120 1e01          	ldw	x,(OFST+1,sp)
1947  0122 e601          	ld	a,(1,x)
1948  0124 1a06          	or	a,(OFST+6,sp)
1949  0126 e701          	ld	(1,x),a
1950  0128               L5501:
1951                     ; 645 }
1954  0128 85            	popw	x
1955  0129 81            	ret
2022                     ; 691 void ADC_SchmittTriggerConfig(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels,
2022                     ; 692                               FunctionalState NewState)
2022                     ; 693 {
2023                     	switch	.text
2024  012a               _ADC_SchmittTriggerConfig:
2026  012a 89            	pushw	x
2027  012b 88            	push	a
2028       00000001      OFST:	set	1
2031                     ; 694   uint8_t regindex = 0;
2033                     ; 696   assert_param(IS_FUNCTIONAL_STATE(NewState));
2035                     ; 698   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
2037  012c 7b06          	ld	a,(OFST+5,sp)
2038  012e 6b01          	ld	(OFST+0,sp),a
2040                     ; 700   if (NewState != DISABLE)
2042  0130 0d08          	tnz	(OFST+7,sp)
2043  0132 2710          	jreq	L3111
2044                     ; 703     ADCx->TRIGR[regindex] &= (uint8_t)(~(uint8_t)ADC_Channels);
2046  0134 01            	rrwa	x,a
2047  0135 1b01          	add	a,(OFST+0,sp)
2048  0137 2401          	jrnc	L04
2049  0139 5c            	incw	x
2050  013a               L04:
2051  013a 02            	rlwa	x,a
2052  013b 7b07          	ld	a,(OFST+6,sp)
2053  013d 43            	cpl	a
2054  013e e40e          	and	a,(14,x)
2055  0140 e70e          	ld	(14,x),a
2057  0142 200d          	jra	L5111
2058  0144               L3111:
2059                     ; 708     ADCx->TRIGR[regindex] |= (uint8_t)(ADC_Channels);
2061  0144 7b01          	ld	a,(OFST+0,sp)
2062  0146 5f            	clrw	x
2063  0147 97            	ld	xl,a
2064  0148 72fb02        	addw	x,(OFST+1,sp)
2065  014b e60e          	ld	a,(14,x)
2066  014d 1a07          	or	a,(OFST+6,sp)
2067  014f e70e          	ld	(14,x),a
2068  0151               L5111:
2069                     ; 710 }
2072  0151 5b03          	addw	sp,#3
2073  0153 81            	ret
2120                     ; 717 uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
2120                     ; 718 {
2121                     	switch	.text
2122  0154               _ADC_GetConversionValue:
2124  0154 89            	pushw	x
2125  0155 89            	pushw	x
2126       00000002      OFST:	set	2
2129                     ; 719   uint16_t tmpreg = 0;
2131                     ; 722   tmpreg = (uint16_t)(ADCx->DRH);
2133  0156 e604          	ld	a,(4,x)
2134  0158 5f            	clrw	x
2135  0159 97            	ld	xl,a
2136  015a 1f01          	ldw	(OFST-1,sp),x
2138                     ; 723   tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADCx->DRL);
2140  015c 1e01          	ldw	x,(OFST-1,sp)
2141  015e 1603          	ldw	y,(OFST+1,sp)
2142  0160 90e605        	ld	a,(5,y)
2143  0163 02            	rlwa	x,a
2144  0164 1f01          	ldw	(OFST-1,sp),x
2146                     ; 726   return (uint16_t)(tmpreg) ;
2148  0166 1e01          	ldw	x,(OFST-1,sp)
2151  0168 5b04          	addw	sp,#4
2152  016a 81            	ret
2199                     ; 760 void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
2199                     ; 761 {
2200                     	switch	.text
2201  016b               _ADC_DMACmd:
2203  016b 89            	pushw	x
2204       00000000      OFST:	set	0
2207                     ; 763   assert_param(IS_FUNCTIONAL_STATE(NewState));
2209                     ; 765   if (NewState != DISABLE)
2211  016c 0d05          	tnz	(OFST+5,sp)
2212  016e 2708          	jreq	L7611
2213                     ; 768     ADCx->SQR[0] &= (uint8_t)~ADC_SQR1_DMAOFF;
2215  0170 e60a          	ld	a,(10,x)
2216  0172 a47f          	and	a,#127
2217  0174 e70a          	ld	(10,x),a
2219  0176 2008          	jra	L1711
2220  0178               L7611:
2221                     ; 773     ADCx->SQR[0] |= ADC_SQR1_DMAOFF;
2223  0178 1e01          	ldw	x,(OFST+1,sp)
2224  017a e60a          	ld	a,(10,x)
2225  017c aa80          	or	a,#128
2226  017e e70a          	ld	(10,x),a
2227  0180               L1711:
2228                     ; 775 }
2231  0180 85            	popw	x
2232  0181 81            	ret
2316                     ; 831 void ADC_ITConfig(ADC_TypeDef* ADCx, ADC_IT_TypeDef ADC_IT, FunctionalState NewState)
2316                     ; 832 {
2317                     	switch	.text
2318  0182               _ADC_ITConfig:
2320  0182 89            	pushw	x
2321       00000000      OFST:	set	0
2324                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2326                     ; 835   assert_param(IS_ADC_IT(ADC_IT));
2328                     ; 837   if (NewState != DISABLE)
2330  0183 0d06          	tnz	(OFST+6,sp)
2331  0185 2706          	jreq	L5321
2332                     ; 840     ADCx->CR1 |= (uint8_t) ADC_IT;
2334  0187 f6            	ld	a,(x)
2335  0188 1a05          	or	a,(OFST+5,sp)
2336  018a f7            	ld	(x),a
2338  018b 2007          	jra	L7321
2339  018d               L5321:
2340                     ; 845     ADCx->CR1 &= (uint8_t)(~ADC_IT);
2342  018d 1e01          	ldw	x,(OFST+1,sp)
2343  018f 7b05          	ld	a,(OFST+5,sp)
2344  0191 43            	cpl	a
2345  0192 f4            	and	a,(x)
2346  0193 f7            	ld	(x),a
2347  0194               L7321:
2348                     ; 847 }
2351  0194 85            	popw	x
2352  0195 81            	ret
2457                     ; 859 FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, ADC_FLAG_TypeDef ADC_FLAG)
2457                     ; 860 {
2458                     	switch	.text
2459  0196               _ADC_GetFlagStatus:
2461  0196 89            	pushw	x
2462  0197 88            	push	a
2463       00000001      OFST:	set	1
2466                     ; 861   FlagStatus flagstatus = RESET;
2468                     ; 864   assert_param(IS_ADC_GET_FLAG(ADC_FLAG));
2470                     ; 867   if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
2472  0198 e603          	ld	a,(3,x)
2473  019a 1506          	bcp	a,(OFST+5,sp)
2474  019c 2706          	jreq	L3131
2475                     ; 870     flagstatus = SET;
2477  019e a601          	ld	a,#1
2478  01a0 6b01          	ld	(OFST+0,sp),a
2481  01a2 2002          	jra	L5131
2482  01a4               L3131:
2483                     ; 875     flagstatus = RESET;
2485  01a4 0f01          	clr	(OFST+0,sp)
2487  01a6               L5131:
2488                     ; 879   return  flagstatus;
2490  01a6 7b01          	ld	a,(OFST+0,sp)
2493  01a8 5b03          	addw	sp,#3
2494  01aa 81            	ret
2541                     ; 892 void ADC_ClearFlag(ADC_TypeDef* ADCx,
2541                     ; 893                    ADC_FLAG_TypeDef ADC_FLAG)
2541                     ; 894 {
2542                     	switch	.text
2543  01ab               _ADC_ClearFlag:
2545  01ab 89            	pushw	x
2546       00000000      OFST:	set	0
2549                     ; 896   assert_param(IS_ADC_CLEAR_FLAG(ADC_FLAG));
2551                     ; 899   ADCx->SR = (uint8_t)~ADC_FLAG;
2553  01ac 7b05          	ld	a,(OFST+5,sp)
2554  01ae 43            	cpl	a
2555  01af 1e01          	ldw	x,(OFST+1,sp)
2556  01b1 e703          	ld	(3,x),a
2557                     ; 900 }
2560  01b3 85            	popw	x
2561  01b4 81            	ret
2637                     ; 912 ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx,
2637                     ; 913                          ADC_IT_TypeDef ADC_IT)
2637                     ; 914 {
2638                     	switch	.text
2639  01b5               _ADC_GetITStatus:
2641  01b5 89            	pushw	x
2642  01b6 5203          	subw	sp,#3
2643       00000003      OFST:	set	3
2646                     ; 915   ITStatus itstatus = RESET;
2648                     ; 916   uint8_t itmask = 0, enablestatus = 0;
2652                     ; 919   assert_param(IS_ADC_GET_IT(ADC_IT));
2654                     ; 922   itmask = (uint8_t)(ADC_IT >> 3);
2656  01b8 7b08          	ld	a,(OFST+5,sp)
2657  01ba 44            	srl	a
2658  01bb 44            	srl	a
2659  01bc 44            	srl	a
2660  01bd 6b03          	ld	(OFST+0,sp),a
2662                     ; 923   itmask =  (uint8_t)((uint8_t)((uint8_t)(itmask & (uint8_t)0x10) >> 2) | \
2662                     ; 924                                 (uint8_t)(itmask & (uint8_t)0x03));
2664  01bf 7b03          	ld	a,(OFST+0,sp)
2665  01c1 a403          	and	a,#3
2666  01c3 6b01          	ld	(OFST-2,sp),a
2668  01c5 7b03          	ld	a,(OFST+0,sp)
2669  01c7 a410          	and	a,#16
2670  01c9 44            	srl	a
2671  01ca 44            	srl	a
2672  01cb 1a01          	or	a,(OFST-2,sp)
2673  01cd 6b03          	ld	(OFST+0,sp),a
2675                     ; 927   enablestatus = (uint8_t)(ADCx->CR1 & (uint8_t)ADC_IT) ;
2677  01cf f6            	ld	a,(x)
2678  01d0 1408          	and	a,(OFST+5,sp)
2679  01d2 6b02          	ld	(OFST-1,sp),a
2681                     ; 930   if (((ADCx->SR & itmask) != (uint8_t)RESET) && enablestatus)
2683  01d4 e603          	ld	a,(3,x)
2684  01d6 1503          	bcp	a,(OFST+0,sp)
2685  01d8 270a          	jreq	L3041
2687  01da 0d02          	tnz	(OFST-1,sp)
2688  01dc 2706          	jreq	L3041
2689                     ; 933     itstatus = SET;
2691  01de a601          	ld	a,#1
2692  01e0 6b03          	ld	(OFST+0,sp),a
2695  01e2 2002          	jra	L5041
2696  01e4               L3041:
2697                     ; 938     itstatus = RESET;
2699  01e4 0f03          	clr	(OFST+0,sp)
2701  01e6               L5041:
2702                     ; 942   return  itstatus;
2704  01e6 7b03          	ld	a,(OFST+0,sp)
2707  01e8 5b05          	addw	sp,#5
2708  01ea 81            	ret
2765                     ; 955 void ADC_ClearITPendingBit(ADC_TypeDef* ADCx,
2765                     ; 956                            ADC_IT_TypeDef ADC_IT)
2765                     ; 957 {
2766                     	switch	.text
2767  01eb               _ADC_ClearITPendingBit:
2769  01eb 89            	pushw	x
2770  01ec 89            	pushw	x
2771       00000002      OFST:	set	2
2774                     ; 958   uint8_t itmask = 0;
2776                     ; 961   assert_param(IS_ADC_IT(ADC_IT));
2778                     ; 964   itmask = (uint8_t)(ADC_IT >> 3);
2780  01ed 7b07          	ld	a,(OFST+5,sp)
2781  01ef 44            	srl	a
2782  01f0 44            	srl	a
2783  01f1 44            	srl	a
2784  01f2 6b02          	ld	(OFST+0,sp),a
2786                     ; 965   itmask =  (uint8_t)((uint8_t)(((uint8_t)(itmask & (uint8_t)0x10)) >> 2) | \
2786                     ; 966                                  (uint8_t)(itmask & (uint8_t)0x03));
2788  01f4 7b02          	ld	a,(OFST+0,sp)
2789  01f6 a403          	and	a,#3
2790  01f8 6b01          	ld	(OFST-1,sp),a
2792  01fa 7b02          	ld	a,(OFST+0,sp)
2793  01fc a410          	and	a,#16
2794  01fe 44            	srl	a
2795  01ff 44            	srl	a
2796  0200 1a01          	or	a,(OFST-1,sp)
2797  0202 6b02          	ld	(OFST+0,sp),a
2799                     ; 969   ADCx->SR = (uint8_t)~itmask;
2801  0204 7b02          	ld	a,(OFST+0,sp)
2802  0206 43            	cpl	a
2803  0207 1e03          	ldw	x,(OFST+1,sp)
2804  0209 e703          	ld	(3,x),a
2805                     ; 970 }
2808  020b 5b04          	addw	sp,#4
2809  020d 81            	ret
2822                     	xdef	_ADC_ClearITPendingBit
2823                     	xdef	_ADC_GetITStatus
2824                     	xdef	_ADC_ClearFlag
2825                     	xdef	_ADC_GetFlagStatus
2826                     	xdef	_ADC_ITConfig
2827                     	xdef	_ADC_DMACmd
2828                     	xdef	_ADC_GetConversionValue
2829                     	xdef	_ADC_SchmittTriggerConfig
2830                     	xdef	_ADC_SamplingTimeConfig
2831                     	xdef	_ADC_ChannelCmd
2832                     	xdef	_ADC_VrefintCmd
2833                     	xdef	_ADC_TempSensorCmd
2834                     	xdef	_ADC_AnalogWatchdogConfig
2835                     	xdef	_ADC_AnalogWatchdogThresholdsConfig
2836                     	xdef	_ADC_AnalogWatchdogChannelSelect
2837                     	xdef	_ADC_ExternalTrigConfig
2838                     	xdef	_ADC_SoftwareStartConv
2839                     	xdef	_ADC_Cmd
2840                     	xdef	_ADC_Init
2841                     	xdef	_ADC_DeInit
2860                     	end
