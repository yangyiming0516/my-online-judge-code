#include<cstdio>
#include<cmath>
#include<algorithm>
using namespace std;
double sum;
int n,L,stack[1010],top;
struct point{
	int x;
	int y;
}	p[1001];
double dis(int a,int b){
	return sqrt((double)(p[a].x-p[b].x)*(p[a].x-p[b].x)+(p[a].y-p[b].y)*(p[a].y-p[b].y));
}	
bool cmp(point q,point w){
	if (q.x<w.x) return true;
	if (q.x>w.x) return false;
	return (q.y<w.y);
}	
bool left(int a,int b,int c){
	return (p[b].x-p[a].x)*(p[c].y-p[a].y)-(p[b].y-p[a].y)*(p[c].x-p[a].x)>0;
}	
int main(){
	scanf("%d%d",&n,&L);	
	for (int i=1;i<=n;i++)
		scanf("%d%d",&p[i].x,&p[i].y);
	sort(p+1,p+n+1,cmp);
	stack[++top]=1;
	stack[++top]=2;
	for (int i=3;i<=n;i++){
		while (top>1&&left(stack[top-1],stack[top],i)) top--;
		stack[++top]=i;
	}
	for (int i=n-1;i>0;i--){
		while (left(stack[top-1],stack[top],i)) top--;
		stack[++top]=i;
	}
	for (int i=1;i<top;i++) sum+=dis(stack[i],stack[i+1]);
	sum+=2*3.1415926535898*L;
	printf("%.0lf\n",sum);
	return 0;
}
