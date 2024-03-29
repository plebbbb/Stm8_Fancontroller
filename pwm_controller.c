#include "stm8l15x.h"
#include "pwm_controller.h"

struct pwm_controller_port2;
struct pwm_controller_port3;

void pwm_control_init(uint16_t port){
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, ENABLE);
	TIM1_TimeBaseInit(0, TIM1_CounterMode_Up, 640, 0);
	
	switch (port){
		case 2: //timer 1 channel 1, pin D2
			GPIO_Init(GPIOD, GPIO_Pin_4, GPIO_Mode_Out_PP_Low_Fast);
			TIM1_OC1Init(TIM1_OCMode_PWM2, TIM1_OutputState_Enable, TIM1_OutputNState_Disable, 0, TIM1_OCPolarity_Low, TIM1_OCNPolarity_Low, TIM1_OCIdleState_Set, TIM1_OCNIdleState_Set);
		//	pwm_controller_port2.output_value = 0;
		//	pwm_controller_port2.output_value_raw = 0;
		//	pwm_controller_port2.port = 2;
			break;
		case 3: //timer 1 channel 2, pin D4
			GPIO_Init(GPIOD, GPIO_Pin_2, GPIO_Mode_Out_PP_Low_Fast);
			TIM1_OC2Init(TIM1_OCMode_PWM2, TIM1_OutputState_Enable, TIM1_OutputNState_Disable, 0, TIM1_OCPolarity_Low, TIM1_OCNPolarity_Low, TIM1_OCIdleState_Set, TIM1_OCNIdleState_Set);
	//		pwm_controller_port3.output_value = 0;
		//	pwm_controller_port3.output_value_raw = 0;
	//		pwm_controller_port3.port = 3;
			break;
	}
	TIM1_CtrlPWMOutputs(ENABLE);
	TIM1_Cmd(ENABLE);
}

void pwm_control_setoutput(uint16_t port, uint16_t duty_cycle){
	if (duty_cycle > 12582) return;
	
	switch (port){
		case 2:
	//		pwm_controller_port2.output_value = duty_cycle;
	//		pwm_controller_port2.output_value_raw = duty_cycle * 125.82; // 12582/100
	//		TIM1_SetCompare1(pwm_controller_port2.output_value_raw);
				TIM1_SetCompare1(duty_cycle * 6.4);
			break;
		case 3:
	//		pwm_controller_port2.output_value = duty_cycle;
	//		pwm_controller_port3.output_value_raw = duty_cycle * 125.82; // 12582/100
	//		TIM1_SetCompare2(pwm_controller_port3.output_value_raw);
				TIM1_SetCompare2(duty_cycle * 6.4);

			break;
	}
}