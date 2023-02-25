drop daTAbase if exists aula3;
CREATE DATABASE aula3;

use AULA3;

create table if not exists aluno(
	cpf int primary key,
	matricula int,
    nome varchar(50),
    curso varchar(3),
    email varchar(30),
    idade int
);

#INSERIR
INSERT INTO 
aluno(cpf, matricula, nome, email, idade)
VALUES(1234, 36, "Uttoni", "uttoni@inatel", 21);
INSERT INTO 
aluno(cpf, matricula, nome, email, idade)
VALUES(2457, 78, "Aline", "aline@inatel", 75);
INSERT INTO 
aluno(cpf, matricula, nome, email, idade, curso)
VALUES(1277, 2345, "Vinicius", "vinicius@inatel", 20, "GES");
INSERT INTO 
aluno(cpf, matricula, nome, email, idade, curso)
VALUES(2254, 7690, "Thalita", "thalita@inatel", 21, "GEC");

#ALTERAÇÃO
UPDATE aluno SET curso = "GES" WHERE CPF = 1234;
update aluno set curso = "GES", idade = 20 where cpf = 2457;

#deletar
DELETE FROM aluno WHERE cpf = 1234;

#BUSCAR
SELECT * FROM aluno;
SELECT matricula, curso, nome, email
FROM ALUNO;
SELECT nome, idade, curso from aluno where idade <> 21;
select max(idade) from aluno;
select nome, idade, email from aluno
where idade = (select max(idade) from aluno);

select * from aluno limit 2;
select distinct curso from aluno;




