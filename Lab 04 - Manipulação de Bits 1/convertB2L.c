#include <stdio.h>


unsigned int convertB2L(unsigned int x) {

    unsigned int byt1,byt2,byt3,byt4,byt5,byt6,byt7,byt8,ans=0;
    ans = x>>24;
    ans=ans|x<<24;
    ans=ans|(x&0xFF00)<<8;
    ans=ans|(x&0xFF0000)>>8;
    //printf("%x e %x\n",ans, x);
}


int main() {

  unsigned int b = 0x12AB34CD;

  unsigned int l = convertB2L(b);


  printf("b = 0x%08X\n", b);

  printf("l = 0x%08X\n", l);


  return 0;

}