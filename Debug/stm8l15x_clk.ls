   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  15                     .const:	section	.text
  16  0000               _SYSDivFactor:
  17  0000 01            	dc.b	1
  18  0001 02            	dc.b	2
  19  0002 04            	dc.b	4
  20  0003 08            	dc.b	8
  21  0004 10            	dc.b	16
  50                     ; 120 void CLK_DeInit(void)
  50                     ; 121 {
  52                     .text:	section	.text,new
  53  0000               _CLK_DeInit:
  57                     ; 122   CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
  59  0000 351150c2      	mov	20674,#17
  60                     ; 123   CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
  62  0004 725f50c6      	clr	20678
  63                     ; 124   CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
  65  0008 725f50c1      	clr	20673
  66                     ; 125   CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
  68  000c 725f50cb      	clr	20683
  69                     ; 126   CLK->SWR  = CLK_SWR_RESET_VALUE;
  71  0010 350150c8      	mov	20680,#1
  72                     ; 127   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  74  0014 725f50c9      	clr	20681
  75                     ; 128   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  77  0018 350350c0      	mov	20672,#3
  78                     ; 129   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  80  001c 725f50c3      	clr	20675
  81                     ; 130   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  83  0020 358050c4      	mov	20676,#128
  84                     ; 131   CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
  86  0024 725f50d0      	clr	20688
  87                     ; 132   CLK->CSSR  = CLK_CSSR_RESET_VALUE;
  89  0028 725f50ca      	clr	20682
  90                     ; 133   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  92  002c 725f50c5      	clr	20677
  93                     ; 134   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
  95  0030 725f50cd      	clr	20685
  96                     ; 135   CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
  98  0034 725f50cc      	clr	20684
  99                     ; 136   CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
 101  0038 725f50ce      	clr	20686
 102                     ; 137   CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
 104  003c 35b950cf      	mov	20687,#185
 105                     ; 138 }
 108  0040 81            	ret
 163                     ; 160 void CLK_HSICmd(FunctionalState NewState)
 163                     ; 161 {
 164                     .text:	section	.text,new
 165  0000               _CLK_HSICmd:
 169                     ; 163   assert_param(IS_FUNCTIONAL_STATE(NewState));
 171                     ; 165   if (NewState != DISABLE)
 173  0000 4d            	tnz	a
 174  0001 2706          	jreq	L74
 175                     ; 168     CLK->ICKCR |= CLK_ICKCR_HSION;
 177  0003 721050c2      	bset	20674,#0
 179  0007 2004          	jra	L15
 180  0009               L74:
 181                     ; 173     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
 183  0009 721150c2      	bres	20674,#0
 184  000d               L15:
 185                     ; 175 }
 188  000d 81            	ret
 224                     ; 188 void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
 224                     ; 189 {
 225                     .text:	section	.text,new
 226  0000               _CLK_AdjustHSICalibrationValue:
 230                     ; 191   CLK->HSIUNLCKR = 0xAC;
 232  0000 35ac50ce      	mov	20686,#172
 233                     ; 192   CLK->HSIUNLCKR = 0x35;
 235  0004 353550ce      	mov	20686,#53
 236                     ; 195   CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
 238  0008 c750cd        	ld	20685,a
 239                     ; 196 }
 242  000b 81            	ret
 277                     ; 212 void CLK_LSICmd(FunctionalState NewState)
 277                     ; 213 {
 278                     .text:	section	.text,new
 279  0000               _CLK_LSICmd:
 283                     ; 216   assert_param(IS_FUNCTIONAL_STATE(NewState));
 285                     ; 218   if (NewState != DISABLE)
 287  0000 4d            	tnz	a
 288  0001 2706          	jreq	L701
 289                     ; 221     CLK->ICKCR |= CLK_ICKCR_LSION;
 291  0003 721450c2      	bset	20674,#2
 293  0007 2004          	jra	L111
 294  0009               L701:
 295                     ; 226     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
 297  0009 721550c2      	bres	20674,#2
 298  000d               L111:
 299                     ; 228 }
 302  000d 81            	ret
 364                     ; 249 void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
 364                     ; 250 {
 365                     .text:	section	.text,new
 366  0000               _CLK_HSEConfig:
 370                     ; 252   assert_param(IS_CLK_HSE(CLK_HSE));
 372                     ; 256   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
 374  0000 721150c6      	bres	20678,#0
 375                     ; 259   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
 377  0004 721950c6      	bres	20678,#4
 378                     ; 262   CLK->ECKCR |= (uint8_t)CLK_HSE;
 380  0008 ca50c6        	or	a,20678
 381  000b c750c6        	ld	20678,a
 382                     ; 263 }
 385  000e 81            	ret
 447                     ; 280 void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
 447                     ; 281 {
 448                     .text:	section	.text,new
 449  0000               _CLK_LSEConfig:
 453                     ; 283   assert_param(IS_CLK_LSE(CLK_LSE));
 455                     ; 287   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
 457  0000 721550c6      	bres	20678,#2
 458                     ; 290   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
 460  0004 721b50c6      	bres	20678,#5
 461                     ; 293   CLK->ECKCR |= (uint8_t)CLK_LSE;
 463  0008 ca50c6        	or	a,20678
 464  000b c750c6        	ld	20678,a
 465                     ; 295 }
 468  000e 81            	ret
 492                     ; 306 void CLK_ClockSecuritySystemEnable(void)
 492                     ; 307 {
 493                     .text:	section	.text,new
 494  0000               _CLK_ClockSecuritySystemEnable:
 498                     ; 309   CLK->CSSR |= CLK_CSSR_CSSEN;
 500  0000 721050ca      	bset	20682,#0
 501                     ; 310 }
 504  0004 81            	ret
 540                     ; 317 void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
 540                     ; 318 {
 541                     .text:	section	.text,new
 542  0000               _CLK_ClockSecuritySytemDeglitchCmd:
 546                     ; 320   assert_param(IS_FUNCTIONAL_STATE(NewState));
 548                     ; 322   if (NewState != DISABLE)
 550  0000 4d            	tnz	a
 551  0001 2706          	jreq	L122
 552                     ; 325     CLK->CSSR |= CLK_CSSR_CSSDGON;
 554  0003 721850ca      	bset	20682,#4
 556  0007 2004          	jra	L322
 557  0009               L122:
 558                     ; 330     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
 560  0009 721950ca      	bres	20682,#4
 561  000d               L322:
 562                     ; 332 }
 565  000d 81            	ret
 706                     ; 356 void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
 706                     ; 357 {
 707                     .text:	section	.text,new
 708  0000               _CLK_CCOConfig:
 710  0000 89            	pushw	x
 711       00000000      OFST:	set	0
 714                     ; 359   assert_param(IS_CLK_OUTPUT(CLK_CCOSource));
 716                     ; 360   assert_param(IS_CLK_OUTPUT_DIVIDER(CLK_CCODiv));
 718                     ; 363   CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
 720  0001 9f            	ld	a,xl
 721  0002 1a01          	or	a,(OFST+1,sp)
 722  0004 c750c5        	ld	20677,a
 723                     ; 364 }
 726  0007 85            	popw	x
 727  0008 81            	ret
 801                     ; 416 void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
 801                     ; 417 {
 802                     .text:	section	.text,new
 803  0000               _CLK_SYSCLKSourceConfig:
 807                     ; 419   assert_param(IS_CLK_SOURCE(CLK_SYSCLKSource));
 809                     ; 422   CLK->SWR = (uint8_t)CLK_SYSCLKSource;
 811  0000 c750c8        	ld	20680,a
 812                     ; 423 }
 815  0003 81            	ret
 840                     ; 435 CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
 840                     ; 436 {
 841                     .text:	section	.text,new
 842  0000               _CLK_GetSYSCLKSource:
 846                     ; 437   return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
 848  0000 c650c7        	ld	a,20679
 851  0003 81            	ret
 923                     ; 478 uint32_t CLK_GetClockFreq(void)
 923                     ; 479 {
 924                     .text:	section	.text,new
 925  0000               _CLK_GetClockFreq:
 927  0000 5209          	subw	sp,#9
 928       00000009      OFST:	set	9
 931                     ; 480   uint32_t clockfrequency = 0;
 933                     ; 481   uint32_t sourcefrequency = 0;
 935  0002 ae0000        	ldw	x,#0
 936  0005 1f07          	ldw	(OFST-2,sp),x
 937  0007 ae0000        	ldw	x,#0
 938  000a 1f05          	ldw	(OFST-4,sp),x
 940                     ; 482   CLK_SYSCLKSource_TypeDef clocksource = CLK_SYSCLKSource_HSI;
 942                     ; 483   uint8_t tmp = 0, presc = 0;
 946                     ; 486   clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
 948  000c c650c7        	ld	a,20679
 949  000f 6b09          	ld	(OFST+0,sp),a
 951                     ; 488   if ( clocksource == CLK_SYSCLKSource_HSI)
 953  0011 7b09          	ld	a,(OFST+0,sp)
 954  0013 a101          	cp	a,#1
 955  0015 260c          	jrne	L704
 956                     ; 490     sourcefrequency = HSI_VALUE;
 958  0017 ae2400        	ldw	x,#9216
 959  001a 1f07          	ldw	(OFST-2,sp),x
 960  001c ae00f4        	ldw	x,#244
 961  001f 1f05          	ldw	(OFST-4,sp),x
 964  0021 2022          	jra	L114
 965  0023               L704:
 966                     ; 492   else if ( clocksource == CLK_SYSCLKSource_LSI)
 968  0023 7b09          	ld	a,(OFST+0,sp)
 969  0025 a102          	cp	a,#2
 970  0027 260c          	jrne	L314
 971                     ; 494     sourcefrequency = LSI_VALUE;
 973  0029 ae9470        	ldw	x,#38000
 974  002c 1f07          	ldw	(OFST-2,sp),x
 975  002e ae0000        	ldw	x,#0
 976  0031 1f05          	ldw	(OFST-4,sp),x
 979  0033 2010          	jra	L114
 980  0035               L314:
 981                     ; 496   else if ( clocksource == CLK_SYSCLKSource_HSE)
 983  0035 7b09          	ld	a,(OFST+0,sp)
 984  0037 a104          	cp	a,#4
 985  0039 260a          	jrne	L714
 986                     ; 498     sourcefrequency = HSE_VALUE;
 988  003b ae2400        	ldw	x,#9216
 989  003e 1f07          	ldw	(OFST-2,sp),x
 990  0040 ae00f4        	ldw	x,#244
 991  0043 1f05          	ldw	(OFST-4,sp),x
 994  0045               L714:
 995                     ; 502     clockfrequency = LSE_VALUE;
 997  0045               L114:
 998                     ; 506   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
1000  0045 c650c0        	ld	a,20672
1001  0048 a407          	and	a,#7
1002  004a 6b09          	ld	(OFST+0,sp),a
1004                     ; 507   presc = SYSDivFactor[tmp];
1006  004c 7b09          	ld	a,(OFST+0,sp)
1007  004e 5f            	clrw	x
1008  004f 97            	ld	xl,a
1009  0050 d60000        	ld	a,(_SYSDivFactor,x)
1010  0053 6b09          	ld	(OFST+0,sp),a
1012                     ; 510   clockfrequency = sourcefrequency / presc;
1014  0055 7b09          	ld	a,(OFST+0,sp)
1015  0057 b703          	ld	c_lreg+3,a
1016  0059 3f02          	clr	c_lreg+2
1017  005b 3f01          	clr	c_lreg+1
1018  005d 3f00          	clr	c_lreg
1019  005f 96            	ldw	x,sp
1020  0060 1c0001        	addw	x,#OFST-8
1021  0063 cd0000        	call	c_rtol
1024  0066 96            	ldw	x,sp
1025  0067 1c0005        	addw	x,#OFST-4
1026  006a cd0000        	call	c_ltor
1028  006d 96            	ldw	x,sp
1029  006e 1c0001        	addw	x,#OFST-8
1030  0071 cd0000        	call	c_ludv
1032  0074 96            	ldw	x,sp
1033  0075 1c0005        	addw	x,#OFST-4
1034  0078 cd0000        	call	c_rtol
1037                     ; 512   return((uint32_t)clockfrequency);
1039  007b 96            	ldw	x,sp
1040  007c 1c0005        	addw	x,#OFST-4
1041  007f cd0000        	call	c_ltor
1045  0082 5b09          	addw	sp,#9
1046  0084 81            	ret
1144                     ; 528 void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
1144                     ; 529 {
1145                     .text:	section	.text,new
1146  0000               _CLK_SYSCLKDivConfig:
1150                     ; 531   assert_param(IS_CLK_SYSTEM_DIVIDER(CLK_SYSCLKDiv));
1152                     ; 533   CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
1154  0000 c750c0        	ld	20672,a
1155                     ; 534 }
1158  0003 81            	ret
1194                     ; 541 void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
1194                     ; 542 {
1195                     .text:	section	.text,new
1196  0000               _CLK_SYSCLKSourceSwitchCmd:
1200                     ; 544   assert_param(IS_FUNCTIONAL_STATE(NewState));
1202                     ; 546   if (NewState != DISABLE)
1204  0000 4d            	tnz	a
1205  0001 2706          	jreq	L305
1206                     ; 549     CLK->SWCR |= CLK_SWCR_SWEN;
1208  0003 721250c9      	bset	20681,#1
1210  0007 2004          	jra	L505
1211  0009               L305:
1212                     ; 554     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
1214  0009 721350c9      	bres	20681,#1
1215  000d               L505:
1216                     ; 556 }
1219  000d 81            	ret
1365                     ; 616 void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
1365                     ; 617 {
1366                     .text:	section	.text,new
1367  0000               _CLK_RTCClockConfig:
1369  0000 89            	pushw	x
1370       00000000      OFST:	set	0
1373                     ; 619   assert_param(IS_CLK_CLOCK_RTC(CLK_RTCCLKSource));
1375                     ; 620   assert_param(IS_CLK_CLOCK_RTC_DIV(CLK_RTCCLKDiv));
1377                     ; 623   CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
1379  0001 9f            	ld	a,xl
1380  0002 1a01          	or	a,(OFST+1,sp)
1381  0004 c750c1        	ld	20673,a
1382                     ; 624 }
1385  0007 85            	popw	x
1386  0008 81            	ret
1452                     ; 635 void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
1452                     ; 636 {
1453                     .text:	section	.text,new
1454  0000               _CLK_BEEPClockConfig:
1458                     ; 638   assert_param(IS_CLK_CLOCK_BEEP(CLK_BEEPCLKSource));
1460                     ; 641   CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
1462  0000 c750cb        	ld	20683,a
1463                     ; 643 }
1466  0003 81            	ret
1691                     ; 677 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
1691                     ; 678 {
1692                     .text:	section	.text,new
1693  0000               _CLK_PeripheralClockConfig:
1695  0000 89            	pushw	x
1696  0001 88            	push	a
1697       00000001      OFST:	set	1
1700                     ; 679   uint8_t reg = 0;
1702                     ; 682   assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
1704                     ; 683   assert_param(IS_FUNCTIONAL_STATE(NewState));
1706                     ; 686   reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
1708  0002 9e            	ld	a,xh
1709  0003 a4f0          	and	a,#240
1710  0005 6b01          	ld	(OFST+0,sp),a
1712                     ; 688   if ( reg == 0x00)
1714  0007 0d01          	tnz	(OFST+0,sp)
1715  0009 2635          	jrne	L527
1716                     ; 690     if (NewState != DISABLE)
1718  000b 0d03          	tnz	(OFST+2,sp)
1719  000d 2719          	jreq	L727
1720                     ; 693       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1722  000f 7b02          	ld	a,(OFST+1,sp)
1723  0011 a40f          	and	a,#15
1724  0013 5f            	clrw	x
1725  0014 97            	ld	xl,a
1726  0015 a601          	ld	a,#1
1727  0017 5d            	tnzw	x
1728  0018 2704          	jreq	L64
1729  001a               L05:
1730  001a 48            	sll	a
1731  001b 5a            	decw	x
1732  001c 26fc          	jrne	L05
1733  001e               L64:
1734  001e ca50c3        	or	a,20675
1735  0021 c750c3        	ld	20675,a
1737  0024 acaa00aa      	jpf	L337
1738  0028               L727:
1739                     ; 698       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1741  0028 7b02          	ld	a,(OFST+1,sp)
1742  002a a40f          	and	a,#15
1743  002c 5f            	clrw	x
1744  002d 97            	ld	xl,a
1745  002e a601          	ld	a,#1
1746  0030 5d            	tnzw	x
1747  0031 2704          	jreq	L25
1748  0033               L45:
1749  0033 48            	sll	a
1750  0034 5a            	decw	x
1751  0035 26fc          	jrne	L45
1752  0037               L25:
1753  0037 43            	cpl	a
1754  0038 c450c3        	and	a,20675
1755  003b c750c3        	ld	20675,a
1756  003e 206a          	jra	L337
1757  0040               L527:
1758                     ; 701   else if (reg == 0x10)
1760  0040 7b01          	ld	a,(OFST+0,sp)
1761  0042 a110          	cp	a,#16
1762  0044 2633          	jrne	L537
1763                     ; 703     if (NewState != DISABLE)
1765  0046 0d03          	tnz	(OFST+2,sp)
1766  0048 2717          	jreq	L737
1767                     ; 706       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1769  004a 7b02          	ld	a,(OFST+1,sp)
1770  004c a40f          	and	a,#15
1771  004e 5f            	clrw	x
1772  004f 97            	ld	xl,a
1773  0050 a601          	ld	a,#1
1774  0052 5d            	tnzw	x
1775  0053 2704          	jreq	L65
1776  0055               L06:
1777  0055 48            	sll	a
1778  0056 5a            	decw	x
1779  0057 26fc          	jrne	L06
1780  0059               L65:
1781  0059 ca50c4        	or	a,20676
1782  005c c750c4        	ld	20676,a
1784  005f 2049          	jra	L337
1785  0061               L737:
1786                     ; 711       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1788  0061 7b02          	ld	a,(OFST+1,sp)
1789  0063 a40f          	and	a,#15
1790  0065 5f            	clrw	x
1791  0066 97            	ld	xl,a
1792  0067 a601          	ld	a,#1
1793  0069 5d            	tnzw	x
1794  006a 2704          	jreq	L26
1795  006c               L46:
1796  006c 48            	sll	a
1797  006d 5a            	decw	x
1798  006e 26fc          	jrne	L46
1799  0070               L26:
1800  0070 43            	cpl	a
1801  0071 c450c4        	and	a,20676
1802  0074 c750c4        	ld	20676,a
1803  0077 2031          	jra	L337
1804  0079               L537:
1805                     ; 716     if (NewState != DISABLE)
1807  0079 0d03          	tnz	(OFST+2,sp)
1808  007b 2717          	jreq	L547
1809                     ; 719       CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1811  007d 7b02          	ld	a,(OFST+1,sp)
1812  007f a40f          	and	a,#15
1813  0081 5f            	clrw	x
1814  0082 97            	ld	xl,a
1815  0083 a601          	ld	a,#1
1816  0085 5d            	tnzw	x
1817  0086 2704          	jreq	L66
1818  0088               L07:
1819  0088 48            	sll	a
1820  0089 5a            	decw	x
1821  008a 26fc          	jrne	L07
1822  008c               L66:
1823  008c ca50d0        	or	a,20688
1824  008f c750d0        	ld	20688,a
1826  0092 2016          	jra	L337
1827  0094               L547:
1828                     ; 724       CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1830  0094 7b02          	ld	a,(OFST+1,sp)
1831  0096 a40f          	and	a,#15
1832  0098 5f            	clrw	x
1833  0099 97            	ld	xl,a
1834  009a a601          	ld	a,#1
1835  009c 5d            	tnzw	x
1836  009d 2704          	jreq	L27
1837  009f               L47:
1838  009f 48            	sll	a
1839  00a0 5a            	decw	x
1840  00a1 26fc          	jrne	L47
1841  00a3               L27:
1842  00a3 43            	cpl	a
1843  00a4 c450d0        	and	a,20688
1844  00a7 c750d0        	ld	20688,a
1845  00aa               L337:
1846                     ; 727 }
1849  00aa 5b03          	addw	sp,#3
1850  00ac 81            	ret
1874                     ; 765 void CLK_LSEClockSecuritySystemEnable(void)
1874                     ; 766 {
1875                     .text:	section	.text,new
1876  0000               _CLK_LSEClockSecuritySystemEnable:
1880                     ; 768   CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
1882  0000 72105190      	bset	20880,#0
1883                     ; 769 }
1886  0004 81            	ret
1910                     ; 777 void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
1910                     ; 778 {
1911                     .text:	section	.text,new
1912  0000               _CLK_RTCCLKSwitchOnLSEFailureEnable:
1916                     ; 780   CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
1918  0000 72125190      	bset	20880,#1
1919                     ; 781 }
1922  0004 81            	ret
1997                     ; 807 void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
1997                     ; 808 {
1998                     .text:	section	.text,new
1999  0000               _CLK_HaltConfig:
2001  0000 89            	pushw	x
2002       00000000      OFST:	set	0
2005                     ; 810   assert_param(IS_CLK_HALT(CLK_Halt));
2007                     ; 811   assert_param(IS_FUNCTIONAL_STATE(NewState));
2009                     ; 813   if (NewState != DISABLE)
2011  0001 9f            	ld	a,xl
2012  0002 4d            	tnz	a
2013  0003 2709          	jreq	L5201
2014                     ; 815     CLK->ICKCR |= (uint8_t)(CLK_Halt);
2016  0005 9e            	ld	a,xh
2017  0006 ca50c2        	or	a,20674
2018  0009 c750c2        	ld	20674,a
2020  000c 2009          	jra	L7201
2021  000e               L5201:
2022                     ; 819     CLK->ICKCR &= (uint8_t)(~CLK_Halt);
2024  000e 7b01          	ld	a,(OFST+1,sp)
2025  0010 43            	cpl	a
2026  0011 c450c2        	and	a,20674
2027  0014 c750c2        	ld	20674,a
2028  0017               L7201:
2029                     ; 821 }
2032  0017 85            	popw	x
2033  0018 81            	ret
2069                     ; 831 void CLK_MainRegulatorCmd(FunctionalState NewState)
2069                     ; 832 {
2070                     .text:	section	.text,new
2071  0000               _CLK_MainRegulatorCmd:
2075                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2077                     ; 836   if (NewState != DISABLE)
2079  0000 4d            	tnz	a
2080  0001 2706          	jreq	L7401
2081                     ; 839     CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
2083  0003 721350cf      	bres	20687,#1
2085  0007 2004          	jra	L1501
2086  0009               L7401:
2087                     ; 844     CLK->REGCSR |= CLK_REGCSR_REGOFF;
2089  0009 721250cf      	bset	20687,#1
2090  000d               L1501:
2091                     ; 846 }
2094  000d 81            	ret
2166                     ; 875 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
2166                     ; 876 {
2167                     .text:	section	.text,new
2168  0000               _CLK_ITConfig:
2170  0000 89            	pushw	x
2171       00000000      OFST:	set	0
2174                     ; 879   assert_param(IS_CLK_IT(CLK_IT));
2176                     ; 880   assert_param(IS_FUNCTIONAL_STATE(NewState));
2178                     ; 882   if (NewState != DISABLE)
2180  0001 9f            	ld	a,xl
2181  0002 4d            	tnz	a
2182  0003 271d          	jreq	L7011
2183                     ; 884     if (CLK_IT == CLK_IT_SWIF)
2185  0005 9e            	ld	a,xh
2186  0006 a11c          	cp	a,#28
2187  0008 2606          	jrne	L1111
2188                     ; 887       CLK->SWCR |= CLK_SWCR_SWIEN;
2190  000a 721450c9      	bset	20681,#2
2192  000e 202e          	jra	L1211
2193  0010               L1111:
2194                     ; 889     else if (CLK_IT == CLK_IT_LSECSSF)
2196  0010 7b01          	ld	a,(OFST+1,sp)
2197  0012 a12c          	cp	a,#44
2198  0014 2606          	jrne	L5111
2199                     ; 892       CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
2201  0016 72145190      	bset	20880,#2
2203  001a 2022          	jra	L1211
2204  001c               L5111:
2205                     ; 897       CLK->CSSR |= CLK_CSSR_CSSDIE;
2207  001c 721450ca      	bset	20682,#2
2208  0020 201c          	jra	L1211
2209  0022               L7011:
2210                     ; 902     if (CLK_IT == CLK_IT_SWIF)
2212  0022 7b01          	ld	a,(OFST+1,sp)
2213  0024 a11c          	cp	a,#28
2214  0026 2606          	jrne	L3211
2215                     ; 905       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2217  0028 721550c9      	bres	20681,#2
2219  002c 2010          	jra	L1211
2220  002e               L3211:
2221                     ; 907     else if (CLK_IT == CLK_IT_LSECSSF)
2223  002e 7b01          	ld	a,(OFST+1,sp)
2224  0030 a12c          	cp	a,#44
2225  0032 2606          	jrne	L7211
2226                     ; 910       CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
2228  0034 72155190      	bres	20880,#2
2230  0038 2004          	jra	L1211
2231  003a               L7211:
2232                     ; 915       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2234  003a 721550ca      	bres	20682,#2
2235  003e               L1211:
2236                     ; 918 }
2239  003e 85            	popw	x
2240  003f 81            	ret
2463                     ; 945 FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
2463                     ; 946 {
2464                     .text:	section	.text,new
2465  0000               _CLK_GetFlagStatus:
2467  0000 88            	push	a
2468  0001 89            	pushw	x
2469       00000002      OFST:	set	2
2472                     ; 947   uint8_t reg = 0;
2474                     ; 948   uint8_t pos = 0;
2476                     ; 949   FlagStatus bitstatus = RESET;
2478                     ; 952   assert_param(IS_CLK_FLAGS(CLK_FLAG));
2480                     ; 955   reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
2482  0002 a4f0          	and	a,#240
2483  0004 6b02          	ld	(OFST+0,sp),a
2485                     ; 958   pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
2487  0006 7b03          	ld	a,(OFST+1,sp)
2488  0008 a40f          	and	a,#15
2489  000a 6b01          	ld	(OFST-1,sp),a
2491                     ; 960   if (reg == 0x00) /* The flag to check is in CRTC Rregister */
2493  000c 0d02          	tnz	(OFST+0,sp)
2494  000e 2607          	jrne	L7421
2495                     ; 962     reg = CLK->CRTCR;
2497  0010 c650c1        	ld	a,20673
2498  0013 6b02          	ld	(OFST+0,sp),a
2501  0015 2060          	jra	L1521
2502  0017               L7421:
2503                     ; 964   else if (reg == 0x10) /* The flag to check is in ICKCR register */
2505  0017 7b02          	ld	a,(OFST+0,sp)
2506  0019 a110          	cp	a,#16
2507  001b 2607          	jrne	L3521
2508                     ; 966     reg = CLK->ICKCR;
2510  001d c650c2        	ld	a,20674
2511  0020 6b02          	ld	(OFST+0,sp),a
2514  0022 2053          	jra	L1521
2515  0024               L3521:
2516                     ; 968   else if (reg == 0x20) /* The flag to check is in CCOR register */
2518  0024 7b02          	ld	a,(OFST+0,sp)
2519  0026 a120          	cp	a,#32
2520  0028 2607          	jrne	L7521
2521                     ; 970     reg = CLK->CCOR;
2523  002a c650c5        	ld	a,20677
2524  002d 6b02          	ld	(OFST+0,sp),a
2527  002f 2046          	jra	L1521
2528  0031               L7521:
2529                     ; 972   else if (reg == 0x30) /* The flag to check is in ECKCR register */
2531  0031 7b02          	ld	a,(OFST+0,sp)
2532  0033 a130          	cp	a,#48
2533  0035 2607          	jrne	L3621
2534                     ; 974     reg = CLK->ECKCR;
2536  0037 c650c6        	ld	a,20678
2537  003a 6b02          	ld	(OFST+0,sp),a
2540  003c 2039          	jra	L1521
2541  003e               L3621:
2542                     ; 976   else if (reg == 0x40) /* The flag to check is in SWCR register */
2544  003e 7b02          	ld	a,(OFST+0,sp)
2545  0040 a140          	cp	a,#64
2546  0042 2607          	jrne	L7621
2547                     ; 978     reg = CLK->SWCR;
2549  0044 c650c9        	ld	a,20681
2550  0047 6b02          	ld	(OFST+0,sp),a
2553  0049 202c          	jra	L1521
2554  004b               L7621:
2555                     ; 980   else if (reg == 0x50) /* The flag to check is in CSSR register */
2557  004b 7b02          	ld	a,(OFST+0,sp)
2558  004d a150          	cp	a,#80
2559  004f 2607          	jrne	L3721
2560                     ; 982     reg = CLK->CSSR;
2562  0051 c650ca        	ld	a,20682
2563  0054 6b02          	ld	(OFST+0,sp),a
2566  0056 201f          	jra	L1521
2567  0058               L3721:
2568                     ; 984   else if (reg == 0x70) /* The flag to check is in REGCSR register */
2570  0058 7b02          	ld	a,(OFST+0,sp)
2571  005a a170          	cp	a,#112
2572  005c 2607          	jrne	L7721
2573                     ; 986     reg = CLK->REGCSR;
2575  005e c650cf        	ld	a,20687
2576  0061 6b02          	ld	(OFST+0,sp),a
2579  0063 2012          	jra	L1521
2580  0065               L7721:
2581                     ; 988   else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
2583  0065 7b02          	ld	a,(OFST+0,sp)
2584  0067 a180          	cp	a,#128
2585  0069 2607          	jrne	L3031
2586                     ; 990     reg = CSSLSE->CSR;
2588  006b c65190        	ld	a,20880
2589  006e 6b02          	ld	(OFST+0,sp),a
2592  0070 2005          	jra	L1521
2593  0072               L3031:
2594                     ; 994     reg = CLK->CBEEPR;
2596  0072 c650cb        	ld	a,20683
2597  0075 6b02          	ld	(OFST+0,sp),a
2599  0077               L1521:
2600                     ; 998   if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
2602  0077 7b01          	ld	a,(OFST-1,sp)
2603  0079 5f            	clrw	x
2604  007a 97            	ld	xl,a
2605  007b a601          	ld	a,#1
2606  007d 5d            	tnzw	x
2607  007e 2704          	jreq	L211
2608  0080               L411:
2609  0080 48            	sll	a
2610  0081 5a            	decw	x
2611  0082 26fc          	jrne	L411
2612  0084               L211:
2613  0084 1402          	and	a,(OFST+0,sp)
2614  0086 2706          	jreq	L7031
2615                     ; 1000     bitstatus = SET;
2617  0088 a601          	ld	a,#1
2618  008a 6b02          	ld	(OFST+0,sp),a
2621  008c 2002          	jra	L1131
2622  008e               L7031:
2623                     ; 1004     bitstatus = RESET;
2625  008e 0f02          	clr	(OFST+0,sp)
2627  0090               L1131:
2628                     ; 1008   return((FlagStatus)bitstatus);
2630  0090 7b02          	ld	a,(OFST+0,sp)
2633  0092 5b03          	addw	sp,#3
2634  0094 81            	ret
2657                     ; 1016 void CLK_ClearFlag(void)
2657                     ; 1017 {
2658                     .text:	section	.text,new
2659  0000               _CLK_ClearFlag:
2663                     ; 1020   CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2665  0000 72175190      	bres	20880,#3
2666                     ; 1021 }
2669  0004 81            	ret
2715                     ; 1032 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2715                     ; 1033 {
2716                     .text:	section	.text,new
2717  0000               _CLK_GetITStatus:
2719  0000 88            	push	a
2720  0001 88            	push	a
2721       00000001      OFST:	set	1
2724                     ; 1035   ITStatus bitstatus = RESET;
2726                     ; 1038   assert_param(IS_CLK_IT(CLK_IT));
2728                     ; 1040   if (CLK_IT == CLK_IT_SWIF)
2730  0002 a11c          	cp	a,#28
2731  0004 2611          	jrne	L5431
2732                     ; 1043     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2734  0006 c450c9        	and	a,20681
2735  0009 a10c          	cp	a,#12
2736  000b 2606          	jrne	L7431
2737                     ; 1045       bitstatus = SET;
2739  000d a601          	ld	a,#1
2740  000f 6b01          	ld	(OFST+0,sp),a
2743  0011 202e          	jra	L3531
2744  0013               L7431:
2745                     ; 1049       bitstatus = RESET;
2747  0013 0f01          	clr	(OFST+0,sp)
2749  0015 202a          	jra	L3531
2750  0017               L5431:
2751                     ; 1052   else if (CLK_IT == CLK_IT_LSECSSF)
2753  0017 7b02          	ld	a,(OFST+1,sp)
2754  0019 a12c          	cp	a,#44
2755  001b 2613          	jrne	L5531
2756                     ; 1055     if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2758  001d c65190        	ld	a,20880
2759  0020 1402          	and	a,(OFST+1,sp)
2760  0022 a10c          	cp	a,#12
2761  0024 2606          	jrne	L7531
2762                     ; 1057       bitstatus = SET;
2764  0026 a601          	ld	a,#1
2765  0028 6b01          	ld	(OFST+0,sp),a
2768  002a 2015          	jra	L3531
2769  002c               L7531:
2770                     ; 1061       bitstatus = RESET;
2772  002c 0f01          	clr	(OFST+0,sp)
2774  002e 2011          	jra	L3531
2775  0030               L5531:
2776                     ; 1067     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2778  0030 c650ca        	ld	a,20682
2779  0033 1402          	and	a,(OFST+1,sp)
2780  0035 a10c          	cp	a,#12
2781  0037 2606          	jrne	L5631
2782                     ; 1069       bitstatus = SET;
2784  0039 a601          	ld	a,#1
2785  003b 6b01          	ld	(OFST+0,sp),a
2788  003d 2002          	jra	L3531
2789  003f               L5631:
2790                     ; 1073       bitstatus = RESET;
2792  003f 0f01          	clr	(OFST+0,sp)
2794  0041               L3531:
2795                     ; 1078   return bitstatus;
2797  0041 7b01          	ld	a,(OFST+0,sp)
2800  0043 85            	popw	x
2801  0044 81            	ret
2837                     ; 1089 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2837                     ; 1090 {
2838                     .text:	section	.text,new
2839  0000               _CLK_ClearITPendingBit:
2843                     ; 1093   assert_param(IS_CLK_CLEAR_IT(CLK_IT));
2845                     ; 1095   if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
2847  0000 a4f0          	and	a,#240
2848  0002 a120          	cp	a,#32
2849  0004 2606          	jrne	L7041
2850                     ; 1098     CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2852  0006 72175190      	bres	20880,#3
2854  000a 2004          	jra	L1141
2855  000c               L7041:
2856                     ; 1103     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2858  000c 721750c9      	bres	20681,#3
2859  0010               L1141:
2860                     ; 1105 }
2863  0010 81            	ret
2888                     	xdef	_SYSDivFactor
2889                     	xdef	_CLK_ClearITPendingBit
2890                     	xdef	_CLK_GetITStatus
2891                     	xdef	_CLK_ClearFlag
2892                     	xdef	_CLK_GetFlagStatus
2893                     	xdef	_CLK_ITConfig
2894                     	xdef	_CLK_MainRegulatorCmd
2895                     	xdef	_CLK_HaltConfig
2896                     	xdef	_CLK_RTCCLKSwitchOnLSEFailureEnable
2897                     	xdef	_CLK_LSEClockSecuritySystemEnable
2898                     	xdef	_CLK_PeripheralClockConfig
2899                     	xdef	_CLK_BEEPClockConfig
2900                     	xdef	_CLK_RTCClockConfig
2901                     	xdef	_CLK_SYSCLKSourceSwitchCmd
2902                     	xdef	_CLK_SYSCLKDivConfig
2903                     	xdef	_CLK_GetClockFreq
2904                     	xdef	_CLK_GetSYSCLKSource
2905                     	xdef	_CLK_SYSCLKSourceConfig
2906                     	xdef	_CLK_CCOConfig
2907                     	xdef	_CLK_ClockSecuritySytemDeglitchCmd
2908                     	xdef	_CLK_ClockSecuritySystemEnable
2909                     	xdef	_CLK_LSEConfig
2910                     	xdef	_CLK_HSEConfig
2911                     	xdef	_CLK_LSICmd
2912                     	xdef	_CLK_AdjustHSICalibrationValue
2913                     	xdef	_CLK_HSICmd
2914                     	xdef	_CLK_DeInit
2915                     	xref.b	c_lreg
2916                     	xref.b	c_x
2935                     	xref	c_ludv
2936                     	xref	c_rtol
2937                     	xref	c_ltor
2938                     	end
