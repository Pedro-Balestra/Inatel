# 1) É um tipo de banco de dados onde fornece acessos a dados relacionados entre si.
# 2) Dado representa algo que não tem sentido a principio, não tem nada para embasar conclusões e decisões.
#    Informação é organisação de dados a ponto transmitir significado e compreensão
# 3) Controle de informações do RH
#    Cadastro de Clientes
#    Armazenamento de Dados em lojas
#    Operação Bancarias
# 4) Chaves primarias são determinadas em BD para auxiliar na identificação na tabela
# 5) Registro é um conjunto de campos de uma tabela que formam uma entidade, produto ou pessoa.

drop database if exists empresaaula3;
create database EmpresaAula3;

use empresaAula3;

create table funcionario(
	matricula int,
    nome varchar(60),
    cpf varchar(20),
    cargo varchar(30),
    numProjetos int,
    primary key(matricula)
);

insert into funcionario(matricula, nome, cpf, cargo, numProjetos) values( 1, 'Alexandre', '111.111.111-11', 'GP', 2);
insert into funcionario(matricula, nome, cpf, cargo, numProjetos) values( 2, 'Natanael', '222.222.222-22', 'Desenvolvedor', 4);
insert into funcionario(matricula, nome, cpf, cargo, numProjetos) values( 3, 'Rochelle', '333.333.333-33', 'Tester', 3);
insert into funcionario(matricula, nome, cpf, cargo, numProjetos) values( 4, 'Jhon', '444.444.444-44', 'Desenvolvedor', 5);
insert into funcionario(matricula, nome, cpf, cargo, numProjetos) values( 5, 'Ana Maria', '555.000.000-00', 'RH', 0);
insert into funcionario(matricula, nome, cpf, cargo, numProjetos) values( 6, 'Luciano', '123.456.789-66', 'Tester', 2);

select * from funcionario;

#a) Altere o CPF do funcionário de id igual a 5 para 555.777.999-11.
update funcionario set cpf ='555.777.999-11' where matricula= 5; 

#b) Busque a média aritmética do número de projetos dos funcionários que não são do cargo Tester
select avg(numProjetos) from funcionario;

#c) Buscar nome, cargo e número de projetos do funcionário com o maior número de projetos
select nome,cargo,numProjetos from funcionario where numProjetos = (select max(numProjetos) from funcionario);

#d) Realize uma busca que conte quantos funcionários tem 3 ou mais projetos.
select count(matricula) from funcionario where numProjetos>=3;

#e) Busque uma lista dos cargos da empresa, sem repeti-los.
select distinct(cargo) from funcionario;

#f) Busque nome, CPF e número de projetos apenas dos desenvolvedores que possuírem “an” no nome.
select nome, cpf, numProjetos from funcionario where nome like '%an%' and cargo = 'Desenvolvedor';

#g) Busque matrícula, nome e cargo, mas retorne apenas 3 registros
select matricula, nome, cargo from funcionario limit 3;

#h) Busque nome, cargo e número de projetos dos funcionários que sejam Tester ou Desenvolvedor e tenham mais de 3 projetos.
select nome, cargo, numProjetos from funcionario where numProjetos>3 and cargo = 'Tester' or cargo = 'Desenvolvedor';

#i) Delete o funcionário de id igual 6.
delete from funcionario where matricula = 6;