drop database if exists natal;
create database natal;
use natal;

create table if not exists Crianca(
	id int not null,
    nome varchar(50),
    idade int,
    acredita varchar(10), 
    bonzinho varchar(10),
    pais varchar(50),
    continente varchar(50),
    primary key (id)
);

create table if not exists Presente(
	id int not null,
    peso varchar(20),
    material varchar(50),
    nomePresente varchar(50),
    idCrianca int,
    primary key (id),
    constraint fk1
		foreign key (idCrianca)
        references Crianca (id)
        on update cascade
        on delete set null
);

create table if not exists Elfo(
	id int not null,
    nome varchar(100),
    departamento varchar(100),
    funcao varchar(100),
    primary key(id)
);

create table if not exists ElfoFazPresente(
	idElfo int not null,
    idPresente int not null,
    primary key(idElfo, idPresente),
    constraint fk2
		foreign key (idElfo)
        references Elfo (id),
        #on update cascade
        #on delete cascade,
	constraint fk3
		foreign key (idPresente)
        references Presente (id)
        #on update cascade
        #on delete cascade
);

#1) O que deve ser alterado na tabela Presente para que ao se excluir o registro de uma criança,
# sua chave estrangeira idCrianca na tabela Elfo guarde null?

# Adicionar "On Delete Set Null" na tabela Presente

#FAÇAM A QUESTÃO 2 AQUI, ANTES DE INSERIR QUALQUER DADO
#2-a)Adicione uma coluna sobrenome na tabela Criança que aceite até 50 caracteres
Alter table  Crianca add sobrenome varchar(50);

# b)Altere a coluna peso em Presente para pesokg do tipo float.
alter table presente change peso pesokg float;

# c) Exclua a coluna material da tabela Presente.
alter table presente drop material;

#FAÇAM AS INSERÇÕES AQUI, QUESTÃO 3
#3) Insira os dados abaixo nas respectivas tabelas:
insert into Crianca(id, nome,idade,pais,continente,acredita,bonzinho,sobrenome) values ('1','Miguel', '5','Colombia','America','sim','sim','Garcia'),
('2','Lavínia', '4', 'Itália', 'Europa', 'SIM', 'SIM', 'Fiori'),
('3', 'Victor Antônio', '8', 'Brasil', 'América', 'SIM', 'NÃO', 'Oliveira'),
('4','Juan Pablo','10','Espanha','Europa','NÃO','SIM','Garcia'),
('5','Lucca','7','Itália','Europa','NÃO', 'NÃO', 'Mancini');

insert into Elfo (id, nome, departamento, funcao) Values
('1','Taja', 'Empacotamento', 'Embrulhar'),
('2','Golor', 'Empacotamento', 'Fazer laços'),
('3','Legolas', 'Administração', 'Organizar entregas'),
('4','Tathe', 'Produção', 'Montar'); 

insert into Presente(id, pesokg, nomePresente, idCrianca) values
('1', '10', 'Bicicleta', '1'),
('2', '0.5', 'PlayStation', '1'),
('3', '8', 'Bicicleta', '3'),
('4', '0.9', 'Ursinho', '2'),
('5', '1.2', 'PlayStation', '4'),
('6', '1.5', 'PlayStation', '5'),
('7', '2', 'Quebra Cabeças', '4');

insert into ElfoFazPresente(idElfo, idPresente) values
('1', '1'),
('1', '2'),
('2', '3'),
('2', '4'),
('2', '7'),
('3', '6'),
('3', '2'),
('4', '1'),
('4', '5');


#4 - a)Altere o peso para 1.5 do presente de id igual a 7.
update presente set pesokg = 1.5 where id = 7;

# b)Altere o nome para Maurício e o país para Brasil da criança de id igual a 1.
update crianca set nome = 'Maurício', pais = 'Brasil' where id = 1;

#c) Exclua a criança de id igual a 1.
delete from crianca where id = 1;

#5 - a) Busque o nome dos países das crianças que ganharam bicicletas sem repetir os países.
select distinct pais from Crianca, Presente where crianca.id = presente.idCrianca and nomePresente = 'bicicleta';

#b) Busque o nome dos presentes e o nome das crianças apenas das crianças que acreditam no
#Papai Noel e foram boazinhas.
select crianca.nome, presente.nomePresente from crianca, presente 
where crianca.id = presente.idCrianca and acredita = 'Sim' and bonzinho = 'Sim';

#c) Busque a média de peso dos presentes feitos por elfos do departamento de empacotamento
select avg(presente.pesokg) from presente, elfo, elfoFazPresente 
where elfo.id = elfoFazPresente.idElfo and presente.id = elfoFazPresente.idPresente and elfo.departameto = 'Empacotamento';

#d) Busque o nome de todos os elfos que ajudaram a dar playstations de presente.
select distinct elfo.nome from presente, elfo, elfoFazPresente 
where elfo.id = elfoFazPresente.idElfo and presente.id = elfoFazPresente.idPresente and presente.nomePresente ='PlayStation';

#6 a) Dê ao usuário PapaiNoel os privilégios para inserir, atualizar apenas se as crianças foram
#boazinhas e buscar todos os dados somente na tabela criança.
create user 'PapaiNoel' identified by 'noel';
grant insert, update, select on Crianca to 'PapaiNoel';

#b) Dê ao usuário Krampus os privilégios de deletar crianças e buscar apenas nome, sobrenome
#e bonzinho na tabela Crianca.
create user 'Krampus' identified by 'Kp';
grant delete, select (nome, sobrenome, bonzinho) on Crianca to 'Krampus';

#c) Retire do usuário PapaiNoel o privilégio de alterar se uma criança foi boazinha
revoke update (bonzinho) on Crianca from 'PapaiNoel';
