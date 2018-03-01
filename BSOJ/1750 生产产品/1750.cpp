#include<cstdio>
const int maxlongint=0x7FFFFFFF;
struct node{
	int data;
	int pos;
};	
int M,N,P,K,S,temp;
int L[6],R[6],F[6],sum[6][100010];
node D[6][100010];
void init(){
	scanf("%d%d%d%d",&M,&N,&K,&P);
	for (int i=1;i<=N;i++)
		for (int j=1;j<=M;j++){
			scanf("%d",&S);
		sum[i][j]=sum[i][j-1]+S;
	}
	for (int i=1;i<=N;i++){
		L[i]=R[i]=0;
		D[i][0].data=-K;
		D[i][0].pos=0;
	}	
};	
int main(){
	init();
	for (int i=1;i<=M;i++){
		for (int j=1;j<=N;j++){
			while (i-D[j][L[j]].pos>P) L[j]++;
			F[j]=D[j][L[j]].data+sum[j][i]+K;
		}
		for (int j=1;j<=N;j++){
			temp=maxlongint;
			for (int w=1;w<=N;w++)
				if (w!=j) 
					if (temp>F[w]) temp=F[w];
			while (L[j]<=R[j]&&D[j][R[j]].data>temp-sum[j][i]) R[j]--;
			D[j][++R[j]].data=temp-sum[j][i];
			D[j][R[j]].pos=i;
		}
	}
	temp=maxlongint;
	for (int i=1;i<=N;i++)
		if (temp>F[i]) temp=F[i];
	printf("%d",temp);		
	return 0;
}