#include <cstdio>
#include <cstdlib>
using namespace std;

int cnt[1001];
int m[20][20];

int nextnum1(){
    for (int i=1;i<=1000;i++)
    if (cnt[i]>0 && cnt[i]%2==1){
        cnt[i]-=1;
        return i;
    }
    printf("NO\n");
    exit(0);
}

int nextnum2(){
    for (int i=1;i<=1000;i++)
    if (cnt[i]>0 && cnt[i]%4!=0 && cnt[i]%2==0){
        cnt[i]-=2;
        return i;
    }
    for (int i=1;i<=1000;i++)
    if (cnt[i]>0 && cnt[i]%4==0){
        cnt[i]-=2;
        return i;
    }
    printf("NO\n");
    exit(0);
}

int nextnum4(){
    for (int i=1;i<=1000;i++)
    if (cnt[i]>0 && cnt[i]%4==0){
        cnt[i]-=4;
        return i;
    }
    printf("NO\n");
    exit(0);
}

int main(){
    int n;
    scanf("%d",&n);
    int t;
    for (int i=0; i<n*n; i++){
        scanf("%d",&t);
        cnt[t]++;
    }
    if (n%2==1){
        t = nextnum1();
        m[n/2][n/2] = t;
        for (int i=0;i<n/2;i++){
            t= nextnum2();
            m[i][n/2] = t;
            m[n-1-i][n/2] = t;
            t = nextnum2();
            m[n/2][i] = t;
            m[n/2][n-1-i] = t;
        }
    }
    for (int i=0;i<n;i++){
        for (int j=0;j<n;j++){
            if (m[i][j]==0){
                int x = nextnum4();
                m[i][j] = x;
                m[n-1-i][n-1-j] = x;
                m[n-1-i][j] = x;
                m[i][n-1-j] = x;
            }
        }
    }
    printf("YES\n");
    for (int i=0;i<n;i++){
        for (int j=0;j<n;j++){
            printf("%d",m[i][j]);
            if (j!=n-1) printf(" ");
        }
        printf("\n");
    }
    return 0;
}
