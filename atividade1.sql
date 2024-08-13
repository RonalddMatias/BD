-- 1. Atributos

/* 
-- Automovel (placaId, marca, modelo, cor, seguradoid)
-- Segurado (seguradoId, nome, cpf, placaId)
-- Seguro (seguroId, seguradoId, placaId, dataInicio, dataFim)
-- Sinistro (sinistroId, dataOcorrencia, descricao, seguroId)
-- Pericia (periciaId, sinistroId, peritoId, dataPericia, laudo)
-- Perito (peritoId, nome, telefone)
-- Reparo(reparoId, oficinaId, sinistroId)
-- Ofina (oficinaId, nome, telefone)


->  Para um melhor entendimento da minha modelagem, considere os seguintes fatos:

- Um segurado pode ter muitos veiculos.
- Um seguro esta associado a um automovel.
- Um sinistro esta associado a um seguro.
- Uma pericia esta associada a um perito e a um sinistro.
- Um reparo esta associado a um sinisto e a uma oficina.

*/

-- 2. Crie as tabelas com os atributos que definiu

CREATE TABLE Automovel(
    placaId VARCHAR(7),
    marca VARCHAR(50),
    modelo VARCHAR(50),
    cor VARCHAR(25),
    seguradoId INT,
);

CREATE TABLE Segurado(
    seguradoId INT AUTO_INCREMENT ,
    nome VARCHAR(255),
    cpf CHAR(11), 
    placaId VARCHAR(7),
);

CREATE TABLE Seguro(
	seguroId INT AUTO_INCREMENT,
	seguradoId INT,
	placaId VARCHAR(7),
	dataInicio DATE,
	dataFim DATE,
);

CREATE TABLE Sinistro(
	sinistroId INT AUTO_INCREMENT,
	dataOcorrencia DATE,
	descricao TEXT,
	seguroId INT
);

CREATE TABLE Pericia (
	periciaId INT AUTO_INCREMENT ,
	sinistroId INT,
	peritoId INT,
	dataPericia DATE,
	laudo TEXT,
);

CREATE TABLE Perito(
	peritoId INT AUTO_INCREMENT,
	nome VARCHAR(255),
	telefone VARCHAR(20)
);

CREATE TABLE Reparo(
	reparoId INT AUTO_INCREMENT,
	oficinaId INT,
	sinistroId INT
);

CREATE TABLE Oficina (
	oficinaId INT AUTO_INCREMENT,
	nome VARCHAR(255),
	telefone VARCHAR(20)
);


-- 3. Adicionando a chave primaria com o uso do ALTER TABLE

ALTER TABLE Automovel ADD PRIMARY KEY (placaId);
ALTER TABLE Segurado ADD PRIMARY KEY (seguradoId);
ALTER TABLE Seguro ADD PRIMARY KEY (seguroID);
ALTER TABLE Sinistro ADD PRIMARY KEY (sinistroId);
ALTER TABLE Pericia ADD PRIMARY KEY (periciaId);
ALTER TABLE Reparo ADD PRIMARY KEY (reparoId);
ALTER TABLE Oficina ADD PRIMARY KEY (oficinaId);

-- 4. Adicionando as chaves estrangeiras
ALTER TABLE Automovel ADD FOREIGN KEY (seguradoId) REFERENCES Segurado(seguradoId);
ALTER TABLE Segurado ADD FOREIGN KEY (placaId) REFERENCES Automovel(placaId);
ALTER TABLE Seguro ADD FOREIGN KEY (seguradoId) REFERENCES Segurado(seguradoId);
ALTER TABLE Seguro ADD FOREIGN KEY (placaId) REFERENCES Automovel(placaId);
ALTER TABLE Sinistro ADD FOREIGN KEY (seguroId) REFERENCES Seguro(seguroId);
ALTER TABLE Pericia ADD FOREIGN KEY (sinistroId) REFERENCES Sinistro(sinistroId);
ALTER TABLE Pericia ADD FOREIGN KEY (peritoId) REFERENCES Perito(peritoId);
ALTER TABLE Reparo ADD FOREIGN KEY (oficinaId) REFERENCES Oficina(oficinaId);
ALTER TABLE Reparo ADD FOREIGN KEY (sinistroId) REFERENCES Sinistro(sinistroId);

-- 5. Pensar em atributo que poderiam/deveriam ser NOT NULL;

