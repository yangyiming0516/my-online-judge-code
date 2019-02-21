class Solution {
public:
    int singleNumber(vector<int>& nums) {
        vector<int>::iterator i;
        int ans =0;
        for (i=nums.begin();i!=nums.end();i++)
            ans ^= *i;
        return ans;
    }
};
