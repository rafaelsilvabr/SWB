.section .rodata

str1: .string "Hello"
str2: .string "[INFO] %d\n"

.data

.globl val
.align 4
val: .int 430

.globl age
.align 2
age: .word 4

.globl r
.align 4
r: .int 0

.globl err
.align 4
err: .int 0

.text

.globl main

main:

   pushq %rbp

   movq  %rsp, %rbp

   movq $str1, %rdi
   movl val, %esi
   movw age, %dx
   movq $r, %rcx
   call sum

   # resposta em %eax

   movq $str2, %rdi
   movl %eax, %esi
   movl $0, %eax
   call printf

   # return 0
   movl $0, %eax

   leave

   ret