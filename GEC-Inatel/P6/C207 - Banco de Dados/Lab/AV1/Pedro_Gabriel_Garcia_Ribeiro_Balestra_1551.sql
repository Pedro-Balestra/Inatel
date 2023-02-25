#1) Para que serve a chave primária? 
#Chaves primarias são determinadas em BD para auxiliar na identificação na tabela

#3) Qual comando abaixo altera corretamente o nome da bebida de código igual a 135 para Vinho:
#d) update bebida set nome = "Vinho" where codigo = 135;



drop database if exists bar;
create database bar;

use bar;

create table bebida(
	codigo int primary key,
    nome varchar(30),
    marca varchar(30),
    sabor varchar(30),
    tamanho_ml int,
    alcoolica varchar(3),
    preco float
);

insert into bebida(codigo,nome,marca,sabor,tamanho_ml,alcoolica,preco) values(123, "Vodka","Taiga","Aguinha",1000, "Sim", 17.5);
insert into bebida(codigo,nome,marca,sabor,tamanho_ml,alcoolica,preco) values(456, "Vodka","Askov","Puro fogo",1000, "Sim", 12);
insert into bebida(codigo,nome,marca,sabor,tamanho_ml,alcoolica,preco) values(789, "Suco","Ades","Maracujá",200, "Não", 3.45);
insert into bebida(codigo,nome,marca,sabor,tamanho_ml,alcoolica,preco) values(135, "Cerveja","Quinta do Morango","Suavezinho",750, "Sim", 16.7);
insert into bebida(codigo,nome,marca,sabor,tamanho_ml,alcoolica,preco) values(579, "Vinho","Pinheirense","Extrato de açai",3000, "Não", 14.9);
insert into bebida(codigo,nome,marca,sabor,tamanho_ml,alcoolica,preco) values(246, "Hidromel","Berga","Tente a sorte",330, "Sim", 10);

select * from bebida;

#4) Delete o registro da bebida de codigo igual a 456
delete from bebida where codigo = 456;

#5) Realize as buscas abaixo
#a) Buscar todos os nomes de bebidas sem repetição
select distinct(nome) from bebida;

#b) Buscar o maior tamanho em ml de uma bebida que seja alcoólica;
select max(tamanho_ml) from bebida; 

#c) Busque nome e marca das bebidas com menos de 500ml de tamanho ou preço maior que 15 reais.
select nome, marca from bebida where tamanho_ml < 500 or preco > 15;

#d) Busque nome, marca, sabor, tamanho e preço das bebidas em que o nome começar com ‘V’ e terminar com ‘o’ e o tamanho for menor que 1000ml
select nome, marca,tamanho_ml, preco from bebida where nome like 'V%o' and tamanho_ml < 1000;


