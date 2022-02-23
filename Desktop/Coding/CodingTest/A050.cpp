#include <iostream>
using namespace std;


int main() {
    string answer;
    cin >> answer;
    for(int i = 0; i < answer.length(); i++) {
        answer[i] < 'D' ? answer[i]+=23 : answer[i]-=3;
    }
    cout << answer;
}