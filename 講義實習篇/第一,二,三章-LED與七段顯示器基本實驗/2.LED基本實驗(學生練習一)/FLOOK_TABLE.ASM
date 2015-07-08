;----------------------------------------------- --------------------------------
;順向查表 :  index -> code
;輸入索引值     : index(R1),table_name,table address(DPTR)
;輸出索引值     : code(R2)
;使用輸出     : R1,R2
;查表在R1,結果放R2
;----------------------------------------------- --------------------------------
PUBLIC         FLOOK_TABLE    ;告訴組譯器FLOOK_TABLE的模組程式是可提供其程式呼叫使用的 
ROM            SEGMENT CODE  ;共享ROM空間
RSEG		       ROM            ;選取可重置的 ROM空間

FLOOK_TABLE:                       ;模組名稱
			   MOV      A,R1        ;將R1位置的值放在A
			   MOVC     A,@A+DPTR  ;將表格內第A(R1)個的數字放於A(查表指令)
			   MOV      R2,A        ;將A的值放在R2
          RET                   ;模組程式返回
			   END                 ;模組程式結束


