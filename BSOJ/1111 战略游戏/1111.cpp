#include<cstdio>
#include<algorithm>
using namespace std;
struct edge{
	int point;
	edge *next;
};
edge *g[1500];
bool ed[1500];
int yes[1500],no[1500],N,h,k,a;
void insert(int from,int to){
	edge *p=new edge;
	(*p).next=g[from];
	(*p).point=to;
	g[from]=p;
};
void dp(int x){
	ed[x]=true;
	edge *p=g[x];
	while (p!=NULL){
		if (!ed[(*p).point]){
			dp((*p).point);
			yes[x]+=min(yes[(*p).point],no[(*p).point]);
			no[x]+=yes[(*p).point];
		}
		p=(*p).next;
	}
	yes[x]+=1;
}	
int main(){
	scanf("%d",&N);
	for (int i=1;i<=N;i++){
		scanf("%d%d",&h,&k);
		for (int j=1;j<=k;j++){
			scanf("%d",&a);
			insert(h,a);
			insert(a,h);
		}
	}
	dp(0);
	printf("%d\n",min(yes[0],no[0]));
	return 0;
}
