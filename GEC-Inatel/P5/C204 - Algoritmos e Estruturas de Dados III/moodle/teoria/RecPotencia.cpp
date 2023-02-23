#include <iostream>
#include <cmath>

using namespace std;
//calcular potencia de um numero
int pot(int a, int n)
{
    if(n==0)
        return 1;
    else return a*pot(a,n-1);
}

int main()
{
    int a;//numero inteiro
    int n;//potencia
    int r;//resposta
    
    cin >> a;//Entrada do numero
    cin >> n;//Entrada da potencia
    
    r = pot(a,n);
    
    cout << r << endl;
}