#include <iostream>
using namespace std;


int main() {
    string answer = "ADGJMPTW";
    string str;
    int count = 0;
    cin >> str;
    for(int i = 0; i < str.length(); i++) {
        for(int j = 0; j < answer.length(); j++) {
            if(str[i] < answer[j]) break;
            count++;
        }
        count+=2;
    }
    cout << count;
}