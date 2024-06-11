-- Criação do banco de dados
CREATE DATABASE Volei;
USE Volei;

CREATE TABLE FichaTecnica (
    id_Jogador INT AUTO_INCREMENT PRIMARY KEY,
    Altura DECIMAL(5,2),
    Peso DECIMAL(5,2),
    Posicao VARCHAR(50),
    Fname VARCHAR(100),
    Lname VARCHAR(100),
    Nacionalidade VARCHAR(50)
);

-- Tabela EntidadeOrganizadora
CREATE TABLE EntidadeOrganizadora (
    idOrganizadora INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela Pessoa
CREATE TABLE Pessoa (
    idPessoa INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telemovel VARCHAR(20),
    rua VARCHAR(100),
    bairro VARCHAR(50),
    cidade VARCHAR(50)
);

-- Tabela Pais
CREATE TABLE Pais (
    idPais INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela Campeonato
CREATE TABLE Campeonato (
    idCampeonato INT AUTO_INCREMENT PRIMARY KEY,
    idEntidadeOrganizadora INT,
    ano YEAR,
    titulo VARCHAR(100),
    nome VARCHAR(100),
    idPais INT,
    FOREIGN KEY (idEntidadeOrganizadora) REFERENCES EntidadeOrganizadora(idOrganizadora) ON DELETE CASCADE,
    FOREIGN KEY (idPais) REFERENCES Pais(idPais) ON DELETE SET NULL
);

-- Tabela Jogador
CREATE TABLE Jogador (
    idJogador INT AUTO_INCREMENT PRIMARY KEY,
    idPessoa INT,
    altura DECIMAL(5,2),
    peso DECIMAL(5,2),
    posicao VARCHAR(50),
    fname VARCHAR(100),
    lname VARCHAR(100),
    nacionalidade VARCHAR(50),
    idPais INT,
    FOREIGN KEY (idPessoa) REFERENCES Pessoa(idPessoa) ON DELETE CASCADE,
    FOREIGN KEY (idPais) REFERENCES Pais(idPais) ON DELETE SET NULL
);

-- Tabela Treinador
CREATE TABLE Treinador (
    idTreinador INT AUTO_INCREMENT PRIMARY KEY,
    idPessoa INT,
    fname VARCHAR(100),
    lname VARCHAR(100),
    nacionalidade VARCHAR(50),
    idPais INT,
    FOREIGN KEY (idPessoa) REFERENCES Pessoa(idPessoa) ON DELETE CASCADE,
    FOREIGN KEY (idPais) REFERENCES Pais(idPais) ON DELETE SET NULL
);

-- Tabela Time
CREATE TABLE Time (
    idTeam INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela Estadio
CREATE TABLE Estadio (
    idEstadio INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    capacidade INT,
    localizacao VARCHAR(100)
);

-- Tabela Partida
CREATE TABLE Partida (
    idPartida INT AUTO_INCREMENT PRIMARY KEY,
    idEstadio INT,
    totalPoints INT,
    rodada INT,
    dataDaPartida DATE,
    duracaoDaPartida TIME,
    FOREIGN KEY (idEstadio) REFERENCES Estadio(idEstadio) ON DELETE SET NULL
);

-- Tabela Patrocinador
CREATE TABLE Patrocinador (
    idPatrocinador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela de Relacionamento JogadorTime
CREATE TABLE JogadorTime (
    idJogador INT,
    idTeam INT,
    PRIMARY KEY (idJogador, idTeam),
    FOREIGN KEY (idJogador) REFERENCES Jogador(idJogador) ON DELETE CASCADE,
    FOREIGN KEY (idTeam) REFERENCES Time(idTeam) ON DELETE CASCADE
);

-- Tabela de Relacionamento TreinadorTime
CREATE TABLE TreinadorTime (
    idTreinador INT,
    idTeam INT,
    PRIMARY KEY (idTreinador, idTeam),
    FOREIGN KEY (idTreinador) REFERENCES Treinador(idTreinador) ON DELETE CASCADE,
    FOREIGN KEY (idTeam) REFERENCES Time(idTeam) ON DELETE CASCADE
);

-- Tabela de Relacionamento TimeCampeonato
CREATE TABLE TimeCampeonato (
    idTeam INT,
    idCampeonato INT,
    PRIMARY KEY (idTeam, idCampeonato),
    FOREIGN KEY (idTeam) REFERENCES Time(idTeam) ON DELETE CASCADE,
    FOREIGN KEY (idCampeonato) REFERENCES Campeonato(idCampeonato) ON DELETE CASCADE
);

-- Tabela de Relacionamento TimePatrocinador
CREATE TABLE TimePatrocinador (
    idTeam INT,
    idPatrocinador INT,
    PRIMARY KEY (idTeam, idPatrocinador),
    FOREIGN KEY (idTeam) REFERENCES Time(idTeam) ON DELETE CASCADE,
    FOREIGN KEY (idPatrocinador) REFERENCES Patrocinador(idPatrocinador) ON DELETE CASCADE
);

-- Tabela de Relacionamento PartidaTime
CREATE TABLE PartidaTime (
    idPartida INT,
    idTeam INT,
    PRIMARY KEY (idPartida, idTeam),
    FOREIGN KEY (idPartida) REFERENCES Partida(idPartida) ON DELETE CASCADE,
    FOREIGN KEY (idTeam) REFERENCES Time(idTeam) ON DELETE CASCADE
);

-- Criação da tabela de logs
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
