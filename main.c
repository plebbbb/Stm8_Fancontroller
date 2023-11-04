/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */

#include "stm8l15x.h"
#include "voltage_controller.h"
#include "pwm_controller.h"
void delay_ms(unsigned long int ms) {
    unsigned long int i;
    for (i = 0; i < ((200000UL / 18 / 1000UL) * ms); i++) {
        nop();
    }
}



void main(){
	uint16_t c = 30;
	bool e = 0;
	
	pwm_control_init(2);
	v_control_init();
	v_control_active(1);
	
	
	while (1){
		GPIO_WriteBit(GPIOA, GPIO_Pin_5, (e == 1) ? SET : RESET);
		delay_ms(50);
		if (e == 1) c++;
		else c--;
		
		if (c == 100) e = 0;
		if (c == 0) e = 1;
		v_control_setoutput(c);
		pwm_control_setoutput(2, c);
	}
}