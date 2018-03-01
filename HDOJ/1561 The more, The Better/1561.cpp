#include<cstdio>
#include<cstring>
struct edge{
	int point;
	edge *next;
};	
int N,M,a,b,V[201],F[201][210];
edge *g[201];	
void insert(int fa,int so,int data){
	edge *p=new edge;
	(*p).point=so;
	(*p).next=g[fa];
	g[fa]=p;
	V[so]=data;
};	
void dp(int x){
	F[x][0]=0;
	edge *p=g[x];
	while (p!=NULL){
		dp((*p).point);
		for (int i=M;i>0;i--)
			for (int j=0;j<i;j++)
				if (F[x][j]!=-1&&F[(*p).point][i-j]!=-1&&F[x][j]+F[(*p).point][i-j]>F[x][i])
					F[x][i]=F[x][j]+F[(*p).point][i-j];
		p=(*p).next;
	}
	for (int i=M;i>=0;i--)
		if (F[x][i]!=-1) F[x][i+1]=F[x][i]+V[x];
};	
int main(){
	while (~scanf("%d%d",&N,&M)){
		if (N==0) break;
		memset(g,0,sizeof(g));	
		for (int i=1;i<=N;i++){
			scanf("%d%d",&a,&b);
			insert(a,i,b);
		}	
		memset(F,-1,sizeof(F));
		M++;
		dp(0);
		printf("%d\n",F[0][M]);
		}
	return 0;
}
