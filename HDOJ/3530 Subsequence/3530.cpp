#include<cstdio>
int n,m,k,h,D1[100010],D2[100010],f[100010];
int main(){
	int ans,ST,L1,R1,L2,R2;;
	while (~scanf("%d%d%d",&n,&m,&k)){
		L1=L2=ans=ST=0;R1=R2=-1;
		for (int i=1;i<=n;i++){
			scanf("%d",&f[i]);
			while (L1<=R1&&f[D1[R1]]>=f[i]) R1--;//min
			D1[++R1]=i;
			while (L2<=R2&&f[D2[R2]]<=f[i]) R2--;//max
			D2[++R2]=i;
			while (f[D2[L2]]-f[D1[L1]]>k)
				if (D1[L1]<D2[L2]){
					ST=D1[L1];
					L1++;
				}else{
					ST=D2[L2];
					L2++;
			}	
	    	if (f[D2[L2]]-f[D1[L1]]>=m&&i-ST>ans) ans=i-ST;
		}
		printf("%d\n",ans);
	}		
	return 0;
}
