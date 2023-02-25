# Aula 2
import numpy as np
from sympy import true

# Numeros aleatorios
# subpacote random

# plantando a mesma semente de dados
np.random.seed(10)

# rand
arr = np.random.rand(6)
# broadcasting
# multiplicar um escalar por um vetor
# print(arr*100)

# randint
arr2 = np.random.randint(1, 10, 15)
arr3 = np.random.randint(1, 10, 15)

# Fazendo uma operacao de soma indice a indice com arrays
'''
print(arr2)
print(arr3)
print('\n')
print("Soma")
print(arr2+arr3)
print("multiplicacao")
print(arr2*arr3)
print("subtracao")
print(arr2-arr3)
print("Divisao")
print(arr2/arr3)
print("Resto")
print(arr2 % arr3)
'''
# unique
#print(np.unique(arr2, return_counts=True))

mtz = np.arange(1, 17, 1).reshape(4, 4)
print(mtz)
print("\n")
print(mtz.sum(axis=1))
