USE lista4;

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

#Criando a tabela departamento
CREATE TABLE departamento(
   Dnome VARCHAR(30) NOT NULL,
   DNumero INT NOT NULL,
   SSN_Empregado BIGINT,
   DataInicio DATE,
   
   PRIMARY KEY(DNumero)   
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
      ON UPDATE SET NULL
      ON DELETE SET NULL
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
       ON UPDATE SET NULL
       ON DELETE CASCADE,
       
	 CONSTRAINT fk5
	   FOREIGN KEY (PNumero_Projeto) 
       REFERENCES projeto (PNumero)
       ON UPDATE CASCADE
       ON DELETE SET NULL
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
       ON UPDATE SET NULL
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

# Questão 1 e 2 eu inseri direto

# Questão 3
INSERT INTO empregado (PNome, UNome, SSN, DNumero_Departamento) VALUES ('João', 'Santos', '255', '1');
INSERT INTO empregado (PNome, MInicial, UNome, SSN, DataNasc, Endereco, Sexo, Salario, DNumero_Departamento) VALUES 
('Harry', 'T', 'Potter', '100', '31-07-1980', 'Rua dos Alfeneiros', 'M', '7000', '4'),
('Rony', 'B', 'Weasley', '102', '01-03-1980', 'A Toca', 'M', '6500', '4');

# Questão 4
INSERT INTO projeto (PNome, PNumero) VALUES
('Formação Básica', '1'),
('Formação Acadêmica', '2'),
('Formação Técnica', '3');
