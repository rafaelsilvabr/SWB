#include <stdio.h>

#define getsig(x) ((x)>>63 & 1)


typedef union {

double d;

unsigned long l;

} U;

double maxdouble(double a, double b)

{

    U u1,u2;

    u1.d=a;
    u2.d=b;

    int sig1=getsig(u1.l);
    int sig2=getsig(u2.l);
    if(getsig(u1.l)!=getsig(u2.l)){
        if(sig1==1 && sig2==0) return u2.d;
        if(sig2==1 && sig1==0) return u1.d;
    }

    for(int i=62; i>=0; i--){
        int tmp1 = (u1.l>>i)&1;
        int tmp2 = (u2.l>>i)&1;

        if(sig1==0 && sig2==0){
            if(tmp1!=tmp2){
                if(tmp1 > tmp2) return u1.d;
                else return u2.d;
            }
        }else{
            if(tmp1!=tmp2){
                if(tmp1 > tmp2) return u2.d;
                else return u1.d;
            }            
        }
    }
    return 0;
}


int main()

{

   double a,b;


   a = 1.0;

   b = 2.0;

   printf("maior de %f %f = %f\n", a,b, maxdouble(a,b));


   a = -1.0;

   b = -2.0;

   printf("maior de %f %f = %f\n", a,b, maxdouble(a,b));


   a = 1.0;

   b = -2.0;

   printf("maior de %f %f = %f\n", a,b, maxdouble(a,b));


   a = 1.5;

   b = 1.75;

   printf("maior de %f %f = %f\n", a,b, maxdouble(a,b));


   a = -1.5;

   b = -1.75;

   printf("maior de %f %f = %f\n", a,b, maxdouble(a,b));


   a = -1.5;

   b = -2.5;

   printf("maior de %f %f = %f\n", a,b, maxdouble(a,b));


   a = 1.5;

   b = -1.75;

   printf("maior de %f %f = %f\n", a,b, maxdouble(a,b));


   return 0;

}