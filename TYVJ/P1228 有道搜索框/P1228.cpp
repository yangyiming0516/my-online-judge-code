#include<cstdio>
#include<cstring>
#include<algorithm>
using namespace std;
struct node{
	char st[30];
};	
node f[10010];
bool nok[10010];
int n,k,p,q;
char str[30];
bool com(node x,node y){
	return strcmp(x.st,y.st)<0;
};	
int search(char *s){
	int L=1,R=n,mid;
	while (L<R){
		mid=(L+R)/2;
		if (strcmp(f[mid].st,s)<0) L=mid+1;
			else R=mid;
		}
	if (L>R||strstr(f[L].st,s)!=f[L].st)	return -1;else return L;
};		
int main(){
	scanf("%d",&n);
	getchar();
	for (int i=1;i<=n;i++) gets(f[i].st);
	sort(f+1,f+n+1,com);
	for (int i=2;i<=n;i++) if (strcmp(f[i].st,f[i-1].st)==0) nok[i]=true;
	scanf("%d",&q);getchar();
	for (int i=1;i<=q;i++){
		gets(str);
		p=search(str);
		if (p==-1) printf("%s",str);
		else {	
		    k=0;
			while ((strstr(f[p].st,str)==f[p].st)&&(k<8)){
				if (!nok[p]) {k++;if (k>1) printf(" %s",f[p].st);else printf("%s",f[p].st);}
				p++;
			}
		}	
		printf("\n");
	}
}