/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "stm8l15x.h"
#include "voltage_controller.h"
#include "pwm_controller.h"
#include "adc_controller.h"
#include "clock.h"
#include "serial.h"
#include "tachometer.h"
#include <string.h>
//#include <math.h>

/* measured temperature params
17.7C, 13121ohm
25C, 10Kohm
35.5C, 6650ohm

Beta: 3226.7K

A: 3.141e-3
B: -1.141e-4
C: 16.181e-7
*/

void setup(void){
	clock_init();
	//tach_init();
	serial_init();
	adc_subsystem_init();
}

void hw_config(void){
	//enable_tach(2);
	//GPIO_Init(GPIOA, GPIO_Pin_5, GPIO_Mode_Out_PP_Low_Slow);
	v_control_init();
	pwm_control_init(2);
	//pwm_control_init(3);	
}

void hw_setIC(void){
	v_control_active(1);
	v_control_setoutput(40);
	pwm_control_setoutput(2,40);
	enableInterrupts();
	delay(1000);
}

uint8_t max_temp;
uint8_t min_temp;
uint8_t min_fan_DC;
uint8_t min_pump_DC;
int e = 1;

float Temp_C;

float DC_fan_gain;
float DC_pump_gain;

float DC_fan_offset;
float DC_pump_offset;

uint8_t stored_rxbuffer = 0b00000011;
uint8_t temp_rxbuffer_verify = 0b00000011;

uint8_t tgt_duty_cycle_fan;
uint8_t tgt_duty_cycle_pump;

void calc_params(void){
	//55-70 max temp range, bits 3,4
	max_temp = 55+5*((stored_rxbuffer & 0b00001100) >> 2);
		
	//20-35 min temp range, bits 5,6
	min_temp = 20+5*((stored_rxbuffer & 0b00110000) >> 4);
	
	//0-25 min fan output, bit 7
	min_fan_DC = 25*((stored_rxbuffer & 0b01000000) >> 6);
		
	//25-40 min pump output, bit 8
	min_pump_DC = 25 + 15*((stored_rxbuffer & 0b10000000) >> 7);
	
	DC_fan_gain = (min_fan_DC - 100) / (min_temp - max_temp);
	DC_pump_gain = (min_pump_DC - 100) / (min_temp - max_temp);

	DC_fan_offset = 100 - DC_fan_gain * max_temp;
	DC_pump_offset = 100 - DC_pump_gain * max_temp;
}


void main(){
	setup();
	hw_config();
	hw_setIC();
	calc_params();
	
	while (1){
//		/*
		delay(500);
		//GPIO_WriteBit(GPIOA, GPIO_Pin_5, (e>0 ? SET : RESET));
		e = -e;
		if (stored_rxbuffer != rx_buffer){
			//temp buffer = retransmitted rxbuffer, output verified
			if (temp_rxbuffer_verify == rx_buffer) {
				stored_rxbuffer = rx_buffer;
				temp_rxbuffer_verify = stored_rxbuffer;
				calc_params();
				while(!serial_tx_buf_write((void*)&stored_rxbuffer,1));
				continue; //wait 1s to see if retransmit verification occurs on reciever side.
			}
			
			//temp buffer != transmitted buffer, thus different output to be resent and verified.
			else {
				temp_rxbuffer_verify = rx_buffer;
				while (!serial_tx_buf_write((void*)&temp_rxbuffer_verify, 1));
				continue;
			}
		}
		
		Temp_C = adc_sensor_read_C(adc_FAN1)*0.2 + 0.8*Temp_C;
		tgt_duty_cycle_fan = (DC_fan_gain*Temp_C + DC_fan_offset);
		tgt_duty_cycle_pump = (DC_pump_gain*Temp_C + DC_pump_offset);
		
		if (tgt_duty_cycle_fan > 100) tgt_duty_cycle_fan = 100;
		if (tgt_duty_cycle_fan < DC_fan_offset) tgt_duty_cycle_fan = DC_fan_offset;
		if (tgt_duty_cycle_pump > 100) tgt_duty_cycle_pump = 100;
		if (tgt_duty_cycle_pump < DC_pump_offset) tgt_duty_cycle_pump = DC_pump_offset;
		//bit 1: enable/disable fan curves
		switch (stored_rxbuffer & 0b00000001){
			case 0:
				v_control_active(0);
				pwm_control_setoutput(2,0);
				break;
			case 1:
				v_control_active(1);
				v_control_setoutput(tgt_duty_cycle_pump);
				pwm_control_setoutput(2,tgt_duty_cycle_fan);
		}
		
		//bit 2: enable/disable transmissions
		switch ((stored_rxbuffer & 0b00000010) >> 1){
			case 1:
				serial_tx_buf_write((void*)&Temp_C, 4);
			case 0:
				break;
		}
		//*/
	}
	
}