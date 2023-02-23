#include <iostream>
#include <list>

using namespace std;

int contar(list<int> lista){
	
	list <int> :: iterator p;
	int t = 0;

	for (p = lista.begin(); p != lista.end(); p++){
		t++;
	}
	
	return t;
}

int main()
{
	list <int> lista;  
	int x; 
	int y; 

	cin >> x;
	
	while (x != 0){
		lista.push_back(x);
		cin >> x;
	}

	y = contar(lista);

	cout << y << endl;
	
	return 0;
}