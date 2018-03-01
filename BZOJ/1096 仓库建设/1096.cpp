#include<cstdio>
struct point{
	long long x,y;
} now,D[1000010];
int N,X[1000010],C,L,R;
long long sumP[1000010],sumXP[1000010],W[1000010];
inline long long xmul(point a,point b,point c){
	return (b.x-a.x)*(c.y-a.y)-(b.y-a.y)*(c.x-a.x);
}	
int main(){
	scanf("%d",&N);
	for (int i=1;i<=N;i++){
		scanf("%d%d%d",&X[i],&sumP[i],&C);
		sumXP[i]=sumXP[i-1]+X[i]*sumP[i];
		sumP[i]+=sumP[i-1];
		W[i]=C+X[i]*sumP[i]-sumXP[i];
	}
	for (int i=1;i<=N;i++){
		while (L<R&&D[L].y-D[L].x*X[i]>=D[L+1].y-D[L+1].x*X[i]) L++;
		now.x=sumP[i];now.y=sumXP[i]+D[L].y-D[L].x*X[i]+W[i];
		while (L<R&&xmul(D[R-1],D[R],now)<=0) R--;
		D[++R]=now;
	}
	printf("%I64d\n",D[R].y-sumXP[N]);
	return 0;
}
