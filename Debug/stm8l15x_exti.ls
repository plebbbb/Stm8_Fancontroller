   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  43                     ; 123 void EXTI_DeInit(void)
  43                     ; 124 {
  45                     .text:	section	.text,new
  46  0000               _EXTI_DeInit:
  50                     ; 125   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  52  0000 725f50a0      	clr	20640
  53                     ; 126   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  55  0004 725f50a1      	clr	20641
  56                     ; 127   EXTI->CR3 = EXTI_CR3_RESET_VALUE;
  58  0008 725f50a2      	clr	20642
  59                     ; 128   EXTI->CR4 = EXTI_CR4_RESET_VALUE;
  61  000c 725f50aa      	clr	20650
  62                     ; 129   EXTI->SR1 = 0xFF; /* Setting SR1 bits in order to clear flags */
  64  0010 35ff50a3      	mov	20643,#255
  65                     ; 130   EXTI->SR2 = 0xFF; /* Setting SR2 bits in order to clear flags */
  67  0014 35ff50a4      	mov	20644,#255
  68                     ; 131   EXTI->CONF1 = EXTI_CONF1_RESET_VALUE;
  70  0018 725f50a5      	clr	20645
  71                     ; 132   EXTI->CONF2 = EXTI_CONF2_RESET_VALUE;
  73  001c 725f50ab      	clr	20651
  74                     ; 133 }
  77  0020 81            	ret
 223                     ; 160 void EXTI_SetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin, EXTI_Trigger_TypeDef EXTI_Trigger)
 223                     ; 161 {
 224                     .text:	section	.text,new
 225  0000               _EXTI_SetPinSensitivity:
 227  0000 89            	pushw	x
 228       00000000      OFST:	set	0
 231                     ; 164   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
 233                     ; 165   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 235                     ; 168   switch (EXTI_Pin)
 237  0001 9e            	ld	a,xh
 239                     ; 202     default:
 239                     ; 203       break;
 240  0002 4d            	tnz	a
 241  0003 272f          	jreq	L12
 242  0005 a002          	sub	a,#2
 243  0007 274a          	jreq	L32
 244  0009 a002          	sub	a,#2
 245  000b 2765          	jreq	L52
 246  000d a002          	sub	a,#2
 247  000f 2603cc0091    	jreq	L72
 248  0014 a00a          	sub	a,#10
 249  0016 2603          	jrne	L05
 250  0018 cc00ae        	jp	L13
 251  001b               L05:
 252  001b a002          	sub	a,#2
 253  001d 2603          	jrne	L25
 254  001f cc00cd        	jp	L33
 255  0022               L25:
 256  0022 a002          	sub	a,#2
 257  0024 2603          	jrne	L45
 258  0026 cc00ec        	jp	L53
 259  0029               L45:
 260  0029 a002          	sub	a,#2
 261  002b 2603          	jrne	L65
 262  002d cc010b        	jp	L73
 263  0030               L65:
 264  0030 ac280128      	jpf	L721
 265  0034               L12:
 266                     ; 170     case EXTI_Pin_0:
 266                     ; 171       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P0IS);
 268  0034 c650a0        	ld	a,20640
 269  0037 a4fc          	and	a,#252
 270  0039 c750a0        	ld	20640,a
 271                     ; 172       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 273  003c 7b01          	ld	a,(OFST+1,sp)
 274  003e 5f            	clrw	x
 275  003f 97            	ld	xl,a
 276  0040 7b02          	ld	a,(OFST+2,sp)
 277  0042 5d            	tnzw	x
 278  0043 2704          	jreq	L01
 279  0045               L21:
 280  0045 48            	sll	a
 281  0046 5a            	decw	x
 282  0047 26fc          	jrne	L21
 283  0049               L01:
 284  0049 ca50a0        	or	a,20640
 285  004c c750a0        	ld	20640,a
 286                     ; 173       break;
 288  004f ac280128      	jpf	L721
 289  0053               L32:
 290                     ; 174     case EXTI_Pin_1:
 290                     ; 175       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P1IS);
 292  0053 c650a0        	ld	a,20640
 293  0056 a4f3          	and	a,#243
 294  0058 c750a0        	ld	20640,a
 295                     ; 176       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 297  005b 7b01          	ld	a,(OFST+1,sp)
 298  005d 5f            	clrw	x
 299  005e 97            	ld	xl,a
 300  005f 7b02          	ld	a,(OFST+2,sp)
 301  0061 5d            	tnzw	x
 302  0062 2704          	jreq	L41
 303  0064               L61:
 304  0064 48            	sll	a
 305  0065 5a            	decw	x
 306  0066 26fc          	jrne	L61
 307  0068               L41:
 308  0068 ca50a0        	or	a,20640
 309  006b c750a0        	ld	20640,a
 310                     ; 177       break;
 312  006e ac280128      	jpf	L721
 313  0072               L52:
 314                     ; 178     case EXTI_Pin_2:
 314                     ; 179       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P2IS);
 316  0072 c650a0        	ld	a,20640
 317  0075 a4cf          	and	a,#207
 318  0077 c750a0        	ld	20640,a
 319                     ; 180       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 321  007a 7b01          	ld	a,(OFST+1,sp)
 322  007c 5f            	clrw	x
 323  007d 97            	ld	xl,a
 324  007e 7b02          	ld	a,(OFST+2,sp)
 325  0080 5d            	tnzw	x
 326  0081 2704          	jreq	L02
 327  0083               L22:
 328  0083 48            	sll	a
 329  0084 5a            	decw	x
 330  0085 26fc          	jrne	L22
 331  0087               L02:
 332  0087 ca50a0        	or	a,20640
 333  008a c750a0        	ld	20640,a
 334                     ; 181       break;
 336  008d ac280128      	jpf	L721
 337  0091               L72:
 338                     ; 182     case EXTI_Pin_3:
 338                     ; 183       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P3IS);
 340  0091 c650a0        	ld	a,20640
 341  0094 a43f          	and	a,#63
 342  0096 c750a0        	ld	20640,a
 343                     ; 184       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 345  0099 7b01          	ld	a,(OFST+1,sp)
 346  009b 5f            	clrw	x
 347  009c 97            	ld	xl,a
 348  009d 7b02          	ld	a,(OFST+2,sp)
 349  009f 5d            	tnzw	x
 350  00a0 2704          	jreq	L42
 351  00a2               L62:
 352  00a2 48            	sll	a
 353  00a3 5a            	decw	x
 354  00a4 26fc          	jrne	L62
 355  00a6               L42:
 356  00a6 ca50a0        	or	a,20640
 357  00a9 c750a0        	ld	20640,a
 358                     ; 185       break;
 360  00ac 207a          	jra	L721
 361  00ae               L13:
 362                     ; 186     case EXTI_Pin_4:
 362                     ; 187       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P4IS);
 364  00ae c650a1        	ld	a,20641
 365  00b1 a4fc          	and	a,#252
 366  00b3 c750a1        	ld	20641,a
 367                     ; 188       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 369  00b6 7b01          	ld	a,(OFST+1,sp)
 370  00b8 a4ef          	and	a,#239
 371  00ba 5f            	clrw	x
 372  00bb 97            	ld	xl,a
 373  00bc 7b02          	ld	a,(OFST+2,sp)
 374  00be 5d            	tnzw	x
 375  00bf 2704          	jreq	L03
 376  00c1               L23:
 377  00c1 48            	sll	a
 378  00c2 5a            	decw	x
 379  00c3 26fc          	jrne	L23
 380  00c5               L03:
 381  00c5 ca50a1        	or	a,20641
 382  00c8 c750a1        	ld	20641,a
 383                     ; 189       break;
 385  00cb 205b          	jra	L721
 386  00cd               L33:
 387                     ; 190     case EXTI_Pin_5:
 387                     ; 191       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P5IS);
 389  00cd c650a1        	ld	a,20641
 390  00d0 a4f3          	and	a,#243
 391  00d2 c750a1        	ld	20641,a
 392                     ; 192       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 394  00d5 7b01          	ld	a,(OFST+1,sp)
 395  00d7 a4ef          	and	a,#239
 396  00d9 5f            	clrw	x
 397  00da 97            	ld	xl,a
 398  00db 7b02          	ld	a,(OFST+2,sp)
 399  00dd 5d            	tnzw	x
 400  00de 2704          	jreq	L43
 401  00e0               L63:
 402  00e0 48            	sll	a
 403  00e1 5a            	decw	x
 404  00e2 26fc          	jrne	L63
 405  00e4               L43:
 406  00e4 ca50a1        	or	a,20641
 407  00e7 c750a1        	ld	20641,a
 408                     ; 193       break;
 410  00ea 203c          	jra	L721
 411  00ec               L53:
 412                     ; 194     case EXTI_Pin_6:
 412                     ; 195       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P6IS);
 414  00ec c650a1        	ld	a,20641
 415  00ef a4cf          	and	a,#207
 416  00f1 c750a1        	ld	20641,a
 417                     ; 196       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 419  00f4 7b01          	ld	a,(OFST+1,sp)
 420  00f6 a4ef          	and	a,#239
 421  00f8 5f            	clrw	x
 422  00f9 97            	ld	xl,a
 423  00fa 7b02          	ld	a,(OFST+2,sp)
 424  00fc 5d            	tnzw	x
 425  00fd 2704          	jreq	L04
 426  00ff               L24:
 427  00ff 48            	sll	a
 428  0100 5a            	decw	x
 429  0101 26fc          	jrne	L24
 430  0103               L04:
 431  0103 ca50a1        	or	a,20641
 432  0106 c750a1        	ld	20641,a
 433                     ; 197       break;
 435  0109 201d          	jra	L721
 436  010b               L73:
 437                     ; 198     case EXTI_Pin_7:
 437                     ; 199       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P7IS);
 439  010b c650a1        	ld	a,20641
 440  010e a43f          	and	a,#63
 441  0110 c750a1        	ld	20641,a
 442                     ; 200       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 444  0113 7b01          	ld	a,(OFST+1,sp)
 445  0115 a4ef          	and	a,#239
 446  0117 5f            	clrw	x
 447  0118 97            	ld	xl,a
 448  0119 7b02          	ld	a,(OFST+2,sp)
 449  011b 5d            	tnzw	x
 450  011c 2704          	jreq	L44
 451  011e               L64:
 452  011e 48            	sll	a
 453  011f 5a            	decw	x
 454  0120 26fc          	jrne	L64
 455  0122               L44:
 456  0122 ca50a1        	or	a,20641
 457  0125 c750a1        	ld	20641,a
 458                     ; 201       break;
 460  0128               L14:
 461                     ; 202     default:
 461                     ; 203       break;
 463  0128               L721:
 464                     ; 205 }
 467  0128 85            	popw	x
 468  0129 81            	ret
 551                     ; 219 void EXTI_SelectPort(EXTI_Port_TypeDef EXTI_Port)
 551                     ; 220 {
 552                     .text:	section	.text,new
 553  0000               _EXTI_SelectPort:
 555  0000 88            	push	a
 556       00000000      OFST:	set	0
 559                     ; 222   assert_param(IS_EXTI_PORT(EXTI_Port));
 561                     ; 224   if (EXTI_Port == EXTI_Port_B)
 563  0001 4d            	tnz	a
 564  0002 2606          	jrne	L761
 565                     ; 227     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PGBS);
 567  0004 721b50ab      	bres	20651,#5
 569  0008 2034          	jra	L171
 570  000a               L761:
 571                     ; 229   else if (EXTI_Port == EXTI_Port_D)
 573  000a 7b01          	ld	a,(OFST+1,sp)
 574  000c a102          	cp	a,#2
 575  000e 2606          	jrne	L371
 576                     ; 232     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PHDS);
 578  0010 721d50ab      	bres	20651,#6
 580  0014 2028          	jra	L171
 581  0016               L371:
 582                     ; 234   else if (EXTI_Port == EXTI_Port_E)
 584  0016 7b01          	ld	a,(OFST+1,sp)
 585  0018 a104          	cp	a,#4
 586  001a 2606          	jrne	L771
 587                     ; 237     EXTI->CONF1 &= (uint8_t) (~EXTI_CONF1_PFES);
 589  001c 721f50a5      	bres	20645,#7
 591  0020 201c          	jra	L171
 592  0022               L771:
 593                     ; 239   else if (EXTI_Port == EXTI_Port_F)
 595  0022 7b01          	ld	a,(OFST+1,sp)
 596  0024 a106          	cp	a,#6
 597  0026 2606          	jrne	L302
 598                     ; 242     EXTI->CONF1 |= (uint8_t) (EXTI_CONF1_PFES);
 600  0028 721e50a5      	bset	20645,#7
 602  002c 2010          	jra	L171
 603  002e               L302:
 604                     ; 244   else if (EXTI_Port == EXTI_Port_G)
 606  002e 7b01          	ld	a,(OFST+1,sp)
 607  0030 a110          	cp	a,#16
 608  0032 2606          	jrne	L702
 609                     ; 247     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PGBS);
 611  0034 721a50ab      	bset	20651,#5
 613  0038 2004          	jra	L171
 614  003a               L702:
 615                     ; 252     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PHDS);
 617  003a 721c50ab      	bset	20651,#6
 618  003e               L171:
 619                     ; 254 }
 622  003e 84            	pop	a
 623  003f 81            	ret
 791                     ; 280 void EXTI_SetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort,
 791                     ; 281                                FunctionalState NewState)
 791                     ; 282 {
 792                     .text:	section	.text,new
 793  0000               _EXTI_SetHalfPortSelection:
 795  0000 89            	pushw	x
 796       00000000      OFST:	set	0
 799                     ; 284   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
 801                     ; 285   assert_param(IS_FUNCTIONAL_STATE(NewState));
 803                     ; 287   if ((EXTI_HalfPort & 0x80) == 0x00)
 805  0001 9e            	ld	a,xh
 806  0002 a580          	bcp	a,#128
 807  0004 2619          	jrne	L103
 808                     ; 289     if (NewState != DISABLE)
 810  0006 0d02          	tnz	(OFST+2,sp)
 811  0008 270a          	jreq	L303
 812                     ; 292       EXTI->CONF1 |= (uint8_t)EXTI_HalfPort;
 814  000a c650a5        	ld	a,20645
 815  000d 1a01          	or	a,(OFST+1,sp)
 816  000f c750a5        	ld	20645,a
 818  0012 2026          	jra	L703
 819  0014               L303:
 820                     ; 297       EXTI->CONF1 &= (uint8_t)(~(uint8_t)EXTI_HalfPort);
 822  0014 7b01          	ld	a,(OFST+1,sp)
 823  0016 43            	cpl	a
 824  0017 c450a5        	and	a,20645
 825  001a c750a5        	ld	20645,a
 826  001d 201b          	jra	L703
 827  001f               L103:
 828                     ; 302     if (NewState != DISABLE)
 830  001f 0d02          	tnz	(OFST+2,sp)
 831  0021 270c          	jreq	L113
 832                     ; 305       EXTI->CONF2 |= (uint8_t)(EXTI_HalfPort & (uint8_t)0x7F);
 834  0023 7b01          	ld	a,(OFST+1,sp)
 835  0025 a47f          	and	a,#127
 836  0027 ca50ab        	or	a,20651
 837  002a c750ab        	ld	20651,a
 839  002d 200b          	jra	L703
 840  002f               L113:
 841                     ; 310       EXTI->CONF2 &= (uint8_t)(~(uint8_t) (EXTI_HalfPort & (uint8_t)0x7F));
 843  002f 7b01          	ld	a,(OFST+1,sp)
 844  0031 a47f          	and	a,#127
 845  0033 43            	cpl	a
 846  0034 c450ab        	and	a,20651
 847  0037 c750ab        	ld	20651,a
 848  003a               L703:
 849                     ; 313 }
 852  003a 85            	popw	x
 853  003b 81            	ret
 899                     ; 338 void EXTI_SetPortSensitivity(EXTI_Port_TypeDef EXTI_Port,
 899                     ; 339                              EXTI_Trigger_TypeDef EXTI_Trigger)
 899                     ; 340 {
 900                     .text:	section	.text,new
 901  0000               _EXTI_SetPortSensitivity:
 903  0000 89            	pushw	x
 904       00000000      OFST:	set	0
 907                     ; 342   assert_param(IS_EXTI_PORT(EXTI_Port));
 909                     ; 343   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 911                     ; 346   if ((EXTI_Port & 0xF0) == 0x00)
 913  0001 9e            	ld	a,xh
 914  0002 a5f0          	bcp	a,#240
 915  0004 2629          	jrne	L733
 916                     ; 349     EXTI->CR3 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << EXTI_Port));
 918  0006 7b01          	ld	a,(OFST+1,sp)
 919  0008 5f            	clrw	x
 920  0009 97            	ld	xl,a
 921  000a a603          	ld	a,#3
 922  000c 5d            	tnzw	x
 923  000d 2704          	jreq	L66
 924  000f               L07:
 925  000f 48            	sll	a
 926  0010 5a            	decw	x
 927  0011 26fc          	jrne	L07
 928  0013               L66:
 929  0013 43            	cpl	a
 930  0014 c450a2        	and	a,20642
 931  0017 c750a2        	ld	20642,a
 932                     ; 351     EXTI->CR3 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Port);
 934  001a 7b01          	ld	a,(OFST+1,sp)
 935  001c 5f            	clrw	x
 936  001d 97            	ld	xl,a
 937  001e 7b02          	ld	a,(OFST+2,sp)
 938  0020 5d            	tnzw	x
 939  0021 2704          	jreq	L27
 940  0023               L47:
 941  0023 48            	sll	a
 942  0024 5a            	decw	x
 943  0025 26fc          	jrne	L47
 944  0027               L27:
 945  0027 ca50a2        	or	a,20642
 946  002a c750a2        	ld	20642,a
 948  002d 202b          	jra	L143
 949  002f               L733:
 950                     ; 356     EXTI->CR4 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << (EXTI_Port & 0x0F)));
 952  002f 7b01          	ld	a,(OFST+1,sp)
 953  0031 a40f          	and	a,#15
 954  0033 5f            	clrw	x
 955  0034 97            	ld	xl,a
 956  0035 a603          	ld	a,#3
 957  0037 5d            	tnzw	x
 958  0038 2704          	jreq	L67
 959  003a               L001:
 960  003a 48            	sll	a
 961  003b 5a            	decw	x
 962  003c 26fc          	jrne	L001
 963  003e               L67:
 964  003e 43            	cpl	a
 965  003f c450aa        	and	a,20650
 966  0042 c750aa        	ld	20650,a
 967                     ; 358     EXTI->CR4 |= (uint8_t)(EXTI_Trigger << (EXTI_Port & 0x0F));
 969  0045 7b01          	ld	a,(OFST+1,sp)
 970  0047 a40f          	and	a,#15
 971  0049 5f            	clrw	x
 972  004a 97            	ld	xl,a
 973  004b 7b02          	ld	a,(OFST+2,sp)
 974  004d 5d            	tnzw	x
 975  004e 2704          	jreq	L201
 976  0050               L401:
 977  0050 48            	sll	a
 978  0051 5a            	decw	x
 979  0052 26fc          	jrne	L401
 980  0054               L201:
 981  0054 ca50aa        	or	a,20650
 982  0057 c750aa        	ld	20650,a
 983  005a               L143:
 984                     ; 360 }
 987  005a 85            	popw	x
 988  005b 81            	ret
