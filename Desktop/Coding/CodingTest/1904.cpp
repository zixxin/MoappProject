#include <iostream>
#define MOD 15746
using namespace std ;
int dp[3][2] ;

int main()
{
    int N ;
    cin >> N ;
    dp[0][0] = 1, dp[1][0] = 1, dp[1][1] = 1 ;
    for(int i = 3 ; i <= N ; i++)
    {
        int k = (i + 2) % 3 ;
        dp[k][0] = ( dp[(k + 2) % 3][0] + dp[(k + 2) % 3][1] ) % MOD ;
        dp[k][1] = ( dp[(k + 1) % 3][0] + dp[(k + 1) % 3][1] ) % MOD ;
    }
    cout << (dp[(N+2) % 3][0] + dp[(N+2) % 3][1]) % MOD ;
}