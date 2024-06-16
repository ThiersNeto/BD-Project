USE Voleibol;

-- 1. Lista de participantes segundo, pelo menos, 2 critérios de consulta
-- 1.1. Critério I: Lista de atletas nascidos após 1990
SELECT nome_atleta AS 'Nome do Atleta', data_nasc AS 'Data de Nascimento', Nacionalidade AS 'Nacionalidade'
FROM Atleta
WHERE data_nasc > '1990-01-01';

-- 1.2. Critério II: Lista de atletas brasileiros
SELECT nome_atleta AS 'Nome do Atleta', data_nasc AS 'Data de Nascimento', Nacionalidade AS 'Nacionalidade'
FROM Atleta
WHERE Nacionalidade = 'Brasil';

-- 2. Lista de equipas e respetivos elementos segundo, pelo menos, 2 critérios de consulta
-- 2.1. Critério I: Equipas com desempenho global acima de 85
SELECT E.nome_equipa AS 'Nome da Equipa', A.nome_atleta AS 'Nome do Atleta'
FROM Equipa E
JOIN AtletaEquipa AE ON E.IdEquipa = AE.IdEquipa
JOIN Atleta A ON AE.IdAtleta = A.IdAtleta
WHERE E.desempenho_global > 85;

-- 2.2. Critério II: Equipas e seus atletas ordenados por nome da equipa
SELECT E.nome_equipa AS 'Nome da Equipa', A.nome_atleta AS 'Nome do Atleta'
FROM Equipa E
JOIN AtletaEquipa AE ON E.IdEquipa = AE.IdEquipa
JOIN Atleta A ON AE.IdAtleta = A.IdAtleta
ORDER BY E.nome_equipa;

-- 3. Lista de provas do evento segundo dois critérios
-- 3.1. Critério I: Provas do evento 'Torneio Internacional'
SELECT Evento.nome_evento AS 'Nome do Evento', Prova.nome_prova AS 'Nome da Prova', Prova.Local_prova AS 'Local da Prova', Prova.data AS 'Data da Prova'
FROM Prova
JOIN Prova_Evento ON Prova.IdProva = Prova_Evento.IdProva
JOIN Evento ON Prova_Evento.IdEvento = Evento.IdEvento
WHERE Evento.nome_evento = 'Torneio Internacional';

-- 3.2. Critério II: Provas realizadas em Lisboa
SELECT Evento.nome_evento AS 'Nome do Evento', Prova.nome_prova AS 'Nome da Prova', Prova.Local_prova AS 'Local da Prova', Prova.data AS 'Data da Prova'
FROM Prova
JOIN Prova_Evento ON Prova.IdProva = Prova_Evento.IdProva
JOIN Evento ON Prova_Evento.IdEvento = Evento.IdEvento
WHERE Prova.Local_prova = 'Lisboa';

-- 4. Lista de resultados/classificações em cada prova/evento segundo, pelo menos, 2 critérios
-- 4.1. Critério I: Resultados das provas do evento 'Torneio Internacional'
SELECT Evento.nome_evento AS 'Nome do Evento', Prova.nome_prova AS 'Nome da Prova', Resultado.classificacao AS 'Classificação', Resultado.ranking AS 'Ranking'
FROM Prova
JOIN ProvaResultado ON Prova.IdProva = ProvaResultado.IdProva
JOIN Resultado ON ProvaResultado.IdResultado = Resultado.IdResultado
JOIN Prova_Evento ON Prova.IdProva = Prova_Evento.IdProva
JOIN Evento ON Prova_Evento.IdEvento = Evento.IdEvento
WHERE Evento.nome_evento = 'Torneio Internacional';

-- 4.2. Critério II: Resultados das provas realizadas em 2024
SELECT Prova.nome_prova AS 'Nome da Prova', Resultado.classificacao AS 'Classificação', Resultado.ranking AS 'Ranking'
FROM Prova
JOIN ProvaResultado ON Prova.IdProva = ProvaResultado.IdProva
JOIN Resultado ON ProvaResultado.IdResultado = Resultado.IdResultado
WHERE YEAR(Prova.data) = 2024;

-- 5. Lista com o número médio, mínimo, máximo e desvio padrão dos participantes por prova/evento, segundo, pelo menos, 2 critérios
-- 5.1. Critério I: Estatísticas de participantes por prova
SELECT Prova.nome_prova AS 'Nome da Prova', 
       COUNT(AtletaEquipa.IdAtleta) AS 'Total de Participantes', 
       AVG(COUNT(AtletaEquipa.IdAtleta)) OVER() AS 'Média de Participantes',
       MIN(COUNT(AtletaEquipa.IdAtleta)) OVER() AS 'Mínimo de Participantes',
       MAX(COUNT(AtletaEquipa.IdAtleta)) OVER() AS 'Máximo de Participantes',
       STDDEV(COUNT(AtletaEquipa.IdAtleta)) OVER() AS 'Desvio Padrão de Participantes'
FROM Prova
JOIN Prova_Evento ON Prova.IdProva = Prova_Evento.IdProva
JOIN Evento ON Prova_Evento.IdEvento = Evento.IdEvento
JOIN AtletaEquipa ON Evento.IdEvento = AtletaEquipa.IdEquipa
GROUP BY Prova.nome_prova;

