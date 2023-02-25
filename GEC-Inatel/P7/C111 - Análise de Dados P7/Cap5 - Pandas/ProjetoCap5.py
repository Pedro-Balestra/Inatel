import numpy as np
import pandas as pd

# Series (1-D)
# Dataframe (N-D/2-D)

# Criando uma series
'''
valores = [10,20,30]

series1 = pd.Series(data=valores)
'''
series1 = pd.Series(
    {'a': 10, 'b': 20, 'c': 30}
)

series2 = pd.Series(
    {'a': 10, 'c': 50, 'd': 80}
)

#print(series1.add(series2, fill_value=0))

# Slicing nas series
'''
print(series1[['a', 'c']])

print(series1[series1 == 30])
'''

# Criando um dataframe
np.random.seed(10)

df1 = pd.DataFrame(
    data=np.random.randint(1, 50, [5, 4]),
    index=['A', 'B', 'C', 'D', 'E'],
    columns=['W', 'X', 'Y', 'Z']
)

'''print(df1)

print(df1['X']['C'])
print(df1['W'])
print(df1[['W', 'Z']])'''

# importando Dataset com o pandas

dataset = pd.read_csv('paises.csv', delimiter=';')

print(dataset.head(0))
