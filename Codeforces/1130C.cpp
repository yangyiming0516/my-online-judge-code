#include <iostream>
#include <cstring>
#include <queue>
using namespace std;

int S[51][51],T[51][51];
int F[51][51];
bool a[52][52], ing[52][52];

queue<int> X,Y;


int dis(int x1, int y1, int x2, int y2){

    return (x1-x2)*(x1-x2)+(y1-y2)*(y1-y2);
}


int main(){
    int n;
    cin >> n;
    int r1,r2,c1,c2;
    cin >> r1>>c1;
    cin >> r2>>c2;
    char c;
    for (int i=0;i<=n+1;i++)
        for (int j=0;j<=n+1;j++)
            a[i][j]=true;
    for (int i=1;i<=n;i++)
        for (int j=1;j<=n;j++){
            cin >> c;
            if (c=='0') a[i][j] = false;
            else a[i][j]=true;
    }
    for (int i=1;i<=n;i++)
        for (int j=1;j<=n;j++)
            F[i][j]=-1;
    F[r1][c1]=0;
    X.push(r1);
    Y.push(c1);
    while (!X.empty()){
        int A=X.front();
        X.pop();
        int B=Y.front();
        Y.pop();
        if (a[A-1][B]==false && F[A-1][B]==-1){
            F[A-1][B] = F[A][B]+1;
            X.push(A-1);
            Y.push(B);
        }
        if (a[A+1][B]==false && F[A+1][B]==-1){
            F[A+1][B] = F[A][B]+1;
            X.push(A+1);
            Y.push(B);
        }
        if (a[A][B-1]==false && F[A][B-1]==-1){
            F[A][B-1] = F[A][B]+1;
            X.push(A);
            Y.push(B-1);
        }
        if (a[A][B+1]==false && F[A][B+1]==-1){
            F[A][B+1] = F[A][B]+1;
            X.push(A);
            Y.push(B+1);
        }
    }
    for (int i=1;i<=n;i++)
        for (int j=1;j<=n;j++)
        S[i][j]=F[i][j];


    for (int i=1;i<=n;i++)
        for (int j=1;j<=n;j++)
            F[i][j]=-1;
    F[r2][c2]=0;
    X.push(r2);
    Y.push(c2);
    while (!X.empty()){
        int A=X.front();
        X.pop();
        int B=Y.front();
        Y.pop();
        if (a[A-1][B]==false && F[A-1][B]==-1){
            F[A-1][B] = F[A][B]+1;
            X.push(A-1);
            Y.push(B);
        }
        if (a[A+1][B]==false && F[A+1][B]==-1){
            F[A+1][B] = F[A][B]+1;
            X.push(A+1);
            Y.push(B);
        }
        if (a[A][B-1]==false && F[A][B-1]==-1){
            F[A][B-1] = F[A][B]+1;
            X.push(A);
            Y.push(B-1);
        }
        if (a[A][B+1]==false && F[A][B+1]==-1){
            F[A][B+1] = F[A][B]+1;
            X.push(A);
            Y.push(B+1);
        }
    }

    for (int i=1;i<=n;i++)
        for (int j=1;j<=n;j++)
        T[i][j]=F[i][j];

    if (S[r2][c2] > 0){
        cout << 0 << endl;
        return 0;
    }

    int ans = 0x7fffffff;
    int output= 0x7fffffff;
    for (int i=1;i<=n;i++)
    for (int j=1;j<=n;j++)
    for (int k=1;k<=n;k++)
    for (int m=1;m<=n;m++)
    if(a[i][j]==false && a[k][m]==false &&S[i][j]>=0&&T[k][m]>=0)
    {
        if (dis(i,j,k,m)<ans){
                ans = dis(i,j,k,m);
        }
    }
    cout << ans << endl;
    return 0;
}
