; MPL 3rd code
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
dispnum resb 16 ; Increase buffer size to accommodate 16 bytes

section .text
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
    xor rbx,rbx ; Set rbx to 0
    syscall

Termination:
    print newline,1 ; Move newline print statement after Exit label for clarity
    ret

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
    print dispnum,16 ; Remove space before dispnum
    ret
