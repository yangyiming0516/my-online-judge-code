class Solution {
public:
    int numJewelsInStones(string J, string S) {
        string::iterator it;
        int ans = 0;
        for (it = S.begin(); it != S.end(); it++){
            if (J.find(*it) != string::npos)
                ans++;
        }
        return ans;
    }
};
