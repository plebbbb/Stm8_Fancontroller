#ifndef voltage_controller
#define voltage_controller

struct v_output_controller{
	uint16_t output_value;
	uint16_t output_value_raw;
	bool is_enabled;
};

extern struct v_output_controller v_controller_port1;

void v_control_init(void);

void v_control_active(bool state);

void v_control_setoutput(uint8_t level);

void v_control_setoutput_raw(uint16_t level);

#endif