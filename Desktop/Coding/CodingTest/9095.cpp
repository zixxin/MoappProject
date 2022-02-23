#include <bits/stdc++.h>
using namespace std;

int main() {
    int N,idx,dp[12] = {0, };
    dp[1] = 1;  dp[2] = 2, dp[3] = 4;

    for(int i = 4; i < 11; i++) {
        dp[i] = dp[i-3];
        dp[i] += dp[i-2];
        dp[i] += dp[i-1];
    }
    cin >> N;
    for(int i = 0; i < N; i++) {
        cin >> idx;
        cout << dp[idx] << "\n";
    }

}