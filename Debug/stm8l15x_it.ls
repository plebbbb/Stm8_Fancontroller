   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  43                     ; 73 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  43                     ; 74 {
  44                     .text:	section	.text,new
  45  0000               f_TRAP_IRQHandler:
  49                     ; 78 }
  52  0000 80            	iret
  74                     ; 84 INTERRUPT_HANDLER(FLASH_IRQHandler, 1)
  74                     ; 85 {
  75                     .text:	section	.text,new
  76  0000               f_FLASH_IRQHandler:
  80                     ; 89 }
  83  0000 80            	iret
 106                     ; 95 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler, 2)
 106                     ; 96 {
 107                     .text:	section	.text,new
 108  0000               f_DMA1_CHANNEL0_1_IRQHandler:
 112                     ; 100 }
 115  0000 80            	iret
 138                     ; 106 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler, 3)
 138                     ; 107 {
 139                     .text:	section	.text,new
 140  0000               f_DMA1_CHANNEL2_3_IRQHandler:
 144                     ; 111 }
 147  0000 80            	iret
 169                     ; 117 INTERRUPT_HANDLER(RTC_IRQHandler, 4)
 169                     ; 118 {
 170                     .text:	section	.text,new
 171  0000               f_RTC_IRQHandler:
 175                     ; 122 }
 178  0000 80            	iret
 201                     ; 128 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler, 5)
 201                     ; 129 {
 202                     .text:	section	.text,new
 203  0000               f_EXTIE_F_PVD_IRQHandler:
 207                     ; 133 }
 210  0000 80            	iret
 232                     ; 140 INTERRUPT_HANDLER(EXTIB_IRQHandler, 6)
 232                     ; 141 {
 233                     .text:	section	.text,new
 234  0000               f_EXTIB_IRQHandler:
 238                     ; 145 }
 241  0000 80            	iret
 263                     ; 152 INTERRUPT_HANDLER(EXTID_IRQHandler, 7)
 263                     ; 153 {
 264                     .text:	section	.text,new
 265  0000               f_EXTID_IRQHandler:
 269                     ; 157 }
 272  0000 80            	iret
 294                     ; 164 INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
 294                     ; 165 {
 295                     .text:	section	.text,new
 296  0000               f_EXTI0_IRQHandler:
 300                     ; 169 }
 303  0000 80            	iret
 325                     ; 176 INTERRUPT_HANDLER(EXTI1_IRQHandler, 9)
 325                     ; 177 {
 326                     .text:	section	.text,new
 327  0000               f_EXTI1_IRQHandler:
 331                     ; 181 }
 334  0000 80            	iret
 358                     ; 188 @svlreg INTERRUPT_HANDLER(EXTI2_IRQHandler, 10)
 358                     ; 189 {
 359                     .text:	section	.text,new
 360  0000               f_EXTI2_IRQHandler:
 362  0000 8a            	push	cc
 363  0001 84            	pop	a
 364  0002 a4bf          	and	a,#191
 365  0004 88            	push	a
 366  0005 86            	pop	cc
 367  0006 3b0002        	push	c_x+2
 368  0009 be00          	ldw	x,c_x
 369  000b 89            	pushw	x
 370  000c 3b0002        	push	c_y+2
 371  000f be00          	ldw	x,c_y
 372  0011 89            	pushw	x
 373  0012 be02          	ldw	x,c_lreg+2
 374  0014 89            	pushw	x
 375  0015 be00          	ldw	x,c_lreg
 376  0017 89            	pushw	x
 379                     ; 190 	tach1_sens_update();
 381  0018 cd0000        	call	_tach1_sens_update
 383                     ; 191 	EXTI_ClearITPendingBit(EXTI_IT_Pin2);
 385  001b ae0004        	ldw	x,#4
 386  001e cd0000        	call	_EXTI_ClearITPendingBit
 388                     ; 195 }
 391  0021 85            	popw	x
 392  0022 bf00          	ldw	c_lreg,x
 393  0024 85            	popw	x
 394  0025 bf02          	ldw	c_lreg+2,x
 395  0027 85            	popw	x
 396  0028 bf00          	ldw	c_y,x
 397  002a 320002        	pop	c_y+2
 398  002d 85            	popw	x
 399  002e bf00          	ldw	c_x,x
 400  0030 320002        	pop	c_x+2
 401  0033 80            	iret
 425                     ; 202 @svlreg INTERRUPT_HANDLER(EXTI3_IRQHandler, 11)
 425                     ; 203 {
 426                     .text:	section	.text,new
 427  0000               f_EXTI3_IRQHandler:
 429  0000 8a            	push	cc
 430  0001 84            	pop	a
 431  0002 a4bf          	and	a,#191
 432  0004 88            	push	a
 433  0005 86            	pop	cc
 434  0006 3b0002        	push	c_x+2
 435  0009 be00          	ldw	x,c_x
 436  000b 89            	pushw	x
 437  000c 3b0002        	push	c_y+2
 438  000f be00          	ldw	x,c_y
 439  0011 89            	pushw	x
 440  0012 be02          	ldw	x,c_lreg+2
 441  0014 89            	pushw	x
 442  0015 be00          	ldw	x,c_lreg
 443  0017 89            	pushw	x
 446                     ; 204 	tach2_sens_update();
 448  0018 cd0000        	call	_tach2_sens_update
 450                     ; 205 	EXTI_ClearITPendingBit(EXTI_IT_Pin3);
 452  001b ae0008        	ldw	x,#8
 453  001e cd0000        	call	_EXTI_ClearITPendingBit
 455                     ; 209 }
 458  0021 85            	popw	x
 459  0022 bf00          	ldw	c_lreg,x
 460  0024 85            	popw	x
 461  0025 bf02          	ldw	c_lreg+2,x
 462  0027 85            	popw	x
 463  0028 bf00          	ldw	c_y,x
 464  002a 320002        	pop	c_y+2
 465  002d 85            	popw	x
 466  002e bf00          	ldw	c_x,x
 467  0030 320002        	pop	c_x+2
 468  0033 80            	iret
 490                     ; 216 INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
 490                     ; 217 {
 491                     .text:	section	.text,new
 492  0000               f_EXTI4_IRQHandler:
 496                     ; 221 }
 499  0000 80            	iret
 523                     ; 228 @svlreg INTERRUPT_HANDLER(EXTI5_IRQHandler, 13)
 523                     ; 229 {
 524                     .text:	section	.text,new
 525  0000               f_EXTI5_IRQHandler:
 527  0000 8a            	push	cc
 528  0001 84            	pop	a
 529  0002 a4bf          	and	a,#191
 530  0004 88            	push	a
 531  0005 86            	pop	cc
 532  0006 3b0002        	push	c_x+2
 533  0009 be00          	ldw	x,c_x
 534  000b 89            	pushw	x
 535  000c 3b0002        	push	c_y+2
 536  000f be00          	ldw	x,c_y
 537  0011 89            	pushw	x
 538  0012 be02          	ldw	x,c_lreg+2
 539  0014 89            	pushw	x
 540  0015 be00          	ldw	x,c_lreg
 541  0017 89            	pushw	x
 544                     ; 230 	tach3_sens_update();
 546  0018 cd0000        	call	_tach3_sens_update
 548                     ; 231 	EXTI_ClearITPendingBit(EXTI_IT_Pin5);
 550  001b ae0020        	ldw	x,#32
 551  001e cd0000        	call	_EXTI_ClearITPendingBit
 553                     ; 235 }
 556  0021 85            	popw	x
 557  0022 bf00          	ldw	c_lreg,x
 558  0024 85            	popw	x
 559  0025 bf02          	ldw	c_lreg+2,x
 560  0027 85            	popw	x
 561  0028 bf00          	ldw	c_y,x
 562  002a 320002        	pop	c_y+2
 563  002d 85            	popw	x
 564  002e bf00          	ldw	c_x,x
 565  0030 320002        	pop	c_x+2
 566  0033 80            	iret
 588                     ; 242 INTERRUPT_HANDLER(EXTI6_IRQHandler, 14)
 588                     ; 243 {
 589                     .text:	section	.text,new
 590  0000               f_EXTI6_IRQHandler:
 594                     ; 247 }
 597  0000 80            	iret
 619                     ; 254 INTERRUPT_HANDLER(EXTI7_IRQHandler, 15)
 619                     ; 255 {
 620                     .text:	section	.text,new
 621  0000               f_EXTI7_IRQHandler:
 625                     ; 259 }
 628  0000 80            	iret
 650                     ; 265 INTERRUPT_HANDLER(LCD_IRQHandler, 16)
 650                     ; 266 {
 651                     .text:	section	.text,new
 652  0000               f_LCD_IRQHandler:
 656                     ; 270 }
 659  0000 80            	iret
 682                     ; 276 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler, 17)
 682                     ; 277 {
 683                     .text:	section	.text,new
 684  0000               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 688                     ; 281 }
 691  0000 80            	iret
 714                     ; 288 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler, 18)
 714                     ; 289 {
 715                     .text:	section	.text,new
 716  0000               f_ADC1_COMP_IRQHandler:
 720                     ; 293 }
 723  0000 80            	iret
 746                     ; 300 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_IRQHandler, 19)
 746                     ; 301 {
 747                     .text:	section	.text,new
 748  0000               f_TIM2_UPD_OVF_TRG_BRK_IRQHandler:
 752                     ; 305 }
 755  0000 80            	iret
 778                     ; 312 INTERRUPT_HANDLER(TIM2_CAP_IRQHandler, 20)
 778                     ; 313 {
 779                     .text:	section	.text,new
 780  0000               f_TIM2_CAP_IRQHandler:
 784                     ; 317 }
 787  0000 80            	iret
 812                     ; 325 @svlreg INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_IRQHandler, 21)
 812                     ; 326 {
 813                     .text:	section	.text,new
 814  0000               f_TIM3_UPD_OVF_TRG_BRK_IRQHandler:
 816  0000 8a            	push	cc
 817  0001 84            	pop	a
 818  0002 a4bf          	and	a,#191
 819  0004 88            	push	a
 820  0005 86            	pop	cc
 821  0006 3b0002        	push	c_x+2
 822  0009 be00          	ldw	x,c_x
 823  000b 89            	pushw	x
 824  000c 3b0002        	push	c_y+2
 825  000f be00          	ldw	x,c_y
 826  0011 89            	pushw	x
 827  0012 be02          	ldw	x,c_lreg+2
 828  0014 89            	pushw	x
 829  0015 be00          	ldw	x,c_lreg
 830  0017 89            	pushw	x
 833                     ; 327 	tach_ms_inc();
 835  0018 cd0000        	call	_tach_ms_inc
 837                     ; 328 	TIM3_ClearITPendingBit(TIM3_IT_Update);
 839  001b a601          	ld	a,#1
 840  001d cd0000        	call	_TIM3_ClearITPendingBit
 842                     ; 333 }
 845  0020 85            	popw	x
 846  0021 bf00          	ldw	c_lreg,x
 847  0023 85            	popw	x
 848  0024 bf02          	ldw	c_lreg+2,x
 849  0026 85            	popw	x
 850  0027 bf00          	ldw	c_y,x
 851  0029 320002        	pop	c_y+2
 852  002c 85            	popw	x
 853  002d bf00          	ldw	c_x,x
 854  002f 320002        	pop	c_x+2
 855  0032 80            	iret
 878                     ; 339 INTERRUPT_HANDLER(TIM3_CAP_IRQHandler, 22)
 878                     ; 340 {
 879                     .text:	section	.text,new
 880  0000               f_TIM3_CAP_IRQHandler:
 884                     ; 344 }
 887  0000 80            	iret
 910                     ; 350 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler, 23)
 910                     ; 351 {
 911                     .text:	section	.text,new
 912  0000               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 916                     ; 355 }
 919  0000 80            	iret
 942                     ; 361 INTERRUPT_HANDLER(TIM1_CAP_IRQHandler, 24)
 942                     ; 362 {
 943                     .text:	section	.text,new
 944  0000               f_TIM1_CAP_IRQHandler:
 948                     ; 366 }
 951  0000 80            	iret
 976                     ; 373 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler, 25)
 976                     ; 374 {
 977                     .text:	section	.text,new
 978  0000               f_TIM4_UPD_OVF_TRG_IRQHandler:
 980  0000 8a            	push	cc
 981  0001 84            	pop	a
 982  0002 a4bf          	and	a,#191
 983  0004 88            	push	a
 984  0005 86            	pop	cc
 985  0006 3b0002        	push	c_x+2
 986  0009 be00          	ldw	x,c_x
 987  000b 89            	pushw	x
 988  000c 3b0002        	push	c_y+2
 989  000f be00          	ldw	x,c_y
 990  0011 89            	pushw	x
 993                     ; 378 	delay_dec();
 995  0012 cd0000        	call	_delay_dec
 997                     ; 379 	TIM4_ClearITPendingBit(TIM4_IT_Update);
 999  0015 a601          	ld	a,#1
1000  0017 cd0000        	call	_TIM4_ClearITPendingBit
1002                     ; 382 }
1005  001a 85            	popw	x
1006  001b bf00          	ldw	c_y,x
1007  001d 320002        	pop	c_y+2
1008  0020 85            	popw	x
1009  0021 bf00          	ldw	c_x,x
1010  0023 320002        	pop	c_x+2
1011  0026 80            	iret
1033                     ; 388 INTERRUPT_HANDLER(SPI1_IRQHandler, 26)
1033                     ; 389 {
1034                     .text:	section	.text,new
1035  0000               f_SPI1_IRQHandler:
1039                     ; 393 }
1042  0000 80            	iret
1067                     ; 400 INTERRUPT_HANDLER(USART1_TX_IRQHandler, 27)
1067                     ; 401 {
1068                     .text:	section	.text,new
1069  0000               f_USART1_TX_IRQHandler:
1071  0000 8a            	push	cc
1072  0001 84            	pop	a
1073  0002 a4bf          	and	a,#191
1074  0004 88            	push	a
1075  0005 86            	pop	cc
1076  0006 3b0002        	push	c_x+2
1077  0009 be00          	ldw	x,c_x
1078  000b 89            	pushw	x
1079  000c 3b0002        	push	c_y+2
1080  000f be00          	ldw	x,c_y
1081  0011 89            	pushw	x
1084                     ; 405 	parse_byte_tx();
1086  0012 cd0000        	call	_parse_byte_tx
1088                     ; 406 	USART_ClearITPendingBit(USART1, USART_FLAG_TC);
1090  0015 ae0040        	ldw	x,#64
1091  0018 89            	pushw	x
1092  0019 ae5230        	ldw	x,#21040
1093  001c cd0000        	call	_USART_ClearITPendingBit
1095  001f 85            	popw	x
1096                     ; 407 }
1099  0020 85            	popw	x
1100  0021 bf00          	ldw	c_y,x
1101  0023 320002        	pop	c_y+2
1102  0026 85            	popw	x
1103  0027 bf00          	ldw	c_x,x
1104  0029 320002        	pop	c_x+2
1105  002c 80            	iret
1130                     ; 414 INTERRUPT_HANDLER(USART1_RX_IRQHandler, 28)
1130                     ; 415 {
1131                     .text:	section	.text,new
1132  0000               f_USART1_RX_IRQHandler:
1134  0000 8a            	push	cc
1135  0001 84            	pop	a
1136  0002 a4bf          	and	a,#191
1137  0004 88            	push	a
1138  0005 86            	pop	cc
1139  0006 3b0002        	push	c_x+2
1140  0009 be00          	ldw	x,c_x
1141  000b 89            	pushw	x
1142  000c 3b0002        	push	c_y+2
1143  000f be00          	ldw	x,c_y
1144  0011 89            	pushw	x
1147                     ; 419 	parse_byte_rx();
1149  0012 cd0000        	call	_parse_byte_rx
1151                     ; 420 	USART_ClearITPendingBit(USART1, USART_FLAG_RXNE);
1153  0015 ae0020        	ldw	x,#32
1154  0018 89            	pushw	x
1155  0019 ae5230        	ldw	x,#21040
1156  001c cd0000        	call	_USART_ClearITPendingBit
1158  001f 85            	popw	x
1159                     ; 421 }
1162  0020 85            	popw	x
1163  0021 bf00          	ldw	c_y,x
1164  0023 320002        	pop	c_y+2
1165  0026 85            	popw	x
1166  0027 bf00          	ldw	c_x,x
1167  0029 320002        	pop	c_x+2
1168  002c 80            	iret
1190                     ; 428 INTERRUPT_HANDLER(I2C1_IRQHandler, 29)
1190                     ; 429 {
1191                     .text:	section	.text,new
1192  0000               f_I2C1_IRQHandler:
1196                     ; 433 }
1199  0000 80            	iret
1211                     	xref	_tach_ms_inc
1212                     	xref	_tach3_sens_update
1213                     	xref	_tach2_sens_update
1214                     	xref	_tach1_sens_update
1215                     	xref	_parse_byte_rx
1216                     	xref	_parse_byte_tx
1217                     	xref	_delay_dec
1218                     	xdef	f_I2C1_IRQHandler
1219                     	xdef	f_USART1_RX_IRQHandler
1220                     	xdef	f_USART1_TX_IRQHandler
1221                     	xdef	f_SPI1_IRQHandler
1222                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1223                     	xdef	f_TIM1_CAP_IRQHandler
1224                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1225                     	xdef	f_TIM3_CAP_IRQHandler
1226                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_IRQHandler
1227                     	xdef	f_TIM2_CAP_IRQHandler
1228                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_IRQHandler
1229                     	xdef	f_ADC1_COMP_IRQHandler
1230                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1231                     	xdef	f_LCD_IRQHandler
1232                     	xdef	f_EXTI7_IRQHandler
1233                     	xdef	f_EXTI6_IRQHandler
1234                     	xdef	f_EXTI5_IRQHandler
1235                     	xdef	f_EXTI4_IRQHandler
1236                     	xdef	f_EXTI3_IRQHandler
1237                     	xdef	f_EXTI2_IRQHandler
1238                     	xdef	f_EXTI1_IRQHandler
1239                     	xdef	f_EXTI0_IRQHandler
1240                     	xdef	f_EXTID_IRQHandler
1241                     	xdef	f_EXTIB_IRQHandler
1242                     	xdef	f_EXTIE_F_PVD_IRQHandler
1243                     	xdef	f_RTC_IRQHandler
1244                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1245                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1246                     	xdef	f_FLASH_IRQHandler
1247                     	xdef	f_TRAP_IRQHandler
1248                     	xref	_USART_ClearITPendingBit
1249                     	xref	_TIM4_ClearITPendingBit
1250                     	xref	_TIM3_ClearITPendingBit
1251                     	xref	_EXTI_ClearITPendingBit
1252                     	xref.b	c_lreg
1253                     	xref.b	c_x
1254                     	xref.b	c_y
1273                     	end
