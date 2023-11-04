#ifndef pwm_controller
#define pwm_controller

//could use function pointers in the struct for better modularity
struct pwm_controller{
	uint16_t output_value;
	uint16_t output_value_raw;
	uint16_t port;
	};

//extern struct pwm_controller pwm_controller_port2;
//extern struct pwm_controller pwm_controller_port3;

void pwm_control_init(uint16_t port);

void pwm_control_setoutput(uint16_t port, uint16_t duty_cycle);

#endif
