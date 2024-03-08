[org 0x0100]

jmp start

f : dd 0             ; 32 bit memory variable

multiplication:
mul bx
mov cx, ax
ret

addition:
add cx, bx
adc dx, ax
mov [f], dx
mov [f+2], cx
ret

start:
mov ax, 0x5663
not ax
mov bx, ax
mov ax, 0x5663
call multiplication
mov ax, 0x5663
call addition
mov ax, [f]
mov bx, [f+2]

mov ax, 0x4c00
int 0x21