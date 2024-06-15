-- Criação do banco de dados
DROP DATABASE IF EXISTS Volei;
CREATE DATABASE Volei;
USE Volei;

-- Tabela País
CREATE TABLE Pais (
    idPais INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela Estádio
CREATE TABLE Estadio (
    idEstadio INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    capacidade INT NOT NULL,
    localizacao VARCHAR(100) NOT NULL,
    ticket INT NOT NULL
);

-- Tabela Equipa
CREATE TABLE Equipa (
    idEquipa INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela Evento
CREATE TABLE Evento (
    idEvento INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL
);

-- Tabela Jogador
-- Criação da tabela Jogador
CREATE TABLE Jogador (
    idJogador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telemovel VARCHAR(20),
    rua VARCHAR(100),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    altura DECIMAL(5,2),
    peso DECIMAL(5,2),
    posicao VARCHAR(50),
    fname VARCHAR(100),
    lname VARCHAR(100),
    nacionalidade VARCHAR(50),
    idPais INT,
    numeroDaCamisa INT,
    idCapitao INT,
    FOREIGN KEY (idPais) REFERENCES Pais(idPais),
    FOREIGN KEY (idCapitao) REFERENCES Jogador(idJogador)
);

-- Tabela Treinador
CREATE TABLE Treinador (
    idTreinador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telemovel VARCHAR(20),
    rua VARCHAR(100),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    fname VARCHAR(100),
    lname VARCHAR(100),
    nacionalidade VARCHAR(50),
    idPais INT,
    FOREIGN KEY (idPais) REFERENCES Pais(idPais)
);

-- Tabela Partida
CREATE TABLE Partida (
    idPartida INT AUTO_INCREMENT PRIMARY KEY,
    idEstadio INT,
    totalPoints INT,
    jornadas INT,
    dataDaPartida DATE,
    duracaoDaPartida TIME,
    FOREIGN KEY (idEstadio) REFERENCES Estadio(idEstadio)
);

-- Tabela EquipaEvento
CREATE TABLE EquipaEvento (
    idEquipa INT,
    idEvento INT,
    PRIMARY KEY (idEquipa, idEvento),
    FOREIGN KEY (idEquipa) REFERENCES Equipa(idEquipa),
    FOREIGN KEY (idEvento) REFERENCES Evento(idEvento)
);

-- Tabela PartidaEquipa
CREATE TABLE PartidaEquipa (
    idPartida INT,
    idEquipa INT,
    PRIMARY KEY (idPartida, idEquipa),
    FOREIGN KEY (idPartida) REFERENCES Partida(idPartida),
    FOREIGN KEY (idEquipa) REFERENCES Equipa(idEquipa)
);

-- Tabela Patrocinador
CREATE TABLE Patrocinador (
    idPatrocinador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela Ficha Tecnica
CREATE TABLE FichaTecnica (
    idJogador INT AUTO_INCREMENT PRIMARY KEY,
    Altura DECIMAL(5,2),
    Peso DECIMAL(5,2),
    Posicao VARCHAR(50),
    Fname VARCHAR(100),
    Lname VARCHAR(100),
    Nacionalidade VARCHAR(50)
);

-- Tabela TreinadorEquipa
CREATE TABLE TreinadorEquipa (
    idTreinador INT,
    idEquipa INT,
    PRIMARY KEY (idTreinador, idEquipa),
    FOREIGN KEY (idTreinador) REFERENCES Treinador(idTreinador),
    FOREIGN KEY (idEquipa) REFERENCES Equipa(idEquipa)
);

-- Tabela tbl_logs: armazena logs de alterações e remoções de partidas.
CREATE TABLE tbl_logs (
    idLog INT AUTO_INCREMENT PRIMARY KEY,
    dataHora TIMESTAMP,
    idPartida INT,
    idEstadio INT,
    resultadoAnterior INT,
    novoResultado INT,
    classificacao VARCHAR(50),
    operacao VARCHAR(50)
);

-- Tabela JogadorEquipa
CREATE TABLE JogadorEquipa (
    idJogador INT,
    idEquipa INT,
    PRIMARY KEY (idJogador, idEquipa),
    FOREIGN KEY (idJogador) REFERENCES Jogador(idJogador),
    FOREIGN KEY (idEquipa) REFERENCES Equipa(idEquipa)
);
