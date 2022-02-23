#include <iostream>
#include <iomanip>
#include <vector>
#include <algorithm>
#include <functional>
#include <string>
#include <math.h>
using namespace std;


int main() {
    int answer = 0;
    
    
     while(true) {
        int is_vowel = 0, novowel = 0, vowel = 0, idx = 0, j = 0;
        string str = "";
        cin >> str;
        if(str == "end") break;
        for(j = 0; j < str.length(); j++) {

            switch(str[j]) {
                case 'a' :
                case 'e' :
                case 'i' :
                case 'u' :
                case 'o' : is_vowel++; vowel++; novowel = 0; break;
                default : vowel = 0; novowel++; break;
            }
            if(j != 0 && str[j] == str[j-1]) idx++;
            else idx = 0;
            if(idx == 1 && !(str[j] == 'e' || str[j] == 'o')) break;
            if(vowel == 3 || novowel == 3)break;
        }
        string answer = j == str.length() && is_vowel != 0 ? "is acceptable." : "is not acceptable.";
        cout << "<" << str << "> " << answer << endl;
    }
}