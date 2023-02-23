#include <iostream>

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

void emOrdem (treenodeptr arvore)
{
	if (arvore != NULL)
	{
		emOrdem(arvore->esq);
		cout << arvore->info << " ";
		emOrdem(arvore->dir);
	}
}

treenodeptr tMenor(treenodeptr &raiz)
{
	treenodeptr t;
	t = raiz;
	if (t->esq == NULL) // encontrou o menor valor
	{
		raiz = raiz->dir;
		return t;
	}
	else  // continua a busca na sub arvore esquerda
		return tMenor(raiz->esq);
}

int tRemove(treenodeptr &raiz, int remover)
{
	treenodeptr p;
	if (raiz == NULL) //arvore vazia
		return 1;
	if (remover == raiz->info)
	{
		p = raiz;
		if (raiz->esq == NULL) // a raiz nao tem filho esquerdo
			raiz = raiz->dir;
		else if (raiz->dir == NULL) // a raiz n~ao tem filho direito
			raiz = raiz->esq;
		else // a raiz tem ambos os filhos
		{
			p = tMenor(raiz->dir);
			raiz->info = p->info;
		}
		delete p;
		return 0;
	}
	else if (remover < raiz->info)
		return tRemove(raiz->esq, remover);
	else
		return tRemove(raiz->dir, remover);
}


int main()
{
	treenodeptr arvore = NULL; //Ponteiro para a árvore

	int primeiro_num;//Primeiro numero da arvore
	int i = 0;// contador
	int remover; //numero que deseja remover

	//Inserindo elementos na árvore
	cin >> primeiro_num;

	while(primeiro_num != 0)
	{
		tInsere(arvore, primeiro_num);
		cin >> primeiro_num;
	}

	//Entre com o numero que deseja remover
	cin >> remover;
	
	while(i == 0){
    	
        i = tRemove(arvore, remover);
    }

	emOrdem(arvore);

	return 0;
}
