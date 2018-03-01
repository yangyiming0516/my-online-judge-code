#include<cstdio>
#include<algorithm>
#include<set>
using namespace std;
multiset<int> tree;
int D[100010],SA[100010],SB[100010],point,temp,N,Limit,num,A[100010],B[100010],match[100010],EA[100010],EB[100010],f[100010];
bool cmpa(int x,int y){return A[x]<A[y];}
bool cmpb(int x,int y){return B[x]<B[y];}
bool make(int M){
	tree.clear();
	int low=1,sum=0,L=0,R=-1;
	for (int i=1;i<=num;i++){
		sum+=EB[i];
		while (sum>M){
			sum-=EB[low++];
		}	
		if (low>i) return false;
		while (L<=R&&EA[D[R]]<=EA[i]){
			if (R>L) tree.erase(tree.find(f[D[R-1]]+EA[D[R]]));
			R--;
		}
		D[++R]=i;
		if (R>L) tree.insert(f[D[R-1]]+EA[D[R]]);
		while (D[L]<low){
			tree.erase(tree.find(f[D[L]]+EA[D[L+1]]));
			L++;
		}
		f[i]=f[low-1]+EA[D[L]];
		if (L<R) f[i]=min(*tree.begin(),f[i]);
	}		
	return f[num]<=Limit;
};	
int main(){
	scanf("%d%d",&N,&Limit);
	for (int i=1;i<=N;i++){
		scanf("%d%d",&A[i],&B[i]);
		SA[i]=SB[i]=i;
	}
	sort(SA+1,SA+N+1,cmpa);
	sort(SB+1,SB+N+1,cmpb);
	point=N;
	for (int i=N;i>0;i--){
		while (B[SB[i]]<=A[SA[point]]) temp=max(temp,SA[point--]);
		match[SB[i]]=max(SB[i],temp);
	}
	temp=0;
	int okA=0,okB=0;
	for (int i=1;i<=N;i++){
		temp=max(temp,match[i]);
		okA=max(okA,A[i]);
		okB+=B[i];
		if (temp==i){
			EA[++num]=okA;
			EB[num]=okB;
			okA=okB=0;
		}
	}
	int down=1,up=(1<<31)-2;
	while (down<up)
		if (make((down+up)/2)) up=(down+up)/2;
			else down=((down+up)/2)+1;
	printf("%d\n",down);
	return 0;
}
