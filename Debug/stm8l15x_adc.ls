   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
 174                     ; 135 void ADC_DeInit(ADC_TypeDef* ADCx)
 174                     ; 136 {
 176                     .text:	section	.text,new
 177  0000               _ADC_DeInit:
 181                     ; 138   ADCx->CR1 =  ADC_CR1_RESET_VALUE;
 183  0000 7f            	clr	(x)
 184                     ; 139   ADCx->CR2 =  ADC_CR2_RESET_VALUE;
 186  0001 6f01          	clr	(1,x)
 187                     ; 140   ADCx->CR3 =  ADC_CR3_RESET_VALUE;
 189  0003 a61f          	ld	a,#31
 190  0005 e702          	ld	(2,x),a
 191                     ; 143   ADCx->SR =  (uint8_t)~ADC_SR_RESET_VALUE;
 193  0007 a6ff          	ld	a,#255
 194  0009 e703          	ld	(3,x),a
 195                     ; 146   ADCx->HTRH =  ADC_HTRH_RESET_VALUE;
 197  000b a60f          	ld	a,#15
 198  000d e706          	ld	(6,x),a
 199                     ; 147   ADCx->HTRL =  ADC_HTRL_RESET_VALUE;
 201  000f a6ff          	ld	a,#255
 202  0011 e707          	ld	(7,x),a
 203                     ; 150   ADCx->LTRH =  ADC_LTRH_RESET_VALUE;
 205  0013 6f08          	clr	(8,x)
 206                     ; 151   ADCx->LTRL =  ADC_LTRL_RESET_VALUE;
 208  0015 6f09          	clr	(9,x)
 209                     ; 154   ADCx->SQR[0] =  ADC_SQR1_RESET_VALUE;
 211  0017 6f0a          	clr	(10,x)
 212                     ; 155   ADCx->SQR[1] =  ADC_SQR2_RESET_VALUE;
 214  0019 6f0b          	clr	(11,x)
 215                     ; 156   ADCx->SQR[2] =  ADC_SQR3_RESET_VALUE;
 217  001b 6f0c          	clr	(12,x)
 218                     ; 157   ADCx->SQR[3] =  ADC_SQR4_RESET_VALUE;
 220  001d 6f0d          	clr	(13,x)
 221                     ; 160   ADCx->TRIGR[0] =  ADC_TRIGR1_RESET_VALUE;
 223  001f 6f0e          	clr	(14,x)
 224                     ; 161   ADCx->TRIGR[1] =  ADC_TRIGR2_RESET_VALUE;
 226  0021 6f0f          	clr	(15,x)
 227                     ; 162   ADCx->TRIGR[2] =  ADC_TRIGR3_RESET_VALUE;
 229  0023 6f10          	clr	(16,x)
 230                     ; 163   ADCx->TRIGR[3] =  ADC_TRIGR4_RESET_VALUE;
 232  0025 6f11          	clr	(17,x)
 233                     ; 164 }
 236  0027 81            	ret
 383                     ; 186 void ADC_Init(ADC_TypeDef* ADCx,
 383                     ; 187               ADC_ConversionMode_TypeDef ADC_ConversionMode,
 383                     ; 188               ADC_Resolution_TypeDef ADC_Resolution,
 383                     ; 189               ADC_Prescaler_TypeDef ADC_Prescaler)
 383                     ; 190 {
 384                     .text:	section	.text,new
 385  0000               _ADC_Init:
 387  0000 89            	pushw	x
 388       00000000      OFST:	set	0
 391                     ; 192   assert_param(IS_ADC_CONVERSION_MODE(ADC_ConversionMode));
 393                     ; 193   assert_param(IS_ADC_RESOLUTION(ADC_Resolution));
 395                     ; 194   assert_param(IS_ADC_PRESCALER(ADC_Prescaler));
 397                     ; 197   ADCx->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);
 399  0001 f6            	ld	a,(x)
 400  0002 a49b          	and	a,#155
 401  0004 f7            	ld	(x),a
 402                     ; 200   ADCx->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode | (uint8_t)ADC_Resolution);
 404  0005 7b05          	ld	a,(OFST+5,sp)
 405  0007 1a06          	or	a,(OFST+6,sp)
 406  0009 fa            	or	a,(x)
 407  000a f7            	ld	(x),a
 408                     ; 203   ADCx->CR2 &= (uint8_t)~(ADC_CR2_PRESC);
 410  000b e601          	ld	a,(1,x)
 411  000d a47f          	and	a,#127
 412  000f e701          	ld	(1,x),a
 413                     ; 206   ADCx->CR2 |= (uint8_t) ADC_Prescaler;
 415  0011 e601          	ld	a,(1,x)
 416  0013 1a07          	or	a,(OFST+7,sp)
 417  0015 e701          	ld	(1,x),a
 418                     ; 207 }
 421  0017 85            	popw	x
 422  0018 81            	ret
 489                     ; 216 void ADC_Cmd(ADC_TypeDef* ADCx,
 489                     ; 217              FunctionalState NewState)
 489                     ; 218 {
 490                     .text:	section	.text,new
 491  0000               _ADC_Cmd:
 493  0000 89            	pushw	x
 494       00000000      OFST:	set	0
 497                     ; 220   assert_param(IS_FUNCTIONAL_STATE(NewState));
 499                     ; 222   if (NewState != DISABLE)
 501  0001 0d05          	tnz	(OFST+5,sp)
 502  0003 2706          	jreq	L142
 503                     ; 225     ADCx->CR1 |= ADC_CR1_ADON;
 505  0005 f6            	ld	a,(x)
 506  0006 aa01          	or	a,#1
 507  0008 f7            	ld	(x),a
 509  0009 2006          	jra	L342
 510  000b               L142:
 511                     ; 230     ADCx->CR1 &= (uint8_t)~ADC_CR1_ADON;
 513  000b 1e01          	ldw	x,(OFST+1,sp)
 514  000d f6            	ld	a,(x)
 515  000e a4fe          	and	a,#254
 516  0010 f7            	ld	(x),a
 517  0011               L342:
 518                     ; 232 }
 521  0011 85            	popw	x
 522  0012 81            	ret
 560                     ; 239 void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
 560                     ; 240 {
 561                     .text:	section	.text,new
 562  0000               _ADC_SoftwareStartConv:
 566                     ; 242   ADCx->CR1 |= ADC_CR1_START;
 568  0000 f6            	ld	a,(x)
 569  0001 aa02          	or	a,#2
 570  0003 f7            	ld	(x),a
 571                     ; 243 }
 574  0004 81            	ret
 702                     ; 261 void ADC_ExternalTrigConfig(ADC_TypeDef* ADCx,
 702                     ; 262                             ADC_ExtEventSelection_TypeDef ADC_ExtEventSelection,
 702                     ; 263                             ADC_ExtTRGSensitivity_TypeDef ADC_ExtTRGSensitivity)
 702                     ; 264 {
 703                     .text:	section	.text,new
 704  0000               _ADC_ExternalTrigConfig:
 706  0000 89            	pushw	x
 707       00000000      OFST:	set	0
 710                     ; 266   assert_param(IS_ADC_EXT_EVENT_SELECTION(ADC_ExtEventSelection));
 712                     ; 267   assert_param(IS_ADC_EXT_TRG_SENSITIVITY(ADC_ExtTRGSensitivity));
 714                     ; 270   ADCx->CR2 &= (uint8_t)~(ADC_CR2_TRIGEDGE | ADC_CR2_EXTSEL);
 716  0001 e601          	ld	a,(1,x)
 717  0003 a487          	and	a,#135
 718  0005 e701          	ld	(1,x),a
 719                     ; 274   ADCx->CR2 |= (uint8_t)( (uint8_t)ADC_ExtTRGSensitivity | \
 719                     ; 275                           (uint8_t)ADC_ExtEventSelection);
 721  0007 7b06          	ld	a,(OFST+6,sp)
 722  0009 1a05          	or	a,(OFST+5,sp)
 723  000b ea01          	or	a,(1,x)
 724  000d e701          	ld	(1,x),a
 725                     ; 276 }
 728  000f 85            	popw	x
 729  0010 81            	ret
