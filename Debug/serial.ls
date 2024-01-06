   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  15                     	bsct
  16  0000               _rx_buffer:
  17  0000 03            	dc.b	3
  18  0001               _tx_buffer_index:
  19  0001 00            	dc.b	0
  20  0002               _tx_buffer_index_max:
  21  0002 00            	dc.b	0
  56                     ; 12 void serial_init(void){
  58                     .text:	section	.text,new
  59  0000               _serial_init:
  63                     ; 13 	GPIO_Init(GPIOC, GPIO_Pin_3, GPIO_Mode_Out_PP_Low_Fast);
  65  0000 4be0          	push	#224
  66  0002 4b08          	push	#8
  67  0004 ae500a        	ldw	x,#20490
  68  0007 cd0000        	call	_GPIO_Init
  70  000a 85            	popw	x
  71                     ; 14 	GPIO_Init(GPIOC, GPIO_Pin_2, GPIO_Mode_In_PU_No_IT);
  73  000b 4b40          	push	#64
  74  000d 4b04          	push	#4
  75  000f ae500a        	ldw	x,#20490
  76  0012 cd0000        	call	_GPIO_Init
  78  0015 85            	popw	x
  79                     ; 15 	GPIO_ExternalPullUpConfig(GPIOC, GPIO_Pin_3, ENABLE);
  81  0016 4b01          	push	#1
  82  0018 4b08          	push	#8
  83  001a ae500a        	ldw	x,#20490
  84  001d cd0000        	call	_GPIO_ExternalPullUpConfig
  86  0020 85            	popw	x
  87                     ; 16 	GPIO_ExternalPullUpConfig(GPIOC, GPIO_Pin_2, ENABLE);	
  89  0021 4b01          	push	#1
  90  0023 4b04          	push	#4
  91  0025 ae500a        	ldw	x,#20490
  92  0028 cd0000        	call	_GPIO_ExternalPullUpConfig
  94  002b 85            	popw	x
  95                     ; 19 	CLK_PeripheralClockConfig(CLK_Peripheral_USART1,ENABLE);
  97  002c ae0501        	ldw	x,#1281
  98  002f cd0000        	call	_CLK_PeripheralClockConfig
 100                     ; 21 	USART_Init(USART1, 4800, USART_WordLength_8b, USART_StopBits_1, USART_Parity_No, (USART_Mode_TypeDef)(USART_Mode_Tx | USART_Mode_Rx));
 102  0032 4b0c          	push	#12
 103  0034 4b00          	push	#0
 104  0036 4b00          	push	#0
 105  0038 4b00          	push	#0
 106  003a ae12c0        	ldw	x,#4800
 107  003d 89            	pushw	x
 108  003e ae0000        	ldw	x,#0
 109  0041 89            	pushw	x
 110  0042 ae5230        	ldw	x,#21040
 111  0045 cd0000        	call	_USART_Init
 113  0048 5b08          	addw	sp,#8
 114                     ; 23 	USART_ITConfig(USART1, USART_IT_RXNE, ENABLE);
 116  004a 4b01          	push	#1
 117  004c ae0255        	ldw	x,#597
 118  004f 89            	pushw	x
 119  0050 ae5230        	ldw	x,#21040
 120  0053 cd0000        	call	_USART_ITConfig
 122  0056 5b03          	addw	sp,#3
 123                     ; 24 	USART_ITConfig(USART1, USART_IT_TC, ENABLE);
 125  0058 4b01          	push	#1
 126  005a ae0266        	ldw	x,#614
 127  005d 89            	pushw	x
 128  005e ae5230        	ldw	x,#21040
 129  0061 cd0000        	call	_USART_ITConfig
 131  0064 5b03          	addw	sp,#3
 132                     ; 26 	USART_Cmd(USART1, ENABLE);
 134  0066 4b01          	push	#1
 135  0068 ae5230        	ldw	x,#21040
 136  006b cd0000        	call	_USART_Cmd
 138  006e 84            	pop	a
 139                     ; 27 }
 142  006f 81            	ret
 167                     ; 29 void parse_byte_rx(void){
 168                     .text:	section	.text,new
 169  0000               _parse_byte_rx:
 173                     ; 30 	rx_buffer = USART_ReceiveData8(USART1);
 175  0000 ae5230        	ldw	x,#21040
 176  0003 cd0000        	call	_USART_ReceiveData8
 178  0006 b700          	ld	_rx_buffer,a
 179                     ; 31 }
 182  0008 81            	ret
 209                     ; 33 void parse_byte_tx(void){
 210                     .text:	section	.text,new
 211  0000               _parse_byte_tx:
 215                     ; 34 	if(tx_buffer_index > tx_buffer_index_max) return;
 217  0000 b601          	ld	a,_tx_buffer_index
 218  0002 b102          	cp	a,_tx_buffer_index_max
 219  0004 2301          	jrule	L14
 223  0006 81            	ret
 224  0007               L14:
 225                     ; 35 	USART_SendData8(USART1, tx_buffer[tx_buffer_index]);
 227  0007 b601          	ld	a,_tx_buffer_index
 228  0009 5f            	clrw	x
 229  000a 97            	ld	xl,a
 230  000b e600          	ld	a,(_tx_buffer,x)
 231  000d 88            	push	a
 232  000e ae5230        	ldw	x,#21040
 233  0011 cd0000        	call	_USART_SendData8
 235  0014 84            	pop	a
 236                     ; 36 	tx_buffer_index++;
 238  0015 3c01          	inc	_tx_buffer_index
 239                     ; 37 }
 242  0017 81            	ret
 313                     ; 39 bool serial_tx_buf_write(void* word, uint8_t length){
 314                     .text:	section	.text,new
 315  0000               _serial_tx_buf_write:
 317  0000 89            	pushw	x
 318       00000000      OFST:	set	0
 321                     ; 41 	if (tx_buffer_index <= tx_buffer_index_max) return 0;
 323  0001 b601          	ld	a,_tx_buffer_index
 324  0003 b102          	cp	a,_tx_buffer_index_max
 325  0005 2203          	jrugt	L57
 328  0007 4f            	clr	a
 330  0008 202a          	jra	L42
 331  000a               L57:
 332                     ; 44 	memcpy(tx_buffer, word, length);
 334  000a 1e01          	ldw	x,(OFST+1,sp)
 335  000c bf00          	ldw	c_x,x
 336  000e 7b05          	ld	a,(OFST+5,sp)
 337  0010 5f            	clrw	x
 338  0011 97            	ld	xl,a
 339  0012 5d            	tnzw	x
 340  0013 2709          	jreq	L41
 341  0015               L61:
 342  0015 5a            	decw	x
 343  0016 92d600        	ld	a,([c_x.w],x)
 344  0019 e700          	ld	(_tx_buffer,x),a
 345  001b 5d            	tnzw	x
 346  001c 26f7          	jrne	L61
 347  001e               L41:
 348                     ; 45 	tx_buffer_index_max = (length <= 50) ? length-1 : 49;
 350  001e 7b05          	ld	a,(OFST+5,sp)
 351  0020 a133          	cp	a,#51
 352  0022 2405          	jruge	L02
 353  0024 7b05          	ld	a,(OFST+5,sp)
 354  0026 4a            	dec	a
 355  0027 2002          	jra	L22
 356  0029               L02:
 357  0029 a631          	ld	a,#49
 358  002b               L22:
 359  002b b702          	ld	_tx_buffer_index_max,a
 360                     ; 46 	tx_buffer_index = 0;
 362  002d 3f01          	clr	_tx_buffer_index
 363                     ; 49 	parse_byte_tx();
 365  002f cd0000        	call	_parse_byte_tx
 367                     ; 50 	return 1;
 369  0032 a601          	ld	a,#1
 371  0034               L42:
 373  0034 85            	popw	x
 374  0035 81            	ret
 402                     ; 53 void serial_write_string(void){
 403                     .text:	section	.text,new
 404  0000               _serial_write_string:
 408                     ; 54 	tx_buffer_index = 0;
 410  0000 3f01          	clr	_tx_buffer_index
 411                     ; 57 	for (tx_buffer_index_max = 0; tx_buffer_index_max < 49; tx_buffer_index_max++){
 413  0002 3f02          	clr	_tx_buffer_index_max
 415  0004 200e          	jra	L311
 416  0006               L701:
 417                     ; 58 		if (tx_buffer[tx_buffer_index_max] == '\0') {
 419  0006 b602          	ld	a,_tx_buffer_index_max
 420  0008 5f            	clrw	x
 421  0009 97            	ld	xl,a
 422  000a 6d00          	tnz	(_tx_buffer,x)
 423  000c 2604          	jrne	L711
 424                     ; 59 			break;
 425  000e               L511:
 426                     ; 64 	parse_byte_tx();
 428  000e cd0000        	call	_parse_byte_tx
 430                     ; 65 }
 433  0011 81            	ret
 434  0012               L711:
 435                     ; 57 	for (tx_buffer_index_max = 0; tx_buffer_index_max < 49; tx_buffer_index_max++){
 437  0012 3c02          	inc	_tx_buffer_index_max
 438  0014               L311:
 441  0014 b602          	ld	a,_tx_buffer_index_max
 442  0016 a131          	cp	a,#49
 443  0018 25ec          	jrult	L701
 444  001a 20f2          	jra	L511
 484                     ; 68 bool serial_write_int(volatile uint32_t b){
 485                     .text:	section	.text,new
 486  0000               _serial_write_int:
 488       00000000      OFST:	set	0
 491                     ; 70 	if (tx_buffer_index <= tx_buffer_index_max) return 0;
 493  0000 b601          	ld	a,_tx_buffer_index
 494  0002 b102          	cp	a,_tx_buffer_index_max
 495  0004 2202          	jrugt	L731
 498  0006 4f            	clr	a
 501  0007 81            	ret
 502  0008               L731:
 503                     ; 71 	sprintf(tx_buffer, "%i\n", b);
 505  0008 1e05          	ldw	x,(OFST+5,sp)
 506  000a 89            	pushw	x
 507  000b 1e05          	ldw	x,(OFST+5,sp)
 508  000d 89            	pushw	x
 509  000e ae0004        	ldw	x,#L141
 510  0011 89            	pushw	x
 511  0012 ae0000        	ldw	x,#_tx_buffer
 512  0015 cd0000        	call	_sprintf
 514  0018 5b06          	addw	sp,#6
 515                     ; 72 	serial_write_string();
 517  001a cd0000        	call	_serial_write_string
 519                     ; 73 	return 1;
 521  001d a601          	ld	a,#1
 524  001f 81            	ret
 564                     ; 76 bool serial_write_float(volatile double b){
 565                     .text:	section	.text,new
 566  0000               _serial_write_float:
 568       00000000      OFST:	set	0
 571                     ; 78 	if (tx_buffer_index <= tx_buffer_index_max) return 0;
 573  0000 b601          	ld	a,_tx_buffer_index
 574  0002 b102          	cp	a,_tx_buffer_index_max
 575  0004 2202          	jrugt	L161
 578  0006 4f            	clr	a
 581  0007 81            	ret
 582  0008               L161:
 583                     ; 79 	sprintf(tx_buffer, "%f\n", b);
 585  0008 1e05          	ldw	x,(OFST+5,sp)
 586  000a 89            	pushw	x
 587  000b 1e05          	ldw	x,(OFST+5,sp)
 588  000d 89            	pushw	x
 589  000e ae0000        	ldw	x,#L361
 590  0011 89            	pushw	x
 591  0012 ae0000        	ldw	x,#_tx_buffer
 592  0015 cd0000        	call	_sprintf
 594  0018 5b06          	addw	sp,#6
 595                     ; 80 	serial_write_string();
 597  001a cd0000        	call	_serial_write_string
 599                     ; 81 	return 1;
 601  001d a601          	ld	a,#1
 604  001f 81            	ret
 657                     	xdef	_parse_byte_tx
 658                     	xdef	_parse_byte_rx
 659                     	xdef	_tx_buffer_index_max
 660                     	xdef	_tx_buffer_index
 661                     	xdef	_serial_write_float
 662                     	xdef	_serial_write_int
 663                     	xdef	_serial_write_string
 664                     	xdef	_serial_tx_buf_write
 665                     	xdef	_serial_init
 666                     	switch	.ubsct
 667  0000               _tx_buffer:
 668  0000 000000000000  	ds.b	50
 669                     	xdef	_tx_buffer
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
 684  0004 25690a00      	dc.b	"%i",10,0
 685                     	xref.b	c_x
 705                     	end
