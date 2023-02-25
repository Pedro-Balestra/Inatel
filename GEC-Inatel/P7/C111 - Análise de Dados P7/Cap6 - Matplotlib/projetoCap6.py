import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
'''
# Dados do eixo x
x = np.array([1, 2, 3, 4])

# Dados do eixo y1
y = x*2  # Broadcasting

# Dados do eixo y2
y2 = x**2

# Colocando legendas nos eixos
plt.xlabel('Dados do eixo X')
plt.ylabel('Dados do eixo y')

# Plotando os dados no Grafico
plt.plot(x, y, 'o:g', x, y2, 'b--', linewidth=3, markersize=10)
plt.show()
'''
# Exemplo de subplot
'''
# Dados do eixo x
x = np.array([1, 2, 3, 4])

# Dados do eixo y1
y = x*2  # Broadcasting

# Dados do eixo y2
y2 = x**2

plt.subplot(1, 2, 1)
plt.title('linear')
plt.plot(x, y, 'r-')


plt.subplot(1, 2, 2)
plt.title('exponencial')
plt.plot(x, y2, 'b--')

plt.show()
'''

# Exemplo com Scatter Plot
# Baixando o Dataset para um Dataframe
dfPaises = pd.read_csv('paises.csv', delimiter=';')
# Pegando os 6 maiores paises do Dataset
dfPaises2 = dfPaises.nlargest(6, 'Area (sq. mi.)')

# Trançando o grafico
# Primero argumento -> eixo x
# Segunto argumento -> eixo y
# terceiro argumento -> tamanho da bolinha

plt.scatter(dfPaises2['Country'], dfPaises2['GDP ($ per capita)'],
            s=dfPaises2['Area (sq. mi.)']/10000)
plt.show()
