#include <iostream>
#include <list>

using namespace std;

int encontrar(list<int> lista, float x)
{
	list <int> :: iterator p;

	for (p = lista.begin(); p != lista.end(); p++)
	{

		if (*p == x)
		{
			return 1;
		}
	}
	
	return -1;
}

int main()
{
	list <int> lista; 
//	list <int> :: iterator it; 
	int x; 
	int n; 
	int y = 0; 

	cin >> x;

	while (x != 0)
	{
		lista.push_back(x);
		cin >> x;
	}

	cin >> n;

	y = encontrar(lista, n);

	if (y == 1)
	{

		cout << "Encontrado" << endl;
	}

	else cout << "Nao encontrado" << endl;

	return 0;
}