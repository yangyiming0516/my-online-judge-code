/*
    ID:yangyim1
    PROG:agrinet
    LANG:C++
*/    
#include<cstdio>
#include<cstring>
bool ed[101];
int f[101],min,p,n,ans,a[101][101];
int main(){
	freopen("agrinet.in","r",stdin);
	freopen("agrinet.out","w",stdout);
    scanf("%d",&n);
    for (int i=1;i<=n;i++)
        for (int j=1;j<=n;j++)
        scanf("%d",&a[i][j]);
    memset(f,127,sizeof(f));  
    f[1]=0;  
    for (int k=1;k<=n;k++){
        min=0x7fffffff;
        for (int i=1;i<=n;i++)
            if (!ed[i]&&f[i]<min){    
            min=f[i];
            p=i;
        }    
        ed[p]=true;
        ans+=min;
        for (int i=1;i<=n;i++)
            if (a[p][i]<f[i]) f[i]=a[p][i];
    }
    printf("%d\n",ans);
    return 0;
}
            
