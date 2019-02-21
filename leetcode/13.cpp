class Solution {
public:
    int romanToInt(string s) {
        int res = 0;
        for (int i=0;i<s.length()-1;i++){
            if (s[i]=='I'){
                if (s[i+1]=='V' || s[i+1]=='X') res-=1;
                else res+=1;
            }
            if (s[i]=='X'){
                if (s[i+1]=='L' || s[i+1]=='C') res-=10;
                else res+=10;
            }
            if (s[i]=='C'){
                if (s[i+1]=='D' || s[i+1]=='M') res-=100;
                else res+=100;
            }
            switch(s[i]){
                case 'V': res+=5; break;
                case 'L': res+=50;break;
                case 'D': res+=500;break;
                case 'M': res+=1000;break;
            }
        }
        switch(s[s.length()-1]){
            case 'I': res+=1; break;
            case 'V': res+=5; break;
            case 'X': res+=10;break;
            case 'L': res+=50;break;
            case 'C': res+=100;break;
            case 'D': res+=500;break;
            case 'M': res+=1000;break;
        }
        
        return res;
    }
};
