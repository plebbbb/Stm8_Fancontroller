   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  43                     ; 64 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  43                     ; 65 {
  44                     .text:	section	.text,new
  45  0000               f_TRAP_IRQHandler:
  49                     ; 69 }
  52  0000 80            	iret
  74                     ; 75 INTERRUPT_HANDLER(FLASH_IRQHandler, 1)
  74                     ; 76 {
  75                     .text:	section	.text,new
  76  0000               f_FLASH_IRQHandler:
  80                     ; 80 }
  83  0000 80            	iret
 106                     ; 86 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler, 2)
 106                     ; 87 {
 107                     .text:	section	.text,new
 108  0000               f_DMA1_CHANNEL0_1_IRQHandler:
 112                     ; 91 }
 115  0000 80            	iret
 138                     ; 97 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler, 3)
 138                     ; 98 {
 139                     .text:	section	.text,new
 140  0000               f_DMA1_CHANNEL2_3_IRQHandler:
 144                     ; 102 }
 147  0000 80            	iret
 169                     ; 108 INTERRUPT_HANDLER(RTC_IRQHandler, 4)
 169                     ; 109 {
 170                     .text:	section	.text,new
 171  0000               f_RTC_IRQHandler:
 175                     ; 113 }
 178  0000 80            	iret
 201                     ; 119 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler, 5)
 201                     ; 120 {
 202                     .text:	section	.text,new
 203  0000               f_EXTIE_F_PVD_IRQHandler:
 207                     ; 124 }
 210  0000 80            	iret
 232                     ; 131 INTERRUPT_HANDLER(EXTIB_IRQHandler, 6)
 232                     ; 132 {
 233                     .text:	section	.text,new
 234  0000               f_EXTIB_IRQHandler:
 238                     ; 136 }
 241  0000 80            	iret
 263                     ; 143 INTERRUPT_HANDLER(EXTID_IRQHandler, 7)
 263                     ; 144 {
 264                     .text:	section	.text,new
 265  0000               f_EXTID_IRQHandler:
 269                     ; 148 }
 272  0000 80            	iret
 294                     ; 155 INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
 294                     ; 156 {
 295                     .text:	section	.text,new
 296  0000               f_EXTI0_IRQHandler:
 300                     ; 160 }
 303  0000 80            	iret
 325                     ; 167 INTERRUPT_HANDLER(EXTI1_IRQHandler, 9)
 325                     ; 168 {
 326                     .text:	section	.text,new
 327  0000               f_EXTI1_IRQHandler:
 331                     ; 172 }
 334  0000 80            	iret
 356                     ; 179 INTERRUPT_HANDLER(EXTI2_IRQHandler, 10)
 356                     ; 180 {
 357                     .text:	section	.text,new
 358  0000               f_EXTI2_IRQHandler:
 362                     ; 184 }
 365  0000 80            	iret
 387                     ; 191 INTERRUPT_HANDLER(EXTI3_IRQHandler, 11)
 387                     ; 192 {
 388                     .text:	section	.text,new
 389  0000               f_EXTI3_IRQHandler:
 393                     ; 196 }
 396  0000 80            	iret
 418                     ; 203 INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
 418                     ; 204 {
 419                     .text:	section	.text,new
 420  0000               f_EXTI4_IRQHandler:
 424                     ; 208 }
 427  0000 80            	iret
 449                     ; 215 INTERRUPT_HANDLER(EXTI5_IRQHandler, 13)
 449                     ; 216 {
 450                     .text:	section	.text,new
 451  0000               f_EXTI5_IRQHandler:
 455                     ; 220 }
 458  0000 80            	iret
 480                     ; 227 INTERRUPT_HANDLER(EXTI6_IRQHandler, 14)
 480                     ; 228 {
 481                     .text:	section	.text,new
 482  0000               f_EXTI6_IRQHandler:
 486                     ; 232 }
 489  0000 80            	iret
 511                     ; 239 INTERRUPT_HANDLER(EXTI7_IRQHandler, 15)
 511                     ; 240 {
 512                     .text:	section	.text,new
 513  0000               f_EXTI7_IRQHandler:
 517                     ; 244 }
 520  0000 80            	iret
 542                     ; 250 INTERRUPT_HANDLER(LCD_IRQHandler, 16)
 542                     ; 251 {
 543                     .text:	section	.text,new
 544  0000               f_LCD_IRQHandler:
 548                     ; 255 }
 551  0000 80            	iret
 574                     ; 261 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler, 17)
 574                     ; 262 {
 575                     .text:	section	.text,new
 576  0000               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 580                     ; 266 }
 583  0000 80            	iret
 606                     ; 273 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler, 18)
 606                     ; 274 {
 607                     .text:	section	.text,new
 608  0000               f_ADC1_COMP_IRQHandler:
 612                     ; 278 }
 615  0000 80            	iret
 638                     ; 285 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_IRQHandler, 19)
 638                     ; 286 {
 639                     .text:	section	.text,new
 640  0000               f_TIM2_UPD_OVF_TRG_BRK_IRQHandler:
 644                     ; 290 }
 647  0000 80            	iret
 670                     ; 297 INTERRUPT_HANDLER(TIM2_CAP_IRQHandler, 20)
 670                     ; 298 {
 671                     .text:	section	.text,new
 672  0000               f_TIM2_CAP_IRQHandler:
 676                     ; 302 }
 679  0000 80            	iret
 702                     ; 310 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_IRQHandler, 21)
 702                     ; 311 {
 703                     .text:	section	.text,new
 704  0000               f_TIM3_UPD_OVF_TRG_BRK_IRQHandler:
 708                     ; 315 }
 711  0000 80            	iret
 734                     ; 321 INTERRUPT_HANDLER(TIM3_CAP_IRQHandler, 22)
 734                     ; 322 {
 735                     .text:	section	.text,new
 736  0000               f_TIM3_CAP_IRQHandler:
 740                     ; 326 }
 743  0000 80            	iret
 766                     ; 332 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler, 23)
 766                     ; 333 {
 767                     .text:	section	.text,new
 768  0000               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 772                     ; 337 }
 775  0000 80            	iret
 798                     ; 343 INTERRUPT_HANDLER(TIM1_CAP_IRQHandler, 24)
 798                     ; 344 {
 799                     .text:	section	.text,new
 800  0000               f_TIM1_CAP_IRQHandler:
 804                     ; 348 }
 807  0000 80            	iret
 832                     ; 355 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler, 25)
 832                     ; 356 {
 833                     .text:	section	.text,new
 834  0000               f_TIM4_UPD_OVF_TRG_IRQHandler:
 836  0000 8a            	push	cc
 837  0001 84            	pop	a
 838  0002 a4bf          	and	a,#191
 839  0004 88            	push	a
 840  0005 86            	pop	cc
 841  0006 3b0002        	push	c_x+2
 842  0009 be00          	ldw	x,c_x
 843  000b 89            	pushw	x
 844  000c 3b0002        	push	c_y+2
 845  000f be00          	ldw	x,c_y
 846  0011 89            	pushw	x
 849                     ; 360 	delay_dec();
 851  0012 cd0000        	call	_delay_dec
 853                     ; 361 	TIM4_ClearITPendingBit(TIM4_IT_Update);
 855  0015 a601          	ld	a,#1
 856  0017 cd0000        	call	_TIM4_ClearITPendingBit
 858                     ; 364 }
 861  001a 85            	popw	x
 862  001b bf00          	ldw	c_y,x
 863  001d 320002        	pop	c_y+2
 864  0020 85            	popw	x
 865  0021 bf00          	ldw	c_x,x
 866  0023 320002        	pop	c_x+2
 867  0026 80            	iret
 889                     ; 370 INTERRUPT_HANDLER(SPI1_IRQHandler, 26)
 889                     ; 371 {
 890                     .text:	section	.text,new
 891  0000               f_SPI1_IRQHandler:
 895                     ; 375 }
 898  0000 80            	iret
 921                     ; 382 INTERRUPT_HANDLER(USART1_TX_IRQHandler, 27)
 921                     ; 383 {
 922                     .text:	section	.text,new
 923  0000               f_USART1_TX_IRQHandler:
 927                     ; 387 }
 930  0000 80            	iret
 953                     ; 394 INTERRUPT_HANDLER(USART1_RX_IRQHandler, 28)
 953                     ; 395 {
 954                     .text:	section	.text,new
 955  0000               f_USART1_RX_IRQHandler:
 959                     ; 399 }
 962  0000 80            	iret
 984                     ; 406 INTERRUPT_HANDLER(I2C1_IRQHandler, 29)
 984                     ; 407 {
 985                     .text:	section	.text,new
 986  0000               f_I2C1_IRQHandler:
 990                     ; 411 }
 993  0000 80            	iret
