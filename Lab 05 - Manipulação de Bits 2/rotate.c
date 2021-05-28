#include <stdio.h>


unsigned char rotate_left(unsigned char x, int n){
    for(int i=0; i<n;i++){
        if(x&0x80){
            x = (x<<1)|1;
        }else{
            x = (x<<1);
        }
    }
    return x;
}

int main() {

    unsigned char a = 'b';
    printf("a = 0x%08X\n", a);
    printf("a = 0x%08X\n", rotate_left(a,5));
  return 0;

}