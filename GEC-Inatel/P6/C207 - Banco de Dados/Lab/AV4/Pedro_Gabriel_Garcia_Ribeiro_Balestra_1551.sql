drop database if exists bancoav4;
create database bancoav4;
use bancoav4;

create table Cliente(
   id int auto_increment,
   nome varchar(50),
   idade int,
   saldo float,
   primary key(id)
   );

create table Cinema(
	id int auto_increment,
    nome_filme varchar(50),
	preco_ingresso float,
	preco_pipoca float,
	preco_refri float,
	preco_total float,
	idCliente int,
	primary key (id),
	constraint fk1
		foreign key(idCliente)
		references Cliente (id)
		ON DELETE no action #no action
		ON UPDATE no action #no action
);

#Questão 1
INSERT INTO cliente VALUES (1, "Pedro Balestra", 22,100);

delimiter $$

DROP PROCEDURE IF EXISTS calcula_gasto $$
CREATE PROCEDURE calcula_gasto(IN preco_ingresso FLOAT, IN preco_pipoca FLOAT, IN preco_refri FLOAT, IN idCliente INT)
BEGIN
    INSERT INTO Cinema (idCliente, preco_ingresso, preco_pipoca, preco_refri)
    VALUES (idCliente, preco_ingresso, preco_pipoca, preco_refri);
    
    UPDATE Cinema SET preco_total = (preco_ingresso + preco_pipoca + preco_refri)
    WHERE id = idCliente;

END $$

delimiter ;

call calcula_gasto(30, 20, 7, 1);
select * from Cinema;

update Cinema  set nome_filme = ("Até o ultimo homem") WHERE id = 1;



#Questão 2 
delimiter $$
DROP FUNCTION IF EXISTS preco_com_desconto $$
CREATE FUNCTION preco_com_desconto(preco_ingresso float, preco_pipoca float, preco_refri float) RETURNS float DETERMINISTIC 
BEGIN
	RETURN (select (preco_total*0.2) from cinema where(preco_ingresso = preco_ingresso and preco_pipoca = preco_pipoca and preco_refri = preco_refri));
    
END $$

delimiter ;

select id, preco_com_desconto(preco_ingresso, preco_pipoca , preco_refri ) as "Preço com desconto" from cinema;



#Questão 3
DELIMITER $$

DROP TRIGGER IF EXISTS simula_compra $$
CREATE TRIGGER simula_compra before INSERT ON cinema
FOR EACH ROW
BEGIN

	UPDATE cliente SET saldo = saldo - cinema.preco_total;
    
END $$

DELIMITER ;
#INSERT INTO cinema VALUES ("Até o ultimo homem", 20,10,7);
#Não entendi como fazer essa aqui mas o trigger ta ai kkkkkk

#Questão 4
DROP VIEW IF EXISTS cliente_cinema;

CREATE VIEW cliente_cinema AS (

	SELECT cliente.nome, cliente.idade, cliente.saldo, cinema.nome_filme, cinema.preco_ingresso
    FROM cliente ,cinema WHERE cliente.idade >= 18

);

SELECT * FROM cliente_cinema
