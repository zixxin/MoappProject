#include <bits/stdc++.h>
using namespace std;
int dp[1000][3];

void findMin(int N) {
    for(int i = 1; i < N; i++) {
        for(int j = 0; j < 3; j++) {
            dp[i][j % 3] += min(dp[i-1][(j+1)%3], dp[i-1][(j+2)%3]);
        }
    }
}

int main() {
    int N, answer;
    cin >> N;
    
    for(int i = 0; i < N; i++) {
        for(int j = 0; j < 3; j++) {
            cin >> dp[i][j];
        }
    }

    findMin(N);
    cout << *min_element(dp[N-1],dp[N-1]+3) << "\n";
}
