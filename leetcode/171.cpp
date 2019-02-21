class Solution {
public:
    int titleToNumber(string s) {
        int k=1,ans=0;
        for (int i=s.length()-1;i>=0;i--){
            ans+=k*(s[i]-'A'+1);
            k *= 26;
        }
        return ans;
    }
};
