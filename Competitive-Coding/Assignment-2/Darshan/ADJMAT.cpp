#include <bits/stdc++.h>
#define f(i,n) for(int i=1;i<=n;++i)
#define all(c) (c).begin(),(c).end()
#define sz(a) int((a).size()) 
#define pb push_back 
#define vi vector<int>
#define mod 1000000007
#define ll long long


using namespace std;

int main() {
    
    ios::sync_with_stdio(false);
    int m,n;
    cin>>n>>m;
    int a[n][n];
    f(i,n)
    f(j,n)
    a[i][j]=0;
    
    int p,q;
    f(i,m)
    {
        cin>>p>>q;
        a[p][q]=1;
        a[q][p]=1;
    }
    
    f(i,n)
    {
        f(j,n)
        cout<<a[i][j];
        cout<<endl;
    }
	return 0;
}
