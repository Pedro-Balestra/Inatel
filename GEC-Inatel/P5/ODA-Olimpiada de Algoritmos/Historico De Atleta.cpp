#include <iostream>

using namespace std;

int main()
{
	int pessoas;//Quantidade de pessoas no Brasil
	int atletas;//Quantida de atletas no Brasil
	
	//Entrada de Dados
	cin >> pessoas;
	cin >> atletas;
	
	//Vacina necessarias é a quantidade de pessoas no Brasil - quantidade de atletas no Brasil
	int vacina = pessoas - atletas;
	
	//Saida de Dados
	Serão necessarias 2 doses de vacina para cada pessoa
	cout << vacina*2 << endl;
}