#include <iostream>
#include <locale>

using namespace std;

struct treenode
{

	int info;
	treenode *esq;
	treenode *dir;
};
typedef treenode* treenodeptr;


//Função que fará a Inserção dos nós
void tInsere(treenodeptr &arvore, int x)
{

	if (arvore == NULL)  //Se a raiz for vazia, insere nela.
	{
		arvore = new treenode;
		arvore -> info = x;
		arvore -> esq = NULL;
		arvore -> dir = NULL;
	}

	else
	{
		if (x < arvore -> info)
			tInsere(arvore -> esq, x);

		else
			tInsere(arvore -> dir, x);

	}

}

// percurso em-ordem, mostrando o conteudo de cada no
void emOrdem (treenodeptr arvore)
{
	if (arvore != NULL)
	{
		emOrdem(arvore->dir);
		cout << arvore->info << endl;
		emOrdem(arvore->esq);
	}

}

int main()
{
	treenodeptr arvore = NULL;

	int primeiro_num;//Primeiro numero da arvore

	//Inserindo elementos na árvore
	cin >> primeiro_num;

	while(primeiro_num != -1)
	{
		tInsere(arvore, primeiro_num);
		cin >> primeiro_num;
	}

	emOrdem(arvore);

	return 0;
}
