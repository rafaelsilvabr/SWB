#include <stdio.h>

#include <math.h>

#include <limits.h>


#define getsig(x) ((x)>>31 & 1)

#define getexp(x) ((x)>>23 & 0xff)

#define getfrac(x) ((x) & 0x7fffff)

#define makefloat(s,e,f) ((s & 1)<<31 | (((e) & 0xff) << 23) | ((f) & 0x7fffff))


typedef union {

float f;

unsigned int i;

} U;

int float2int(float f)

{
    if(f==0) return 0;
    U u;
    u.f = f;
    unsigned int sig = getsig(u.i);
    int exp = getexp(u.i);
    int frac = getfrac(u.i);
    int E = exp-127;
    //printf("1 -- Sig %d, Exp %d, Frac %x\n",sig,exp,frac);
    frac = frac^(1<<23);
    if(E<=23){
        frac = frac>>(23-E);
        frac = (sig) ? -frac : frac;
    }
    else if(E<=30){
        frac = frac<<(E-23);
        frac = (sig) ? -frac : frac;     
    }else if(sig==0){
        return INT_MAX;
    }else{
        return INT_MIN;
    }
}

int main()

{

float f;

printf("\n******** float2int ****************\n");

f = 0.0;

printf(" %+10.4f -> %d\n", f, float2int(f));

f = 1.0;

printf(" %+10.4f -> %d\n", f, float2int(f));

f = -1.0;

printf(" %+10.4f -> %d\n", f, float2int(f));

f = 12345.0;

printf(" %+10.4f -> %d\n", f, float2int(f));

f = -12345.0;

printf(" %+10.4f -> %d\n", f, float2int(f));

f = 1.5;

printf(" %+10.4f -> %d\n", f, float2int(f));

f = 2.5;

printf(" %+10.4f -> %d\n", f, float2int(f));

f = 2.4;

printf(" %+10.4f -> %d\n", f, float2int(f));

f = 0.5;

printf(" %+10.4f -> %d\n", f, float2int(f));

f = (float)pow(2,31);

printf(" %+10.4f (2^31) = overflow -> %d\n", f, float2int(f));

f = -f;

printf(" %+10.4f (-2^31) -> %d\n", f, float2int(f));

f = (float)pow(2,32);

f = -f;

printf(" %+10.4f (-2^32 = overflow) -> %d\n", f, float2int(f));

return 0;

}