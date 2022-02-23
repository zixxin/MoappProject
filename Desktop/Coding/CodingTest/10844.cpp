#include <iostream>
#define MOD_NUM 1000000000
using namespace std ;
int arr[101] ;

int main()
{
    int N ;
    cin >> N ;
    arr[1] = 9 ;
    for(int i = 2 ; i <= N ; i++)
    {
        arr[i] = arr[i-2] * 2 - 1 ;
        arr[i] % MOD_NUM ;
    }
    cout << arr[N] ;
}