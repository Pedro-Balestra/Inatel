#include<iostream>
using namespace std;

void merge(int B[], int p, int C[], int q, int A[])
{
    int i = 0, j = 0, k = 0, m;
    while(i < p && j < q)
        if(B[i] <= C[j])
            A[k++] = B[i++];
        else
            A[k++] = C[j++];
    if(i == p)
        for(m = j; m <= q - 1; m++)
            A[k++] = C[m];
    else
        for(m = i; m < p; m++)
            A[k++] = B[m];
}

void mergesort(int A[], int tamanho)
{
    int B[10];
    int C[10];
    int tamB = tamanho / 2; // numero de elementos de B
    int tamC = tamanho - tamB; // numero de elementos de C

    int i;

    if (tamanho > 1)
    {
        // Copiando a primeira metade de A para B
        for(i = 0; i < tamanho / 2; i++)
            B[i] = A[i];
        // Copiando a segunda metade de A para C  
        for(i = tamanho / 2; i < tamanho; i++)
            C[i - tamanho / 2] = A[i];
        // Chamadas recursivas
        mergesort(B, tamB);
        mergesort(C, tamC);
        // Juntando B e C em A
        merge(B,tamB,C,tamC,A);
    }
}

int main()
{
    int vetor[] = {17, 37, 12, 13, 20, 19, 43, 15, 23};
    int i; // contador
    
    mergesort(vetor, 9);
    
    for(i=0;i<9;i++)
        cout << vetor[i] << " ";
    cout << endl;
    
    return 0;
}
