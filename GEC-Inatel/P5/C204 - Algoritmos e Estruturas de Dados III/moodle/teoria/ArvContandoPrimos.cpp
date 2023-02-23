#include <iostream>

using namespace std;

struct treenode{
	
	int info;
	treenode *esq;
	treenode *dir;
};
typedef treenode* treenodeptr;

void tInsere(treenodeptr &arvore, int x){
	
	if (arvore == NULL){ //Se a raiz for vazia, insere nela.
		
		arvore = new treenode;
		arvore -> info = x;
		arvore -> esq = NULL; 
		arvore -> dir = NULL;
	}
	
	else{
		
		if (x < arvore -> info) 
			tInsere(arvore -> esq, x);
		
		else
			tInsere(arvore -> dir, x);
		
	}
	
}

void contaPrimos(treenodeptr arvore, int &resp){
	
	int n; //Contador 
	int x = 0; //Numero de divisores
	
	if (arvore != NULL)
	{
		contaPrimos(arvore -> esq, resp);
		
		for(n = 1; n <= arvore -> info; n++){
			
			if(arvore -> info % n == 0){
				x++;
			}
		}
		
		if (x == 2){
			resp++;
		}
		
		contaPrimos(arvore -> dir, resp);
		
		for(n = 1; n <= arvore -> info; n++){
			
			if(arvore -> info % n == 0){
				x++;
			}
		}
		
		if (x == 2){
			resp++;
		}
		
	}
}

int main()
{
	treenodeptr arvore = NULL;
	treenodeptr p;

    int x; //Numeros a serem inseridos
    int resp = 0; //Numero de primos

    //Entrada de dados.
    cin >> x;

    while(x != -1){
		
		tInsere(arvore, x);
		cin >> x;
	}
	
	contaPrimos(arvore, resp);
	
    cout << resp << " numeros primos" << endl; 
    
	return 0;
}