1043                     ; 339 void ADC_AnalogWatchdogChannelSelect(ADC_TypeDef* ADCx,
1043                     ; 340                                      ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection)
1043                     ; 341 {
1044                     .text:	section	.text,new
1045  0000               _ADC_AnalogWatchdogChannelSelect:
1047  0000 89            	pushw	x
1048       00000000      OFST:	set	0
1051                     ; 343   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1053                     ; 346   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1055  0001 e602          	ld	a,(2,x)
1056  0003 a4e0          	and	a,#224
1057  0005 e702          	ld	(2,x),a
1058                     ; 349   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1060  0007 e602          	ld	a,(2,x)
1061  0009 1a05          	or	a,(OFST+5,sp)
1062  000b e702          	ld	(2,x),a
1063                     ; 350 }
1066  000d 85            	popw	x
1067  000e 81            	ret
1123                     ; 361 void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, uint16_t HighThreshold, uint16_t LowThreshold)
1123                     ; 362 {
1124                     .text:	section	.text,new
1125  0000               _ADC_AnalogWatchdogThresholdsConfig:
1127  0000 89            	pushw	x
1128       00000000      OFST:	set	0
1131                     ; 364   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1133                     ; 365   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1135                     ; 368   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1137  0001 7b05          	ld	a,(OFST+5,sp)
1138  0003 1e01          	ldw	x,(OFST+1,sp)
1139  0005 e706          	ld	(6,x),a
1140                     ; 369   ADCx->HTRL = (uint8_t)(HighThreshold);
1142  0007 7b06          	ld	a,(OFST+6,sp)
1143  0009 1e01          	ldw	x,(OFST+1,sp)
1144  000b e707          	ld	(7,x),a
1145                     ; 372   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1147  000d 7b07          	ld	a,(OFST+7,sp)
1148  000f 1e01          	ldw	x,(OFST+1,sp)
1149  0011 e708          	ld	(8,x),a
1150                     ; 373   ADCx->LTRL = (uint8_t)(LowThreshold);
1152  0013 7b08          	ld	a,(OFST+8,sp)
1153  0015 1e01          	ldw	x,(OFST+1,sp)
1154  0017 e709          	ld	(9,x),a
1155                     ; 374 }
1158  0019 85            	popw	x
1159  001a 81            	ret
1226                     ; 412 void ADC_AnalogWatchdogConfig(ADC_TypeDef* ADCx,
1226                     ; 413                               ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection,
1226                     ; 414                               uint16_t HighThreshold,
1226                     ; 415                               uint16_t LowThreshold)
1226                     ; 416 {
1227                     .text:	section	.text,new
1228  0000               _ADC_AnalogWatchdogConfig:
1230  0000 89            	pushw	x
1231       00000000      OFST:	set	0
1234                     ; 418   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1236                     ; 419   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1238                     ; 420   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1240                     ; 423   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1242  0001 e602          	ld	a,(2,x)
1243  0003 a4e0          	and	a,#224
1244  0005 e702          	ld	(2,x),a
1245                     ; 426   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1247  0007 e602          	ld	a,(2,x)
1248  0009 1a05          	or	a,(OFST+5,sp)
1249  000b e702          	ld	(2,x),a
1250                     ; 429   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1252  000d 7b06          	ld	a,(OFST+6,sp)
1253  000f 1e01          	ldw	x,(OFST+1,sp)
1254  0011 e706          	ld	(6,x),a
1255                     ; 430   ADCx->HTRL = (uint8_t)(HighThreshold);
1257  0013 7b07          	ld	a,(OFST+7,sp)
1258  0015 1e01          	ldw	x,(OFST+1,sp)
1259  0017 e707          	ld	(7,x),a
1260                     ; 433   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1262  0019 7b08          	ld	a,(OFST+8,sp)
1263  001b 1e01          	ldw	x,(OFST+1,sp)
1264  001d e708          	ld	(8,x),a
1265                     ; 434   ADCx->LTRL = (uint8_t)LowThreshold;
1267  001f 7b09          	ld	a,(OFST+9,sp)
1268  0021 1e01          	ldw	x,(OFST+1,sp)
1269  0023 e709          	ld	(9,x),a
1270                     ; 435 }
1273  0025 85            	popw	x
1274  0026 81            	ret
1309                     ; 474 void ADC_TempSensorCmd(FunctionalState NewState)
1309                     ; 475 {
1310                     .text:	section	.text,new
1311  0000               _ADC_TempSensorCmd:
1315                     ; 477   assert_param(IS_FUNCTIONAL_STATE(NewState));
1317                     ; 479   if (NewState != DISABLE)
1319  0000 4d            	tnz	a
1320  0001 2706          	jreq	L175
1321                     ; 482     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_TSON);
1323  0003 721a534e      	bset	21326,#5
1325  0007 2004          	jra	L375
1326  0009               L175:
1327                     ; 487     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_TSON);
1329  0009 721b534e      	bres	21326,#5
1330  000d               L375:
1331                     ; 489 }
1334  000d 81            	ret
1369                     ; 497 void ADC_VrefintCmd(FunctionalState NewState)
1369                     ; 498 {
1370                     .text:	section	.text,new
1371  0000               _ADC_VrefintCmd:
1375                     ; 500   assert_param(IS_FUNCTIONAL_STATE(NewState));
1377                     ; 502   if (NewState != DISABLE)
1379  0000 4d            	tnz	a
1380  0001 2706          	jreq	L316
1381                     ; 505     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
1383  0003 7218534e      	bset	21326,#4
1385  0007 2004          	jra	L516
1386  0009               L316:
1387                     ; 510     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_VREFINTON);
1389  0009 7219534e      	bres	21326,#4
1390  000d               L516:
1391                     ; 512 }
1394  000d 81            	ret
1706                     ; 583 void ADC_ChannelCmd(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels, FunctionalState NewState)
1706                     ; 584 {
1707                     .text:	section	.text,new
1708  0000               _ADC_ChannelCmd:
1710  0000 89            	pushw	x
1711  0001 88            	push	a
1712       00000001      OFST:	set	1
1715                     ; 585   uint8_t regindex = 0;
1717                     ; 587   assert_param(IS_FUNCTIONAL_STATE(NewState));
1719                     ; 589   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
1721  0002 7b06          	ld	a,(OFST+5,sp)
1722  0004 6b01          	ld	(OFST+0,sp),a
1724                     ; 591   if (NewState != DISABLE)
1726  0006 0d08          	tnz	(OFST+7,sp)
1727  0008 270f          	jreq	L367
1728                     ; 594     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
1730  000a 01            	rrwa	x,a
1731  000b 1b01          	add	a,(OFST+0,sp)
1732  000d 2401          	jrnc	L23
1733  000f 5c            	incw	x
1734  0010               L23:
1735  0010 02            	rlwa	x,a
1736  0011 e60a          	ld	a,(10,x)
1737  0013 1a07          	or	a,(OFST+6,sp)
1738  0015 e70a          	ld	(10,x),a
1740  0017 200e          	jra	L567
1741  0019               L367:
1742                     ; 599     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
1744  0019 7b01          	ld	a,(OFST+0,sp)
1745  001b 5f            	clrw	x
1746  001c 97            	ld	xl,a
1747  001d 72fb02        	addw	x,(OFST+1,sp)
1748  0020 7b07          	ld	a,(OFST+6,sp)
1749  0022 43            	cpl	a
1750  0023 e40a          	and	a,(10,x)
1751  0025 e70a          	ld	(10,x),a
1752  0027               L567:
1753                     ; 601 }
1756  0027 5b03          	addw	sp,#3
1757  0029 81            	ret
1907                     ; 625 void ADC_SamplingTimeConfig(ADC_TypeDef* ADCx,
1907                     ; 626                             ADC_Group_TypeDef ADC_GroupChannels,
1907                     ; 627                             ADC_SamplingTime_TypeDef ADC_SamplingTime)
1907                     ; 628 {
1908                     .text:	section	.text,new
1909  0000               _ADC_SamplingTimeConfig:
1911  0000 89            	pushw	x
1912       00000000      OFST:	set	0
1915                     ; 630   assert_param(IS_ADC_GROUP(ADC_GroupChannels));
1917                     ; 631   assert_param(IS_ADC_SAMPLING_TIME_CYCLES(ADC_SamplingTime));
1919                     ; 633   if ( ADC_GroupChannels != ADC_Group_SlowChannels)
1921  0001 0d05          	tnz	(OFST+5,sp)
1922  0003 2712          	jreq	L3501
1923                     ; 636     ADCx->CR3 &= (uint8_t)~ADC_CR3_SMPT2;
1925  0005 e602          	ld	a,(2,x)
1926  0007 a41f          	and	a,#31
1927  0009 e702          	ld	(2,x),a
1928                     ; 637     ADCx->CR3 |= (uint8_t)(ADC_SamplingTime << 5);
1930  000b 7b06          	ld	a,(OFST+6,sp)
1931  000d 4e            	swap	a
1932  000e 48            	sll	a
1933  000f a4e0          	and	a,#224
1934  0011 ea02          	or	a,(2,x)
1935  0013 e702          	ld	(2,x),a
1937  0015 2010          	jra	L5501
1938  0017               L3501:
1939                     ; 642     ADCx->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
1941  0017 1e01          	ldw	x,(OFST+1,sp)
1942  0019 e601          	ld	a,(1,x)
1943  001b a4f8          	and	a,#248
1944  001d e701          	ld	(1,x),a
1945                     ; 643     ADCx->CR2 |= (uint8_t)ADC_SamplingTime;
1947  001f 1e01          	ldw	x,(OFST+1,sp)
1948  0021 e601          	ld	a,(1,x)
1949  0023 1a06          	or	a,(OFST+6,sp)
1950  0025 e701          	ld	(1,x),a
1951  0027               L5501:
1952                     ; 645 }
1955  0027 85            	popw	x
1956  0028 81            	ret
2023                     ; 691 void ADC_SchmittTriggerConfig(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels,
2023                     ; 692                               FunctionalState NewState)
2023                     ; 693 {
2024                     .text:	section	.text,new
2025  0000               _ADC_SchmittTriggerConfig:
2027  0000 89            	pushw	x
2028  0001 88            	push	a
2029       00000001      OFST:	set	1
2032                     ; 694   uint8_t regindex = 0;
2034                     ; 696   assert_param(IS_FUNCTIONAL_STATE(NewState));
2036                     ; 698   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
2038  0002 7b06          	ld	a,(OFST+5,sp)
2039  0004 6b01          	ld	(OFST+0,sp),a
2041                     ; 700   if (NewState != DISABLE)
2043  0006 0d08          	tnz	(OFST+7,sp)
2044  0008 2710          	jreq	L3111
2045                     ; 703     ADCx->TRIGR[regindex] &= (uint8_t)(~(uint8_t)ADC_Channels);
2047  000a 01            	rrwa	x,a
2048  000b 1b01          	add	a,(OFST+0,sp)
2049  000d 2401          	jrnc	L04
2050  000f 5c            	incw	x
2051  0010               L04:
2052  0010 02            	rlwa	x,a
2053  0011 7b07          	ld	a,(OFST+6,sp)
2054  0013 43            	cpl	a
2055  0014 e40e          	and	a,(14,x)
2056  0016 e70e          	ld	(14,x),a
2058  0018 200d          	jra	L5111
2059  001a               L3111:
2060                     ; 708     ADCx->TRIGR[regindex] |= (uint8_t)(ADC_Channels);
2062  001a 7b01          	ld	a,(OFST+0,sp)
2063  001c 5f            	clrw	x
2064  001d 97            	ld	xl,a
2065  001e 72fb02        	addw	x,(OFST+1,sp)
2066  0021 e60e          	ld	a,(14,x)
2067  0023 1a07          	or	a,(OFST+6,sp)
2068  0025 e70e          	ld	(14,x),a
2069  0027               L5111:
2070                     ; 710 }
2073  0027 5b03          	addw	sp,#3
2074  0029 81            	ret
2121                     ; 717 uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
2121                     ; 718 {
2122                     .text:	section	.text,new
2123  0000               _ADC_GetConversionValue:
2125  0000 89            	pushw	x
2126  0001 89            	pushw	x
2127       00000002      OFST:	set	2
2130                     ; 719   uint16_t tmpreg = 0;
2132                     ; 722   tmpreg = (uint16_t)(ADCx->DRH);
2134  0002 e604          	ld	a,(4,x)
2135  0004 5f            	clrw	x
2136  0005 97            	ld	xl,a
2137  0006 1f01          	ldw	(OFST-1,sp),x
2139                     ; 723   tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADCx->DRL);
2141  0008 1e01          	ldw	x,(OFST-1,sp)
2142  000a 1603          	ldw	y,(OFST+1,sp)
2143  000c 90e605        	ld	a,(5,y)
2144  000f 02            	rlwa	x,a
2145  0010 1f01          	ldw	(OFST-1,sp),x
2147                     ; 726   return (uint16_t)(tmpreg) ;
2149  0012 1e01          	ldw	x,(OFST-1,sp)
2152  0014 5b04          	addw	sp,#4
2153  0016 81            	ret
2200                     ; 760 void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
2200                     ; 761 {
2201                     .text:	section	.text,new
2202  0000               _ADC_DMACmd:
2204  0000 89            	pushw	x
2205       00000000      OFST:	set	0
2208                     ; 763   assert_param(IS_FUNCTIONAL_STATE(NewState));
2210                     ; 765   if (NewState != DISABLE)
2212  0001 0d05          	tnz	(OFST+5,sp)
2213  0003 2708          	jreq	L7611
2214                     ; 768     ADCx->SQR[0] &= (uint8_t)~ADC_SQR1_DMAOFF;
2216  0005 e60a          	ld	a,(10,x)
2217  0007 a47f          	and	a,#127
2218  0009 e70a          	ld	(10,x),a
2220  000b 2008          	jra	L1711
2221  000d               L7611:
2222                     ; 773     ADCx->SQR[0] |= ADC_SQR1_DMAOFF;
2224  000d 1e01          	ldw	x,(OFST+1,sp)
2225  000f e60a          	ld	a,(10,x)
2226  0011 aa80          	or	a,#128
2227  0013 e70a          	ld	(10,x),a
2228  0015               L1711:
2229                     ; 775 }
2232  0015 85            	popw	x
2233  0016 81            	ret
2317                     ; 831 void ADC_ITConfig(ADC_TypeDef* ADCx, ADC_IT_TypeDef ADC_IT, FunctionalState NewState)
2317                     ; 832 {
2318                     .text:	section	.text,new
2319  0000               _ADC_ITConfig:
2321  0000 89            	pushw	x
2322       00000000      OFST:	set	0
2325                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2327                     ; 835   assert_param(IS_ADC_IT(ADC_IT));
2329                     ; 837   if (NewState != DISABLE)
2331  0001 0d06          	tnz	(OFST+6,sp)
2332  0003 2706          	jreq	L5321
2333                     ; 840     ADCx->CR1 |= (uint8_t) ADC_IT;
2335  0005 f6            	ld	a,(x)
2336  0006 1a05          	or	a,(OFST+5,sp)
2337  0008 f7            	ld	(x),a
2339  0009 2007          	jra	L7321
2340  000b               L5321:
2341                     ; 845     ADCx->CR1 &= (uint8_t)(~ADC_IT);
2343  000b 1e01          	ldw	x,(OFST+1,sp)
2344  000d 7b05          	ld	a,(OFST+5,sp)
2345  000f 43            	cpl	a
2346  0010 f4            	and	a,(x)
2347  0011 f7            	ld	(x),a
2348  0012               L7321:
2349                     ; 847 }
2352  0012 85            	popw	x
2353  0013 81            	ret
2458                     ; 859 FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, ADC_FLAG_TypeDef ADC_FLAG)
2458                     ; 860 {
2459                     .text:	section	.text,new
2460  0000               _ADC_GetFlagStatus:
2462  0000 89            	pushw	x
2463  0001 88            	push	a
2464       00000001      OFST:	set	1
2467                     ; 861   FlagStatus flagstatus = RESET;
2469                     ; 864   assert_param(IS_ADC_GET_FLAG(ADC_FLAG));
2471                     ; 867   if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
2473  0002 e603          	ld	a,(3,x)
2474  0004 1506          	bcp	a,(OFST+5,sp)
2475  0006 2706          	jreq	L3131
2476                     ; 870     flagstatus = SET;
2478  0008 a601          	ld	a,#1
2479  000a 6b01          	ld	(OFST+0,sp),a
2482  000c 2002          	jra	L5131
2483  000e               L3131:
2484                     ; 875     flagstatus = RESET;
2486  000e 0f01          	clr	(OFST+0,sp)
2488  0010               L5131:
2489                     ; 879   return  flagstatus;
2491  0010 7b01          	ld	a,(OFST+0,sp)
2494  0012 5b03          	addw	sp,#3
2495  0014 81            	ret
2542                     ; 892 void ADC_ClearFlag(ADC_TypeDef* ADCx,
2542                     ; 893                    ADC_FLAG_TypeDef ADC_FLAG)
2542                     ; 894 {
2543                     .text:	section	.text,new
2544  0000               _ADC_ClearFlag:
2546  0000 89            	pushw	x
2547       00000000      OFST:	set	0
2550                     ; 896   assert_param(IS_ADC_CLEAR_FLAG(ADC_FLAG));
2552                     ; 899   ADCx->SR = (uint8_t)~ADC_FLAG;
2554  0001 7b05          	ld	a,(OFST+5,sp)
2555  0003 43            	cpl	a
2556  0004 1e01          	ldw	x,(OFST+1,sp)
2557  0006 e703          	ld	(3,x),a
2558                     ; 900 }
2561  0008 85            	popw	x
2562  0009 81            	ret
2638                     ; 912 ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx,
2638                     ; 913                          ADC_IT_TypeDef ADC_IT)
2638                     ; 914 {
2639                     .text:	section	.text,new
2640  0000               _ADC_GetITStatus:
2642  0000 89            	pushw	x
2643  0001 5203          	subw	sp,#3
2644       00000003      OFST:	set	3
2647                     ; 915   ITStatus itstatus = RESET;
2649                     ; 916   uint8_t itmask = 0, enablestatus = 0;
2653                     ; 919   assert_param(IS_ADC_GET_IT(ADC_IT));
2655                     ; 922   itmask = (uint8_t)(ADC_IT >> 3);
2657  0003 7b08          	ld	a,(OFST+5,sp)
2658  0005 44            	srl	a
2659  0006 44            	srl	a
2660  0007 44            	srl	a
2661  0008 6b03          	ld	(OFST+0,sp),a
2663                     ; 923   itmask =  (uint8_t)((uint8_t)((uint8_t)(itmask & (uint8_t)0x10) >> 2) | \
2663                     ; 924                                 (uint8_t)(itmask & (uint8_t)0x03));
2665  000a 7b03          	ld	a,(OFST+0,sp)
2666  000c a403          	and	a,#3
2667  000e 6b01          	ld	(OFST-2,sp),a
2669  0010 7b03          	ld	a,(OFST+0,sp)
2670  0012 a410          	and	a,#16
2671  0014 44            	srl	a
2672  0015 44            	srl	a
2673  0016 1a01          	or	a,(OFST-2,sp)
2674  0018 6b03          	ld	(OFST+0,sp),a
2676                     ; 927   enablestatus = (uint8_t)(ADCx->CR1 & (uint8_t)ADC_IT) ;
2678  001a f6            	ld	a,(x)
2679  001b 1408          	and	a,(OFST+5,sp)
2680  001d 6b02          	ld	(OFST-1,sp),a
2682                     ; 930   if (((ADCx->SR & itmask) != (uint8_t)RESET) && enablestatus)
2684  001f e603          	ld	a,(3,x)
2685  0021 1503          	bcp	a,(OFST+0,sp)
2686  0023 270a          	jreq	L3041
2688  0025 0d02          	tnz	(OFST-1,sp)
2689  0027 2706          	jreq	L3041
2690                     ; 933     itstatus = SET;
2692  0029 a601          	ld	a,#1
2693  002b 6b03          	ld	(OFST+0,sp),a
2696  002d 2002          	jra	L5041
2697  002f               L3041:
2698                     ; 938     itstatus = RESET;
2700  002f 0f03          	clr	(OFST+0,sp)
2702  0031               L5041:
2703                     ; 942   return  itstatus;
2705  0031 7b03          	ld	a,(OFST+0,sp)
2708  0033 5b05          	addw	sp,#5
2709  0035 81            	ret
2766                     ; 955 void ADC_ClearITPendingBit(ADC_TypeDef* ADCx,
2766                     ; 956                            ADC_IT_TypeDef ADC_IT)
2766                     ; 957 {
2767                     .text:	section	.text,new
2768  0000               _ADC_ClearITPendingBit:
2770  0000 89            	pushw	x
2771  0001 89            	pushw	x
2772       00000002      OFST:	set	2
2775                     ; 958   uint8_t itmask = 0;
2777                     ; 961   assert_param(IS_ADC_IT(ADC_IT));
2779                     ; 964   itmask = (uint8_t)(ADC_IT >> 3);
2781  0002 7b07          	ld	a,(OFST+5,sp)
2782  0004 44            	srl	a
2783  0005 44            	srl	a
2784  0006 44            	srl	a
2785  0007 6b02          	ld	(OFST+0,sp),a
2787                     ; 965   itmask =  (uint8_t)((uint8_t)(((uint8_t)(itmask & (uint8_t)0x10)) >> 2) | \
2787                     ; 966                                  (uint8_t)(itmask & (uint8_t)0x03));
2789  0009 7b02          	ld	a,(OFST+0,sp)
2790  000b a403          	and	a,#3
2791  000d 6b01          	ld	(OFST-1,sp),a
2793  000f 7b02          	ld	a,(OFST+0,sp)
2794  0011 a410          	and	a,#16
2795  0013 44            	srl	a
2796  0014 44            	srl	a
2797  0015 1a01          	or	a,(OFST-1,sp)
2798  0017 6b02          	ld	(OFST+0,sp),a
2800                     ; 969   ADCx->SR = (uint8_t)~itmask;
2802  0019 7b02          	ld	a,(OFST+0,sp)
2803  001b 43            	cpl	a
2804  001c 1e03          	ldw	x,(OFST+1,sp)
2805  001e e703          	ld	(3,x),a
2806                     ; 970 }
2809  0020 5b04          	addw	sp,#4
2810  0022 81            	ret
2823                     	xdef	_ADC_ClearITPendingBit
2824                     	xdef	_ADC_GetITStatus
2825                     	xdef	_ADC_ClearFlag
2826                     	xdef	_ADC_GetFlagStatus
2827                     	xdef	_ADC_ITConfig
2828                     	xdef	_ADC_DMACmd
2829                     	xdef	_ADC_GetConversionValue
2830                     	xdef	_ADC_SchmittTriggerConfig
2831                     	xdef	_ADC_SamplingTimeConfig
2832                     	xdef	_ADC_ChannelCmd
2833                     	xdef	_ADC_VrefintCmd
2834                     	xdef	_ADC_TempSensorCmd
2835                     	xdef	_ADC_AnalogWatchdogConfig
2836                     	xdef	_ADC_AnalogWatchdogThresholdsConfig
2837                     	xdef	_ADC_AnalogWatchdogChannelSelect
2838                     	xdef	_ADC_ExternalTrigConfig
2839                     	xdef	_ADC_SoftwareStartConv
2840                     	xdef	_ADC_Cmd
2841                     	xdef	_ADC_Init
2842                     	xdef	_ADC_DeInit
2861                     	end
