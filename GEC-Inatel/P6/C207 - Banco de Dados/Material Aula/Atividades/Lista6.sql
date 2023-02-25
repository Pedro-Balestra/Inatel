DROP DATABASE IF EXISTS lista6;

CREATE DATABASE lista6;

USE lista6;

#Criando a tabela departamento
CREATE TABLE departamento(
   Dnome VARCHAR(30) NOT NULL,
   DNumero INT NOT NULL,
   SSN_Empregado BIGINT,
   DataInicio DATE,
   
   PRIMARY KEY(DNumero)   
);

#Criando a tabela empregado
CREATE TABLE empregado(
  PNome VARCHAR(15) NOT NULL,
  MInicial CHAR,
  UNome VARCHAR(15) NOT NULL,
  SSN BIGINT NOT NULL,
  DataNasc DATE,
  Endereco VARCHAR(80),
  Sexo BIT,
  Salario DECIMAL(10,2),
  SSN_Supervisor BIGINT,
  DNumero_Departamento INT NOT NULL,
  
  PRIMARY KEY (SSN),
  CONSTRAINT fk1
	FOREIGN KEY (SSN_Supervisor) 
    REFERENCES empregado (SSN)
    ON UPDATE NO ACTION
    ON DELETE SET NULL,
  
  CONSTRAINT fk2
	FOREIGN KEY (DNumero_Departamento) 
    REFERENCES departamento (DNumero)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

#Criando a tabela projeto
CREATE TABLE projeto(
	PNome VARCHAR(30) NOT NULL,
    PNumero INT NOT NULL,
    PLocalizacao VARCHAR(30),
    DNumero_Departamento INT NOT NULL,
    
    PRIMARY KEY (PNumero),
    CONSTRAINT fk3
	  FOREIGN KEY (DNumero_Departamento) 
      REFERENCES departamento (DNumero)
      ON UPDATE CASCADE
      ON DELETE CASCADE
);


#Criando a tabela trabalha_em
CREATE TABLE trabalha_em(
	SSN_Empregado BIGINT NOT NULL,
    PNumero_Projeto INT NOT NULL,
    Horas TIME,
    
    PRIMARY KEY(SSN_Empregado, PNumero_Projeto),
    CONSTRAINT fk4
	   FOREIGN KEY (SSN_Empregado) 
       REFERENCES empregado (SSN)
       ON UPDATE CASCADE
       ON DELETE CASCADE,
       
	 CONSTRAINT fk5
	   FOREIGN KEY (PNumero_Projeto) 
       REFERENCES projeto (PNumero)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);

#Criando a tabela dependente
CREATE TABLE dependente(
	SSN_Empregado BIGINT NOT NULL,
    Nome_Dependente VARCHAR(30) NOT NULL,
    Sexo TINYINT,
    DataNasc DATE,
    Parentesco VARCHAR(10),
    
    PRIMARY KEY(SSN_Empregado, Nome_Dependente),
    CONSTRAINT fk6
	   FOREIGN KEY (SSN_Empregado) 
       REFERENCES empregado (SSN)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);


#Criando a tabela depto localizacoes
CREATE TABLE depto_Localizacoes(
	LNumero INT NOT NULL,
    DLocalizacao VARCHAR(15) NOT NULL,
    DNumero_Departamento INT NOT NULL,
    
    PRIMARY KEY (LNumero),
     CONSTRAINT fk7
	   FOREIGN KEY (DNumero_Departamento) 
       REFERENCES departamento (DNumero)
       ON UPDATE CASCADE
       ON DELETE CASCADE
);

# 1) Busca de diferentes tipos de parentescos
SELECT DISTINCT parentesco FROM dependente;

# 2) Busca de: último nome, data de nascimento dos empregados homens (ordenados por ordem decrescente de idade)
SELECT UNome, DataNasc FROM empregado WHERE sexo = '1' ORDER BY DataNasc DESC;

# 3) Busca do nome dos dependentes junto ao PNome dos empregados
SELECT dependente.Nome_Dependente AS "Nome Dependente", empregado.PNome AS "Nome do Reponsável" FROM dependente, empregado WHERE dependente.SSN_Empregado = empregado.SSN;

# 4) Busca da média salarial dos paulistanos que trabalham no departamento de engenharia
SELECT AVG(Salario) AS "Média Salarial de SP" FROM empregado, departamento WHERE (endereco LIKE "%Sao Paulo%" AND PNome = "Engenharia");

# 5) Busca de: Primeiro nome, primeiro nome dos empregados gerenciados por cada supervisor, e a diferença salarial dele para os demais empregados
SELECT emp.Pnome AS 'Empregado', sup.PNome AS 'Supervisor', abs((sup.Salario-emp.salario)) AS'Diferença Salarial' FROM Empregado AS emp, Empregado AS sup WHERE sup.SSN_Supervisor=emp.SSN;  

# 6) Busca de: Primeiro nome, nome dos projetos e horas trabalhadas dos empregados
SELECT emp.PNome, proj.PNome, worked.Horas FROM empregado AS emp, projeto AS proj, trabalha_em AS worked WHERE worked.SSN_Empregado = emp.SSN AND worked.PNumero_Projeto = proj.PNumero;