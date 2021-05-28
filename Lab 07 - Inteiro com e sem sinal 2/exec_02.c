#include <stdio.h>

#include <stdlib.h>


int xbyte(unsigned int word, int bytenum) {
    unsigned char w=0;  
    //0xAABBCCDD
    if(bytenum == 0){
        w = word;        
    }
    if(bytenum == 1){
        w = word/256;
    }
    if(bytenum == 2){
        unsigned int tmp = word;
        for(int i=0;i<2;i++){
            tmp = tmp/256;
        }
        w=tmp;
    }
    if(bytenum == 3){
        unsigned int tmp = word;
        for(int i=0;i<3;i++){
            tmp = tmp/256;
        }
        w=tmp;
    }

    signed char tmp = (signed char) w;
    if(tmp>0){
  //      printf("----case1----");
        unsigned int res=(unsigned int)w+0xFFFFFF00;
        return res;
    }
    tmp*=2;
    if(tmp>0){
 //       printf("----case2----");
        unsigned int res=(unsigned int)w*256;
        return res;
    }
//    printf("----case3----");
    return ((unsigned int)w*256*256) + 0xFF00FFFF; 



    printf("%8x,%d | %8x\n",word,bytenum,w);

    return -1;

}

int main() {

  int x;


  x = xbyte(0x01ABCD02, 0);

  printf ("0x%08X\n", x);    // 0xFFFFFF02 (caso 1)


  x = xbyte(0x01ABCD02, 1);

  printf ("0x%08X\n", x);    // 0xFFCDFFFF (caso 3)


  x = xbyte(0x01ABCD02, 2);

  printf ("0x%08X\n", x);    // 0x0000AB00 (caso 2)


  x = xbyte(0x11E032A5, 0);

  printf ("0x%08X\n", x);    // 0x0000A500 (caso 2)


  x = xbyte(0x11E032A5, 1);

  printf ("0x%08X\n", x);    // 0xFFFFFF32 (caso 1)


  x = xbyte(0x11E032A5, 2);

  printf ("0x%08X\n", x);    // 0xFFE0FFFF (caso 3)


  x = xbyte(0x11E032A5, 3);

  printf ("0x%08X\n", x);    // 0xFFFFFF11 (caso 1)


  x = xbyte(0xABCD, 3);

  printf ("0x%08X\n", x);    // 0xFFFFFF00 (caso 1)


  x = xbyte(0xABCD, 1);

  printf ("0x%08X\n", x);    // 0x0000AB00 (caso 2)


  return 0;

}