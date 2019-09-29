DIM   EQU 3 
       .MODEL small
       .STACK
       .DATA
M   DB  1, 2, 3, 4, 5, 6, 7, 8, 10
C DB ?
MAX DW ?
TEMP DW ?  
TEMP2 DW ?
       .CODE
       .STARTUP
MOV AX,M[0]
      MOV CX,DIM 
      MOV DI,0
lab7: MOV C,DIM
      MOV BX, 0
lab8: ;M[J,K] = M[2 * (J * NUM_COLS + K)]
       MOV TEMP,AX
       XOR AX,AX
       MOV AX,DI
       MOV TEMP2,BX
       MOV BX,DIM
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
      CMP AX,M[SI]
      JAE PASS3
      MOV AX,M[SI]
PASS3:INC BX
      DEC C
      CMP C,0            
      JNZ LAB8
      INC DI
      DEC CX
      CMP CX,0            
      JNZ LAB7
      MOV MAX,AX   
   .EXIT
   END
