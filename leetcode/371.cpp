class Solution {
public:
    vector<int> intersect(vector<int>& nums1, vector<int>& nums2) {
        vector<int> res;
        vector<int>::iterator it;
        for (int i=0;i<nums2.size();i++){
            it = find(nums1.begin(),nums1.end(),nums2[i]);
            if (it!=nums1.end()){
                res.push_back(nums2[i]);
                nums1.erase(it);
            }
        }
        return res;
    }
    
};
