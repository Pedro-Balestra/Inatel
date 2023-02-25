# Exercicios Propostos
# 1.a)
print('========== Exercicio 1 ==========')
listPrimeiros = ['Sao Paulo', 'Barcelona', 'Corintias']
# b)
listUltimos = ['Santos', 'Palmeiras']
# c)
listTotal = listPrimeiros + listUltimos
listTotal.sort()
print(listTotal)
# d)
print(listTotal.index('Barcelona'))

# 2.
print('========== Exercicio 2 ==========')
loja1 = {'A52', 'J8', 'A51', 'S22', 'S21'}
loja2 = {'A71', 'A51', 'J6', 'S22', 'A32'}

aprelhosAmbasLojas = loja1 & loja2
print(f'Aparelhos disponiveis loja 1: {loja1}')
print(f'Aparelhos disponiveis loja 2: {loja2}')
print(f'Aparelhos em ambas lojas: {aprelhosAmbasLojas}')

# 3.
print('========== Exercicio 3 ==========')
nome = input('Entre com seu nome: ')
media = input('Entre com sua media: ')
dic = {'nome': nome, 'media': media}


if dic['media'] < '60':
    print('O aluno esta RP')
    dic['Situcao'] = 'RP'
else:
    print('O aluno esta AP')
    dic['Situcao'] = 'AP'


for k, v in dic.items():
    print(f'{k} eh {v}')
