PUBLIC	DELAY_10MS										;模組名稱
ROM	SEGMENT CODE										;共享ROM空間
RSEG	ROM												;選取可重置的 ROM空間

DELAY_10MS: ;模組名稱

L_DELAY: ;迴圈名稱
             MOV		R4,#100;將100放入R4位址
S_DELAY: ;迴圈名稱
	         MOV		R3,#48;將48放入R3位址
	         DJNZ		R3,$
	         DJNZ		R4,S_DELAY
	         DJNZ		R5,L_DELAY		
             RET;從模組返回
 END;程式結束
