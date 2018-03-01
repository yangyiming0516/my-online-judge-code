#include<cstdio>
#include<algorithm>
using namespace std;
struct point{
	int x;
	int y;
}	p[50010];
int top,dis,n,op,stack[100010];
bool cmp(point a,point b){
	if (a.y<b.y) return true;
	if (a.y>b.y) return false;
	return (a.x<b.x);
}	
int xmult(int a,int b,int c){
	return (p[b].x-p[a].x)*(p[c].y-p[a].y)-(p[b].y-p[a].y)*(p[c].x-p[a].x);
}	
int dist(int a,int b){
	return (p[a].x-p[b].x)*(p[a].x-p[b].x)+(p[a].y-p[b].y)*(p[a].y-p[b].y);
}	
int main(){
	scanf("%d",&n);
	for (int i=1;i<=n;i++)
		scanf("%d%d",&p[i].x,&p[i].y);
	sort(p+1,p+n+1,cmp);
	stack[top]=1;stack[++top]=2;
	for (int i=3;i<=n;i++){
		while (top>0&&xmult(stack[top-1],stack[top],i)<=0) top--;
		stack[++top]=i;
	}
	int tmp=top;stack[++top]=n-1;
	for (int i=n-2;i>0;i--){
		while (top>tmp&&xmult(stack[top-1],stack[top],i)<=0) top--;
		stack[++top]=i;
	}
	op=1;
	for (int i=0;i<top;i++){
		while (xmult(stack[op],stack[i],stack[i+1])<xmult(stack[op+1],stack[i],stack[i+1]))
			op=(op+1)%top;
		dis=max(dis,max(dist(stack[i],stack[op]),dist(stack[i+1],stack[op+1])));
	}
	printf("%d\n",dis);
	return 0;
}
