.section .rodata
str1: .string "soma = "

.data

.globl nums
.align 4
nums: .int 65,-105,111,34

.text

.globl main

main:

   pushq %rbp

   movq  %rsp, %rbp

   # int i
   movl $0, %r8d

   # int s
   movl $0, %r9d

   loop:
   cmp $4, %r8d
   jge after

   #tmp = r10d
   movslq %r8d, %r10
   imulq $4, %r10
   addq $nums, %r10

   #i++
   addl $1, %r8d

   #s+= num[tmp]
   addl (%r10),%r9d

   jmp loop
   after:

   # print
   movl %r9d, %eax
   call print_eax_as_int

   movl $0, %eax

   leave

   ret