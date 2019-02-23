#include <iostream>
#include <algorithm>
#include <vector>
#include <cmath>

using namespace std;

vector<int> F;
int main(){
    int n;
    cin >> n;
    int a[100];
    for (int i=0;i<n;i++) cin>>a[i];
    sort(a,a+n);
    for (int i=0;i<n;i++){
        if (i%2==0)
            F.push_back(a[i]);
        else
            F.insert(F.begin(),a[i]);
    }
    for (int i=0;i<n-1;i++) cout << F[i] << ' ';
    cout << F[n-1]<< endl;
    return 0;
}
