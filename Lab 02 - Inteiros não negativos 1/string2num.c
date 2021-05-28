#include <ctype.h>

#include <stdio.h>

/*
int string2num(char *s) {

  int a = 0;

  for ( ; *s; s++)

    a = a*10 + (*s - '0');

  return a;

}*/
int myisalpha(char *s){
    if(*s>='A'&&*s<='Z') return 1;
    if(*s>='a'&&*s<='z') return 2;
    return 0;
}

int string2num(char *s, int b) {

  int a = 0;

  for ( ; *s; s++)
    switch (myisalpha(s))
    {
    case 1:
        a = a*b + ((*s) - 'A' + 10);      
        break;
    case 2:
        a = a*b + ((*s) - 'a' + 10);      
        break;
    
    default:
        a = a*b + (*s - '0');
        break;
    }

  return a;

}

int main () {

  printf("==> %d\n", string2num("3f",16));

//  printf("==> %d\n", string2num("1234") + 1);

//  printf("==> %d\n", string2num("1234") + string2num("1"));

  return 0;

}