#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

char c[1001][1001];
int F[2001],R[2001],num[2001],u[2001];
vector<vector<int> >Next(2001);
int cnt = 1;

int father(int x){
    if (F[x] == 0) return x;
    F[x] = father(F[x]);
    return F[x];
}

void U(int a, int b){
    int X = father(a), Y = father(b);
    if (X==Y) return;
    if (R[X] < R[Y]){
        R[X] = R[Y];
        F[X] = Y;
    }else{
        if (R[X]==R[Y]) R[X]++;
        R[Y] = R[X];
        F[Y] = X;
    }
}

void fail(){
    cout << "No" << endl;
    exit(0);
}

void dfs(int x){
    if (u[x]>0) return;
    u[x]=1;
    int max=0;
    for (int i=0;i<(Next[x]).size();i++){
        if (u[Next[x][i]]==1) fail();
        if (u[Next[x][i]]== 0) dfs(Next[x][i]);
        if (max < num[Next[x][i]]) max = num[Next[x][i]];
    }
    num[x] = max + 1;
    u[x] = 2;
}

int main(){
    int n,m;
    cin >> n >> m;
    for (int i=1; i<=n;i++)
        for (int j=1; j<=m; j++){
            cin >> c[i][j];
            if (c[i][j] == '=')
                U(i,j+n);
        }
    for (int i=1; i<=n;i++)
        for (int j=1; j<=m; j++){
            int x,y;
            x = father(i);
            y = father(j+n);
            if (x==y && c[i][j]!='=') fail();
            if (c[i][j] == '>'){
                Next[x].push_back(y);
            }
            if (c[i][j] == '<'){
                Next[y].push_back(x);
            }
        }
    for (int i=1;i<=n+m;i++){
        dfs(father(i));
    }
    cout << "Yes" << endl;
    for (int i=1;i<=n;i++){
        cout << num[father(i)];
        if (i==n) cout << endl;
        else cout << ' ';
    }
    for (int i=n+1;i<=n+m;i++){
        cout << num[father(i)];
        if (i==n+m) cout << endl;
        else cout << ' ';
    }
    return 0;
}
