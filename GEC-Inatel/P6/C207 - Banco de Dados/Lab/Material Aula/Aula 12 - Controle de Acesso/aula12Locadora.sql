drop database if exists locadora;
create database locadora;

use locadora;


create table filme(
	id int auto_increment primary key,
    nome varchar(60) not null,
    tempo int,
    preco float
);


create user 'dono' identified by '123';
# privilegios: insert, update, delete, select - manipulaçãoptimize
# create, alter, drop
# all privileges
# usage
# grant option - poder de dar privilégios

show grants for 'dono';

grant insert on locadora.filme to 'dono';
grant update, delete on locadora.filme to 'dono';
grant insert on *.* to 'dono';

revoke insert on *.* from 'dono';

grant select on locadora.filme to 'dono';
revoke select on locadora.filme from 'dono';








