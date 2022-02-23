//#include <bits/stdc++.h>
#include <iostream>
#include <algorithm>
#include <string>
#include <vector>
#include <iomanip>
using namespace std;

int main() {
    string temp;
    string change = "";
    int count = 0;
    cin >> temp;

    for(int i = 0; i < temp.size(); i++) {
        if(change.empty()) {change = temp[i]; count++; continue;}

        if(change[0] == 'c') {
            if(!(temp[i] == '=' || temp[i] == '-')) count++;
            change = "";
        }
        else if(change[0] == 'd') {
            if(temp[i] == 'z') {
                change += 'z'; continue;
            }
            else if(change.length() == 2 && temp[i] == '=') {
                change = "";
            }
            else if(temp[i] != '-') count++;
            change = "";
        }
        else if(change[0] == 'l') {
            if(temp[i] != 'j') count++;
            change = "";
        }
        else if(change[0] == 'n') {
            if(temp[i] != 'j') count++;
            change = "";
        }
        else if(change[0] == 's' || change[0] == 'z') {
            if(temp[i] != '=') count++;
            change = "";
        }
        else {
            change = "";
        }
    }

    if(!change.empty()) count++;

    cout << count;
}