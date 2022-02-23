#include <bits/stdc++.h>
using namespace std ;
int arr[1001] ;
int dp[1001] = {1, };

int main()
{
    int N ;
    cin >> N ;

    for(int i = 1 ; i <= N ; i++)
        cin >> arr[i] ;
    
    for(int i = 1 ; i <= N ; i++)
    {
        for(int j = 1 ; j <= N ; j++)
        {
            if(arr[i] > arr[j]) dp[i] = max(dp[i], dp[j]) ;
        }
        dp[i]++ ;
    }

    cout << *max_element(&dp[0], &dp[1001]) ;
}