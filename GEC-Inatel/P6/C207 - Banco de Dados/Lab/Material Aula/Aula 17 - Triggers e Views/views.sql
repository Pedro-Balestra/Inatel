use triggersEviews;

drop view if exists InvestimentosBons;

create view InvestimentosBons as (
	select nome, total, valor, situacao
    from pessoa, investimento
    where pessoa.id = idPessoa and situacao = "AUMENTO"
);

select total from InvestimentosBons;
select count(*) from InvestimentosBons;
select avg(valor) from InvestimentosBons;