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


float float2(float f)
{
    U value ;
    value.f= f;

    unsigned int sig = getsig(value.i);
    unsigned int exp = getexp(value.i);
    unsigned int frac = getfrac(value.i);
    
    value.i=makefloat(sig,(exp+1),frac);
    return value.f;
}

int main(){
    float value = -2.5;
    printf("%f, %f\n",value,float2(value));
}