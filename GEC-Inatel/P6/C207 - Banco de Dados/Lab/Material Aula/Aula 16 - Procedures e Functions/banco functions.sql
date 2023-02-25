drop database if exists bancoFunctions;
create database if not exists bancoFunctions;

use bancoFunctions;

create table if not exists aluno(
	matricula int,
    curso varchar(3),
    nome varchar(100),
    email varchar(50),
    primary key(matricula, curso)
);

create table if not exists produto(
	id int auto_increment primary key,
    nome varchar(40),
    preco float,
    quantidade int
);

create table if not exists compra(
	id int auto_increment primary key,
    preco float,
    pagamento float
);