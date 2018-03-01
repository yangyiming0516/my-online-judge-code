#include<cstdio>
#include<cstring>
struct edge{
	edge *next;
	int point;
};	
int value[201],F[201][201],N,M,a,b;
edge *g[201];
void insert(int from,int to){
	edge *p=new edge;
	(*p).next=g[from];
	g[from]=p;
	(*p).point=to;
};	
void dfs(int x,int v){
	edge *p=g[x];
	while (p!=NULL){
		for (int i=v+1;i<=M;i++) F[(*p).point][i]=F[x][i-1]+value[(*p).point];
		dfs((*p).point,v+1);
		for (int i=v+1;i<=M;i++) if (F[(*p).point][i]>F[x][i]) F[x][i]=F[(*p).point][i];
		p=(*p).next;
	}
}	
int main(){
	while (~scanf("%d%d",&N,&M)){
		if (N==0) break;
		M++;	
		memset(g,0,sizeof(g));
		for (int i=1;i<=N;i++){
			scanf("%d%d",&a,&b);
			insert(a,i);
			value[i]=b;
		}
		memset(F,0,sizeof(F));
		dfs(0,1);
		printf("%d\n",F[0][M]);
	}
	return 0;
}
