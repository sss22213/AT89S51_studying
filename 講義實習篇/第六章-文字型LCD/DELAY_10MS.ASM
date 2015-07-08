;===================================
; 延遲10ms
; 功能 : 延遲 R5 *10ms時間
; 輸入 : R5
; 輸出 : 無 ?
; 使用 : R3,R4,R5
;====================================
;DELAY_10MS 
;(1) FUNCTION: Delay R5*10ms time
;(2) INPUT   : R5
;(3) OUTPUT  : None?
;(4) USE REG.: R3, R4 ,R5
;--------------------------------------------------------
PUBLIC	DELAY_10MS
ROM	     SEGMENT  CODE
RSEG	     ROM
DELAY_10MS:
L_DELAY:
             MOV		R4,#100
S_DELAY:
	     MOV		R3,#48
	     DJNZ		R3,$
	     DJNZ		R4,S_DELAY
	     DJNZ		R5,L_DELAY
	     RET
             END	
