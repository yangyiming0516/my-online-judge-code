#include <cstdio>
using namespace std;

int a[200001],even[200001],odd[200001];

int main(){
    int n;
    scanf("%d",&n);
    for (int i=1;i<=n;i++)
        scanf("%d",&a[i]);
    even[0]=0;
    odd[0]=0;
    for (int i=1;i<=n;i++)
        if (i%2==1){
            odd[i] = odd[i-1]+a[i];
            even[i] = even[i-1];
        }
        else{
            odd[i] = odd[i-1];
            even[i] = even[i-1] + a[i];
        }
    int ans = 0;
    for (int i=1; i<=n; i++){
        if (odd[i-1]-even[i]+even[n] == even[i-1]-odd[i]+odd[n])
            ans++;
    }
    printf("%d\n",ans);
    return 0;
}
