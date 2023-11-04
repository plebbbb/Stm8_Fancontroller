#include "stm8l15x.h"
#include "voltage_controller.h"

struct v_output_controller v_controller_port1;

//Controller starts in disabled mode
void v_control_init(void){
	v_controller_port1.output_value = 0;
	v_controller_port1.output_value_raw = 0;
	v_controller_port1.is_enabled = 0;
	
	CLK_PeripheralClockConfig(CLK_Peripheral_COMP, ENABLE);
	SYSCFG_RIDeInit();
	SYSCFG_RIIOSwitchConfig(RI_IOSwitch_15, ENABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_DAC, ENABLE);
	DAC_DeInit();
	DAC_Init(DAC_Channel_1, DAC_Trigger_None, DAC_OutputBuffer_Disable);
	DAC_SetChannel1Data(DAC_Align_12b_R, v_controller_port1.output_value_raw);
	DAC_Cmd(DAC_Channel_1, ENABLE);
	GPIO_Init(GPIOD, GPIO_Pin_7, GPIO_Mode_Out_PP_Low_Slow);
	GPIO_WriteBit(GPIOD, GPIO_Pin_7, RESET);
}

//sets switching regulator's enable pin on and off
void v_control_active(bool state){
	v_controller_port1.is_enabled = state;
	GPIO_WriteBit(GPIOD, GPIO_Pin_7, state ? SET : RESET);
}

/*
	output is normalized to 1-100 range. 
	exceeding bounds will not change output
*/
void v_control_setoutput(uint8_t level){
	if (level > 100) return;
	v_controller_port1.output_value = level;
	v_controller_port1.output_value_raw = 4095 - level * 20.48; //output interval from 4095 to 2048. 4095 leads to minimum non-stop duty cycle.
	DAC_SetChannel1Data(DAC_Align_12b_R, 	v_controller_port1.output_value_raw);
}

//raw value control, range 4095-2048
void v_control_setoutput_raw(uint16_t level){
	DAC_SetChannel1Data(DAC_Align_12b_R, level);
}