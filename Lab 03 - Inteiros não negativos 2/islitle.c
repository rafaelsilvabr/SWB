#include <stdio.h>


int is_little(){
    int num = 1;
    char *n = (char*)&num;
    if (*n==1) return 1;
    return 0;
}


int main () {

  if (is_little())
    printf("Little-endian\n");

  else
    printf("Big-endian\n");

  return 0;

}