USE volei;

-- View 1: Lista detalhes dos Jogadores;
CREATE VIEW DetalhesJogador AS
SELECT 
    j.idJogador,
    j.nome AS "Nome do Jogador",
    j.altura,
    j.peso,
    j.posicao,
    j.fname,
    j.lname,
    j.nacionalidade
FROM Jogador j;

-- View 2: Lista detalhes dos Treinadores;
CREATE VIEW DetalhesTreinador AS
SELECT 
    t.idTreinador,
    t.nome AS "Nome do Treinador",
    t.fname,
    t.lname,
    t.nacionalidade
FROM Treinador t;

-- View 3: Lista equipes e seus jogadores;
CREATE VIEW EquipesJogadores AS
SELECT 
    e.idEquipa,
    e.nome AS "Nome da Equipa",
    j.idJogador,
    j.nome AS "Nome do Jogador"
FROM 
    Equipa e, 
    Jogador j;

-- View 4: Lista eventos e suas equipes participantes;
CREATE VIEW EventosEquipes AS
SELECT 
    ev.idEvento,
    ev.titulo AS "Nome do Evento",
    e.idEquipa,
    e.nome AS "Nome da Equipa"
FROM 
    Evento ev, 
    EquipaEvento ee, 
    Equipa e
WHERE ev.idEvento = ee.idEvento
    AND ee.idEquipa = e.idEquipa;

-- View 5: Lista partidas e detalhes das equipes participantes;
CREATE VIEW PartidasDetalhadas AS
SELECT 
    p.idPartida,
    p.dataDaPartida,
    p.duracaoDaPartida,
    e.nome AS "Nome do Estadio",
    eq.idEquipa,
    eq.nome AS "Nome da Equipa"
FROM 
    Partida p, 
    Estadio e, 
    PartidaEquipa pe, 
    Equipa eq
WHERE p.idEstadio = e.idEstadio
    AND p.idPartida = pe.idPartida
    AND pe.idEquipa = eq.idEquipa;


-- Procedimento para adicionar um país.
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

-- Procedimento para adicionar um evento.
DELIMITER //
CREATE PROCEDURE AdicionarEvento(
    IN titulo VARCHAR(100),
    OUT novoEventoId INT
)
BEGIN
    INSERT INTO Evento (titulo) VALUES (titulo);
    SET novoEventoId = LAST_INSERT_ID();
END //
DELIMITER ;

-- Procedimento para adicionar um jogador.
DELIMITER //
CREATE PROCEDURE AdicionarJogador(
    IN nome VARCHAR(100),
    IN email VARCHAR(100),
    IN telemovel VARCHAR(20),
    IN altura DECIMAL(5,2),
    IN peso DECIMAL(5,2),
    IN posicao VARCHAR(50),
    IN nacionalidade VARCHAR(50),
    IN idPais INT,
    IN numeroDaCamisa INT,
    OUT novoJogadorId INT
)
BEGIN
    INSERT INTO Jogador (nome, email, telemovel, altura, peso, posicao, nacionalidade, idPais, numeroDaCamisa)
    VALUES (nome, email, telemovel, altura, peso, posicao, nacionalidade, idPais, numeroDaCamisa);
    SET novoJogadorId = LAST_INSERT_ID();
END //
DELIMITER ;
	


-- Procedimento para adicionar um treinador.
DELIMITER //
CREATE PROCEDURE AdicionarTreinador(
    IN nome VARCHAR(100),
    IN email VARCHAR(100),
    IN telemovel VARCHAR(20),
    IN rua VARCHAR(100),
    IN bairro VARCHAR(50),
    IN cidade VARCHAR(50),
    IN fname VARCHAR(100),
    IN lname VARCHAR(100),
    IN nacionalidade VARCHAR(50),
    IN idPais INT,
    OUT novoTreinadorId INT
)
BEGIN
    INSERT INTO Treinador (nome, email, telemovel, rua, bairro, cidade, fname, lname, nacionalidade, idPais)
    VALUES (nome, email, telemovel, rua, bairro, cidade, fname, lname, nacionalidade, idPais);
    SET novoTreinadorId = LAST_INSERT_ID();
