    #include <bits/stdc++.h>
    using namespace std;

    void merge(int a[],int p,int q,int r)
    {
        int i,j,k;
        int n1=q-p+1,n2=r-q;
        int R[n2],L[n1];

        for(i=0;i<n1;++i)
        L[i]=a[p+i];

        for(j=0;j<n2;++j)
        R[j]=a[j+q+1];

        i=j=0;
        k=p;

        while(i<n1&&j<n2)
        {
            if(L[i]<=R[j])
            {
                a[k]=L[i];
                ++i;
            }
            else
            {
                a[k]=R[j];
                ++j;
            }
            ++k;
        }

        while(i<n1)
        {
            a[k]=L[i];
            ++k;
            ++i;
        }

        while(j<n2)
        {
            a[k]=R[j];
            ++k;
            ++j;
        }
    }

    void mergesort(int a[],int p,int r)
    {
        if(p<r)
        {
            int q=(p+r)/2;
            mergesort(a,p,q);
            mergesort(a,q+1,r);
            merge(a,p,q,r);
        }
    }

    int main() {
    	int t,n,k;
    	cin>>t;
    	while(t--)
    	{
    	    int s=0,i;
    	    cin>>n>>k;
    	    int a[n];
    	    for(i=0;i<n;++i)
    	    cin>>a[i];

    	    mergesort(a,0,n-1);
    	    int m=((k)<(n-k)?k:n-k);
    	    for(i=0;i<m;++i)
    	    s+=a[i];


    	    int p=0;
    	    for(;i<n;++i)
    	    p+=a[i];

    	    cout<<p-s<<"\n";

    	}
    	return 0;
    }
