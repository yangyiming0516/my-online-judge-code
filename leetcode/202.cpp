class Solution {
public:
    bool isHappy(int n) {
        unordered_set<int> ed;
        while (1){
            if (ed.insert(n).second == false) return false;;
            int sum=0, tmp = n;
            while (tmp>0){
                sum += (tmp % 10)*(tmp % 10);
                tmp /= 10;
            }
            if (sum==1) return true;
            n = sum;
        }
    }
};
