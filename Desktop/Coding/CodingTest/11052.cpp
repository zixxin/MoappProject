#include <iostream>
#include <numeric>
#include <algorithm>
#include <vector>
using namespace std ;
int dp[1001][1001] ;

void make_dp(vector<int> &arr , int N)
{
    for(int i = 1 ; i <= N ; i++)
    {
        dp[1][i] = arr[1] * i;
    }

    for(int i = 2 ; i <= N ; i++)
    {
        dp[i][1] = arr[1] ;
        for(int j = 2 ; j<= N ; j++)
        {
            if(j - i >= 0) dp[i][j] = dp[i][j - i] + arr[i] ;
            dp[i][j] = max(dp[i-1][j], dp[i][j]) ;
        }
    }
}

int main()
{
    int N ;
    cin >> N ;
    vector<int> arr(N + 1) ;
    for(int i = 1 ; i<= N ; i++)
    {
        cin >> arr[i] ;
    }
    make_dp(arr, N) ;
    cout << dp[N][N] ;
}