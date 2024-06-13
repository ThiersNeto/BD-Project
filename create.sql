-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS Volei;
USE Volei;

DROP TABLE IF EXISTS PartidaTime;
DROP TABLE IF EXISTS TimePatrocinador;
DROP TABLE IF EXISTS TimeCampeonato;
DROP TABLE IF EXISTS TreinadorTime;
DROP TABLE IF EXISTS JogadorTime;
DROP TABLE IF EXISTS tbl_logs;
DROP TABLE IF EXISTS Patrocinador;
DROP TABLE IF EXISTS Partida;
DROP TABLE IF EXISTS Estadio;
DROP TABLE IF EXISTS Time;
DROP TABLE IF EXISTS Treinador;
DROP TABLE IF EXISTS Jogador;
DROP TABLE IF EXISTS Campeonato;
DROP TABLE IF EXISTS Pais;
DROP TABLE IF EXISTS Pessoa;
DROP TABLE IF EXISTS EntidadeOrganizadora;
DROP TABLE IF EXISTS FichaTecnica;

CREATE TABLE FichaTecnica (
    id_Jogador INT AUTO_INCREMENT PRIMARY KEY,
    Altura DECIMAL(5,2),
    Peso DECIMAL(5,2),
    Posicao VARCHAR(50),
    Fname VARCHAR(100),
    Lname VARCHAR(100),
    Nacionalidade VARCHAR(50)
);

CREATE TABLE EntidadeOrganizadora (
    idOrganizadora INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Pessoa (
    idPessoa INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telemovel VARCHAR(20),
    rua VARCHAR(100),
    bairro VARCHAR(50),
    cidade VARCHAR(50)
);

CREATE TABLE Pais (
    idPais INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Campeonato (
    idCampeonato INT AUTO_INCREMENT PRIMARY KEY,
    idEntidadeOrganizadora INT,
    ano YEAR,
    titulo VARCHAR(100),
    nome VARCHAR(100),
    idPais INT,
    FOREIGN KEY (idEntidadeOrganizadora) REFERENCES EntidadeOrganizadora(idOrganizadora),
    FOREIGN KEY (idPais) REFERENCES Pais(idPais) 
);

CREATE TABLE Jogador (
    idJogador INT AUTO_INCREMENT PRIMARY KEY,
    idPessoa INT NOT NULL,
    altura DECIMAL(5,2),
    peso DECIMAL(5,2),
    posicao VARCHAR(50),
    fname VARCHAR(100),
    lname VARCHAR(100),
    nacionalidade VARCHAR(50),
    idPais INT,
    numeroDaCamisa INT,
    FOREIGN KEY (idPessoa) REFERENCES Pessoa(idPessoa),
    FOREIGN KEY (idPais) REFERENCES Pais(idPais)
);

CREATE TABLE Treinador (
    idTreinador INT AUTO_INCREMENT PRIMARY KEY,
    idPessoa INT,
    fname VARCHAR(100),
    lname VARCHAR(100),
    nacionalidade VARCHAR(50),
    idPais INT,
    FOREIGN KEY (idPessoa) REFERENCES Pessoa(idPessoa),
    FOREIGN KEY (idPais) REFERENCES Pais(idPais) 
);

CREATE TABLE Time (
    idTeam INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Estadio (
    idEstadio INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    capacidade INT,
    localizacao VARCHAR(100)
);

CREATE TABLE Partida (
    idPartida INT AUTO_INCREMENT PRIMARY KEY,
    idEstadio INT,
    totalPoints INT,
    rodada INT,
    dataDaPartida DATE,
    duracaoDaPartida TIME,
    FOREIGN KEY (idEstadio) REFERENCES Estadio(idEstadio)
);

CREATE TABLE Patrocinador (
    idPatrocinador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE JogadorTime (
    idJogador INT,
    idTeam INT,
    PRIMARY KEY (idJogador, idTeam),
    FOREIGN KEY (idJogador) REFERENCES Jogador(idJogador),
    FOREIGN KEY (idTeam) REFERENCES Time(idTeam) 
);

CREATE TABLE TreinadorTime (
    idTreinador INT,
    idTeam INT,
    PRIMARY KEY (idTreinador, idTeam),
    FOREIGN KEY (idTreinador) REFERENCES Treinador(idTreinador),
    FOREIGN KEY (idTeam) REFERENCES Time(idTeam) 
);

CREATE TABLE TimeCampeonato (
    idTeam INT,
    idCampeonato INT,
    PRIMARY KEY (idTeam, idCampeonato),
    FOREIGN KEY (idTeam) REFERENCES Time(idTeam) ,
    FOREIGN KEY (idCampeonato) REFERENCES Campeonato(idCampeonato) 
);

CREATE TABLE TimePatrocinador (
    idTeam INT,
    idPatrocinador INT,
    PRIMARY KEY (idTeam, idPatrocinador),
    FOREIGN KEY (idTeam) REFERENCES Time(idTeam) ,
    FOREIGN KEY (idPatrocinador) REFERENCES Patrocinador(idPatrocinador) 
);

CREATE TABLE PartidaTime (
    idPartida INT,
    idTeam INT,
    PRIMARY KEY (idPartida, idTeam),
    FOREIGN KEY (idPartida) REFERENCES Partida(idPartida),
    FOREIGN KEY (idTeam) REFERENCES Time(idTeam) 
);

CREATE TABLE tbl_logs (
    idLog INT AUTO_INCREMENT PRIMARY KEY,
    dataHora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    idParticipante INT,
    idProva INT,
    resultadoAnterior DECIMAL(10,2),
    novoResultado DECIMAL(10,2),
    classificacao VARCHAR(50),
    operacao VARCHAR(50)
);

