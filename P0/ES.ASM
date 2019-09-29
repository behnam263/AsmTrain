.model small
.stack
.data
.code
.startup
mov al,2
mov ah,2
mov dl, 66
int 21h
.exit
END
