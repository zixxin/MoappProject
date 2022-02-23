#include <bits/stdc++.h>
using namespace std;

int main() {
    string temp;
    cin >> temp;
    string croatiaLangue[] = { "c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z=" };
    for(string it : croatiaLangue) {
        string::size_type sub = temp.find(it);
        while(sub != temp.npos) {
            temp.replace(sub,it.length(),"#");
            sub = temp.find(it);
        }
    }
    cout << temp.length() << "\n";
}