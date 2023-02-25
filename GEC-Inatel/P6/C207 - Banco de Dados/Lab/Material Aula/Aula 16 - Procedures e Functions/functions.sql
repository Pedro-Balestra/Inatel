use bancoFunctions;

insert into produto(nome, preco, quantidade) values
('Arroz', '25', '3'),
('Óleo', '6.5',  2);


delimiter $$
drop function if exists calcTotal$$
create function calcTotal(precoProd float, qtd int) returns float deterministic
begin
	declare total float;
    set total = precoProd * qtd;
    return total;
end $$
delimiter ;

select id, nome, preco, quantidade, calcTotal(preco, quantidade) as total from produto;


delimiter $$
drop function if exists fatorial$$
create function fatorial(num int) returns int deterministic
begin
	declare resultado int;
    set resultado = 1;
    while num > 1 do
		set resultado = resultado * num;
        set num = num - 1;
    end while;
    
    return resultado;
end $$
delimiter ;

select fatorial(5) as Fatorial;