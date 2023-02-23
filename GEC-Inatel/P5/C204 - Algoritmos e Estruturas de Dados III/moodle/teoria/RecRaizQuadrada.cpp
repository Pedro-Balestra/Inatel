#include <iostream>
#include <cmath>
#include <iomanip>

using namespace std;

//Funcao para calcular raiz quadarada
float rec_raiz(float x, float x0, float e)
{
    if(abs(pow(x0,2)-x) <= e)
        return x0;
    else return rec_raiz(x,(pow(x0,2)+x)/(2*x0),e);
}

int main()
{
    float x;//Numero a ser calculado raiz quadrada
    float x0;//estimativa inicial para sqrt(x)
    float e;//limitante superior para erro 
    float resp;//resposta
    
    cin >> x;//Entrada do numero
    cin >> x0;//Entrada da estimativa
    cin >> e;//Entrada do limitante
    
    resp = rec_raiz(x,x0,e);
    
    cout << fixed << setprecision(4) << resp << endl;
}