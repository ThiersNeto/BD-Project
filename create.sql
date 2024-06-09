-- Criação da Base de Dados
-- CREATE DATABASE voleibd;
USE voleibd;
SHOW TABLES;


-- Criação da tabela Pessoa
CREATE TABLE Pessoa (
    idPessoa INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Telemovel VARCHAR(15),
    Rua VARCHAR(100),
    Bairro VARCHAR(100),
    Cidade VARCHAR(100)
);

-- Criação da tabela Jogador
CREATE TABLE Jogador (
    id_Jogador INT AUTO_INCREMENT PRIMARY KEY,
    Altura DECIMAL(4,2),
    Peso DECIMAL(5,2),
    Posicao VARCHAR(50),
    Capitao BOOLEAN,
    idPessoa INT,
    FOREIGN KEY (idPessoa) REFERENCES Pessoa(idPessoa)
);

-- Criação da tabela Treinador
CREATE TABLE Treinador (
    id_Treinador INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    idPessoa INT,
    FOREIGN KEY (idPessoa) REFERENCES Pessoa(idPessoa)
);

-- Criação da tabela Ficha Técnica
CREATE TABLE FichaTecnica (
    id_Jogador INT,
    Fname VARCHAR(100),
    Lname VARCHAR(100),
    Nacionalidade VARCHAR(50),
    PRIMARY KEY (id_Jogador),
    FOREIGN KEY (id_Jogador) REFERENCES Jogador(id_Jogador)
);

-- Criação da tabela Estádio
CREATE TABLE Estadio (
    id_Estadio INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Capacidade INT,
    Localizacao VARCHAR(100)
);

-- Criação da tabela Partida
CREATE TABLE Partida (
    id_Partida INT AUTO_INCREMENT PRIMARY KEY,
    Total_Points INT,
    Rodada INT,
    Data_da_Partida DATE,
    Duracao_da_Partida TIME,
    id_Estadio INT,
    FOREIGN KEY (id_Estadio) REFERENCES Estadio(id_Estadio)
);

-- Criação da tabela País
CREATE TABLE Pais (
    id_Pais INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL
);

-- Criação da tabela Campeonato
CREATE TABLE Campeonato (
    id_Campeonato INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    Ano YEAR,
    Titulo VARCHAR(100),
    id_Pais INT,
    FOREIGN KEY (id_Pais) REFERENCES Pais(id_Pais)
);

-- Criação da tabela Patrocinador
CREATE TABLE Patrocinador (
    id_Patrocinador INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    id_Pais INT,
    FOREIGN KEY (id_Pais) REFERENCES Pais(id_Pais)
);

-- Criação da tabela Equipe
CREATE TABLE Equipe (
    id_Equipe INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    id_Patrocinador INT,
    id_Campeonato INT,
    id_Pais INT,
    id_Treinador INT,
    FOREIGN KEY (id_Patrocinador) REFERENCES Patrocinador(id_Patrocinador),
    FOREIGN KEY (id_Campeonato) REFERENCES Campeonato(id_Campeonato),
    FOREIGN KEY (id_Pais) REFERENCES Pais(id_Pais),
    FOREIGN KEY (id_Treinador) REFERENCES Treinador(id_Treinador)
);

-- Criação da tabela Entidade Organizadora
CREATE TABLE EntidadeOrganizadora (
    id_Entidade INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100)
);

-- Relacionamento entre Partida e Equipe
CREATE TABLE Partida_Equipe (
    id_Partida INT,
    id_Equipe INT,
    PRIMARY KEY (id_Partida, id_Equipe),
    FOREIGN KEY (id_Partida) REFERENCES Partida(id_Partida),
    FOREIGN KEY (id_Equipe) REFERENCES Equipe(id_Equipe)
);

-- Relacionamento entre Jogador e Equipe
CREATE TABLE Jogador_Equipe (
    id_Jogador INT,
    id_Equipe INT,
    PRIMARY KEY (id_Jogador, id_Equipe),
    FOREIGN KEY (id_Jogador) REFERENCES Jogador(id_Jogador),
    FOREIGN KEY (id_Equipe) REFERENCES Equipe(id_Equipe)
);
