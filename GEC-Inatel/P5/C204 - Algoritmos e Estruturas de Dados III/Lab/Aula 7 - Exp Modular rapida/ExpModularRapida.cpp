#include <iostream>
#include <climits>
using namespace std;

// Exponenciacao modular rapida
// Calcula (b^n) % mod     em O(log(n))
long long int fastPow(int b, int n, int mod)
{
	// Caso base -> expoente = 0
	if(n == 0)
		return 1;
	// Se o expoente for par -> b ^ n = b^(n/2) * b^(n/2)
	else if(n % 2 == 0)
	{
		long long int resp;
		resp = fastPow(b,n/2,mod);
		return (resp * resp) % mod;
	}
	// Se o expoente for impar -> b ^ n = b * b^((n-1)/2) * b^((n-1)/2)
	else
	{
		long long int resp;
		resp = fastPow(b,(n-1)/2,mod);
		return (b * ((resp * resp) % mod))% mod;
	}
}

int main()
{
	
	return 0;
}