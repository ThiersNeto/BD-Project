Use Volei;

-- 1.1. Critério I: Participantes de um determinado país
SELECT 
    p.nome AS 'Nome do Participante', 
    p.email AS 'Email', 
    j.altura AS 'Altura', 
    j.peso AS 'Peso', 
    j.posicao AS 'Posição', 
    j.nacionalidade AS 'Nacionalidade',
    j.numeroDaCamisa AS 'Número da Camisa'
FROM Pessoa p
JOIN Jogador j ON p.idPessoa = j.idPessoa
WHERE j.nacionalidade = 'Brasileira';

-- 1.2. Critério II: Participantes com altura maior que 1.80m
SELECT 
    p.nome AS 'Nome do Participante', 
    p.email AS 'Email', 
    j.altura AS 'Altura', 
    j.peso AS 'Peso', 
    j.posicao AS 'Posição', 
    j.nacionalidade AS 'Nacionalidade',
    j.numeroDaCamisa AS 'Número da Camisa'
FROM Pessoa p
JOIN Jogador j ON p.idPessoa = j.idPessoa
WHERE j.altura > 1.80;


-- 2.1. Critério I: Equipas que participam em um campeonato específico
SELECT 
    t.nome AS 'Nome da Equipa', 
    p.nome AS 'Nome do Jogador', 
    j.peso AS 'Peso', 
    c.titulo AS 'Campeonato'
FROM 
    Time t
JOIN JogadorTime jt ON t.idTeam = jt.idTeam
JOIN Jogador j ON jt.idJogador = j.idJogador
JOIN Pessoa p ON j.idPessoa = p.idPessoa
JOIN TimeCampeonato tc ON t.idTeam = tc.idTeam
JOIN Campeonato c ON tc.idCampeonato = c.idCampeonato
WHERE c.titulo = 'Campeonato Nacional';

    
-- 2.2. Critério II: Equipas que têm jogadores com peso maior que 75kg
SELECT 
    t.nome AS 'Nome da Equipa', 
    p.nome AS 'Nome do Jogador', 
    j.peso AS 'Peso'
FROM 
    Time t
JOIN JogadorTime jt ON t.idTeam = jt.idTeam
JOIN Jogador j ON jt.idJogador = j.idJogador
JOIN Pessoa p ON j.idPessoa = p.idPessoa
WHERE j.peso > 75;



-- 3.1. Critério I: Listar provas por nome do campeonato
SELECT 
    c.titulo AS 'Nome do Campeonato',
    p.idPartida AS 'ID da Prova',
    p.dataDaPartida AS 'Data da Prova',
    p.duracaoDaPartida AS 'Duração da Prova',
    e.nome AS 'Estádio',
    t.idTeam AS 'ID do Time',
    t.nome AS 'Nome do Time'
FROM Campeonato c
JOIN TimeCampeonato tc ON c.idCampeonato = tc.idCampeonato
JOIN Time t ON tc.idTeam = t.idTeam
JOIN PartidaTime pt ON t.idTeam = pt.idTeam
JOIN Partida p ON pt.idPartida = p.idPartida
JOIN Estadio e ON p.idEstadio = e.idEstadio
ORDER BY c.titulo, p.dataDaPartida;

-- 3.2. Critério II: Listar provas por número de times participantes
SELECT 
    p.idPartida AS 'ID da Prova',
    p.dataDaPartida AS 'Data da Prova',
    p.duracaoDaPartida AS 'Duração da Prova',
    e.nome AS 'Estádio',
    COUNT(pt.idTeam) AS 'Número de Times Participantes'
FROM Partida p
JOIN PartidaTime pt ON p.idPartida = pt.idPartida
JOIN Estadio e ON p.idEstadio = e.idEstadio
GROUP BY p.idPartida, p.dataDaPartida, p.duracaoDaPartida, e.nome
ORDER BY 'Número de Times Participantes' DESC, p.dataDaPartida;

