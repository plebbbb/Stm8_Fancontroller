#ifndef tachometer
#define tachometer

volatile struct tach{
	uint8_t ms_5;
	uint8_t ms_period_last;
	bool warning;
	bool enabled;
};

volatile void tach_init(volatile void);

void enable_tach(uint8_t tach);

uint32_t get_tach_rpm(uint8_t tach);

uint16_t get_ms(uint8_t tach);

uint16_t get_ms_period(uint8_t tach);


#endif