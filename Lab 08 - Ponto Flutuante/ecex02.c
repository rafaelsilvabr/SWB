#include <stdio.h>

#include <math.h>


#define getsig(i)        ((i)>>31 & 1)

#define getexp(i)        ((i)>>23 & 0xff)

#define getfrac(i)       ((i) & 0x7fffff)

#define makefloat(s,e,f) ( (((s) & 1) << 31) | (((e) & 0xff) << 23) | ((f) & 0x7fffff) )


typedef union {

  float f;

  unsigned int i;

} U;

float int2float(int i)

{
    if(i==0)return 0;

    unsigned int sig=0,exp=0;
    if(i<0){
        sig=1;
        i=-i;
    }
    unsigned int tmp = i;
    while(tmp!=1){
        tmp=tmp>>1;
        exp++;
    }

    unsigned int f = i ^ (1<<(exp+1));
    
    if(exp<23){
        f=f<<(23-exp);
    }
    if(exp>23){
        f=f>>(exp-23);
    }
    U u;
    u.i=makefloat(sig,exp+127,f);
    return u.f;
}


int main() {

   int i;


   printf("\n******** int2float ****************\n");


   i = 0;

   printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));


   i = 1;

   printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));


   i = -1;

   printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));


   i = 0x7fffffff;

   printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));


   i = -i;

   printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));


   i = 12345;

   printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));


   i = -12345;

   printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));


   return 0;

}