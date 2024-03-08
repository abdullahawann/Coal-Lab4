[org 0x0100]

jmp start

num : dw 0

cumulative sum :
push cx
mov ax, cx

l3:
add bx, ax
dec ax
cmp ax, 0
jne l3
dec cx 

l2:
mov ax, cx

l1: 
add [num], ax
dec ax
cmp ax, 0
jne l1
dec cx
cmp cx, 0
jne l2
mov ax, [num]
mov si, 2
mul si
add ax, bx
mov [num], ax
pop cx
ret

start:
mov cx, 6
add cx, 5                ; s = n+5
mov dx, 0
call cumulative sum

mov ax, 0x4c00
int 0x21