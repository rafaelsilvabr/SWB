.section .rodata

str1: .string "%d\n"

.data

.text

.globl show

show:
   pushq %rbp
   movq  %rsp, %rbp
   subq $32, %rsp

   movq %r12, -8(rbp)
   movq %r13, -16(rbp)
   movq %r14, -24(rbp)

   # *v = %r12
   movq %rdi, %r12
   # size = %r13d
   movl %esi, %r13d

   # i = %r14d
   movl $0, %r14d
for:
   #z if i>=size goto after
   cmp %r13d, %r14d
   jge end
   
   # vet[i]
   movslq %r14d, %r8
   imulq $4, %r8
   addq %r12, %r8

   # print vet[i]
   movq $str1, %rdi
   movl (%r8), %esi
   movl $0, %eax
   call printf

   addl $1, %r14d
   jmp for
end:
   movq -8(rbp), %r12
   movq -16(rbp), %r13
   movq -32(rbp), %r14

   leave
   ret