#include<cstdio>
struct node{
	int x;
	int y;
};
node p1,p2,p3,p4;
double fx,fy;
int N,a1,b1,c1,a2,b2,c2;
long long turn(node a,node b,node c){
	return (long long)(b.x-a.x)*(c.y-a.y)-(b.y-a.y)*(c.x-a.x);
}	
int main(){
	scanf("%d",&N);
	printf("INTERSECTING LINES OUTPUT\n");
	while (N--){
		scanf("%d%d%d%d%d%d%d%d",&p1.x,&p1.y,&p2.x,&p2.y,&p3.x,&p3.y,&p4.x,&p4.y);
		if (turn(p1,p2,p3)==0&&turn(p1,p2,p4)==0) printf("LINE\n");
			else
				if ((long long)(p1.x-p2.x)*(p3.y-p4.y)-(p1.y-p2.y)*(p3.x-p4.x)==0) printf("NONE\n");
					else
					{
						a1=p1.y-p2.y;a2=p3.y-p4.y;
						b1=p2.x-p1.x;b2=p4.x-p3.x;
						c1=p1.x*p2.y-p2.x*p1.y;c2=p3.x*p4.y-p4.x*p3.y;
						fy=(double)(a2*c1-a1*c2)/(a1*b2-a2*b1);
						fx=(double)(b2*c1-b1*c2)/(a2*b1-a1*b2);
						printf("POINT %.2lf %.2lf\n",fx,fy);	
					}	
	}
	printf("END OF OUTPUT\n");
	return 0;
}
