; Sum array elements
DIM1   EQU 9 
       .MODEL small
       .STACK
       .DATA
A   DB  1, 2, 3, 4, 5, 6, 7, 8, 10, 11
B   DB  DIM1  DUP(?)  
       .CODE
       .STARTUP
;1.  Compute the sum for each pair of consecutive values,
;putting the result in a 9 elements array
; (Bj = Aj + Aj+1).
       MOV AL, 0
       MOV CX, DIM1
       MOV DI, 0
lab1:  MOV AL,A[DI]
       ADD AL,A[DI+1]
       MOV B[DI],AL
       MOV DL,2
       MOV AH,2
       INT 21H
       INC DI
       DEC CX
       CMP CX,0
       JNZ lab1 
       .EXIT
       END
