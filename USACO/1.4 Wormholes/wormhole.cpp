/*
ID:yangyim1
PROG:wormhole
LANG:C++
*/
#include <cstdio>
#include <iostream>
using namespace std;

int N,X[15],Y[15],goal,cnt;
int next[15];
int match[15];

bool ok(){
    for (int i=0;i<N;i++){
        int p=i;
        for (int j=0;j<N;j++){
            if (p==-1) break;
            p = next[match[p]];
        }
        if (p!=-1) return true;
    }
    return false;
}

void dfs(int n){
    if (n==0){
        if (ok()) cnt++;
        return;
    }
    for (int i=0; i<N; i++){
        if (match[i]==-1){
            for (int j=i+1; j<N; j++){
                if (match[j]==-1){
                    match[i]=j;
                    match[j]=i;
                    dfs(n-2);
                    match[i]=-1;
                    match[j]=-1;
                }
            }

            break;
        }
    }
}

int main(){
    freopen("wormhole.in","r",stdin);
    freopen("wormhole.out","w",stdout);
    cin >> N;
    for (int i=0; i<N; i++){
        cin >> X[i] >> Y[i];
        next[i] = -1;
        match[i] = -1;
    }

    for (int i=0; i<N; i++)
    for (int j=0; j<N; j++){
        if (i==j || Y[i]!=Y[j] || X[j]<=X[i]) continue;
        if (next[i]==-1 || X[j]<X[next[i]]) next[i] = j;
    }
    dfs(N);
    cout << cnt << endl;
}
