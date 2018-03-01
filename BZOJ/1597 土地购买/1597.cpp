#include<cstdio>
#include<algorithm>
using namespace std;
struct earth{
	long long x,y;
} p[50010],s[50010];
bool cmp(earth a,earth b){
	if (a.x==b.x) return a.y<b.y;
	return a.x<b.x;
}	
long long F[50010];
int D[50010],N,top,L,R;
inline long long xmul(int a,int b,int c){
	return (-s[b+1].y+s[a+1].y)*(F[c]-F[a])-(F[b]-F[a])*(-s[c+1].y+s[a+1].y);
}	
int main(){
	scanf("%d",&N);
	for (int i=1;i<=N;i++)
		scanf("%d%d",&p[i].x,&p[i].y);
	sort(p+1,p+N+1,cmp);
	for (int i=1;i<=N;i++){
		while (top>0&&p[i].y>=s[top].y) top--;
		s[++top]=p[i];
	}
	for (int i=1;i<top;i++){
		while (L<R&&F[D[L]]+s[i].x*s[D[L]+1].y>=F[D[L+1]]+s[i].x*s[D[L+1]+1].y) L++;
		F[i]=F[D[L]]+s[i].x*s[D[L]+1].y;
		while (L<R&&xmul(D[R-1],D[R],i)<=0) R--;
		D[++R]=i;
	}
	while (L<R&&F[D[L]]+s[top].x*s[D[L]+1].y>=F[D[L+1]]+s[top].x*s[D[L+1]+1].y) L++;
	printf("%lld\n",F[D[L]]+s[top].x*s[D[L]+1].y);
	return 0;
}
