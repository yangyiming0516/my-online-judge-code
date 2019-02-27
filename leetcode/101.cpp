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
    bool same (TreeNode* t1, TreeNode* t2){
      if (t1 == NULL && t1 == t2) return true;
        if (t1 == NULL || t2 == NULL) return false;
        if (t1->val == t2->val){
            return same(t1->left,t2->right) && same(t1->right,t2->left);
        }
        else return false;   
    }
    
    bool isSymmetric(TreeNode* root) {
        return same(root, root);
    }
};
