#include <stdio.h>


int calc();


void filli(int *v, int cols, int k)

{

  int i;

  (void)k;

  for (i = 0; i < cols; i++) {

    v[i] = 1;
    printf("%d ", v[i]);
  }printf("\n");

}


void fills(short *v, int cols, int k)

{

  int i;

  (void)k;

  for (i = 0; i < cols; i++) {

    v[i] = 2;
    printf("%d ", v[i]);
  }printf("\n");

}


int main()

{

  printf("%d\n", calc());

  return 0;

}