1005                     	xref	_delay_dec
1006                     	xdef	f_I2C1_IRQHandler
1007                     	xdef	f_USART1_RX_IRQHandler
1008                     	xdef	f_USART1_TX_IRQHandler
1009                     	xdef	f_SPI1_IRQHandler
1010                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1011                     	xdef	f_TIM1_CAP_IRQHandler
1012                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1013                     	xdef	f_TIM3_CAP_IRQHandler
1014                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_IRQHandler
1015                     	xdef	f_TIM2_CAP_IRQHandler
1016                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_IRQHandler
1017                     	xdef	f_ADC1_COMP_IRQHandler
1018                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1019                     	xdef	f_LCD_IRQHandler
1020                     	xdef	f_EXTI7_IRQHandler
1021                     	xdef	f_EXTI6_IRQHandler
1022                     	xdef	f_EXTI5_IRQHandler
1023                     	xdef	f_EXTI4_IRQHandler
1024                     	xdef	f_EXTI3_IRQHandler
1025                     	xdef	f_EXTI2_IRQHandler
1026                     	xdef	f_EXTI1_IRQHandler
1027                     	xdef	f_EXTI0_IRQHandler
1028                     	xdef	f_EXTID_IRQHandler
1029                     	xdef	f_EXTIB_IRQHandler
1030                     	xdef	f_EXTIE_F_PVD_IRQHandler
1031                     	xdef	f_RTC_IRQHandler
1032                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1033                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1034                     	xdef	f_FLASH_IRQHandler
1035                     	xdef	f_TRAP_IRQHandler
1036                     	xref	_TIM4_ClearITPendingBit
1037                     	xref.b	c_x
1038                     	xref.b	c_y
1057                     	end
