#include "stm8l15x.h"
#include "stdio.h"
#include <math.h>
#include "serial.h"
#include <string.h>

volatile uint8_t rx_buffer = 0b00000011;
volatile uint8_t tx_buffer[50];
volatile uint8_t tx_buffer_index = 0;
volatile uint8_t tx_buffer_index_max = 0;

void serial_init(void){
	GPIO_Init(GPIOC, GPIO_Pin_3, GPIO_Mode_Out_PP_Low_Fast);
	GPIO_Init(GPIOC, GPIO_Pin_2, GPIO_Mode_In_PU_No_IT);
	GPIO_ExternalPullUpConfig(GPIOC, GPIO_Pin_3, ENABLE);
	GPIO_ExternalPullUpConfig(GPIOC, GPIO_Pin_2, ENABLE);	
	
	
	CLK_PeripheralClockConfig(CLK_Peripheral_USART1,ENABLE);
	
	USART_Init(USART1, 4800, USART_WordLength_8b, USART_StopBits_1, USART_Parity_No, (USART_Mode_TypeDef)(USART_Mode_Tx | USART_Mode_Rx));
	
	USART_ITConfig(USART1, USART_IT_RXNE, ENABLE);
	USART_ITConfig(USART1, USART_IT_TC, ENABLE);
	
	USART_Cmd(USART1, ENABLE);
}

void parse_byte_rx(void){
	rx_buffer = USART_ReceiveData8(USART1);
}

void parse_byte_tx(void){
	if(tx_buffer_index > tx_buffer_index_max) return;
	USART_SendData8(USART1, tx_buffer[tx_buffer_index]);
	tx_buffer_index++;
}

bool serial_tx_buf_write(void* word, uint8_t length){
	//last TX must have completed for configuration to start
	if (tx_buffer_index <= tx_buffer_index_max) return 0;
	
	//copy tx memory buffer
	memcpy(tx_buffer, word, length);
	tx_buffer_index_max = (length <= 50) ? length-1 : 49;
	tx_buffer_index = 0;
	
	//start transmission
	parse_byte_tx();
	return 1;
}

void serial_write_string(void){
	tx_buffer_index = 0;
	
	//figure out length of string
	for (tx_buffer_index_max = 0; tx_buffer_index_max < 49; tx_buffer_index_max++){
		if (tx_buffer[tx_buffer_index_max] == '\0') {
			break;
		}
	}
	
	//start transmission
	parse_byte_tx();
}

//BROKEN
bool serial_write_int(volatile uint32_t b){
	//last TX must have completed for configuration to start
	if (tx_buffer_index <= tx_buffer_index_max) return 0;
	sprintf(tx_buffer, "%i\n", b);
	serial_write_string();
	return 1;
}

bool serial_write_float(volatile double b){
	//last TX must have completed for configuration to start
	if (tx_buffer_index <= tx_buffer_index_max) return 0;
	sprintf(tx_buffer, "%f\n", b);
	serial_write_string();
	return 1;
}