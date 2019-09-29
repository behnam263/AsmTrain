; Computer Architectures (02LSEOV)
; Problem n. 0
DIM	  EQU 4
       .MODEL small
       .STACK
       .DATA
VETT   DB     DIM DUP(?)
       .CODE
       .STARTUP
       MOV CX,DIM
       MOV DI,0
       MOV AH,1
lab1:  INT 21H  
       MOV VETT[DI],AL
       INC DI
       DEC CX
       CMP CX,0
       JNZ lab1
       Call newline
       MOV CX,DIM
       MOV AH,2
lab2:  DEC DI
       MOV DL,VETT[DI]
       INT 21H 
       DEC CX
       CMP CX,0
       JNZ lab2
       Call newline
       Call sum1
       MOV DL,AL
       ADD DL,30h
       MOV AH,2
       INT 21H
       .EXIT
 
sum1 PROC ; procedure declaration.
           ;newline begin
       MOV AL, 0
       MOV CX, DIM
       MOV DI, 0
sum2:  ADD AL,VETT[DI]
       SUB AL,30h
       INC DI
       DEC CX
       CMP CX,0
       JNZ sum2 
           ;newline begin
       RET ; return to caller.
sum1 ENDP  
      
       
newline PROC ; procedure declaration.
           ;newline begin
           MOV dl, 10
           MOV ah, 02h
           INT 21h
           MOV dl, 13
           MOV ah, 02h
           INT 21h 
           ;newline begin
       RET ; return to caller.
newline ENDP      
 END  
