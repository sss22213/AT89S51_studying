PUBLIC		   DELAY_10MS;模組名稱
ROM			SEGMENT CODE;共享ROM空間
RSEG			ROM;選取可重置的 ROM空間

DELAY_10MS: ;模組名稱
L_DELAY: ;迴圈名稱
             MOV		R4,#100;將100放入R4暫存器
 S_DELAY: ;迴圈名稱
	         MOV		R3,#48;將48放入R3暫存器
	         DJNZ		R3,$  ;將R3減1，若R3不等於0則原地跳繼續執行指行程式
	         DJNZ		R4,S_DELAY ;將R4減1，若R4不等於0則跳到S_DELAY這個標記
               DJNZ		R5,L_DELAY;將R5減1，若R5不等於0則跳到L_DELAY這個標記		
          RET;返回呼叫指令的下一行指令
			END;模組結束
