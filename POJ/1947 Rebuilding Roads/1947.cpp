#include<cstdio>
#include<iostream>
using namespace std;
struct edge{
	int point;
	edge *next;
};
edge *g[151];
int N,P,x,y,root,F[151][151],goin[151];
int INF=200;
void insert(int father,int son){
	edge *p=new edge;
	goin[son]++;
	(*p).point=son;
	(*p).next=g[father];
	g[father]=p;
}	
void dp(int x){
	edge *p=g[x];
	F[x][1]=0;
	while (p!=NULL){
		dp((*p).point);
		for (int i=P;i>0;i--){
			if (F[x][i]==INF) continue;
			for (int j=1;j<=P-i;j++){
				if (F[(*p).point][j]==INF) break;
				if (F[(*p).point][j]+F[x][i]<F[x][i+j]) F[x][i+j]=F[(*p).point][j]+F[x][i];
			}	
			F[x][i]++;
		}	
		p=(*p).next;
	}
}	
int main(){
	scanf("%d%d",&N,&P);
	for (int i=1;i<N;i++){
		scanf("%d%d",&x,&y);
		insert(x,y);
	}
	for (int i=1;i<=N;i++)
		if (goin[i]==0) root=i;
	fill(&F[0][0],&F[151][151]+1,INF);
	dp(root);		
	int ans=F[root][P];
	for (int i=1;i<=N;i++)
		if (F[i][P]!=INF&&F[i][P]+1<ans) ans=F[i][P]+1;
	printf("%d\n",ans);
	return 0;
}
