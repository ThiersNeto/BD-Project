USE Volei;

-- View 1: Lista detalhes dos Jogadores;
CREATE VIEW DetalhesJogador AS
SELECT 
    j.idJogador,
    p.nome AS "nomeJogador",
    j.altura,
    j.peso,
    j.posicao,
    j.fname,
    j.lname,
    j.nacionalidade
FROM Jogador j, Pessoa p
WHERE j.idPessoa = p.idPessoa;

-- View 2: Lista detalhes dos Treinadores;
CREATE VIEW DetalhesTreinador AS
SELECT 
    t.idTreinador,
    p.nome AS "nomeTreinador",
    t.fname,
    t.lname,
    t.nacionalidade
FROM Treinador t, Pessoa p
WHERE t.idPessoa = p.idPessoa;

-- View 3: Lista times e seus jogadores;
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

-- View 4: Lista campeonatos e seus times participantes;
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

-- View 5: Lista partidas e detalhes dos times participantes;
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
    
    
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Stored Procedure 1: ADD um novo jogador
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
    OUT novoJogadorId INT
)
BEGIN
    DECLARE idPessoa INT;
    INSERT INTO Pessoa (nome, email, telemovel, rua, bairro, cidade)
    VALUES (nome, email, telemovel, rua, bairro, cidade);
    SET idPessoa = LAST_INSERT_ID();
    INSERT INTO Jogador (idPessoa, altura, peso, posicao, fname, lname, nacionalidade, idPais)
    VALUES (idPessoa, altura, peso, posicao, fname, lname, nacionalidade, idPais);
    SET novoJogadorId = LAST_INSERT_ID();
END //
DELIMITER ;



-- Stored Procedure 2: ADD um novo treinador
DELIMITER //
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

-- Stored Procedure 3: ADD um novo time
DELIMITER //
CREATE PROCEDURE AdicionarTime(
    nome VARCHAR(100),
    OUT novoTimeId INT
)
BEGIN
    INSERT INTO Time (nome) VALUES (nome);
    SET novoTimeId = LAST_INSERT_ID();
END //
DELIMITER ;

-- Stored Procedure 4: ADD uma nova partida
DELIMITER //
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

-- Stored Procedure 5: ADD um novo patrocinador
DELIMITER //
CREATE PROCEDURE AdicionarPatrocinador(
    nome VARCHAR(100),
    OUT novoPatrocinadorId INT
)
BEGIN
    INSERT INTO Patrocinador (nome) VALUES (nome);
    SET novoPatrocinadorId = LAST_INSERT_ID();
END //
DELIMITER ;

