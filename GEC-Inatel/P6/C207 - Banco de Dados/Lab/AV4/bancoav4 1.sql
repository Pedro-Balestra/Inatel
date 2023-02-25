drop database if exists bancoav4;
create database bancoav4;
use bancoav4;

create table Cliente(
   id int auto_increment,
   nome varchar(50),
   idade int,
   saldo float,
   primary key(id)
   );

create table Cinema(
	id int auto_increment,
    nome_filme varchar(50),
	preco_ingresso float,
	preco_pipoca float,
	preco_refri float,
	preco_total float,
	idCliente int,
	primary key (id),
	constraint fk1
		foreign key(idCliente)
		references Cliente(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);
