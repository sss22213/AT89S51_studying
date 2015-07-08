PUBLIC	DELAY_10_MS								;模組名稱
ROM	SEGMENT CODE										;共享ROM空間
RSEG	ROM	

DELAY_1S:	MOV 	R4,#25 
D1:			MOV 	R3,#10   
D2:			MOV 	R5,#200   
	  		DJNZ	R5,$      
            DJNZ 	R3,D2     
			DJNZ 	R4,D1    
			RET

END
					