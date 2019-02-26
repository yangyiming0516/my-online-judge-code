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
private:
    int max = 0;
public:
    int depth(TreeNode* root){
        if (root == NULL) return 0;
        int L = depth(root->left), R = depth(root->right);
        if (L+R+1 > max) max = L+R+1;
        return 1 + (L>R?L:R);
    }
    int diameterOfBinaryTree(TreeNode* root) {
        depth(root);
        if (max == 0) max++;
        return max-1;
    }
};
