#include<cstdio>
#include<cstring>
int D[200010],sum[200010],L,R,T,n,k,p,q,max;
int main(){
	scanf("%d",&T);
	while (T-->0){
		scanf("%d%d",&n,&k);
		for (int i=1;i<=n;i++){
			scanf("%d",&sum[i]);
			sum[i]+=sum[i-1];
		}	
		for (int i=n+1;i<=n+k;i++) sum[i]=sum[n]+sum[i-n];
		L=0;R=-1;max=-2000000000;	
		for (int i=1;i<=n+k;i++){
			while (L<=R&&sum[D[R]-1]>sum[i-1]) R--;
			D[++R]=i;
			while (i-D[L]>=k) L++;
			if (sum[i]-sum[D[L]-1]>max){
				max=sum[i]-sum[D[L]-1];
				p=D[L];q=i;
			}
		}
		printf("%d %d %d\n",max,p,q>n?q-n:q);
	}
	return 0;
}
