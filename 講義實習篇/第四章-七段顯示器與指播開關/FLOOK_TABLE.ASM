PUBLIC         FLOOK_TABLE    ;模組名稱
ROM            SEGMENT CODE  ;共享ROM空間
RSEG		     ROM            ;選取可重置的 ROM空間

FLOOK_TABLE:                     ;模組名稱
			      MOV      A,R1      ;將R1位置的值放在A
			      MOVC     A,@A+DPTR  ;將表格內第A(R1)個的數字放於A
			      MOV      R2,A      ;將A的值放在R2
                  RET                 ;從模組返回
			          END                     ;程式結束


