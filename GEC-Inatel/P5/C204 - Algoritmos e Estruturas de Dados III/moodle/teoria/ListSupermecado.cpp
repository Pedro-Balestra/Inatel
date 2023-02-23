#include <iostream>
#include <list>

using namespace std;

int main()
{
    list<int> estoque;
    list<int> vendas;
    int n;//numero de operação
    int op;//operação 1 ou 2 
    int codigo;
    int i = 0;//contador
    
    cin >> n;
    
    while(i < n)
    {
        cin >> op;
        if (op == 1)
        {
            cin >> codigo;
            estoque.push_back(codigo);
        }
        else
        {
            codigo = *estoque.begin();
            vendas.push_front(codigo);
            estoque.pop_front();//tira o primeiro elemento de estoque
        }
        i++;
    }
    
    while(!estoque.empty())
	{
		codigo = *estoque.begin();
		cout <<"Estoque: " << codigo << " ";
		estoque.pop_back();
	}
	cout << endl;
	cout <<"Venda:" <<" ";
    while(!vendas.empty())
	{
		codigo = *vendas.begin();
		cout << codigo << " ";
		vendas.pop_front();
	}
    
    
    
}