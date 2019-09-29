; Sum array elements
DIM1   EQU 10 
       .MODEL small
       .STACK
       .DATA
A   DB  1, 2, 3, 4, 5, 6, 7, 8, 10, 11
MINA DB ?
       .CODE
       .STARTUP
     MOV DI, 0
     MOV AL,A[DI]
     MOV CX, DIM1
     MOV DI, 1 
LAB1:CMP A[DI],AL
     JAE PASS
     MOV AL,A[DI]
PASS:INC DI
     DEC CX
     CMP CX,0            
     JNZ LAB1
     MOV MINA,AL
    .EXIT
   END   
