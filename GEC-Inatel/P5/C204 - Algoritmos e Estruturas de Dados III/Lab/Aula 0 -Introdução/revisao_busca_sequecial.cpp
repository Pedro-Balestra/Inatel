#include <iostream>

using namespace std;

int main() // O(N)
{
	int N; // tamanho do vetor 
	int V[100]; // vetor
	int X; // numero a ser buscado no vetor
	bool achei;
	
	cin >> N; // tamanho do vetor
	
	for(int i = 0;i < N; i++)
	{
		cin >> V[i]; // entrada do vetor
	}
	
	cin >> X; // numero a ser buscado no vetor
	
	achei = false; // inicialmente, nao achei
	for(int i = 0;i < N; i++)
	{
		if(X == V[i]) // se for igual
			achei = true; // achei
	}

	if(achei)
	{
		cout << "O numero " << X << " esta no vetor" << endl;
	}
	else
	{
		cout << "O numero " << X << " nao esta no vetor" << endl;
	}
	return 0;
}