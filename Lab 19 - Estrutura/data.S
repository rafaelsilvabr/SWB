.section .rodata

str01: .string "%ld\n"

.data

.text

.globl show
show:
   pushq %rbp
   movq %rsp, %rbp
   
   subq $32, %rsp
   movq %r12, -8(%rbp)
   movq %r13, -16(%rbp)
   movq %rbx, -24(%rbp)

   #*d = %r13
   movq %rdi, %r13

   #  long *ptr = d->elems;
   movq %rdi, %r12
   addq $8, %r12

   #declaração
   #  i=0
   movl $0, %ebx

   #z if i >= d->len goto end
for:
   cmp (%r13d),%ebx
   jge end

   #prepara o printf
   #primeiro parametro: str
   movq $str01, %rdi
 
   #segundo parametro: ptr[i]
   movslq %ebx, %rsi #mov (int)i para %rsi 
   imulq $8, %rsi # i*8
   addq %r12, %rsi # (i*8)+(*d->len)
   movq (%rsi),%rsi 

   movl $0, %eax
   call printf

   #i++
   addl $1, %ebx
   jmp for

end:
   movq -8(%rbp), %r12
   movq -16(%rbp), %r13
   movq -24(%rbp), %rbx

   leave
   ret