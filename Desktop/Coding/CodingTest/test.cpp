#include <iostream>
#include <iomanip>
#include <vector>
#include <algorithm>
#include <functional>
#include <string>
#include <math.h>
using namespace std;


int main() {
    int N;
    cin >> N;
    int dp[N+1][3];
    fill(&dp[0][0], &dp[N][3], 1) ;
    for(int i = 0 ; i <= N ; i++)
        cout << dp[i][0] << " " << dp[i][1] << " " << dp[i][2] << endl;
    return 0;
}