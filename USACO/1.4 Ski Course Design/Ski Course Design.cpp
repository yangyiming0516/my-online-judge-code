/*
ID:yangyim1
PROG:skidesign
LANG:C++
*/
#include <cstdio>
#include <iostream>
using namespace std;

int main(){
    freopen("skidesign.in","r",stdin);
    freopen("skidesign.out","w",stdout);
    int N, H[1000];
    cin >> N;
    for (int i=0; i<N; i++) cin >> H[i];
    int res = 0x7fffffff;
    for (int i=0;i<=83;i++){
        int cnt = 0;
        for (int j=0; j<N; j++){
            if (H[j]<i) cnt += (i-H[j])*(i-H[j]);
            if (H[j]>i+17) cnt += (H[j]-i-17)*(H[j]-i-17);
        }
        if (cnt<res) res=cnt;
    }
    cout << res << endl;
}
