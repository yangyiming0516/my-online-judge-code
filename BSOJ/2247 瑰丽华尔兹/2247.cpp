#include<cstdio>
#include<iostream>
using namespace std;
char a[210][210];
int f[210][210][210];
int N,M,x,y,K,L,R,s,t,p[300],last[300],D[300];
void goup(int x){
	for (int j=1;j<=M;j++){
		L=0;R=-1;
		for (int i=N;i>0;i--)
			if (a[i][j]=='x') {L=0;R=-1;}
			else{
				while (L<=R&&f[x-1][D[R]][j]+D[R]<=f[x-1][i][j]+i) R--;
				D[++R]=i;
				while (D[L]-i>last[x]) L++;
				f[x][i][j]=f[x-1][D[L]][j]+D[L]-i;
		}
	}
};	
void godown(int x){
	for (int j=1;j<=M;j++){
		L=0;R=-1;
		for (int i=1;i<=N;i++)
			if (a[i][j]=='x') {L=0;R=-1;}
			else{
				while (L<=R&&f[x-1][D[R]][j]-D[R]<=f[x-1][i][j]-i) R--;
				D[++R]=i;
				while (i-D[L]>last[x]) L++;
				f[x][i][j]=f[x-1][D[L]][j]+i-D[L];
		}
	}
};	
void goleft(int x){
	for (int i=1;i<=N;i++){
		L=0;R=-1;
		for (int j=M;j>0;j--)
			if (a[i][j]=='x') {L=0;R=-1;}
			else{
				while (L<=R&&f[x-1][i][D[R]]+D[R]<=f[x-1][i][j]+j) R--;
				D[++R]=j;
				while (D[L]-j>last[x]) L++;
				f[x][i][j]=f[x-1][i][D[L]]+D[L]-j;
		}
	}
};	
void goright(int x){
	for (int i=1;i<=N;i++){
		L=0;R=-1;
		for (int j=1;j<=M;j++)
			if (a[i][j]=='x') {L=0;R=-1;}
			else{
				while(L<=R&&f[x-1][i][D[R]]-D[R]<=f[x-1][i][j]-j) R--;
				D[++R]=j;
				while (j-D[L]>last[x]) L++;
				f[x][i][j]=f[x-1][i][D[L]]+j-D[L];
		}
	}
};	
int main(){
	scanf("%d%d%d%d%d",&N,&M,&x,&y,&K);
	getchar();
	for (int i=1;i<=N;i++){
		for (int j=1;j<=M;j++)
		    a[i][j]=getchar();
		getchar();
	}
	for (int i=1;i<=K;i++){
		scanf("%d%d%d",&s,&t,&p[i]);
		last[i]=t-s+1;
	}	
	fill(&f[0][0][0],&f[K][N][M]+1,-50000);
	f[0][x][y]=0;
	for (int h=1;h<=K;h++)
		switch(p[h]){
			case 1:goup(h);break;
			case 2:godown(h);break;
			case 3:goleft(h);break;
			case 4:goright(h);break;
	}
	int ans=0;
	for (int i=1;i<=N;i++)
		for (int j=1;j<=M;j++)
			if (f[K][i][j]>ans) ans=f[K][i][j];
	cout<<ans<<endl;
	return 0;
}
