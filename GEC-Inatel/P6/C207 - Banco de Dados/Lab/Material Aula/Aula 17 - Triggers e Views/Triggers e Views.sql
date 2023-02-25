drop database if exists triggersEviews;
create database triggersEviews;
use triggersEviews;

create table if not exists Pessoa(
	id int not null auto_increment,
    nome varchar(100) not null,
    total int,
    primary key(id)
);

#sitaucao é alta, queda ou neutro
create table if not exists Investimento(
	id int not null auto_increment,
    valor int not null,
    situacao varchar(50),
	idPessoa int not null,
    primary key(id),
    constraint fk1
		foreign key(idPessoa)
		references Pessoa (id)
        on update cascade
        on delete cascade
);

insert into pessoa(nome, total) values('Joana', '2000');