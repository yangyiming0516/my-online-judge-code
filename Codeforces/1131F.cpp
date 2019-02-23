#include <iostream>
#include <vector>
using namespace std;

int L[500000],R[500000],F[500000];
int r[500000],u[500000],H[500000];
vector<int> ans;
int n;
void output(int x){
    if (x==0) return;
    output(L[x]);
    if (x>=1 && x<=n){
        ans.push_back(x);
        return;
    }
    output(R[x]);
}

int find(int x){
    if (u[x]==0) return x;
    u[x] = find(u[x]);
    return u[x];
}

void uni(int x,int y){
    int X = find(x), Y = find(y);
    if (r[X] < r[Y]){
        u[X] = Y;
        r[X] = r[Y];
    }
    else {
        u[Y] = X;
        if (r[X] == r[Y]) r[X]++;
        r[Y] = r[X];
    }
}

int main(){

    cin >> n;
    int k=n;
    for (int i=1;i<=n;i++) {H[i] = i;}
    for (int i=0;i<n-1;i++){
        int a,b;
        cin >> a >> b;
        k++;
        F[H[find(a)]]=k;
        F[H[find(b)]]=k;
        L[k]=H[find(a)];
        R[k]=H[find(b)];
        uni(a,b);
        H[find(a)]=k;
    }
    output(k);
    for (int i=0;i<n-1;i++) cout << ans[i]<< ' ';
    cout << ans[n-1] << endl;
    return 0;
}
