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
    int path(TreeNode* root, int sum){
        if (root == NULL) return 0;
        return path(root->left, sum - root->val) + path(root->right, sum - root->val) + (sum == root->val);
    }
    int pathSum(TreeNode* root, int sum) {
        if (root == NULL) return 0;
        int ans=0;
        ans += path(root, sum);
        ans += pathSum(root->left, sum);
        ans += pathSum(root->right, sum);
        return ans;
    }
};