/*
-- Automovel (placaId, marca NOT NULL, modelo NOT NULL, cor, seguradoid)
-- Segurado (seguradoId, nome NOT NULL, cpf NOT NULL, placaId)
-- Seguro (seguroId, seguradoId, placaId, dataInicio NOT NULL, dataFim)
-- Sinistro (sinistroId, dataOcorrencia NOT NULL, descricao, seguroId)
-- Pericia (periciaId, sinistroId, peritoId, dataPericia NOT NULL, laudo NOT NULL)
-- Perito (peritoId, nome NOT NULL, telefone)
-- Reparo(reparoId, oficinaId, sinistroId)
-- Ofina (oficinaId, nome NOT NULL, telefone)
*/

-- 6. Remova todas as tabelas que você criou

DROP TABLE IF EXISTS Perito;
DROP TABLE IF EXISTS Oficina;
DROP TABLE IF EXISTS Reparo;
DROP TABLE IF EXISTS Pericia;

DROP TABLE IF EXISTS Sinistro;
DROP TABLE IF EXISTS Segurado;
DROP TABLE IF EXISTS Seguro;
DROP TABLE IF EXISTS Automovel;

-- 7 e 8. Reescreva os comando CREATE TABLE de forma a incorporar todas as deficinições de constrains(Primary Key, Foreign Key, NOT NULL). Faça cada CREATE TABLE de forma separada.

CREATE TABLE Automovel(
    placaId VARCHAR(7) PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    cor VARCHAR(25),
    seguradoId INT,
	FOREIGN KEY (seguradoId) REFERENCES Segurado(seguradoId)
);

CREATE TABLE Segurado(
    seguradoId INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf CHAR(11) NOT NULL, 
    placaId VARCHAR(7),
	FOREIGN KEY (placaId) REFERENCES Automovel(placaId)
);

CREATE TABLE Seguro(
	seguroId INT AUTO_INCREMENT PRIMARY KEY,
	seguradoId INT,
	placaId VARCHAR(7),
	dataInicio DATE NOT NULL,
	dataFim DATE,
	FOREIGN KEY (seguradoId) REFERENCES Segurado(seguradoId),
	FOREIGN KEY (placaId) REFERENCES Automovel(placaId)
);

CREATE TABLE Sinistro(
	sinistroId INT AUTO_INCREMENT PRIMARY KEY,
	dataOcorrencia DATE NOT NULL,
	descricao TEXT,
	seguroId INT
	FOREIGN KEY (seguroId) REFERENCES Seguro(seguroId)
);

CREATE TABLE Pericia (
	periciaId INT AUTO_INCREMENT PRIMARY KEY,
	sinistroId INT,
	peritoId INT,
	dataPericia DATE NOT NULL,
	laudo TEXT NOT NULL,
	FOREIGN KEY (sinistroId) REFERENCES Sinistro(sinistroId),
	FOREIGN KEY (peritoId) REFERENCES Perito(peritoId)
);

CREATE TABLE Perito(
	peritoId INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	telefone VARCHAR(20)
);

CREATE TABLE Reparo(
	reparoId INT AUTO_INCREMENT PRIMARY KEY,
	oficinaId INT,
	sinistroId INT
	FOREIGN KEY (oficinaId) REFERENCES Oficina(oficinaId),
	FOREIGN KEY (sinistroId) REFERENCES Sinistro (sinistroId)
);

CREATE TABLE Oficina (
	oficinaId INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	telefone VARCHAR(20)
);

-- 9. Remova novamente todas as tabelas que criei

DROP TABLE IF EXISTS Perito;
DROP TABLE IF EXISTS Oficina;
DROP TABLE IF EXISTS Reparo;
DROP TABLE IF EXISTS Pericia;

DROP TABLE IF EXISTS Sinistro;
DROP TABLE IF EXISTS Segurado;
DROP TABLE IF EXISTS Seguro;
DROP TABLE IF EXISTS Automovel;

-- 10. Você definiria outra tabelas para este banco de dados?

-- Reposta: No momento, eu não modificaria nada no meu banco de dados, acredito que essa abordagem ficou bastante fiel as especificações passadas na atividade. Todavia, acredito que de acordo com as discussões que teremos em sala de aula sobre a melhor forma de modelar este banco de dados, as minhas tabelas podem sim serem alteradas, tanto quanto a relação entre elas.
--


