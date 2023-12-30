   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  43                     ; 119 void SYSCFG_RIDeInit(void)
  43                     ; 120 {
  45                     .text:	section	.text,new
  46  0000               _SYSCFG_RIDeInit:
  50                     ; 121   RI->ICR1   = RI_ICR1_RESET_VALUE;     /*!< Set RI->ICR1 to reset value */
  52  0000 725f5431      	clr	21553
  53                     ; 122   RI->ICR2   = RI_ICR2_RESET_VALUE;     /*!< Set RI->ICR2 to reset value */
  55  0004 725f5432      	clr	21554
  56                     ; 123   RI->IOSR1  = RI_IOSR1_RESET_VALUE;    /*!< Set RI->IOSR1 to reset value */
  58  0008 725f5439      	clr	21561
  59                     ; 124   RI->IOSR2  = RI_IOSR2_RESET_VALUE;    /*!< Set RI->IOSR2 to reset value */
  61  000c 725f543a      	clr	21562
  62                     ; 125   RI->IOSR3  = RI_IOSR3_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  64  0010 725f543b      	clr	21563
  65                     ; 126   RI->IOSR4  = RI_IOSR4_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  67  0014 725f5457      	clr	21591
  68                     ; 127   RI->ASCR1  = RI_ASCR1_RESET_VALUE;    /*!< Set RI->ASCR1 to reset value */
  70  0018 725f543d      	clr	21565
  71                     ; 128   RI->ASCR2  = RI_ASCR2_RESET_VALUE;    /*!< Set RI->ASCR2 to reset value */
  73  001c 725f543e      	clr	21566
  74                     ; 129   RI->RCR    = RI_RCR_RESET_VALUE;      /*!< Set RI->RCR to reset value */
  76  0020 725f543f      	clr	21567
  77                     ; 130 }
  80  0024 81            	ret
 339                     ; 142 void SYSCFG_RITIMInputCaptureConfig(RI_InputCapture_TypeDef RI_InputCapture,
 339                     ; 143                                     RI_InputCaptureRouting_TypeDef RI_InputCaptureRouting)
 339                     ; 144 {
 340                     .text:	section	.text,new
 341  0000               _SYSCFG_RITIMInputCaptureConfig:
 343  0000 89            	pushw	x
 344       00000000      OFST:	set	0
 347                     ; 146   assert_param(IS_RI_INPUTCAPTURE(RI_InputCapture));
 349                     ; 147   assert_param(IS_RI_INPUTCAPTUREROUTING(RI_InputCaptureRouting));
 351                     ; 150   if (RI_InputCapture == RI_InputCapture_IC2)
 353  0001 9e            	ld	a,xh
 354  0002 a102          	cp	a,#2
 355  0004 2606          	jrne	L531
 356                     ; 153     RI->ICR1 = (uint8_t) RI_InputCaptureRouting;
 358  0006 9f            	ld	a,xl
 359  0007 c75431        	ld	21553,a
 361  000a 2005          	jra	L731
 362  000c               L531:
 363                     ; 159     RI->ICR2 = (uint8_t) RI_InputCaptureRouting;
 365  000c 7b02          	ld	a,(OFST+2,sp)
 366  000e c75432        	ld	21554,a
 367  0011               L731:
 368                     ; 161 }
 371  0011 85            	popw	x
 372  0012 81            	ret
 554                     ; 184 void SYSCFG_RIAnalogSwitchConfig(RI_AnalogSwitch_TypeDef RI_AnalogSwitch,
 554                     ; 185                                  FunctionalState NewState)
 554                     ; 186 {
 555                     .text:	section	.text,new
 556  0000               _SYSCFG_RIAnalogSwitchConfig:
 558  0000 89            	pushw	x
 559  0001 89            	pushw	x
 560       00000002      OFST:	set	2
 563                     ; 187   uint8_t AnalogSwitchRegister, AnalogSwitchIndex = 0;
 565                     ; 190   assert_param(IS_RI_ANALOGSWITCH(RI_AnalogSwitch));
 567                     ; 191   assert_param(IS_FUNCTIONAL_STATE(NewState));
 569                     ; 194   AnalogSwitchRegister = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0xF0);
 571  0002 9e            	ld	a,xh
 572  0003 a4f0          	and	a,#240
 573  0005 6b01          	ld	(OFST-1,sp),a
 575                     ; 197   AnalogSwitchIndex = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0x0F);
 577  0007 7b03          	ld	a,(OFST+1,sp)
 578  0009 a40f          	and	a,#15
 579  000b 6b02          	ld	(OFST+0,sp),a
 581                     ; 199   if (NewState != DISABLE)
 583  000d 0d04          	tnz	(OFST+2,sp)
 584  000f 2730          	jreq	L142
 585                     ; 201     if (AnalogSwitchRegister == (uint8_t) 0x10)
 587  0011 7b01          	ld	a,(OFST-1,sp)
 588  0013 a110          	cp	a,#16
 589  0015 2615          	jrne	L342
 590                     ; 204       RI->ASCR1 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 592  0017 7b02          	ld	a,(OFST+0,sp)
 593  0019 5f            	clrw	x
 594  001a 97            	ld	xl,a
 595  001b a601          	ld	a,#1
 596  001d 5d            	tnzw	x
 597  001e 2704          	jreq	L21
 598  0020               L41:
 599  0020 48            	sll	a
 600  0021 5a            	decw	x
 601  0022 26fc          	jrne	L41
 602  0024               L21:
 603  0024 ca543d        	or	a,21565
 604  0027 c7543d        	ld	21565,a
 606  002a 2045          	jra	L742
 607  002c               L342:
 608                     ; 209       RI->ASCR2 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 610  002c 7b02          	ld	a,(OFST+0,sp)
 611  002e 5f            	clrw	x
 612  002f 97            	ld	xl,a
 613  0030 a601          	ld	a,#1
 614  0032 5d            	tnzw	x
 615  0033 2704          	jreq	L61
 616  0035               L02:
 617  0035 48            	sll	a
 618  0036 5a            	decw	x
 619  0037 26fc          	jrne	L02
 620  0039               L61:
 621  0039 ca543e        	or	a,21566
 622  003c c7543e        	ld	21566,a
 623  003f 2030          	jra	L742
 624  0041               L142:
 625                     ; 214     if (AnalogSwitchRegister == (uint8_t) 0x10)
 627  0041 7b01          	ld	a,(OFST-1,sp)
 628  0043 a110          	cp	a,#16
 629  0045 2616          	jrne	L152
 630                     ; 217       RI->ASCR1 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  AnalogSwitchIndex));
 632  0047 7b02          	ld	a,(OFST+0,sp)
 633  0049 5f            	clrw	x
 634  004a 97            	ld	xl,a
 635  004b a601          	ld	a,#1
 636  004d 5d            	tnzw	x
 637  004e 2704          	jreq	L22
 638  0050               L42:
 639  0050 48            	sll	a
 640  0051 5a            	decw	x
 641  0052 26fc          	jrne	L42
 642  0054               L22:
 643  0054 43            	cpl	a
 644  0055 c4543d        	and	a,21565
 645  0058 c7543d        	ld	21565,a
 647  005b 2014          	jra	L742
 648  005d               L152:
 649                     ; 222       RI->ASCR2 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << AnalogSwitchIndex));
 651  005d 7b02          	ld	a,(OFST+0,sp)
 652  005f 5f            	clrw	x
 653  0060 97            	ld	xl,a
 654  0061 a601          	ld	a,#1
 655  0063 5d            	tnzw	x
 656  0064 2704          	jreq	L62
 657  0066               L03:
 658  0066 48            	sll	a
 659  0067 5a            	decw	x
 660  0068 26fc          	jrne	L03
 661  006a               L62:
 662  006a 43            	cpl	a
 663  006b c4543e        	and	a,21566
 664  006e c7543e        	ld	21566,a
 665  0071               L742:
 666                     ; 225 }
 669  0071 5b04          	addw	sp,#4
 670  0073 81            	ret
 936                     ; 234 void SYSCFG_RIIOSwitchConfig(RI_IOSwitch_TypeDef RI_IOSwitch,
 936                     ; 235                              FunctionalState NewState)
 936                     ; 236 {
 937                     .text:	section	.text,new
 938  0000               _SYSCFG_RIIOSwitchConfig:
 940  0000 89            	pushw	x
 941  0001 89            	pushw	x
 942       00000002      OFST:	set	2
 945                     ; 237   uint8_t IOSwitchRegister, IOSwitchIndex = 0;
 947                     ; 240   assert_param(IS_RI_IOSWITCH(RI_IOSwitch));
 949                     ; 241   assert_param(IS_FUNCTIONAL_STATE(NewState));
 951                     ; 244   IOSwitchIndex = (uint8_t) (RI_IOSwitch & (uint8_t) 0x0F);
 953  0002 9e            	ld	a,xh
 954  0003 a40f          	and	a,#15
 955  0005 6b02          	ld	(OFST+0,sp),a
 957                     ; 247   IOSwitchRegister = (uint8_t) (RI_IOSwitch & (uint8_t) 0xF0);
 959  0007 7b03          	ld	a,(OFST+1,sp)
 960  0009 a4f0          	and	a,#240
 961  000b 6b01          	ld	(OFST-1,sp),a
 963                     ; 250   if (IOSwitchRegister == (uint8_t) 0x10)
 965  000d 7b01          	ld	a,(OFST-1,sp)
 966  000f a110          	cp	a,#16
 967  0011 2633          	jrne	L304
 968                     ; 252     if (NewState != DISABLE)
 970  0013 0d04          	tnz	(OFST+2,sp)
 971  0015 2717          	jreq	L504
 972                     ; 255       RI->IOSR1 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 974  0017 7b02          	ld	a,(OFST+0,sp)
 975  0019 5f            	clrw	x
 976  001a 97            	ld	xl,a
 977  001b a601          	ld	a,#1
 978  001d 5d            	tnzw	x
 979  001e 2704          	jreq	L43
 980  0020               L63:
 981  0020 48            	sll	a
 982  0021 5a            	decw	x
 983  0022 26fc          	jrne	L63
 984  0024               L43:
 985  0024 ca5439        	or	a,21561
 986  0027 c75439        	ld	21561,a
 988  002a acdd00dd      	jpf	L114
 989  002e               L504:
 990                     ; 260       RI->IOSR1 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << IOSwitchIndex));
 992  002e 7b02          	ld	a,(OFST+0,sp)
 993  0030 5f            	clrw	x
 994  0031 97            	ld	xl,a
 995  0032 a601          	ld	a,#1
 996  0034 5d            	tnzw	x
 997  0035 2704          	jreq	L04
 998  0037               L24:
 999  0037 48            	sll	a
