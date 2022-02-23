#include <iostream>
using namespace std ;
long long int arr[91] ;

int main()
{
    int N ;
    cin >> N ;
    arr[1] = 1, arr[2] = 1 ;
    for(int i = 3 ; i <= N ; i++)
    {
        arr[i] = arr[i-1] + arr[i-2] ;
    }
    cout << arr[N] ;
}