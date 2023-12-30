   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.9 - 19 Apr 2023
   3                     ; Generator (Limited) V4.5.6 - 18 Jul 2023
  43                     ; 97 void IRTIM_DeInit(void)
  43                     ; 98 {
  45                     .text:	section	.text,new
  46  0000               _IRTIM_DeInit:
  50                     ; 99   IRTIM->CR = IRTIM_CR_RESET_VALUE;
  52  0000 725f52ff      	clr	21247
  53                     ; 100 }
  56  0004 81            	ret
 111                     ; 108 void IRTIM_Cmd(FunctionalState NewState)
 111                     ; 109 {
 112                     .text:	section	.text,new
 113  0000               _IRTIM_Cmd:
 117                     ; 111   assert_param(IS_FUNCTIONAL_STATE(NewState));
 119                     ; 114   if (NewState ==   DISABLE)
 121  0000 4d            	tnz	a
 122  0001 2606          	jrne	L74
 123                     ; 116     IRTIM->CR &= (uint8_t)(~IRTIM_CR_EN) ;
 125  0003 721152ff      	bres	21247,#0
 127  0007 2004          	jra	L15
 128  0009               L74:
 129                     ; 120     IRTIM->CR |= IRTIM_CR_EN ;
 131  0009 721052ff      	bset	21247,#0
 132  000d               L15:
 133                     ; 122 }
 136  000d 81            	ret
 172                     ; 130 void IRTIM_HighSinkODCmd(FunctionalState NewState)
 172                     ; 131 {
 173                     .text:	section	.text,new
 174  0000               _IRTIM_HighSinkODCmd:
 178                     ; 133   assert_param(IS_FUNCTIONAL_STATE(NewState));
 180                     ; 136   if (NewState == DISABLE)
 182  0000 4d            	tnz	a
 183  0001 2606          	jrne	L17
 184                     ; 138     IRTIM->CR &= (uint8_t)(~IRTIM_CR_HSEN) ;
 186  0003 721352ff      	bres	21247,#1
 188  0007 2004          	jra	L37
 189  0009               L17:
 190                     ; 142     IRTIM->CR |= IRTIM_CR_HSEN ;
 192  0009 721252ff      	bset	21247,#1
 193  000d               L37:
 194                     ; 144 }
 197  000d 81            	ret
 221                     ; 168 FunctionalState IRTIM_GetStatus(void)
 221                     ; 169 {
 222                     .text:	section	.text,new
 223  0000               _IRTIM_GetStatus:
 227                     ; 170   return ((FunctionalState) (IRTIM->CR & IRTIM_CR_EN));
 229  0000 c652ff        	ld	a,21247
 230  0003 a401          	and	a,#1
 233  0005 81            	ret
 258                     ; 178 FunctionalState IRTIM_GetHighSinkODStatus(void)
 258                     ; 179 {
 259                     .text:	section	.text,new
 260  0000               _IRTIM_GetHighSinkODStatus:
 264                     ; 180   return ((FunctionalState)(IRTIM->CR & IRTIM_CR_HSEN));
 266  0000 c652ff        	ld	a,21247
 267  0003 a402          	and	a,#2
 270  0005 81            	ret
 283                     	xdef	_IRTIM_GetHighSinkODStatus
 284                     	xdef	_IRTIM_GetStatus
 285                     	xdef	_IRTIM_HighSinkODCmd
 286                     	xdef	_IRTIM_Cmd
 287                     	xdef	_IRTIM_DeInit
 306                     	end
