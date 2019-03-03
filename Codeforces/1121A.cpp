#include <iostream>
#include <vector>
#include <algorithm>
#include <string>

using namespace std;

int best[1000];

int main(){
    int n,m,k;
    int p[1000],s[1000],c[1000];
    cin >> n >> m >> k;
    for (int i=1;i<=n;i++) cin>>p[i];
    for (int i=1;i<=n;i++) cin >> s[i];
    for (int i=1;i<=k;i++) cin >> c[i];



    for (int i=1;i<=n;i++)
        if (p[i]>best[s[i]]) best[s[i]] = p[i];

    int ans = 0;
    for (int i = 1;i<=k;i++)
        if (p[c[i]]<best[s[c[i]]]) ans++;
    cout << ans << endl;
    return 0;
}
