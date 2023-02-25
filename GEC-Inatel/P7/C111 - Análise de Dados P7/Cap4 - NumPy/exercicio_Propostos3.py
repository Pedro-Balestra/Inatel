from pickle import TRUE
import numpy as np

arr = np.loadtxt('space.csv', delimiter=';',
                 dtype=str, encoding='utf-8')

# exercicio 1
print("===== Exercicio 1 =====")
num_missions = np.max(arr[1:, 0].astype('int32'))
mission_status = arr[1:, 7].copy()
status = np.char.endswith(mission_status, 'Success')
num_missions_success = np.sum(status)
percent = (num_missions_success/num_missions)*100

print(f'A percentual de missao que deram certo foi de {percent:.2f}%\n')

# exercicio 2
print("===== Exercicio 2 =====")
all_cost = np.array(arr[1:, 6].astype('float32'))
num_cost = len(all_cost[all_cost > 0])
sum_cost = sum(all_cost[all_cost > 0])

print(
    f'A media de gastos das missoes espaciais eh de ${(sum_cost/num_cost)*100:.2f}\n')

# exercicio 3
print("===== Exercicio 3 =====")
location = arr[1:, 2]
usa = np.char.endswith(location, 'USA')
num_missions_usa = np.sum(usa)

print(
    f'A quantidade de missoes realizadas pela USA eh de {num_missions_usa}\n')

# exercicio 4
print("===== Exercicio 4 =====")
companies = arr[1:, 1]
mission_spacex = arr[1:, (1, 6)]
spaceX = mission_spacex[0:, 0] == 'SpaceX'
most_expensive = np.max(all_cost[spaceX])

print(f'A missao mais cara da SpaceX foi de ${most_expensive*100}\n')

# exercicio 5
print("===== Exercicio 5 =====")
all_companies = np.unique(companies)

for i in all_companies:
    var = np.char.find(companies, i)
    num_missoes = np.sum(var) + companies.size
    print(f'Company: {i} = {num_missoes} missions. ')

print('\n')
