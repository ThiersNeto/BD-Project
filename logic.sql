-- Views

-- View 1: Exibe o nome e a nacionalidade dos atletas.
CREATE VIEW AtletasNacionalidade AS
SELECT nome_atleta AS 'Nome do Atleta', Nacionalidade AS 'Nacionalidade'
FROM Atleta;

-- View 2: Exibe o nome das equipas e seu desempenho global.
CREATE VIEW EquipasDesempenho AS
SELECT nome_equipa AS 'Nome da Equipa', desempenho_global AS 'Desempenho Global'
FROM Equipa;

-- View 3: Lista os eventos e suas provas associadas.
CREATE VIEW ProvasEventos AS
SELECT E.nome_evento AS 'Nome do Evento', P.nome_prova AS 'Nome da Prova'
FROM Evento E
JOIN Prova_Evento PE ON E.IdEvento = PE.IdEvento
JOIN Prova P ON PE.IdProva = P.IdProva;

-- View 4: Exibe os resultados (classificação e ranking) das provas.
CREATE VIEW ResultadosProvas AS
SELECT P.nome_prova AS 'Nome da Prova', R.classificacao AS 'Classificação', R.ranking AS 'Ranking'
FROM Prova P
JOIN ProvaResultado PR ON P.IdProva = PR.IdProva
JOIN Resultado R ON PR.IdResultado = R.IdResultado;

-- View 5: Lista os atletas e suas respectivas equipas.
CREATE VIEW AtletasEquipas AS
SELECT A.nome_atleta AS 'Nome do Atleta', E.nome_equipa AS 'Nome da Equipa'
FROM Atleta A
JOIN AtletaEquipa AE ON A.IdAtleta = AE.IdAtleta
JOIN Equipa E ON AE.IdEquipa = E.IdEquipa;


-- Funções

-- Função 1: Retorna o total de atletas em uma determinada equipa.
DELIMITER //
CREATE FUNCTION TotalAtletasEquipa (p_IdEquipa INT) RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM AtletaEquipa
    WHERE IdEquipa = p_IdEquipa;
    RETURN total;
END//
DELIMITER ;


-- Procedures

-- Procedure 1: Adiciona um novo atleta à tabela Atleta.
DELIMITER //
CREATE PROCEDURE AddAtleta(
    IN nome VARCHAR(100), 
    IN dataNasc DATE, 
    IN nacionalidade VARCHAR(50),
    IN cidade VARCHAR(100),
    IN bairro VARCHAR(100),
    IN posicao VARCHAR(50)
)
BEGIN
    INSERT INTO Atleta (nome_atleta, data_nasc, Nacionalidade, Cidade, Bairro, Posicao) 
    VALUES (nome, dataNasc, nacionalidade, cidade, bairro, posicao);
END //
DELIMITER ;

-- Procedure 2: Adiciona uma nova equipa à tabela Equipa.
DELIMITER //
CREATE PROCEDURE AddEquipa(IN nome VARCHAR(100), IN desempenho INT)
BEGIN
    INSERT INTO Equipa (nome_equipa, desempenho_global) VALUES (nome, desempenho);
END//
DELIMITER ;

-- Procedure 3: Adiciona um novo evento à tabela Evento.
DELIMITER //
CREATE PROCEDURE AddEvento(IN nome VARCHAR(100), IN local VARCHAR(100), IN dataInicio DATE, IN dataFim DATE)
BEGIN
    INSERT INTO Evento (nome_evento, Local, data_inicio, data_fim) VALUES (nome, local, dataInicio, dataFim);
END//
DELIMITER ;

-- Procedure 4: Adiciona uma nova prova à tabela Prova.
DELIMITER //
CREATE PROCEDURE AddProva(IN nome VARCHAR(100), IN local VARCHAR(100), IN data DATE, IN hora TIME, IN duracao TIME, IN rodadas INT)
BEGIN
    INSERT INTO Prova (nome_prova, Local_prova, data, hora, duracao, rodadas) VALUES (nome, local, data, hora, duracao, rodadas);
END//
DELIMITER ;

-- Procedure 5: Adiciona um novo resultado à tabela Resultado.
DELIMITER //
CREATE PROCEDURE AddResultado(IN classificacao VARCHAR(50), IN ranking INT)
BEGIN
    INSERT INTO Resultado (classificacao, ranking) VALUES (classificacao, ranking);
END//
DELIMITER ;

-- Procedure 6: Cria uma nova prova/evento em um evento determinado.
DELIMITER //
CREATE PROCEDURE sp_criar_prova(
    IN nome_prova VARCHAR(100), 
    IN local_prova VARCHAR(100), 
    IN data DATE, 
    IN hora TIME, 
    IN duracao TIME, 
    IN rodadas INT, 
    IN id_evento INT
)
BEGIN
    DECLARE last_id INT;
    INSERT INTO Prova (nome_prova, Local_prova, data, hora, duracao, rodadas) 
    VALUES (nome_prova, local_prova, data, hora, duracao, rodadas);
    
    SET last_id = LAST_INSERT_ID();
    
    INSERT INTO Prova_Evento (IdProva, IdEvento) 
    VALUES (last_id, id_evento);
END//
DELIMITER ;

