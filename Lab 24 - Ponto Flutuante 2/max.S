.section .rodata

.align 8
tmp1: .double 0.0

.data

.text

.globl max_prod
max_prod:
    pushq %rbp
    movq %rsp, %rbp

    subq $32, %rsp
    
    movq %rdi, -8(%rbp)    # ptr = -8(%rbp) 
    movsd %xmm1, -24(%rbp)

    movsd tmp1, %xmm0 
    movsd %xmm0, -16(%rbp) # m = 0.0;

while:
    movl -8(%rbp), %eax 
    cmp $0, (%eax)
    je end

    # double tmp = floor(ptr->value);
    leaq -8(%rbp), %rax
    movsd 8(%rax), %xmm1
    call floor

if:
    movsd -8(%rbp), %xmm1
    ucomisd %xmm0, %xmm1
    jae endif

    # m = tmp;
    movsd %xmm0, %xmm1
    movsd %xmm1, -16(%rbp)

endif:
    # ptr++
    leaq -8(%rbp), %rax
    addq $16, %rax
    movq %rax, -8(%rbp)
    jmp while

end:
    # return m
    movsd -16(%rbp), %xmm0

    movq -8(%rbp), %rdi
    movsd -24(%rbp), %xmm1

    leave
    ret