#include "stm8l15x.h"
#include "tachometer.h"
//#include "serial.h"

volatile static struct tach tach1;
volatile static struct tach tach2;
volatile static struct tach tach3;


void tach_init(void){
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, ENABLE);
	
	//TIM3_TimeBaseInit(TIM3_Prescaler_128, TIM3_CounterMode_Up, 624); //5ms clock 
	TIM3_TimeBaseInit(TIM3_Prescaler_128, TIM3_CounterMode_Up, 248); //2ms clock 

	TIM3_ClearFlag(TIM3_FLAG_Update);
	TIM3_ITConfig(TIM3_IT_Update, ENABLE);
	
	EXTI_SelectPort(EXTI_Port_B);
	
	enableInterrupts();
	
	TIM3_Cmd(ENABLE);
}

void enable_tach(uint8_t tach){
	switch(tach){
		case 1:
			tach1.enabled=1;
			GPIO_Init(GPIOB, GPIO_Pin_2, GPIO_Mode_In_FL_IT);
			GPIO_ExternalPullUpConfig(GPIOB, GPIO_Pin_2, ENABLE);
			EXTI_SetPinSensitivity(GPIO_Pin_2,EXTI_Trigger_Falling_Low);
		break;
		case 2:
			tach2.enabled=2;
			GPIO_Init(GPIOB, GPIO_Pin_3, GPIO_Mode_In_FL_IT);
			GPIO_ExternalPullUpConfig(GPIOB, GPIO_Pin_3, ENABLE);
			EXTI_SetPinSensitivity(GPIO_Pin_3,EXTI_Trigger_Rising);
		break;
		case 3:
			tach3.enabled=3;
			GPIO_Init(GPIOB, GPIO_Pin_5, GPIO_Mode_In_FL_IT);
			GPIO_ExternalPullUpConfig(GPIOB, GPIO_Pin_5, ENABLE);
			EXTI_SetPinSensitivity(GPIO_Pin_5,EXTI_Trigger_Falling);
		break;
	}
//	tach_arr[tach].enabled = 1;
}

uint32_t get_tach_rpm(uint8_t tach){
	///*
	switch(tach){
		case 1:
			if (tach1.warning) return 0;
			return (15000.f/(float)tach1.ms_period_last);
		case 2:
			if (tach2.warning) return 0;
			return (15000.f/(float)tach2.ms_period_last);
		case 3:
			if (tach3.warning) return 0;
			return (15000.f/(float)tach3.ms_period_last);
	}//*/
	//return 15000/tach_arr[tach].ms_period_last;
}
///*
void tach1_sens_update(void){
	if (tach1.ms_5 == 0) return;
	tach1.ms_period_last = tach1.ms_5*0.05 + tach1.ms_period_last*0.95;
	tach1.ms_5 = 0;
	tach1.warning = 0;
}

void tach2_sens_update(void){
	tach2.ms_period_last = tach2.ms_5*0.05 + tach2.ms_period_last*0.95;
	tach2.ms_5 = 0;
	tach2.warning = 0;
}

void tach3_sens_update(void){
	tach3.ms_period_last = tach3.ms_5*0.05 + tach3.ms_period_last*0.95;
	tach3.ms_5 = 0;
	tach3.warning = 0;
}//*/
/*
void tach_update(volatile uint8_t tach){
	tach_arr[tach].ms_period_last = (tach_arr[tach]).ms_5*0.05 + (tach_arr[tach].ms_period_last)*0.95;
	tach_arr[tach].ms_5 = 0;
	tach_arr[tach].warning = 0;
}
*/
 void tach_ms_inc(void){
	 ///*
	if (tach1.enabled){
		if(tach1.ms_5 >= 200) tach1.warning = 1;
		else tach1.ms_5++;
	}
	if (tach2.enabled){
		if(tach2.ms_5 >= 200) tach2.warning = 1;
		else tach2.ms_5++;
	}
	if (tach3.enabled){
		if(tach3.ms_5 >= 200) tach3.warning = 1;
		else tach3.ms_5++;
	}	
}