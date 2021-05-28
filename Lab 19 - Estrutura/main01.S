.section .rodata

str01: .string "color %ld, filled: %d\n"

.data

.globl c1
.align 8
c1:
   .int 0 #int x
   .int 0 #int y
   .byte 0 #char filled
   .zero 7
   .quad 0 #long color

.text

.globl main
main:
   pushq %rbp
   movq %rsp, %rbp

   #  c1.x = 10
   movq $c1, %r12
   movl $10, (%r12d)

   #  c1.y = 2 * c1.x;
   movl (%r12d), %r8d
   imull $2, %r8d
   movl %r8d, 4(%r12d)

   #  c1.filled = 1;
   movl $1, 9(%r12d)

   #  if (c1.y <= 30) goto: end
if:
   cmp $30, 4(%r12d)
   jle else

   #  c1.color = RED;
   movq $2, 16(%r12)
   jmp end
else:
   #  c1.color = BLUE;
   movq $1, 16(%r12)

end:
   movq $str01, %rdi
   movq 16(%r12), %rsi
   movl 9(%r12),%edx
   movl $0, %eax
   call printf

   leave
   ret