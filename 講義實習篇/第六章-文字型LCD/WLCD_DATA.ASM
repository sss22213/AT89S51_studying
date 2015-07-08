;-----------------------------------------------
;WLCD_DATA 
;(1) FUNCTION: Write LCD DATA to DR
;    * E=1, R/W=0, RS=1
;    * Data -> LCD_BUS	
;    * E=0, R/W=1, RS=1 	 
;(2) INPUT	: R2    : 41H
;(3) OUTPUT	: None
;(4) USE REG.	: R2,R3,R4
;------------------------------------------------  
EXTRN		CODE(DELAY_01MS)	
PUBLIC		WLCD_DATA
ROM			SEGMENT CODE
LCD_BUS		EQU		P2
LCD_E		EQU		P2.2
LCD_RW		EQU		P2.1
LCD_RS		EQU		P2.0

RSEG		ROM
WLCD_DATA:
; High 4 bits
			CLR		LCD_RW
			SETB	LCD_RS
			SETB	LCD_E
			MOV    	A,R2
			ANL		A,#0F0H
			ADD		A,#05H
			MOV		LCD_BUS,A
			CLR		LCD_E
			SETB	LCD_RS
			SETB	LCD_RW
			MOV		R4,#20
			CALL	DELAY_01MS
; Low 4 bits
			CLR		LCD_RW
			SETB	LCD_RS
			SETB	LCD_E
			MOV    	A,R2
			ANL		A,#0FH
			SWAP	A
			ADD		A,#05H
			MOV		LCD_BUS,A
			CLR		LCD_E
			SETB	LCD_RS
			SETB	LCD_RW
			MOV		R4,#20
			CALL	DELAY_01MS
			RET
			END
