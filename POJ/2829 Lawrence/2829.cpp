#include<cstdio>
int x[1001],sum[1001],n,m,temp,s[1001][1001],f[1001][1001];
inline int cal(int a,int b){
  return x[b]-x[a-1]-sum[a-1]*(sum[b]-sum[a-1]);
}       
int main(){
    while (~scanf("%d%d",&n,&m)){
        if (n==0) break; 
        sum[0]=0;x[0]=0;
        for(int i=1;i<=n;i++){
          scanf("%d",&sum[i]);
          x[i]=x[i-1]+sum[i]*sum[i-1];
          sum[i]+=sum[i-1];    
        }
        for (int i=0;i<=m;i++) s[i][i+1]=i;
        for (int i=m+2;i<=n;i++) s[m+1][i]=i-1;    
        for (int h=2;h<=n-m;h++){
            f[0][h]=cal(1,h);
            for(int i=1;i<=m;i++){
             f[i][i+h]=0x7fffffff;       
             for (int j=s[i][i+h-1];j<=s[i+1][i+h];j++){
                 temp=f[i-1][j]+cal(j+1,i+h);
                 if (temp<f[i][i+h]){
                   f[i][i+h]=temp;
                   s[i][i+h]=j;
                 }
             } 
         }  
        } 
        printf("%d\n",f[m][n]);
    }
    return 0;
}
                  
