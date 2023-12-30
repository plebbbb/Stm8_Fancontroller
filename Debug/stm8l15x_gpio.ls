   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
 109                     ; 96 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 109                     ; 97 {
 111                     .text:	section	.text,new
 112  0000               _GPIO_DeInit:
 116                     ; 98   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 118  0000 6f04          	clr	(4,x)
 119                     ; 99   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 121  0002 7f            	clr	(x)
 122                     ; 100   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 124  0003 6f02          	clr	(2,x)
 125                     ; 101   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 127  0005 6f03          	clr	(3,x)
 128                     ; 102 }
 131  0007 81            	ret
 287                     ; 133 void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 287                     ; 134 {
 288                     .text:	section	.text,new
 289  0000               _GPIO_Init:
 291  0000 89            	pushw	x
 292       00000000      OFST:	set	0
 295                     ; 139   assert_param(IS_GPIO_MODE(GPIO_Mode));
 297                     ; 140   assert_param(IS_GPIO_PIN(GPIO_Pin));
 299                     ; 143   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 301  0001 7b05          	ld	a,(OFST+5,sp)
 302  0003 43            	cpl	a
 303  0004 e404          	and	a,(4,x)
 304  0006 e704          	ld	(4,x),a
 305                     ; 149   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 307  0008 7b06          	ld	a,(OFST+6,sp)
 308  000a a580          	bcp	a,#128
 309  000c 271d          	jreq	L541
 310                     ; 151     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 312  000e 7b06          	ld	a,(OFST+6,sp)
 313  0010 a510          	bcp	a,#16
 314  0012 2706          	jreq	L741
 315                     ; 153       GPIOx->ODR |= GPIO_Pin;
 317  0014 f6            	ld	a,(x)
 318  0015 1a05          	or	a,(OFST+5,sp)
 319  0017 f7            	ld	(x),a
 321  0018 2007          	jra	L151
 322  001a               L741:
 323                     ; 156       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 325  001a 1e01          	ldw	x,(OFST+1,sp)
 326  001c 7b05          	ld	a,(OFST+5,sp)
 327  001e 43            	cpl	a
 328  001f f4            	and	a,(x)
 329  0020 f7            	ld	(x),a
 330  0021               L151:
 331                     ; 159     GPIOx->DDR |= GPIO_Pin;
 333  0021 1e01          	ldw	x,(OFST+1,sp)
 334  0023 e602          	ld	a,(2,x)
 335  0025 1a05          	or	a,(OFST+5,sp)
 336  0027 e702          	ld	(2,x),a
 338  0029 2009          	jra	L351
 339  002b               L541:
 340                     ; 163     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 342  002b 1e01          	ldw	x,(OFST+1,sp)
 343  002d 7b05          	ld	a,(OFST+5,sp)
 344  002f 43            	cpl	a
 345  0030 e402          	and	a,(2,x)
 346  0032 e702          	ld	(2,x),a
 347  0034               L351:
 348                     ; 170   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 350  0034 7b06          	ld	a,(OFST+6,sp)
 351  0036 a540          	bcp	a,#64
 352  0038 270a          	jreq	L551
 353                     ; 172     GPIOx->CR1 |= GPIO_Pin;
 355  003a 1e01          	ldw	x,(OFST+1,sp)
 356  003c e603          	ld	a,(3,x)
 357  003e 1a05          	or	a,(OFST+5,sp)
 358  0040 e703          	ld	(3,x),a
 360  0042 2009          	jra	L751
 361  0044               L551:
 362                     ; 175     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 364  0044 1e01          	ldw	x,(OFST+1,sp)
 365  0046 7b05          	ld	a,(OFST+5,sp)
 366  0048 43            	cpl	a
 367  0049 e403          	and	a,(3,x)
 368  004b e703          	ld	(3,x),a
 369  004d               L751:
 370                     ; 182   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 372  004d 7b06          	ld	a,(OFST+6,sp)
 373  004f a520          	bcp	a,#32
 374  0051 270a          	jreq	L161
 375                     ; 184     GPIOx->CR2 |= GPIO_Pin;
 377  0053 1e01          	ldw	x,(OFST+1,sp)
 378  0055 e604          	ld	a,(4,x)
 379  0057 1a05          	or	a,(OFST+5,sp)
 380  0059 e704          	ld	(4,x),a
 382  005b 2009          	jra	L361
 383  005d               L161:
 384                     ; 187     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 386  005d 1e01          	ldw	x,(OFST+1,sp)
 387  005f 7b05          	ld	a,(OFST+5,sp)
 388  0061 43            	cpl	a
 389  0062 e404          	and	a,(4,x)
 390  0064 e704          	ld	(4,x),a
 391  0066               L361:
 392                     ; 190 }
 395  0066 85            	popw	x
 396  0067 81            	ret
 473                     ; 209 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
 473                     ; 210 {
 474                     .text:	section	.text,new
 475  0000               _GPIO_ExternalPullUpConfig:
 477  0000 89            	pushw	x
 478       00000000      OFST:	set	0
 481                     ; 212   assert_param(IS_GPIO_PIN(GPIO_Pin));
 483                     ; 213   assert_param(IS_FUNCTIONAL_STATE(NewState));
 485                     ; 215   if (NewState != DISABLE) /* External Pull-Up Set*/
 487  0001 0d06          	tnz	(OFST+6,sp)
 488  0003 2708          	jreq	L522
 489                     ; 217     GPIOx->CR1 |= GPIO_Pin;
 491  0005 e603          	ld	a,(3,x)
 492  0007 1a05          	or	a,(OFST+5,sp)
 493  0009 e703          	ld	(3,x),a
 495  000b 2009          	jra	L722
 496  000d               L522:
 497                     ; 220     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 499  000d 1e01          	ldw	x,(OFST+1,sp)
 500  000f 7b05          	ld	a,(OFST+5,sp)
 501  0011 43            	cpl	a
 502  0012 e403          	and	a,(3,x)
 503  0014 e703          	ld	(3,x),a
 504  0016               L722:
 505                     ; 222 }
 508  0016 85            	popw	x
 509  0017 81            	ret
 555                     ; 248 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 555                     ; 249 {
 556                     .text:	section	.text,new
 557  0000               _GPIO_Write:
 559  0000 89            	pushw	x
 560       00000000      OFST:	set	0
 563                     ; 250   GPIOx->ODR = GPIO_PortVal;
 565  0001 7b05          	ld	a,(OFST+5,sp)
 566  0003 1e01          	ldw	x,(OFST+1,sp)
 567  0005 f7            	ld	(x),a
 568                     ; 251 }
 571  0006 85            	popw	x
 572  0007 81            	ret
 732                     ; 270 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 732                     ; 271 {
 733                     .text:	section	.text,new
 734  0000               _GPIO_WriteBit:
 736  0000 89            	pushw	x
 737       00000000      OFST:	set	0
 740                     ; 273   assert_param(IS_GPIO_PIN(GPIO_Pin));
 742                     ; 274   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 744                     ; 276   if (GPIO_BitVal != RESET)
 746  0001 0d06          	tnz	(OFST+6,sp)
 747  0003 2706          	jreq	L743
 748                     ; 278     GPIOx->ODR |= GPIO_Pin;
 750  0005 f6            	ld	a,(x)
 751  0006 1a05          	or	a,(OFST+5,sp)
 752  0008 f7            	ld	(x),a
 754  0009 2007          	jra	L153
 755  000b               L743:
 756                     ; 283     GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 758  000b 1e01          	ldw	x,(OFST+1,sp)
 759  000d 7b05          	ld	a,(OFST+5,sp)
 760  000f 43            	cpl	a
 761  0010 f4            	and	a,(x)
 762  0011 f7            	ld	(x),a
 763  0012               L153:
 764                     ; 285 }
 767  0012 85            	popw	x
 768  0013 81            	ret
 814                     ; 303 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 814                     ; 304 {
 815                     .text:	section	.text,new
 816  0000               _GPIO_SetBits:
 818  0000 89            	pushw	x
 819       00000000      OFST:	set	0
 822                     ; 305   GPIOx->ODR |= GPIO_Pin;
 824  0001 f6            	ld	a,(x)
 825  0002 1a05          	or	a,(OFST+5,sp)
 826  0004 f7            	ld	(x),a
 827                     ; 306 }
 830  0005 85            	popw	x
 831  0006 81            	ret
 877                     ; 324 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 877                     ; 325 {
 878                     .text:	section	.text,new
 879  0000               _GPIO_ResetBits:
 881  0000 89            	pushw	x
 882       00000000      OFST:	set	0
 885                     ; 326   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 887  0001 7b05          	ld	a,(OFST+5,sp)
 888  0003 43            	cpl	a
 889  0004 f4            	and	a,(x)
 890  0005 f7            	ld	(x),a
 891                     ; 327 }
 894  0006 85            	popw	x
 895  0007 81            	ret
 941                     ; 336 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 941                     ; 337 {
 942                     .text:	section	.text,new
 943  0000               _GPIO_ToggleBits:
 945  0000 89            	pushw	x
 946       00000000      OFST:	set	0
 949                     ; 338   GPIOx->ODR ^= GPIO_Pin;
 951  0001 f6            	ld	a,(x)
 952  0002 1805          	xor	a,(OFST+5,sp)
 953  0004 f7            	ld	(x),a
 954                     ; 339 }
 957  0005 85            	popw	x
 958  0006 81            	ret
 995                     ; 347 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 995                     ; 348 {
 996                     .text:	section	.text,new
 997  0000               _GPIO_ReadInputData:
1001                     ; 349   return ((uint8_t)GPIOx->IDR);
1003  0000 e601          	ld	a,(1,x)
1006  0002 81            	ret
1044                     ; 358 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
1044                     ; 359 {
1045                     .text:	section	.text,new
1046  0000               _GPIO_ReadOutputData:
1050                     ; 360   return ((uint8_t)GPIOx->ODR);
1052  0000 f6            	ld	a,(x)
1055  0001 81            	ret
1104                     ; 378 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1104                     ; 379 {
1105                     .text:	section	.text,new
1106  0000               _GPIO_ReadInputDataBit:
1108  0000 89            	pushw	x
1109       00000000      OFST:	set	0
1112                     ; 380   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
1114  0001 e601          	ld	a,(1,x)
1115  0003 1405          	and	a,(OFST+5,sp)
1118  0005 85            	popw	x
1119  0006 81            	ret
1168                     ; 389 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1168                     ; 390 {
1169                     .text:	section	.text,new
1170  0000               _GPIO_ReadOutputDataBit:
1172  0000 89            	pushw	x
1173       00000000      OFST:	set	0
1176                     ; 391   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1178  0001 f6            	ld	a,(x)
1179  0002 1405          	and	a,(OFST+5,sp)
1182  0004 85            	popw	x
1183  0005 81            	ret
1196                     	xdef	_GPIO_ReadOutputDataBit
1197                     	xdef	_GPIO_ReadInputDataBit
1198                     	xdef	_GPIO_ReadOutputData
1199                     	xdef	_GPIO_ReadInputData
1200                     	xdef	_GPIO_ToggleBits
1201                     	xdef	_GPIO_ResetBits
1202                     	xdef	_GPIO_SetBits
1203                     	xdef	_GPIO_WriteBit
1204                     	xdef	_GPIO_Write
1205                     	xdef	_GPIO_ExternalPullUpConfig
1206                     	xdef	_GPIO_Init
1207                     	xdef	_GPIO_DeInit
1226                     	end
