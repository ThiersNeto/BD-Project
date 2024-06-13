USE Volei;

-- Views
DROP VIEW IF EXISTS DetalhesJogador;
DROP VIEW IF EXISTS DetalhesTreinador;
DROP VIEW IF EXISTS TimesJogadores;
DROP VIEW IF EXISTS CampeonatosTimes;
DROP VIEW IF EXISTS PartidasDetalhadas;

-- Procedures
DROP PROCEDURE IF EXISTS AdicionarJogador;
DROP PROCEDURE IF EXISTS AdicionarTreinador;
DROP PROCEDURE IF EXISTS AdicionarTime;
DROP PROCEDURE IF EXISTS AdicionarPartida;
DROP PROCEDURE IF EXISTS AdicionarPatrocinador;
DROP PROCEDURE IF EXISTS InscreverTimeEmCampeonato;
DROP PROCEDURE IF EXISTS RegistrarPartidaTime;
DROP PROCEDURE IF EXISTS AtualizarDadosPessoa;
DROP PROCEDURE IF EXISTS ExcluirJogador;
DROP PROCEDURE IF EXISTS AdicionarPais;
DROP PROCEDURE IF EXISTS AdicionarEstadio;
DROP PROCEDURE IF EXISTS AdicionarInscricaoTimeCampeonato;
DROP PROCEDURE IF EXISTS AdicionarRegistroPartidaTime;
DROP PROCEDURE IF EXISTS AdicionarFichaTecnica;
DROP PROCEDURE IF EXISTS sp_criar_prova;
DROP PROCEDURE IF EXISTS sp_adicionar_participante;
DROP PROCEDURE IF EXISTS sp_registar_resultado;
DROP PROCEDURE IF EXISTS sp_remover_prova;
DROP PROCEDURE IF EXISTS sp_clonar_prova;

-- Functions
DROP FUNCTION IF EXISTS MediaAlturaPorTime;
DROP FUNCTION IF EXISTS MediaPontosPorPartida;
DROP FUNCTION IF EXISTS ListarJogadoresPorNacionalidade;
DROP FUNCTION IF EXISTS ListarTimesPorCampeonato;

-- Triggers
DROP TRIGGER IF EXISTS result_change;
DROP TRIGGER IF EXISTS log_resultado_removido;


-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE VIEW DetalhesJogador AS
SELECT 
    j.idJogador,
    p.nome AS "nomeJogador",
    j.altura,
    j.peso,
    j.posicao,
    j.fname,
    j.lname,
    j.nacionalidade,
    j.numeroDaCamisa
FROM Jogador j, Pessoa p
WHERE j.idPessoa = p.idPessoa;

CREATE VIEW DetalhesTreinador AS
SELECT 
    t.idTreinador,
    p.nome AS "nomeTreinador",
    t.fname,
    t.lname,
    t.nacionalidade
FROM Treinador t, Pessoa p
WHERE t.idPessoa = p.idPessoa;

CREATE VIEW TimesJogadores AS
SELECT 
    t.idTeam,
    t.nome AS "nomeTime",
    j.idJogador,
    p.nome AS "nomeJogador"
FROM 
    Time t, 
    JogadorTime jt, 
    Jogador j, 
    Pessoa p
WHERE t.idTeam = jt.idTeam
    AND jt.idJogador = j.idJogador
    AND j.idPessoa = p.idPessoa;

CREATE VIEW CampeonatosTimes AS
SELECT 
    c.idCampeonato,
    c.titulo AS "nomeCampeonato",
    t.idTeam,
    t.nome AS "nomeTime"
FROM 
    Campeonato c, 
    TimeCampeonato tc, 
    Time t
WHERE c.idCampeonato = tc.idCampeonato
    AND tc.idTeam = t.idTeam;

CREATE VIEW PartidasDetalhadas AS
SELECT 
    p.idPartida,
    p.dataDaPartida,
    p.duracaoDaPartida,
    e.nome AS "nomeEstadio",
    t.idTeam,
    t.nome AS "nomeTime"
FROM 
    Partida p, 
    Estadio e, 
    PartidaTime pt, 
    Time t
WHERE p.idEstadio = e.idEstadio
    AND p.idPartida = pt.idPartida
    AND pt.idTeam = t.idTeam;


