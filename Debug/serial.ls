   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  15                     	bsct
  16  0000               _tx_buffer_index:
  17  0000 00            	dc.b	0
  18  0001               _tx_buffer_index_max:
  19  0001 00            	dc.b	0
  54                     ; 12 void serial_init(void){
  56                     .text:	section	.text,new
  57  0000               _serial_init:
  61                     ; 13 	GPIO_Init(GPIOC, GPIO_Pin_3, GPIO_Mode_Out_PP_Low_Fast);
  63  0000 4be0          	push	#224
  64  0002 4b08          	push	#8
  65  0004 ae500a        	ldw	x,#20490
  66  0007 cd0000        	call	_GPIO_Init
  68  000a 85            	popw	x
  69                     ; 14 	GPIO_Init(GPIOC, GPIO_Pin_2, GPIO_Mode_In_PU_No_IT);
  71  000b 4b40          	push	#64
  72  000d 4b04          	push	#4
  73  000f ae500a        	ldw	x,#20490
  74  0012 cd0000        	call	_GPIO_Init
  76  0015 85            	popw	x
  77                     ; 15 	GPIO_ExternalPullUpConfig(GPIOC, GPIO_Pin_3, ENABLE);
  79  0016 4b01          	push	#1
  80  0018 4b08          	push	#8
  81  001a ae500a        	ldw	x,#20490
  82  001d cd0000        	call	_GPIO_ExternalPullUpConfig
  84  0020 85            	popw	x
  85                     ; 16 	GPIO_ExternalPullUpConfig(GPIOC, GPIO_Pin_2, ENABLE);	
  87  0021 4b01          	push	#1
  88  0023 4b04          	push	#4
  89  0025 ae500a        	ldw	x,#20490
  90  0028 cd0000        	call	_GPIO_ExternalPullUpConfig
  92  002b 85            	popw	x
  93                     ; 19 	CLK_PeripheralClockConfig(CLK_Peripheral_USART1,ENABLE);
  95  002c ae0501        	ldw	x,#1281
  96  002f cd0000        	call	_CLK_PeripheralClockConfig
  98                     ; 21 	USART_Init(USART1,115200, USART_WordLength_8b, USART_StopBits_1, USART_Parity_No, (USART_Mode_TypeDef)(USART_Mode_Tx | USART_Mode_Rx));
 100  0032 4b0c          	push	#12
 101  0034 4b00          	push	#0
 102  0036 4b00          	push	#0
 103  0038 4b00          	push	#0
 104  003a aec200        	ldw	x,#49664
 105  003d 89            	pushw	x
 106  003e ae0001        	ldw	x,#1
 107  0041 89            	pushw	x
 108  0042 ae5230        	ldw	x,#21040
 109  0045 cd0000        	call	_USART_Init
 111  0048 5b08          	addw	sp,#8
 112                     ; 23 	USART_ITConfig(USART1, USART_IT_RXNE, ENABLE);
 114  004a 4b01          	push	#1
 115  004c ae0255        	ldw	x,#597
 116  004f 89            	pushw	x
 117  0050 ae5230        	ldw	x,#21040
 118  0053 cd0000        	call	_USART_ITConfig
 120  0056 5b03          	addw	sp,#3
 121                     ; 24 	USART_ITConfig(USART1, USART_IT_TC, ENABLE);
 123  0058 4b01          	push	#1
 124  005a ae0266        	ldw	x,#614
 125  005d 89            	pushw	x
 126  005e ae5230        	ldw	x,#21040
 127  0061 cd0000        	call	_USART_ITConfig
 129  0064 5b03          	addw	sp,#3
 130                     ; 26 	USART_Cmd(USART1, ENABLE);
 132  0066 4b01          	push	#1
 133  0068 ae5230        	ldw	x,#21040
 134  006b cd0000        	call	_USART_Cmd
 136  006e 84            	pop	a
 137                     ; 27 }
 140  006f 81            	ret
 165                     ; 29 void parse_byte_rx(void){
 166                     .text:	section	.text,new
 167  0000               _parse_byte_rx:
 171                     ; 30 	rx_buffer = USART_ReceiveData8(USART1);
 173  0000 ae5230        	ldw	x,#21040
 174  0003 cd0000        	call	_USART_ReceiveData8
 176  0006 b732          	ld	_rx_buffer,a
 177                     ; 31 }
 180  0008 81            	ret
 207                     ; 33 void parse_byte_tx(void){
 208                     .text:	section	.text,new
 209  0000               _parse_byte_tx:
 213                     ; 34 	if(tx_buffer_index > tx_buffer_index_max) return;
 215  0000 b600          	ld	a,_tx_buffer_index
 216  0002 b101          	cp	a,_tx_buffer_index_max
 217  0004 2301          	jrule	L14
 221  0006 81            	ret
 222  0007               L14:
 223                     ; 35 	USART_SendData8(USART1, tx_buffer[tx_buffer_index]);
 225  0007 b600          	ld	a,_tx_buffer_index
 226  0009 5f            	clrw	x
 227  000a 97            	ld	xl,a
 228  000b e600          	ld	a,(_tx_buffer,x)
 229  000d 88            	push	a
 230  000e ae5230        	ldw	x,#21040
 231  0011 cd0000        	call	_USART_SendData8
 233  0014 84            	pop	a
 234                     ; 36 	tx_buffer_index++;
 236  0015 3c00          	inc	_tx_buffer_index
 237                     ; 37 }
 240  0017 81            	ret
 311                     ; 39 bool serial_tx_buf_write(void* word, uint8_t length){
 312                     .text:	section	.text,new
 313  0000               _serial_tx_buf_write:
 315  0000 89            	pushw	x
 316       00000000      OFST:	set	0
 319                     ; 41 	if (tx_buffer_index <= tx_buffer_index_max) return 0;
 321  0001 b600          	ld	a,_tx_buffer_index
 322  0003 b101          	cp	a,_tx_buffer_index_max
 323  0005 2203          	jrugt	L57
 326  0007 4f            	clr	a
 328  0008 202a          	jra	L42
 329  000a               L57:
 330                     ; 44 	memcpy(tx_buffer, word, length);
 332  000a 1e01          	ldw	x,(OFST+1,sp)
 333  000c bf00          	ldw	c_x,x
 334  000e 7b05          	ld	a,(OFST+5,sp)
 335  0010 5f            	clrw	x
 336  0011 97            	ld	xl,a
 337  0012 5d            	tnzw	x
 338  0013 2709          	jreq	L41
 339  0015               L61:
 340  0015 5a            	decw	x
 341  0016 92d600        	ld	a,([c_x.w],x)
 342  0019 e700          	ld	(_tx_buffer,x),a
 343  001b 5d            	tnzw	x
 344  001c 26f7          	jrne	L61
 345  001e               L41:
 346                     ; 45 	tx_buffer_index_max = (length <= 50) ? length-1 : 49;
 348  001e 7b05          	ld	a,(OFST+5,sp)
 349  0020 a133          	cp	a,#51
 350  0022 2405          	jruge	L02
 351  0024 7b05          	ld	a,(OFST+5,sp)
 352  0026 4a            	dec	a
 353  0027 2002          	jra	L22
 354  0029               L02:
 355  0029 a631          	ld	a,#49
 356  002b               L22:
 357  002b b701          	ld	_tx_buffer_index_max,a
 358                     ; 46 	tx_buffer_index = 0;
 360  002d 3f00          	clr	_tx_buffer_index
 361                     ; 49 	parse_byte_tx();
 363  002f cd0000        	call	_parse_byte_tx
 365                     ; 50 	return 1;
 367  0032 a601          	ld	a,#1
 369  0034               L42:
 371  0034 85            	popw	x
 372  0035 81            	ret
 400                     ; 53 void serial_write_string(void){
 401                     .text:	section	.text,new
 402  0000               _serial_write_string:
 406                     ; 54 	tx_buffer_index = 0;
 408  0000 3f00          	clr	_tx_buffer_index
 409                     ; 57 	for (tx_buffer_index_max = 0; tx_buffer_index_max < 49; tx_buffer_index_max++){
 411  0002 3f01          	clr	_tx_buffer_index_max
 413  0004 200e          	jra	L311
 414  0006               L701:
 415                     ; 58 		if (tx_buffer[tx_buffer_index_max] == '\0') {
 417  0006 b601          	ld	a,_tx_buffer_index_max
 418  0008 5f            	clrw	x
 419  0009 97            	ld	xl,a
 420  000a 6d00          	tnz	(_tx_buffer,x)
 421  000c 2604          	jrne	L711
 422                     ; 59 			break;
 423  000e               L511:
 424                     ; 64 	parse_byte_tx();
 426  000e cd0000        	call	_parse_byte_tx
 428                     ; 65 }
 431  0011 81            	ret
 432  0012               L711:
 433                     ; 57 	for (tx_buffer_index_max = 0; tx_buffer_index_max < 49; tx_buffer_index_max++){
 435  0012 3c01          	inc	_tx_buffer_index_max
 436  0014               L311:
 439  0014 b601          	ld	a,_tx_buffer_index_max
 440  0016 a131          	cp	a,#49
 441  0018 25ec          	jrult	L701
 442  001a 20f2          	jra	L511
 482                     ; 67 bool serial_write_int(uint32_t b){
 483                     .text:	section	.text,new
 484  0000               _serial_write_int:
 486       00000000      OFST:	set	0
 489                     ; 69 	if (tx_buffer_index <= tx_buffer_index_max) return 0;
 491  0000 b600          	ld	a,_tx_buffer_index
 492  0002 b101          	cp	a,_tx_buffer_index_max
 493  0004 2202          	jrugt	L731
 496  0006 4f            	clr	a
 499  0007 81            	ret
 500  0008               L731:
 501                     ; 70 	sprintf(tx_buffer, "%d\n", b);
 503  0008 1e05          	ldw	x,(OFST+5,sp)
 504  000a 89            	pushw	x
 505  000b 1e05          	ldw	x,(OFST+5,sp)
 506  000d 89            	pushw	x
 507  000e ae0004        	ldw	x,#L141
 508  0011 89            	pushw	x
 509  0012 ae0000        	ldw	x,#_tx_buffer
 510  0015 cd0000        	call	_sprintf
 512  0018 5b06          	addw	sp,#6
 513                     ; 71 	serial_write_string();
 515  001a cd0000        	call	_serial_write_string
 517                     ; 72 	return 1;
 519  001d a601          	ld	a,#1
 522  001f 81            	ret
 562                     ; 75 bool serial_write_float(double b){
 563                     .text:	section	.text,new
 564  0000               _serial_write_float:
 566       00000000      OFST:	set	0
 569                     ; 77 	if (tx_buffer_index <= tx_buffer_index_max) return 0;
 571  0000 b600          	ld	a,_tx_buffer_index
 572  0002 b101          	cp	a,_tx_buffer_index_max
 573  0004 2202          	jrugt	L161
 576  0006 4f            	clr	a
 579  0007 81            	ret
 580  0008               L161:
 581                     ; 78 	sprintf(tx_buffer, "%f\n", b);
 583  0008 1e05          	ldw	x,(OFST+5,sp)
 584  000a 89            	pushw	x
 585  000b 1e05          	ldw	x,(OFST+5,sp)
 586  000d 89            	pushw	x
 587  000e ae0000        	ldw	x,#L361
 588  0011 89            	pushw	x
 589  0012 ae0000        	ldw	x,#_tx_buffer
 590  0015 cd0000        	call	_sprintf
 592  0018 5b06          	addw	sp,#6
 593                     ; 79 	serial_write_string();
 595  001a cd0000        	call	_serial_write_string
 597                     ; 80 	return 1;
 599  001d a601          	ld	a,#1
 602  001f 81            	ret
 655                     	xdef	_parse_byte_tx
 656                     	xdef	_parse_byte_rx
 657                     	xdef	_tx_buffer_index_max
 658                     	xdef	_tx_buffer_index
 659                     	xdef	_serial_write_float
 660                     	xdef	_serial_write_int
 661                     	xdef	_serial_write_string
 662                     	xdef	_serial_tx_buf_write
 663                     	xdef	_serial_init
 664                     	switch	.ubsct
 665  0000               _tx_buffer:
 666  0000 000000000000  	ds.b	50
 667                     	xdef	_tx_buffer
 668  0032               _rx_buffer:
 669  0032 00            	ds.b	1
 670                     	xdef	_rx_buffer
 671                     	xref	_sprintf
 672                     	xref	_USART_ITConfig
 673                     	xref	_USART_ReceiveData8
 674                     	xref	_USART_SendData8
 675                     	xref	_USART_Cmd
 676                     	xref	_USART_Init
 677                     	xref	_GPIO_ExternalPullUpConfig
 678                     	xref	_GPIO_Init
 679                     	xref	_CLK_PeripheralClockConfig
 680                     .const:	section	.text
 681  0000               L361:
 682  0000 25660a00      	dc.b	"%f",10,0
 683  0004               L141:
 684  0004 25640a00      	dc.b	"%d",10,0
 685                     	xref.b	c_x
 705                     	end
