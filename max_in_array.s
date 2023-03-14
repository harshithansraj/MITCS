.global _start
_start:
		LDR R0,=list
		LDR R1,[R0]
		MOV R2,#1
		B UP
UP:
		LDR R3,[R0,#4]!
		ADD R2,R2,#1
		CMP R3,R1
		BCS MAX
		CMP R2,#10
		BCS exit
		BAL UP
MAX:	
		LDR R4,[R3]
		B UP
exit:

.data 
list: 
	.word 1,2,3,4,5,6,7,8,9,10
