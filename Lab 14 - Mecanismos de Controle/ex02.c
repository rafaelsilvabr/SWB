#include <stdio.h>

  int  a;                  

  long b;                     

int main()

{
  scanf("%d", &a);            // utilize 'read_int_to_eax'

  if (a) {
    scanf("%ld", &b);         // utilize 'read_long_to_rax'
    if (b < 5) {
       b = (a << 1) + (a * b);
       printf("%ld\n", b);    // utilize 'print_rax_as_long'
    }
    else {
       a = b ^ 0x1FL;
       printf("0x%X\n", a);   // utilize 'print_eax_as_hex'
    }
  }

  return 0;

}