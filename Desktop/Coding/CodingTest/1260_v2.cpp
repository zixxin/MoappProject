#include <cstdio>
#include <vector>
#include <queue>
#include <algorithm>
#include <cstring>
using namespace std;
bool dvisited[1001];
bool bvisited[1001];
int n;
vector< vector<int> > adj(1001);
void dfs(int x){
    printf("%d ",x);
    dvisited[x]=true;
    for(int next:adj[x]){
        if(!dvisited[next]){
            dfs(next);
        }
    }
}
void bfs(int x){
    printf("%d ",x);
    bvisited[x]=true;
    queue<int> q;
    q.push(x);
    while(!q.empty()){
        int size = q.size(); 
        //for(int i=0;i<size;i++){
            int curr = q.front();
            q.pop();
            for(int next:adj[curr]){
                if(!bvisited[next]){
                    bvisited[next]=true;
                    printf("%d ",next);
                    q.push(next);
                }
            }
        //}
    }
}
int main(){
    int m,v,x,y;
    scanf("%d %d %d",&n,&m,&v);
    while(m--){
        scanf("%d %d",&x,&y);
        adj[x].push_back(y);
        adj[y].push_back(x);
    }
    for(int i=0;i<=n;i++){
       sort(adj[i].begin(),adj[i].end());
    }
    memset(bvisited,false,sizeof(bvisited));
    memset(dvisited,false,sizeof(dvisited));
    dfs(v);
    printf("\n");
    bfs(v);
    printf("\n");
    return 0;
}