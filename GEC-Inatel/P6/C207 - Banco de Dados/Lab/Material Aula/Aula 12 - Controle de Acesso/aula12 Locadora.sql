drop database if exists locadora;
create database locadora;

use locadora;

create table cliente(
	id int auto_increment primary key,
    nome varchar(60) not null,
    idade int not null
);

create table filme(
	id int auto_increment primary key,
    nome varchar(60) not null,
    tempo int,
    preco float 
);

create user 'dono' identified by '123';
show grants for 'dono';

grant insert on locadora.filme to 'dono';
grant update, delete on locadora.filme to 'dono';
grant select on locadora.filme to 'dono';
grant select on *.* to 'dono';

select * from locadora.filme;


revoke select on 
