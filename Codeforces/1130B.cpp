#include <iostream>
#include <cstdlib>
#include <algorithm>

using namespace std;

int K[100001][2];

int best(int x1,int x2,int y1, int y2){
    int T1 = abs(y1-x1)+abs(y2-x2);
    int T2 = abs(y1-x2)+abs(y2-x1);
    return min(T1,T2);
}

int main(){
    int n;
    cin >> n;
    int x;
    for (int i=1;i<=2*n;i++){
        cin >> x;
        if (K[x][0] ==0 ) K[x][0]=i;
        else K[x][1]=i;
    }
    int A=1,B=1;
    long long sum=0;
    for (int i=1;i<=n;i++){
        sum += best(A,B,K[i][0],K[i][1]);
        A = K[i][0];
        B = K[i][1];
    }
    cout << sum << endl;
    return 0;
}
