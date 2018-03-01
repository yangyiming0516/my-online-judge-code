#include<cstdio>
#include<algorithm>
using namespace std;
struct node{
    int x,y;
}    now,stack[100010];
double ans;
int n,k,sum[100010],head,tail;
long long xmul(node a,node b,node c){
    return (long long)((b.x-a.x)*(c.y-a.y)-(b.y-a.y)*(c.x-a.x));
}    
int main(){
    while(~scanf("%d%d",&n,&k)){
        sum[0]=0;
        for (int i=1;i<=n;i++){
            scanf("%d",&sum[i]);
            sum[i]+=sum[i-1];
        }
        head=0;tail=-1;ans=0.0;
        for (int i=k;i<=n;i++){
            now.x=i-k;now.y=sum[i-k];
            while (head<tail&&xmul(stack[tail-1],stack[tail],now)<=0) tail--;
            stack[++tail]=now;    
            while (head<tail&&(long long)(sum[i]-stack[head].y)*(i-stack[head+1].x)<=(long long)(sum[i]-stack[head+1].y)*(i-stack[head].x)) head++;
            ans=max(ans,(double)(sum[i]-stack[head].y)/(i-stack[head].x));    
        }
        printf("%.2lf\n",ans);
    }
    return 0;
}
