.section .rodata

str01: .string "Soma: %ld\n"

.data

.text

.globl main
main:
   pushq %rbp
   movq %rsp, %rbp
   subq $24, %rsp
   # s = %r12w
   # i = -4(%rbp)
   # l = -16(%rbp)
   movq %r12, -24(%rbp)

 
  # s = constante();
   call constante
   movsbw %al, %r12w

  # init(s, &l, &i);
   movw %r12w, %di
   leaq -16(%rbp), %rsi
   leaq -4(%rbp), %rdx
   call init

  #  printf("Soma: %ld\n", l + i + s);
   movq $str01, %rdi
   movq -16(%rbp), %rsi
   movslq -4(%rbp), %rax
   addq %rax, %rsi
   movswq %r12w, %rax
   addq %rax, %rsi
   movl $0, %eax
   call printf

   movq -24(%rbp), %r12
   leave
   ret