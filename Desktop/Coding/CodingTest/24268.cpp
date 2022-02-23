#include <bits/stdc++.h>
using namespace std ;


int main()
{
    int year, bits, value;
    cin >> year >> bits ;

    vector<int> arr(bits);
    iota(arr.begin(), arr.end(), 0) ;
    
    while(next_permutation(arr.begin(), arr.end()))
    {
        if(arr[0] == 0) continue;
        value = 0;

        for(int i = 0 ; i < arr.size() ; i++) {
            value += arr[arr.size() - i - 1] * pow(bits, i);
        }

        if(value > year)
        {
            cout << value << "\n";
            return 0;
        }
    }
    cout << "-1\n" ;
    return 0;
}