USE voleibd;

-- 1.1: Listar participantes por posição;

SELECT 
    p.Nome AS 'Nome do Jogador',
    j.Posicao AS 'Posição',
    p.Email AS 'Email',
    p.Telemovel AS 'Telemóvel',
    e.Nome AS 'Equipe'
FROM Jogador j
JOIN Pessoa p ON j.idPessoa = p.idPessoa
JOIN Jogador_Equipe je ON j.id_Jogador = je.id_Jogador
JOIN Equipe e ON je.id_Equipe = e.id_Equipe
ORDER BY j.Posicao, p.Nome;

-- 1.2: Listar participantes por equipe;

SELECT 
    e.Nome AS 'Nome da Equipe',
    p.Nome AS 'Nome do Jogador',
    j.Posicao AS 'Posição',
    p.Email AS 'Email',
    p.Telemovel AS 'Telemóvel'
FROM Equipe e
JOIN Jogador_Equipe je ON e.id_Equipe = je.id_Equipe
JOIN Jogador j ON je.id_Jogador = j.id_Jogador
JOIN Pessoa p ON j.idPessoa = p.idPessoa
ORDER BY e.Nome, p.Nome;


-- 2.1: Equipes e seus jogadores ordenados por nome da equipe;

SELECT 
    e.Nome AS 'Nome da Equipe',
    p.Nome AS 'Nome do Jogador',
    j.Posicao AS 'Posição',
    p.Email AS 'Email',
    p.Telemovel AS 'Telemóvel'
FROM Equipe e
JOIN Jogador_Equipe je ON e.id_Equipe = je.id_Equipe
JOIN Jogador j ON je.id_Jogador = j.id_Jogador
JOIN Pessoa p ON j.idPessoa = p.idPessoa
ORDER BY e.Nome, p.Nome;

-- 2.2: Equipes e seus treinadores ordenados por país da equipe;

SELECT 
    pa.Nome AS 'Nome do País',
    e.Nome AS 'Nome da Equipe',
    p.Nome AS 'Nome do Treinador',
    p.Email AS 'Email',
    p.Telemovel AS 'Telemóvel'
FROM Equipe e
JOIN Treinador t ON e.id_Treinador = t.id_Treinador
JOIN Pessoa p ON t.idPessoa = p.idPessoa
JOIN Pais pa ON e.id_Pais = pa.id_Pais
ORDER BY pa.Nome, e.Nome;

-- 3.1: Listar provas (Partidas) de um evento ordenadas pela data da partida;

SELECT 
    c.Nome AS 'Nome do Campeonato',
    p.id_Partida AS 'ID da Partida',
    p.Data_da_Partida AS 'Data da Partida',
    p.Total_Points AS 'Total de Pontos',
    e.Nome AS 'Nome do Estádio'
FROM Campeonato c
JOIN Partida p ON c.id_Campeonato = p.id_Campeonato
JOIN Estadio e ON p.id_Estadio = e.id_Estadio
ORDER BY p.Data_da_Partida;

-- 3.2: Listar provas (Partidas) de um evento ordenadas pela duração da partida;

SELECT 
    c.Nome AS 'Nome do Campeonato',
    p.id_Partida AS 'ID da Partida',
    p.Duracao_da_Partida AS 'Duração da Partida',
    p.Total_Points AS 'Total de Pontos',
    e.Nome AS 'Nome do Estádio'
FROM Campeonato c
JOIN Partida p ON c.id_Campeonato = p.id_Campeonato
JOIN Estadio e ON p.id_Estadio = e.id_Estadio
ORDER BY p.Duracao_da_Partida DESC;

-- 4.1: Classificações ordenadas pelo total de pontos;

SELECT 
    c.Nome AS 'Nome do Campeonato',
    p.id_Partida AS 'ID da Partida',
    e.Nome AS 'Nome da Equipe',
    p.Total_Points AS 'Total de Pontos'
FROM Campeonato c
JOIN Partida p ON c.id_Campeonato = p.id_Campeonato
JOIN Partida_Equipe pe ON p.id_Partida = pe.id_Partida
JOIN Equipe e ON pe.id_Equipe = e.id_Equipe
ORDER BY p.Total_Points DESC;

-- 4.2: Resultados em cada Torneio ordenados pela data da partida;

