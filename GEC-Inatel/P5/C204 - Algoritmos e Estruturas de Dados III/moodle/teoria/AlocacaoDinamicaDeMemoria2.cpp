#include <iostream>
#include <iomanip>

using namespace std;

struct nota
{
	int notas[4];
	float media;
	//float soma;
};

int main()
{
	nota *v; //ponteiro
	int i;//var auxiliar
	int j;//var auxiliar
	int qnt;//quantidade de alunos
	float soma;

	//Entrada da quantidade de aulnos
	cin >> qnt;

	v = new nota[qnt];

	//Entrada das notas
	for (i = 0; i < (qnt * 4); i++)//qnt*4 = 8 para esse caso de teste
	{
		cin >> v -> notas[i];
	}

	//Somas das notas
	for (j = 0; j < (qnt * 4); j++)
	{
		 soma = soma + v -> notas[j];
	}

	//Calculo da media
	v -> media = soma / (qnt * 4);

	//Sa?da
	cout << fixed << setprecision(2) << v -> media << endl;

	delete [] v;

	return 0;
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        