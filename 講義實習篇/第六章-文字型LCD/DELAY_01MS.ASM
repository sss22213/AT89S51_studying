;-------------------------------------------------------
; DELAY_01MS 
;(1) FUNCTION: Delay R4*0.1ms time
;(2) INPUT   : R4
;(3) OUTPUT  : None?
;(4) USE REG.: R3,R4
;--------------------------------------------------------  
PUBLIC	        DELAY_01MS
ROM	        SEGMENT CODE

RSEG		ROM
DELAY_01MS:
	        MOV		R3,#48
		NOP
		DJNZ		R3,$
		DJNZ		R4,DELAY_01MS
		RET
		END