END //
DELIMITER ;

--  Adiciona um Capitao;
DELIMITER //
CREATE PROCEDURE AdicionarCapitao(
    IN jogador_id INT,
    IN capitao_id INT
)
BEGIN
    UPDATE Jogador
    SET idCapitao = capitao_id
    WHERE idJogador = jogador_id;
END //
DELIMITER ;

-- Procedimento para adicionar um patrocinador.
DELIMITER //
CREATE PROCEDURE AdicionarPatrocinador(
    IN nome VARCHAR(100),
    OUT novoPatrocinadorId INT
)
BEGIN
    INSERT INTO Patrocinador (nome) VALUES (nome);
    SET novoPatrocinadorId = LAST_INSERT_ID();
END //
DELIMITER ;

-- Procedimento para inscrever uma equipa em um evento.
DELIMITER //
CREATE PROCEDURE AdicionarPartida(
    IN idEstadio INT,
    IN totalPoints INT,
    IN jornadas INT,
    IN dataDaPartida DATE,
    IN duracaoDaPartida TIME,
    OUT novaPartidaId INT
)
BEGIN
    INSERT INTO Partida (idEstadio, totalPoints, jornadas, dataDaPartida, duracaoDaPartida)
    VALUES (idEstadio, totalPoints, jornadas, dataDaPartida, duracaoDaPartida);
    SET novaPartidaId = LAST_INSERT_ID();
END //
DELIMITER ;


-- Procedimento para registrar uma equipa em uma partida.
DELIMITER //
CREATE PROCEDURE AdicionarRegistroPartidaEquipa(
    IN idPartida INT,
    IN idEquipa INT
)
BEGIN
    DECLARE count INT;
    SELECT COUNT(*) INTO count FROM PartidaEquipa WHERE idPartida = idPartida AND idEquipa = idEquipa;
    IF count = 0 THEN
        INSERT INTO PartidaEquipa (idPartida, idEquipa) VALUES (idPartida, idEquipa);
    END IF;
END //
DELIMITER ;

-- Procedimento para adicionar um treinador a uma equipa.
DELIMITER //
CREATE PROCEDURE AdicionarTreinadorEquipa(
    IN idTreinador INT,
    IN idEquipa INT
)
BEGIN
    DECLARE count INT;
    SELECT COUNT(*) INTO count FROM TreinadorEquipa WHERE idTreinador = idTreinador AND idEquipa = idEquipa;
    IF count = 0 THEN
        INSERT INTO TreinadorEquipa (idTreinador, idEquipa) VALUES (idTreinador, idEquipa);
    END IF;
END //
DELIMITER ;

-- Procedimento para adicionar um estádio.
DELIMITER //
CREATE PROCEDURE AdicionarEstadio(
    IN nome VARCHAR(100),
    IN capacidade INT,
    IN localizacao VARCHAR(100),
    IN ticket INT,
    OUT novoEstadioId INT
)
BEGIN
    INSERT INTO Estadio (nome, capacidade, localizacao, ticket) VALUES (nome, capacidade, localizacao, ticket);
    SET novoEstadioId = LAST_INSERT_ID();
END //
DELIMITER ;

-- Procedimento para atualizar dados de uma pessoa.
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
    UPDATE Jogador
    SET nome = novoNome,
        email = novoEmail,
        telemovel = novoTelemovel,
        rua = novaRua,
        bairro = novoBairro,
        cidade = novaCidade
    WHERE idJogador = pessoaId;
END //
DELIMITER ;

-- Procedimento para adicionar uma ficha técnica.
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

-- Procedimento para ADD uma icricao de uma equipe em um evento

DELIMITER //
CREATE PROCEDURE AdicionarInscricaoEquipaEvento(
    IN idEquipa INT,
    IN idEvento INT
)
BEGIN
    DECLARE count INT;
    SELECT COUNT(*) INTO count FROM EquipaEvento WHERE idEquipa = idEquipa AND idEvento = idEvento;
    IF count = 0 THEN
        INSERT INTO EquipaEvento (idEquipa, idEvento) VALUES (idEquipa, idEvento);
    END IF;
