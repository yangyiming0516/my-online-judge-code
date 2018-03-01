#include<cstdio>
#include<cmath>
#include<cstring>
#include<algorithm>
using namespace std;
const double esp=1e-8;
int cmp(double a){
	if (fabs(a)<esp) return 0;
	if (a>0) return 1;else return -1;
}		
double x[200001],y[200001];
int n;	
bool flag,top[100001];
bool under(int u,int v){
	return max(x[u],x[u+1])>=min(x[v],x[v+1])&&max(x[v],x[v+1])>=min(x[u],x[u+1])&&
	max(y[u],y[u+1])>=min(y[v],y[v+1])&&max(y[v],y[v+1])>=min(y[u],y[u+1])&&
	(cmp((x[u+1]-x[u])*(y[v]-y[u])-(y[u+1]-y[u])*(x[v]-x[u]))^cmp((x[u+1]-x[u])*(y[v+1]-y[u])-(y[u+1]-y[u])*(x[v+1]-x[u])))==-2&&
	(cmp((x[v+1]-x[v])*(y[u]-y[v])-(y[v+1]-y[v])*(x[u]-x[v]))^cmp((x[v+1]-x[v])*(y[u+1]-y[v])-(y[v+1]-y[v])*(x[u+1]-x[v])))==-2;
}	
int main(){
	while(~scanf("%d",&n)){
		if (n==0) break;
		for (int i=1;i<=2*n;i++)
			scanf("%lf%lf",&x[i],&y[i]);
		memset(top,0,sizeof(top));	
		for (int i=n-1;i>0;i--){
			flag=true;
			for(int j=i+1;j<=n;j++)
				if (under(2*j-1,2*i-1)) {flag=false;break;}
			if (flag) top[i]=true;
		}
		printf("Top sticks: ");	
		for (int i=1;i<n;i++)
			if (top[i]) printf("%d, ",i);
		printf("%d.\n",n);		
	}
	return 0;
}
