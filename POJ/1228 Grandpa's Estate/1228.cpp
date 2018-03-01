#include<cstdio>
#include<algorithm>
#include<cmath>
using namespace std;
const double esp=1e-8;
struct point{
	double x;
	double y;
}	p[1001];
bool cmp(point a,point b){
	if (a.y<b.y) return true;
	if (a.y>b.y) return false;
	return a.x<b.x;
}	
double xm(int a,int b,int c){
	return (p[b].x-p[a].x)*(p[c].y-p[a].y)-(p[b].y-p[a].y)*(p[c].x-p[a].x);
}	
bool turnright(int a,int b,int c){
	return xm(a,b,c)<-esp;
}	
int T,n,top,stack[2001];
int main(){
	scanf("%d",&T);
	while (T--){
		scanf("%d",&n);
		for (int i=1;i<=n;i++)
			scanf("%lf%lf",&p[i].x,&p[i].y);
		sort(p+1,p+n+1,cmp);	
		top=0;stack[++top]=1;stack[++top]=2;
		for (int i=3;i<=n;i++){
			while (top>1&&turnright(stack[top-1],stack[top],i)) top--;
			stack[++top]=i;
		}
		for (int i=n-1;i>0;i--){
			while (turnright(stack[top-1],stack[top],i)) top--;
			stack[++top]=i;
		}
		bool flag=false;
		if (fabs(xm(stack[1],stack[top/2],stack[top-1]))<esp) printf("NO\n");else{
		for (int i=3;i<=top;i++)
			if (fabs(xm(stack[i-2],stack[i-1],stack[i]))<esp) flag=true;
				else if (flag) flag=false;else break;
		if (flag) printf("YES\n"); else printf("NO\n");
		}
	}
	return 0;
}		