-- 4.1. Critério I: Classificação de provas em que o total de pontos foi maior que 15
SELECT 
    p.idPartida AS 'ID da Prova', 
    t.nome AS 'Nome da Equipa', 
    p.totalPoints AS 'Total de Pontos', 
    e.nome AS 'Estádio'
FROM Partida p
JOIN PartidaTime pt ON p.idPartida = pt.idPartida
JOIN Time t ON pt.idTeam = t.idTeam
JOIN Estadio e ON p.idEstadio = e.idEstadio
WHERE p.totalPoints > 15;

-- 4.2. Critério II: Classificação por duração da prova
SELECT 
    p.idPartida AS 'ID da Prova',
    t.nome AS 'Nome do Time',
    p.duracaoDaPartida AS 'Duração da Prova',
    e.nome AS 'Estádio'
FROM Partida p
JOIN PartidaTime pt ON p.idPartida = pt.idPartida
JOIN Time t ON pt.idTeam = t.idTeam
JOIN Estadio e ON p.idEstadio = e.idEstadio
ORDER BY p.duracaoDaPartida, p.idPartida;

-- 5.1. Critério I: Estatísticas do número de participantes por prova
SELECT 
    p.idPartida AS 'ID da Prova',
    AVG(pt.participantes) AS 'Número Médio de Participantes',
    MIN(pt.participantes) AS 'Número Mínimo de Participantes',
    MAX(pt.participantes) AS 'Número Máximo de Participantes',
    STDDEV(pt.participantes) AS 'Desvio Padrão de Participantes'
FROM 
    Partida p
JOIN 
    (SELECT idPartida, COUNT(idTeam) AS participantes
     FROM PartidaTime
     GROUP BY idPartida) pt ON p.idPartida = pt.idPartida
GROUP BY 
    p.idPartida;

-- 5.2. Critério III: Estatísticas do número de participantes por estádio
SELECT 
    e.nome AS 'Nome do Estádio',
    AVG(pt.participantes) AS 'Número Médio de Participantes',
    MIN(pt.participantes) AS 'Número Mínimo de Participantes',
    MAX(pt.participantes) AS 'Número Máximo de Participantes',
    STDDEV(pt.participantes) AS 'Desvio Padrão de Participantes'
FROM 
    Estadio e
JOIN 
    Partida p ON e.idEstadio = p.idEstadio
JOIN 
    (SELECT idPartida, COUNT(idTeam) AS participantes
     FROM PartidaTime
     GROUP BY idPartida) pt ON p.idPartida = pt.idPartida
GROUP BY 
    e.nome;

-- 6: Lista de resultados de cada Evento com ranking das equipas
SELECT 
    p.idPartida AS 'ID da Prova',
    e.nome AS 'Nome do Estádio',
    t.nome AS 'Nome da Equipe',
    p.totalPoints AS 'Pontos Obtidos',  
    RANK() OVER (PARTITION BY p.idPartida ORDER BY p.totalPoints DESC) AS 'Classificação'
FROM Partida p
JOIN PartidaTime pt ON p.idPartida = pt.idPartida
JOIN Time t ON pt.idTeam = t.idTeam
JOIN Estadio e ON p.idEstadio = e.idEstadio
ORDER BY p.idPartida, 'Classificação';

-- 7: Lista de participantes Profissionais que não participaram em qualquer prova de equipas
SELECT 
    p.idPessoa AS 'ID do Participante',
    p.nome AS 'Nome do Participante',
    'Federado/Profissional' AS 'Tipo de Participante'
FROM Pessoa p
JOIN Jogador j ON p.idPessoa = j.idPessoa
LEFT JOIN JogadorTime jt ON j.idJogador = jt.idJogador
WHERE jt.idJogador IS NULL;

SELECT 
    p.idPessoa AS 'ID do Participante',
    p.nome AS 'Nome do Participante',
    'Casual' AS 'Tipo de Participante'
