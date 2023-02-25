# Aula 1

# importando o Numpy
import numpy as np

# criando um numpy array
# np array 1-D
arr = np.array([1, 2, 3])
print(type(arr))

# np array 2-D
mtz = np.array([[1, 2], [3, 4]])

# Funçoes para estruturação de Numpy Arrays
# zeros
arr = np.zeros(6)

# ones com reshape
mtz = np.ones(9).reshape(3, 3)

# arange
np.arange(1, 11, 1)

# Como concatenar numpy arrays
arr1 = np.arange(1, 5, 1)
arr2 = np.arange(5, 9, 1)
print(np.concatenate([arr1, arr2]))

# Extraindo propriedades de um Numpy array
mtz = np.arange(1, 13, 1).reshape(3, 4)
print(mtz.size)
print(mtz.ndim)
print(mtz.shape)
