#include <iostream>
#include <iomanip>

using namespace std;

struct dados
{

	int nota[4];
	float media;
	float soma;

};

int main()
{
	dados *v; //ponteiro
	int i;//var auxiliar 
	int j;//var auxiliar
	//float y; 
	
	v = new dados;
	v -> soma = 0;
	
	for (i = 0; i < 4; i++){
		
		cin >> v -> nota[i];
		
	}
	
	for (j = 0; j < 4; j++){
		
		v -> soma += v -> nota[j];
	}
	
	v -> media = v -> soma / 4;
	
	cout << fixed << setprecision(2) << v -> media << endl;
	
	delete [] v;
	
	return 0;	
}