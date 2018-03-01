#include<cstdio>
#include<algorithm>
using namespace std;
const int INF=0x7fffffff;
struct edge{
	int point;
	int data;
	edge *next;
};
bool ed[301];
edge *g[301];
int F[2][301][301],num[301],N,M,K,a,b,c;
void insert(int from,int to,int value){
	edge *p=new edge;
	(*p).data=value;
	(*p).point=to;
	(*p).next=g[from];
	g[from]=p;
}	
void cal(int x){
	ed[x]=true;
	edge *p=g[x];
	num[x]=1;
	while (p!=NULL){
		if (!ed[(*p).point]){
			cal((*p).point);
			num[x]+=num[(*p).point];
		}	
		p=(*p).next;
	}
}	
void DP(int x){
	ed[x]=false;
	int now=0,son;
	F[1][x][0]=0;F[0][x][0]=0;
	edge *p=g[x];
	while (p!=NULL){
		if (ed[(*p).point]){
			DP((*p).point);
			son=(*p).point;
			now=min(now,K);
			for (int i=now;i>=0;i--){
				if (i+num[son]<=K){
					F[1][x][i+num[son]]=min(F[1][x][i+num[son]],F[1][x][i]+F[1][son][num[son]]+(*p).data);
					F[0][x][i+num[son]]=min(F[0][x][i+num[son]],F[0][x][i]+F[1][son][num[son]]);
				}	
				for (int j=min(K-i,num[son]-1);j>0;j--){
					F[1][x][i+j]=min(F[1][x][i+j],F[1][x][i]+min(F[0][son][j],F[1][son][j]+(*p).data));
					F[0][x][i+j]=min(F[0][x][i+j],F[0][x][i]+min(F[1][son][j],F[0][son][j]+(M==2?(*p).data:0)));
				}
				F[1][x][i]=F[1][x][i]+F[0][son][0];
				F[0][x][i]=F[0][x][i]+F[0][son][0]+(M==2?(*p).data:0);
			}	
			now+=min(K,num[son]);
		}
		p=(*p).next;
	}
	for (int i=num[x];i>0;i--) F[1][x][i]=F[1][x][i-1];
}	
int main(){
	scanf("%d%d%d",&N,&M,&K);
	for (int i=2;i<=N;i++){
		scanf("%d%d%d",&a,&b,&c);
		insert(a,b,c);
		insert(b,a,c);
	}
	if (K+M-1>N){
		printf("%d\n",-1);
		return 0;
	}	
	cal(1);		
	fill(&F[0][0][0],&F[1][N][K]+1,INF);
	DP(1);
	printf("%d\n",F[1][1][K]);
	return 0;
}
