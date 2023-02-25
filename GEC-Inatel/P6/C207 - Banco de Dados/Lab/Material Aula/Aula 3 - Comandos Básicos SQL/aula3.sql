DROP DATABASE IF EXISTS bancoaula3;
creATe database bancoAula3;

use bancoAula3;

create table aluno(
	cpf int primary key,
    nome varchar(50),
    idade int,
    curso varchar(3),
    cidade varchar(50)
);

#INSERIR 
INSERT INTO aluno(cpf, nome, idade, curso) VALUES(1234, 'João Lucas', 25, 'GES');
INSERT INTO aluno(cpf, nome, idade, curso, cidade) VALUES(4583, 'Mariana', 22, 'GEC', "Pouso Alegre");
INSERT INTO aluno(cpf, nome, idade, curso, cidade) VALUES(7826, 'Pedro', '21', 'GEB', 'Pouso Alegre');
INSERT INTO aluno(cpf, nome, idade, curso, cidade) VALUES(7899, 'Paula', '27', 'GEB', 'São Francisco');
INSERT INTO aluno(cpf, nome, idade, curso, cidade) VALUES(3456, 'Pietro', '28', 'GEC', 'Itajubá');
INSERT INTO aluno(cpf, nome, idade, curso, cidade) VALUES(1172, 'Blenda', '22', 'GEC', 'Itajubá');
INSERT INTO aluno(cpf, nome, idade, curso, cidade) VALUES(9089, 'Laurinha do Camarão', 28, 'GEC', 'Itajubá');

#ALTERAR
UPDATE aluno SET idade = 26, cidade = "Bueno Brandão" WHERE cpf = 1234;

#DELETAR/EXCLUIR
DELETE FROM aluno WHERE cpf = 9089;

#BUSCAR
SELECT * FROM aluno;
SELECT nome, curso FROM aluno;
SELECT nome, idade, curso, cidade FROM aluno WHERE idade>22 and idade<=26;
# % um numero indefinido de letras q eu nao conheço
# _ representa um caracter q eu não sei qual é
SELECT nome, cidade FROM aluno WHERE nome LIKE "P____%";
SELECT * FROM aluno WHERE curso = "GEC";
SELECT max(idade) FROM aluno;
SELECT * FROM aluno WHERE idade = (SELECT max(idade) FROM aluno);
SELECT * from aluno limit 2;
SELECT DISTINCT(curso) FROM aluno;
SELECT DISTINCT curso, cidade FROM aluno;
SELECT * from aluno where not idade = 22;
select * from aluno where idade != 22;
