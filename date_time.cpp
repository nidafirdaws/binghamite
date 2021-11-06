#include <iostream>
using namespace std;

int main()
{
	
	int count=0;
	
	for(int day=0; day<7; day++)
      for(int hour=0; hour<24; hour++)
         for(int min=0; min<60; min++)
            for(int sec=0; sec<60; sec++)
          
		     {
		       cout<<day<<":"<<hour<<":"<<min<<":"<<sec<<endl;
	            count++;
	        }
	     
	     cout<<"count: "<<count<<endl<<endl;
	
	system("PAUSE");
	return 0;
}
