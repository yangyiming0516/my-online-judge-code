class Solution {
public:
    int firstUniqChar(string s) {
        vector<int> cnt(26,-1);
        for (int i=0;i<s.length();i++){
            switch(cnt[s[i]-'a']){
                case -2:break;
                case -1:cnt[s[i]-'a']=i;break;
                default:cnt[s[i]-'a']=-2;
            }
        }
        int min = 0x7fffffff;
        for (int i=0;i<26;i++){
            if (cnt[i]>=0){
                if (cnt[i]<min) min = cnt[i];
            }
        }
        if (min>=0 && min!=0x7fffffff) return min; else return -1;
    }
};
