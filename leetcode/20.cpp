class Solution {
public:
    bool isValid(string s) {
        stack<char> st;
        st.push('!');
        for (int i=0;i<s.size();i++){
            if ((st.top()=='(' && s[i] ==')')
                || (st.top()=='[' && s[i]==']')
                || (st.top()=='{' && s[i]=='}'))
                st.pop();
            else
                st.push(s[i]);
        }
        if (st.size()==1) return true; else return false;
    }
};
