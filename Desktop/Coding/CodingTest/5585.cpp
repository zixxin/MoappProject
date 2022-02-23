#include <bits/stdc++.h>
using namespace std;

int main() {
    int pay, count = 0;
    int arr[6] = {500, 100, 50, 10, 5, 1};
    cin >> pay;
    int change = 1000 - pay;

    for(int i = 0; i < 6; i++) {
        if(change >= arr[i]) {
            count += change / arr[i];
            change = change % arr[i];
        }
    }

    cout << count << "\n";
}