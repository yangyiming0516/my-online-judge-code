#include <iostream>
#include <vector>
#include <algorithm>
#include <string>

using namespace std;

int cnt[200000];

int main(){
    int n, a[1000];
    cin >> n;
    for (int i=0;i<n;i++) cin >> a[i];
    sort(a,a+n);
    for (int i=0;i<n-1;i++)
        for (int j=i+1;j<n;j++)
            cnt[a[i]+a[j]]++;
    int max = 0,p;
    for (int i=1;i<=a[n-1]+a[n-2];i++){
        if (cnt[i]>max) max = cnt[i];
        p = i;
    }
    cout << max << endl;
    return 0;
}
