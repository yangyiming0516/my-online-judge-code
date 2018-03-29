/*
ID:yangyim1
PROG:combo
LANG:C++
*/
#include <cstdio>
#include <iostream>
using namespace std;

int N, A1, A2, A3, B1, B2, B3;

bool close(int x,int y){
    if (x >= y){
        if (x - y <= 2 || y+N-x <= 2)
            return true;
    }

    if (x < y){
        if (y - x <= 2 || x+N-y <= 2)
            return true;
    }

    return false;
}

int main(){
    freopen("combo.in","r",stdin);
    freopen("combo.out","w",stdout);
    cin >> N;
    cin >> A1 >> A2 >> A3;
    cin >> B1 >> B2 >> B3;
    int cnt = 0;
    for (int i=1; i<=N; i++){
        if (close(A1,i) && close(B1,i)){
            for (int j=1; j<=N; j++){
                if (close(A2,j) && close(B2,j)){
                    for (int k=1; k<=N; k++){
                        if (close(A3,k) && close(B3,k))
                            cnt++;
                    }
                }
            }
        }
    }
    if (N<5)
        cout << N*N*N*2-cnt<< endl;
    else
        cout << 250-cnt << endl;
}
