-- 1. Atributos


-- 2. Crie as tabelas com os atributos que definiu

CREATE TABLE Automovel(
    placaId VARCHAR(7) PRIMARY KEY,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    cor VARCHAR(25),
    seguradoId INT,
	FOREIGN KEY (seguradoId) REFERENCES Segurado(seguradoId)
);

CREATE TABLE Segurado(
    seguradoId INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255),
    cpf CHAR(11), 
    placaId VARCHAR(7),
	FOREIGN KEY (placaId) REFERENCES Automovel(placaId)
);

CREATE TABLE Seguro(
	seguroId INT AUTO_INCREMENT PRIMARY KEY,
	seguradoId INT,
	placaId VARCHAR(7),
	dataInicio DATE,
	dataFim DATE,
	FOREIGN KEY (seguradoId) REFERENCES Segurado(seguradoId),
	FOREIGN KEY (placaId) REFERENCES Automovel(placaId)
);

CREATE TABLE Sinistro(
	sinistroId INT AUTO_INCREMENT PRIMARY KEY,
	dataOcorrencia DATE,
	descricao TEXT,
	seguroId INT
	FOREIGN KEY (seguroId) REFERENCES Seguro(seguroId)
);

CREATE TABLE Pericia (
	periciaId INT AUTO_INCREMENT PRIMARY KEY,
	sinistroId INT,
	peritoId INT,
	dataPericia DATE,
	laudo TEXT,
	FOREIGN KEY (sinistroId) REFERENCES Sinistro(sinistroId),
	FOREIGN KEY (peritoId) REFERENCES Perito(peritoId)
);

CREATE TABLE Perito(
	peritoId INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255),
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
	nome VARCHAR(255),
	telefone VARCHAR(20)
);

