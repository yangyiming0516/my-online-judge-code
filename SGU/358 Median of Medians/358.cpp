#include<cstdio>
int a,b,c,x1,x2,x3;
int main(){
    scanf("%d%d%d",&a,&b,&c);
    if (a>=b^a>=c) x1=a;
       else if (b>=a^b>=c) x1=b;
            else x1=c;
    scanf("%d%d%d",&a,&b,&c);
    if (a>=b^a>=c) x2=a;
       else if (b>=a^b>=c) x2=b;
            else x2=c;  
    scanf("%d%d%d",&a,&b,&c);
    if (a>=b^a>=c) x3=a;
       else if (b>=a^b>=c) x3=b;
            else x3=c;
    if (x1>=x2^x1>=x3) printf("%d\n",x1);
       else if (x2>=x1^x2>=x3) printf("%d\n",x2);
            else printf("%d\n",x3);      
    return 0;
}