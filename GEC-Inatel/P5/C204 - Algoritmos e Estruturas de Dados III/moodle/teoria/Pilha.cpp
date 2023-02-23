#include<iostream>
#include<list>

using namespace std;

int main()
{
    list<int> pilha; // ponteiro para a pilha
    int i; // contador
    int x; // var aux para leitura e escrita
    
    // Lendo elementos e inserindo-os na pilha
    for(i=0;i<4;i++)
    {
        cin >> x;
        pilha.push_front(x);
    }
    
    // Removendo elementos e mostrando na tela
    while(!pilha.empty())
    {
        x = *pilha.begin();
        cout << x << " ";
        pilha.pop_front();
    }
    
    return 0;
}