.data

.globl c
c: .byte 0

.globl i
.align 4
i: .int -256

.globl ui
.align 4
ui: .int 1024

.globl l
.align 8
l: .quad 128

.globl ul
.align 8
ul: .quad 2048

.globl v
.align 4
v: .int 10,20,30,40,50

.globl us
.align 2
us: .short 111

.align 8
ptr: .quad 0

.text



.globl aux

aux:

    pushq %rbp

    movq  %rsp, %rbp


    # Se necessário, usar apenas os registradores:

    # %rax, %rcx, %rdx, %rdi, %rsi, %r8, %r9, %r10


# i = c;
    movb c,%r8b
    movsbl %r8b,%r9d
    movl %r9d, i

# ui = i;
    movl i, %r8d
    movl %r8d, ui

# ul = ui;
    movl ui, %r8d
    movq %r8, ul

# us = ul;
    movq ul, %r8
    movb %r8b, us

# c  = 10 + i - 5;
    movl i, %r8d
    addl $10, %r8d
    subl $5, %r8d
    movl %r8d, c

# i = v[2];
    movq $v, %r8 
    movl 8(%r8), %r9d
    movl %r9d, i

 # v[4] = v[3] * c;
    movq $v, %r8 
    movl 12(%r8), %r9d
    imul c, %r9d
    movl %r9d, 16(%r8)

# ptr = &l;
    movq $l, %r8 

# *ptr = 128;
    movl $128, (%r8) 


    leave

    ret