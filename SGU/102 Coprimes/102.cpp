#include<cstdio>
int N,sum;
inline int gcd(int a,int b){
	int c=a%b;
	while (c!=0){
		a=b;
		b=c;
		c=a%b;
	}
	return b;
}	
int main(){
	scanf("%d",&N);
	for (int i=1;i<=N;i++)
		if (gcd(N,i)==1) sum++;
	printf("%d\n",sum);
	return 0;
}
