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