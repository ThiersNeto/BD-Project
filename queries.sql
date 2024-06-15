USE volei;

-- 1.1. Critério I: Participantes de um determinado país;
SELECT 
    j.nome AS 'Nome do Participante', 
    j.nacionalidade AS 'Nacionalidade'
FROM Jogador j
WHERE j.nacionalidade = 'Brasileira';


-- 1.2. Critério II: Participantes com altura maior que 1.80m;
SELECT 
    j.nome AS 'Nome do Participante', 
    j.altura AS 'Altura'
FROM Jogador j
WHERE j.altura > 1.80;

-- 2.1. Critério I: Equipas que participam em um Evento;
SELECT 
    e.nome AS 'Nome da Equipa', 
    j.nome AS 'Nome do Jogador'
FROM Equipa e
JOIN JogadorEquipa je ON e.idEquipa = je.idEquipa
JOIN Jogador j ON je.idJogador = j.idJogador
ORDER BY e.nome, j.nome;

-- 2.2. Critério II: Equipas que têm jogadores com peso maior que 75kg;
SELECT 
    e.nome AS 'Nome da Equipa', 
    j.nome AS 'Nome do Jogador', 
    j.peso AS 'Peso'
FROM Equipa e
JOIN JogadorEquipa je ON e.idEquipa = je.idEquipa
JOIN Jogador j ON je.idJogador = j.idJogador
WHERE j.peso > 75;

-- 3.1. Critério I: Listar provas por nome do campeonato;
SELECT 
    ev.titulo AS 'Nome do Campeonato',
    p.idPartida AS 'ID da Prova',
    p.dataDaPartida AS 'Data da Prova',
    p.duracaoDaPartida AS 'Duração da Prova',
    es.nome AS 'Estádio',
    e.idEquipa AS 'ID da Equipa',
    e.nome AS 'Nome da Equipa'
FROM Evento ev
JOIN EquipaEvento ee ON ev.idEvento = ee.idEvento
JOIN Equipa e ON ee.idEquipa = e.idEquipa
JOIN PartidaEquipa pe ON e.idEquipa = pe.idEquipa
JOIN Partida p ON pe.idPartida = p.idPartida
JOIN Estadio es ON p.idEstadio = es.idEstadio
ORDER BY ev.titulo, p.dataDaPartida;

-- 3.2. Critério II: Listar provas por número de equipas participantes;
SELECT 
    p.idPartida AS 'ID da Prova',
    COUNT(pe.idEquipa) AS 'Número de Equipas Participantes'
FROM Partida p
JOIN PartidaEquipa pe ON p.idPartida = pe.idPartida
GROUP BY p.idPartida
ORDER BY COUNT(pe.idEquipa) DESC, p.dataDaPartida;

-- 4.1. Critério I: Classificação por pontos maior que 15;
SELECT 
    p.idPartida AS 'ID da Prova', 
    e.nome AS 'Nome da Equipa', 
    p.totalPoints AS 'Total de Pontos'
FROM Partida p
JOIN PartidaEquipa pe ON p.idPartida = pe.idPartida
JOIN Equipa e ON pe.idEquipa = e.idEquipa
WHERE p.totalPoints > 15;

-- 4.2. Critério II: Classificação por duração da prova;
SELECT 
    p.idPartida AS 'ID da Prova',
    e.nome AS 'Nome da Equipa',
    p.duracaoDaPartida AS 'Duração da Prova'
FROM Partida p
JOIN PartidaEquipa pe ON p.idPartida = pe.idPartida
JOIN Equipa e ON pe.idEquipa = e.idEquipa
ORDER BY p.duracaoDaPartida, p.idPartida;

-- 5.1. Critério I: Estatísticas do número de participantes por prova;
SELECT 
    p.idPartida AS 'ID da Prova',
    AVG(pe.participantes) AS 'Número Médio de Participantes',
    MIN(pe.participantes) AS 'Número Mínimo de Participantes',
    MAX(pe.participantes) AS 'Número Máximo de Participantes',
    STDDEV(pe.participantes) AS 'Desvio Padrão de Participantes'
FROM Partida p
JOIN 
    (SELECT idPartida, COUNT(idEquipa) AS participantes
     FROM PartidaEquipa
     GROUP BY idPartida) pe ON p.idPartida = pe.idPartida
GROUP BY p.idPartida;

-- 5.2. Critério II: Estatísticas do número de participantes por estádio;
SELECT 
    es.nome AS 'Nome do Estádio',
    AVG(pe.participantes) AS 'Número Médio de Participantes',
    MIN(pe.participantes) AS 'Número Mínimo de Participantes',
    MAX(pe.participantes) AS 'Número Máximo de Participantes',
    STDDEV(pe.participantes) AS 'Desvio Padrão de Participantes'
FROM Estadio es
JOIN Partida p ON es.idEstadio = p.idEstadio
JOIN 
    (SELECT idPartida, COUNT(idEquipa) AS participantes
     FROM PartidaEquipa
     GROUP BY idPartida) pe ON p.idPartida = pe.idPartida
GROUP BY es.nome;

-- 6. Lista de resultados de cada prova/evento com ranking das equipas;
SELECT 
    p.idPartida AS 'ID da Prova',
    es.nome AS 'Nome do Estádio',
    e.nome AS 'Nome da Equipa',
    p.totalPoints AS 'Pontos Obtidos',  
    RANK() OVER (PARTITION BY p.idPartida ORDER BY p.totalPoints DESC) AS 'Classificação'
