ORG	00H
JMP	SCAN_KEYBOARD
EXTRN  CODE(DELAY,KEY,SEVEN)

KEY_PORT	EQU	P2

SCAN_KEYBOARD:	MOV	KEY_PORT,#0FFH   ;輸入致能
				MOV	P0,#0FFH		
				MOV	KEY_PORT,#11110000B
            	MOV	A,KEY_PORT
            	XRL	A,#11110000B
            	JNZ	SCAN_KEYBOARD  		
				;按鍵是否鬆開，如果沒鬆開就反覆跑
SCAN_4:		MOV	R2,#7FH
		    MOV     R1,#04H
		   ;掃描參數	
SCAN_3:		MOV	A,R2
		    RL		A
			;輸出掃描值，然後讀入返回值
		   MOV	KEY_PORT,#0FFH  ;輸入致能
		   MOV		KEY_PORT,A
      	   MOV		R2,A
		   MOV		A,KEY_PORT
		   MOV	R6,A
      		;如果沒掃到就再掃瞄
		  XRL	A,R2
          JZ	SCAN_UN
;解彈跳
		  MOV		R4,#200
          CALL		DELAY
			;查表
		  CALL	KEY
		  CALL	SEVEN
			;顯示在七段顯示器上
		  MOV	P0,A
		  JMP	SCAN_3	
			


SCAN_UN:	   DJNZ	R1,SCAN_3
			   JMP	SCAN_4
			   RET	

				



END
