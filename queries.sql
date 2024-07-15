USE Volei;

-- 1.1. Critério I: Lista o nome dos Atleta
SELECT 
    Nome AS "Nome dos Atletas"
FROM Atleta;

-- 1.2. Critério II: Lista de Participantes por Posição
SELECT 
    Nome AS "Nome dos Atletas",
    Posicao
FROM Atleta
ORDER BY Posicao;

-- 2.1. Critério I: Equipas e seus Atletas por nome da Equipa
SELECT 
    Equipa.NomeEquipa,
    Atleta.Nome AS NomeAtleta
FROM Equipa
JOIN Atleta ON Equipa.IdEquipa = Atleta.IdEquipa
ORDER BY Equipa.NomeEquipa, Atleta.Nome;

-- 2.2. Critério II: Lista de Equipas, seus Atletas e onde ele Morra
SELECT 
    Equipa.NomeEquipa AS "Nome da Equipa",
    Atleta.Nome AS "Nome do Atleta",
    Pessoa.Cidade AS Morada
FROM Equipa
JOIN Atleta ON Equipa.IdEquipa = Atleta.IdEquipa
JOIN Pessoa ON Atleta.IdPessoa = Pessoa.IdPessoa
ORDER BY Equipa.NomeEquipa, Atleta.Nome, Pessoa.Cidade;

-- 3.1. Critério I: Provas do Evento
SELECT 
    Nome AS "Nome do Evento",
    Jornada,
    Hora
FROM Evento
ORDER BY Nome;

-- 3.2. Critério II: Lista de Provas do Evento (LEFT JOIN)
SELECT 
    Evento.Nome AS NomeEvento,
    Evento.Jornada,
    Evento.Hora,
    Estadio.Nome AS NomeEstadio
FROM Evento
LEFT JOIN Estadio ON Evento.IdEstadio = Estadio.IdEstadio
ORDER BY Evento.Nome;

-- 4.1. Critério I: Classificações
SELECT 
    Evento.Nome AS "Nome do Evento",
    Resultado.Descricao AS "Resultado"
FROM Evento
JOIN Resultado ON Evento.IdResultado = Resultado.IdResultado
ORDER BY Evento.Nome;

-- 4.2. Critério II: Classificações utilizando (RIGHT JOIN)
SELECT 
    Evento.Nome AS "Nome do Evento",
    Resultado.Descricao AS "Resultado"
FROM Evento
RIGHT JOIN Resultado ON Evento.IdResultado = Resultado.IdResultado
ORDER BY Evento.Nome;

-- 5.1. Critério I: Media de Publico nos estadios
SELECT 
    Evento.Nome AS NomeEvento,
    Estadio.Nome AS NomeEstadio,
    Estadio.Capacidade AS CapacidadePublico,
    AVG(Estadio.Capacidade) OVER() AS "Media de Publico",
    MIN(Estadio.Capacidade) OVER() AS "Minimo de Publico",
    MAX(Estadio.Capacidade) OVER() AS "Maximo de Publico"
FROM Evento
JOIN Estadio ON Evento.IdEstadio = Estadio.IdEstadio
ORDER BY Evento.Nome;

-- 5.2. Critério II: Media de idade dos Atletas
SELECT 
    AVG(YEAR(CURDATE()) - YEAR(FichaTecnica.DataNascimento)) AS "Media de Idade",
    MIN(YEAR(CURDATE()) - YEAR(FichaTecnica.DataNascimento)) AS "Minimo de Idade",
    MAX(YEAR(CURDATE()) - YEAR(FichaTecnica.DataNascimento)) AS "Maximo de Idade"
FROM Atleta
JOIN FichaTecnica ON Atleta.IdPessoa = FichaTecnica.IdPessoa;

-- 6.0. List o Ranking das Equipas

SELECT 
    Evento.Nome AS NomeEvento,
    Evento.Jornada,
    Evento.Hora,
    Equipa.NomeEquipa AS NomeDaEquipa,
    Resultado.Descricao AS Classificacao
FROM Evento
JOIN Equipa ON Evento.IdEvento = Equipa.IdEquipa
JOIN Resultado ON Evento.IdResultado = Resultado.IdResultado
ORDER BY 
    Evento.Nome, Resultado.Descricao;

-- 7.0. Lista de participantes individuais que não participaram em qualquer prova de equipas
SELECT 
    Atleta.Nome AS "Nome do Participante",
    Atleta.TipoParticipante AS "Tipo de Participante"
FROM Atleta
LEFT JOIN Equipa ON Atleta.IdEquipa = Equipa.IdEquipa
WHERE Atleta.IdEquipa IS NULL
ORDER BY Atleta.TipoParticipante, Atleta.Nome;

-- 8.0. List membros de uma Equipa com seus papéis e características em Eventos

SELECT 
    Equipa.NomeEquipa AS "Nome da Equipa",
    Atleta.Nome AS "Nome do Atleta",
    'Atleta' AS "Role",
    Atleta.Posicao AS "Posição",
    FichaTecnica.DataNascimento AS "Data de Nascimento",
    FichaTecnica.Altura AS "Altura",
    FichaTecnica.Peso AS "Peso"
FROM Equipa
JOIN Atleta ON Equipa.IdEquipa = Atleta.IdEquipa
JOIN FichaTecnica ON Atleta.IdPessoa = FichaTecnica.IdPessoa

UNION

SELECT 
    Equipa.NomeEquipa AS "Nome da Equipa",
    Treinador.Nome AS "Nome do Treinador",
    'Treinador' AS "Role",
    Treinador.Especialidade AS "Especialidade",
    FichaTecnica.DataNascimento AS "Data de Nascimento",
    FichaTecnica.Altura AS "Altura",
    FichaTecnica.Peso AS "Peso"
FROM Equipa
JOIN Treinador ON Equipa.IdEquipa = Treinador.IdPessoa
JOIN FichaTecnica ON Treinador.IdPessoa = FichaTecnica.IdPessoa
WHERE Treinador.IdPessoa IN (SELECT IdPessoa FROM Atleta WHERE IdEquipa = Equipa.IdEquipa)
ORDER BY "Nome da Equipa", "Role", "Nome do Atleta";

-- 9.0. Top 5 Provas com MAIOR número de Participantes agrupadas por ano
WITH ParticipantesPorEvento AS (
    SELECT 
        Evento.IdEvento,
        Evento.Nome AS NomeEvento,
        YEAR(Evento.Hora) AS Ano,
        COUNT(Atleta.IdAtleta) AS NumeroDeParticipantes
    FROM Evento
    JOIN Atleta ON Evento.IdEvento = Atleta.IdEquipa
    JOIN FichaTecnica ON FichaTecnica.IdPessoa = Atleta.IdPessoa
    WHERE YEAR(Evento.Hora) BETWEEN YEAR(CURDATE()) - 3 AND YEAR(CURDATE())
    GROUP BY Evento.IdEvento, Evento.Nome, YEAR(Evento.Hora)
)

SELECT 
    NomeEvento,
    Ano,
    NumeroDeParticipantes
FROM ParticipantesPorEvento
ORDER BY NumeroDeParticipantes DESC
LIMIT 5;
