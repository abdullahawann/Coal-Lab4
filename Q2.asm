[org 0x0100]

jmp start

number_of_ones:
push ax
push bx
push cx
push dx
and bx, ax

l1: 
cmp bx, cx
je exit
shl bx, 1
jnc l1
add dx, 1
cmp bx, cx
jne l1

exit:
pop dx
pop cx
pop bx
pop ax
ret

start:
mov ax, 0x5663
mov bx, 0xffff
mov cx, 0x0000
mov dx, 0
call number_of_ones

mov ax, 0x4c00
int 0x21