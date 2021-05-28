.section .rodata

str1: .string "Soma %f maior que o limite %f\n"

.align 8
tmp1: .double 0.0

.data

.text

.globl sum
sum:
    pushq %rbp
    movq %rsp, %rbp

    subq $96, %rsp
    movsd %xmm0, -8(%rbp)
    movq %r12, -72(%rbp)
    movq %r14, -80(%rbp)
    movsd %xmm1, -88(%rbp)
    movsd %xmm2, -96(%rbp)

    # i = %r12d
    movl $4, %r12d

    # s = 0.0 = -16(%rbp)
    movsd tmp1, %xmm1
    movsd %xmm1, -16(%rbp)

    # vi = -32(%rbp) = (%r14)
    leaq -32(%rbp), %r14
    movq $5, %rax
    movq %rax, (%r14)
    movq $6, %rax
    movq %rax, 4(%r14)
    movq $7, %rax
    movq %rax, 8(%r14)
    movq $8, %rax
    movq %rax, 12(%r14)

    # vd = -64(%rbp)

    leaq -32(%rbp), %rdi
    leaq -64(%rbp), %rsi
    movl %r12d, %eax
    call mult

while:
    cmp $0, %r12d
    jle end

    subl $1, %r12d         # i--
    movslq %r12d, %rax     # tmp = i
    imulq $8, %rax         # tmp *= 8
    leaq -64(%rbp), %rdi   # &vd -> %rdi
    addq %rdi, %rax        # tmp += &vd
    movsd (%rax), %xmm2    # (tmp) -> xmm2
    movsd -16(%rbp), %xmm1 # s -> xmm1
    addsd %xmm1, %xmm2     # s+=(tmp)
    movsd %xmm2, -16(%rbp) # s -> -16(%rbp)

if: 
    movsd -16(%rbp), %xmm0
    ucomisd -8(%rbp), %xmm0
    jbe endif

    movq $str1, %rdi
    movsd -16(%rbp), %xmm1
    movsd -8(%rbp), %xmm2
    movl $2, %eax
    call printf

endif:
    jmp while
end:
    movsd -16(%rbp), %xmm0

    movsd -8(%rbp), %xmm1
    movq -72(%rbp), %r12
    movq -80(%rbp), %r14
    movsd -88(%rbp), %xmm1
    movsd -96(%rbp), %xmm2

    leave
    ret