from pickle import TRUE
import numpy as np

arr = np.loadtxt('space.csv', delimiter=';',
                 dtype=str, encoding='utf-8')

# exercicio 1
quantity = np.array(np.unique(arr[1:, -1], return_counts=True)[0])
sucess = np.array(np.unique(arr[1:, -1], return_counts=True)[1])

print(quantity[sucess == 'Sucess'])
