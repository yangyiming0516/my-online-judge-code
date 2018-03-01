/*
ID:yangyim1
PROG:contact
LANG:C++
*/
#include<cstdio>
char c;
bool s[200001],ed[13][4096],flag;
int A,B,N,num,f[13][4096],abc,now,ans,p,q,pred,hang;
void write(int L,int V){
     for (;L>0;L--){
         printf("%d",V/(1<<L-1));
         V%=1<<L-1;
     }
}         
int main(){
    freopen("contact.in","r",stdin);
    freopen("contact.out","w",stdout);
    scanf("%d%d%d",&A,&B,&N);
    while ((c=getchar())!=EOF)
          if (c!='\n') s[++num]=c-48;        
    for (int i=A;i<=B;i++){
        now=0;abc=0;
        for (int j=1;j<i;j++) now=(now<<1)+s[j];
        for (int j=1;j<i;j++) abc=(abc<<1)+1; 
        for (int j=i;j<=num;j++){
            now&=abc;
            now=(now<<1)+s[j];
            ++f[i][now];
        }
    }
    while (1){
        ans=0;p=0;
        for (int j=A;j<=B;j++)
            for (int k=0;k<1<<j;k++)
            if (!ed[j][k]&&f[j][k]>ans){
               ans=f[j][k];
               p=j;q=k;
            }
        if (p==0) break;
        ed[p][q]=true;
        if (pred==ans) {if (hang<6) putchar(' ');}
        else   
           {
           if (--N<0) break;    
           if (flag) putchar('\n'); else flag=true;        
           printf("%d\n",ans);
           hang=0;
        }
        if (hang==6) {putchar('\n');hang=0;};
        write(p,q);
        ++hang;
        pred=ans;
    }                                       
    putchar('\n');
    return 0;
}             
