.section .rodata

.data

.text

.globl fat

fat:
   pushq %rbp
   movq  %rsp, %rbp
   subq $16, %rsp

   movq %r12, -8(%rbp)

   # n = %r12d
   movl %edi, %r12d

   #if n<=0 goto: end
   cmp $0, %r12d
   jle end

   #(n-1) em %edi
   movl %r12d, %edi
   subl $1, %edi

   call fat

   # fat(n-1) * n 
   imull %r12d, %eax
   jmp end2

end:
   movl $1, %eax
end2:
   movq -8(%rbp), %r12

   leave
   ret