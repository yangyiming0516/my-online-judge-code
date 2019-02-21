class Solution {
public:
    bool isPalindrome(int x) {
        if (x<0) return false;
        int tmp=0, y=x;
        while (y){
            tmp = tmp*10 + y%10;
            y/=10;
        }
        if (x==tmp) return true; else return false;
    }
};
