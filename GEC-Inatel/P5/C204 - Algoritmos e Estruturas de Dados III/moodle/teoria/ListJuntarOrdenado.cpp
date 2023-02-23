#include <iostream>
#include <list>

using namespace std;

int main()
{
	list<int> lista1;
	list<int> lista2;
	list<int> lista3;
	list<int>::iterator it1;
	list<int>::iterator it2;
	int x;

	//1 3 5 0
	cin >> x;
	while(x != 0)
	{
		lista1.push_back(x);
		cin >> x;
	}

	//2 4 6 8 0
	cin >> x;
	while(x != 0)
	{
		lista2.push_back(x);
		cin >> x;
	}

	it1 = lista1.begin();
	it2 = lista2.begin();

	while(!lista1.empty() && !lista2.empty())
	{
		if(*it1 < *it2)
		{
			lista3.push_back(*it1);
			lista1.pop_front();
			it1 = lista1.begin();
		}
		else
		{
			lista3.push_back(*it2);
			lista2.pop_front();
			it2 = lista2.begin();
		}
	}
	if(!lista1.empty())
	{
		while(!lista1.empty())
		{
			x = *lista1.begin();
			lista3.push_back(x);
			lista1.pop_front();
		}
	}
	else
	{
		while(!lista2.empty())
		{
			x = *lista2.begin();
			lista3.push_back(x);
			lista2.pop_front();
		}
	}

	while(!lista3.empty())
	{
		x = *lista3.begin();
		cout << x << " ";
		lista3.pop_front();
	}

}