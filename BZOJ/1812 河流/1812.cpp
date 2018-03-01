#include<cstdio>
#include<cstring>
#include<algorithm>
using namespace std;
struct treetype{
	int son;
	int brother;
	treetype(){son=-1;brother=-1;}
};	
treetype tree[101];
int w[101],d[101],F[101][51][101],dis[101],H[102],n,k,v;
void dfs(int x){
	int p=tree[x].son;
	while (p!=-1){
		dis[p]=dis[x]+d[p];
		dfs(p);
		p=tree[p].brother;
	}
}	
void make(int x){
	H[x]=1;
	if (tree[x].son!=-1){
		make(tree[x].son);
		H[x]+=H[tree[x].son];
	}	
	if (tree[x].brother!=-1){
		make(tree[x].brother);
		H[x]+=H[tree[x].brother];
	}
}	
int dp(int x,int num,int father){
	if (F[x][num][father]>-1) return F[x][num][father];
	if (tree[x].son==-1&&tree[x].brother==-1)
		if (num==0) return w[x]*(dis[x]-dis[father]);
			else return 0;
	int temp=0x7fffffff;			
	if (tree[x].son==-1){
		if (num>0&&num-1<=H[tree[x].brother]) temp=min(temp,dp(tree[x].brother,num-1,father));
		if (num<=H[tree[x].brother])  temp=min(dp(tree[x].brother,num,father)+w[x]*(dis[x]-dis[father]),temp);
		F[x][num][father]=temp;	
		return temp;	
	}		
	if (tree[x].brother==-1){
		if (num>0&&num-1<=H[tree[x].son]) temp=min(temp,dp(tree[x].son,num-1,x));
		if (num<=H[tree[x].son]) temp=min(temp,dp(tree[x].son,num,father)+w[x]*(dis[x]-dis[father]));
		F[x][num][father]=temp;	
		return temp;
	}	
	for (int i=min(num,H[tree[x].son]);i>=0;i--){
		if (num-i<=H[tree[x].brother])
			temp=min(temp,dp(tree[x].son,i,father)+dp(tree[x].brother,num-i,father)+w[x]*(dis[x]-dis[father]));
		if (num-i-1>=0&&num-i-1<=H[tree[x].brother])
			temp=min(temp,dp(tree[x].son,i,x)+dp(tree[x].brother,num-i-1,father));
	}	
	F[x][num][father]=temp;	
	return temp;	
}	
int main(){
	scanf("%d%d",&n,&k);
	for (int i=1;i<=n;i++){
		scanf("%d%d%d",&w[i],&v,&d[i]);
		tree[i].brother=tree[v].son;
		tree[v].son=i;
	}
	memset(F,-1,sizeof(F));
	dfs(0);
	make(0);
	printf("%d\n",dp(0,k,0));
	return 0;
}
