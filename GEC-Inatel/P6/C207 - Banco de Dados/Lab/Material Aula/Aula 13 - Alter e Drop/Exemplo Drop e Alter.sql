drop database if exists hogwarts;
create database hogwarts;

use hogwarts;

create table animal(
	id int auto_increment,
    nome varchar(40),
    especie varchar(20),
    primary key(id)
);

create table bruxo(
	id int auto_increment,
    nome varchar(30),
    sobrenome varchar(30),
    idade int,
    nacionalidade varchar(30),
    idAnimal int,
    primary key(id),
    constraint fk1 
		foreign key (idAnimal)
        references Animal(id)
        on update cascade
        on delete set null
);

create table jogadorDeQuadribol(
	id int auto_increment,
    posicao varchar(40),
    casa varchar(15),
    primary key(id)
);

insert into animal() values(default, "Edwiges", 'coruja');
select * from animal;
insert into bruxo() values(default, "Harry", "Potter", '12', 'britânico', '1');
select * from bruxo;

update animal set id = 5 where id = 1;
delete from animal where id = 5;

alter table bruxo change nacionalidade pais varchar(40) not null;
alter table animal add column cor varchar(20);
alter table animal drop column cor;
alter table bruxo drop constraint fk1;
drop table jogadordequadribol;


#dados					estrutra
/*
	insert ----------- create
    update ----------- alter
    delete ----------- drop
*/