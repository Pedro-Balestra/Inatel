#include <iomanip>
#include <iostream>

using namespace std;

int main()
{
    int qnt_laranja;
    float preco;

    cout << "Entre com a quantidade de laranjas" << endl;
    cin >> qnt_laranja;

	cout << endl;
	
    if (qnt_laranja < 12)
    {
        preco = 0.8 * qnt_laranja;
        cout << "Quantidade de laranjas compras " << qnt_laranja << endl;
        cout << "Preço unitario " << 0.80 << endl;
        cout << fixed << setprecision(2) << "Valor total da compra R$ " << preco << endl;
    }
    else
    {
        preco = 0.65 * qnt_laranja;

        cout << "Quantidade de laranjas compras " << qnt_laranja << endl;
        cout << "Preço unitario " << 0.65 << endl;
        cout << fixed << setprecision(2) << "Valor total da compra R$ " << preco << endl;
    }
}