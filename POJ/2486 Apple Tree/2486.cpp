#include<cstdio>
#include<cstring>
struct edge{
	int point;
	edge *next;
};
int N,K,a,b,W[201],F[101][201],H[101][201];
bool ed[101];
edge *g[101];
void insert(int from,int to){
	edge *p=new edge;
	(*p).next=g[from];
	g[from]=p;
	(*p).point=to;
}	
void dp(int x){
	ed[x]=true;
	edge *p=g[x];
	while (p!=NULL){
		if (!ed[(*p).point]){
			dp((*p).point);
			for (int i=K;i>=2;i--)
				for (int j=0;j<=i-2;j+=2)
					if (F[(*p).point][j]+H[x][i-j-2]>H[x][i]) H[x][i]=F[(*p).point][j]+H[x][i-j-2];
			for (int i=K;i>=1;i--)
				for (int j=0;j<i;j+=2)
					if (F[x][j]+H[(*p).point][i-j-1]>H[x][i]) H[x][i]=F[x][j]+H[(*p).point][i-j-1];
			for (int i=(K/2)*2;i>=2;i-=2)
				for (int j=0;j<=i-2;j+=2)
					if (F[x][j]+F[(*p).point][i-j-2]>F[x][i]) F[x][i]=F[x][j]+F[(*p).point][i-j-2];
		}	
		p=(*p).next;
	}
	for (int i=0;i<=K;i+=2) F[x][i]+=W[x];
	for (int i=0;i<=K;i++) H[x][i]+=W[x];	
}	
int main(){
	while (~scanf("%d%d",&N,&K)){
		memset(ed,0,sizeof(ed));
		memset(g,0,sizeof(g));
		for (int i=1;i<=N;i++) scanf("%d",&W[i]);
		for (int i=1;i<N;i++){
			scanf("%d%d",&a,&b);
			insert(a,b);
			insert(b,a);
		}
	memset(F,0,sizeof(F));
	memset(H,0,sizeof(H));
	dp(1);
	printf("%d\n",H[1][K]);
	}	
	return 0;
}
