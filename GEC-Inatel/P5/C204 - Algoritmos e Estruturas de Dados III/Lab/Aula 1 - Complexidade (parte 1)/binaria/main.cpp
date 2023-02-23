#include <iostream>
#include <algorithm> // biblioteca para a funcao sort

using namespace std;

// vetor,tamanho,numero a ser procurado
int busca_binaria(int *v, int tam, int num)
{
	int ini, mid, fim;
	bool achei;

	ini = 0; // primeira posicao
	fim = tam - 1; // ultima posicao
	achei = false;

	while(achei == false && ini <= fim) { // no ultimo caso fica igual (fim == ini), se não achar o ini fica  > fim
		mid = (ini + fim) / 2;
		if(v[mid] == num) {
			achei = true;
		} else if(v[mid] > num) {
			fim = mid - 1;
		} else {
			ini = mid + 1;
		}
	}
	if(achei) // se encontrei
		return mid; // retorna a posicao
	else // senao
		return -1; // retorna -1
}

int main()
{
	int N; // tamanho do vetor
	int V[100]; // vetor
	int X; // numero a ser buscado no vetor
	int pos;

	cin >> N; // tamanho do vetor

	for(int i = 0; i < N; i++) {
		cin >> V[i]; // entrada do vetor
	}

	// funcao para ordenar os valores
	// sort(nome_do_vetor,nome_do_vetor + numero_de_elementos);
	sort(V, V + N);

	cin >> X; // numero a ser buscado no vetor
	pos = busca_binaria(V, N, X); // posicao que foi encontrado
	if(pos == -1) { // nao achei
		cout << "O numero " << X << " nao esta no vetor" << endl;
	} else {
		cout << "O numero " << X << " esta no vetor" << endl;
	}
	return 0;
}
