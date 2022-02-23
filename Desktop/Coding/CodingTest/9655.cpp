#include <bits/stdc++.h>
using namespace std;
bool dp[1001] = {false,};
int N ;

void find_answer()
{
    for(int i = 4 ; i <= N; i++)
        dp[i] = !dp[i-1] | !dp[i-3] ;
}

int main()
{
    cin >> N ;
    dp[1] = true, dp[3] = true ;
    find_answer() ;
    dp[N] == true ? cout << "SK\n" : cout << "CY\n";
}