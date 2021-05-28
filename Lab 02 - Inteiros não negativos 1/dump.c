#include <stdio.h>


void dump(void *addr, int n) {

  unsigned char *p = addr;

  while (n--) {

    printf("%p - %02x\n", p, *p);

    p++;

  }

}

int main() {

//  double i = 10000;
  char i[] = "Teste01234";

  dump(&i, sizeof(i));

  return 0;

}