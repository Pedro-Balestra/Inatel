#include <iostream>
#include <iomanip>

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

void MediaEmOrdem (treenodeptr arvore, float &m)
{
	if (arvore != NULL)
	{
		MediaEmOrdem(arvore->esq, m);
		m += arvore->info;
		MediaEmOrdem(arvore->dir, m);
	}
}

//Retorna a media de todos os elementos da arvore
float media(treenodeptr arvore, int i)
{
	float m = 0; // s = 99
	float resultado;

	MediaEmOrdem(arvore, m);

	resultado = m / i;
	
	return resultado;
}


int main()
{
	treenodeptr arvore = NULL; //Ponteiro para a árvore

	int primeiro_num;//Primeiro numero da arvore
	int i = 0;// contador

	//Inserindo elementos na árvore
	cin >> primeiro_num;

	while(primeiro_num != -1)
	{
		i++;
		tInsere(arvore, primeiro_num);
		cin >> primeiro_num;
	}

	cout << fixed << setprecision(2) << "Media: " << media(arvore, i) << endl;

	return 0;
}
