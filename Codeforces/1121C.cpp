#include <iostream>
#include <vector>
#include <algorithm>
#include <string>
#include <cmath>

using namespace std;
int n,k, p, finished;
int timer[100],current[100], a[1001];
bool interesting[1001];

bool over(){
    for (int i=0;i<k;i++)
        if (current[i]!=0) return false;
    return true;
}

bool same(double a, double b){
    return abs(a-b) < 0.01;
}

int main(){
    cin >> n >> k;
    for (int i=1;i<=n;i++) cin >> a[i];
    int ans = 0;
    p = 1;

    for (int i=0;i<k;i++){
        if (p>n) continue;
        current[i] = p++;
        timer[i] = 0;
    }
    int t=0;
    while (1){
        //cout << ++t << ' ';
        if (over()) break;
        double percentage = round(100.0 * finished / n);
        //cout << percentage << endl;
        for (int i=0;i<k;i++){
            if (current[i] == 0) continue;
            timer[i]++;
            if (same(timer[i] * 1.0 , percentage))
                interesting[current[i]] = true;
        }
        for (int i=0;i<k;i++){
            if (current[i] != 0 && a[current[i]] == timer[i]){
                finished++;
                if (p<=n){
                    current[i] = p++;
                }
                else
                    current[i] = 0;
                timer[i] = 0;
            }
        }
    }
    for (int i=1;i<=n;i++)
        if (interesting[i]) ans++;
    cout << ans << endl;
    return 0;
}
