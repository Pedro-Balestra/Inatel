drop database if exists masterchef;
create database masterchef;

use masterchef;
#RELACIONAMENTO N:M ENTRE JURADO E COMPETIDOR
#JULGAR É A TABELA INTERMEDIARIA
create table Competidor(
	id int not null auto_increment,
    nome varchar(100) not null,
    idade int not null,
    profissao varchar(50) not null,
    cidade varchar(50) not null,
    estado varchar(2) not null,
    primary key(id)
);

create table Jurado(
	id int not null auto_increment,
    nome varchar(100) not null,
    paisOrigem varchar(100) not null,
    primary key(id)
);

create table Julgar(
	idCompetidor int not null,
    idJurado int not null,
	CONSTRAINT fk1
		foreign key (idCompetidor) 
		references Competidor (id) 
		ON DELETE CASCADE 
		ON UPDATE CASCADE,
    CONSTRAINT fk2
		foreign key (idJurado) 
		references Jurado (id) 
		ON DELETE CASCADE 
		ON UPDATE CASCADE,
    PRIMARY KEY(idCompetidor, idJurado)
);

create table Prato(
	id int not null auto_increment,
    tipoCulinaria varchar(50) not null,
    idCompetidor int not null,
    nota float not null,
    primary key(id),
    CONSTRAINT fk3
		foreign key (idCompetidor) 
		references Competidor (id) 
		ON DELETE CASCADE 
		ON UPDATE CASCADE
);

insert into Competidor(nome, idade, profissao, cidade, estado) values
('Janaina Caetano', '38', 'Taróloga', 'Diadema', 'SP'),
('Rodrigo Massoni', '33', 'Engenheiro Ambiental', 'Osasco', 'SP'),
('Lorena Dayse', '35', 'Enfermeira', 'Teresina', 'PI'),
('Helton Oliveira', '19', 'Estudante', 'Jacutinga', 'MG'),
('Haila Santuá', '25', 'Publicitária', 'Chapadão do Céu', 'GO'),
('Uttoni','20', 'Estudante', 'Borda da Mata', 'MG');

insert into Jurado(nome, paisOrigem) values
('Paola Carosella', 'Argentina'),
('Érick Jacquin', 'França'),
('Henrique Fogaça', 'Brasil');

insert into Julgar(idJurado, idCompetidor) values
('1', '1'),
('1', '2'),
('1', '3'),
('1', '4'),
('2', '3'),
('2', '5'),
('3', '1'),
('3', '2'),
('3', '4');

insert into Prato(tipoCulinaria, nota, idCompetidor) values
('Japonesa', '9.5', '1'),
('Italiana', '8.7', '1'),
('Francesa', '9.2', '2'),
('Brasileira', '4.6', '3'),
('Francesa', '2.7', '4'),
('Francesa', '8.0', '4'),
('Chinesa', '7.5', '4'),
('Japonesa', '3.0', '5');

#1) Buscar nota dos pratos, nome, idade e cidade dos competidores do estado de São Paulo
select prato.nota, competidor.nome, competidor.idade, competidor.cidade
from prato
inner join competidor on idCompetidor = competidor.id and estado = "SP";

#2) Buscar nome, idade e profissão dos competidores que foram julgados pela Paola Carossella.
select competidor.nome, competidor.idade, competidor.profissao
from competidor 
inner join julgar on idCompetidor = competidor.id 
inner join jurado on julgar.idJurado = jurado.id and jurado.nome = "Paola Carosella";

#3) Buscar a média das notas dos pratos dos competidores cuja profissão começa com a letra E.
select avg(prato.nota) as "Média das notas"
from prato
inner join competidor on idCompetidor = competidor.id and competidor.profissao like "E%";

#4) Buscar a maior nota de um prato de um competidor com menos de 28 anos.
select max(prato.nota) as "Nota Máxima"
from prato
inner join competidor on competidor.id = prato.idCompetidor and competidor.idade < 28;

#6) Buscar todos os tipos de culinaria diferentes dos pratos dos competidores de São Paulo, sem repetição.
select distinct p.tipoCulinaria
from prato as p
inner join competidor as c on c.cidade != "SP"
inner join julgar on c.id = julgar.idCompetidor;

#7) Buscar apenas o país de origem do jurado que julgou pratos de competidores com mais de 30 anos, sem repetir paises.
select distinct j.paisOrigem
from jurado as j
inner join competidor as c on c.idade > 30
inner join julgar on c.id = julgar.idcompetidor;

#8) Buscar tipo da culinaria e nome do competidor que o fez, dos competidores que foram julgados pelo Jacquin.
select c.nome as "Nome", p.tipoCulinaria as "Tipo Culinária"
from competidor as c
inner join julgar on c.id = julgar.idcompetidor and idJurado = 2
inner join prato as p on p.idCompetidor = c.id;