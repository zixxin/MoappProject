#include <bits/stdc++.h>
using namespace std;

int main() {
    int numOfCoin = 0, max_money = 0;
    cin >> numOfCoin >> max_money;
    int arr[max_money+1];
    int coin[numOfCoin+1];
    fill(&arr[0], &arr[max_money+1],0);
    arr[0] = 1;

    for(int i = 1; i <= numOfCoin; i++) {
        cin >> coin[i];
    }

    for(int item = 1; item <= numOfCoin; item++) {
        for(int money = 1; money <= max_money; money++) {
            if(money - coin[item] >= 0) arr[money] += arr[money - coin[item]];
            //cout << arr[money] << " ";
        }
        //cout << "\n";
    }
    cout << arr[max_money] << "\n";
}