/*****************************************************************************************************************************************
*												Criação das Tabelas na Base de Dados ProjetoBD2024
******************************************************************************************************************************************/

-- Criação da Base de Dados
DROP DATABASE IF EXISTS Voleibol;
CREATE DATABASE Voleibol;
USE Voleibol;

-- Criação das Tabelas
CREATE TABLE Atleta (
    IdAtleta INT AUTO_INCREMENT PRIMARY KEY,
    nome_atleta VARCHAR(100) NOT NULL,
    data_nasc DATE NOT NULL,
    Nacionalidade VARCHAR(50) NOT NULL,
    Cidade VARCHAR(100),
    Bairro VARCHAR(100),
    Posicao VARCHAR(50)
);

CREATE TABLE Equipa (
    IdEquipa INT AUTO_INCREMENT PRIMARY KEY,
    nome_equipa VARCHAR(100) NOT NULL,
    desempenho_global INT NOT NULL
);

CREATE TABLE Evento (
    IdEvento INT AUTO_INCREMENT PRIMARY KEY,
    nome_evento VARCHAR(100) NOT NULL,
    Local VARCHAR(100) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    total_provas INT DEFAULT 0
);

CREATE TABLE Prova (
    IdProva INT AUTO_INCREMENT PRIMARY KEY,
    nome_prova VARCHAR(100) NOT NULL,
    Local_prova VARCHAR(100) NOT NULL,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    duracao TIME NOT NULL,
    rodadas INT NOT NULL
);

CREATE TABLE Resultado (
    IdResultado INT AUTO_INCREMENT PRIMARY KEY,
    classificacao VARCHAR(50) NOT NULL,
    ranking INT NOT NULL
);

CREATE TABLE Prova_Evento (
    IdProva INT,
    IdEvento INT,
    PRIMARY KEY (IdProva, IdEvento),
    FOREIGN KEY (IdProva) REFERENCES Prova(IdProva),
    FOREIGN KEY (IdEvento) REFERENCES Evento(IdEvento)
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

CREATE TABLE FichaTecnica (
    IdFicha INT AUTO_INCREMENT PRIMARY KEY,
    curriculo VARCHAR(255),
    historico VARCHAR(255)
);

CREATE TABLE AtletaFicha (
    IdAtleta INT,
    IdFicha INT,
    PRIMARY KEY (IdAtleta, IdFicha),
    FOREIGN KEY (IdAtleta) REFERENCES Atleta(IdAtleta),
    FOREIGN KEY (IdFicha) REFERENCES FichaTecnica(IdFicha)
);

CREATE TABLE Genero (
    IdGenero INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50)
);

CREATE TABLE AtletaGenero (
    IdAtleta INT,
    IdGenero INT,
    PRIMARY KEY (IdAtleta, IdGenero),
    FOREIGN KEY (IdAtleta) REFERENCES Atleta(IdAtleta),
    FOREIGN KEY (IdGenero) REFERENCES Genero(IdGenero)
);

CREATE TABLE Estadio (
    IdEstadio INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Capacidade INT,
    Localizacao VARCHAR(100),
    IdProva INT,
    FOREIGN KEY (IdProva) REFERENCES Prova(IdProva)
);

CREATE TABLE Treinador (
    IdTreinador INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    DataNasc DATE,
    Cidade VARCHAR(100),
    Bairro VARCHAR(100),
    AnosExperiencia INT
);

CREATE TABLE Patrocinador (
    IdPatrocinador INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100)
);

CREATE TABLE Organizadora (
    IdOrganizadora INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100)
);

CREATE TABLE ProvaOrganizadora (
    IdProva INT,
    IdOrganizadora INT,
    PRIMARY KEY (IdProva, IdOrganizadora),
    FOREIGN KEY (IdProva) REFERENCES Prova(IdProva),
    FOREIGN KEY (IdOrganizadora) REFERENCES Organizadora(IdOrganizadora)
);

CREATE TABLE ProvaPatrocinador (
    IdProva INT,
    IdPatrocinador INT,
    PRIMARY KEY (IdProva, IdPatrocinador),
    FOREIGN KEY (IdProva) REFERENCES Prova(IdProva),
    FOREIGN KEY (IdPatrocinador) REFERENCES Patrocinador(IdPatrocinador)
);
