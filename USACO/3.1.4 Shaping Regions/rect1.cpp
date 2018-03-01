/*
ID:yangyim1
PROG:rect1
LANG:C++
*/
#include<cstdio>
#include<algorithm>
using namespace std;
struct node{
   int llx,lly,urx,ury,color;
} sq[1001]; 
int area[2501],A,B,N,now;
void goup(int llx,int lly,int urx,int ury,int num){
     if (num>N)
        area[now]+=(ury-lly)*(urx-llx);
     else
        {if (llx<sq[num].urx&&lly<sq[num].ury&&urx>sq[num].llx&&ury>sq[num].lly){
           if (llx<sq[num].llx) goup(llx,lly,sq[num].llx,ury,num+1);
           if (urx>sq[num].urx) goup(sq[num].urx,lly,urx,ury,num+1);
           if (lly<sq[num].lly) goup(max(sq[num].llx,llx),lly,min(sq[num].urx,urx),sq[num].lly,num+1);
           if (ury>sq[num].ury) goup(max(sq[num].llx,llx),sq[num].ury,min(sq[num].urx,urx),ury,num+1);
        } else goup(llx,lly,urx,ury,num+1);}
}                                                                                                
int main(){
    freopen("rect1.in","r",stdin);
    freopen("rect1.out","w",stdout);
    scanf("%d%d%d",&A,&B,&N);
    for (int i=1;i<=N;i++)
        scanf("%d%d%d%d%d",&sq[i].llx,&sq[i].lly,&sq[i].urx,&sq[i].ury,&sq[i].color);   
    sq[0].urx=A;sq[0].ury=B;sq[0].color=1;
    for (int i=N;i>=0;i--){
        now=sq[i].color;
        goup(sq[i].llx,sq[i].lly,sq[i].urx,sq[i].ury,i+1);
    }    
    for (int i=1;i<=2500;i++)
        if (area[i]>0) printf("%d %d\n",i,area[i]);  
    return 0;
}            
