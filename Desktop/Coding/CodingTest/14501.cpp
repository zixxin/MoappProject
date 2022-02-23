#include <iostream>
#include <algorithm>
using namespace std ;
int dp[17] ;

struct Toesa
{
    int day ;
    int money ;
} ;

int main()
{
    int N , maximum = 0;
    cin >> N ;
    struct Toesa arr[16] ;
    
    for(int i = 1 ; i <= N ; i++)
    {
        cin >> arr[i].day >> arr[i].money ;
    }

    for(int decrease = N ; decrease > 0 ; decrease--)
    {
        if(decrease + arr[decrease].day <= N + 1)
        {
            dp[decrease] = dp[decrease + arr[decrease].day] + arr[decrease].money ;
        }
        dp[decrease] = max(maximum, dp[decrease]) ;
        maximum = max(maximum, dp[decrease]) ;
    }

    cout << maximum ;
}