/*
ID:yangyim1
PROG:inflate
LANG:C++
*/
#include<cstdio>
#include<algorithm>
using namespace std;
int f[10001],N,M,ans,minute[10001],point[10001];
int main(){
    freopen("inflate.in","r",stdin);
    freopen("inflate.out","w",stdout);
    scanf("%d%d",&M,&N);
    for (int i=1;i<=N;i++)
        scanf("%d%d",&point[i],&minute[i]);
    for (int i=1;i<=N;i++)
        for (int j=minute[i];j<=M;j++)
        f[j]=max(f[j],f[j-minute[i]]+point[i]);
    for (int i=1;i<=M;i++)
        ans=max(ans,f[i]);
    printf("%d\n",ans);
    return 0;
}
                
