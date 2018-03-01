#include<cstdio>
#include<cstring>
int n,m,L,R,mid,ans[5002],x1,x2,y1,y2,x,y,u[5002],d[5002];
int main(){
	while (~scanf("%d",&n)){
		if (n==0) break;
		memset(ans,0,sizeof(ans));
		scanf("%d%d%d%d%d",&m,&x1,&y1,&x2,&y2);
		y1-=y2;
		u[0]=d[0]=0;
		for (int i=1;i<=n;i++){
			scanf("%d%d",&u[i],&d[i]);
			u[i]-=d[i];
		}	
		u[n+1]=0;d[n+1]=x2;
		for (int i=0;i<m;i++){
			scanf("%d%d",&x,&y);
			L=0;R=n+1;
			while (L+1<R){
				mid=(L+R)>>1;
				if (u[mid]*(y-y2)-y1*(x-d[mid])<0) L=mid;
					else R=mid;
			}
			ans[L]++;
		}
		for (int i=0;i<=n;i++)
			printf("%d: %d\n",i,ans[i]);
		printf("\n");	
	}
	return 0;
}