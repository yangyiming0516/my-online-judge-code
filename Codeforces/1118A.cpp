#include <cstdio>
using namespace std;

int main(){
    int q;
    long long n,a,b;
    scanf("%d",&q);
    for (int i=0;i<q;i++){
        scanf("%lld%lld%lld",&n,&a,&b);
        if (a<=(b/2.0)){
            printf("%lld\n",n*a);
        }
        else{
            printf("%lld\n",(n/2*b)+(n%2)*a);
        }
    }
    return 0;
}
