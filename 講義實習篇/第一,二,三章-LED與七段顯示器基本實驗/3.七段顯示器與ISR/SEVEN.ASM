ORG	00H
JMP	START
ORG	0BH
JMP	TIMER_1S

START:	MOV	DPTR,#TABLE
       	MOV	R0,#20
        MOV	R1,#0
       	MOV	TMOD,#00000001B
        MOV TH0,high(65536-50000)   //設定高位元
        MOV TL0,low(65536-50000)   //設定低位元(PS 設定計時50ms會溢位，尚未開始計時)
        MOV IE,#10000010B      //中斷致能
        SETB	TR0          //開始計時
LOOP:MOV	A,R1
     MOVC	A,@A+DPTR
     MOV	P2,A
     CJNE	R1,#10,LOOP
     MOV	R1,#0
     JMP	LOOP               

TIMER_1S:	DJNZ	R0,TIMER1  //讓計時器未達到1S前一直跑                             
         	CLR	TR0      
            CALL	TIMER1   
     		INC	R1
			MOV	R0,#20
			SETB	TR0                  
			RETI


TIMER1:	MOV	TH0,high(65536-50000)   //設定高位元
        MOV	TL0,low(65536-50000)   //設定低位元(PS 設定計時50ms會溢位，尚未開始計時)
        RETI

TABLE:     
DB   0C0H,0F9H,0A4H,0B0H,099H,092H,082H,0F8H,080H,098H 
END


