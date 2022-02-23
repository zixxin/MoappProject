#include <bits/stdc++.h>
using namespace std;
const int INF = 1e9;
int dp[3][1001];

int main(){
    ios::sync_with_stdio(0); cin.tie(0);
    int N; cin >> N;
    for(int j = 0; j < N; j++){
        for(int i = 0; i < 3; i++){
            cin >> dp[i][j];
        }
    }
    for(int j = 1; j < N; j++){
        for(int i = 0; i < 3; i++){
            dp[i][j] += min({(i != 0 ? dp[0][j - 1] : INF), (i != 1 ? dp[1][j - 1] : INF), (i != 2 ? dp[2][j - 1] : INF)});
        }
    }
    cout << min({dp[0][N - 1], dp[1][N - 1], dp[2][N - 1]});
    
    return 0;
}
