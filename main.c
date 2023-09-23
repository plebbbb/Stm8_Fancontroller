/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "stm8l15x.h"
void main(){
	GPIO_Init(GPIOA, GPIO_Pin_5, GPIO_Mode_Out_PP_Low_Slow);
	GPIO_Init(GPIOD, GPIO_Pin_2, GPIO_Mode_Out_PP_Low_Slow);
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, ENABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, ENABLE);
	while (1){
		GPIO_WriteBit(GPIOA, GPIO_Pin_5, SET) ;
	}
}