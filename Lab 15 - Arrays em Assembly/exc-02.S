.section .rodata


.data


.text

.globl main

main:

   pushq %rbp

   movq  %rsp, %rbp

   # i = %r8w
   movw $10, %r8w

   # j = %r9w
   movw $31, %r9w

   # k = %r10w
   movw $19, %r10w

   # r = %r11w
   movw $10, %r11w

   #z if(i<20 || j<30)
   cmp $20, %r8w
   jl if1
   cmp $30, %r9w
   jge afterIf1

   if1:
   # r >> 1;
   shr $1, %r11w

   afterIf1:
   #z if(j > 30 && k < 20)
   cmp $30, %r9w
   jle afterIf2
   cmp $20, %r10w
   jge afterIf2

   #r/2
   movw %r11w, %ax
   movb $2, %cl
   divb %cl
   movzbw %al, %r11w

   afterIf2:
   #z ((i > 20 && j > 30) || k > 20)
   cmp $20, %r8w
   jle cond2
   cmp $30, %r9w
   jg if3
   cond2:
   cmp $20, %r10w
   jle afterIf3

   if3:
   # r+100  
   addl $100, %r11d

   afterIf3:
   movl %r11d, %eax
   call print_eax_as_int

   movl $0, %eax

   leave

   ret