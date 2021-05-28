#include <stdio.h>


int main()

{

  short i = 10;

  short j = 31;

  short k = 19;

  unsigned char r = 10;


  if (i < 20 || j < 30)

    r = r >> 1;

  if (j > 30 && k < 20)

    r = r / 2;

  if ( (i > 20 && j > 30) || k > 20)

    r = r + 100;

  printf("%u\n", r);   // Imprime como 'unsigned int'


  return 0;

}