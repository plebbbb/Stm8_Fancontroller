   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  63                     ; 9 void delay_ms(unsigned long int ms) {
  65                     	switch	.text
  66  0000               _delay_ms:
  68  0000 5204          	subw	sp,#4
  69       00000004      OFST:	set	4
  72                     ; 11     for (i = 0; i < ((200000UL / 18 / 1000UL) * ms); i++) {
  74  0002 ae0000        	ldw	x,#0
  75  0005 1f03          	ldw	(OFST-1,sp),x
  76  0007 ae0000        	ldw	x,#0
  77  000a 1f01          	ldw	(OFST-3,sp),x
  80  000c 200a          	jra	L73
  81  000e               L33:
  82                     ; 12         nop();
  85  000e 9d            nop
  87                     ; 11     for (i = 0; i < ((200000UL / 18 / 1000UL) * ms); i++) {
  90  000f 96            	ldw	x,sp
  91  0010 1c0001        	addw	x,#OFST-3
  92  0013 a601          	ld	a,#1
  93  0015 cd0000        	call	c_lgadc
  96  0018               L73:
  99  0018 96            	ldw	x,sp
 100  0019 1c0007        	addw	x,#OFST+3
 101  001c cd0000        	call	c_ltor
 103  001f a60b          	ld	a,#11
 104  0021 cd0000        	call	c_smul
 106  0024 96            	ldw	x,sp
 107  0025 1c0001        	addw	x,#OFST-3
 108  0028 cd0000        	call	c_lcmp
 110  002b 22e1          	jrugt	L33
 111                     ; 14 }
 114  002d 5b04          	addw	sp,#4
 115  002f 81            	ret
 186                     ; 18 void main(){
 187                     	switch	.text
 188  0030               _main:
 190  0030 5203          	subw	sp,#3
 191       00000003      OFST:	set	3
 194                     ; 19 	uint16_t c = 30;
 196  0032 ae001e        	ldw	x,#30
 197  0035 1f02          	ldw	(OFST-1,sp),x
 199                     ; 20 	bool e = 0;
 201  0037 0f01          	clr	(OFST-2,sp)
 203                     ; 22 	pwm_control_init(2);
 205  0039 ae0002        	ldw	x,#2
 206  003c cd0000        	call	_pwm_control_init
 208                     ; 23 	v_control_init();
 210  003f cd0000        	call	_v_control_init
 212                     ; 24 	v_control_active(1);
 214  0042 a601          	ld	a,#1
 215  0044 cd0000        	call	_v_control_active
 217  0047               L57:
 218                     ; 28 		GPIO_WriteBit(GPIOA, GPIO_Pin_5, (e == 1) ? SET : RESET);
 220  0047 7b01          	ld	a,(OFST-2,sp)
 221  0049 a101          	cp	a,#1
 222  004b 2604          	jrne	L01
 223  004d a601          	ld	a,#1
 224  004f 2001          	jra	L21
 225  0051               L01:
 226  0051 4f            	clr	a
 227  0052               L21:
 228  0052 88            	push	a
 229  0053 4b20          	push	#32
 230  0055 ae5000        	ldw	x,#20480
 231  0058 cd0000        	call	_GPIO_WriteBit
 233  005b 85            	popw	x
 234                     ; 29 		delay_ms(50);
 236  005c ae0032        	ldw	x,#50
 237  005f 89            	pushw	x
 238  0060 ae0000        	ldw	x,#0
 239  0063 89            	pushw	x
 240  0064 ad9a          	call	_delay_ms
 242  0066 5b04          	addw	sp,#4
 243                     ; 30 		if (e == 1) c++;
 245  0068 7b01          	ld	a,(OFST-2,sp)
 246  006a a101          	cp	a,#1
 247  006c 2609          	jrne	L101
 250  006e 1e02          	ldw	x,(OFST-1,sp)
 251  0070 1c0001        	addw	x,#1
 252  0073 1f02          	ldw	(OFST-1,sp),x
 255  0075 2007          	jra	L301
 256  0077               L101:
 257                     ; 31 		else c--;
 259  0077 1e02          	ldw	x,(OFST-1,sp)
 260  0079 1d0001        	subw	x,#1
 261  007c 1f02          	ldw	(OFST-1,sp),x
 263  007e               L301:
 264                     ; 33 		if (c == 100) e = 0;
 266  007e 1e02          	ldw	x,(OFST-1,sp)
 267  0080 a30064        	cpw	x,#100
 268  0083 2602          	jrne	L501
 271  0085 0f01          	clr	(OFST-2,sp)
 273  0087               L501:
 274                     ; 34 		if (c == 0) e = 1;
 276  0087 1e02          	ldw	x,(OFST-1,sp)
 277  0089 2604          	jrne	L701
 280  008b a601          	ld	a,#1
 281  008d 6b01          	ld	(OFST-2,sp),a
 283  008f               L701:
 284                     ; 35 		v_control_setoutput(c);
 286  008f 7b03          	ld	a,(OFST+0,sp)
 287  0091 cd0000        	call	_v_control_setoutput
 289                     ; 36 		pwm_control_setoutput(2, c);
 291  0094 1e02          	ldw	x,(OFST-1,sp)
 292  0096 89            	pushw	x
 293  0097 ae0002        	ldw	x,#2
 294  009a cd0000        	call	_pwm_control_setoutput
 296  009d 85            	popw	x
 298  009e 20a7          	jra	L57
 311                     	xdef	_main
 312                     	xdef	_delay_ms
 313                     	xref	_pwm_control_setoutput
 314                     	xref	_pwm_control_init
 315                     	xref	_v_control_setoutput
 316                     	xref	_v_control_active
 317                     	xref	_v_control_init
 318                     	xref	_GPIO_WriteBit
 337                     	xref	c_lcmp
 338                     	xref	c_smul
 339                     	xref	c_ltor
 340                     	xref	c_lgadc
 341                     	end
