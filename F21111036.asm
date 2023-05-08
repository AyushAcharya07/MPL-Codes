section .data
name db 10, "Hello Welcome to this program!!",10,13,"This is my first asm code!!",10
l1 equ $-name
subject db 10,"This is microprocessor lab ",10,13,"This is in ASM",10
l2 equ $-subject


;section .bss

section .txt
global _start:
_start:

          mov rax,1
          mov rdi,1
          mov rsi,name
          mov rdx,l1
          syscall
          
          mov rax,1
          mov rdi,1
          mov rsi,subject
          mov rdx,l2
          syscall
          
          mov rax,60
          syscall


