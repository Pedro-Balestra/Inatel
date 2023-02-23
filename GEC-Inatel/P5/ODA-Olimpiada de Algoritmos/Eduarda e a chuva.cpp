#include <iostream>

using namespace std;

int main()
{
	int ult_dia;//Ultimo dia que choveu
	int volt_dia;//Dia em que voltou a chover 
	
	//Entrada de dados
	cin >> ult_dia;
	cin >> volt_dia;
	
	int estiagem1;//Estiagem para condição 1
	int estiagem2;//Estiagem para condição 2
	int estiagem3;//Estiagem para condição 3
	
	//condição 1
	//Ultimo dia de chuva maior que o dia de volta da chuva	
	if (ult_dia > volt_dia){
		estiagem1 = ult_dia - volt_dia;
		cout << 30 - estiagem1 - 1 << endl;  
	}
	
	//condição 2
	//Ultimo dia de chuva igual que o dia de volta da chuva
	else if( ult_dia == volt_dia )
	{
		estiagem2 = ult_dia + volt_dia;
		cout << estiagem2+1<< endl;
	}
	
	//condição 3
	//Ultimo dia de chuva menor que o dia de volta da chuva
	else{
		estiagem3 =  volt_dia - ult_dia;
		cout << estiagem3 - 1 << endl;
	}

	
	
}