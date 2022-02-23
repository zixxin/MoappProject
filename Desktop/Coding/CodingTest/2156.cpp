#include<stdio.h>

#include<algorithm>

using namespace std;

int n,grape[10002],dp[10002][3];

int main(){

    scanf("%d",&n);

    for(int i=1;i<=n;i++) scanf("%d",&grape[i]);

    dp[1][0]=0; dp[1][1]=grape[1];

    for(int i=2;i<=n;i++){

        dp[i][1]=dp[i-1][0]+grape[i];

        dp[i][2]=dp[i-1][1]+grape[i];

        dp[i][0]=max(max(dp[i-1][0],dp[i-1][1]),dp[i-1][2]);

    }

    printf("%d",max(max(dp[n][0],dp[n][1]),dp[n][2]));

}
