/*
ID:yangyim1
PROG:stamps
LANG:C++
*/
#include<cstdio>
int A[50],F[2000001],K,N;
int main(){
    freopen("stamps.in","r",stdin);
    freopen("stamps.out","w",stdout);
    scanf("%d%d",&K,&N);
    for (int i=0;i<N;i++)
        scanf("%d\n",&A[i]);
    for (int i=1;i<=2000000;i++){
        F[i]=0x7fffffff;
        for (int j=0;j<N;j++)
            if (i>=A[j]&&F[i-A[j]]<F[i]) F[i]=F[i-A[j]];
        if (F[i]>=K) {printf("%d\n",i-1);break;}
        ++F[i];
    }
    return 0;
}
            
