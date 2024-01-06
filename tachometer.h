#ifndef tachometer
#define tachometer

volatile struct tach{
	volatile uint8_t ms_5;
	volatile float ms_period_last;
	//volatile float rpm;
	bool warning;
	bool enabled;
};

void tach_init(volatile void);

void enable_tach(uint8_t tach);

uint32_t get_tach_rpm(uint8_t tach);


#endif