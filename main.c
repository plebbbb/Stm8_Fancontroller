/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "stm8l15x.h"
#include "stdio.h"
#include <math.h>
#include "voltage_controller.h"
#include "pwm_controller.h"
#include "adc_controller.h"
#include "clock.h"

/* measured temperature params
17.7C, 13121ohm
25C, 10Kohm
35.5C, 6650ohm

Beta: 3226.7K

A: 3.141e-3
B: -1.141e-4
C: 16.181e-7
*/

void serial_init(void){
	// CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
	CLK_PeripheralClockConfig(CLK_Peripheral_USART1,ENABLE);
	USART_DeInit(USART1);
	USART_Init(USART1,9600, USART_WordLength_8b, USART_StopBits_1, USART_Parity_No, USART_Mode_Tx);
	USART_Cmd(USART1, ENABLE);
}


void serial_write(char* word){
	char* ptr = word;
	while (*ptr != '\0'){
		USART_SendData8(USART1, *ptr);
		ptr++;
		while(!(USART_GetFlagStatus(USART1, USART_FLAG_TXE)));
	}
	USART_SendData8(USART1, '\n');
	while (!(USART_GetFlagStatus(USART1, USART_FLAG_TXE)));
}
char wordarray[50];

void serial_write_int(int b){
	sprintf(wordarray, "%i", b);
	serial_write(wordarray);
}

void serial_write_float(double b){
	sprintf(wordarray, "%f", b);
	serial_write(wordarray);
}

void main(){
	uint16_t c = 30;
	int e = -1;
	int voltage_mv;
	double temp_SFH;
	double fan_spd = 0;
	GPIO_Init(GPIOA, GPIO_Pin_5, GPIO_Mode_Out_PP_Low_Slow);
	GPIO_Init(GPIOC, GPIO_Pin_3, GPIO_Mode_Out_PP_Low_Fast);
	GPIO_ExternalPullUpConfig(GPIOC, GPIO_Pin_3, ENABLE);

	clock_init();
//	
			//v
			GPIO_WriteBit(GPIOA, GPIO_Pin_5, SET);

	serial_init();
	adc_subsystem_init();
	adc_sensor_config(0, 3226.7f, 0.003141f, -0.0001141f, (double)0.0000016181);
	
	delay(100);
	
	pwm_control_init(2);
	v_control_init();
	v_control_active(1);
	serial_write_float(adc_FAN1.A);
	serial_write_float(adc_FAN1.B);
	serial_write_float(adc_FAN1.C);
	
	while (1){
		GPIO_WriteBit(GPIOA, GPIO_Pin_5, (e>0 ? SET : RESET));
		delay(50);
		temp_SFH = adc_sensor_read_C(adc_FAN1);
		//serial_write_float(temp_SFH);
		fan_spd = temp_SFH-28;
		if (fan_spd < 0) v_control_active(0);
		else {
			v_control_active(1);
			v_control_setoutput((double)(40*fan_spd, 0));
			//pwm_control_setoutput(2, 40*fan_spd);
		}
		serial_write_float(temp_SFH);
		e = -e;
	}
}