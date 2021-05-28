#include <stdio.h>


struct S {

  char  c[3];

  int   a;

  union {

    char x[9];

    long y;

  } d;

  short b;

};

void offsets(struct S *ptr) {

    unsigned long p0 = (unsigned long) ptr;
    unsigned long pa = (unsigned long) &(ptr->a);
    unsigned long pb = (unsigned long) &(ptr->b);
    unsigned long pc = (unsigned long) &(ptr->c);
    unsigned long pd = (unsigned long) &(ptr->d);

    printf("a = +%lu\n",(pa-p0));
    printf("b = +%lu\n",(pb-p0));
    printf("c = +%lu\n",(pc-p0));
    printf("d = +%lu\n",(pd-p0));
}


//----------------------------------------------

// Cria a variável varS

struct S varS;


int main() {

  offsets(&varS);

  return 0;

}