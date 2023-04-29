; MPL code for length of the entered string

section .data
%macro print 2
mov rax,1
mov rdi,1
mov rsi,%1
mov rdx,%2
syscall
%endmacro

%macro read 2
mov rax,0
mov rdi,0
mov rsi,%1
mov rdx,%2
syscall
%endmacro


name db 10,"Enter the string needed : ",10
l1 equ $-name

display db 10,"The entered string from user is : ",10
l2 equ $-display

length db 10,"The length of the entered string is  : ",10
l3 equ $-length

newline db 10



section .bss

buffer resb 50
size equ $-buffer


count resd 1

dispnum resb 02


section .txt
global _start:

_start:

print name,l1

read buffer,size
mov [count],rax
dec rax
print display,l2
print buffer,[count]

call disp

Exit:
          mov rax,60
          mov rbx,0
          
Termination:
          syscall

print newline,1



disp:
mov rsi,dispnum+15
mov rax,[count]
mov rcx,16
dec rax

up1:
mov rdx,0
mov rbx,10
div rbx
add dl,30h
mov [rsi],dl
dec rsi

loop up1

print length,l3
print dispnum+14,02

ret

OUTPUT:-
(base) admin1@410-7:~/F21111036$ nasm -f elf64 MPL4NEW.asm
(base) admin1@410-7:~/F21111036$ ld -o a MPL4NEW.o
(base) admin1@410-7:~/F21111036$ ./a

Enter the string needed : 
ayush_mpl4code

The entered string from user is : 
ayush_mpl4code

The length of the entered string is  : 
14(base)
