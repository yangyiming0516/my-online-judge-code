class Solution {
public:
    int majorityElement(vector<int>& nums) {
        sort(nums.begin(),nums.end());
        int last=0;
        for (int i=1;i<nums.size();i++){
            if (nums[i]!=nums[i-1]){
                if (i-last>nums.size()/2) return nums[i-1];
                last = i;
            }
        }
        return nums[last];
    }
};
