#include <iostream>

using namespace std;


void compara(int num_relatorios[], int num_Adson[], int relatorios, int Adson)
{
	int comp1;
	int comp2;
	int vet[10];
	for(int i = 0; i < Adson; i++)
	{
		comp1 = num_Adson[i];
		for(int j = 0; j < relatorios; j++)
		{
			comp2 = num_relatorios[j];
			vet[j] = comp2;
			if(comp1 == comp2)
				vet[j] = 0 ;

		}
		cout << vet[i] << endl;
	}

}

int main()
{
	int relatorios;//Numeros de relatorios enviados pelos professores
	int Adson;//Numeros de relatorios enviado pelo Adson

	cin >> relatorios;
	cin >> Adson;

	int num_relatorios[relatorios];//Numeros dos relatorios
	int num_Adson[Adson];//Numero dos relatorios de Adson

	for(int i = 0; i < relatorios ; i++)
		cin >> num_relatorios[i];

	for(int j = 0; j < Adson ; j++)
		cin >> num_Adson[j];

	compara(num_relatorios, num_Adson, relatorios, Adson);

}
