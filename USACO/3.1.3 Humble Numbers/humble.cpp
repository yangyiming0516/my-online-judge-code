/*
ID:yangyim1
PROG:humble
LANG:C++
*/
#include<cstdio>
int S[100],humble[100001],min,K,N,x[100];
int main(){
    freopen("humble.in","r",stdin);
    freopen("humble.out","w",stdout);
    scanf("%d%d",&K,&N);
    for (int i=0;i<K;i++)
        scanf("%d",&S[i]);
    humble[0]=1;
    for (int i=1;i<=N;i++){
        min=0x7fffffff;
        for (int j=0;j<K;j++){
            while (S[j]*humble[x[j]]<=humble[i-1]) x[j]++;
            if (min>S[j]*humble[x[j]]) min=S[j]*humble[x[j]];
        }
        humble[i]=min;
    }
    printf("%d\n",humble[N]);
    return 0;
}
           
            
