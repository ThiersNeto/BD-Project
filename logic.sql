USE Volei;

-- Stored Function 1: Média de Altura dos Atletas em uma Equipe
DELIMITER //

CREATE FUNCTION MediaAlturaEquipa(id_equipa INT) RETURNS FLOAT
READS SQL DATA
BEGIN
    DECLARE media_altura FLOAT;
    SELECT AVG(FichaTecnica.Altura) INTO media_altura
    FROM Atleta
    JOIN FichaTecnica ON Atleta.IdPessoa = FichaTecnica.IdPessoa
    WHERE Atleta.IdEquipa = id_equipa;
    RETURN media_altura;
END //

DELIMITER ;

-- Stored Function 2: Número Total de Atletas em uma Equipe
DELIMITER //

CREATE FUNCTION TotalAtletasEquipa(id_equipa INT) RETURNS INT
READS SQL DATA
BEGIN
    DECLARE total_atletas INT;
    SELECT COUNT(*) INTO total_atletas
    FROM Atleta
    WHERE Atleta.IdEquipa = id_equipa;
    RETURN total_atletas;
END //

DELIMITER ;

-- Stored Procedure 1: Lista todos os atletas de uma equipe específica
DELIMITER //

CREATE PROCEDURE ListarAtletasPorEquipa(equipaId INT)
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE atletaNome VARCHAR(100);
    DECLARE atletaCursor CURSOR FOR SELECT Nome FROM Atleta WHERE IdEquipa = equipaId;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN atletaCursor;
    read_loop: LOOP
        FETCH atletaCursor INTO atletaNome;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT atletaNome;
    END LOOP;
    CLOSE atletaCursor;
END //

DELIMITER ;

-- Stored Procedure 2: Mostra a média de altura dos atletas, chamando a stored function MediaAlturaEquipa
DELIMITER //

CREATE PROCEDURE MostrarMediaAlturaEquipa(equipaId INT)
BEGIN
    DECLARE media FLOAT;
    SET media = MediaAlturaEquipa(equipaId);
    SELECT media AS MediaAltura;
END //

DELIMITER ;

-- Stored Procedure 3: Lista todos os eventos organizados por uma entidade específica
DELIMITER //

CREATE PROCEDURE ListarEventosPorEntidade(entidadeId INT)
BEGIN
    SELECT NomeEvento, Jornada, Hora, Modalidade 
    FROM Evento
    WHERE IdEntidade_Organizadora = entidadeId;
END //

DELIMITER ;

-- Stored Procedure 4: Insere um novo estádio
DELIMITER //

CREATE PROCEDURE InserirNovoEstadio(IN nome VARCHAR(100), IN capacidade INT)
BEGIN
    IF capacidade < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A capacidade do estádio não pode ser negativa';
    ELSE
        INSERT INTO Estadio (Nome, Capacidade) VALUES (nome, capacidade);
    END IF;
END //

DELIMITER ;

-- Stored Procedure 5: Tenta inserir um novo treinador e retornará uma mensagem de erro
DELIMITER //

