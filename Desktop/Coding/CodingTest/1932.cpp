#include <bits/stdc++.h>
using namespace std;
int N ;
int arr[502][502] ;
int dp[502][502] ;
// 2차원의 주소는 &arr[0~ 501][0~501]인데 왜 1차원은 &arr[0~502]인가..
int dynamic_programming()
{
    int value = 0 ;
    for(int i = 1 ; i <= N ; i++)
    {
        for(int j = 1 ; j <= i ; j++)
        {
            dp[i][j] = max(dp[i-1][j-1], dp[i-1][j]) + arr[i][j] ;
            value = max(value, dp[i][j]) ;
        }
    }
    return value ;
}

void input()
{
    cin >> N ;
    
    fill(&arr[0][0], &arr[501][501], 0) ;
    fill(&dp[0][0], &dp[501][501], 0) ;

    for(int i = 1 ; i <= N ; i++)
    {
        for(int j = 1 ; j <= i; j++)
        {
            cin >> arr[i][j] ;
        }
    }
}

int main()
{
    input() ;
    int value = dynamic_programming() ;
    cout << value << "\n" ;
}