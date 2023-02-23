#include <iostream>
#include <locale>

using namespace std;

// struct de dados

struct item
{
	int nivel_importancia; // nivel_importanciaor do item
	int tamanho_bits; // tamanho_bits do item

};

// Variáveis Globais

int pd[1000][1461];  // nivel_importanciaor maximo sendo:
                    // olhando do item 'i'->final
                   // olhando uma mochila de capacidade 'j'
                   
int caminho[1000][1461]; // utilizado para recuperar quais itens foram escolhidos
                        // 0 -> nao pegar o item
                       // 1 -> pegar o item

//Função Principal

int main()
{setlocale(LC_ALL, "Portuguese"); //Para habilitarmos a língua Portuguesa.
	
	int qnt_arquivos; // quantidade de itens
	int capacidade = 1461; // capacidade total da mochila
	item v[1000]; // vetor de itens
	int arquivos_Enviados = 0; // contador utilizado para o loop principal
	int x = 0; // contador para mostrar o número do pacote

	// ENTRADA:
	
	cout << "Entre com a quantidade de arquivos à serem enviados (0 a 1000): " << endl;
	cin >> qnt_arquivos;
	
	// Crítica de dados para o número de arquivos
	while (qnt_arquivos > 1000 || qnt_arquivos < 0){
		
		cout << "Entrada Inválida !!!! Por favor, entre com a quantidade válida de arquivos à serem enviados (0 a 1000): " << endl;
		cin >> qnt_arquivos;
	}
	
	cout << endl;
	cout << "--------------------//--------------------" << endl;
	cout << endl;

	//Crítica de dados para os níveis de importância e os respectivos tamanhos
	for(int i = 0; i < qnt_arquivos ; i++)
	{
		
		cout << "Entre com a importância do arquivo[" << i << "] (De 0 à 10)" << endl;	
		cin >> v[i].nivel_importancia;
			
		while (v[i].nivel_importancia > 10 || v[i].nivel_importancia < 0){
			
			cout << "Entrada Inválida !!!! Por favor, digite um nível de importância válido (De 0 à 10): " << endl;
			cin >> v[i].nivel_importancia;
		}		

		cout << "Entre com o tamanho, em Bytes, do arquivo[" << i << "](De 0 bytes à 1460 bytes)" << endl;	
		cin >> v[i].tamanho_bits;
			
		while (v[i].tamanho_bits > 1460 || v[i].tamanho_bits < 0){
			
			cout << "Entrada Inválida !!!! Por favor, digite um tamanho válido (De 0 bytes à 1460 bytes): " << endl;
			cin >> v[i].tamanho_bits;
		}	
	}

	cout << endl;
	cout << "--------------------//--------------------" << endl;
	cout << endl;

	//Alocando dinamicamente
	bool enviado[qnt_arquivos];;

	for(int k = 0; k < qnt_arquivos; k++)
	{
		enviado[k] = false;
	}

	while(arquivos_Enviados != qnt_arquivos)
	{

		// CASO BASE:
		// olhando do ultimo item para frente, nivel_importancia. maximo = 0
		for(int j = 0; j <= capacidade; j++)
			pd[qnt_arquivos][j] = 0;

		// olhando tendo uma mochila de capacidade 0, o nivel_importancia. maximo=0
		for(int i = 0; i <= qnt_arquivos; i++)
			pd[i][0] = 0;


		// CASO GERAL
		if(qnt_arquivos > 0)
		{
			for(int i = qnt_arquivos - 1; i >= 0; i--)
				for(int j = 1; j <= capacidade; j++)
				{
					int pega, npega; // nivel_importancia. para caso eu pegar ou nao pegar o item 'i'

					npega = pd[i + 1][j]; // olhar o proximo item, mantendo a capacidade 'j'

					if(j >= v[i].tamanho_bits && enviado[i] == false) // se eu tiver capacidade disponivel p/ pegar o item 'i'
						pega = pd[i + 1][j - v[i].tamanho_bits] + v[i].nivel_importancia;
					// olho o proximo item, subtraio o tamanho_bits da capacidade
					// disponivel, e somo o nivel_importanciaor do item 'i'
					else
						pega = 0; // se nao posso pegar, o valor eh 0



					if(pega > npega) // se valer a pena pegar
					{
						pd[i][j] = pega;
						caminho[i][j] = 1;
					}

					else // se valer a pena nao pegar
					{
						pd[i][j] = npega;
						caminho[i][j] = 0;
					}
				}
		}
		// observando do item 0->final
		// uma mochila de capacidade igual a 'capacidade'



		// RECUPERACAO

		// Comeca na posicao final
		int i, j;
		i = 0; // do item 0->final
		j = capacidade; // para uma mochila de capacidade max


		cout << endl << "Pacote " << x + 1 << endl;

		while(i != qnt_arquivos)  // enquanto eu nao chegar no ultimo item
		{


			if(caminho[i][j] == 0 || enviado[i] == true) // se nesse momento a melhor opcao foi nao pegar eu nao pego
				i++; // avanço para o proximo i, mantendo a capacidade

			else // if(caminho[i][j] == 1) /// se nesse momento a melhor opcao for pegar, eu pego
			{

				if (enviado[i] == false && caminho[i][j] == 1)
				{
					j -= v[i].tamanho_bits; // j = j - tamanho_bits // diminuo a capacidade disponivel
					cout << i << " ";
					enviado[i] = true;
					arquivos_Enviados++;
					i++; // avanco para o proximo i
				}

				else
				{
					i++;
				}

			}
		}

		x++;
	}

	return 0;
}


