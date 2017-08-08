#include <bits/stdc++.h>
using namespace std;
void merge(int a[],int p,int q,int r)
{
    int n1=q-p+1;
    int n2=r-q;
    int L[n1],R[n2];
    int i,j,k;

    for(i=0;i<n1;++i)
    L[i]=a[p+i];

    for(j=0;j<n2;++j)
    R[j]=a[j+q+1];


    i=0;
    j=0;
    k=p;

    while(i < n1 && j < n2)
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

      while (i < n1)
    {
        a[k] = L[i];
        i++;
        k++;

    }

    while (j < n2)
    {
        a[k] = R[j];
        j++;
        k++;

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

	int t=4;
	cin>>t;
	int a[t];
	for(int i=0;i<t;++i)
	cin>>a[i];
	mergesort(a,0,t-1);
	for(int i=0;i<t;++i)
	cout<<a[i]<<"\n";
	return 0;
}
