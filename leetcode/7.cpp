class Solution {
public:
    int reverse(int x) {
        int ans = 0, tmp = x>0?x:-x;
        if (tmp<=0) return 0;
        while (tmp != 0){
            if (ans > 0x7fffffff/10) return 0;
            ans = ans*10 + tmp%10;
            tmp /= 10;
        }
        return x>0?ans:-ans;
    }
};