1034                     ; 376 EXTI_Trigger_TypeDef EXTI_GetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin)
1034                     ; 377 {
1035                     .text:	section	.text,new
1036  0000               _EXTI_GetPinSensitivity:
1038  0000 88            	push	a
1039       00000001      OFST:	set	1
1042                     ; 378   uint8_t value = 0;
1044  0001 0f01          	clr	(OFST+0,sp)
1046                     ; 381   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
1048                     ; 383   switch (EXTI_Pin)
1051                     ; 409     default:
1051                     ; 410       break;
1052  0003 4d            	tnz	a
1053  0004 271e          	jreq	L343
1054  0006 a002          	sub	a,#2
1055  0008 2723          	jreq	L543
1056  000a a002          	sub	a,#2
1057  000c 272a          	jreq	L743
1058  000e a002          	sub	a,#2
1059  0010 2732          	jreq	L153
1060  0012 a00a          	sub	a,#10
1061  0014 273c          	jreq	L353
1062  0016 a002          	sub	a,#2
1063  0018 2741          	jreq	L553
1064  001a a002          	sub	a,#2
1065  001c 2748          	jreq	L753
1066  001e a002          	sub	a,#2
1067  0020 2750          	jreq	L163
1068  0022 205a          	jra	L114
1069  0024               L343:
1070                     ; 385     case EXTI_Pin_0:
1070                     ; 386       value = (uint8_t)(EXTI->CR1 & EXTI_CR1_P0IS);
1072  0024 c650a0        	ld	a,20640
1073  0027 a403          	and	a,#3
1074  0029 6b01          	ld	(OFST+0,sp),a
1076                     ; 387       break;
1078  002b 2051          	jra	L114
1079  002d               L543:
1080                     ; 388     case EXTI_Pin_1:
1080                     ; 389       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P1IS) >> EXTI_Pin_1);
1082  002d c650a0        	ld	a,20640
1083  0030 a40c          	and	a,#12
1084  0032 44            	srl	a
1085  0033 44            	srl	a
1086  0034 6b01          	ld	(OFST+0,sp),a
1088                     ; 390       break;
1090  0036 2046          	jra	L114
1091  0038               L743:
1092                     ; 391     case EXTI_Pin_2:
1092                     ; 392       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P2IS) >> EXTI_Pin_2);
1094  0038 c650a0        	ld	a,20640
1095  003b a430          	and	a,#48
1096  003d 4e            	swap	a
1097  003e a40f          	and	a,#15
1098  0040 6b01          	ld	(OFST+0,sp),a
1100                     ; 393       break;
1102  0042 203a          	jra	L114
1103  0044               L153:
1104                     ; 394     case EXTI_Pin_3:
1104                     ; 395       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P3IS) >> EXTI_Pin_3);
1106  0044 c650a0        	ld	a,20640
1107  0047 a4c0          	and	a,#192
1108  0049 4e            	swap	a
1109  004a 44            	srl	a
1110  004b 44            	srl	a
1111  004c a403          	and	a,#3
1112  004e 6b01          	ld	(OFST+0,sp),a
1114                     ; 396       break;
1116  0050 202c          	jra	L114
1117  0052               L353:
1118                     ; 397     case EXTI_Pin_4:
1118                     ; 398       value = (uint8_t)(EXTI->CR2 & EXTI_CR2_P4IS);
1120  0052 c650a1        	ld	a,20641
1121  0055 a403          	and	a,#3
1122  0057 6b01          	ld	(OFST+0,sp),a
1124                     ; 399       break;
1126  0059 2023          	jra	L114
1127  005b               L553:
1128                     ; 400     case EXTI_Pin_5:
1128                     ; 401       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P5IS) >> ((uint8_t)EXTI_Pin_5 & (uint8_t)0x0F));
1130  005b c650a1        	ld	a,20641
1131  005e a40c          	and	a,#12
1132  0060 44            	srl	a
1133  0061 44            	srl	a
1134  0062 6b01          	ld	(OFST+0,sp),a
1136                     ; 402       break;
1138  0064 2018          	jra	L114
1139  0066               L753:
1140                     ; 403     case EXTI_Pin_6:
1140                     ; 404       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P6IS) >> ((uint8_t)EXTI_Pin_6 & (uint8_t)0x0F));
1142  0066 c650a1        	ld	a,20641
1143  0069 a430          	and	a,#48
1144  006b 4e            	swap	a
1145  006c a40f          	and	a,#15
1146  006e 6b01          	ld	(OFST+0,sp),a
1148                     ; 405       break;
1150  0070 200c          	jra	L114
1151  0072               L163:
1152                     ; 406     case EXTI_Pin_7:
1152                     ; 407       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P7IS) >> ((uint8_t)EXTI_Pin_7 & (uint8_t)0x0F));
1154  0072 c650a1        	ld	a,20641
1155  0075 a4c0          	and	a,#192
1156  0077 4e            	swap	a
1157  0078 44            	srl	a
1158  0079 44            	srl	a
1159  007a a403          	and	a,#3
1160  007c 6b01          	ld	(OFST+0,sp),a
1162                     ; 408       break;
1164  007e               L363:
1165                     ; 409     default:
1165                     ; 410       break;
1167  007e               L114:
1168                     ; 412   return((EXTI_Trigger_TypeDef)value);
1170  007e 7b01          	ld	a,(OFST+0,sp)
1173  0080 5b01          	addw	sp,#1
1174  0082 81            	ret
1220                     ; 427 EXTI_Trigger_TypeDef EXTI_GetPortSensitivity(EXTI_Port_TypeDef EXTI_Port)
1220                     ; 428 {
1221                     .text:	section	.text,new
1222  0000               _EXTI_GetPortSensitivity:
1224  0000 88            	push	a
1225  0001 88            	push	a
1226       00000001      OFST:	set	1
1229                     ; 429   uint8_t portsensitivity = 0;
1231                     ; 432   assert_param(IS_EXTI_PORT(EXTI_Port));
1233                     ; 435   if ((EXTI_Port & 0xF0) == 0x00)
1235  0002 a5f0          	bcp	a,#240
1236  0004 2614          	jrne	L534
1237                     ; 438     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR3 >> EXTI_Port));
1239  0006 7b02          	ld	a,(OFST+1,sp)
1240  0008 5f            	clrw	x
1241  0009 97            	ld	xl,a
1242  000a c650a2        	ld	a,20642
1243  000d 5d            	tnzw	x
1244  000e 2704          	jreq	L211
1245  0010               L411:
1246  0010 44            	srl	a
1247  0011 5a            	decw	x
1248  0012 26fc          	jrne	L411
1249  0014               L211:
1250  0014 a403          	and	a,#3
1251  0016 6b01          	ld	(OFST+0,sp),a
1254  0018 2014          	jra	L734
1255  001a               L534:
1256                     ; 444     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR4 >> (EXTI_Port & 0x0F)));
1258  001a 7b02          	ld	a,(OFST+1,sp)
1259  001c a40f          	and	a,#15
1260  001e 5f            	clrw	x
1261  001f 97            	ld	xl,a
1262  0020 c650aa        	ld	a,20650
1263  0023 5d            	tnzw	x
1264  0024 2704          	jreq	L611
1265  0026               L021:
1266  0026 44            	srl	a
1267  0027 5a            	decw	x
1268  0028 26fc          	jrne	L021
1269  002a               L611:
1270  002a a403          	and	a,#3
1271  002c 6b01          	ld	(OFST+0,sp),a
1273  002e               L734:
1274                     ; 447   return((EXTI_Trigger_TypeDef)portsensitivity);
1276  002e 7b01          	ld	a,(OFST+0,sp)
1279  0030 85            	popw	x
1280  0031 81            	ret
1450                     ; 487 ITStatus EXTI_GetITStatus(EXTI_IT_TypeDef EXTI_IT)
1450                     ; 488 {
1451                     .text:	section	.text,new
1452  0000               _EXTI_GetITStatus:
1454  0000 89            	pushw	x
1455  0001 88            	push	a
1456       00000001      OFST:	set	1
1459                     ; 489   ITStatus status = RESET;
1461                     ; 491   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1463                     ; 493   if (((uint16_t)EXTI_IT & (uint16_t)0xFF00) == 0x0100)
1465  0002 01            	rrwa	x,a
1466  0003 9f            	ld	a,xl
1467  0004 a4ff          	and	a,#255
1468  0006 97            	ld	xl,a
1469  0007 4f            	clr	a
1470  0008 02            	rlwa	x,a
1471  0009 a30100        	cpw	x,#256
1472  000c 260b          	jrne	L335
1473                     ; 495     status = (ITStatus)(EXTI->SR2 & (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF));
1475  000e 7b03          	ld	a,(OFST+2,sp)
1476  0010 a4ff          	and	a,#255
1477  0012 c450a4        	and	a,20644
1478  0015 6b01          	ld	(OFST+0,sp),a
1481  0017 2009          	jra	L535
1482  0019               L335:
1483                     ; 499     status = (ITStatus)(EXTI->SR1 & ((uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF)));
1485  0019 7b03          	ld	a,(OFST+2,sp)
1486  001b a4ff          	and	a,#255
1487  001d c450a3        	and	a,20643
1488  0020 6b01          	ld	(OFST+0,sp),a
1490  0022               L535:
1491                     ; 501   return((ITStatus)status);
1493  0022 7b01          	ld	a,(OFST+0,sp)
1496  0024 5b03          	addw	sp,#3
1497  0026 81            	ret
1542                     ; 524 void EXTI_ClearITPendingBit(EXTI_IT_TypeDef EXTI_IT)
1542                     ; 525 {
1543                     .text:	section	.text,new
1544  0000               _EXTI_ClearITPendingBit:
1546  0000 89            	pushw	x
1547  0001 89            	pushw	x
1548       00000002      OFST:	set	2
1551                     ; 526   uint16_t tempvalue = 0;
1553                     ; 529   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1555                     ; 531   tempvalue = ((uint16_t)EXTI_IT & (uint16_t)0xFF00);
1557  0002 01            	rrwa	x,a
1558  0003 9f            	ld	a,xl
1559  0004 a4ff          	and	a,#255
1560  0006 97            	ld	xl,a
1561  0007 4f            	clr	a
1562  0008 02            	rlwa	x,a
1563  0009 1f01          	ldw	(OFST-1,sp),x
1564  000b 01            	rrwa	x,a
1566                     ; 533   if ( tempvalue == 0x0100)
1568  000c 1e01          	ldw	x,(OFST-1,sp)
1569  000e a30100        	cpw	x,#256
1570  0011 2609          	jrne	L165
1571                     ; 535     EXTI->SR2 = (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF);
1573  0013 7b04          	ld	a,(OFST+2,sp)
1574  0015 a4ff          	and	a,#255
1575  0017 c750a4        	ld	20644,a
1577  001a 2005          	jra	L365
1578  001c               L165:
1579                     ; 539     EXTI->SR1 = (uint8_t) (EXTI_IT);
1581  001c 7b04          	ld	a,(OFST+2,sp)
1582  001e c750a3        	ld	20643,a
1583  0021               L365:
1584                     ; 541 }
1587  0021 5b04          	addw	sp,#4
1588  0023 81            	ret
1601                     	xdef	_EXTI_ClearITPendingBit
1602                     	xdef	_EXTI_GetITStatus
1603                     	xdef	_EXTI_GetPortSensitivity
1604                     	xdef	_EXTI_GetPinSensitivity
1605                     	xdef	_EXTI_SetPortSensitivity
1606                     	xdef	_EXTI_SetHalfPortSelection
1607                     	xdef	_EXTI_SelectPort
1608                     	xdef	_EXTI_SetPinSensitivity
1609                     	xdef	_EXTI_DeInit
1628                     	end
