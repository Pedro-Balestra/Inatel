#include <iostream>
#include <list>

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

void emNivel(treenodeptr t)
{
	treenodeptr n;
	list<treenodeptr> q;

	if (t != NULL)
	{
		q.push_back(t);
		while (!q.empty())
		{
			n = *q.begin();
			q.pop_front();
			if (n->esq != NULL)
				q.push_back(n->esq);
			if (n->dir != NULL)
				q.push_back(n->dir);
			cout << n->info << " ";
		}
	}
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
    
	emNivel(arvore);

	return 0;
}
