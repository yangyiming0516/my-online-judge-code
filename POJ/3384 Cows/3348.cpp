#include<cstdio>
#include<algorithm>
using namespace std;
bool right(int a,int b,int c){
	return ((p[b].x-p[a].x)*(p[c].y-p[a].y)-(p[b].y-p[a].y)*(p[c].x-p[a].x)<0);
}	
double sq(int a,int b){
	return ((p[a].x-p[1].x)*(p[b].y-p[1].y)-(p[a].y-p[1].y)*(p[b].x-p[1].x))*0.5;
}
double sum;
int n,top,stack[10010];
	}	
	for (int i=3;i<top;i++)
		sum+=sq(stack[i-1],stack[i]);
	printf("%d\n",int(sum)/50);
	return 0;
}