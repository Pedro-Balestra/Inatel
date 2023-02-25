DROP DATABASE IF EXISTS aula_procedure;
CREATE DATABASE aula_procedure;
USE aula_procedure;

CREATE TABLE Aluno(
	matricula INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(100),
    nome VARCHAR(50),
    curso VARCHAR(3),
    PRIMARY KEY(matricula, curso)
);

delimiter $$

DROP PROCEDURE IF EXISTS geraEmail $$
CREATE PROCEDURE geraEmail(IN matricula INT, IN nome VARCHAR(50), IN curso VARCHAR(3))
BEGIN
	insert into aluno(matricula, curso, nome, email)
    values(matricula, curso, nome, concat(nome, "@", curso, ".inatel.br"));
END $$

DROP PROCEDURE IF EXISTS deletar $$
CREATE PROCEDURE deletar(IN mat INT, IN grad VARCHAR(3))
BEGIN
	DELETE FROM aluno WHERE matricula = mat AND curso = grad;

END $$

DROP PROCEDURE IF EXISTS alterar $$
CREATE PROCEDURE alterar(IN mat INT, IN curso VARCHAR(3), IN nome VARCHAR(100))
BEGIN
	UPDATE aluno SET email = geraEmail(mat, nome, curso);

END $$

delimiter ;

CALL geraEmail(1233, "Marcos", "get");
CALL geraEmail(1551, "Pedro", "gec");

CALL deletar(1233, "geT");
CALL ALTERAR(1551,"gea","Pedro");

# Não entendi muito bem como fazer o procedures

# ------------------------------------------------------------------------------------

DROP DATABASE IF EXISTS loja;
CREATE DATABASE loja;
USE loja;

CREATE TABLE compra(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    preco FLOAT,
    pagamento FLOAT
);

INSERT INTO compra VALUES
(id, 9.5, 10.25),
(id, 18.99, 25),
(id, 3.99, 5),
(id, 8.85, 8.89),
(id, 19.49, 20);

delimiter $$
DROP FUNCTION IF EXISTS calcula_Troco $$
CREATE FUNCTION calcula_Troco(pagamento DOUBLE, preco DOUBLE) RETURNS VARCHAR(30) DETERMINISTIC 
BEGIN
	DECLARE resultado VARCHAR(30);
	DECLARE troco FLOAT;
    SET troco = pagamento - preco;
    IF troco < 0.05 THEN
		SET resultado = "Sem troco";
	ELSEIF (troco <= 1 AND troco > 0.05) THEN
		SET resultado = "Balinhas de café";
	ELSE
		SET resultado = "Em dinheiro";
	END IF;
    RETURN resultado;
    
END $$

delimiter ;

SELECT id, preco, pagamento, calcula_Troco(pagamento, preco) as "Tipo de Troco" from compra;

