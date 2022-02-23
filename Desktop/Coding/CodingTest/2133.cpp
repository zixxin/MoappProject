#include <bits/stdc++.h>
using namespace std;

int main() {
    int N;
    cin >> N;

    int dp[N+1];
    fill(&dp[0],&dp[N],0);
    dp[2] = 3;

    for(int i = 4; i <= N; i+=2) {
        dp[i] = 3*dp[i-2] + 2*dp[i-4] + 2;
    }
    // 11 41 153 571
    cout << dp[N] << "\n";
}