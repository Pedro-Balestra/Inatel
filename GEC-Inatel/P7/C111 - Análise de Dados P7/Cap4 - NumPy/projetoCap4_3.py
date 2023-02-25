import numpy as np

# Criando numpy array
np.random.seed(10)

arr = np.random.randint(0, 10, 15)
'''print(arr)
'''
# Fazendo um slicing em arr
arr2 = arr[0:4].copy()
# Alterando um elemento de arr2
arr2[0] = 100
'''
print(arr)
print(arr2)'''

# Trabalhando com o submodulo numpy.char
txt = "O Inatel é uma faculdade top demais"
#print(np.char.find(txt, "faculdade"))

# Importando o Dataset Space.cs

spaceDs = np.loadtxt("space.csv",
                     delimiter=";",
                     dtype=str,
                     encoding="utf-8")
# Vendo as colunas do Dataset
# print(spaceDs[0])
# Vendo apenas o nome das empresas
print(np.unique(spaceDs[1:, 1]))
