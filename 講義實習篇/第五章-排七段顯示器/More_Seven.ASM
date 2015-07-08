EXTRN    CODE(FLOOK_TABLE)
ORG		00H
JMP		START
ORG		0BH
JMP		TIMER_ISR
//主程式

START:	MOV	DPTR,#TABLE
		MOV	R1,#00
		MOV	TMOD,#00000001B
		MOV	TH0,high(65536-100)
		MOV	TL0,low(65536-100)		
		MOV	IE,#10000010B
		SETB	TR0
			//將R3的值循環輸出至排七段顯示器
LOOP1:	MOV	P2,R3					
		JMP	LOOP1	

//中斷服務常式(ISR)
TIMER_ISR:		CLR	TR0	//停止計時
				INC	R1		
				CJNE	R1,#4,SEVEN_CODE	//若查表未查到最後一個資料，則跳到SEVEN_CODE副程式
				MOV	R1,#-1				////若查表已查到最後一個，則將查表計數器設為-1
				JMP	Initial_Timer1
// 查表並將值放入R3，以供主程式顯示使用

SEVEN_CODE:			CALL	FLOOK_TABLE	
					MOV	A,R2
					MOV	R3,A	
				

Initial_Timer1:		MOV	TH0,high(65536-100)
					MOV	TL0,low(65536-100)
					SETB	TR0					
  					RETI	

TABLE:		DB	081H,092H,0A3H,0B4H
				

	
END