-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE AdicionarJogador(
    IN nome VARCHAR(100),
    IN email VARCHAR(100),
    IN telemovel VARCHAR(20),
    IN rua VARCHAR(100),
    IN bairro VARCHAR(50),
    IN cidade VARCHAR(50),
    IN altura DECIMAL(5,2),
    IN peso DECIMAL(5,2),
    IN posicao VARCHAR(50),
    IN fname VARCHAR(100),
    IN lname VARCHAR(100),
    IN nacionalidade VARCHAR(50),
    IN idPais INT,
    IN numeroDaCamisa INT,
    OUT novoJogadorId INT
)
BEGIN
    DECLARE idPessoa INT;
    INSERT INTO Pessoa (nome, email, telemovel, rua, bairro, cidade)
    VALUES (nome, email, telemovel, rua, bairro, cidade);
    SET idPessoa = LAST_INSERT_ID();
    INSERT INTO Jogador (idPessoa, altura, peso, posicao, fname, lname, nacionalidade, idPais, numeroDaCamisa)
    VALUES (idPessoa, altura, peso, posicao, fname, lname, nacionalidade, idPais, numeroDaCamisa);
    SET novoJogadorId = LAST_INSERT_ID();
END //
DELIMITER ;


DELIMITER //
-- Procedure AdicionarTreinador
CREATE PROCEDURE AdicionarTreinador(
    nome VARCHAR(100),
    email VARCHAR(100),
    telemovel VARCHAR(20),
    rua VARCHAR(100),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    fname VARCHAR(100),
    lname VARCHAR(100),
    nacionalidade VARCHAR(50),
    idPais INT,
    OUT novoTreinadorId INT
)
BEGIN
    DECLARE idPessoa INT;
    INSERT INTO Pessoa (nome, email, telemovel, rua, bairro, cidade)
    VALUES (nome, email, telemovel, rua, bairro, cidade);
    SET idPessoa = LAST_INSERT_ID();
    INSERT INTO Treinador (idPessoa, fname, lname, nacionalidade, idPais)
    VALUES (idPessoa, fname, lname, nacionalidade, idPais);
    SET novoTreinadorId = LAST_INSERT_ID();
END //
DELIMITER ;


DELIMITER //
-- Procedure AdicionarTime
CREATE PROCEDURE AdicionarTime(
    nome VARCHAR(100),
    OUT novoTimeId INT
)
BEGIN
    INSERT INTO Time (nome) VALUES (nome);
    SET novoTimeId = LAST_INSERT_ID();
END //
DELIMITER ;


DELIMITER //
-- Procedure AdicionarPartida
CREATE PROCEDURE AdicionarPartida(
    idEstadio INT,
    totalPoints INT,
    rodada INT,
    dataDaPartida DATE,
    duracaoDaPartida TIME,
    OUT novaPartidaId INT
)
BEGIN
    INSERT INTO Partida (idEstadio, totalPoints, rodada, dataDaPartida, duracaoDaPartida)
    VALUES (idEstadio, totalPoints, rodada, dataDaPartida, duracaoDaPartida);
    SET novaPartidaId = LAST_INSERT_ID();
END //
DELIMITER ;



DELIMITER //
-- Procedure AdicionarPatrocinador
CREATE PROCEDURE AdicionarPatrocinador(
    nome VARCHAR(100),
    OUT novoPatrocinadorId INT
)
BEGIN
    INSERT INTO Patrocinador (nome) VALUES (nome);
    SET novoPatrocinadorId = LAST_INSERT_ID();
END //
DELIMITER ;



DELIMITER //
-- Procedure AdicionarInscricaoTimeCampeonato
CREATE PROCEDURE AdicionarInscricaoTimeCampeonato(
    idTeam INT,
    idCampeonato INT
)
BEGIN
    DECLARE count INT;
    SELECT COUNT(*) INTO count FROM TimeCampeonato WHERE idTeam = idTeam AND idCampeonato = idCampeonato;
    IF count = 0 THEN
        INSERT INTO TimeCampeonato (idTeam, idCampeonato) VALUES (idTeam, idCampeonato);
    END IF;
END //
DELIMITER ;



DELIMITER //
-- Procedure AdicionarRegistroPartidaTime
CREATE PROCEDURE AdicionarRegistroPartidaTime(
    idPartida INT,
    idTeam INT
)
BEGIN
    DECLARE count INT;
    SELECT COUNT(*) INTO count FROM PartidaTime WHERE idPartida = idPartida AND idTeam = idTeam;
    IF count = 0 THEN
        INSERT INTO PartidaTime (idPartida, idTeam) VALUES (idPartida, idTeam);
    END IF;
END //
DELIMITER ;


DELIMITER //
-- Procedure AtualizarDadosPessoa
CREATE PROCEDURE AtualizarDadosPessoa(
    IN pessoaId INT,
    IN novoNome VARCHAR(100),
    IN novoEmail VARCHAR(100),
    IN novoTelemovel VARCHAR(20),
    IN novaRua VARCHAR(100),
    IN novoBairro VARCHAR(50),
    IN novaCidade VARCHAR(50)
)
BEGIN
    UPDATE Pessoa
    SET nome = novoNome,
        email = novoEmail,
        telemovel = novoTelemovel,
        rua = novaRua,
        bairro = novoBairro,
        cidade = novaCidade
    WHERE idPessoa = pessoaId;
