#include <iostream>

using namespace std;

int a[1000];

int main(){
    int n;
    cin >> n;
    int cnt1=0, cnt2=0;
    for (int i=0;i<n;i++){
        cin >> a[i];
        if (a[i]>0) cnt1++;
        if (a[i]<0) cnt2++;
    }
    int K = (n+1)/2;
    if (cnt1 >= K) cout << 1 << endl;
    else
     if (cnt2 >= K) cout << -1 << endl;
    else
        cout << 0 << endl;
    return 0;
}
