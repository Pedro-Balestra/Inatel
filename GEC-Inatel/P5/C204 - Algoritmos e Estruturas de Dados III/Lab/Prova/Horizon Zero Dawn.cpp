#include <iostream>
#include <cstring>

using namespace std;

void calcula_LPS(int lps[], char P[], int tamP)
{
	// tamanho do maior prefixo que tambem eh sufixo anterior
	int tam = 0;

	lps[0] = 0; // caso base

	// o loop calcula lps[i] para i = 1 ate tamP-1
	int i = 1;
	while (i < tamP)
	{
		if (P[i] == P[tam]) // se encontrar uma letra que bate tanto como prefixo quanto como sufixo
		{
			tam++; // aumento o tamanho do maior prefixo que tambem eh sufixo
			lps[i] = tam; // salvo o valor para esse prefixo
			i++; // vou para o proximo prefixo
		}
		else // (p[i] != p[tam]) se encontrar uma letra que nao bate como prefixo e sufixo
		{
			if (tam != 0) // se o tamanho do maior prefixo que tambem eh sufixo atual for diferente de 0
			{
				tam = lps[tam - 1]; // volto pro maior prefixo que tambem eh sufixo considerando o prefixo anterior
				// Note que neste caso nao incrementamos o 'i'
			}
			else // se o tamanho do maior prefixo que tambem eh sufixo atual for 0
			{
				lps[i] = 0; // o maior prefixo que tambem é prefixo agora vale 0
				i++; // vou para o proximo prefixo
			}
		}
	}
}

int kmp(char T[], char P[], int tamT, int tamP)
{
	int lps[tamP]; // vetor que indica para onde voltarei no padrao quando ocorrer um mismatch
	// lps -> indica o tamanho do maior sufixo de p[0...i] que tambem eh prefixo de p[0...i] (exceto a string inteira)

	calcula_LPS(lps, P, tamP);

	int j = 0; // j eh tamanho do meu match atual, ONDE EU ESTOU NO MEU PADRAO
	int pos_texto = 0; // posicao no texto
	while(pos_texto < tamT)
	{
		if(T[pos_texto] == P[j]) // match
		{
			j++;
			pos_texto++;
			if(j == tamP) // encontrei o padrao no texto na posicao (i-tamP) até i
			{
				j = lps[j - 1];
				return 1;//achou
			}
		}
		else // mismatch
		{
			if(j != 0) // se ocorreu mismatch depois de j matchs
				j = lps[j - 1];
			else // mismatch na comparacao da primeira letra
				pos_texto++;
		}

	}
	return 0;//não achou
}



int main()
{
//    KMP ENCONTRA PADRÃO NO TEXTO
//    MAIOR PREFIXO QUE BATE COM O SUFIXO , QUE NAO SAO DO MSM TAMANHO

	char texto[100];
	char padrao[100];

	//Entrando com o texto
	cin >> texto;

	int tam_texto = strlen(texto);//Pegadando o tamanho do texto
	int tam_padrao = 3;//Tamanho do Padrão é 3 conforme a questão mostra

	strcpy(padrao, "123");//Copiando o 123 para o padrão
	if(kmp(texto, padrao, tam_texto, tam_padrao) == 1)//Chamando a função e verificando se foi achado ou não 
	{                                        // 1 = foi achado e 0 = Não foi achado
		cout << "PSI" << endl;
	}

	strcpy(padrao, "321");//Copiando o 321 para o padrão
	if(kmp(texto, padrao, tam_texto, tam_padrao) == 1)//Chamando a função e verificando se foi achado ou não 
	{                                        // 1 = foi achado e 0 = Não foi achado
		cout << "SIGMA" << endl;
	}

	strcpy(padrao, "111");//Copiando o 111 para o padrão
	if(kmp(texto, padrao, tam_texto, tam_padrao) == 1)//Chamando a função e verificando se foi achado ou não 
	{                                        // 1 = foi achado e 0 = Não foi achado
		cout << "RHO" << endl;
	}

	strcpy(padrao, "222");//Copiando o 222 para o padrão
	if(kmp(texto, padrao, tam_texto, tam_padrao) == 1)//Chamando a função e verificando se foi achado ou não 
	{                                        // 1 = foi achado e 0 = Não foi achado
		cout << "XI" << endl;
	}

	strcpy(padrao, "333");//Copiando o 333 para o padrão
	if(kmp(texto, padrao, tam_texto, tam_padrao) == 1)//Chamando a função e verificando se foi achado ou não 
	{                                        // 1 = foi achado e 0 = Não foi achado
		cout << "ZETA" << endl;
	}

	return 0;
}
