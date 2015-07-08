;------------------------------------------------------------------------
;CLEAR_LCD 
;(1) FUNCTION: DISPLAY CLEAR / CURSOR HOME
;(2) INPUT	: None
;(3) OUTPUT	: None
;(4) USE REG.	: R2,R3,R4
;-------------------------------------------------------------------------  
EXTRN		CODE(WLCD_COMMAND)
PUBLIC		CLEAR_LCD
ROM			SEGMENT CODE

RSEG		ROM

CLEAR_LCD:
			MOV		R2,#00000001B
			CALL	WLCD_COMMAND
			MOV		R2,#00000010B
			CALL	WLCD_COMMAND
			RET
END
