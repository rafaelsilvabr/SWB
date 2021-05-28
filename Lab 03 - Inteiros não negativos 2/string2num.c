#include <ctype.h>

#include <stdio.h>

#define print printf

void num2string(int num, int base, char *resp)

{
    int i=0;
    char a[128];
    int tmp;
    //print("%d, %d\n",num ,base);
    while(num>0){
        tmp = num%base;
   //     printf("TEMP = %d\n",tmp);
        if(tmp>9) a[i]='A'+tmp-10;
        else a[i]='0'+tmp;
        num=num/base;
        i++;
    }
    int i2=0;
    for(int i3=(i-1); i2<=i;i3--,i2++){
        resp[i2] = a[i3];
    }
    resp[i2]='0';
}


int main () {

  char buf[128];


  num2string(12132, 16, buf);

  printf("==> %s\n", buf);


  num2string(1024, 16, buf);

  printf("==> %s\n", buf);


  num2string(1024, 32, buf);

  printf("==> %s\n", buf);


  return 0;

}