#include <iostream>
#include <algorithm>
#define MOD 10007
using namespace std ;

int dp[1001][10] ;

int adder(int N)
{
    int answer = 0 ;
    for(int i = 0 ; i < 10 ; i++)
    {
        answer += dp[N][i] ;
    }
    return answer % MOD;
}

int main()
{
    int N ;
    cin >> N ;
    fill(&dp[1][0], &dp[1][10], 1) ;
    
    for(int i = 2 ; i <= N ; i++)
    {
        int adder = 0 ;
        for(int j = 0 ; j < 10 ; j++)
        {
            adder += dp[i-1][j] ;
            dp[i][j] = (dp[i][j] + adder) % MOD ;
        }
    }
    
    cout << adder(N) ;
}