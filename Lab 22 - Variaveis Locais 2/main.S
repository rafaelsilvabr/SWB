.section .rodata

str01: .string "Soma: %ld\n"
str02: .string "%ld\n"

.data

.text

.globl sum
sum:
    pushq %rbp
    movq %rsp, %rbp

    subq $56, %rsp
    movq %r12, -16(%rbp)
    movq %r13, -24(%rbp)
    movq %r14, -32(%rbp)
    movq %r15, -40(%rbp)
    # i = -4(%rbp)
    # j = -8(%rbp)
    # *h = %r15

    # *node = %r12
    movq %rdi, %r12
    
    # size = %r13d
    movl %esi, %r13d

    call new_sum
    movq %rax, %r15

    movl $0, %ebx # %ebx = i
    movl %ebx, -4(%rbp)
for1:   
    cmpl %r13d, %ebx
    jge endf1

    movl $0, %r14d
    movl %r14d, -8(%rbp)
for2:
    #node[i] = %rax
    movslq -4(%rbp), %rax # i -> %rax
    imulq $56, %rax       # %rax*= 56
    addq %r12, %rax       # %rax += %r12

    movq %rax, -56(%rbp)
    cmpl 48(%rax), %r14d
    jge endf2
    movq -56(%rbp), %rax
    
    #addsum
    movq %r15, %rdi

    movslq -8(%rbp), %rsi # j -> %rsi
    imulq $8, %rsi        # %rsi*= 8
    addq $8, %rsi         # %rsi+= 8
    addq %rax, %rsi       # %rsi+= *node
    movq (%rsi), %rsi
    call add_sum

    addl $1, %r14d
    movl %r14d, -8(%rbp)
    jmp for2
endf2:
    addl $1, %ebx
    movl %ebx, -4(%rbp)
    jmp for1
endf1:
    movq %r15, %rdi
    call get_sum

    movq 16(%rbp), %r12
    movq 24(%rbp), %r13
    movq 32(%rbp), %r14
    movq 40(%rbp), %r15

    leave
    ret

.globl main
main:
    pushq %rbp
    movq %rsp, %rbp

    subq $112, %rsp

    leaq -112(%rbp), %rdi
    call init

    leaq -112(%rbp), %rdi
    movl $2, %esi
    call sum

    movq $str01, %rdi
    movl %eax, %esi
    movl $0, %eax
    call printf

    leave
    ret