SELECT 
    c.Nome AS 'Nome do Campeonato',
    p.id_Partida AS 'ID da Partida',
    e.Nome AS 'Nome da Equipe',
    p.Total_Points AS 'Total de Pontos',
    p.Data_da_Partida AS 'Data da Partida'
FROM Campeonato c
JOIN Partida p ON c.id_Campeonato = p.id_Campeonato
JOIN Partida_Equipe pe ON p.id_Partida = pe.id_Partida
JOIN Equipe e ON pe.id_Equipe = e.id_Equipe
ORDER BY p.Data_da_Partida, e.Nome;


-- 5.1: Estatísticas dos participantes por prova (Partidas) agrupados por campeonato;

SELECT 
    c.Nome AS 'Nome do Campeonato',
    COUNT(DISTINCT je.id_Jogador) AS 'Número de Participantes',
    AVG(t.Participantes) AS 'Média de Participantes',
    MIN(t.Participantes) AS 'Mínimo de Participantes',
    MAX(t.Participantes) AS 'Máximo de Participantes',
    STDDEV(t.Participantes) AS 'Desvio Padrão de Participantes'
FROM Campeonato c
JOIN Partida p ON c.id_Campeonato = p.id_Campeonato
JOIN Partida_Equipe pe ON p.id_Partida = pe.id_Partida
JOIN (SELECT id_Equipe, COUNT(id_Jogador) AS Participantes FROM Jogador_Equipe GROUP BY id_Equipe) t ON pe.id_Equipe = t.id_Equipe
JOIN Jogador_Equipe je ON pe.id_Equipe = je.id_Equipe
GROUP BY c.Nome;

-- 5.2: Estatísticas dos participantes por prova (Partidas) agrupados por estádio;

SELECT 
    e.Nome AS 'Nome do Estádio',
    COUNT(DISTINCT je.id_Jogador) AS 'Número de Participantes',
    AVG(t.Participantes) AS 'Média de Participantes',
    MIN(t.Participantes) AS 'Mínimo de Participantes',
    MAX(t.Participantes) AS 'Máximo de Participantes',
    STDDEV(t.Participantes) AS 'Desvio Padrão de Participantes'
FROM Estadio e
JOIN Partida p ON e.id_Estadio = p.id_Estadio
JOIN Partida_Equipe pe ON p.id_Partida = pe.id_Partida
JOIN (SELECT id_Equipe, COUNT(id_Jogador) AS Participantes FROM Jogador_Equipe GROUP BY id_Equipe) t ON pe.id_Equipe = t.id_Equipe
JOIN Jogador_Equipe je ON pe.id_Equipe = je.id_Equipe
GROUP BY e.Nome;

-- 6: Resultados de cada Evento com ranking das equipas;

SELECT 
    p.id_Partida AS 'ID da Partida',
    e.Nome AS 'Nome da Equipe',
    p.Total_Points AS 'Total de Pontos',
    RANK() OVER (PARTITION BY p.id_Partida ORDER BY p.Total_Points DESC) AS 'Classificação'
FROM Partida p
JOIN Partida_Equipe pe ON p.id_Partida = pe.id_Partida
JOIN Equipe e ON pe.id_Equipe = e.id_Equipe
ORDER BY p.id_Partida, 'Classificação';


-- 7: Participantes individuais que não participaram em qualquer prova de equipas;

-- Participantes federados e profissionais (assumindo que os federados/profissionais são aqueles que estão na tabela Jogador mas não têm associação na tabela Jogador_Equipe)
SELECT 
    p.Nome AS 'Nome do Jogador',
    p.Email AS 'Email',
    p.Telemovel AS 'Telemóvel',
    j.Posicao AS 'Posição',
    'Federado/Profissional' AS 'Tipo de Participante'
FROM Jogador j
JOIN Pessoa p ON j.idPessoa = p.idPessoa
LEFT JOIN Jogador_Equipe je ON j.id_Jogador = je.id_Jogador
WHERE je.id_Equipe IS NULL
    AND p.idPessoa IN (
        SELECT DISTINCT idPessoa FROM Jogador)

UNION

-- Participantes casuais (amadores) (assumindo que os casuais são aqueles que não têm qualquer associação na tabela Jogador_Equipe e não estão em uma lista de federados/profissionais);
SELECT 
    p.Nome AS 'Nome do Jogador',
    p.Email AS 'Email',
    p.Telemovel AS 'Telemóvel',
    j.Posicao AS 'Posição',
    'Casual (Amador)' AS 'Tipo de Participante'
