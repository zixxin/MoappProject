#include <iostream>
#include <iomanip>
#include <vector>
#include <algorithm>
#include <functional>
#include <string>
#include <math.h>
using namespace std;


int main() {
    int N;
    cin >> N;
    int answer = 0;

    for(int i = 0; i < N; i++) {
        vector<int> arr(27,0);
        string str;
        cin >> str;
        int idx = 1, j = 0;
        if(str.empty()) continue;
        else arr[str[0] % 26]++;
        for(j = 1; j < str.length(); j++) {
            if(str[j] != str[j-1]) idx = 0;
            if(arr[str[j] % 26] != idx) break;
            else { arr[str[j] % 26]++; idx++;}
        }
        if(j == str.length()) answer++;
    }

    cout << answer;
}