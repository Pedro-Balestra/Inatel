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
void preOrdem (treenodeptr arvore, int &cont, int procurado, bool &encontrei)
{
    if (arvore != NULL)
    {
        if(arvore->info == procurado)
            encontrei = true;
        if(encontrei != true)
            cont++;
        
        preOrdem(arvore->esq, cont, procurado, encontrei);
        preOrdem(arvore->dir, cont, procurado, encontrei);
    }
}
void emOrdem (treenodeptr arvore, int &cont, int procurado, bool &encontrei)
{
    if (arvore != NULL)
    {
        emOrdem(arvore->esq, cont, procurado, encontrei);
        
        if(arvore->info == procurado)
            encontrei = true;
        if(encontrei != true)
            cont++;
        
        emOrdem(arvore->dir, cont, procurado, encontrei);
    }
}
void posOrdem (treenodeptr arvore, int &cont, int procurado, bool &encontrei)
{
    if (arvore != NULL)
    {
        posOrdem(arvore->esq, cont, procurado, encontrei);
        posOrdem(arvore->dir, cont, procurado, encontrei);
        
        if(arvore->info == procurado)
            encontrei = true;
        if(encontrei != true)
            cont++;
    }
}

int main()
{
    treenodeptr arvore = NULL; //Ponteiro para a árvore

    int primeiro_num;//Primeiro numero da arvore
    int i = 0;// contador
    int choco;//Cidade em que o chocolate esta
    bool encontrei = false;

    //Inserindo elementos na árvore
    cin >> primeiro_num;

    while(primeiro_num != -1)
    {
        i++;
        tInsere(arvore, primeiro_num);
        cin >> primeiro_num;
    }

	//entrando com a cidade
    cin >> choco;
 
    //Declarando variaveis contadoras de posição
    int contPre;
    int contEm;
    int contPos;
    
    contPre = 0;
    contEm = 0;
    contPos = 0;
    
    preOrdem(arvore, contPre, choco, encontrei);
    encontrei = false;
    emOrdem(arvore, contEm, choco, encontrei);
    encontrei = false;
    posOrdem(arvore, contPos, choco, encontrei);
    
    //Verificando qual caminho mais rapido 
    if(contPre < contPos &&  contPre < contEm)
        cout << "Pre" << endl;
    else if (contPos < contPre && contPos < contEm)
        cout << "Pos" << endl;
    else cout << "Em" << endl;
    
    return 0;
}