-- 5.2. Critério II: Estatísticas de participantes por evento
SELECT Evento.nome_evento AS 'Nome do Evento', 
       COUNT(AtletaEquipa.IdAtleta) AS 'Total de Participantes', 
       AVG(COUNT(AtletaEquipa.IdAtleta)) OVER() AS 'Média de Participantes',
       MIN(COUNT(AtletaEquipa.IdAtleta)) OVER() AS 'Mínimo de Participantes',
       MAX(COUNT(AtletaEquipa.IdAtleta)) OVER() AS 'Máximo de Participantes',
       STDDEV(COUNT(AtletaEquipa.IdAtleta)) OVER() AS 'Desvio Padrão de Participantes'
FROM Evento
JOIN Prova_Evento ON Evento.IdEvento = Prova_Evento.IdEvento
JOIN Prova ON Prova_Evento.IdProva = Prova.IdProva
JOIN AtletaEquipa ON Prova.IdProva = AtletaEquipa.IdEquipa
GROUP BY Evento.nome_evento;

-- 6. Lista de resultados de cada prova/evento com ranking das equipas (e.g., classificação da equipa em cada prova/evento)
SELECT Evento.nome_evento AS 'Nome do Evento', Prova.nome_prova AS 'Nome da Prova', Equipa.nome_equipa AS 'Nome da Equipa', Resultado.classificacao AS 'Classificação', Resultado.ranking AS 'Ranking'
FROM Prova
JOIN ProvaResultado ON Prova.IdProva = ProvaResultado.IdProva
JOIN Resultado ON ProvaResultado.IdResultado = Resultado.IdResultado
JOIN Prova_Evento ON Prova.IdProva = Prova_Evento.IdProva
JOIN Evento ON Prova_Evento.IdEvento = Evento.IdEvento
JOIN AtletaEquipa ON Prova.IdProva = AtletaEquipa.IdEquipa
JOIN Equipa ON AtletaEquipa.IdEquipa = Equipa.IdEquipa;

-- 7. Lista de participantes individuais que não participaram em qualquer prova de equipas, diferenciando participantes federados e profissionais, de participantes casuais (e.g., atleta amador sem estar associado a uma entidade, clube ou federação desportiva)
SELECT A.nome_atleta AS 'Nome do Atleta', 'Casual' AS 'Tipo de Participante'
FROM Atleta A
LEFT JOIN AtletaEquipa AE ON A.IdAtleta = AE.IdAtleta
WHERE AE.IdAtleta IS NULL;

-- 8. Lista dos elementos de uma equipa com identificação do role de cada elemento na prova/evento e respetiva características de cada elemento.
SELECT E.nome_equipa AS 'Nome da Equipa', A.nome_atleta AS 'Nome do Atleta', 'Role' AS 'Role do Atleta', FT.curriculo AS 'Currículo', FT.historico AS 'Histórico'
FROM Equipa E
JOIN AtletaEquipa AE ON E.IdEquipa = AE.IdEquipa
JOIN Atleta A ON AE.IdAtleta = A.IdAtleta
JOIN AtletaFicha AF ON A.IdAtleta = AF.IdAtleta
JOIN FichaTecnica FT ON AF.IdFicha = FT.IdFicha;

-- 9. Top 5 das provas com maior número de participantes, agrupada por ano e tendo como base os últimos três anos bem como restrições relacionadas com faixa etária e categoria dos participantes (e.g., federado, profissional, amador)
SELECT Prova.nome_prova AS 'Nome da Prova', YEAR(Prova.data) AS 'Ano', COUNT(AtletaEquipa.IdAtleta) AS 'Total de Participantes'
FROM Prova
JOIN Prova_Evento ON Prova.IdProva = Prova_Evento.IdProva
JOIN Evento ON Prova_Evento.IdEvento = Evento.IdEvento
JOIN AtletaEquipa ON Prova.IdProva = AtletaEquipa.IdEquipa
WHERE YEAR(Prova.data) >= YEAR(CURDATE()) - 3
GROUP BY Prova.nome_prova, YEAR(Prova.data)
ORDER BY COUNT(AtletaEquipa.IdAtleta) DESC
LIMIT 5;

-- 10. Consulta adicional recorrendo a, pelo menos, 3 tabelas
SELECT A.nome_atleta AS 'Nome do Atleta', E.nome_equipa AS 'Nome da Equipa', P.nome_prova AS 'Nome da Prova'
FROM Atleta A
JOIN AtletaEquipa AE ON A.IdAtleta = AE.IdAtleta
JOIN Equipa E ON AE.IdEquipa = E.IdEquipa
JOIN ProvaResultado PR ON AE.IdEquipa = PR.IdProva
JOIN Prova P ON PR.IdProva = P.IdProva;

-- 11. Consulta adicional recorrendo a, pelo menos, 3 tabelas que inclua WHERE e HAVING
SELECT E.nome_equipa AS 'Nome da Equipa', COUNT(AE.IdAtleta) AS 'Total de Atletas'
FROM Equipa E
JOIN AtletaEquipa AE ON E.IdEquipa = AE.IdEquipa
JOIN Atleta A ON AE.IdAtleta = A.IdAtleta
WHERE E.desempenho_global > 85
GROUP BY E.nome_equipa
HAVING COUNT(AE.IdAtleta) > 1;

-- 12. Consulta adicional usando descrições de dados existentes num relacionamento recursivo
WITH RECURSIVE AtletasHierarquia AS (
    SELECT IdAtleta, nome_atleta, IdAtleta AS root_id, 0 AS level
    FROM Atleta
    WHERE IdAtleta = 1 -- raiz arbitrária
    UNION ALL
    SELECT a.IdAtleta, a.nome_atleta, h.root_id, h.level + 1
    FROM Atleta a
    JOIN AtletasHierarquia h ON a.IdAtleta = h.IdAtleta
)
SELECT * FROM AtletasHierarquia;
