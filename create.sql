/*****************************************************************************************************************************************
*                                              Criação das Tabelas na Base de Dados ProjetoBD2024
******************************************************************************************************************************************/

DROP DATABASE IF EXISTS Volei;
CREATE DATABASE Volei;
USE Volei;


-- Tabela: Pais
CREATE TABLE Pais (
    IdPais INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL UNIQUE
);

-- Tabela: Entidade Organizadora
CREATE TABLE Entidade_Organizadora (
    IdEntidade_Organizadora INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    IdPais INT,
    FOREIGN KEY (IdPais) REFERENCES Pais(IdPais)
);

-- Tabela: Estadio
CREATE TABLE Estadio (
    IdEstadio INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL UNIQUE,
    Capacidade INT NOT NULL
);

-- Tabela: Resultado
CREATE TABLE Resultado (
    IdResultado INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(255) NOT NULL
);

-- Tabela: Equipa
CREATE TABLE Equipa (
    IdEquipa INT AUTO_INCREMENT PRIMARY KEY,
    NomeEquipa VARCHAR(100) NOT NULL,
    IdadeDaEquipa INT,
    IdPais INT,
    FOREIGN KEY (IdPais) REFERENCES Pais(IdPais)
);

-- Tabela: Evento
CREATE TABLE Evento (
    IdEvento INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    NomeEvento VARCHAR(100) NOT NULL,
    Jornada VARCHAR(100),
    Hora TIME,
    Modalidade VARCHAR(100),
    IdEstadio INT,
    IdResultado INT,
    IdEntidade_Organizadora INT,
    IdPais INT,
    FOREIGN KEY (IdEstadio) REFERENCES Estadio(IdEstadio),
    FOREIGN KEY (IdResultado) REFERENCES Resultado(IdResultado),
    FOREIGN KEY (IdEntidade_Organizadora) REFERENCES Entidade_Organizadora(IdEntidade_Organizadora),
    FOREIGN KEY (IdPais) REFERENCES Pais(IdPais)
);

-- Tabela: Pessoa
CREATE TABLE Pessoa (
    IdPessoa INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Cidade VARCHAR(100),
    Morada VARCHAR(100),
    Bairro VARCHAR(100)
);

-- Tabela: FichaTecnica
CREATE TABLE FichaTecnica (
    IdFichaTecnica INT AUTO_INCREMENT PRIMARY KEY,
    DataNascimento DATE NOT NULL,
    Altura FLOAT NOT NULL,
    Peso FLOAT NOT NULL,
    IdPessoa INT,
    FOREIGN KEY (IdPessoa) REFERENCES Pessoa(IdPessoa),
    UNIQUE (IdPessoa)
);

-- Tabela: Treinador
CREATE TABLE Treinador (
    IdTreinador INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Especialidade VARCHAR(100),
    AnosExperiencia INT,
    IdPessoa INT,
    FOREIGN KEY (IdPessoa) REFERENCES Pessoa(IdPessoa)
);

-- Tabela: Atleta
CREATE TABLE Atleta (
    IdAtleta INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Posicao VARCHAR(50),
    NumeroCamiseta INT,
    Capitao BOOLEAN,
    IdPessoa INT,
    IdEquipa INT,
    FOREIGN KEY (IdPessoa) REFERENCES Pessoa(IdPessoa),
    FOREIGN KEY (IdEquipa) REFERENCES Equipa(IdEquipa)
);

-- Tabela: Participa
CREATE TABLE Participa (
    IdParticipa INT AUTO_INCREMENT PRIMARY KEY,
    IdEquipa INT,
    IdEvento INT,
    FOREIGN KEY (IdEquipa) REFERENCES Equipa(IdEquipa),
    FOREIGN KEY (IdEvento) REFERENCES Evento(IdEvento)
);

-- Tabela: Patrocinador
CREATE TABLE Patrocinador (
    IdPatrocinador INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL UNIQUE
);

-- Tabela: Patrocina
CREATE TABLE Patrocina (
    IdPatrocina INT AUTO_INCREMENT PRIMARY KEY,
    IdPatrocinador INT,
    IdEquipa INT,
    FOREIGN KEY (IdPatrocinador) REFERENCES Patrocinador(IdPatrocinador),
    FOREIGN KEY (IdEquipa) REFERENCES Equipa(IdEquipa)
);
