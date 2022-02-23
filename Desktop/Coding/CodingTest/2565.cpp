#include <bits/stdc++.h>
using namespace std ;
int arr[501] = {5000, };
int longest[101] = {1, } ;
int main()
{
    int N, num1 , num2 ;
    cin >> N ;
    for(int i = 1 ; i <= N ; i++)
    {
        cin >> num1 >> num2 ;
        arr[num2] = num1 ;
    }

    for(int i = 1 ; i < 101 ; i++)
    {
        if(arr[i] > 500) continue ;
        for(int j = 1 ; j < 101 ; j++)
        {
            if(arr[j] > 500) continue ;
            if(arr[i] > arr[j]) longest[i] = max(longest[i], longest[j]) ;
        }
        longest[i]++ ;
    }
    int answer = *max_element(&longest[0], &longest[101]) ;
    cout << N - answer << "\n" ;
}