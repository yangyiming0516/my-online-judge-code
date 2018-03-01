#include<cstdio>
#include<cstring>
int sum,miny,n,M,k,temp,st;
bool ed[51];
int x[51],y[51];
bool left(int a,int b,int c){
	return (x[b]-x[a])*(y[c]-y[a])-(y[b]-y[a])*(x[c]-x[a])>0;
}	
int main(){
	scanf("%d",&M);
	while (M--){
		scanf("%d",&n);
		miny=0x7fffffff;
		for (int i=1;i<=n;i++){
			scanf("%d",&k);
			scanf("%d%d",&x[k],&y[k]);
			if (y[k]<miny) {st=k;miny=y[k];}
		}	
		printf("%d",n);
		sum=0;memset(ed,0,sizeof(ed));
		while (sum<n){
			ed[st]=true;
			printf(" %d",st);
			int i;
			for (i=1;i<=n;i++)
				if (!ed[i]) break;
			temp=i;
			for(i++;i<=n;i++)
				if (!ed[i])
					if (left(st,i,temp)) temp=i;
			st=temp;
			sum++;
		}
		printf("\n");
	}
	return 0;
}