END //
DELIMITER ;

-- Procedimento para adicionar uma equipa.
DELIMITER //
CREATE PROCEDURE AdicionarEquipa(
    IN nome VARCHAR(100),
    OUT novoEquipaId INT
)
BEGIN
    INSERT INTO Equipa (nome) VALUES (nome);
    SET novoEquipaId = LAST_INSERT_ID();
END //
DELIMITER ;

-- Cria 50 times e ADD 6 Jogadores a cada time, gerando nomes e detalhes dinamicamente e chamando os procedimentos "AdicionarJogador" e "AdicionarJogadorEquipa";

DELIMITER //
CREATE PROCEDURE PopularJogadorEquipa()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE j INT DEFAULT 1;
    DECLARE maxJogadores INT DEFAULT 50; -- Número total de jogadores
    DECLARE maxEquipas INT DEFAULT 10; -- Número total de equipes

    WHILE i <= maxJogadores DO
        SET j = 1;
        WHILE j <= maxEquipas DO
            IF i <= maxJogadores THEN
                INSERT INTO JogadorEquipa (idJogador, idEquipa) VALUES (i, j);
                SET i = i + 1;
            END IF;
            SET j = j + 1;
        END WHILE;
    END WHILE;
END //
DELIMITER ;


-- Procedimento para adicionar uma partida a uma equipa
DELIMITER //
CREATE PROCEDURE AdicionarPartidaAEquipa(
    IN equipa_id INT,
    IN idEstadio INT,
    IN totalPoints INT,
    IN jornadas INT,
    IN dataDaPartida DATE,
    IN duracaoDaPartida TIME,
    OUT novaPartidaId INT
)
BEGIN
    CALL AdicionarPartida(idEstadio, totalPoints, jornadas, dataDaPartida, duracaoDaPartida, @novaPartidaId);
    CALL AdicionarRegistroPartidaEquipa(@novaPartidaId, equipa_id);
    SET novaPartidaId = @novaPartidaId;
END //
DELIMITER ;

DELIMITER //

CREATE PROCEDURE AdicionarEquipeComJogadores(
    IN nomeEquipa VARCHAR(100),
    IN numeroJogadores INT
)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE novoEquipaId INT;
    DECLARE novoJogadorId INT;
    DECLARE jogadorNome VARCHAR(100);
    DECLARE jogadorEmail VARCHAR(100);
    DECLARE jogadorTelemovel VARCHAR(20);
    DECLARE jogadorAltura DECIMAL(5,2);
    DECLARE jogadorPeso DECIMAL(5,2);
    DECLARE jogadorPosicao VARCHAR(50);
    DECLARE jogadorNacionalidade VARCHAR(50);
    DECLARE jogadorNumeroDaCamisa INT;
    DECLARE jogadorIdPais INT DEFAULT 1;

    -- Adicionar Equipa
    CALL AdicionarEquipa(nomeEquipa, @novoEquipaId);
    SET novoEquipaId = @novoEquipaId;

    -- Adicionar Jogadores e associá-los à equipe
    WHILE i <= numeroJogadores DO
        SET jogadorNome = CONCAT(nomeEquipa, ' Jogador', i);
        SET jogadorEmail = CONCAT('jogador', novoEquipaId, '_', i, '@example.com');
        SET jogadorTelemovel = '123456789';
        SET jogadorAltura = 1.80 + (i * 0.01);
        SET jogadorPeso = 70 + (i * 1);
        SET jogadorPosicao = 'Ponta';
        SET jogadorNacionalidade = 'Brasileira';
        SET jogadorNumeroDaCamisa = i;
        
        CALL AdicionarJogador(
            jogadorNome, 
            jogadorEmail, 
            jogadorTelemovel, 
            jogadorAltura, 
            jogadorPeso, 
            jogadorPosicao, 
            jogadorNacionalidade, 
            jogadorIdPais, 
            jogadorNumeroDaCamisa, 
            @novoJogadorId
        );
        
        CALL AdicionarJogadorEquipa(@novoJogadorId, novoEquipaId);
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

