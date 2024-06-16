/*****************************************************************************************************************************************
*												Criação das Tabelas na Base de Dados ProjetoBD2024
******************************************************************************************************************************************/

-- Create database
DROP DATABASE IF EXISTS Voleibol;
CREATE DATABASE Voleibol;

USE Voleibol;

/* Criação das Tabelas */
CREATE TABLE Atleta (
	IdAtleta INT PRIMARY KEY AUTO_INCREMENT,
	nome_atleta VARCHAR(100) NOT NULL,
	data_nasc DATE,
	Nacionalidade VARCHAR(50)
);

CREATE TABLE Equipa (
	IdEquipa INT PRIMARY KEY AUTO_INCREMENT,
	nome_equipa VARCHAR(100),
	desempenho_global INT
);

CREATE TABLE Evento (
	IdEvento INT PRIMARY KEY AUTO_INCREMENT,
	nome_evento VARCHAR(100),
	Local VARCHAR(100),
	data_inicio DATE,
	data_fim DATE,
    total_provas INT DEFAULT 0
);

CREATE TABLE Prova (
	IdProva INT PRIMARY KEY AUTO_INCREMENT,
	nome_prova VARCHAR(100),
	Local_prova VARCHAR(100),
	data DATE,
	hora TIME,
	duracao TIME,
	rodadas INT
);

CREATE TABLE Prova_Evento (
	IdProva INT,
	IdEvento INT,
	PRIMARY KEY (IdProva, IdEvento),
	FOREIGN KEY (IdProva) REFERENCES Prova(IdProva),
	FOREIGN KEY (IdEvento) REFERENCES Evento(IdEvento)
);

CREATE TABLE Resultado (
	IdResultado INT PRIMARY KEY AUTO_INCREMENT,
	classificacao VARCHAR(50),
	ranking INT
);

CREATE TABLE ProvaResultado (
	IdProva INT,
	IdResultado INT,
	PRIMARY KEY (IdProva, IdResultado),
	FOREIGN KEY (IdProva) REFERENCES Prova(IdProva),
	FOREIGN KEY (IdResultado) REFERENCES Resultado(IdResultado)
);

CREATE TABLE AtletaEquipa (
	IdAtleta INT,
	IdEquipa INT,
	PRIMARY KEY (IdAtleta, IdEquipa),
	FOREIGN KEY (IdAtleta) REFERENCES Atleta(IdAtleta),
	FOREIGN KEY (IdEquipa) REFERENCES Equipa(IdEquipa)
);

/* Tabela para armazenar Fichas Técnicas dos Atletas */
CREATE TABLE FichaTecnica (
	IdFicha INT PRIMARY KEY AUTO_INCREMENT,
	curriculo TEXT,
	historico TEXT
);

CREATE TABLE AtletaFicha (
	IdAtleta INT,
	IdFicha INT,
	PRIMARY KEY (IdAtleta, IdFicha),
	FOREIGN KEY (IdAtleta) REFERENCES Atleta(IdAtleta),
	FOREIGN KEY (IdFicha) REFERENCES FichaTecnica(IdFicha)
);

CREATE TABLE Genero (
	idGenero INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(50)
);

CREATE TABLE AtletaGenero (
	IdAtleta INT,
	idGenero INT,
	PRIMARY KEY (IdAtleta, idGenero),
	FOREIGN KEY (IdAtleta) REFERENCES Atleta(IdAtleta),
	FOREIGN KEY (idGenero) REFERENCES Genero(idGenero)
);