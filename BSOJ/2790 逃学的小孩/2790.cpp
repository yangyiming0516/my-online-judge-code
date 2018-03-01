#include<cstdio>
#include<cstring>
int N,M,a,b,c,h[200010];
bool got[200010];
long long f[200010][3];
struct edge{
	int data;
	int point;
	edge *next;
};
edge *g[200010];
inline void update(int father,int son,long long value){
	if (value>f[father][0]){
		h[father]=son;
		f[father][2]=f[father][1];
		f[father][1]=f[father][0];
		f[father][0]=value;
	}else
		if (value>f[father][1]){
			f[father][2]=f[father][1];
			f[father][1]=value;
		} else 
			if (value>f[father][2]) f[father][2]=value;
};		
inline void insert(int from,int to,int L){
	edge *p=new edge;
	(*p).data=L;
	(*p).point=to;
	(*p).next=g[from];
	g[from]=p;
};	
void dfs(int x){
	got[x]=true;
	edge *p=g[x];
	while (p!=NULL){
		if (!got[(*p).point]){
		dfs((*p).point);
		update(x,(*p).point,f[(*p).point][0]+(*p).data);
		}	
		p=(*p).next;
	}
};
void dp(int x){
	got[x]=true;
	edge *p=g[x];
	while (p!=NULL){
		if (!got[(*p).point]){
			if ((*p).point==h[x]) update((*p).point,x,f[x][1]+(*p).data);
				else  update((*p).point,x,f[x][0]+(*p).data);
			dp((*p).point);
		}
		p=(*p).next;
	}
};	
int main(){
	scanf("%d%d",&N,&M);
	for (int i=1;i<=M;i++){
		scanf("%d%d%d",&a,&b,&c);
		insert(a,b,c);
		insert(b,a,c);
	}
	int root=N/2;
	dfs(root);
	memset(got,0,sizeof(got));
	dp(root);
	long long ans=0;
	for (int i=1;i<=N;i++)
		if (f[i][0]+2*f[i][1]+f[i][2]>ans) ans=f[i][0]+2*f[i][1]+f[i][2];
	printf("%I64d\n",ans);		
	return 0;
}
