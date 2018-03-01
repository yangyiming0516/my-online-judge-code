#include<cstdio>
#include<algorithm>
using namespace std;
struct point{
	int x;
	int y;
};	
point p1,p2,p3,p4,ps,pe;
int n,x1,x2,y1,y2;
int cross(point x,point y,point z){
	return (y.x-x.x)*(z.y-x.y)-(y.y-x.y)*(z.x-x.x);
};	
bool in(point p){
	return min(x1,x2)<p.x&&max(x1,x2)>p.x&&min(y1,y2)<p.y&&max(y1,y2)>p.y;
};	
bool banana(point a1,point a2,point b1,point b2){
	if (min(a1.x,a2.x)>max(b1.x,b2.x)||min(a1.y,a2.y)>max(b1.y,b2.y)||min(b1.x,b2.x)>max(a1.x,a2.x)||min(b1.y,b2.y)>max(a1.y,a2.y)) return false;
	return cross(a1,a2,b1)*cross(a1,a2,b2)<=0&&cross(b1,b2,a1)*cross(b1,b2,a2)<=0;
}	
int main(){
	//freopen("output.txt","w",stdout);
	scanf("%d",&n);
	for (int i=1;i<=n;i++){
		scanf("%d%d%d%d%d%d%d%d",&ps.x,&ps.y,&pe.x,&pe.y,&x1,&y1,&x2,&y2);
		p1.x=x1;p1.y=y1;
		p2.x=x1;p2.y=y2;
		p3.x=x2;p3.y=y2;
		p4.x=x2;p4.y=y1;
		if (banana(p1,p2,ps,pe)||banana(p2,p3,ps,pe)||banana(p3,p4,ps,pe)||banana(p4,p1,ps,pe)) printf("T\n");
			else if(in(ps)) printf("T\n");
				else printf("F\n");
	}			
	//fclose(stdout);
	return 0;
}
