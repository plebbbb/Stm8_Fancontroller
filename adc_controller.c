#include "stm8l15x.h"
#include "adc_controller.h"
#include <math.h>

struct adc_sensor adc_FAN1;

struct adc_sensor adc_FAN2;

struct adc_sensor adc_FAN3;

uint16_t adc_sense_output[3] = {0,0,0};

void adc_sensor_config(uint8_t sensor, double b1, double A1, double B1, double C1){
	struct adc_sensor* tmp;
	switch (sensor) {
		case 1:
		default:
			tmp = &adc_FAN1;
			break;
		case 2:
			tmp = &adc_FAN2;
			break;
		case 3:
			tmp = &adc_FAN3;
			break;
	}
	tmp->beta = b1;
	tmp->A = A1;
	tmp->B = B1;
	tmp->C = C1;
}
void adc_subsystem_init(void){
	adc_FAN1.read_addr = adc_sense_output + 2;
	adc_FAN2.read_addr = adc_sense_output;
	adc_FAN3.read_addr = adc_sense_output + 1;
	
	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_DMA1, ENABLE);
	
	ADC_Init(ADC1, ADC_ConversionMode_Continuous, ADC_Resolution_12Bit, ADC_Prescaler_2); //was prescaler 2
	ADC_SamplingTimeConfig(ADC1, ADC_Group_SlowChannels, ADC_SamplingTime_384Cycles);
	ADC_SamplingTimeConfig(ADC1, ADC_Group_FastChannels, ADC_SamplingTime_384Cycles); //was 384
	
	ADC_Cmd(ADC1, ENABLE);
	
//	/*
	ADC_ChannelCmd(ADC1, ADC_Channel_2, ENABLE);
	ADC_ChannelCmd(ADC1, ADC_Channel_9, ENABLE);
	ADC_ChannelCmd(ADC1, ADC_Channel_17, ENABLE);
	//*/
	/*ADC_ChannelCmd(ADC1, ADC_Channel_2, ENABLE);
	ADC_ChannelCmd(ADC1, ADC_Channel_15, ENABLE);
	ADC_ChannelCmd(ADC1, ADC_Channel_16, ENABLE);	
	*/
	SYSCFG_REMAPDMAChannelConfig(REMAP_DMA1Channel_ADC1ToChannel0);
	
	DMA_Init(DMA1_Channel0, (uint16_t)(&adc_sense_output), 0x5344, 3,  DMA_DIR_PeripheralToMemory, DMA_Mode_Circular, DMA_MemoryIncMode_Inc, DMA_Priority_High, DMA_MemoryDataSize_HalfWord);
	
	DMA_Cmd(DMA1_Channel0, ENABLE);
	
	//DMA_ITConfig(DMA1_Channel0, DMA_ITx_TC, ENABLE);
	
	DMA_GlobalCmd(ENABLE);
	
	ADC_DMACmd(ADC1, ENABLE);
	
	ADC_SoftwareStartConv(ADC1);
}

float adc_sensor_read_C(struct adc_sensor sensor){
	uint16_t voltage_mv = (float)(*(sensor.read_addr)/4095.f) * 3200;
	float resistance = 10000/(3200/(float)voltage_mv - 1);
	float temp_SFH = 1 / (0.003141 - 0.0001141*log(resistance) + 0.0000016181*pow(log(resistance),3)) - 273.15;
	//double temp_SFH = 1 / ((double)sensor.A - (double)sensor.B*log(resistance) + (double)sensor.C*pow(log(resistance),3)) - 273.15;
	return temp_SFH;
}

float adc_sensor_read_mv(struct adc_sensor sensor){
	return 	(float)(*(sensor.read_addr)/4095.f) * 3200;
}