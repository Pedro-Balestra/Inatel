#include<iostream>
#include<list>

using namespace std;

//Função para calcular a soma do numeros inseridos na lista
int soma(list<int> lista)
{
	int s = 0;//soma dos elementos da lista
	list<int>::iterator it;//variavel para varrer a lista

	for(it = lista.begin(); it != lista.end(); it++)
		s += *it;

	return s;
}

int main()
{
	list<int> lista; // ponteiro para a lista
	int x; // var aux para ler elementos a serem inseridos na lista

	// Lendo elementos e inserindo-os na lista
	cin >> x;
	while(x != 0)
	{
		lista.push_back(x);
		cin >> x;
	}

	cout << soma(lista) << endl;


	return 0;
}

