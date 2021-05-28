.section .rodata

.data

.globl v1
.align 2
v1: .word 1,2

.globl v2
.align 8
v2: .quad 1,2,3

.text

.globl aux
aux:
   pushq %rbp
   movq %rsp, %rbp

   subq $32, %rsp
   movq %r12, -8(%rbp)
   movq %r13, -16(%rbp)
   movq %rbx, -24(%rbp)

   movq %rdi, %r12
   movl %esi, %r13d

   #inicialização (i = 2 = %rbx)
   movl $2, %ebx

for:
   #z if i<0 goto: end
   cmp $0, %ebx
   jl end
   
   movq %r12, %rdi
   movl %r13d, %esi
   movq $v2, %rdx
   movl %ebx, %ecx
   call sum

   subl $1, %ebx
   jmp for

end:
   movq -8(%rbp), %r12
   movq -16(%rbp), %r13
   movq -24(%rbp), %rbx
   leave 
   ret


.globl main

main:
   pushq %rbp
   movq  %rsp, %rbp
   subq $16, %rsp

   # i = r12
   movl $0, %eax

while:
   #z if i>=2 goto: end
   cmp $2, %eax
   jge endMain

   #parametros
   movq $v1, %rdi
   movl %eax, %esi

   #salva
   movq %rax, -8(%rbp)
   call aux
   #recupera
   movq -8(%rbp), %rax
   
   #i++
   addl $1, %eax
   jmp while
endMain:
   movl $0, %eax
   leave
   ret