#include "stm8l15x.h"
#include "clock.h"
volatile uint32_t t_delay = 0;
void clock_init(void){
	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
	CLK_SYSCLKSourceSwitchCmd(ENABLE);
	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSE);
	
	//while(CLK_GetSYSCLKSource() != CLK_SYSCLKSource_HSE);
	
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
	
	TIM4_TimeBaseInit(TIM4_Prescaler_128, 124);
	
	TIM4_ClearFlag(TIM4_FLAG_Update);
	
	TIM4_ITConfig(TIM4_IT_Update, ENABLE);
		
	TIM4_Cmd(ENABLE);
}

void delay_dec(void){
	if (t_delay > 0) t_delay--;
}

void delay(volatile uint32_t ms){
	t_delay = ms;
	while(t_delay != 0);

}