#include <bits/stdc++.h>
using namespace std;

int rev(int input)
{
    int value = 0 ;
    while(input) value = value*10 + input%10, input /= 10 ;
    return value;
}

int main()
{
    
    int N, palindrome ;
    cin >> N ;
    
    for(int i = 0; i < N; i++)
    {
        cin >> palindrome ;
        palindrome += rev(palindrome) ;
        palindrome == rev(palindrome) ? cout << "YES\n" : cout << "NO\n" ;
    }
}