CREATE DATABASE IF NOT EXISTS cinema;

USE cinema;

CREATE TABLE IF NOT EXISTS Filme(
	id INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    tempo INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS Ator(
	id INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    dataNasc varchar(40) NOT NULL,
    sexo VARCHAR(20) NOT NULL,
    idFilme INT,
    PRIMARY KEY(id),
    CONSTRAINT fk_ator_filme
		FOREIGN KEY(idFilme)
        REFERENCES filme(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);