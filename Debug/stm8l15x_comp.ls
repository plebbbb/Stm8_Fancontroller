   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  43                     ; 111 void COMP_DeInit(void)
  43                     ; 112 {
  45                     .text:	section	.text,new
  46  0000               _COMP_DeInit:
  50                     ; 114   COMP->CSR1 = (uint8_t) COMP_CSR1_RESET_VALUE;
  52  0000 725f5440      	clr	21568
  53                     ; 117   COMP->CSR2 = (uint8_t) COMP_CSR2_RESET_VALUE;
  55  0004 725f5441      	clr	21569
  56                     ; 120   COMP->CSR3 = (uint8_t) COMP_CSR3_RESET_VALUE;
  58  0008 35c05442      	mov	21570,#192
  59                     ; 123   COMP->CSR4 = (uint8_t) COMP_CSR4_RESET_VALUE;
  61  000c 725f5443      	clr	21571
  62                     ; 126   COMP->CSR5 = (uint8_t) COMP_CSR5_RESET_VALUE;
  64  0010 725f5444      	clr	21572
  65                     ; 127 }
  68  0014 81            	ret
 244                     ; 153 void COMP_Init(COMP_InvertingInput_Typedef COMP_InvertingInput,
 244                     ; 154                COMP_OutputSelect_Typedef COMP_OutputSelect, COMP_Speed_TypeDef COMP_Speed)
 244                     ; 155 {
 245                     .text:	section	.text,new
 246  0000               _COMP_Init:
 248  0000 89            	pushw	x
 249       00000000      OFST:	set	0
 252                     ; 157   assert_param(IS_COMP_INVERTING_INPUT(COMP_InvertingInput));
 254                     ; 158   assert_param(IS_COMP_OUTPUT(COMP_OutputSelect));
 256                     ; 159   assert_param(IS_COMP_SPEED(COMP_Speed));
 258                     ; 162   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_INSEL);
 260  0001 c65442        	ld	a,21570
 261  0004 a4c7          	and	a,#199
 262  0006 c75442        	ld	21570,a
 263                     ; 164   COMP->CSR3 |= (uint8_t) COMP_InvertingInput;
 265  0009 9e            	ld	a,xh
 266  000a ca5442        	or	a,21570
 267  000d c75442        	ld	21570,a
 268                     ; 167   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_OUTSEL);
 270  0010 c65442        	ld	a,21570
 271  0013 a43f          	and	a,#63
 272  0015 c75442        	ld	21570,a
 273                     ; 169   COMP->CSR3 |= (uint8_t) COMP_OutputSelect;
 275  0018 9f            	ld	a,xl
 276  0019 ca5442        	or	a,21570
 277  001c c75442        	ld	21570,a
 278                     ; 172   COMP->CSR2 &= (uint8_t) (~COMP_CSR2_SPEED);
 280  001f 72155441      	bres	21569,#2
 281                     ; 174   COMP->CSR2 |= (uint8_t) COMP_Speed;
 283  0023 c65441        	ld	a,21569
 284  0026 1a05          	or	a,(OFST+5,sp)
 285  0028 c75441        	ld	21569,a
 286                     ; 175 }
 289  002b 85            	popw	x
 290  002c 81            	ret
 346                     ; 183 void COMP_VrefintToCOMP1Connect(FunctionalState NewState)
 346                     ; 184 {
 347                     .text:	section	.text,new
 348  0000               _COMP_VrefintToCOMP1Connect:
 352                     ; 186   assert_param(IS_FUNCTIONAL_STATE(NewState));
 354                     ; 188   if (NewState != DISABLE)
 356  0000 4d            	tnz	a
 357  0001 2706          	jreq	L341
 358                     ; 191     COMP->CSR3 |= COMP_CSR3_VREFEN;
 360  0003 72145442      	bset	21570,#2
 362  0007 2004          	jra	L541
 363  0009               L341:
 364                     ; 196     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_VREFEN);
 366  0009 72155442      	bres	21570,#2
 367  000d               L541:
 368                     ; 198 }
 371  000d 81            	ret
 466                     ; 212 void COMP_EdgeConfig(COMP_Selection_TypeDef COMP_Selection, COMP_Edge_TypeDef COMP_Edge)
 466                     ; 213 {
 467                     .text:	section	.text,new
 468  0000               _COMP_EdgeConfig:
 470  0000 89            	pushw	x
 471       00000000      OFST:	set	0
 474                     ; 215   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 476                     ; 216   assert_param(IS_COMP_EDGE(COMP_Edge));
 478                     ; 219   if (COMP_Selection == COMP_Selection_COMP1)
 480  0001 9e            	ld	a,xh
 481  0002 a101          	cp	a,#1
 482  0004 2611          	jrne	L312
 483                     ; 222     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_CMP1);
 485  0006 c65440        	ld	a,21568
 486  0009 a4fc          	and	a,#252
 487  000b c75440        	ld	21568,a
 488                     ; 225     COMP->CSR1 |= (uint8_t) COMP_Edge;
 490  000e 9f            	ld	a,xl
 491  000f ca5440        	or	a,21568
 492  0012 c75440        	ld	21568,a
 494  0015 2010          	jra	L512
 495  0017               L312:
 496                     ; 231     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_CMP2);
 498  0017 c65441        	ld	a,21569
 499  001a a4fc          	and	a,#252
 500  001c c75441        	ld	21569,a
 501                     ; 234     COMP->CSR2 |= (uint8_t) COMP_Edge;
 503  001f c65441        	ld	a,21569
 504  0022 1a02          	or	a,(OFST+2,sp)
 505  0024 c75441        	ld	21569,a
 506  0027               L512:
 507                     ; 236 }
 510  0027 85            	popw	x
 511  0028 81            	ret
 579                     ; 251 COMP_OutputLevel_TypeDef COMP_GetOutputLevel(COMP_Selection_TypeDef COMP_Selection)
 579                     ; 252 {
 580                     .text:	section	.text,new
 581  0000               _COMP_GetOutputLevel:
 583  0000 88            	push	a
 584       00000001      OFST:	set	1
 587                     ; 256   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 589                     ; 259   if (COMP_Selection == COMP_Selection_COMP1)
 591  0001 a101          	cp	a,#1
 592  0003 2611          	jrne	L152
 593                     ; 262     if ((COMP->CSR1 & COMP_CSR1_CMP1OUT) != (uint8_t) RESET)
 595  0005 c65440        	ld	a,21568
 596  0008 a508          	bcp	a,#8
 597  000a 2706          	jreq	L352
 598                     ; 265       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 600  000c a601          	ld	a,#1
 601  000e 6b01          	ld	(OFST+0,sp),a
 604  0010 2013          	jra	L752
 605  0012               L352:
 606                     ; 271       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 608  0012 0f01          	clr	(OFST+0,sp)
 610  0014 200f          	jra	L752
 611  0016               L152:
 612                     ; 278     if ((COMP->CSR2 & COMP_CSR2_CMP2OUT) != (uint8_t) RESET)
 614  0016 c65441        	ld	a,21569
 615  0019 a508          	bcp	a,#8
 616  001b 2706          	jreq	L162
 617                     ; 281       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 619  001d a601          	ld	a,#1
 620  001f 6b01          	ld	(OFST+0,sp),a
 623  0021 2002          	jra	L752
 624  0023               L162:
 625                     ; 287       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 627  0023 0f01          	clr	(OFST+0,sp)
 629  0025               L752:
 630                     ; 292   return (COMP_OutputLevel_TypeDef)(compout);
 632  0025 7b01          	ld	a,(OFST+0,sp)
 635  0027 5b01          	addw	sp,#1
 636  0029 81            	ret
 671                     ; 324 void COMP_WindowCmd(FunctionalState NewState)
 671                     ; 325 {
 672                     .text:	section	.text,new
 673  0000               _COMP_WindowCmd:
 677                     ; 327   assert_param(IS_FUNCTIONAL_STATE(NewState));
 679                     ; 329   if (NewState != DISABLE)
 681  0000 4d            	tnz	a
 682  0001 2706          	jreq	L303
 683                     ; 332     COMP->CSR3 |= (uint8_t) COMP_CSR3_WNDWE;
 685  0003 72125442      	bset	21570,#1
 687  0007 2004          	jra	L503
 688  0009               L303:
 689                     ; 337     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_WNDWE);
 691  0009 72135442      	bres	21570,#1
 692  000d               L503:
 693                     ; 339 }
 696  000d 81            	ret
 732                     ; 362 void COMP_VrefintOutputCmd(FunctionalState NewState)
 732                     ; 363 {
 733                     .text:	section	.text,new
 734  0000               _COMP_VrefintOutputCmd:
 738                     ; 365   assert_param(IS_FUNCTIONAL_STATE(NewState));
 740                     ; 367   if (NewState != DISABLE)
 742  0000 4d            	tnz	a
 743  0001 2706          	jreq	L523
 744                     ; 370     COMP->CSR3 |= (uint8_t) COMP_CSR3_VREFOUTEN;
 746  0003 72105442      	bset	21570,#0
 748  0007 2004          	jra	L723
 749  0009               L523:
 750                     ; 375     COMP->CSR3 &= (uint8_t) (~COMP_CSR3_VREFOUTEN);
 752  0009 72115442      	bres	21570,#0
 753  000d               L723:
 754                     ; 377 }
 757  000d 81            	ret
 793                     ; 401 void COMP_SchmittTriggerCmd(FunctionalState NewState)
 793                     ; 402 {
 794                     .text:	section	.text,new
 795  0000               _COMP_SchmittTriggerCmd:
 799                     ; 404   assert_param(IS_FUNCTIONAL_STATE(NewState));
 801                     ; 406   if (NewState != DISABLE)
 803  0000 4d            	tnz	a
 804  0001 2706          	jreq	L743
 805                     ; 409     COMP->CSR1 |= (uint8_t) COMP_CSR1_STE;
 807  0003 72145440      	bset	21568,#2
 809  0007 2004          	jra	L153
 810  0009               L743:
 811                     ; 414     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_STE);
 813  0009 72155440      	bres	21568,#2
 814  000d               L153:
 815                     ; 416 }
 818  000d 81            	ret
 938                     ; 435 void COMP_TriggerConfig(COMP_TriggerGroup_TypeDef COMP_TriggerGroup,
 938                     ; 436                         COMP_TriggerPin_TypeDef COMP_TriggerPin,
 938                     ; 437                         FunctionalState NewState)
 938                     ; 438 {
 939                     .text:	section	.text,new
 940  0000               _COMP_TriggerConfig:
 942  0000 89            	pushw	x
 943       00000000      OFST:	set	0
 946                     ; 440   assert_param(IS_COMP_TRIGGERGROUP(COMP_TriggerGroup));
 948                     ; 441   assert_param(IS_COMP_TRIGGERPIN(COMP_TriggerPin));
 950                     ; 443   switch (COMP_TriggerGroup)
 952  0001 9e            	ld	a,xh
 954                     ; 490     default:
 954                     ; 491       break;
 955  0002 4a            	dec	a
 956  0003 270b          	jreq	L353
 957  0005 4a            	dec	a
 958  0006 2721          	jreq	L553
 959  0008 4a            	dec	a
 960  0009 273d          	jreq	L753
 961  000b 4a            	dec	a
 962  000c 2753          	jreq	L163
 963  000e 206e          	jra	L344
 964  0010               L353:
 965                     ; 445     case COMP_TriggerGroup_InvertingInput:
 965                     ; 446 
 965                     ; 447       if (NewState != DISABLE)
 967  0010 0d05          	tnz	(OFST+5,sp)
 968  0012 270b          	jreq	L544
 969                     ; 449         COMP->CSR4 &= (uint8_t) ~COMP_TriggerPin;
 971  0014 7b02          	ld	a,(OFST+2,sp)
 972  0016 43            	cpl	a
 973  0017 c45443        	and	a,21571
 974  001a c75443        	ld	21571,a
 976  001d 205f          	jra	L344
 977  001f               L544:
 978                     ; 453         COMP->CSR4 |= (uint8_t) COMP_TriggerPin;
 980  001f c65443        	ld	a,21571
 981  0022 1a02          	or	a,(OFST+2,sp)
 982  0024 c75443        	ld	21571,a
 983  0027 2055          	jra	L344
 984  0029               L553:
 985                     ; 457     case COMP_TriggerGroup_NonInvertingInput:
 985                     ; 458       if (NewState != DISABLE)
 987  0029 0d05          	tnz	(OFST+5,sp)
 988  002b 270e          	jreq	L154
 989                     ; 460         COMP->CSR4 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
 991  002d 7b02          	ld	a,(OFST+2,sp)
 992  002f 48            	sll	a
 993  0030 48            	sll	a
 994  0031 48            	sll	a
 995  0032 43            	cpl	a
 996  0033 c45443        	and	a,21571
 997  0036 c75443        	ld	21571,a
 999  0039 2043          	jra	L344
1000  003b               L154:
1001                     ; 464         COMP->CSR4 |= (uint8_t) (COMP_TriggerPin << 3);
1003  003b 7b02          	ld	a,(OFST+2,sp)
1004  003d 48            	sll	a
1005  003e 48            	sll	a
1006  003f 48            	sll	a
1007  0040 ca5443        	or	a,21571
1008  0043 c75443        	ld	21571,a
1009  0046 2036          	jra	L344
1010  0048               L753:
1011                     ; 468     case COMP_TriggerGroup_VREFINTOutput:
1011                     ; 469       if (NewState != DISABLE)
1013  0048 0d05          	tnz	(OFST+5,sp)
1014  004a 270b          	jreq	L554
1015                     ; 471         COMP->CSR5 &= (uint8_t) ~COMP_TriggerPin;
1017  004c 7b02          	ld	a,(OFST+2,sp)
1018  004e 43            	cpl	a
1019  004f c45444        	and	a,21572
1020  0052 c75444        	ld	21572,a
1022  0055 2027          	jra	L344
1023  0057               L554:
1024                     ; 475         COMP->CSR5 |= (uint8_t) COMP_TriggerPin;
1026  0057 c65444        	ld	a,21572
1027  005a 1a02          	or	a,(OFST+2,sp)
1028  005c c75444        	ld	21572,a
1029  005f 201d          	jra	L344
1030  0061               L163:
1031                     ; 479     case COMP_TriggerGroup_DACOutput:
1031                     ; 480       if (NewState != DISABLE)
1033  0061 0d05          	tnz	(OFST+5,sp)
1034  0063 270e          	jreq	L164
1035                     ; 482         COMP->CSR5 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
1037  0065 7b02          	ld	a,(OFST+2,sp)
1038  0067 48            	sll	a
1039  0068 48            	sll	a
1040  0069 48            	sll	a
1041  006a 43            	cpl	a
1042  006b c45444        	and	a,21572
1043  006e c75444        	ld	21572,a
1045  0071 200b          	jra	L344
1046  0073               L164:
1047                     ; 486         COMP->CSR5 |= (uint8_t) (COMP_TriggerPin << 3);
1049  0073 7b02          	ld	a,(OFST+2,sp)
1050  0075 48            	sll	a
1051  0076 48            	sll	a
1052  0077 48            	sll	a
1053  0078 ca5444        	or	a,21572
1054  007b c75444        	ld	21572,a
1055  007e               L363:
1056                     ; 490     default:
1056                     ; 491       break;
1058  007e               L344:
1059                     ; 493 }
1062  007e 85            	popw	x
1063  007f 81            	ret
1108                     ; 521 void COMP_ITConfig(COMP_Selection_TypeDef COMP_Selection, FunctionalState NewState)
1108                     ; 522 {
1109                     .text:	section	.text,new
1110  0000               _COMP_ITConfig:
1112  0000 89            	pushw	x
1113       00000000      OFST:	set	0
1116                     ; 524   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1118                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
1120                     ; 528   if (COMP_Selection == COMP_Selection_COMP1)
1122  0001 9e            	ld	a,xh
1123  0002 a101          	cp	a,#1
1124  0004 2610          	jrne	L705
1125                     ; 530     if (NewState != DISABLE)
1127  0006 9f            	ld	a,xl
1128  0007 4d            	tnz	a
1129  0008 2706          	jreq	L115
1130                     ; 533       COMP->CSR1 |= (uint8_t) COMP_CSR1_IE1;
1132  000a 721a5440      	bset	21568,#5
1134  000e 2014          	jra	L515
1135  0010               L115:
1136                     ; 538       COMP->CSR1 &= (uint8_t)(~COMP_CSR1_IE1);
1138  0010 721b5440      	bres	21568,#5
1139  0014 200e          	jra	L515
1140  0016               L705:
1141                     ; 543     if (NewState != DISABLE)
1143  0016 0d02          	tnz	(OFST+2,sp)
1144  0018 2706          	jreq	L715
1145                     ; 546       COMP->CSR2 |= (uint8_t) COMP_CSR2_IE2;
1147  001a 721a5441      	bset	21569,#5
1149  001e 2004          	jra	L515
1150  0020               L715:
1151                     ; 551       COMP->CSR2 &= (uint8_t)(~COMP_CSR2_IE2);
1153  0020 721b5441      	bres	21569,#5
1154  0024               L515:
1155                     ; 554 }
1158  0024 85            	popw	x
1159  0025 81            	ret
1225                     ; 564 FlagStatus COMP_GetFlagStatus(COMP_Selection_TypeDef COMP_Selection)
1225                     ; 565 {
1226                     .text:	section	.text,new
1227  0000               _COMP_GetFlagStatus:
1229  0000 88            	push	a
1230       00000001      OFST:	set	1
1233                     ; 566   FlagStatus bitstatus = RESET;
1235                     ; 569   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1237                     ; 572   if (COMP_Selection == COMP_Selection_COMP1)
1239  0001 a101          	cp	a,#1
1240  0003 2611          	jrne	L555
1241                     ; 574     if ((COMP->CSR1 & COMP_CSR1_EF1) != (uint8_t) RESET)
1243  0005 c65440        	ld	a,21568
1244  0008 a510          	bcp	a,#16
1245  000a 2706          	jreq	L755
1246                     ; 577       bitstatus = SET;
1248  000c a601          	ld	a,#1
1249  000e 6b01          	ld	(OFST+0,sp),a
1252  0010 2013          	jra	L365
1253  0012               L755:
1254                     ; 582       bitstatus = RESET;
1256  0012 0f01          	clr	(OFST+0,sp)
1258  0014 200f          	jra	L365
1259  0016               L555:
1260                     ; 587     if ((COMP->CSR2 & COMP_CSR2_EF2) != (uint8_t) RESET)
1262  0016 c65441        	ld	a,21569
1263  0019 a510          	bcp	a,#16
1264  001b 2706          	jreq	L565
1265                     ; 590       bitstatus = SET;
1267  001d a601          	ld	a,#1
1268  001f 6b01          	ld	(OFST+0,sp),a
1271  0021 2002          	jra	L365
1272  0023               L565:
1273                     ; 595       bitstatus = RESET;
1275  0023 0f01          	clr	(OFST+0,sp)
1277  0025               L365:
1278                     ; 600   return (FlagStatus)(bitstatus);
1280  0025 7b01          	ld	a,(OFST+0,sp)
1283  0027 5b01          	addw	sp,#1
1284  0029 81            	ret
1319                     ; 611 void COMP_ClearFlag(COMP_Selection_TypeDef COMP_Selection)
1319                     ; 612 {
1320                     .text:	section	.text,new
1321  0000               _COMP_ClearFlag:
1325                     ; 614   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1327                     ; 616   if (COMP_Selection == COMP_Selection_COMP1)
1329  0000 a101          	cp	a,#1
1330  0002 2606          	jrne	L706
1331                     ; 619     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1333  0004 72195440      	bres	21568,#4
1335  0008 2004          	jra	L116
1336  000a               L706:
1337                     ; 624     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1339  000a 72195441      	bres	21569,#4
1340  000e               L116:
1341                     ; 626 }
1344  000e 81            	ret
1408                     ; 636 ITStatus COMP_GetITStatus(COMP_Selection_TypeDef COMP_Selection)
1408                     ; 637 {
1409                     .text:	section	.text,new
1410  0000               _COMP_GetITStatus:
1412  0000 89            	pushw	x
1413       00000002      OFST:	set	2
1416                     ; 638   ITStatus bitstatus = RESET;
1418                     ; 639   uint8_t itstatus = 0x00, itenable = 0x00;
1422                     ; 642   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1424                     ; 644   if (COMP_Selection == COMP_Selection_COMP1)
1426  0001 a101          	cp	a,#1
1427  0003 2620          	jrne	L546
1428                     ; 647     itstatus = (uint8_t) (COMP->CSR1 & COMP_CSR1_EF1);
1430  0005 c65440        	ld	a,21568
1431  0008 a410          	and	a,#16
1432  000a 6b01          	ld	(OFST-1,sp),a
1434                     ; 650     itenable = (uint8_t) (COMP->CSR1 & COMP_CSR1_IE1);
1436  000c c65440        	ld	a,21568
1437  000f a420          	and	a,#32
1438  0011 6b02          	ld	(OFST+0,sp),a
1440                     ; 652     if ((itstatus != (uint8_t) RESET) && (itenable != (uint8_t) RESET))
1442  0013 0d01          	tnz	(OFST-1,sp)
1443  0015 270a          	jreq	L746
1445  0017 0d02          	tnz	(OFST+0,sp)
1446  0019 2706          	jreq	L746
1447                     ; 655       bitstatus = SET;
1449  001b a601          	ld	a,#1
1450  001d 6b02          	ld	(OFST+0,sp),a
1453  001f 2022          	jra	L356
1454  0021               L746:
1455                     ; 660       bitstatus = RESET;
1457  0021 0f02          	clr	(OFST+0,sp)
1459  0023 201e          	jra	L356
1460  0025               L546:
1461                     ; 666     itstatus = (uint8_t) (COMP->CSR2 & COMP_CSR2_EF2);
1463  0025 c65441        	ld	a,21569
1464  0028 a410          	and	a,#16
1465  002a 6b01          	ld	(OFST-1,sp),a
1467                     ; 669     itenable = (uint8_t) (COMP->CSR2 & COMP_CSR2_IE2);
1469  002c c65441        	ld	a,21569
1470  002f a420          	and	a,#32
1471  0031 6b02          	ld	(OFST+0,sp),a
1473                     ; 671     if ((itstatus != (uint8_t)RESET) && (itenable != (uint8_t)RESET))
1475  0033 0d01          	tnz	(OFST-1,sp)
1476  0035 270a          	jreq	L556
1478  0037 0d02          	tnz	(OFST+0,sp)
1479  0039 2706          	jreq	L556
1480                     ; 674       bitstatus = SET;
1482  003b a601          	ld	a,#1
1483  003d 6b02          	ld	(OFST+0,sp),a
1486  003f 2002          	jra	L356
1487  0041               L556:
1488                     ; 679       bitstatus = RESET;
1490  0041 0f02          	clr	(OFST+0,sp)
1492  0043               L356:
1493                     ; 684   return (ITStatus) bitstatus;
1495  0043 7b02          	ld	a,(OFST+0,sp)
1498  0045 85            	popw	x
1499  0046 81            	ret
1535                     ; 695 void COMP_ClearITPendingBit(COMP_Selection_TypeDef COMP_Selection)
1535                     ; 696 {
1536                     .text:	section	.text,new
1537  0000               _COMP_ClearITPendingBit:
1541                     ; 698   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1543                     ; 700   if (COMP_Selection == COMP_Selection_COMP1)
1545  0000 a101          	cp	a,#1
1546  0002 2606          	jrne	L776
1547                     ; 703     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1549  0004 72195440      	bres	21568,#4
1551  0008 2004          	jra	L107
1552  000a               L776:
1553                     ; 708     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1555  000a 72195441      	bres	21569,#4
1556  000e               L107:
1557                     ; 710 }
1560  000e 81            	ret
1573                     	xdef	_COMP_ClearITPendingBit
1574                     	xdef	_COMP_GetITStatus
1575                     	xdef	_COMP_ClearFlag
1576                     	xdef	_COMP_GetFlagStatus
1577                     	xdef	_COMP_ITConfig
1578                     	xdef	_COMP_TriggerConfig
1579                     	xdef	_COMP_SchmittTriggerCmd
1580                     	xdef	_COMP_VrefintOutputCmd
1581                     	xdef	_COMP_WindowCmd
1582                     	xdef	_COMP_GetOutputLevel
1583                     	xdef	_COMP_EdgeConfig
1584                     	xdef	_COMP_VrefintToCOMP1Connect
1585                     	xdef	_COMP_Init
1586                     	xdef	_COMP_DeInit
1605                     	end
