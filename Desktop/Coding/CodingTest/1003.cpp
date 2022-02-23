#include <bits/stdc++.h>
using namespace std;
const int SIZE = 41;
pair<int, int> arr[SIZE];

void fib(int num) {
    for(int i = 2; i <= num; i++) {
        arr[i].first = arr[i-1].first + arr[i-2].first;
        arr[i].second = arr[i-1].second + arr[i-2].second;
    }
}

int main() {
    int N;
    cin >> N;
    int num[N];

    arr[0] = pair<int,int> (1,0);
    arr[1] = make_pair(0,1);

    for(int i = 0; i < N; i++) {
        cin >> num[i];
    }
    fib(*max_element(num,num+N));

    for(int it : num) {
        cout << arr[it].first << " " << arr[it].second << "\n";
    }

}