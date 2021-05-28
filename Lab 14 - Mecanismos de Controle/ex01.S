.section .rodata

str01: .string "'a' é maior do que 'b'\n"
str02: .string "'a' não é maior do que 'b'\n"

.data

.globl a
.align 4
a: .int 10

.globl b
.align 4
b: .int 20


.text

.globl main

main:

   pushq %rbp

   movq  %rsp, %rbp

   movl a, %eax
   movl b, %edx

   cmpl %edx, %eax
   jle aposIf1

   # print
   movq $str01, %rax
   call print_rax_as_string

   aposIf1:
   movl a, %eax
   movl b, %edx

   cmpl %eax, %edx
   jl aposIf2

   # print
   movq $str02, %rax
   call print_rax_as_string

   aposIf2:

   movl $0, %eax

   leave

   ret