
-- View 1:
CREATE VIEW EquipePorPais AS
SELECT
	NomeEquipa,
    (CASE
		WHEN IdPais = 1 THEN 'Brasil'
        WHEN IdPais = 2 THEN 'Portugal'
        ELSE 'Outro'
     END) AS Pais
FROM Equipa;

-- View 2:
CREATE VIEW ListaPatrocinadores AS
SELECT 
    Equipa.NomeEquipa,
    Patrocinador.Nome AS NomePatrocinador
FROM Patrocina
JOIN Equipa ON Patrocina.IdEquipa = Equipa.IdEquipa
JOIN Patrocinador ON Patrocina.IdPatrocinador = Patrocinador.IdPatrocinador;

-- View 3:
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

-- View 4:
CREATE VIEW MediaIdadeEquipa AS
SELECT 
    NomeEquipa,
    (SELECT AVG(TIMESTAMPDIFF(YEAR, FichaTecnica.DataNascimento, CURDATE()))
     FROM Atleta
     JOIN FichaTecnica ON Atleta.IdPessoa = FichaTecnica.IdPessoa
     WHERE Atleta.IdEquipa = Equipa.IdEquipa) AS MediaIdade
FROM Equipa;

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

-- Stored Procedure 2: Mostra a média de altura dos atletas, chamando a stored function MediaAlturaEquipa.
DELIMITER //

CREATE PROCEDURE MostrarMediaAlturaEquipa(equipaId INT)
BEGIN
    DECLARE media FLOAT;
    SET media = MediaAlturaEquipa(equipaId);
    SELECT media AS MediaAltura;
END //

DELIMITER ;

-- Stored Procedure 3: Lista todos os eventos organizados por uma entidade específica.
DELIMITER //

CREATE PROCEDURE ListarEventosPorEntidade(entidadeId INT)
BEGIN
    SELECT NomeEvento, Jornada, Hora, Modalidade 
    FROM Evento
    WHERE IdEntidade_Organizadora = entidadeId;
END //

DELIMITER ;

