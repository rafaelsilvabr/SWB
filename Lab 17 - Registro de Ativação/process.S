.section .rodata

.data

.text

.globl process

process:
   pushq %rbp
   movq  %rsp, %rbp
   subq $48, %rsp

   #Salvar
    #a
   movq %rdi, -8(%rbp)
    #b
   movq %rsi, -16(%rbp)
    #c
   movq %rdx, -24(%rbp)
    #d
   movq %rcx, -32(%rbp)
    #e
   movq %r8, -40(%rbp)
    #f
   movq %r9, -48(%rbp)

    #f
   movq  -48(%rbp), %rdi
    #e
   movq  -40(%rbp), %rsi
    #d
   movq  -32(%rbp), %rdx
    #c
   movq  -24(%rbp), %rcx
    #b
   movq  -16(%rbp), %r8
    #a
   movq  -8(%rbp), %r9

   call calc

   #rtn
   addl -8(%rbp), %eax
   addl -16(%rbp), %eax
   addl -24(%rbp), %eax
   addl -32(%rbp), %eax
   addl -40(%rbp), %eax
   addl -48(%rbp), %eax

   #recuperar
   movq  -8(%rbp), %rdi
   movq  -16(%rbp), %rsi
   movq  -24(%rbp), %rdx
   movq  -32(%rbp), %rcx
   movq  -40(%rbp), %r8
   movq  -48(%rbp), %r9

   leave
   ret