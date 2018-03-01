#include<cstdio>
#include<cmath>
int T,k,tempx,tempy,nowx,nowy;
long long sum;
int main(){
	scanf("%d",&T);
	getchar();
	while (T--){
		tempx=0;tempy=0;
		sum=0;
		k=getchar();
		while (k!='5'){
			switch (k){
				case '8':nowx=tempx;nowy=tempy+1;break;
				case '2':nowx=tempx;nowy=tempy-1;break;
				case '4':nowx=tempx-1;nowy=tempy;break;
				case '6':nowx=tempx+1;nowy=tempy;break;
				case '1':nowx=tempx-1;nowy=tempy-1;break;
				case '3':nowx=tempx+1;nowy=tempy-1;break;
				case '7':nowx=tempx-1;nowy=tempy+1;break;
				case '9':nowx=tempx+1;nowy=tempy+1;break;
			}
			sum+=tempx*nowy-tempy*nowx;
			tempx=nowx;tempy=nowy;
			k=getchar();
		}
		getchar();
		sum=(sum>0)?sum:-sum;
		printf("%lld",sum/2);
		if (sum%2!=0) printf(".5");
		printf("\n");	
	}
	return 0;
}
