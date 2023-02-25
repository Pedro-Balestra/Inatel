use triggersEviews;
#set @soma = 0;

#NEW é pra pegar o novo valor (INSERT, UPDATE)
#OLD é pra pegar o valor antigo (DELETE, UPDATE)

/*
delimiter $$
drop trigger if exists adicionar$$
create trigger adicionar before insert on investimento
for each row 
begin
	set new.situacao = "NEUTRA";
	update pessoa set total = total + new.valor where id = new.idPessoa;
end$$
delimiter ;
*/

delimiter $$
drop trigger if exists addInvestimento $$
create trigger addInvestimento after insert on investimento
for each row
begin
	update pessoa set total = total + new.valor where id = new.idPessoa;
end $$
delimiter ;

insert into investimento(valor, idPessoa) values('300', '1');
/*
delimiter $$
drop trigger if exists excluir$$
create trigger excluir after delete on investimento
for each row 
begin
	update pessoa set total = total - old.valor where id = old.idPessoa;
end$$
delimiter ;

delete from investimento where id = 3;


insert into investimento(valor, idPessoa) values('500', '1');
insert into investimento(valor, idPessoa) values('150', '1');
insert into investimento(valor, idPessoa) values('437', '1');


delimiter $$
drop trigger if exists alterar$$
create trigger alterar before update on investimento
for each row 
begin
	if new.valor > old.valor then
		set new.situacao = "AUMENTO";
	elseif new.valor < old.valor then
		set new.situacao = "QUEDA";
    end if;
end$$
delimiter ;

update investimento set valor = 600 where id = 4;
update investimento set valor = 50 where id = 5;
update investimento set valor = 450 where id = 6;
*/
select * from investimento;
select * from pessoa;
