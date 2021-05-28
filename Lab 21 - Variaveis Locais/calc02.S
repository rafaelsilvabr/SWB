.section .rodata

.data

.text

.globl calc
calc:
    pushq %rbp
    movq %rsp, %rbp

    # reserva pilha
    subq $48, %rsp

    #sum = -4(%rbp)
    #vet1= -24(%rbp)
    #vet2= -34(%rbp)
    #i=r12d
    movq %r12, -40(%rbp)
    #j=r13d
    movq %r13, -48(%rbp)

    movl $0, %r12d #i=0
    movl $4, %r13d #j=4


    #filli(vet1, 5, i);
    leaq -24(%rbp), %rdi
    movl $5, %esi
    movl %r12d, %edx
    call filli

    # fills(vet2, 5, j);
    leaq -34(%rbp), %rdi
    movl $5, %esi
    movl %r13d, %edx
    call fills

    movl $0, -4(%rbp) #sum = 0;

for:
    cmp $5, %r12d
    jge end

    #aux=vet1[i]
    leaq -24(%rbp), %r8
    movslq %r12d, %rax
    imulq $4, %rax
    addq %rax, %r8
    movl (%r8), %r9d

    #aux+=vet2[j]
    leaq -34(%rbp), %r8
    movslq %r13d, %rax
    imulq $2, %rax
    addq %rax, %r8
    movswl (%r8), %r8d
    addl %r8d, %r9d

    #sum+=aux
    addl %r9d, -4(%rbp)

    addl $1, %r12d #i++
    subl $1, %r13d #j--
    jmp for
end:
    movl -4(%rbp),%eax 

    movq -40(%rbp), %r12
    movq -48(%rbp), %r13

    leave
    ret