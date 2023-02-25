drop database if exists mercado;
create database mercado;

use mercado;

create table produto(
	codigo int,
    nome varchar(50),
    preco float,
    fornecedor varchar(50),
    primary key(codigo)
);

insert into produto(codigo, nome, preco, fornecedor) values(1234, 'Óleo', 8, 'Soya');
insert into produto(codigo, nome, preco, fornecedor) values(1357, 'Arroz', 28, 'BeansHouse');
insert into produto(codigo, nome, preco, fornecedor) values(3698, 'Feijão', 7.5, 'BeansHouse');
insert into produto(codigo, nome, preco, fornecedor) values(2370, 'Batata Baroa', 3, 'Legumes - To Go');
insert into produto(codigo, nome, preco, fornecedor) values(564, 'Batata Doce', 3.5, 'Legumes - To Go');
insert into produto(codigo, nome, preco, fornecedor) values(2141, 'Miojo', 0.9, 'Nissin');

select *from produto;

#Alterem o fornecedor do produto de código igual a 1234 para Lisa
update produto set fornecedor = 'Lisa' where codigo = 1234;

#Deletem o produto de código igual a 2141.
delete from produto where codigo = 2141;

#Busquem o nome de todos os fornecedores sem repetição.
select distinct(fornecedor) from produto; 

#Busquem todos os dados dos produtos que tenham Batata no nome.
select *from produto where nome like "Batata%";

#Busquem o nome e o fornecedor dos produtos com preço acima de 5 reais.
select fornecedor from produto where preco > 5;

#DESAFIO:
#Busquem o menor preço entre os produtos da tabela.
select min(preco) from produto;

#Busquem a média dos preços dos produtos.
select avg(preco) from produto;

#Busquem o número de produtos inseridos na tabela.
select count(codigo) from produto;
