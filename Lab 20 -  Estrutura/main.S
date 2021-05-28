.section .rodata

str1: .string "Diferença em %d/%ld: %ld\n"
str2: .string "%d - %d\n"

.data

.globl prods
.align 8
prods:
    .byte 0 # 0 mes
    .zero 7
    .quad 0 # 0 preco
    .int 0 # 0 ano
    .zero 4

    .byte 0 # 1 mes
    .zero 7
    .quad 0 # 1 preco
    .int 0 # 1 ano
    .zero 4

.text

.globl media
media:
   pushq %rbp
   movq %rsp, %rbp
   
   subq $32, %rsp
   movq %r12, -8(%rbp)
   movq %r13, -16(%rbp)
   movq %r14, -24(%rbp)
   movq %r15, -32(%rbp)

   movq %rdi, %r14
   movq %rsi, %r15

   #corpo
   movl $0, %r12d # i
   movq $0, %r13 # soma

   #ini for
   movq $0, %r12

for:
   cmpq %r15, %r12
   jge end

   movslq %r12d, %rax
   imulq $24, %rax
   addq %r14, %rax
   
   addq 8(%rax), %r13

   addl $1, %r12d
   jmp for

end:

   # soma/size
   mov %r12w, %ax 
   mov %sil, %cl 
   divb %cl
   movzbw %al, %ax

   movq -8(%rbp), %r12
   movq -16(%rbp), %r13
   movq -24(%rbp), %r14
   movq -32(%rbp), %r15

   leave
   ret

.globl main
main:
   pushq %rbp
   movq %rsp, %rbp

   movl $0, %r12d #i=0

   movq $prods, %r13
   
   movb $1, %r8b
   movb %r8b, (%r13) #prods[0].mes = JAN;
   movq $100, %r8 
   movq %r8, 8(%r13) #prods[0].preco = 100;
   movl $2020, %r8d
   movl %r8d, 16(%r13) #prods[0].ano   = 2020;

   movb $2, %r8b
   movb %r8b, 24(%r13) #prods[1].mes   = FEV;
   movq $129, %r8
   movq %r8, 32(%r13) #prods[1].preco = 120;
   movl $2020, %r8d
   movl %r8d, 40(%r13) #prods[1].ano   = 2020;

   movq $prods, %rdi
   movq $2, %rsi
   call media
   
   movq %rax, %r14 #media

while:
   cmp $2, %r12d
   jge endMain

   #primeiro param
   movq $str1, %rdi

   #prods[i]
   movslq %r12d, %rax
   imulq $24, %rax
   addq $prods, %rax

   #segundo param
   movsbl (%rax), %esi
   #terceiro param
   movl 16(%rax), %edx
   #quarto param
   movq 8(%rax), %rcx
   subq %r14, %rcx

   movl $0, %eax
   call printf

   addl $1, %r12d

   jmp while
endMain:
   leave
   ret