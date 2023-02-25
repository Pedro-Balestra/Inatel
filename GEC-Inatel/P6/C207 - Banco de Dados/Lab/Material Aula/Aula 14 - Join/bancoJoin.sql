drop database if exists aulajoin;
create database aulajoin;

use aulajoin;

create table dono(
	id int auto_increment primary key,
    nome varchar(50) not null,
    idade int not null,
    cidade varchar(50)
);

#1 dono tem varios pets, mas cada pet é de um dono só
#1:N
create table pet(
	id int auto_increment primary key,
    especie varchar(30) not null,
    nome varchar(30) not null,
    idade int not null,
    peso float not null,
    idDono int,
    constraint fkdono
		foreign key (idDono)
        references dono(id)
        on update cascade
        on delete cascade
);

#Cada pet pode tomar varias vacinas e cada vacina pode ser aplicada em varios pets
#N:M
create table vacina(
	id int auto_increment,
    primary key (id),
    nome varchar(30) not null,
    quantidade int not null,
    preco float not null
);

create table tomar_vacina(
	idVacina int not null,
    idPet int not null,
    primary key(idVacina, idPet),
    dataAplicacao varchar(20),
    constraint fkPet
		foreign key(idPet)
        references pet (id)
        on update cascade
        on delete cascade,
	constraint fkVacina
		foreign key(idVacina)
        references vacina (id)
        on update cascade
        on delete cascade
);

insert into dono() values(default, "Malu", '20', 'Santa Rita'),
(default, "Wilmar", '25', 'Santa Rita'),
(default, "Yasmin", '22', 'Borda da Mata'),
(default, "Alexia", '21', 'Lisboa');

select * from dono;

insert into pet() values(default, "Gato", 'Pretinha', '3', '2.2', '1'),
(default, "Gato", 'Gohan', '5', '2.5', '1'),
(default, "Cachorro", 'Toddy', '7', '7.3', '2'),
(default, "Cachorro", 'Belinha', '9', '3.5', '3'),
(default, "Cachorro", 'Bernardo', '7', '6.5', '4'),
(default, "Papagaio", 'Encrenqueiro', '3', '0.3', '4');

select * from pet;

insert into vacina() values(default, "Raiva", '10', '0'),
(default, "V4", '15', '50'),
(default, "V5", '12', '70'),
(default, "Panleucopenia", '8', '100');

select * from vacina;

insert into tomar_vacina() values("1", '1', '02/11/2021'),
("1", '2', '02/11/2021'),
("1", '3', '02/11/2021'),
("1", '4', '02/11/2021'),
("1", '5', '02/11/2021'),
("2", '1', '02/11/2021'),
("2", '2', '02/11/2021'),
("4", '4', '02/11/2021'),
("3", '3', '02/11/2021');

select * from tomar_vacina;

#1:N
select dono.nome, dono.idade, cidade, especie, pet.nome
from dono, pet
where dono.id = pet.idDono and especie = "Cachorro";

select dono.nome, dono.idade, cidade, especie, pet.nome
from dono
inner join pet
on dono.id = pet.idDono and especie = "Cachorro";

#N:M
select pet.nome, especie, idade, vacina.nome, preco, dataAplicacao
from pet, vacina, tomar_vacina
where idPet = pet.id and idVacina = vacina.id and vacina.nome = "raiva";

select pet.nome, especie, idade, vacina.nome, preco, dataAplicacao
from pet
inner join tomar_vacina on pet.id = idPet
inner join vacina on idVacina = vacina.id and vacina.nome = "raiva";


select count(*)
from pet, vacina, tomar_vacina
where idPet = pet.id and idVacina = vacina.id and vacina.nome = "raiva" and especie = "cachorro";

select count(*)
from vacina
inner join tomar_vacina on idVacina = vacina.id
inner join pet on idPet = pet.id and vacina.nome = "raiva" and especie = "cachorro";

select d.nome, d.idade, cidade, p.nome, p.idade, especie
from dono as d, pet as p
where d.id = idDono and p.idade > 5;

select d.nome as 'Nome do Dono', d.idade, cidade, p.nome, p.idade, especie
from dono as d
inner join pet as p
on d.id = idDono and p.idade > 5;