import pandas as pd
import numpy as np
from sympy import false

# importando Dataset com o pandas
print('========== Exercicio 1 ==========')
print('A)')
dataset = pd.read_csv('paises.csv', delimiter=';')

oceania = dataset.loc[dataset['Region'].str.contains('OCEANIA')]
paisesOceania = oceania['Country'].values[:]
print("Paises da Oceania: ")
for i in paisesOceania:
    print(f'-{i}')

print('\nB)')
print(f'Numero de paises da Oceania = {len(paisesOceania)}\n')


print('========== Exercicio 2 ==========')
alfabetizacao = dataset[['Literacy (%)']]
print(
    f'Media de alfabetizacao = {alfabetizacao.mean(axis = 0).values[0]:.2f}%')


print('\n========== Exercicio 3 ==========')
maior_populacao = dataset['Population'].idxmax()
regiao = dataset['Region'].values[maior_populacao]
pais = dataset['Country'].values[maior_populacao]
populacao_maxima = dataset['Population'].max()

print(f'Maior populacao da Terra fica na Regiao = {regiao}')
print(f'Maior populacao da Terra fica no Pais = {pais}')
print(f'Maior populacao da Terra possui = {populacao_maxima} habitantes\n')

print('\n========== Exercicio 4 ==========')
# Realizando a busca
noCoast = dataset.loc[dataset['Coastline (coast/area ratio)'] == 0]

# Salvando o resultado das buscas no novo csv
noCoast['Country'].to_csv('noCoast.csv', sep=';', header=False)

print('noCoasta.csv Salvo!!!')
