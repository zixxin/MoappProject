#include<bits/stdc++.h>
using namespace std;

int main() {
    string given[2];
    cin >> given[0] >> given[1];
    int dp[1001][1001];

    for(int i = 1; i <= given[0].length(); i++) {
        for(int j = 1; j <= given[1].length(); j++) {
            dp[i][j] = max(dp[i-1][j], dp[i][j-1]);
            if(given[0][i-1] == given[1][j-1]) dp[i][j] = dp[i-1][j-1] + 1;
            //cout << dp[i][j] << " ";
        }
        //cout << endl;
    }
    cout << dp[given[0].length()][given[1].length()] << "\n";
}