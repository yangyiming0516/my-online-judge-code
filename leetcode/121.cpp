class Solution {
public:
    int maxProfit(vector<int>& prices) {
        int res=0, minP = 0x7fffffff;
        for (int i=0;i<prices.size();i++){
            if (prices[i] - minP > res) res = prices[i] - minP;
            if (prices[i] < minP) minP = prices[i];
        }
        return res;
    }
};
