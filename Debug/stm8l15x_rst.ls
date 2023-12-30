   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
 124                     ; 99 FlagStatus RST_GetFlagStatus(RST_FLAG_TypeDef RST_Flag)
 124                     ; 100 {
 126                     .text:	section	.text,new
 127  0000               _RST_GetFlagStatus:
 131                     ; 102   assert_param(IS_RST_FLAG(RST_Flag));
 133                     ; 105   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
 135  0000 c450b1        	and	a,20657
 136  0003 2603          	jrne	L6
 137  0005 4f            	clr	a
 138  0006 2002          	jra	L01
 139  0008               L6:
 140  0008 a601          	ld	a,#1
 141  000a               L01:
 144  000a 81            	ret
 179                     ; 120 void RST_ClearFlag(RST_FLAG_TypeDef RST_Flag)
 179                     ; 121 {
 180                     .text:	section	.text,new
 181  0000               _RST_ClearFlag:
 185                     ; 123   assert_param(IS_RST_FLAG(RST_Flag));
 187                     ; 125   RST->SR = (uint8_t)RST_Flag;
 189  0000 c750b1        	ld	20657,a
 190                     ; 126 }
 193  0003 81            	ret
 216                     ; 149 void RST_GPOutputEnable(void)
 216                     ; 150 {
 217                     .text:	section	.text,new
 218  0000               _RST_GPOutputEnable:
 222                     ; 152   RST->CR = RST_CR_MASK;
 224  0000 35d050b0      	mov	20656,#208
 225                     ; 153 }
 228  0004 81            	ret
 241                     	xdef	_RST_GPOutputEnable
 242                     	xdef	_RST_ClearFlag
 243                     	xdef	_RST_GetFlagStatus
 262                     	end