FROM Partida p
JOIN PartidaEquipa pe ON p.idPartida = pe.idPartida
JOIN Equipa e ON pe.idEquipa = e.idEquipa
JOIN Estadio es ON p.idEstadio = es.idEstadio
ORDER BY p.idPartida, 'Classificação';

-- 7.1. Participantes federados e profissionais; 
SELECT 
    j.idJogador AS 'ID do Participante',
    j.nome AS 'Nome do Participante',
    'Profissional' AS 'Tipo de Participante'
FROM Jogador j
LEFT JOIN JogadorEquipa je ON j.idJogador = je.idJogador
WHERE je.idJogador IS NULL;

-- 7.2. Participantes casuais;
SELECT 
    j.idJogador AS 'ID do Participante',
    j.nome AS 'Nome do Participante',
    'Casual' AS 'Tipo de Participante'
FROM Jogador j
LEFT JOIN JogadorEquipa je ON j.idJogador = je.idJogador
WHERE je.idJogador IS NULL;

-- 8. Informações dos Jogadores e Treinadores
SELECT 
    e.nome AS 'Nome da Equipa',
    j.idJogador AS 'ID do Participante',
    j.nome AS 'Nome do Participante',
    'Jogador' AS 'Papel',
    j.altura AS 'Altura',
    j.peso AS 'Peso',
    j.posicao AS 'Posição',
    j.nacionalidade AS 'Nacionalidade'
FROM Equipa e
JOIN JogadorEquipa je ON e.idEquipa = je.idEquipa
JOIN Jogador j ON je.idJogador = j.idJogador
WHERE e.idEquipa = 1

UNION ALL

SELECT 
    e.nome AS 'Nome da Equipa',
    t.idTreinador AS 'ID do Participante',
    t.nome AS 'Nome do Participante',
    'Treinador' AS 'Papel',
    NULL AS 'Altura',
    NULL AS 'Peso',
    NULL AS 'Posição',
    t.nacionalidade AS 'Nacionalidade'
FROM Equipa e
JOIN TreinadorEquipa te ON e.idEquipa = te.idEquipa
JOIN Treinador t ON te.idTreinador = t.idTreinador
WHERE e.idEquipa = 1;

-- 9. Top 5 dos eventos com maior número de participantes;
SELECT 
    YEAR(p.dataDaPartida) AS 'Ano',
    p.idPartida AS 'ID da Prova',
    (SELECT COUNT(je.idJogador) 
     FROM JogadorEquipa je
     WHERE je.idEquipa IN (SELECT pe.idEquipa FROM PartidaEquipa pe WHERE pe.idPartida = p.idPartida)) AS 'Número de Participantes'
FROM Partida p
WHERE p.dataDaPartida >= DATE_SUB(CURDATE(), INTERVAL 3 YEAR)
GROUP BY YEAR(p.dataDaPartida), p.idPartida
HAVING 'Número de Participantes' > 0
ORDER BY 'Número de Participantes' DESC
LIMIT 5;

-- 10. Consulta adicional 1;
SELECT 
    j.nome AS 'Nome do Jogador', 
    e.nome AS 'Nome da Equipa',
    es.nome AS 'Nome do Estádio'
FROM Jogador j
JOIN JogadorEquipa je ON j.idJogador = je.idJogador
JOIN Equipa e ON je.idEquipa = e.idEquipa
JOIN PartidaEquipa pe ON e.idEquipa = pe.idEquipa
JOIN Partida p ON pe.idPartida = p.idPartida
JOIN Estadio es ON p.idEstadio = es.idEstadio;

-- 11. Consulta adicional 2 (WHERE e HAVING);
SELECT 
    e.nome AS 'Nome da Equipa',
    AVG(p.totalPoints) AS 'Média de Pontos'
FROM Equipa e
JOIN PartidaEquipa pe ON e.idEquipa = pe.idEquipa
JOIN Partida p ON pe.idPartida = p.idPartida
GROUP BY e.nome;

-- 12. Consulta adicional 3 Descrições de dados existentes num relacionamento RECURSIVO;
WITH RECURSIVE JogadorHierarquia AS (
    SELECT 
        j.idJogador,
        j.nome AS NomeJogador,
        j.idCapitao,
        1 AS nivel
    FROM Jogador j
    WHERE j.idCapitao IS NULL -- Capitães no nível mais alto

    UNION ALL

    SELECT 
        j.idJogador,
        j.nome AS NomeJogador,
        jh.idJogador AS idCapitao,
        jh.nivel + 1 AS nivel
    FROM Jogador j
    INNER JOIN JogadorHierarquia jh ON j.idCapitao = jh.idJogador
)
SELECT 
    jh.idJogador,
    jh.NomeJogador,
    jh.idCapitao,
    jh.nivel
FROM JogadorHierarquia jh;

-- 13.1. Consulta com subquery no SELECT;
SELECT 
    e.nome AS 'Nome da Equipa',
    (SELECT COUNT(je.idJogador) 
     FROM JogadorEquipa je 
     WHERE je.idEquipa = e.idEquipa) AS 'Número de Jogadores'
FROM Equipa e;
