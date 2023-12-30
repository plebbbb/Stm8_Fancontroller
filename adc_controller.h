#ifndef adc_controller
#define adc_controller

extern uint16_t adc_sense_output[3];

struct adc_sensor{
	uint16_t* read_addr;
	float beta;
	float A;
	float B;
	float C;
};

extern struct adc_sensor adc_FAN1;

extern struct adc_sensor adc_FAN2;

extern struct adc_sensor adc_FAN3;

void adc_subsystem_init(void);

void adc_sensor_config(uint8_t sensor, float b1, float A1, float B1, float C1); 

double adc_sensor_read_C(struct adc_sensor sensor);

#endif