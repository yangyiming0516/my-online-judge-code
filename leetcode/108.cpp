/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
class Solution {
public:
    TreeNode* sortedArrayToBST(vector<int>& nums) {
        return AtoB(nums,0, nums.size()-1);
    }
    
    TreeNode* AtoB(vector<int>& nums,int L, int R){
        if (L>R) return NULL;
        TreeNode *tmp = new TreeNode(nums[(L+R)/2]);
        tmp->left = AtoB(nums,L,(L+R)/2-1);
        tmp->right = AtoB(nums,(L+R)/2+1,R);
        return tmp;
    }
};
