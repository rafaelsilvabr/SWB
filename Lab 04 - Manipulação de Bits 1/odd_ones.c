#include <stdio.h>


int odd_ones(unsigned int x) {

  int ans=0;
  for(int i=0; i<32;i++){
      ans+=1&(x>>i);
      /*if(x&(1<<i)){
          ans++;
      }*/
  }
  return ans&1;
}


int main() {

  unsigned int v;


  v = 0x01010101;

  printf("%X tem número %s de bits\n", v, odd_ones(v) ? "impar" : "par");


  v = 0x01030101;

  printf("%X tem número %s de bits\n", v, odd_ones(v) ? "impar" : "par");


  return 0;

}