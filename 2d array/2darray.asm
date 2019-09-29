DIM   EQU 9 
       .MODEL small
       .STACK
       .DATA
A   DB  1, 2, 3, 4, 5, 6, 7, 8, 10
B   DB  11, 12, 13,14, 15, 16, 17, 18, 19   
M   DW  (DIM * DIM) DUP (?)
C DB ?
TEMP DW ?  
TEMP2 DW ?
.CODE
       .STARTUP
       MOV AX, 0
       MOV CX, DIM1
       MOV DI, 0
lab5:  MOV C, DIM1
       MOV BX, 0
lab6:  MOV AX, 0
       MOV AL, A[DI]
       MUL B[BX]        
;M[J,K] = M[2 * (J * NUM_COLS + K)]
       MOV TEMP,AX
       XOR AX,AX
       MOV AX,DI
       MOV TEMP2,BX
       MOV BX,DIM1
       MUL BX
       MOV BX,TEMP2
       ADD AX,BX
       MOV TEMP2,BX
       MOV BX,2
       MUL BX
       MOV BX,TEMP2 
       MOV TEMP2,DI
       MOV SI,AX
       MOV AX,TEMP
       MOV M[SI],AX
       MOV AX, 0
       INC BX
       DEC C
       CMP C,0            
       JNZ LAB6
       MOV AX, 0
       INC DI
       DEC CX
       CMP CX,0            
       JNZ LAB5
        .EXIT
       END