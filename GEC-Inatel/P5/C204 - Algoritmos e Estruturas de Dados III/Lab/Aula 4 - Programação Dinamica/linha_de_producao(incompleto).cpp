#include <iostream>
#include <list>
using namespace std;

int main()
{
	int n; // numero de maquinas por linha
	int a[2][100]; // a[i][j]: tempo de processamento da máquina j da linha i
	int t[2][100]; //t[i][j]: tempo pra ir da máquina j da linha i para a outra linha
	int e[2]; // e[i]: tempo de entrar na linha i
	int x[2]; // x[i]: tempo para sair da linha i

	int f[2][100]; // menor tempo para levar um chassi desde a entrada até a estação da linha "i" e máquina "j"
	int l[2][100]; // linha cuja estação j-1 é usada como o caminho mais rápido através da estação da linha "i" e máquina "j"

	int f_; // f* -> menor tempo total
	int l_; // l* -> linha cuja ultima estação é usada como o caminho mais rápido através de toda a fábrica

	// Entrada
	cout << "Entre com o numero de maquinas em cada linha: ";
	cin >> n;

	for(int i = 0; i < 2; i++) {
		cout << "Entre com o custo para entrar na linha " << i << endl;
		cin >> e[i];
	}

	for(int i = 0; i < 2; i++)
		for(int j = 0; j < n; j++) {
			cout << "Entre com o tempo de operacao da maquina " << j << " da linha " << i << endl;
			cin >> a[i][j];
		}

	for(int i = 0; i < 2; i++)
		for(int j = 0; j < n - 1; j++) {
			cout << "Entre com o tempo para mudar a partir da linha " << i << " para maquina " << j << endl;
			cin >> t[i][j];
		}

	for(int i = 0; i < 2; i++) {
		cout << "Entre com o custo para sair da linha " << i << endl;
		cin >> x[i];
	}

	// PROGRAMAÇÃO DINAMICA
	// inicialização
	int custo1, custo2;
	f[0][0] = e[0] + a[0][0];
	f[1][0] = e[1] + a[1][0];
	l[0][0] = -1;
	l[1][0] = -1;


	// caso geral
	for (int maq = 1; maq < n; maq++) {
		for(int linha = 0; linha < 2; linha++) {
			// calculo os custos para continuar na linha ou mudar
			if(linha == 0) {
				custo1 = f[0][maq - 1] + a[0][maq];
				custo2 = f[1][maq - 1] + t[1][maq - 1] + a[0][maq];
			} else {
				custo1 = f[1][maq - 1] + a[1][maq];
				custo2 = f[0][maq - 1] + t[0][maq - 1] + a[1][maq];
			}
			// avalio qual é melhor
			if(custo1 < custo2) {
				f[linha][maq] = custo1;
				l[linha][maq] = linha;
			} else {
				f[linha][maq] = custo2;
				if(linha == 0)
					l[linha][maq] = 1;
				else
					l[linha][maq] = 0;
			}
		}
	}

	// calculo para sair da linha de produção
	f[0][n] = f[0][n - 1] + x[0];
	l[0][n] = 0;
	f[1][n] = f[1][n - 1] + x[1];
	l[1][n] = 1;
	// analise do melhor tempo total
	if(f[0][n] < f[1][n]) {
		f_ = f[0][n];
		l_ = 0;
	} else {
		f_ = f[1][n];
		l_ = 1;
	}
	// resposta
	cout << "Menor tempo necessario para producao: " << f_ << endl;
	cout << "Melhor saida pela linha " << l_ << endl;
	for(int i = 0; i < 2; i++) {
		for(int j = 0; j <= n; j++)
			cout << l[i][j] << " ";
		cout << endl;
	}

	return 0;
}
