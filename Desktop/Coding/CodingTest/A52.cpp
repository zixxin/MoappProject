#include <iostream>
using namespace std;


int main() {
    int N, count = 0, answer = 0;
    string str;
    cin >> N;
    for(int i = 0; i < N; i++) {
        cin >> str;
        count = 0; answer = 0;
        for(int j = 0; j < str.length(); j++) {
            if(str[j] == 'O') count++;
            else count = 0;
            answer += count;
        }
        cout << answer << endl;
    }
}