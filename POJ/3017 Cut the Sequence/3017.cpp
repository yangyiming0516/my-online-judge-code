#include<cstdio>
#include<set>
using namespace std;
int D[100010],a[100010],L,R,N,low;
long long M,sum,f[100010],temp;
multiset<int> tree;
int main(){
	scanf("%d%I64d",&N,&M);
	for (int i=1;i<=N;i++)
		scanf("%d",&a[i]);
	L=0;R=-1;sum=0;low=1;
	bool flag=true;
	for (int i=1;i<=N;i++){
		sum+=a[i];
		while (sum>M) sum-=a[low++];
		if (low>	i){
			L=0;R=-1;printf("-1");flag=false;break;
		}
		while (L<=R&&a[i]>=a[D[R]]) {
			if (R>L) tree.erase(f[D[R-1]]+a[D[R]]);
				R--;
		}
		D[++R]=i;if (R>L) tree.insert(f[D[R-1]]+a[D[R]]);
		while (low>D[L]) {
			if (R>L) tree.erase(f[D[L]]+a[D[L+1]]);
			L++;
		}
		temp=*(tree.begin());f[i]=f[low-1]+a[D[L]];
		if (L<R&&temp<f[i]) f[i]=temp;
	}		
	if (flag) printf("%I64d",f[N]);
	return 0;
}