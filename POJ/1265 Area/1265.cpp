#include<cstdio>
#include<cstdlib>
using namespace std;
int points(int a,int b){
	int r;
	while (b!=0){
		r=b;
		b=a%b;
		a=r;
	}
	return a;
}	
int tempx,tempy,nowx,nowy,sq,sum,n,T;
int main(){
	scanf("%d",&T);
	for (int j=1;j<=T;j++){
		scanf("%d",&n);
		tempx=0;tempy=0;sq=0;sum=0;
		for (int i=1;i<=n;i++){
			scanf("%d%d",&nowx,&nowy);
			sum+=points(abs(nowx),abs(nowy));
			nowx+=tempx;nowy+=tempy;
			sq+=tempx*nowy-tempy*nowx;
			tempx=nowx;tempy=nowy;
		}	
		sq=abs(sq);
		printf("Scenario #%d:\n%d %d %.1f\n\n",j,(sq-sum)/2+1,sum,sq*0.5);
	}
	return 0;
}