FROM Pessoa p
LEFT JOIN Jogador j ON p.idPessoa = j.idPessoa
LEFT JOIN JogadorTime jt ON j.idJogador = jt.idJogador
WHERE j.idJogador IS NULL OR jt.idJogador IS NULL;

-- 8: Lista dos elementos de uma equipa com identificação do role de cada elemento na prova/evento e respetiva características de cada elemento
-- Informações dos Jogadores
SELECT 
    t.nome AS 'Nome da Equipe',
    p.idPessoa AS 'ID do Participante',
    p.nome AS 'Nome do Participante',
    'Jogador' AS 'Papel',
    j.altura AS 'Altura',
    j.peso AS 'Peso',
    j.posicao AS 'Posição',
    j.nacionalidade AS 'Nacionalidade'
FROM Time t
JOIN JogadorTime jt ON t.idTeam = jt.idTeam
JOIN Jogador j ON jt.idJogador = j.idJogador
JOIN Pessoa p ON j.idPessoa = p.idPessoa
WHERE t.idTeam = 1

UNION ALL

-- Informações dos Treinadores
SELECT 
    t.nome AS 'Nome da Equipe',
    p.idPessoa AS 'ID do Participante',
    p.nome AS 'Nome do Participante',
    'Treinador' AS 'Papel',
    NULL AS 'Altura',
    NULL AS 'Peso',
    NULL AS 'Posição',
    tr.nacionalidade AS 'Nacionalidade'
FROM Time t
JOIN TreinadorTime tt ON t.idTeam = tt.idTeam
JOIN Treinador tr ON tt.idTreinador = tr.idTreinador
JOIN Pessoa p ON tr.idPessoa = p.idPessoa
WHERE t.idTeam = 1;

-- 9: Top 5 Provas com maior número de participantes nos últimos três anos, com restrições de faixa etária e categoria
SELECT 
    YEAR(p.dataDaPartida) AS 'Ano',
    p.idPartida AS 'ID da Prova',
    (SELECT COUNT(jt.idJogador) 
     FROM JogadorTime jt
     WHERE jt.idTeam IN (SELECT pt.idTeam FROM PartidaTime pt WHERE pt.idPartida = p.idPartida)) AS 'Número de Participantes'
FROM Partida p
WHERE p.dataDaPartida >= DATE_SUB(CURDATE(), INTERVAL 3 YEAR)
GROUP BY YEAR(p.dataDaPartida), p.idPartida
HAVING 'Número de Participantes' > 0
ORDER BY 'Número de Participantes' DESC
LIMIT 5;

-- 10: Lista de partidas com informações sobre o Estádio, os Times Participantes e os Jogadores

SELECT 
    p.idPartida AS 'ID da Partida',
    e.nome AS 'Nome do Estádio',
    t.nome AS 'Nome do Time',
    j.idJogador AS 'ID do Jogador',
    ps.nome AS 'Nome do Jogador'
FROM Partida p
JOIN Estadio e ON p.idEstadio = e.idEstadio
JOIN PartidaTime pt ON p.idPartida = pt.idPartida
JOIN Time t ON pt.idTeam = t.idTeam
JOIN JogadorTime jt ON t.idTeam = jt.idTeam
JOIN Jogador j ON jt.idJogador = j.idJogador
JOIN Pessoa ps ON j.idPessoa = ps.idPessoa
ORDER BY p.idPartida, t.nome, j.idJogador;

-- 11: Lista de jogadores que participaram em partidas específicas

-- 12: Relacionamento recursivo

-- 13: Times e número total de jogadores em cada time
SELECT 
    t.idTeam AS 'ID do Time',
    t.nome AS 'Nome do Time',
    (SELECT COUNT(jt.idJogador)
     FROM JogadorTime jt
     WHERE jt.idTeam = t.idTeam) AS 'Número de Jogadores'
FROM 
    Time t
ORDER BY 
    t.nome;
