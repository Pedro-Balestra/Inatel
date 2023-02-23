#include <iostream>
#include <cmath>
#include <cstring>

using namespace std;

int rabin_karp(char T[], char P[], int tamT, int tamP, int d, int q, int &numero_ocorrencias)
{

	int h; // valor utilizado para calculo de hash
	int p = 0; // padrao convertido para inteiro
	int t = 0; // texto convertido para inteiro
	int posicao_ultima_ocorrencia = -1;

	for(int i = 0; i < tamP; i++)
	{
		p = (d * p + (P[i]-'0')) % q; // converte o padrao
		t = (d * t + (T[i]-'0')) % q; // converte o texto para o primeiro valor (t0)
	}
	
	h = (int)pow(d, tamP - 1) % q; // utilizado para calculo de hash
	
	for(int i = 0; i <= tamT - tamP; i++)
	{
		if(p == t) // Se encontrei um valor de hash valido
		{
			// Verifico se ha diferencas
			int j;
			for(j = 0; j < tamP; j++)
			{
				if(P[j] != T[i + j])
				{
					break;
				}
			}

			if(j == tamP){
				posicao_ultima_ocorrencia = i;
				numero_ocorrencias++;
				return 1;
			}
		}

		if(i < tamT - tamP) // se ainda nao cheguei no final
		{
			t = (d * ( t - (T[i]-'0') * h ) + (T[i + tamP]-'0')) % q; // atualizo o ti para ti+1
			if(t < 0) t += q;
		}
	}
}

int main()
{

	char texto[100];
	char padrao[100];

	int d = 10; // cardinalidade do alfabeto usado no texto, em outras palavras, qtd de caracteres diferentes utilizados
	int q = 13; // número primo grande, para calcular os valores no hash
	int n; //tamanho do texto
	int m = 8; //tamanho do padrão
	int v = -1; //posição da última ocorrência 
	int numero_ocorrencias = 0; //número de ocorrências
	int i; //Qnt ligações
	int w = 0; //Contador

	cin >> i; 
	
	cin >> texto;
	
	n = strlen(texto);

	for(w = 0; w < i; w++){
		cin >> padrao;
		v = rabin_karp(texto, padrao, n, m, d, q, numero_ocorrencias);
		
		if (v == 1){
			cout << padrao << endl;
		}
	}


	return 0;
}





