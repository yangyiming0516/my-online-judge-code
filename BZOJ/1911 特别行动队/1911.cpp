#include<cstdio>
struct point{
  long long x,y;
} now,D[1000010];  
long long sum[1000010];     
int L,R,n,a,b,c;
inline long long xmul(point p,point q,point s){
       return (q.x-p.x)*(s.y-p.y)-(q.y-p.y)*(s.x-p.x);
}       
int main(){
    scanf("%d",&n);
    scanf("%d%d%d",&a,&b,&c);
    for (int i=1;i<=n;i++){
        scanf("%d",&sum[i]);
        sum[i]+=sum[i-1];
        }    
    L=R=0;D[0].x=0;D[0].y=0;
    for (int i=1;i<=n;i++){
        while (L<R&&D[L].y-(2*a*sum[i]+b)*D[L].x<=D[L+1].y-(2*a*sum[i]+b)*D[L+1].x) L++;
        now.x=sum[i];now.y=D[L].y-(2*a*sum[i]+b)*D[L].x+2*a*sum[i]*sum[i]+b*sum[i]+c;
        while (L<R&&xmul(D[R-1],D[R],now)>=0) R--;
        D[++R]=now;
    }
    printf("%lld\n",D[R].y-a*sum[n]*sum[n]);
    return 0;
}
       
