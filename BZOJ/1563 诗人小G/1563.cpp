#include<cstdio>
#include<cstring>
#include<cmath>
#include<algorithm>
using namespace std;
struct node{
	int s,t,k;
} now,D[100001];	
char s[32];
int N,P,LL,T,head,tail,sum[100001];
long double F[100001];
inline long double cal(int a,int b){
	long double temp=fabs(sum[b]-sum[a-1]+(b-a)-LL),ans=1;
	for (int h=1;h<=P;h++) ans*=temp;
	return ans;
}  	
int main(){
	scanf("%d",&T);
	while (T--){
		scanf("%d%d%d",&N,&LL,&P);
		getchar();
		for (int i=1;i<=N;i++){
			gets(s);
			sum[i]=sum[i-1]+strlen(s);
        }	
		head=tail=0;D[0].s=1;D[0].t=N;
		for (int i=1;i<N;i++){
			while (i>D[head].t) head++;
			F[i]=F[D[head].k]+cal(D[head].k+1,i);
			if (F[i]+cal(i+1,N)>=F[D[tail].k]+cal(D[tail].k+1,N)) continue;
			while (D[tail].s>i&&F[D[tail].k]+cal(D[tail].k+1,D[tail].s)>F[i]+cal(i+1,D[tail].s)) tail--;
			int L=max(i+1,D[tail].s),R=D[tail].t,mid;
			while (L<R){
				mid=(L+R)>>1;
				if (F[D[tail].k]+cal(D[tail].k+1,mid)>F[i]+cal(i+1,mid))
					R=mid;else L=mid+1;
			}
            if (F[i]+cal(i+1,L)>=F[D[tail].k]+cal(D[tail].k+1,L)) L++;		
			D[tail].t=L-1;D[++tail].k=i;D[tail].s=L;D[tail].t=N;
		}
		while (N>D[head].t) head++;
		F[N]=F[D[head].k]+cal(D[head].k+1,N);
		if (F[N]>1000000000000000000.0) printf("Too hard to arrange\n");
			else printf("%lld\n",(long long)F[N]);
    	printf("--------------------\n");		
	}
	return 0;
}
