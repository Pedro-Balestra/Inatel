#include <iostream>
using namespace std;

// Exponenciacao rapida
// Calcula (b^n)  em O(log(n))
long long int fastPow(int b, int n)
{
	// Caso base -> expoente = 0
	if(n == 0)
		return 1;
	// Se o expoente for par -> b ^ n = b^(n/2) * b^(n/2)
	else if(n % 2 == 0)
	{
		long long int resp;
		resp = fastPow(b,n/2);
		return (resp * resp);
	}
	// Se o expoente for impar -> b ^ n = b * b^((n-1)/2) * b^((n-1)/2)
	else
	{
		long long int resp;
		resp = fastPow(b,(n-1)/2);
		return (b * ((resp * resp)));
	}
}

int main()
{
	
	
	return 0;
}