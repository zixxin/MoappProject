#include <iostream>
#include <algorithm>
using namespace std ;
// dp [ col ] [ row ]
int dp[3][2] ;
int arr[100001][2] ;

int max_triple(int a, int b, int c)
{
    return max(a, max(b, c));
}

void fill_arr(int line)
{
    for(int row = 0 ; row <= 1 ; row++)
        for(int col = 1 ; col <= line ; col++)
            cin >> arr[col][row] ;
}

void fill_dp(int line)
{
    dp[1][0] = arr[1][0], dp[1][1]  = arr[1][1] ;

    for(int col = 2 ; col <= line ; col++)
    {
        int now = col % 3 ;
        for(int row = 0 ; row <= 1 ; row++)
        {
            dp[now][row] = max_triple(dp[(now + 2) % 3][!row], dp[(now + 1) % 3][row], dp[(now + 1) % 3][!row]) + arr[col][row];
        }
    }
        
    cout << *max_element(&dp[0][0], &dp[2][2]) << "\n" ;
}

int main()
{
    ios::sync_with_stdio(0), cin.tie(0), cout.tie(0) ;
    int N, line;
    cin >> N ;
    for(int i = 0 ; i < N ; i++)
    {
        cin >> line ;
        fill(&arr[0][0], &arr[100000][2], 0) ;
        fill_arr(line) ;
        fill(&dp[0][0] , &dp[2][2], 0) ;
        fill_dp(line) ;
    }
}