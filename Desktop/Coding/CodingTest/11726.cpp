#include <bits/stdc++.h>
using namespace std;

int main() {
    long long int N, dp[1000] = {0,};
    dp[0] = 1; dp[1] = 2;
    for(int i = 2; i < 1000; i++) {
        dp[i] = dp[i-1] + dp[i-2];
        dp[i] = dp[i] % 10007;
    }

    cin >> N;
    cout << dp[N-1] << "\n";
}