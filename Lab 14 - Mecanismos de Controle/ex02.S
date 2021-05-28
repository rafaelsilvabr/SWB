.section .rodata


.data

.globl a
.align 4
a: .int 0

.globl b
.align 8
b: .quad 0

.text

.globl main

main:

   pushq %rbp

   movq  %rsp, %rbp

   call read_int_to_eax
   movl %eax, a

   #z if a<0
   cmp $0, %eax
   jle aft_if1

   call read_long_to_rax
   movq %rax, b

    #z if b>=5
   cmp $5, %rax
   jge aft_if2
   
   #(a << 1)
   movl a, %r8d
   shll $1, %r8d

   #(a * b)
   movl a, %r9d
   movslq %r9d, %r9
   movq b, %r10
   imulq %r9, %r10

   #(a << 1) + (a * b)
   movslq %r8d, %r8
   addq %r8, %r10
   movq %r10, b

   #print
   movq b, %rax
   call print_rax_as_long

   jmp aft_if1

   aft_if2:

   movq b, %r10
   xorq $0x1FL, %r10
   movl %r10d, a

   #print
   movl a, %eax
   call print_eax_as_hex

   aft_if1:

   movl $0, %eax

   leave

   ret