END //  
DELIMITER ;



DELIMITER //
-- Procedure AdicionarFichaTecnica
CREATE PROCEDURE AdicionarFichaTecnica(
    IN pAltura DECIMAL(5,2),
    IN pPeso DECIMAL(5,2),
    IN pPosicao VARCHAR(50),
    IN pFname VARCHAR(100),
    IN pLname VARCHAR(100),
    IN pNacionalidade VARCHAR(50),
    OUT pIdJogador INT
)
BEGIN
    INSERT INTO FichaTecnica (Altura, Peso, Posicao, Fname, Lname, Nacionalidade) 
    VALUES (pAltura, pPeso, pPosicao, pFname, pLname, pNacionalidade);
    SET pIdJogador = LAST_INSERT_ID();
END //
DELIMITER ;



DELIMITER //
CREATE PROCEDURE AdicionarEstadio(
    IN nomeEstadio VARCHAR(100),
    IN capacidadeEstadio INT,
    IN localizacaoEstadio VARCHAR(100),
    OUT novoEstadioId INT
)
BEGIN
    INSERT INTO Estadio (nome, capacidade, localizacao) VALUES (nomeEstadio, capacidadeEstadio, localizacaoEstadio);
    SET novoEstadioId = LAST_INSERT_ID();
END //
DELIMITER ;


DELIMITER //
-- Procedure ExcluirJogador
CREATE PROCEDURE ExcluirJogador(
    idJogador INT
)
BEGIN
    DELETE FROM Jogador WHERE idJogador = idJogador;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE AdicionarPais(
    IN nome VARCHAR(100),
    OUT novoPaisId INT
)
BEGIN
    INSERT INTO Pais (nome) VALUES (nome);
    SET novoPaisId = LAST_INSERT_ID();
END //
DELIMITER ;



-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE FUNCTION MediaAlturaPorTime(idTeam INT) RETURNS DECIMAL(5,2) 
READS SQL DATA
BEGIN 
    DECLARE mediaAltura DECIMAL(5,2); 
    SELECT AVG(altura) INTO mediaAltura FROM Jogador WHERE idTeam = idTeam; 
    RETURN mediaAltura; 
END //
DELIMITER //

CREATE FUNCTION MediaPontosPorPartida() RETURNS DECIMAL(5,2)
READS SQL DATA
BEGIN
    DECLARE mediaPontos DECIMAL(5,2);
    SELECT AVG(totalPoints) INTO mediaPontos FROM Partida;
    RETURN mediaPontos;
END //
DELIMITER //

CREATE FUNCTION ListarJogadoresPorNacionalidade(nacionalidade VARCHAR(50)) RETURNS VARCHAR(1000)
READS SQL DATA
BEGIN
    DECLARE jogadores VARCHAR(1000);
    SELECT GROUP_CONCAT(p.nome SEPARATOR ', ')
    INTO jogadores
    FROM Jogador j
    JOIN Pessoa p ON j.idPessoa = p.idPessoa
    WHERE j.nacionalidade = nacionalidade;
    RETURN jogadores;
END //
DELIMITER //

CREATE FUNCTION ListarTimesPorCampeonato(idCampeonato INT) RETURNS VARCHAR(1000)
READS SQL DATA
BEGIN
    DECLARE times VARCHAR(1000);
    SELECT GROUP_CONCAT(t.nome SEPARATOR ', ')
    INTO times
    FROM Time t
    JOIN TimeCampeonato tc ON t.idTeam = tc.idTeam
    WHERE tc.idCampeonato = idCampeonato;
    RETURN times;
END //
DELIMITER ;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE TRIGGER result_change
AFTER UPDATE ON Partida
FOR EACH ROW
BEGIN
    INSERT INTO tbl_logs (
        dataHora,
        idPartida,
        idEstadio,
        resultadoAnterior,
        novoResultado,
        classificacao,
        operacao
    ) VALUES (
        CURRENT_TIMESTAMP,
        NEW.idPartida,
        NEW.idEstadio,
        OLD.totalPoints,
        NEW.totalPoints,
        'UPDATE',
        'ALTERACAO'
    );
END //
DELIMITER //

DELIMITER //
CREATE TRIGGER log_resultado_removido
AFTER DELETE ON Partida
FOR EACH ROW
BEGIN
    INSERT INTO tbl_logs (
        dataHora,
        idPartida,
        idEstadio,
        resultadoAnterior,
        novoResultado,
        classificacao,
        operacao
    ) VALUES (
        CURRENT_TIMESTAMP,
        OLD.idPartida,
        OLD.idEstadio,
        OLD.totalPoints,
        NULL,
        'DELETE',
        'REMOCAO'
    );
END //
DELIMITER ;

