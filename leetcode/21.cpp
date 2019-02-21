/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
public:
    ListNode* mergeTwoLists(ListNode* l1, ListNode* l2) {
        ListNode *p = new ListNode(0);
        ListNode* t = p;
        while (l1!=NULL || l2!=NULL){
            if (l1==NULL){
                t->next = l2;
                l2 = l2->next;
                t = t->next;
            }else
                if (l2==NULL){
                    t->next = l1;
                    l1 = l1->next;
                    t = t->next;
                }else
                    if (l1->val<l2->val){
                        t->next = l1;
                        l1 = l1->next;
                        t = t->next;
                    }else
                    {
                        t->next = l2;
                        l2 = l2->next;
                        t = t->next;
                    }
            
        }
        return p->next;
    }
};
