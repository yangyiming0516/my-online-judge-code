#include <iostream>
#include <algorithm>
#include <functional>
#include <vector>

using namespace std;

int main(){
    int n,m;
    cin >> n >> m;
    long long sum = 0;
    vector<int> a(n);
    for (int i=0; i<n;i++){
            cin>>a[i];
            sum += a[i];
    }
    if (sum < m){
        cout << -1 << endl;
        return 0;
    }
    sort(a.begin(),a.end(),greater<int>());
    int l=1, r=m;
    while (l < r){
        int k = (l+r)/2, tmp;
        sum = 0;
        for (int i=0;i<n;i++){
            tmp = a[i] - i/k;
            if (tmp <= 0) break;
            sum += tmp;
        }
        if (sum >= m){
            r = k;
        }
        else{
            l = k + 1;
        }
    }
    cout << r << endl;
    return 0;
}
