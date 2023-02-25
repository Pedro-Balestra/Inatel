# Criando uma lista e pegando seus valores

top_5 = ['Chealse', 'PSG', 'Real Madrid', 'Barcelona', 'Bayern']

# 3 primeiros colocados
print(f'Os 3 primeiros colocados são = {top_5[0:3]}')

# Os 2 últimos colocados
print(f'Os 2 últimos colocados são = {top_5[-2:]}')

# Ordem alfabética
print(f'Ordem alfabética = {sorted(top_5)}')

# Posição do Barcelona
print(f'Barcelona está na {top_5.index("Barcelona")}ª posição.')