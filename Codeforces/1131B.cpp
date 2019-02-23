#include <iostream>
#include <algorithm>
using namespace std;

int match(int x1, int x2, int y1, int y2){
    if (y1 > x2 || x1 > y2) return 0;
    return min (x2,y2) - max(x1,y1) +1;
}

int main(){
    int n;
    cin >> n;
    int x=0, y=0;
    int ans = 0;
    for (int i=0;i<n;i++){
        int a,b;
        cin >> a >> b;
        ans += match (x,a,y,b);
        x=a;y=b;
        if (a==b) ans--;
    }
    if (x==y) ans++;
    cout << ans << endl;
    return 0;
}