-- Stored Procedure 6: Inscrever um time em um campeonato
DELIMITER //
CREATE PROCEDURE InscreverTimeEmCampeonato(
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

-- Stored Procedure 7: Registrar um time em uma partida
DELIMITER //
CREATE PROCEDURE RegistrarPartidaTime(
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

-- Stored Procedure 8: Atualizar dados de uma pessoa
DELIMITER //
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

-- Stored Procedure 9: Excluir um jogador
DELIMITER //
CREATE PROCEDURE ExcluirJogador(
    idJogador INT
)
BEGIN
    DELETE FROM Jogador WHERE idJogador = idJogador;
END //
DELIMITER ;

USE Volei;

DELIMITER //

-- Stored Procedure 10: ADD um novo país
CREATE PROCEDURE AdicionarPais(
    nome VARCHAR(100),
    OUT novoPaisId INT
)
BEGIN
    INSERT INTO Pais (nome) VALUES (nome);
    SET novoPaisId = LAST_INSERT_ID();
END //

-- Stored Procedure 11: ADD um novo estádio
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

-- Stored Procedure 12: ADD uma nova inscrição de time em campeonato
DELIMITER //
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

DELIMITER //

DELIMITER //

-- Stored Procedure 13: ADD um novo registro de time em partida
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

-- Stored Procedure 14: ADD uma Ficha Tecnica 
DELIMITER //

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

-- SP1
-- Criar uma nova prova/evento
DELIMITER //
CREATE PROCEDURE sp_criar_prova(
    IN p_idEvento INT,
    IN p_nomeProva VARCHAR(100),
    IN p_data DATE,
    IN p_localizacao VARCHAR(100),
    OUT p_idProva INT
)
BEGIN
    INSERT INTO Prova (idEvento, nomeProva, dataProva, localizacao)
    VALUES (p_idEvento, p_nomeProva, p_data, p_localizacao);
    
    SET p_idProva = LAST_INSERT_ID();
END //
DELIMITER ;

-- SP2
-- Adicionar um atleta à lista de atletas/equipas que irão competir na prova/evento
DELIMITER //
CREATE PROCEDURE sp_adicionar_participante(
    IN p_idProva INT,
    IN p_idParticipante INT,
    IN p_tipoParticipante VARCHAR(50) -- 'Atleta' ou 'Equipe'
)
BEGIN
    IF p_tipoParticipante = 'Atleta' THEN
        INSERT INTO ParticipacaoProvaAtleta (idProva, idAtleta)
        VALUES (p_idProva, p_idParticipante);
    ELSEIF p_tipoParticipante = 'Equipe' THEN
        INSERT INTO ParticipacaoProvaEquipe (idProva, idEquipe)
        VALUES (p_idProva, p_idParticipante);
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tipo de participante inválido';
    END IF;
END //
DELIMITER ;

-- SP3
-- Registar o resultado do participante na prova/evento indicada
DELIMITER //
CREATE PROCEDURE sp_registar_resultado(
    IN p_idProva INT,
    IN p_idParticipante INT,
    IN p_resultado DECIMAL(10,2)
)
BEGIN
    INSERT INTO Resultado (idProva, idParticipante, resultado)
    VALUES (p_idProva, p_idParticipante, p_resultado);
END //
DELIMITER ;

-- SP4
-- Remove a prova/evento identificada no parâmetro
DELIMITER //
CREATE PROCEDURE sp_remover_prova(
    IN p_idProva INT,
    IN p_force BOOLEAN
)
BEGIN
    DECLARE v_contaResultados INT;
    
    -- Verifica se existem resultados associados à prova
    SELECT COUNT(*) INTO v_contaResultados
    FROM Partida
    WHERE idPartida = p_idProva;
    
    IF v_contaResultados = 0 THEN
        DELETE FROM Partida WHERE idPartida = p_idProva;
    ELSEIF p_force = TRUE THEN
        DELETE FROM Partida WHERE idPartida = p_idProva;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Existem resultados associados à prova. Use force = TRUE para forçar a remoção.';
    END IF;
END //
DELIMITER ;

-- SP5
-- Cria uma nova prova/evento com uma cópia de todos os dados existentes na prova/evento indicada como parâmetro
DELIMITER //
CREATE PROCEDURE sp_clonar_prova(
    IN p_idProva INT,
    OUT p_novoIdProva INT
)
BEGIN
    DECLARE v_dataDaPartida DATE;
    DECLARE v_duracaoDaPartida TIME;
    DECLARE v_idEstadio INT;
    DECLARE v_totalPoints INT;
    DECLARE v_rodada INT;

    -- Recupera os dados da partida original
    SELECT dataDaPartida, duracaoDaPartida, idEstadio, totalPoints, rodada
    INTO v_dataDaPartida, v_duracaoDaPartida, v_idEstadio, v_totalPoints, v_rodada
    FROM Partida
    WHERE idPartida = p_idProva;

    -- Cria a nova partida
    INSERT INTO Partida (dataDaPartida, duracaoDaPartida, idEstadio, totalPoints, rodada)
    VALUES (v_dataDaPartida, v_duracaoDaPartida, v_idEstadio, v_totalPoints, v_rodada);

    SET p_novoIdProva = LAST_INSERT_ID();
END //
DELIMITER ;



-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Stored Functions 1: Calcular a média de altura dos Jogadores
DELIMITER //
CREATE FUNCTION MediaAlturaPorTime(idTeam INT) RETURNS DECIMAL(5,2) 
READS SQL DATA
BEGIN 
    DECLARE mediaAltura DECIMAL(5,2); 
    SELECT AVG(altura) INTO mediaAltura FROM Jogador WHERE idTeam = idTeam; 
    RETURN mediaAltura; 
END //
DELIMITER ;


-- Stored Functions 2: Calcular a média de pontos por Partida
DELIMITER //
CREATE FUNCTION MediaPontosPorPartida() RETURNS DECIMAL(5,2)
READS SQL DATA
BEGIN
    DECLARE mediaPontos DECIMAL(5,2);
    SELECT AVG(totalPoints) INTO mediaPontos FROM Partida;
    RETURN mediaPontos;
END //
DELIMITER ;

-- Stored Functions 3: Listar jogadores por nacionalidade
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
DELIMITER ;

-- Stored Functions 4: Listar times por campeonato
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
SELECT ListarTimesPorCampeonato(1);


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Registra as alterações nos resultados na tabela tbl_logs.

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
DELIMITER ;



-- Registra as remoções dos resultados na tabela tbl_logs.

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