-- Adiciona jogadore em uma Equipe;

DELIMITER //
CREATE PROCEDURE AdicionarJogadorEquipa(
    IN idJogador INT,
    IN idEquipa INT
)
BEGIN
    DECLARE count INT;
    SELECT COUNT(*) INTO count FROM JogadorEquipa WHERE idJogador = idJogador AND idEquipa = idEquipa;
    IF count = 0 THEN
        INSERT INTO JogadorEquipa (idJogador, idEquipa) VALUES (idJogador, idEquipa);
    END IF;
END //
DELIMITER ;

-- Procedimento para adicionar um evento a uma equipa
DELIMITER //
CREATE PROCEDURE AdicionarEventoAEquipa(
    IN equipa_id INT,
    IN evento_titulo VARCHAR(100),
    OUT novoEventoId INT
)
BEGIN
    CALL AdicionarEvento(evento_titulo, @novoEventoId);
    CALL AdicionarInscricaoEquipaEvento(equipa_id, @novoEventoId);
    SET novoEventoId = @novoEventoId;
END //
DELIMITER ;


-- Procedimento para adicionar um estádio
DELIMITER //
CREATE PROCEDURE AdicionarEstadioAEquipa(
    IN equipa_id INT,
    IN estadio_nome VARCHAR(100),
    IN estadio_capacidade INT,
    IN estadio_localizacao VARCHAR(100),
    IN estadio_ticket INT,
    OUT novoEstadioId INT
)
BEGIN
    CALL AdicionarEstadio(estadio_nome, estadio_capacidade, estadio_localizacao, estadio_ticket, @novoEstadioId);
    SET novoEstadioId = @novoEstadioId;
END //
DELIMITER ;


-- Adicionar um treinador a uma equipa
DELIMITER //
CREATE PROCEDURE AdicionarTreinadorAEquipa(
    IN equipa_id INT,
    IN treinador_nome VARCHAR(100),
    IN treinador_email VARCHAR(100),
    IN treinador_telemovel VARCHAR(20),
    IN treinador_rua VARCHAR(100),
    IN treinador_bairro VARCHAR(50),
    IN treinador_cidade VARCHAR(50),
    IN treinador_nacionalidade VARCHAR(50),
    IN idPais INT,
    OUT novoTreinadorId INT
)
BEGIN
    CALL AdicionarTreinador(treinador_nome, treinador_email, treinador_telemovel, treinador_rua, treinador_bairro, treinador_cidade, treinador_nome, treinador_nome, treinador_nacionalidade, idPais, @novoTreinadorId);
    CALL AdicionarTreinadorEquipa(@novoTreinadorId, equipa_id);
    SET novoTreinadorId = @novoTreinadorId;
END //
DELIMITER ;


===================================================================================================================================================================================================================================================

--  Função para Calcular a Idade de um Jogador

DELIMITER //
CREATE FUNCTION CalcularIdade(dataNascimento DATE) 
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE idade INT;
    SET idade = TIMESTAMPDIFF(YEAR, dataNascimento, CURDATE());
    RETURN idade;
END //
DELIMITER ;

-- Função Obter a Média de Pontos de uma Equipa em Todas as Partidas

DELIMITER //
CREATE FUNCTION MediaPontosEquipa(idEquipa INT) 
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
    DECLARE mediaPontos DECIMAL(10,2);
    SELECT AVG(p.totalPoints) INTO mediaPontos
    FROM Partida p
    JOIN PartidaEquipa pe ON p.idPartida = pe.idPartida
    WHERE pe.idEquipa = idEquipa;
    RETURN mediaPontos;
END //
DELIMITER ;


===================================================================================================================================================================================================================================================


-- Trigger: Registra as alterações nos resultados na tabela tbl_logs.
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

-- Trigger: Registra as remoções dos resultados na tabela tbl_logs.
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
