#include<stdio.h>
#include<stack>
#include<queue>
#include<cstdlib>
using namespace std;
int n;
char c;
stack<int> st;
queue<int> d;
void wrong(){
	printf("No\n");
	exit(0);
};	
int main()
{
	scanf("%d\n",&n);
	int num=0;
	for (int i=1;i<=n;i++)
	{c=getchar();
		if (c=='A') d.push(++num);
		if (c=='B'){
			st.push(++num);
			if (st.size()>5) wrong();}
		if (c=='C'){
			if (st.size()==0) wrong();
			d.push(st.top());
		    st.pop();}
	}
	printf("Yes\n");
	while (!d.empty())
	{printf("%d\n",d.front());d.pop();}
}