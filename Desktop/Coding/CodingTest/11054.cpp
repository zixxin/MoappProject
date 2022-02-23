#include <iostream>
#include <vector>
#define SETTING ios::sync_with_stdio(0), cin.tie(0), cout.tie(0)
using namespace std ;
int arr[1001] ;
int upper[1001] ; 
int lower[1001] ;

void find_increase(int N)
{
    for(int i = 1 ; i<= N ; i++)
    {
        for(int j = 1 ; j <= i ; j++)
            if(arr[i] > arr[j]) upper[i] = max(upper[i], upper[j]) ;
        upper[i]++ ;
    }
}

void find_decrease(int N)
{
    for(int i = N ; i > 0 ; i--)
    {
        for(int j = N ; j >= i ; j--)
            if(arr[i] > arr[j]) lower[i] = max(lower[i], lower[j]) ;
        lower[i]++ ;
    }
}

int main()
{
    SETTING ;
    int N, answer = 0 ;
    cin >> N ;
    for(int i = 1 ; i<= N ; i++)
    {
        cin >> arr[i] ;
    }
    find_increase(N) ;
    find_decrease(N) ;
    for(int i = 1 ; i <= N ; i++)
    {
        answer = max(answer, upper[i] + lower[i] - 1) ;
    }

    cout << answer << "\n" ;
}