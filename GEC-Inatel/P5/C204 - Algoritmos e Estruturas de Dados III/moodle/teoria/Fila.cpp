#include<iostream>
#include<list>

using namespace std;

int main()
{
    list<int> fila; // ponteiro para a fila
    int i; // contador
    int x; // var aux para leitura e escrita
    
    // Lendo elementos e inserindo-os na fila
    for(i=0;i<4;i++)
    {
        cin >> x;
        fila.push_back(x);
    }
    
    // Removendo elementos e mostrando na tela
    while(!fila.empty())
    {
        x = *fila.begin();
        cout << x << " ";
        fila.pop_front();
    }
    
    return 0;
}