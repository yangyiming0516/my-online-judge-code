class Solution {
public:
    int maxSubArray(vector<int>& nums) {
        int F = 0;
        int max = -0x7fffffff;
        for (int i=0;i<nums.size();i++){
            if (F<0)
                F = nums[i];
            else
                F += nums[i];
            
            if (F > max) max = F;
        }
        return max;
    }
};
