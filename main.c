/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "stm8l15x.h"
#include "voltage_controller.h"
#include "pwm_controller.h"
#include "stdio.h"
#include <math.h>
void delay_ms(unsigned long int ms) {
    unsigned long int i;
    for (i = 0; i < ((1600000UL / 18 / 1000UL) * ms); i++) {
        nop();
    }
}
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
	USART_Init(USART1,9600, USART_WordLength_8b, USART_StopBits_1, USART_Parity_No,USART_Mode_Tx);
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

void adc_init(void){
	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
	GPIO_Init(GPIOB, GPIO_Pin_1, GPIO_Mode_In_FL_No_IT); 
	ADC_DeInit(ADC1);
	ADC_Init(ADC1, ADC_ConversionMode_Single, ADC_Resolution_12Bit, ADC_Prescaler_2);
	ADC_SamplingTimeConfig(ADC1, ADC_Group_SlowChannels, ADC_SamplingTime_384Cycles);
	ADC_Cmd(ADC1, ENABLE);
	ADC_ChannelCmd(ADC1, ADC_Channel_17, ENABLE);

}


void main(){
	//CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
	uint16_t c = 30;
	int e = -1;
	int voltage_mv;
	double resistance;
	double temp_SFH;
	GPIO_Init(GPIOA, GPIO_Pin_5, GPIO_Mode_Out_PP_Low_Slow);
	GPIO_Init(GPIOC, GPIO_Pin_3, GPIO_Mode_Out_PP_Low_Fast);
	GPIO_ExternalPullUpConfig(GPIOC, GPIO_Pin_3, ENABLE);
	
	delay_ms(100);
	
	serial_init();
		adc_init();

	
	
	
	//pwm_control_init(2);
	//v_control_init();
	//v_control_active(1);
	
	
	while (1){
		GPIO_WriteBit(GPIOA, GPIO_Pin_5, (e>0 ? SET : RESET));
		delay_ms(100);
		
		ADC_SoftwareStartConv(ADC1);
		while(ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == RESET);
		voltage_mv = (double)(ADC_GetConversionValue(ADC1)/4095.f) * 3200;
		resistance = 10000/(3200/(double)voltage_mv - 1);
		
		temp_SFH = 1 / (0.003141 - 0.0001141*log(resistance) + 0.0000016181*pow(log(resistance),3)) - 273.15;
		serial_write_float(temp_SFH);
		e = -e;
	}
}