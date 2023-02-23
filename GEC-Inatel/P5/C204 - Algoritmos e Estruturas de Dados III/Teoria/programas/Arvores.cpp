#include<iostream>
using namespace std;

struct treenode
{
	int info;
	treenode *esq;
	treenode *dir;
};
typedef treenode *treenodeptr;

void tInsere(treenodeptr &p, int x)
{
	if (p == NULL) // insere na raiz
	{
		p = new treenode;
		p->info = x;
		p->esq = NULL;
		p->dir = NULL;
	}
	else if (x < p->info) // insere na subarvore esquerda
		tInsere(p->esq, x);
	else // insere na subarvore direita
		tInsere(p->dir, x);
}

void preOrdem (treenodeptr arvore)
{
	if (arvore != NULL)
	{
		cout << arvore->info << endl;
		preOrdem(arvore->esq);
		preOrdem(arvore->dir);
	}
}

void emOrdem (treenodeptr arvore)
{
	if (arvore != NULL)
	{
		emOrdem(arvore->esq);
		cout << arvore->info << endl;
		emOrdem(arvore->dir);
	}
}

void posOrdem (treenodeptr arvore)
{
	if (arvore != NULL)
	{
		posOrdem(arvore->esq);
		posOrdem(arvore->dir);
	}
}

void somaPosOrdem (treenodeptr arvore, int &s)
{
	if (arvore != NULL)
	{
		somaPosOrdem(arvore->esq, s);
		somaPosOrdem(arvore->dir, s);
		s += arvore->info;
	}
}

//Retorna a soma de todos os elementos da arvore
int soma(treenodeptr arvore)
{
	int s = 0; // s = 99

	somaPosOrdem(arvore, s);

	return s;
}


int main()
{
	treenodeptr arvore = NULL; //Ponteiro para a árvore

	//Inserindo elementos na árvore
	tInsere(arvore, 12);
	tInsere(arvore, 9);
	tInsere(arvore, 20);
	tInsere(arvore, 7);
	tInsere(arvore, 10);
	tInsere(arvore, 17);
	tInsere(arvore, 24);

	cout << "Pre-Ordem" << endl;
	preOrdem(arvore);
	cout << "Em-Ordem" << endl;
	emOrdem(arvore);
	cout << "Soma dos nos: " << soma(arvore) << endl;

	return 0;
}
