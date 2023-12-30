   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  15                     	bsct
  16  0000               _adc_sense_output:
  17  0000 0000          	dc.w	0
  18  0002 0000          	dc.w	0
  19  0004 0000          	ds.b	2
 155                     ; 13 void adc_sensor_config(uint8_t sensor, double b1, double A1, double B1, double C1){
 157                     .text:	section	.text,new
 158  0000               _adc_sensor_config:
 160  0000 88            	push	a
 161  0001 89            	pushw	x
 162       00000002      OFST:	set	2
 165                     ; 15 	switch (sensor) {
 168                     ; 25 			break;
 169  0002 4a            	dec	a
 170  0003 2706          	jreq	L3
 171  0005 4a            	dec	a
 172  0006 270a          	jreq	L5
 173  0008 4a            	dec	a
 174  0009 270e          	jreq	L7
 175  000b               L3:
 176                     ; 16 		case 1:
 176                     ; 17 		default:
 176                     ; 18 			tmp = &adc_FAN1;
 178  000b ae0024        	ldw	x,#_adc_FAN1
 179  000e 1f01          	ldw	(OFST-1,sp),x
 181                     ; 19 			break;
 183  0010 200c          	jra	L501
 184  0012               L5:
 185                     ; 20 		case 2:
 185                     ; 21 			tmp = &adc_FAN2;
 187  0012 ae0012        	ldw	x,#_adc_FAN2
 188  0015 1f01          	ldw	(OFST-1,sp),x
 190                     ; 22 			break;
 192  0017 2005          	jra	L501
 193  0019               L7:
 194                     ; 23 		case 3:
 194                     ; 24 			tmp = &adc_FAN3;
 196  0019 ae0000        	ldw	x,#_adc_FAN3
 197  001c 1f01          	ldw	(OFST-1,sp),x
 199                     ; 25 			break;
 201  001e               L501:
 202                     ; 27 	tmp->beta = b1;
 204  001e 1e01          	ldw	x,(OFST-1,sp)
 205  0020 7b09          	ld	a,(OFST+7,sp)
 206  0022 e705          	ld	(5,x),a
 207  0024 7b08          	ld	a,(OFST+6,sp)
 208  0026 e704          	ld	(4,x),a
 209  0028 7b07          	ld	a,(OFST+5,sp)
 210  002a e703          	ld	(3,x),a
 211  002c 7b06          	ld	a,(OFST+4,sp)
 212  002e e702          	ld	(2,x),a
 213                     ; 28 	tmp->A = A1;
 215  0030 1e01          	ldw	x,(OFST-1,sp)
 216  0032 7b0d          	ld	a,(OFST+11,sp)
 217  0034 e709          	ld	(9,x),a
 218  0036 7b0c          	ld	a,(OFST+10,sp)
 219  0038 e708          	ld	(8,x),a
 220  003a 7b0b          	ld	a,(OFST+9,sp)
 221  003c e707          	ld	(7,x),a
 222  003e 7b0a          	ld	a,(OFST+8,sp)
 223  0040 e706          	ld	(6,x),a
 224                     ; 29 	tmp->B = B1;
 226  0042 1e01          	ldw	x,(OFST-1,sp)
 227  0044 7b11          	ld	a,(OFST+15,sp)
 228  0046 e70d          	ld	(13,x),a
 229  0048 7b10          	ld	a,(OFST+14,sp)
 230  004a e70c          	ld	(12,x),a
 231  004c 7b0f          	ld	a,(OFST+13,sp)
 232  004e e70b          	ld	(11,x),a
 233  0050 7b0e          	ld	a,(OFST+12,sp)
 234  0052 e70a          	ld	(10,x),a
 235                     ; 30 	tmp->C = C1;
 237  0054 1e01          	ldw	x,(OFST-1,sp)
 238  0056 7b15          	ld	a,(OFST+19,sp)
 239  0058 e711          	ld	(17,x),a
 240  005a 7b14          	ld	a,(OFST+18,sp)
 241  005c e710          	ld	(16,x),a
 242  005e 7b13          	ld	a,(OFST+17,sp)
 243  0060 e70f          	ld	(15,x),a
 244  0062 7b12          	ld	a,(OFST+16,sp)
 245  0064 e70e          	ld	(14,x),a
 246                     ; 31 }
 249  0066 5b03          	addw	sp,#3
 250  0068 81            	ret
 288                     ; 32 void adc_subsystem_init(void){
 289                     .text:	section	.text,new
 290  0000               _adc_subsystem_init:
 294                     ; 33 	adc_FAN1.read_addr = adc_sense_output + 2;
 296  0000 ae0004        	ldw	x,#_adc_sense_output+4
 297  0003 bf24          	ldw	_adc_FAN1,x
 298                     ; 34 	adc_FAN2.read_addr = adc_sense_output;
 300  0005 ae0000        	ldw	x,#_adc_sense_output
 301  0008 bf12          	ldw	_adc_FAN2,x
 302                     ; 35 	adc_FAN3.read_addr = adc_sense_output + 1;
 304  000a ae0002        	ldw	x,#_adc_sense_output+2
 305  000d bf00          	ldw	_adc_FAN3,x
 306                     ; 37 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
 308  000f ae1001        	ldw	x,#4097
 309  0012 cd0000        	call	_CLK_PeripheralClockConfig
 311                     ; 38 	CLK_PeripheralClockConfig(CLK_Peripheral_DMA1, ENABLE);
 313  0015 ae1401        	ldw	x,#5121
 314  0018 cd0000        	call	_CLK_PeripheralClockConfig
 316                     ; 40 	ADC_Init(ADC1, ADC_ConversionMode_Continuous, ADC_Resolution_12Bit, ADC_Prescaler_2);
 318  001b 4b80          	push	#128
 319  001d 4b00          	push	#0
 320  001f 4b04          	push	#4
 321  0021 ae5340        	ldw	x,#21312
 322  0024 cd0000        	call	_ADC_Init
 324  0027 5b03          	addw	sp,#3
 325                     ; 41 	ADC_SamplingTimeConfig(ADC1, ADC_Group_SlowChannels, ADC_SamplingTime_384Cycles);
 327  0029 4b07          	push	#7
 328  002b 4b00          	push	#0
 329  002d ae5340        	ldw	x,#21312
 330  0030 cd0000        	call	_ADC_SamplingTimeConfig
 332  0033 85            	popw	x
 333                     ; 42 	ADC_SamplingTimeConfig(ADC1, ADC_Group_FastChannels, ADC_SamplingTime_384Cycles);
 335  0034 4b07          	push	#7
 336  0036 4b01          	push	#1
 337  0038 ae5340        	ldw	x,#21312
 338  003b cd0000        	call	_ADC_SamplingTimeConfig
 340  003e 85            	popw	x
 341                     ; 44 	ADC_Cmd(ADC1, ENABLE);
 343  003f 4b01          	push	#1
 344  0041 ae5340        	ldw	x,#21312
 345  0044 cd0000        	call	_ADC_Cmd
 347  0047 84            	pop	a
 348                     ; 46 	ADC_ChannelCmd(ADC1, ADC_Channel_2, ENABLE);
 350  0048 4b01          	push	#1
 351  004a ae0304        	ldw	x,#772
 352  004d 89            	pushw	x
 353  004e ae5340        	ldw	x,#21312
 354  0051 cd0000        	call	_ADC_ChannelCmd
 356  0054 5b03          	addw	sp,#3
 357                     ; 47 	ADC_ChannelCmd(ADC1, ADC_Channel_9, ENABLE);
 359  0056 4b01          	push	#1
 360  0058 ae0202        	ldw	x,#514
 361  005b 89            	pushw	x
 362  005c ae5340        	ldw	x,#21312
 363  005f cd0000        	call	_ADC_ChannelCmd
 365  0062 5b03          	addw	sp,#3
 366                     ; 48 	ADC_ChannelCmd(ADC1, ADC_Channel_17, ENABLE);
 368  0064 4b01          	push	#1
 369  0066 ae0102        	ldw	x,#258
 370  0069 89            	pushw	x
 371  006a ae5340        	ldw	x,#21312
 372  006d cd0000        	call	_ADC_ChannelCmd
 374  0070 5b03          	addw	sp,#3
 375                     ; 50 	SYSCFG_REMAPDMAChannelConfig(REMAP_DMA1Channel_ADC1ToChannel0);
 377  0072 4f            	clr	a
 378  0073 cd0000        	call	_SYSCFG_REMAPDMAChannelConfig
 380                     ; 52 	DMA_Init(DMA1_Channel0, (uint16_t)(&adc_sense_output), 0x5344, 3,  DMA_DIR_PeripheralToMemory, DMA_Mode_Circular, DMA_MemoryIncMode_Inc, DMA_Priority_High, DMA_MemoryDataSize_HalfWord);
 382  0076 4b08          	push	#8
 383  0078 4b20          	push	#32
 384  007a 4b20          	push	#32
 385  007c 4b10          	push	#16
 386  007e 4b00          	push	#0
 387  0080 4b03          	push	#3
 388  0082 ae5344        	ldw	x,#21316
 389  0085 89            	pushw	x
 390  0086 a600          	ld	a,#_adc_sense_output
 391  0088 b703          	ld	c_lreg+3,a
 392  008a 3f02          	clr	c_lreg+2
 393  008c 3f01          	clr	c_lreg+1
 394  008e 3f00          	clr	c_lreg
 395  0090 be02          	ldw	x,c_lreg+2
 396  0092 89            	pushw	x
 397  0093 be00          	ldw	x,c_lreg
 398  0095 89            	pushw	x
 399  0096 ae5075        	ldw	x,#20597
 400  0099 cd0000        	call	_DMA_Init
 402  009c 5b0c          	addw	sp,#12
 403                     ; 54 	DMA_Cmd(DMA1_Channel0, ENABLE);
 405  009e 4b01          	push	#1
 406  00a0 ae5075        	ldw	x,#20597
 407  00a3 cd0000        	call	_DMA_Cmd
 409  00a6 84            	pop	a
 410                     ; 58 	DMA_GlobalCmd(ENABLE);
 412  00a7 a601          	ld	a,#1
 413  00a9 cd0000        	call	_DMA_GlobalCmd
 415                     ; 60 	ADC_DMACmd(ADC1, ENABLE);
 417  00ac 4b01          	push	#1
 418  00ae ae5340        	ldw	x,#21312
 419  00b1 cd0000        	call	_ADC_DMACmd
 421  00b4 84            	pop	a
 422                     ; 62 	ADC_SoftwareStartConv(ADC1);
 424  00b5 ae5340        	ldw	x,#21312
 425  00b8 cd0000        	call	_ADC_SoftwareStartConv
 427                     ; 63 }
 430  00bb 81            	ret
 494                     ; 65 double adc_sensor_read_C(struct adc_sensor sensor){
 495                     .text:	section	.text,new
 496  0000               _adc_sensor_read_C:
 498  0000 5212          	subw	sp,#18
 499       00000012      OFST:	set	18
 502                     ; 66 	uint16_t voltage_mv = (double)(*(sensor.read_addr)/4095.f) * 3200;
 504  0002 1e15          	ldw	x,(OFST+3,sp)
 505  0004 fe            	ldw	x,(x)
 506  0005 cd0000        	call	c_uitof
 508  0008 ae001c        	ldw	x,#L551
 509  000b cd0000        	call	c_fdiv
 511  000e ae0018        	ldw	x,#L561
 512  0011 cd0000        	call	c_fmul
 514  0014 cd0000        	call	c_ftoi
 516  0017 1f0d          	ldw	(OFST-5,sp),x
 518                     ; 67 	double resistance = 10000/(3200/(double)voltage_mv - 1);
 520  0019 1e0d          	ldw	x,(OFST-5,sp)
 521  001b cd0000        	call	c_uitof
 523  001e 96            	ldw	x,sp
 524  001f 1c0009        	addw	x,#OFST-9
 525  0022 cd0000        	call	c_rtol
 528  0025 ae0c80        	ldw	x,#3200
 529  0028 cd0000        	call	c_itof
 531  002b 96            	ldw	x,sp
 532  002c 1c0009        	addw	x,#OFST-9
 533  002f cd0000        	call	c_fdiv
 535  0032 ae0014        	ldw	x,#L571
 536  0035 cd0000        	call	c_fsub
 538  0038 96            	ldw	x,sp
 539  0039 1c0005        	addw	x,#OFST-13
 540  003c cd0000        	call	c_rtol
 543  003f ae2710        	ldw	x,#10000
 544  0042 cd0000        	call	c_itof
 546  0045 96            	ldw	x,sp
 547  0046 1c0005        	addw	x,#OFST-13
 548  0049 cd0000        	call	c_fdiv
 550  004c 96            	ldw	x,sp
 551  004d 1c000f        	addw	x,#OFST-3
 552  0050 cd0000        	call	c_rtol
 555                     ; 68 	double temp_SFH = 1 / (0.003141 - 0.0001141*log(resistance) + 0.0000016181*pow(log(resistance),3)) - 273.15;
 557  0053 ce0006        	ldw	x,L522+2
 558  0056 89            	pushw	x
 559  0057 ce0004        	ldw	x,L522
 560  005a 89            	pushw	x
 561  005b 1e15          	ldw	x,(OFST+3,sp)
 562  005d 89            	pushw	x
 563  005e 1e15          	ldw	x,(OFST+3,sp)
 564  0060 89            	pushw	x
 565  0061 cd0000        	call	_log
 567  0064 5b04          	addw	sp,#4
 568  0066 be02          	ldw	x,c_lreg+2
 569  0068 89            	pushw	x
 570  0069 be00          	ldw	x,c_lreg
 571  006b 89            	pushw	x
 572  006c cd0000        	call	_pow
 574  006f 5b08          	addw	sp,#8
 575  0071 ae0008        	ldw	x,#L532
 576  0074 cd0000        	call	c_fmul
 578  0077 96            	ldw	x,sp
 579  0078 1c0009        	addw	x,#OFST-9
 580  007b cd0000        	call	c_rtol
 583  007e 1e11          	ldw	x,(OFST-1,sp)
 584  0080 89            	pushw	x
 585  0081 1e11          	ldw	x,(OFST-1,sp)
 586  0083 89            	pushw	x
 587  0084 cd0000        	call	_log
 589  0087 5b04          	addw	sp,#4
 590  0089 ae000c        	ldw	x,#L512
 591  008c cd0000        	call	c_fmul
 593  008f 96            	ldw	x,sp
 594  0090 1c0005        	addw	x,#OFST-13
 595  0093 cd0000        	call	c_rtol
 598  0096 ae0010        	ldw	x,#L502
 599  0099 cd0000        	call	c_ltor
 601  009c 96            	ldw	x,sp
 602  009d 1c0005        	addw	x,#OFST-13
 603  00a0 cd0000        	call	c_fsub
 605  00a3 96            	ldw	x,sp
 606  00a4 1c0009        	addw	x,#OFST-9
 607  00a7 cd0000        	call	c_fadd
 609  00aa 96            	ldw	x,sp
 610  00ab 1c0001        	addw	x,#OFST-17
 611  00ae cd0000        	call	c_rtol
 614  00b1 a601          	ld	a,#1
 615  00b3 cd0000        	call	c_ctof
 617  00b6 96            	ldw	x,sp
 618  00b7 1c0001        	addw	x,#OFST-17
 619  00ba cd0000        	call	c_fdiv
 621  00bd ae0000        	ldw	x,#L542
 622  00c0 cd0000        	call	c_fsub
 624  00c3 96            	ldw	x,sp
 625  00c4 1c000f        	addw	x,#OFST-3
 626  00c7 cd0000        	call	c_rtol
 629                     ; 70 	return temp_SFH;
 631  00ca 96            	ldw	x,sp
 632  00cb 1c000f        	addw	x,#OFST-3
 633  00ce cd0000        	call	c_ltor
 637  00d1 5b12          	addw	sp,#18
 638  00d3 81            	ret
 693                     	xref	_pow
 694                     	xref	_log
 695                     	xdef	_adc_sensor_read_C
 696                     	xdef	_adc_sensor_config
 697                     	xdef	_adc_subsystem_init
 698                     	switch	.ubsct
 699  0000               _adc_FAN3:
 700  0000 000000000000  	ds.b	18
 701                     	xdef	_adc_FAN3
 702  0012               _adc_FAN2:
 703  0012 000000000000  	ds.b	18
 704                     	xdef	_adc_FAN2
 705  0024               _adc_FAN1:
 706  0024 000000000000  	ds.b	18
 707                     	xdef	_adc_FAN1
 708                     	xdef	_adc_sense_output
 709                     	xref	_SYSCFG_REMAPDMAChannelConfig
 710                     	xref	_DMA_Cmd
 711                     	xref	_DMA_GlobalCmd
 712                     	xref	_DMA_Init
 713                     	xref	_CLK_PeripheralClockConfig
 714                     	xref	_ADC_DMACmd
 715                     	xref	_ADC_SamplingTimeConfig
 716                     	xref	_ADC_ChannelCmd
 717                     	xref	_ADC_SoftwareStartConv
 718                     	xref	_ADC_Cmd
 719                     	xref	_ADC_Init
 720                     .const:	section	.text
 721  0000               L542:
 722  0000 43889333      	dc.w	17288,-27853
 723  0004               L522:
 724  0004 40400000      	dc.w	16448,0
 725  0008               L532:
 726  0008 35d92d7e      	dc.w	13785,11646
 727  000c               L512:
 728  000c 38ef48f8      	dc.w	14575,18680
 729  0010               L502:
 730  0010 3b4dd93c      	dc.w	15181,-9924
 731  0014               L571:
 732  0014 3f800000      	dc.w	16256,0
 733  0018               L561:
 734  0018 45480000      	dc.w	17736,0
 735  001c               L551:
 736  001c 457ff000      	dc.w	17791,-4096
 737                     	xref.b	c_lreg
 738                     	xref.b	c_x
 758                     	xref	c_fadd
 759                     	xref	c_ltor
 760                     	xref	c_ctof
 761                     	xref	c_fsub
 762                     	xref	c_rtol
 763                     	xref	c_itof
 764                     	xref	c_ftoi
 765                     	xref	c_fmul
 766                     	xref	c_fdiv
 767                     	xref	c_uitof
 768                     	end
