#include <bits/stdc++.h>
using namespace std;
int dp[301][3] ;
int stair[301] ;

int main()
{
    ios::sync_with_stdio(0), cin.tie(0), cout.tie(0) ;
    int N ;
    cin >> N ;

    for(int i = 1 ; i <= N ; i++)
        cin >> stair[i] ;

    dp[1][1] = stair[1] ;

    for(int i = 2 ; i <= N ; i++)
    {
        dp[i][2] = dp[i-1][1] + stair[i] ;
        dp[i][1] = max(dp[i-2][1], dp[i-2][2]) + stair[i] ;
    }
    
    cout << max(dp[N][1], dp[N][2]) << "\n" ;
    return 0 ;
}