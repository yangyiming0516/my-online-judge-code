#include<cstdio>
#include<algorithm>
using namespace std;struct point{	int x;	int y;} p[10010];	bool cmp(point a,point b){	if (a.y<b.y) return true;	if (a.y>b.y) return false;	return a.x<b.x;}	
bool right(int a,int b,int c){
	return ((p[b].x-p[a].x)*(p[c].y-p[a].y)-(p[b].y-p[a].y)*(p[c].x-p[a].x)<0);
}	
double sq(int a,int b){
	return ((p[a].x-p[1].x)*(p[b].y-p[1].y)-(p[a].y-p[1].y)*(p[b].x-p[1].x))*0.5;
}
double sum;
int n,top,stack[10010];int main(){	scanf("%d",&n);	for (int i=1;i<=n;i++)		scanf("%d%d",&p[i].x,&p[i].y);	sort(p+1,p+n+1,cmp);	stack[++top]=1;	stack[++top]=2;	for (int i=3;i<=n;i++){		while (top>1&&right(stack[top-1],stack[top],i)) top--;		stack[++top]=i;	}	for (int i=n-1;i>0;i--){		while (right(stack[top-1],stack[top],i)) top--;		stack[++top]=i;
	}	
	for (int i=3;i<top;i++)
		sum+=sq(stack[i-1],stack[i]);
	printf("%d\n",int(sum)/50);
	return 0;
}
