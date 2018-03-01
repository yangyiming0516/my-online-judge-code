#include<cstdio>
struct point{
	long long x,y;
} now,D[50010];
int L,R,N,W;
long long C[500010];
inline long long xmul(point a,point b,point c){
	return (b.x-a.x)*(c.y-a.y)-(b.y-a.y)*(c.x-a.x);
}	
int main(){
	scanf("%d%d",&N,&W);
	for (int i=1;i<=N;i++){
		scanf("%lld",&C[i]);
		C[i]+=C[i-1];
	}
	for (int i=1;i<=N;i++){
		while (L<R&&D[L].y-2*(i+C[i]-W-1)*D[L].x>=D[L+1].y-2*(i+C[i]-W-1)*D[L+1].x) L++;
		now.x=i+C[i];now.y=D[L].y-2*(i+C[i]-W-1)*D[L].x+(i+C[i]-W-1)*(i+C[i]-W-1)+(i+C[i])*(i+C[i]);
		while (L<R&&xmul(D[R-1],D[R],now)<=0) R--;
		D[++R]=now;
	}
	printf("%lld\n",D[R].y-(N+C[N])*(N+C[N]));
	return 0;
}
