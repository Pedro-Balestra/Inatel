drop database if exists bancoConexao;
create database bancoconexao;
use bancoconexao;

create table livro (
	id int auto_increment primary key,
    titulo varchar(50) not null,
    autor varchar(50) not null,
    numPaginas int not null
);

select * from livro;