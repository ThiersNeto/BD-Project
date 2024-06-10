-- 1. Stored Procedure para criar uma nova prova/evento

DELIMITER //

CREATE PROCEDURE sp_criar_prova (
    IN pNome VARCHAR(100),
    IN pData DATE,
    IN pIdEstadio INT,
    IN pIdCampeonato INT
)
BEGIN
    INSERT INTO Partida (Nome, Data_da_Partida, id_Estadio, id_Campeonato)
    VALUES (pNome, pData, pIdEstadio, pIdCampeonato);
END //

DELIMITER ;

-- 2. Stored Procedure para adicionar um participante a uma prova/evento

DELIMITER //

CREATE PROCEDURE sp_adicionar_participante (
    IN pIdProva INT,
    IN pIdEquipe INT
)
BEGIN
    INSERT INTO Partida_Equipe (id_Partida, id_Equipe)
    VALUES (pIdProva, pIdEquipe);
END //

DELIMITER ;

-- 3. Stored Procedure para registar o resultado de um participante numa prova/evento

DELIMITER //

CREATE PROCEDURE sp_registar_resultado (
    IN pIdProva INT,
    IN pIdEquipe INT,
    IN pTotalPoints INT
)
BEGIN
    UPDATE Partida_Equipe
    SET Total_Points = pTotalPoints
    WHERE id_Partida = pIdProva AND id_Equipe = pIdEquipe;
END //

DELIMITER ;

-- 4. Stored Procedure para remover uma prova/evento

DELIMITER //

CREATE PROCEDURE sp_remover_prova (
    IN pIdProva INT,
    IN pForce BOOLEAN
)
BEGIN
    DECLARE vTotalResultados INT;

    -- Verifica se existem resultados associados à prova
    SELECT COUNT(*) INTO vTotalResultados
    FROM Partida_Equipe
    WHERE id_Partida = pIdProva;

    IF vTotalResultados = 0 THEN
        DELETE FROM Partida WHERE id_Partida = pIdProva;
    ELSEIF pForce = TRUE THEN
        DELETE FROM Partida_Equipe WHERE id_Partida = pIdProva;
        DELETE FROM Partida WHERE id_Partida = pIdProva;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Não é possível remover a prova. Existem resultados associados e force não foi definido como TRUE.';
    END IF;
END //

DELIMITER ;

-- 5. Stored Procedure para clonar uma prova/evento

DELIMITER //

CREATE PROCEDURE sp_clonar_prova (
    IN pIdProva INT
)
BEGIN
    DECLARE vNome VARCHAR(100);
    DECLARE vData DATE;
    DECLARE vIdEstadio INT;
    DECLARE vIdCampeonato INT;

    -- Obtem detalhes da prova original
    SELECT Nome, Data_da_Partida, id_Estadio, id_Campeonato
    INTO vNome, vData, vIdEstadio, vIdCampeonato
    FROM Partida
    WHERE id_Partida = pIdProva;

    -- Adiciona " --- COPIA (a preencher)" ao nome da prova
    SET vNome = CONCAT(vNome, ' --- COPIA (a preencher)');

    -- Cria a nova prova com os dados clonados
    INSERT INTO Partida (Nome, Data_da_Partida, id_Estadio, id_Campeonato)
    VALUES (vNome, vData, vIdEstadio, vIdCampeonato);
END //

DELIMITER ;



