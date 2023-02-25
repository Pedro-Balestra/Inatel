import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

print("====== Exercicio 1 =====")
space = pd.read_csv("space.csv", delimiter=';')
eua = len(space["Company Name"].where(
    space['Location'].str.contains('USA')).unique())
china = len(space["Company Name"].where(
    space['Location'].str.contains('China')).unique())

plt.bar("EUA", eua, color='red')
plt.bar("China", china, color='blue')
plt.show()

print("\n====== Exercicio 2 =====")
paises = pd.read_csv('paises.csv', delimiter=';')
paises1 = paises[paises['Region'].str.contains('NORTHERN AMERICA')]

plt.plot(paises1['Country'], paises1['Birthrate'], 'b-',
         paises1["Country"], paises1['Deathrate'], 'r--')
plt.show()
