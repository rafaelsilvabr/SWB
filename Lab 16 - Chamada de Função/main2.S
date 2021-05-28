.section .rodata

str1: .string "%d\n"

.data

.globl i
.align 4
i: .int 0

.globl vet
.align 1
vet: .byte 12,3,20,8

.text

.globl main

main:

   pushq %rbp

   movq  %rsp, %rbp

for:
   cmp $4, i
   jge after

   movq $vet, %r11
   movslq i, %r10
   addq %r10, %r11

   movb (%r11), %dil
   movl $10, %esi
   call filtro

   movq $str1, %rdi
   movl %eax, %esi
   movl $0, %eax
   call printf

   addl $1, i
   jmp for

after:

   # return 0
   movl $0, %eax

   leave

   ret