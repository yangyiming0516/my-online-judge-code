/*
ID:yangyim1
PROG:ratios
LANG:C++
*/

#include <cstdio>
#include <iostream>
using namespace std;

int ratio(int A1,int A2,int A3,int B1,int B2,int B3){
    int res = -1;
    if (A1+B1>0 && (A1*B1==0|| A1%B1!=0)) return -1;
    if (A2+B2>0 && (A2*B2==0|| A2%B2!=0)) return -1;
    if (A3+B3>0 && (A3*B3==0|| A3%B3!=0)) return -1;
    if (A1!=0) res = A1/B1; else res = 0;
    if (A2!=0){
        if (res==0) res = A2/B2;
        else if (A2/B2 != res) return -1;
    }
    if (A3!=0){
        if (res==0) res = A3/B3;
        else if (A3/B3 != res) return -1;
    }
    if (res==0) return -1;
    else
    return res;
}

int main(){
    freopen("ratios.in","r",stdin);
    freopen("ratios.out","w",stdout);
    int g1,g2,g3,a1,a2,a3,b1,b2,b3,c1,c2,c3,a,b,c,g,t1,t2,t3;
    a=b=c=100;
    cin >> g1 >> g2 >> g3;
    cin >> a1 >> a2 >> a3;
    cin >> b1 >> b2 >> b3;
    cin >> c1 >> c2 >> c3;
    for (int i=0;i<100;i++)
    for (int j=0;j<100;j++)
    for (int k=0;k<100;k++){
        t1 = a1*i + b1*j + c1*k;
        t2 = a2*i + b2*j + c2*k;
        t3 = a3*i + b3*j + c3*k;
        if (ratio(t1,t2,t3,g1,g2,g3)>-1)
            if (i+j+k < a+b+c){
                a = i; b = j; c = k;
                g = ratio(t1,t2,t3,g1,g2,g3);
            }
    }
    if (a==100) cout << "NONE" << endl;
    else
        cout << a << ' '<< b << ' ' << c << ' ' << g << endl;
}

