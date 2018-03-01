#include<cstdio>
#include<algorithm>
using namespace std;
int num,n,m;
struct point{
	int x;
	int y;
}	p[60];
bool cmp(point a,point b){
	return (a.x*b.y)-(a.y*b.x)>0;
}	
int main(){
	scanf("0 0");
	while (~scanf("%d%d",&n,&m)){
		p[++num].x=n;
		p[num].y=m;
	}	
	printf("(0,0)\n");
	sort(p+1,p+num+1,cmp);
	for (int i=1;i<=num;i++)
		printf("(%d,%d)\n",p[i].x,p[i].y);
	return 0;
}	
