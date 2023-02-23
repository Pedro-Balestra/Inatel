#include <iostream>

using namespace std;

struct treenode
{

	int info;
	treenode *esq;
	treenode *dir;
};
typedef treenode* treenodeptr;


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

int numFolhas(treenodeptr arvore)
{

	if(arvore == NULL)
		return 0;
	else if(arvore->esq == NULL && arvore->dir == NULL)
	{
		return 1;
	}
	else
	{
		return numFolhas(arvore->esq) + numFolhas(arvore->dir);
	}

}

int main()
{
	treenodeptr arvore = NULL;

	int x; //Números à serem inseridos
	int t = 0; //Número de folhas

	cin >> x;

	while(x != -1)
	{

		tInsere(arvore, x);
		cin >> x;
	}

	t = numFolhas(arvore);

	cout << t << endl;

	return 0;
}

// libera a memoria 
void tDestruir (treenodeptr &arvore)
{
	if (arvore != NULL)
	{
		tDestruir(arvore->esq);
		tDestruir(arvore->dir);
		delete arvore;
	}
	arvore = NULL;
}
