.section .rodata

.data

.text

.globl calc1
calc1:
    pushq %rbp
    movq %rsp, %rbp

    subq $32, %rsp
    movsd %xmm0, -8(%rbp)
    movsd %xmm1, -16(%rbp)
    movsd %xmm2, -24(%rbp)
    movsd %xmm3, -32(%rbp)

    # (double)a = %xmm0
    # (float)b = %xmm1
 
    cvtss2sd %xmm1, %xmm1 # (double)b
    movsd %xmm0, %xmm2    # a -> xmm2
    addsd %xmm1, %xmm2    # xmm2 += b
    subsd %xmm1, %xmm0    # a-=b
    mulsd %xmm2, %xmm0

end:
    movsd -16(%rbp), %xmm1
    movsd -24(%rbp), %xmm2
    movsd -32(%rbp), %xmm3 

    leave
    ret