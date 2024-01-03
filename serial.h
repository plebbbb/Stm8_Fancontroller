#ifndef serial__
#define serial__

extern uint8_t rx_buffer;
extern uint8_t tx_buffer[50];

void serial_init(void);

bool serial_tx_buf_write(uint8_t* word, uint8_t length);

void serial_write_string(void);

bool serial_write_int(uint32_t b);

bool serial_write_float(double b);

#endif