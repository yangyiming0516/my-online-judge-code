#include<cstdio>
#include<cmath>
#include<algorithm>
using namespace std;
const double esp=1e-8;
double x[300],y[300];
int turn(int a,int b,int c){
	double res=(x[b]-x[a])*(y[c]-y[a])-(y[b]-y[a])*(x[c]-x[a]);
	if (fabs(res)<esp)	return 0;
	if (res>0) return 1;else return -1;
}		
double dis(int a,int b){
	return fabs((x[a]-x[0])*(y[b]-y[0])-(y[a]-y[0])*(x[b]-x[0]))/sqrt((x[a]-x[b])*(x[a]-x[b])+(y[a]-y[b])*(y[a]-y[b]));
}	
int n,temp;
bool flag;
double r,mins;
int main(){
	while (~scanf("%d",&n)){
		if (n<3) break;
		scanf("%lf%lf%lf",&r,&x[0],&y[0]);
		for (int i=1;i<=n;i++)
			scanf("%lf%lf",&x[i],&y[i]);
		temp=turn(n,1,2);	flag=false;
		for (int i=1;i<=n-2;i++)
			if (turn(i,i+1,i+2)*temp<0) {flag=true;break;}
		if (turn(n-1,n,1)*temp<0) flag=true;
		if (flag) printf("HOLE IS ILL-FORMED\n");
		else {
				temp=turn(n,1,0);flag=false;
				for (int i=1;i<n;i++)
					if (turn(i,i+1,0)*temp<0){flag=true;break;}
				if (flag) printf("PEG WILL NOT FIT\n");
				else{
					mins=dis(n,1);
					for (int i=1;i<n;i++)
						mins=min(dis(i,i+1),mins);
					if (r>mins) printf("PEG WILL NOT FIT\n"); else printf("PEG WILL FIT\n");	
				}
			}
		}
	return 0;
}