1000  0038 5a            	decw	x
1001  0039 26fc          	jrne	L24
1002  003b               L04:
1003  003b 43            	cpl	a
1004  003c c45439        	and	a,21561
1005  003f c75439        	ld	21561,a
1006  0042 acdd00dd      	jpf	L114
1007  0046               L304:
1008                     ; 265   else if (IOSwitchRegister == (uint8_t) 0x20)
1010  0046 7b01          	ld	a,(OFST-1,sp)
1011  0048 a120          	cp	a,#32
1012  004a 262f          	jrne	L314
1013                     ; 267     if (NewState != DISABLE)
1015  004c 0d04          	tnz	(OFST+2,sp)
1016  004e 2715          	jreq	L514
1017                     ; 270       RI->IOSR2 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1019  0050 7b02          	ld	a,(OFST+0,sp)
1020  0052 5f            	clrw	x
1021  0053 97            	ld	xl,a
1022  0054 a601          	ld	a,#1
1023  0056 5d            	tnzw	x
1024  0057 2704          	jreq	L44
1025  0059               L64:
1026  0059 48            	sll	a
1027  005a 5a            	decw	x
1028  005b 26fc          	jrne	L64
1029  005d               L44:
1030  005d ca543a        	or	a,21562
1031  0060 c7543a        	ld	21562,a
1033  0063 2078          	jra	L114
1034  0065               L514:
1035                     ; 275       RI->IOSR2 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  IOSwitchIndex));
1037  0065 7b02          	ld	a,(OFST+0,sp)
1038  0067 5f            	clrw	x
1039  0068 97            	ld	xl,a
1040  0069 a601          	ld	a,#1
1041  006b 5d            	tnzw	x
1042  006c 2704          	jreq	L05
1043  006e               L25:
1044  006e 48            	sll	a
1045  006f 5a            	decw	x
1046  0070 26fc          	jrne	L25
1047  0072               L05:
1048  0072 43            	cpl	a
1049  0073 c4543a        	and	a,21562
1050  0076 c7543a        	ld	21562,a
1051  0079 2062          	jra	L114
1052  007b               L314:
1053                     ; 280   else if (IOSwitchRegister == (uint8_t) 0x30)
1055  007b 7b01          	ld	a,(OFST-1,sp)
1056  007d a130          	cp	a,#48
1057  007f 262f          	jrne	L324
1058                     ; 282     if (NewState != DISABLE)
1060  0081 0d04          	tnz	(OFST+2,sp)
1061  0083 2715          	jreq	L524
1062                     ; 285       RI->IOSR3 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1064  0085 7b02          	ld	a,(OFST+0,sp)
1065  0087 5f            	clrw	x
1066  0088 97            	ld	xl,a
1067  0089 a601          	ld	a,#1
1068  008b 5d            	tnzw	x
1069  008c 2704          	jreq	L45
1070  008e               L65:
1071  008e 48            	sll	a
1072  008f 5a            	decw	x
1073  0090 26fc          	jrne	L65
1074  0092               L45:
1075  0092 ca543b        	or	a,21563
1076  0095 c7543b        	ld	21563,a
1078  0098 2043          	jra	L114
1079  009a               L524:
1080                     ; 290       RI->IOSR3 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1082  009a 7b02          	ld	a,(OFST+0,sp)
1083  009c 5f            	clrw	x
1084  009d 97            	ld	xl,a
1085  009e a601          	ld	a,#1
1086  00a0 5d            	tnzw	x
1087  00a1 2704          	jreq	L06
1088  00a3               L26:
1089  00a3 48            	sll	a
1090  00a4 5a            	decw	x
1091  00a5 26fc          	jrne	L26
1092  00a7               L06:
1093  00a7 43            	cpl	a
1094  00a8 c4543b        	and	a,21563
1095  00ab c7543b        	ld	21563,a
1096  00ae 202d          	jra	L114
1097  00b0               L324:
1098                     ; 297     if (NewState != DISABLE)
1100  00b0 0d04          	tnz	(OFST+2,sp)
1101  00b2 2715          	jreq	L334
1102                     ; 300       RI->IOSR4 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1104  00b4 7b02          	ld	a,(OFST+0,sp)
1105  00b6 5f            	clrw	x
1106  00b7 97            	ld	xl,a
1107  00b8 a601          	ld	a,#1
1108  00ba 5d            	tnzw	x
1109  00bb 2704          	jreq	L46
1110  00bd               L66:
1111  00bd 48            	sll	a
1112  00be 5a            	decw	x
1113  00bf 26fc          	jrne	L66
1114  00c1               L46:
1115  00c1 ca5457        	or	a,21591
1116  00c4 c75457        	ld	21591,a
1118  00c7 2014          	jra	L114
1119  00c9               L334:
1120                     ; 305       RI->IOSR4 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1122  00c9 7b02          	ld	a,(OFST+0,sp)
1123  00cb 5f            	clrw	x
1124  00cc 97            	ld	xl,a
1125  00cd a601          	ld	a,#1
1126  00cf 5d            	tnzw	x
1127  00d0 2704          	jreq	L07
1128  00d2               L27:
1129  00d2 48            	sll	a
1130  00d3 5a            	decw	x
1131  00d4 26fc          	jrne	L27
1132  00d6               L07:
1133  00d6 43            	cpl	a
1134  00d7 c45457        	and	a,21591
1135  00da c75457        	ld	21591,a
1136  00dd               L114:
1137                     ; 308 }
1140  00dd 5b04          	addw	sp,#4
1141  00df 81            	ret
1221                     ; 320 void SYSCFG_RIResistorConfig(RI_Resistor_TypeDef RI_Resistor, FunctionalState NewState)
1221                     ; 321 {
1222                     .text:	section	.text,new
1223  0000               _SYSCFG_RIResistorConfig:
1225  0000 89            	pushw	x
1226       00000000      OFST:	set	0
1229                     ; 323   assert_param(IS_RI_RESISTOR(RI_Resistor));
1231                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
1233                     ; 326   if (NewState != DISABLE)
1235  0001 9f            	ld	a,xl
1236  0002 4d            	tnz	a
1237  0003 2709          	jreq	L574
1238                     ; 329     RI->RCR |= (uint8_t) RI_Resistor;
1240  0005 9e            	ld	a,xh
1241  0006 ca543f        	or	a,21567
1242  0009 c7543f        	ld	21567,a
1244  000c 2009          	jra	L774
1245  000e               L574:
1246                     ; 334     RI->RCR &= (uint8_t) (~RI_Resistor);
1248  000e 7b01          	ld	a,(OFST+1,sp)
1249  0010 43            	cpl	a
1250  0011 c4543f        	and	a,21567
1251  0014 c7543f        	ld	21567,a
1252  0017               L774:
1253                     ; 336 }
1256  0017 85            	popw	x
1257  0018 81            	ret
1280                     ; 368 void SYSCFG_REMAPDeInit(void)
1280                     ; 369 {
1281                     .text:	section	.text,new
1282  0000               _SYSCFG_REMAPDeInit:
1286                     ; 371   SYSCFG->RMPCR1 = SYSCFG_RMPCR1_RESET_VALUE;
1288  0000 350c509e      	mov	20638,#12
1289                     ; 374   SYSCFG->RMPCR2 = SYSCFG_RMPCR2_RESET_VALUE;
1291  0004 725f509f      	clr	20639
1292                     ; 377   SYSCFG->RMPCR3 = SYSCFG_RMPCR3_RESET_VALUE;
1294  0008 725f509d      	clr	20637
1295                     ; 378 }
1298  000c 81            	ret
1516                     ; 411 void SYSCFG_REMAPPinConfig(REMAP_Pin_TypeDef REMAP_Pin, FunctionalState NewState)
1516                     ; 412 {
1517                     .text:	section	.text,new
1518  0000               _SYSCFG_REMAPPinConfig:
1520  0000 89            	pushw	x
1521  0001 88            	push	a
1522       00000001      OFST:	set	1
1525                     ; 413   uint8_t regindex = 0;
1527                     ; 415   assert_param(IS_REMAP_PIN(REMAP_Pin));
1529                     ; 416   assert_param(IS_FUNCTIONAL_STATE(NewState));
1531                     ; 419   regindex = (uint8_t) ((uint16_t) REMAP_Pin >> 8);
1533  0002 9e            	ld	a,xh
1534  0003 6b01          	ld	(OFST+0,sp),a
1536                     ; 422   if (regindex == 0x01)
1538  0005 7b01          	ld	a,(OFST+0,sp)
1539  0007 a101          	cp	a,#1
1540  0009 261e          	jrne	L316
1541                     ; 424     SYSCFG->RMPCR1 &= (uint8_t)((uint8_t)((uint8_t)REMAP_Pin << 4) | (uint8_t)0x0F);
1543  000b 9f            	ld	a,xl
1544  000c 97            	ld	xl,a
1545  000d a610          	ld	a,#16
1546  000f 42            	mul	x,a
1547  0010 9f            	ld	a,xl
1548  0011 aa0f          	or	a,#15
1549  0013 c4509e        	and	a,20638
1550  0016 c7509e        	ld	20638,a
1551                     ; 425     if (NewState != DISABLE)
1553  0019 0d06          	tnz	(OFST+5,sp)
1554  001b 2742          	jreq	L716
1555                     ; 427       SYSCFG->RMPCR1 |= (uint8_t)((uint16_t)REMAP_Pin & (uint16_t)0x00F0);
1557  001d 7b03          	ld	a,(OFST+2,sp)
1558  001f a4f0          	and	a,#240
1559  0021 ca509e        	or	a,20638
1560  0024 c7509e        	ld	20638,a
1561  0027 2036          	jra	L716
1562  0029               L316:
1563                     ; 431   else if (regindex == 0x02)
1565  0029 7b01          	ld	a,(OFST+0,sp)
1566  002b a102          	cp	a,#2
1567  002d 2619          	jrne	L126
1568                     ; 433     if (NewState != DISABLE)
1570  002f 0d06          	tnz	(OFST+5,sp)
1571  0031 270a          	jreq	L326
1572                     ; 435       SYSCFG->RMPCR2 |= (uint8_t) REMAP_Pin;
1574  0033 c6509f        	ld	a,20639
1575  0036 1a03          	or	a,(OFST+2,sp)
1576  0038 c7509f        	ld	20639,a
1578  003b 2022          	jra	L716
1579  003d               L326:
1580                     ; 439       SYSCFG->RMPCR2 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1582  003d 7b03          	ld	a,(OFST+2,sp)
1583  003f 43            	cpl	a
1584  0040 c4509f        	and	a,20639
1585  0043 c7509f        	ld	20639,a
1586  0046 2017          	jra	L716
1587  0048               L126:
1588                     ; 445     if (NewState != DISABLE)
1590  0048 0d06          	tnz	(OFST+5,sp)
1591  004a 270a          	jreq	L136
1592                     ; 447       SYSCFG->RMPCR3 |= (uint8_t) REMAP_Pin;
1594  004c c6509d        	ld	a,20637
1595  004f 1a03          	or	a,(OFST+2,sp)
1596  0051 c7509d        	ld	20637,a
1598  0054 2009          	jra	L716
1599  0056               L136:
1600                     ; 451       SYSCFG->RMPCR3 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1602  0056 7b03          	ld	a,(OFST+2,sp)
1603  0058 43            	cpl	a
1604  0059 c4509d        	and	a,20637
1605  005c c7509d        	ld	20637,a
1606  005f               L716:
1607                     ; 454 }
1610  005f 5b03          	addw	sp,#3
1611  0061 81            	ret
1717                     ; 470 void SYSCFG_REMAPDMAChannelConfig(REMAP_DMAChannel_TypeDef REMAP_DMAChannel)
1717                     ; 471 {
1718                     .text:	section	.text,new
1719  0000               _SYSCFG_REMAPDMAChannelConfig:
1721  0000 88            	push	a
1722       00000000      OFST:	set	0
1725                     ; 473   assert_param(IS_REMAP_DMACHANNEL(REMAP_DMAChannel));
1727                     ; 476   if ((REMAP_DMAChannel & 0xF0) != RESET)
1729  0001 a5f0          	bcp	a,#240
1730  0003 270a          	jreq	L776
1731                     ; 479     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_TIM4DMA_REMAP);
1733  0005 c6509e        	ld	a,20638
1734  0008 a4f3          	and	a,#243
1735  000a c7509e        	ld	20638,a
1737  000d 2008          	jra	L107
1738  000f               L776:
1739                     ; 485     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_ADC1DMA_REMAP);
1741  000f c6509e        	ld	a,20638
1742  0012 a4fc          	and	a,#252
1743  0014 c7509e        	ld	20638,a
1744  0017               L107:
1745                     ; 488   SYSCFG->RMPCR1 |= (uint8_t) ((uint8_t)0x0F & REMAP_DMAChannel);
1747  0017 7b01          	ld	a,(OFST+1,sp)
1748  0019 a40f          	and	a,#15
1749  001b ca509e        	or	a,20638
1750  001e c7509e        	ld	20638,a
1751                     ; 489 }
1754  0021 84            	pop	a
1755  0022 81            	ret
1768                     	xdef	_SYSCFG_REMAPDMAChannelConfig
1769                     	xdef	_SYSCFG_REMAPPinConfig
1770                     	xdef	_SYSCFG_REMAPDeInit
1771                     	xdef	_SYSCFG_RIResistorConfig
1772                     	xdef	_SYSCFG_RIIOSwitchConfig
1773                     	xdef	_SYSCFG_RIAnalogSwitchConfig
1774                     	xdef	_SYSCFG_RITIMInputCaptureConfig
1775                     	xdef	_SYSCFG_RIDeInit
1794                     	end
