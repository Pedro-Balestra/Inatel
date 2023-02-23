#include <iostream>

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

// percurso em pre-ordem, mostrando o conteudo de cada no
void preOrdem (treenodeptr arvore)
{
	if (arvore != NULL)
	{
		cout << arvore->info << endl;
		preOrdem(arvore->esq);
		preOrdem(arvore->dir);
	}
}

// percurso em-ordem
void emOrdem (treenodeptr arvore, int &maior, int &menor)
{
	
	if (arvore != NULL)
	{
		emOrdem(arvore -> esq, maior, menor);
		
		if (arvore -> info < menor){
			menor = arvore -> info;
		}
		
		if (arvore -> info > maior){
			maior = arvore -> info;
		}
			
		emOrdem(arvore -> dir, maior, menor);
		
		if (arvore -> info < menor){
			menor = arvore -> info;
		}
		
		if (arvore -> info > maior){
			maior = arvore -> info;
		}
	}
}

// percurso em pos-ordem, mostrando o conteudo de cada no
void posOrdem (treenodeptr arvore)
{
	if (arvore != NULL)
	{
		posOrdem(arvore->esq);
		posOrdem(arvore->dir);
		cout << arvore->info << endl;
	}
}

int main()
{

	treenodeptr arvore = NULL;
	treenodeptr p;
	treenodeptr raiz = NULL;

    int x; 
    int menor = 99999999;
    int maior = -9999999;

    cin >> x;

    while(x != -1){
		
		tInsere(arvore, x);
		cin >> x;

	}

	emOrdem(arvore, maior, menor);
	
 
    cout << menor << " e " << maior;
    
	return 0;
}

// libera a memoria utilizada pela arvore
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