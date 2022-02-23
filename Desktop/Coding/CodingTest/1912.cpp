#include <bits/stdc++.h>
using namespace std ;
int arr[100001] ;
int dp[100001] ;
int main()
{
    int N ;
    cin >> N ;
    for(int i = 1 ; i <= N ; i++)
    {
        cin >> arr[i] ;
    }
    dp[1] = arr[1] ;

    for(int i = 2 ; i <= N ; i++)
    {
        dp[i] = max(dp[i-1] + arr[i] , arr[i]) ;
    }
    cout << *max_element(&dp[1], &dp[N+1]) ;
}