FROM Jogador j
JOIN Pessoa p ON j.idPessoa = p.idPessoa
LEFT JOIN Jogador_Equipe je ON j.id_Jogador = je.id_Jogador
WHERE je.id_Equipe IS NULL
    AND p.idPessoa NOT IN (
	SELECT DISTINCT idPessoa FROM Jogador);


-- 8: Elementos de uma equipa com identificação do role de cada elemento no Evento e respetiva características de cada elemento;

SELECT 
    e.Nome AS 'Nome da Equipe',
    p.Nome AS 'Nome do Jogador/Treinador',
    'Jogador' AS 'Role',
    j.Posicao AS 'Posição',
    j.Altura AS 'Altura',
    j.Peso AS 'Peso',
    p.Email AS 'Email',
    p.Telemovel AS 'Telemóvel'
FROM Equipe e
JOIN Jogador_Equipe je ON e.id_Equipe = je.id_Equipe
JOIN Jogador j ON je.id_Jogador = j.id_Jogador
JOIN Pessoa p ON j.idPessoa = p.idPessoa
UNION ALL
SELECT 
    e.Nome AS 'Nome da Equipe',
    p.Nome AS 'Nome do Jogador/Treinador',
    'Treinador' AS 'Role',
    NULL AS 'Posição',
    NULL AS 'Altura',
    NULL AS 'Peso',
    p.Email AS 'Email',
    p.Telemovel AS 'Telemóvel'
FROM Equipe e
JOIN Treinador t ON e.id_Treinador = t.id_Treinador
JOIN Pessoa p ON t.idPessoa = p.idPessoa
ORDER BY 
    'Nome da Equipe', 'Role', 'Nome do Jogador/Treinador';
    
-- 9: Top 5 das provas com maior número de participantes;

-- 10: Listar informações sobre partidas, incluindo detalhes sobre estádios e equipes;

SELECT 
    p.id_Partida AS 'ID da Partida',
    p.Data_da_Partida AS 'Data da Partida',
    e.Nome AS 'Nome da Equipe',
    es.Nome AS 'Nome do Estádio',
    es.Localizacao AS 'Localização do Estádio'
FROM Partida p
JOIN Partida_Equipe pe ON p.id_Partida = pe.id_Partida
JOIN Equipe e ON pe.id_Equipe = e.id_Equipe
JOIN Estadio es ON p.id_Estadio = es.id_Estadio
ORDER BY p.Data_da_Partida DESC, e.Nome;

-- 11: Listar informações sobre partidas, incluindo detalhes sobre estádios e equipes, com condições;

SELECT 
    p.id_Partida AS 'ID da Partida',
    p.Data_da_Partida AS 'Data da Partida',
    e.Nome AS 'Nome da Equipe',
    es.Nome AS 'Nome do Estádio',
    es.Localizacao AS 'Localização do Estádio',
    COUNT(j.id_Jogador) AS 'Número de Jogadores'
FROM Partida p
JOIN Partida_Equipe pe ON p.id_Partida = pe.id_Partida
JOIN Equipe e ON pe.id_Equipe = e.id_Equipe
JOIN Estadio es ON p.id_Estadio = es.id_Estadio
JOIN Jogador_Equipe je ON e.id_Equipe = je.id_Equipe
JOIN Jogador j ON je.id_Jogador = j.id_Jogador
WHERE es.Localizacao = 'São Paulo' -- Condição WHERE
GROUP BY p.id_Partida, p.Data_da_Partida, e.Nome, es.Nome, es.Localizacao
HAVING COUNT(j.id_Jogador) > 5 -- Condição HAVING
ORDER BY p.Data_da_Partida DESC, e.Nome;

-- 12: Recursividade para listar jogadores e seus capitãe



-- 13: Listar equipes com a quantidade total de jogadores em cada equipe;

SELECT 
    e.id_Equipe AS 'ID da Equipe',
    e.Nome AS 'Nome da Equipe',
    (SELECT COUNT(je.id_Jogador)
     FROM Jogador_Equipe je
     WHERE je.id_Equipe = e.id_Equipe) AS 'Total de Jogadores'
FROM 
    Equipe e
ORDER BY 
    e.Nome;













