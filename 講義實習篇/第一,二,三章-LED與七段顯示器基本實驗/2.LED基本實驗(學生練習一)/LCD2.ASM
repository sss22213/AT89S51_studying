;====================================
EXTRN    CODE(DELAY_10MS)
EXTRN    CODE(FLOOK_TABLE)
LED      EQU    P2
;=================================
           ORG    00H
		    JMP    START
START:    MOV    R1,#00
		    MOV    R7,#16
	       MOV    DPTR,#LED_TABLE
LOOP_1:  CALL   FLOOK_TABLE
		    MOV    LED,R2
		    MOV    R5,#100			    	;DELAY 1sec
		    CALL   DELAY_10MS
		    INC    R1
		    DJNZ   R7 ,LOOP_1
		    JMP    START 
;共陽LED 顯示碼TABLE表
LED_TABLE:
             DB		0FEH,0FDH,0FBH,0F7H,0EFH,0DFH,0BFH,07FH
             DB		0BFH,0DFH,0EFH,0F7H,0FBH,0FDH,0FEH,0FFH
 END
