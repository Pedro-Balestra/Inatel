import numpy as np

print("===== Exrcicio 1 =====")

np.random.seed(5)

arr = np.random.randn(10)
arr2 = arr*100
arr_int = arr2.astype(int)
print(f"Array: \n{arr}\n")
print(f"Array *100: \n{arr2}\n")
print(f"Array Int: \n{arr_int}\n")


print("===== Exrcicio 2 =====")

np.random.seed(10)
mtz = np.random.randint(1, 51, 16).reshape(4, 4)
print(f"Matriz 4x4: \n{mtz}\n")


print("===== Exrcicio 3 =====")

print(f"Media coluna: {mtz.mean(axis=0)}")
print(f"Media linha: {mtz.mean(axis=1)}")

maior_coluna = max(mtz.mean(axis=0))
maior_linha = max(mtz.mean(axis=1))
print(f"Maior valor coluna: {maior_coluna}")
print(f"Maior valor linha: {maior_linha}\n")


print("===== Exrcicio 4 =====")
# Não consegui fazer esse exercicio.
# Não entendi como mostrar somente os valores aparecem duas vezes

print(f"Aparicoe: {np.unique(mtz,return_counts=True)}")
numero2x = np.array(np.unique(mtz, return_counts=True)[0])
quantidade = np.array(np.unique(mtz, return_counts=True)[1])

print(f'Numeros que aparecem duas vezes = {numero2x[quantidade == 2]}')
