-- Views
CREATE VIEW V_Atletas_Nacionalidade AS
SELECT nome_atleta AS 'Nome do Atleta', Nacionalidade AS 'Nacionalidade'
FROM Atleta;

CREATE VIEW V_Equipas_Desempenho AS
SELECT nome_equipa AS 'Nome da Equipa', desempenho_global AS 'Desempenho Global'
FROM Equipa;

CREATE VIEW V_Provas_Eventos AS
SELECT E.nome_evento AS 'Nome do Evento', P.nome_prova AS 'Nome da Prova'
FROM Evento E
JOIN Prova_Evento PE ON E.IdEvento = PE.IdEvento
JOIN Prova P ON PE.IdProva = P.IdProva;

CREATE VIEW V_Resultados_Provas AS
SELECT P.nome_prova AS 'Nome da Prova', R.classificacao AS 'Classificação', R.ranking AS 'Ranking'
FROM Prova P
JOIN ProvaResultado PR ON P.IdProva = PR.IdProva
JOIN Resultado R ON PR.IdResultado = R.IdResultado;

CREATE VIEW V_Atletas_Equipas AS
SELECT A.nome_atleta AS 'Nome do Atleta', E.nome_equipa AS 'Nome da Equipa'
FROM Atleta A
JOIN AtletaEquipa AE ON A.IdAtleta = AE.IdAtleta
JOIN Equipa E ON AE.IdEquipa = E.IdEquipa;

-- Stored Functions
DELIMITER //
CREATE FUNCTION FN_Total_Atletas_Equipa (p_IdEquipa INT) RETURNS INT
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
