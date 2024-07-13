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

-- 2.1. Critério II: Lista de Equipas, seus Atletas e onde ele Morra
SELECT 
    Equipa.NomeEquipa AS "Nome da Equipa",
    Atleta.Nome AS "Nome do Atleta",
    Pessoa.Cidade AS Nacionalidade
FROM Equipa
JOIN Atleta ON Equipa.IdEquipa = Atleta.IdEquipa
JOIN Pessoa ON Atleta.IdPessoa = Pessoa.IdPessoa
ORDER BY Equipa.NomeEquipa, Atleta.Nome, Pessoa.Cidade;

-- 3.1. Critério I: Provas do Evento
SELECT 
    Nome AS NomeEvento,
    Jornada,
    Hora
FROM Evento
ORDER BY Nome;

-- 3.1. Critério II: Lista de Provas do Evento (LEFT JOIN)
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

-- 4.1. Critério II: Classificações utilizando (RIGHT JOIN)
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
    AVG(Estadio.Capacidade) AS "Media de Publico",
    MIN(Estadio.Capacidade) AS "Minimo de Publico",
    MAX(Estadio.Capacidade) AS "Maximo de Publico"
FROM Evento
JOIN Estadio ON Evento.IdEstadio = Estadio.IdEstadio
GROUP BY Evento.Nome, Estadio.Nome
ORDER BY Evento.Nome;

-- 5.2. Critério II: Media de idade dos Atletas

SELECT 
    (SELECT AVG(YEAR(CURDATE()) - YEAR(FichaTecnica.DataNascimento)) 
     FROM Atleta 
     JOIN FichaTecnica ON Atleta.IdPessoa = FichaTecnica.IdPessoa) AS "Media de Idade",
    (SELECT MIN(YEAR(CURDATE()) - YEAR(FichaTecnica.DataNascimento)) 
     FROM Atleta 
     JOIN FichaTecnica ON Atleta.IdPessoa = FichaTecnica.IdPessoa) AS "Minimo de Idade",
    (SELECT MAX(YEAR(CURDATE()) - YEAR(FichaTecnica.DataNascimento)) 
     FROM Atleta 
     JOIN FichaTecnica ON Atleta.IdPessoa = FichaTecnica.IdPessoa) AS "Maximo de Idade"
FROM (
    SELECT 
        Atleta.Nome AS NomeAtleta,
        YEAR(CURDATE()) - YEAR(FichaTecnica.DataNascimento) AS Idade
    FROM Atleta
    JOIN FichaTecnica ON Atleta.IdPessoa = FichaTecnica.IdPessoa
) AS Jogadores
GROUP BY NomeAtleta, Idade;

