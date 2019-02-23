#include <iostream>
using namespace std;

int main(){
    int w1,w2,h1,h2;
    cin >> w1 >> h1 >> w2 >> h2;
    long long ans = w1 + 2 + h1 + h1 + w2 + 2 + h2 + h2 + w1 - w2;
    cout << ans << endl;
    return 0;
}
