import numpy as np

# exercicio 1
print("===== Exercicio 1 =====")
arr = np.linspace(0, 1, 21)

print(arr)

# exercicio 2
print("\n===== Exercicio 2 =====")
array1 = np.arange(0, 51, 2)
array2 = np.arange(100, 49, -2)

cont = np.concatenate((array1, array2))
print(np.sort(cont))

# exercicio 3
print("\n===== Exercicio 3 =====")
print(np.flip(np.sort(cont)))

# exercicio 4
print("\n===== Exercicio 4 =====")
mtz = np.ones(12).reshape(3, 4)
print(mtz)
print("Matriz de 1-D")
print(mtz.reshape(1, 12))


# exercicio 5
print("\n===== Exercicio 5 =====")
mtz = np.arange(1, 26, 1).reshape(5, 5)

linha = 0
coluna = 0

for i in range(len(mtz)):
    linha = linha+1
for j in range(i+1):
    coluna = coluna+1

mtzMulti = linha * coluna

if(mtzMulti % 2 == 0):
    print("Poderia ser vetor de par elementos")
else:
    print("Poderia ser vetor de impar elementos")