-- Procedure 7: Adiciona um atleta à prova/evento.
DELIMITER //
CREATE PROCEDURE sp_adicionar_participante(
    IN id_prova INT, 
    IN id_atleta INT
)
BEGIN
    INSERT INTO AtletaEquipa (IdAtleta, IdEquipa) 
    VALUES (id_atleta, (SELECT IdEquipa FROM Prova WHERE IdProva = id_prova));
END//
DELIMITER ;

-- Procedure 8: Registra o resultado de um participante na prova/evento.
DELIMITER //
CREATE PROCEDURE sp_registar_resultado(
    IN id_prova INT, 
    IN id_participante INT, 
    IN classificacao VARCHAR(50), 
    IN ranking INT
)
BEGIN
    DECLARE result_id INT;
    
    INSERT INTO Resultado (classificacao, ranking) 
    VALUES (classificacao, ranking);
    
    SET result_id = LAST_INSERT_ID();
    
    INSERT INTO ProvaResultado (IdProva, IdResultado) 
    VALUES (id_prova, result_id);
    
    INSERT INTO AtletaEquipa (IdAtleta, IdEquipa) 
    VALUES (id_participante, (SELECT IdEquipa FROM Prova WHERE IdProva = id_prova));
END//
DELIMITER ;

-- Procedure 9: Clona uma prova/evento.
DELIMITER //
CREATE PROCEDURE sp_clonar_prova(
    IN id_prova INT
)
BEGIN
    DECLARE nome_prova VARCHAR(100);
    DECLARE local_prova VARCHAR(100);
    DECLARE data DATE;
    DECLARE hora TIME;
    DECLARE duracao TIME;
    DECLARE rodadas INT;
    DECLARE id_evento INT;
    DECLARE last_id INT;
    
    SELECT P.nome_prova, P.Local_prova, P.data, P.hora, P.duracao, P.rodadas, PE.IdEvento
    INTO nome_prova, local_prova, data, hora, duracao, rodadas, id_evento
    FROM Prova P
    JOIN Prova_Evento PE ON P.IdProva = PE.IdProva
    WHERE P.IdProva = id_prova;
    
    SET nome_prova = CONCAT(nome_prova, ' --- COPIA (a preencher)');
    
    INSERT INTO Prova (nome_prova, Local_prova, data, hora, duracao, rodadas) 
    VALUES (nome_prova, local_prova, data, hora, duracao, rodadas);
    
    SET last_id = LAST_INSERT_ID();
    
    INSERT INTO Prova_Evento (IdProva, IdEvento) 
    VALUES (last_id, id_evento);
END//
DELIMITER ;

-- Procedure para adicionar um novo estádio
DELIMITER //
CREATE PROCEDURE AddEstadio(
    IN nome VARCHAR(100),
    IN capacidade INT,
    IN localizacao VARCHAR(100),
    IN id_prova INT
)
BEGIN
    INSERT INTO Estadio (Nome, Capacidade, Localizacao, IdProva) 
    VALUES (nome, capacidade, localizacao, id_prova);
END//
DELIMITER ;

-- Procedure para adicionar um novo treinador
DELIMITER //
CREATE PROCEDURE AddTreinador(
    IN nome VARCHAR(100),
    IN dataNasc DATE,
    IN cidade VARCHAR(100),
    IN bairro VARCHAR(100),
    IN anos_experiencia INT
)
BEGIN
    INSERT INTO Treinador (Nome, DataNasc, Cidade, Bairro, AnosExperiencia) VALUES (nome, dataNasc, cidade, bairro, anos_experiencia);
END//
DELIMITER ;

-- Procedure para adicionar um novo patrocinador
DELIMITER //
CREATE PROCEDURE AddPatrocinador(
    IN nome VARCHAR(100)
)
BEGIN
    INSERT INTO Patrocinador (Nome) VALUES (nome);
END//
DELIMITER ;

-- Procedure para adicionar uma nova organizadora
DELIMITER //
CREATE PROCEDURE AddOrganizadora(
    IN nome VARCHAR(100)
)
BEGIN
    INSERT INTO Organizadora (Nome) VALUES (nome);
END//
DELIMITER ;

-- Triggers

-- Trigger 1: Verifica se a nacionalidade do atleta é válida antes de inserir.
DELIMITER //
CREATE TRIGGER before_insert_atleta
BEFORE INSERT ON Atleta
FOR EACH ROW
BEGIN
    DECLARE valid_nationality BOOLEAN;
    SET valid_nationality = NEW.Nacionalidade IN ('Brasil', 'Portugal', 'Espanha', 'China', 'Japão', 'Itália', 'EUA', 'Canadá', 'Austrália', 'Reino Unido', 'Irlanda', 'Rússia', 'México', 'Coreia do Sul');
    IF NOT valid_nationality THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nacionalidade inválida';
    END IF;
END//
DELIMITER ;

-- Trigger 2: Atualiza o campo total_provas no Evento após inserir uma nova Prova.
DELIMITER //
CREATE TRIGGER after_insert_prova
AFTER INSERT ON Prova
FOR EACH ROW
BEGIN
    UPDATE Evento
    SET total_provas = total_provas + 1
    WHERE IdEvento = (SELECT IdEvento FROM Prova_Evento WHERE IdProva = NEW.IdProva);
END//
DELIMITER ;
