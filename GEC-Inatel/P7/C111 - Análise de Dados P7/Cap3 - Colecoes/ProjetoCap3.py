# Colecoes em Python
# 1. TUPLA
# Guardam os dados dentro de ()
# Estrutura imutavel

# nomes = ('Goku', 'Vegeta', 'Trunks', 'Gohan')

# Tentando alterar uma tupla
# nomes[0] = 'Bulma'
# print(nomes)

# for aux in nomes:
#   print(aux)

# SLICING DE DADOS
# print(nomes[1:3])
# print(nomes[1:])
# print(nomes[:2])
# Ordenando elementos
# print(sorted(nomes))

# 2. Listas
# Armazena seus dados dentro de []
# Colecao mutavel

'''
nomes = ['Goku', 'Vegeta', 'Trunks', 'Gohan']
# print(type(nomes))

# Insercao de elementos
# Append - insere no final
nomes.append('Bulma')

# Insert - insere baseado no indice
nomes.insert(1, 'Kuririn')

# print(nomes)

# Exclusao de elementos
# Pop - exluir por indice
nomes.pop(2)
# Remove - excluir por valor
nomes.remove('Goku')

# print(nomes)

# Atualizando elementos
#nomes[0] = 'Freeza'
#print(nomes)
'''

# 3. Conjuntos
# Guarda seus elementos dentro de {}
# Nao guarda os indices de seus elementos
# Nao guarda elementos repetidos
nomes = {'Goku', 'Vegeta', 'Trunks', 'Gohan'}
print(nomes)

# Adicionar dados - add
# Atualizar elementos - update
# Excluir elementos - remove

# 4. Dicionarios
# Guarda seus elementos dentro de {}
# Usa indice customizaveis no padrao - chave:valor

dados = {'nome': 'Pedro', 'idade': 22}
