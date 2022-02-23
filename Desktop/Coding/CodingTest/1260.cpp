#include <bits/stdc++.h>
using namespace std ;
int vertax, edge, start_v ;

void bfs(vector<int> &arr, bool graph[1001][1001])
{
    queue<int> que ;
    que.push(start_v) ;

    while(!que.empty())
    {
        arr.push_back(que.front()) ;
        int now = que.front() ;
        que.pop() ;

        for(int i = 1 ; i <= vertax ; i++)
        {
            if(graph[now][i]) 
            {
                que.push(i) ;
                for(int j = 1 ; j <= vertax ; j++)
                {
                    graph[j][i] = false ;
                }
            }
            graph[i][now] = false ;
        }
    }

    arr.erase(unique(arr.begin(),arr.end()), arr.end()) ;
}

void dfs(vector<int> &arr, bool graph[1001][1001], int start_v)
{
    arr.push_back(start_v) ;
    for(int i = 1 ; i <= vertax ; i++)
        graph[i][start_v] = false ;
    
    for(int i = 1 ; i <= vertax ; i++)
    {
        if(graph[start_v][i]) dfs(arr, graph, i) ;
    }
}

int main()
{
    ios::sync_with_stdio(0), cin.tie(0), cout.tie(0) ;
    cin >> vertax >> edge >> start_v ;
    int start, end ;
    bool Bgraph[1001][1001] ;
    bool Dgraph[1001][1001] ;
    fill(&Bgraph[0][0], &Bgraph[1000][1000], 0) ;
    fill(&Dgraph[0][0], &Dgraph[1000][1000], 0) ;

    for(int i = 0 ; i < edge ; i++)
    {
        cin >> start >> end ;
        Bgraph[start][end] = true ;
        Bgraph[end][start] = true ;
        Dgraph[start][end] = true ;
        Dgraph[end][start] = true ;
    }

    vector<int> BFS_arr, DFS_arr ;
    bfs(BFS_arr, Bgraph) ;
    dfs(DFS_arr, Dgraph, start_v) ;

    for(int it : DFS_arr)
        cout << it << " ";
    cout << "\n";

    for(int it : BFS_arr)
        cout << it << " ";
    cout << "\n";
}

/**
 * @brief 
 * void bfs(int x){
    printf("%d ",x);
    bvisited[x]=true;
    queue<int> q;
    q.push(x);
    while(!q.empty()){
        int size = q.size(); 
        for(int i=0;i<size;i++){
            int curr = q.front();
            q.pop();
            for(int next:adj[curr]){
                if(!bvisited[next]){
                    bvisited[next]=true;
                    printf("%d ",next);
                    q.push(next);
                }
            }
        }
    }
}
 * 
 */