.section .rodata

str1: .string "a = %f, b = %f, e = %f\n"

.data

.text

.globl calc2
calc2:
    pushq %rbp
    movq %rsp, %rbp

    subq $32, %rsp
    movsd %xmm0, -8(%rbp)
    movsd %xmm1, -16(%rbp)
    movsd %xmm2, -32(%rbp)

    # float a = -8(%rbp)
    # float b = -16(%rbp)
    # double e = -24(%rbp)

    movss -16(%rbp), %xmm0 # b -> %xmm0
    call cos
    cvtss2sd -8(%rbp), %xmm2  # (double)a
    addsd %xmm2, %xmm0  # a+cos(b)
    movsd %xmm0, -24(%rbp) # salva na memoria

    cvtss2sd -8(%rbp), %xmm0  # (double)a
    cvtss2sd -16(%rbp), %xmm1 # (double)b
    movsd -24(%rbp), %xmm2    #  e
    movq $str1, %rdi
    movl $3, %eax
    call printf

    movsd -16(%rbp), %xmm0 # return b

    movsd -16(%rbp), %xmm1
    movsd -32(%rbp), %xmm2

    leave
    ret