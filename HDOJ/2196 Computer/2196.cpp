#include<cstdio>
#include<cstring>
struct treetype{
	int child;
	int brother;
	int data;
};	
int f[10001][2],g[10001],from[10001],n,v,s;
treetype tree[10001];
void init(){
	for (int i=1;i<=n;i++){
		tree[i].child=0;
		tree[i].brother=0;
	memset(f,0,8*n);
	g[0]=0;
	}	
};
void dp(int x){
	int temp=tree[x].child;
	while (temp!=0){
		dp(temp);
		if (f[temp][0]+tree[temp].data>f[x][0]){
			f[x][1]=f[x][0];
			f[x][0]=f[temp][0]+tree[temp].data;
			from[x]=temp;
		}else
			if (f[temp][0]+tree[temp].data>f[x][1]) f[x][1]=f[temp][0]+tree[temp].data;
		temp=tree[temp].brother;
	}
};	
void dfs(int x){
	int temp=tree[x].child;
	while (temp!=0){
		if (from[x]==temp)
			g[temp]=f[x][1]+tree[temp].data;
		else g[temp]=f[x][0]+tree[temp].data;
		if (g[x]+tree[temp].data>g[temp]) g[temp]=g[x]+tree[temp].data;
		dfs(temp);
		temp=tree[temp].brother;
	}
};	
int main(){
	while (~scanf("%d",&n)){
		init();
		for (int i=2;i<=n;i++){
			scanf("%d%d",&s,&v);
			tree[i].data=v;
			tree[i].brother=tree[s].child;
			tree[s].child=i;
		}
		dp(1);
		dfs(1);
		for (int i=1;i<=n;i++)
			if (f[i][0]>g[i]) printf("%d\n",f[i][0]);
				else printf("%d\n",g[i]);
	}			
	return 0;
}
