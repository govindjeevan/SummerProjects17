    #include <bits/stdc++.h>
    using namespace std;
    int main(void) {
    	string given,small,temp;
    	int t,n;
    	char tp;
    	cin>>t;
    	while(t--)
    	{

    	    cin>>n;
    	    cin>>given;
    	    int i,j;
    	    small=given;
    	    for(i=0;i<n;++i)
    	    for(j=0;j<n;++j)
    	    {
    	        temp=given;
    	        tp=given[i];
    	        temp.erase(i,1);
    	        temp.insert(j,1,tp);
    	        small=min(small,temp);
    	    }
    	    cout<<small<<"\n";
    	}
        	return 0;
        }
