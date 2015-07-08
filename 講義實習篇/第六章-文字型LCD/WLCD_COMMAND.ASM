;-------------------------------------------------------------
;WLCD_COMMAND 
;(1) FUNCTION: Write LCD command to IR
;    * E=1, R/W=0, RS=0
;    * Command -> LCD_BUS	
;    * E=0, R/W=1, RS=1 	 
;(2) INPUT   : R2  ....  82H
;(3) OUTPUT  : None
;(4) USE REG.: R2,R3,R4
;---------------------------------------------------------------  
EXTRN		CODE(DELAY_01MS)	
PUBLIC		WLCD_COMMAND
ROM			SEGMENT CODE
LCD_BUS		EQU		P2
LCD_E		EQU		P2.2
LCD_RW		EQU		P2.1
LCD_RS		EQU		P2.0

RSEG		ROM

WLCD_COMMAND:
; High 4 bits
			CLR		LCD_RW
			CLR		LCD_RS
			SETB	LCD_E
			MOV    	A,R2
			ANL		A,#0F0H   		;A=80H
			ADD		A,#04H    		;A=04H
			MOV		LCD_BUS,A
			CLR		LCD_E
			SETB	LCD_RS
			SETB	LCD_RW
			MOV		R4,#20
			CALL	DELAY_01MS
; Low 4 bits
			CLR		LCD_RW
			CLR		LCD_RS
			SETB	LCD_E
			MOV    	A,R2           ;82H
			ANL		A,#0FH         ;A=02H 
			SWAP	A              ;A=20H 
			ADD		A,#04H         ;A=28H
			MOV		LCD_BUS,A
			CLR		LCD_E
			SETB	LCD_RS
			SETB	LCD_RW
			MOV		R4,#20
			CALL	DELAY_01MS
			RET
			END
