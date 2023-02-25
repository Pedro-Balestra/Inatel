#include <iostream>

using namespace std;

int main()
{
	int num;

	double resto;

	cout << "Entre com um numero" << endl;
	cin >> num;

	while(num >= 50 || num < 0)
	{
		cout << "Entre com um numero" << endl;
		cin >> num;
	}

	for(int i = num; i > 1 ; i--)
	{
		resto = num % (i - 1);

		if(i > 0)
			cout << "Resto da divisao de "  << num << " por " << i - 1 << ": " << resto << endl;

	}

}
