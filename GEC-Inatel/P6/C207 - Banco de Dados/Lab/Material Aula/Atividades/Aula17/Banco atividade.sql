drop database if exists bancoAtividade;
create database bancoAtividade;
use bancoAtividade;

#EXERCICIO TRIGGERS (tabelas produtos e itens_venda)================================================================== 
CREATE TABLE produtos (
	id INT PRIMARY KEY,
	descricao VARCHAR(50),
	estoque INT NOT NULL
);

INSERT INTO produtos VALUES ('1', 'Lasanha', '10');
INSERT INTO produtos VALUES ('2', 'Morango', '5');
INSERT INTO produtos VALUES ('3', 'Farinha', '15');
INSERT INTO produtos VALUES ('4', 'Arroz', '25');
INSERT INTO produtos VALUES ('5', 'Vodka', '17');

CREATE TABLE itens_venda (
	id_venda INT PRIMARY KEY,
	id_produto INT,
	quantidade INT
);

#EXERCICIO VIEWS (tabelas departamento e investimento)================================================================
create table if not exists departamento(
	id int not null auto_increment,
    nome varchar(100) not null,
    primary key(id)
);

insert into departamento(nome) values("RH");

create table if not exists funcionario(
	id int not null auto_increment,
    nome varchar(50),
    idade int,
    altura float,
	idDepartamento int not null,
    primary key(id),
    constraint fk1
		foreign key(idDepartamento)
		references Departamento (id)
        on update cascade
        on delete cascade
);


#Questão 1
#Triggers

DELIMITER $$

DROP TRIGGER IF EXISTS baixa $$
CREATE TRIGGER baixa_estoque AFTER INSERT ON itens_venda
FOR EACH ROW
BEGIN

	UPDATE produtos SET produtos.estoque = produtos.estoque - NEW.quantidade WHERE id = NEW.id_produto;
    
END $$

DELIMITER ;

INSERT INTO itens_venda VALUES (1, 1, 4);
INSERT INTO itens_venda VALUES (2, 3, 5);
SELECT * FROM produtos;


DELIMITER $$
CREATE TRIGGER retorna_estoque AFTER DELETE ON itens_venda
FOR EACH ROW
BEGIN
	UPDATE produtos SET produtos.estoque = produtos.estoque + OLD.quantidade WHERE id = OLD.id_produto;
END $$

DELIMITER ;

DELETE FROM itens_venda WHERE id_venda = 1;
SELECT * FROM produtos;


#Questão 2
#View

DROP VIEW IF EXISTS EquipeRH;

CREATE VIEW EquipeRH AS (

	SELECT func.nome, func.idade, func.altura FROM funcionario AS func, departamento AS dep WHERE dep.nome = "RH"

);

SELECT *, AVG(idade) AS "Média das idades" FROM EquipeRH;
