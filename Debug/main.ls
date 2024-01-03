   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  56                     ; 29 void main(){
  58                     .text:	section	.text,new
  59  0000               _main:
  63                     ; 71 	clock_init();
  65  0000 cd0000        	call	_clock_init
  67                     ; 72 	tach_init();
  69  0003 cd0000        	call	_tach_init
  71                     ; 73 	serial_init();
  73  0006 cd0000        	call	_serial_init
  75                     ; 74 	adc_subsystem_init();
  77  0009 cd0000        	call	_adc_subsystem_init
  79                     ; 75 	enable_tach(2);
  81  000c a602          	ld	a,#2
  82  000e cd0000        	call	_enable_tach
  84                     ; 76 	pwm_control_init(2);
  86  0011 ae0002        	ldw	x,#2
  87  0014 cd0000        	call	_pwm_control_init
  89                     ; 78 	enableInterrupts();
  92  0017 9a            rim
  94  0018               L12:
  95                     ; 80 		pwm_control_setoutput(2, rx_buffer);
  97  0018 b600          	ld	a,_rx_buffer
  98  001a 5f            	clrw	x
  99  001b 97            	ld	xl,a
 100  001c 89            	pushw	x
 101  001d ae0002        	ldw	x,#2
 102  0020 cd0000        	call	_pwm_control_setoutput
 104  0023 85            	popw	x
 105                     ; 84 		serial_write_float(adc_sensor_read_mv(adc_FAN3));
 107  0024 ae0000        	ldw	x,#_adc_FAN3
 108  0027 bf00          	ldw	c_x,x
 109  0029 ae0012        	ldw	x,#18
 110  002c               L6:
 111  002c 5a            	decw	x
 112  002d 92d600        	ld	a,([c_x],x)
 113  0030 88            	push	a
 114  0031 5d            	tnzw	x
 115  0032 26f8          	jrne	L6
 116  0034 cd0000        	call	_adc_sensor_read_mv
 118  0037 5b12          	addw	sp,#18
 119  0039 be02          	ldw	x,c_lreg+2
 120  003b 89            	pushw	x
 121  003c be00          	ldw	x,c_lreg
 122  003e 89            	pushw	x
 123  003f cd0000        	call	_serial_write_float
 125  0042 5b04          	addw	sp,#4
 126                     ; 85 		delay(1);
 128  0044 ae0001        	ldw	x,#1
 129  0047 89            	pushw	x
 130  0048 ae0000        	ldw	x,#0
 131  004b 89            	pushw	x
 132  004c cd0000        	call	_delay
 134  004f 5b04          	addw	sp,#4
 136  0051 20c5          	jra	L12
 149                     	xdef	_main
 150                     	xref	_enable_tach
 151                     	xref	_tach_init
 152                     	xref	_serial_write_float
 153                     	xref	_serial_init
 154                     	xref.b	_rx_buffer
 155                     	xref	_delay
 156                     	xref	_clock_init
 157                     	xref	_adc_sensor_read_mv
 158                     	xref	_adc_subsystem_init
 159                     	xref.b	_adc_FAN3
 160                     	xref	_pwm_control_setoutput
 161                     	xref	_pwm_control_init
 162                     	xref.b	c_lreg
 163                     	xref.b	c_x
 182                     	end
