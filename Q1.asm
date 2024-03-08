[org 0x0100]

jmp start

set1 : dw -3, -1, 2, 5, 6, 8, 9
set2 : dw -2, 2, 6, 7, 9
difference : db  0

diff_of_sets:
push si
push bx
push di
jmp loop1

loop:
add di, 2
cmp si, 8
je l1

loop1:
mov ax, [set1 + bx]
mov dx, [set2 + si]
cmp dx, ax
je l1
mov [difference + di], ax
add si, 2
cmp si, 8
jne loop1
cmp si, 8
je loop 

l1:
mov cx, 0
mov word[difference + di], cx
add bx, 2
mov si, 0
cmp bx, 12
jne loop1
pop di
pop bx
pop si
ret

start:
mov bx, 0
mov si, 0
mov di, 0
call diff_of_sets
mov si, 0

mov ax, 0x4c00
int 0x21