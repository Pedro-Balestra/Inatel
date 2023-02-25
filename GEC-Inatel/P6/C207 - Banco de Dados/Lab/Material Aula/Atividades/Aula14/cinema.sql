CREATE DATABASE IF NOT EXISTS cinema;

USE cinema;

CREATE TABLE IF NOT EXISTS Filme(
	id INT,
    titulo VARCHAR(100) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    tempo INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS Ator(
	id INT,
    nome VARCHAR(100) NOT NULL,
    dataNasc varchar(40) NOT NULL,
    sexo VARCHAR(20) NOT NULL,
    idFilme INT,
    PRIMARY KEY(id),
    CONSTRAINT fk_ator_filme
		FOREIGN KEY(idFilme)
        REFERENCES filme(id)
			ON DELETE set null
			ON UPDATE CASCADE
);

#1) Adicione as colunas país e idioma na tabela Ator. Ambos varchar com tamanho limite de 50 caracteres.
alter table ator add pais varchar(50);
alter table ator add idioma varchar(50);

#2) Altere a coluna dataNasc para idade, do tipo int not null na tabelaAtor.
alter table ator change dataNasc idade int not null;

#3) Remova a coluna sexo da tabela Ator.
alter table ator drop sexo;

#4) Entre com os dados abaixo nas respectivas tabelas:
insert into filme() values (1, "Jogos Vorazes", "Ação", 143);
insert into filme() values (2, "O Destino de Júpiter", "Ficção Científica", 127);
insert into ator() values (1, "Jennifer Lawrence", 30, 1, "EUA", "inglês");
insert into ator() values (2, "Josh Hutcherson", 28, 1, "EUA", "inglês");
insert into ator() values (3, "Bae Doona", 41, 2, "Coréia do Sul", "coreano");
insert into ator() values (4, "Mila Kunis", 35, 2, "Ucrânia", "ucraniano");
insert into ator() values (5, "Eddie Redmayne", 38, 2, "Reino Unido", "inglês");

#5) Altere a idade da atriz de nome Mila Kunis para 37.
update ator set idade = 37 where id = 4;

#6) Apague o registro do ator de id igual a 5.
delete from ator where id = 5;

#7) Altere o id para 43, do filme com id igual a 1.
update filme set id = 43 where id = 1;

#8) Apague o filme de id igual a 2.
delete from filme where id = 2;

#9) Altere apenas o nome da coluna pais para paisDeOrigem. 
#   (manter o mesmo tipo de dado a ser guardado e not null).
alter table ator change pais paisDeOrigem varchar(50) not null;

#10) Remova a coluna idade da tabela Ator.
alter table ator drop idade;