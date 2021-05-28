.data

.globl str
str: .ascii "BEBAMUITOCAFE"

.text

.globl process

process:

   pushq %rbp
   movq  %rsp, %rbp

   # ptr = %r8
   # ptr = str

   movq $str, %r8


beginwhile:

   cmpb $0, (%r8)

   je endwhile            # while() {


   # Bloco do while
   addl $32, (%r8)
   addq $1, %r8


   jmp beginwhile         # }

endwhile:


   leave

   ret