CREATE PROCEDURE InserirNovoTreinador(IN nome VARCHAR(100), IN especialidade VARCHAR(100), IN anos_experiencia INT, IN id_pessoa INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro ao inserir novo treinador.';
    END;

    START TRANSACTION;
    INSERT INTO Treinador (Nome, Especialidade, AnosExperiencia, IdPessoa) VALUES (nome, especialidade, anos_experiencia, id_pessoa);
    COMMIT;
END //

DELIMITER ;


-- Stored Procedure 6: Popula a Tabela Estadio
DELIMITER //

CREATE PROCEDURE PopularEstadio(IN pNome VARCHAR(100), IN pCapacidade INT)
BEGIN
    INSERT INTO Estadio (Nome, Capacidade) VALUES (pNome, pCapacidade);
END //

DELIMITER ;

-- Stored Procedure 7: Popula a Tabela Pessoa
DELIMITER //

CREATE PROCEDURE PopularPessoa(IN pNome VARCHAR(100), IN pCidade VARCHAR(100), IN pMorada VARCHAR(100), IN pBairro VARCHAR(100))
BEGIN
    INSERT INTO Pessoa (Nome, Cidade, Morada, Bairro) VALUES (pNome, pCidade, pMorada, pBairro);
END //

DELIMITER ;

-- Stored Procedure 8: Popula a Tabela Atleta
DELIMITER //

CREATE PROCEDURE PopularAtleta(
    IN pTipoParticipante VARCHAR(50),
    IN pNome VARCHAR(100),
    IN pPosicao VARCHAR(50),
    IN pNumeroCamiseta INT,
    IN pCapitao BOOLEAN,
    IN pIdPessoa INT,
    IN pIdEquipa INT
)
BEGIN
    INSERT INTO Atleta (TipoParticipante, Nome, Posicao, NumeroCamiseta, Capitao, IdPessoa, IdEquipa)
    VALUES (pTipoParticipante, pNome, pPosicao, pNumeroCamiseta, pCapitao, pIdPessoa, pIdEquipa);
END //

DELIMITER ;

-- Stored Procedure 9: Popula a Tabela Treinador
DELIMITER //

CREATE PROCEDURE PopularTreinador(
    IN pNome VARCHAR(100),
    IN pEspecialidade VARCHAR(100),
    IN pAnosExperiencia INT,
    IN pIdPessoa INT)
BEGIN
    INSERT INTO Treinador (Nome, Especialidade, AnosExperiencia, IdPessoa)
    VALUES (pNome, pEspecialidade, pAnosExperiencia, pIdPessoa);
END //

DELIMITER ;

-- Stored Procedure 10: Popula a Tabela Patrocinador
DELIMITER //

CREATE PROCEDURE PopularPatrocinador(
    IN pNome VARCHAR(100)
)
BEGIN
    INSERT INTO Patrocinador (Nome)
    VALUES (pNome);
END //

DELIMITER ;

-- Stored Procedure 11: Liga Patrocinador à Equipa
DELIMITER //

CREATE PROCEDURE LigarPatrocinadorEquipa(
    IN pNomePatrocinador VARCHAR(100),
    IN pIdEquipa INT
)
BEGIN
    DECLARE pIdPatrocinador INT;
    SELECT IdPatrocinador INTO pIdPatrocinador
    FROM Patrocinador
    WHERE Nome = pNomePatrocinador;
    IF pIdPatrocinador IS NOT NULL THEN
        UPDATE Equipa
        SET IdPatrocinador = pIdPatrocinador
        WHERE IdEquipa = pIdEquipa;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Patrocinador não encontrado';
    END IF;
END //

DELIMITER ;

-- Stored Procedure 12: Liga Patrocinador a Evento
DELIMITER //

CREATE PROCEDURE LigarPatrocinadorEvento(
    IN pNomePatrocinador VARCHAR(100),
    IN pIdEvento INT
)
BEGIN
    DECLARE pIdPatrocinador INT;
    SELECT IdPatrocinador INTO pIdPatrocinador
    FROM Patrocinador
    WHERE Nome = pNomePatrocinador;
    IF pIdPatrocinador IS NOT NULL THEN
        UPDATE Evento
        SET IdPatrocinador = pIdPatrocinador
        WHERE IdEvento = pIdEvento;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Patrocinador não encontrado';
    END IF;
END //

DELIMITER ;

-- Stored Procedure 13: Popula a Entidade Organizadora
DELIMITER //

CREATE PROCEDURE PopularEntidadeOrganizadora(
    IN pNome VARCHAR(100),
    IN pIdPais INT)
BEGIN
    INSERT INTO Entidade_Organizadora (Nome, IdPais)
    VALUES (pNome, pIdPais);
END //

DELIMITER ;

-- Stored Procedure 14: Popula a tabela FichaTecnica
DELIMITER //

CREATE PROCEDURE PopularFichaTecnica(
    IN pDataNascimento DATE,
    IN pAltura FLOAT,
    IN pPeso FLOAT,
    IN pIdPessoa INT)
BEGIN
    INSERT INTO FichaTecnica (DataNascimento, Altura, Peso, IdPessoa)
    VALUES (pDataNascimento, pAltura, pPeso, pIdPessoa);
END //

DELIMITER ;

-- Trigger 1: Verificar se a pessoa já existe na tabela Pessoa
DELIMITER //

CREATE TRIGGER BeforeInsertAtleta
BEFORE INSERT ON Atleta
FOR EACH ROW
BEGIN
    DECLARE pessoa_exists INT;
    
    -- Verifica se a pessoa existe na tabela Pessoa
    SELECT COUNT(*) INTO pessoa_exists
    FROM Pessoa
    WHERE IdPessoa = NEW.IdPessoa;
    
    -- Se a pessoa não existe, lançar um erro
    IF pessoa_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Pessoa referenciada não existe na tabela Pessoa';
    END IF;
END //

DELIMITER ;

-- Trigger 2: Verificará se a capacidade é negativa
DELIMITER //

CREATE TRIGGER BeforeInsertEstadio
BEFORE INSERT ON Estadio
FOR EACH ROW
BEGIN
    IF NEW.Capacidade < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'A capacidade do estádio não pode ser negativa';
    END IF;
END //

DELIMITER ;

-- View 1: EquipePorPais
CREATE VIEW EquipePorPais AS
SELECT
    NomeEquipa,
    (CASE
        WHEN IdPais = 1 THEN 'Brasil'
        WHEN IdPais = 2 THEN 'Portugal'
        ELSE 'Outro'
    END) AS Pais
FROM Equipa;

-- View 2: AtletasStatus
CREATE VIEW AtletasStatus AS
SELECT
    Atleta.Nome,
    TIMESTAMPDIFF(YEAR, FichaTecnica.DataNascimento, CURDATE()) AS Idade,
    (CASE
        WHEN TIMESTAMPDIFF(YEAR, FichaTecnica.DataNascimento, CURDATE()) > 18 THEN 'Senior'
        ELSE 'Junior'
    END) AS Categoria
FROM Atleta
JOIN FichaTecnica ON Atleta.IdPessoa = FichaTecnica.IdPessoa;

-- View 3: MediaIdadeEquipa
CREATE OR REPLACE VIEW MediaIdadeEquipa AS
SELECT 
    Equipa.IdEquipa,
    Equipa.NomeEquipa,
    AVG(YEAR(CURDATE()) - YEAR(FichaTecnica.DataNascimento)) AS MediaIdade
FROM Atleta
JOIN FichaTecnica ON Atleta.IdPessoa = FichaTecnica.IdPessoa
JOIN Equipa ON Atleta.IdEquipa = Equipa.IdEquipa
GROUP BY Equipa.IdEquipa, Equipa.NomeEquipa;

-- View 4: MediaAlturaDeTodasEquipa
CREATE VIEW MediaAlturaDeTodasEquipa AS
SELECT 
    Equipa.IdEquipa,
    Equipa.NomeEquipa,
    MediaAlturaEquipa(Equipa.IdEquipa) AS MediaAltura
FROM 
    Equipa;

-- Stored Procedure 1: Criar nova prova/evento
DELIMITER //

CREATE PROCEDURE sp_criar_prova(
    IN pNome VARCHAR(100),
    IN pNomeEvento VARCHAR(100),
    IN pJornada VARCHAR(100),
    IN pHora TIME,
    IN pModalidade VARCHAR(100),
    IN pIdEstadio INT,
    IN pIdResultado INT,
    IN pIdEntidade_Organizadora INT,
    IN pIdPais INT
)
BEGIN
    INSERT INTO Evento (Nome, NomeEvento, Jornada, Hora, Modalidade, IdEstadio, IdResultado, IdEntidade_Organizadora, IdPais)
    VALUES (pNome, pNomeEvento, pJornada, pHora, pModalidade, pIdEstadio, pIdResultado, pIdEntidade_Organizadora, pIdPais);
END //

DELIMITER ;

-- Stored Procedure 2: Adicionar participante (Atleta) a uma prova/evento
DELIMITER //

CREATE PROCEDURE sp_adicionar_participante(
    IN pIdEvento INT,
    IN pIdAtleta INT
)
BEGIN
    UPDATE Atleta
    SET IdEvento = pIdEvento
    WHERE IdAtleta = pIdAtleta;
END //

DELIMITER ;

-- Stored Procedure 3: Registrar resultado de um participante
DELIMITER //

CREATE PROCEDURE sp_registar_resultado(
    IN pIdEvento INT,
    IN pIdAtleta INT,
    IN pIdResultado INT
)
BEGIN
    UPDATE Atleta
    SET IdResultado = pIdResultado
    WHERE IdEvento = pIdEvento AND IdAtleta = pIdAtleta;
END //

DELIMITER ;

-- Stored Procedure 4: Remover prova/evento
DELIMITER //

CREATE PROCEDURE sp_remover_prova(
    IN pIdEvento INT,
    IN pForce BOOLEAN
)
BEGIN
    DECLARE resultCount INT;

    -- Verifica se existem resultados associados
    SELECT COUNT(*) INTO resultCount FROM Atleta WHERE IdEvento = pIdEvento;

    IF resultCount = 0 OR pForce = TRUE THEN
        DELETE FROM Evento WHERE IdEvento = pIdEvento;
        UPDATE Atleta SET IdEvento = NULL WHERE IdEvento = pIdEvento;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Não é possível remover o Evento porque existem resultados associados.';
    END IF;
END //

DELIMITER ;

-- Stored Procedure 5: Clonar prova/evento
DELIMITER //

CREATE PROCEDURE sp_clonar_prova(
    IN pIdEvento INT
)
BEGIN
    DECLARE pNomeEvento VARCHAR(100);
    DECLARE pJornada VARCHAR(100);
    DECLARE pHora TIME;
    DECLARE pModalidade VARCHAR(100);
    DECLARE pIdEstadio INT;
    DECLARE pIdResultado INT;
    DECLARE pIdEntidade_Organizadora INT;
    DECLARE pIdPais INT;

    -- Seleciona os detalhes da prova existente
    SELECT NomeEvento, Jornada, Hora, Modalidade, IdEstadio, IdResultado, IdEntidade_Organizadora, IdPais
    INTO pNomeEvento, pJornada, pHora, pModalidade, pIdEstadio, pIdResultado, pIdEntidade_Organizadora, pIdPais
    FROM Evento WHERE IdEvento = pIdEvento;

    SET pNomeEvento = CONCAT(pNomeEvento, ' COPIA');

    -- Insere a nova prova/evento clonada
    INSERT INTO Evento (Nome, NomeEvento, Jornada, Hora, Modalidade, IdEstadio, IdResultado, IdEntidade_Organizadora, IdPais)
    VALUES ('Evento Clonado', pNomeEvento, pJornada, pHora, pModalidade, pIdEstadio, pIdResultado, pIdEntidade_Organizadora, pIdPais);
END //

DELIMITER ;
