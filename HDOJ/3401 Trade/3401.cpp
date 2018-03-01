#include<cstdio>
#include<iostream>
#include<algorithm>
using namespace std;
int f[2012][2012],D[2012];
int t,T,MaxP,W,L,R,AP[2012],BP[2012],AS[2012],BS[2012];
void initer(){
	fill(&f[0][0],&f[W+1][MaxP]+1,-2100000000);
	for (int k=1;k<W+2;k++){
		for (int j=0;j<=AS[k];j++)
			f[k][j]=max(-AP[k]*j,f[k-1][j]);
		for (int j=AS[k]+1;j<=MaxP;j++)
			f[k][j]=f[k-1][j];
	}	
};		
void init(int x){
	for (int j=0;j<=MaxP;j++)
		f[x][j]=f[x-1][j];
};	
void buy(int x){
	L=0;R=-1;
	for (int j=0;j<=MaxP;j++){
		while (L<=R&&f[x-W-1][D[R]]+D[R]*AP[x]<=f[x-W-1][j]+j*AP[x]) R--;
		D[++R]=j;
		while (j-D[L]>AS[x]) L++;
		f[x][j]=max(f[x][j],f[x-W-1][D[L]]-(j-D[L])*AP[x]);
	}
};
void sell(int x){
	L=0;R=-1;
	for (int j=MaxP;j>=0;j--){
		while (L<=R&&f[x-W-1][D[R]]+D[R]*BP[x]<=f[x-W-1][j]+j*BP[x]) R--;
		D[++R]=j;
		while (D[L]-j>BS[x]) L++;
		f[x][j]=max(f[x][j],f[x-W-1][D[L]]+(D[L]-j)*BP[x]);
	}
};	
int main(){
	scanf("%d",&t);
	while (t-->0){
		scanf("%d%d%d",&T,&MaxP,&W);
		for (int i=1;i<=T;i++)
			scanf("%d%d%d%d",&AP[i],&BP[i],&AS[i],&BS[i]);
		initer();
		for (int i=W+2;i<=T;i++){
			init(i);
			sell(i);
			buy(i);
		}
		printf("%d\n",f[T][0]);
	}
	return 0;
}
