#include<cstdio>
struct point{
  int x,y;
} D[500010],now;
int sum[500010];
int N,M,L,R;
int xmul(point a,point b,point c){
     return (b.x-a.x)*(c.y-a.y)-(b.y-a.y)*(c.x-a.x);
}           
int main(){
    while (~scanf("%d%d",&N,&M)){
          sum[0]=0;
          for (int i=1;i<=N;i++){
              scanf("%d",&sum[i]);
              sum[i]+=sum[i-1];
           }
          L=R=0;D[0].x=0;D[0].y=0;
          for (int i=1;i<=N;i++){
              while (L<R&&D[L].y-2*sum[i]*D[L].x>=D[L+1].y-2*sum[i]*D[L+1].x) L++;
              now.x=sum[i];now.y=D[L].y-2*sum[i]*D[L].x+M+2*sum[i]*sum[i];
              while (L<R&&xmul(D[R-1],D[R],now)<=0) R--;
              D[++R]=now;
          }
          printf("%d\n",D[R].y-sum[N]*sum[N]);
    }    
    return 0;
}
    
              
