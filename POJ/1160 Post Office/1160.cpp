#include<cstdio>
int x[301],sum[301],f[35][310],s[35][310],V,P,temp;  
inline int cal(int a,int b){
   int k=(a+b)/2;    
   return -sum[k-1]+sum[a-1]+sum[b]-sum[k]+x[k]*(k+k-a-b);
}    
int main(){
    scanf("%d%d",&V,&P);
    for (int i=1;i<=V;i++){
        scanf("%d",&x[i]);
        sum[i]=x[i]+sum[i-1];
    }
    for (int i=1;i<=P;i++)s[i][i]=i-1;
    for (int i=P+1;i<=V;i++) s[P+1][i]=i-1;
    for (int h=1;h<=V-P;h++){
        f[1][1+h]=cal(1,h+1);
        s[1][h+1]=1;
        for (int i=2;i<=P;i++){
          f[i][i+h]=0x7fffffff;  
          for (int j=s[i][i+h-1];j<=s[i+1][i+h];j++){
              temp=f[i-1][j]+cal(j+1,i+h);
              if (temp<=f[i][i+h]){
                f[i][i+h]=temp;
                s[i][i+h]=j;
              }
          }
        } 
    }
    printf("%d\n",f[P][V]);
    return 0;
}
