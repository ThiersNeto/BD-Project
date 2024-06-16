USE Voleibol;

-- 1. Consultar todos os atletas
SELECT * FROM Atleta;

-- 2. Consultar todos os atletas com suas fichas técnicas
SELECT Atleta.nome_atleta, FichaTecnica.curriculo, FichaTecnica.historico
FROM Atleta
JOIN AtletaFicha ON Atleta.IdAtleta = AtletaFicha.IdAtleta
JOIN FichaTecnica ON AtletaFicha.IdFicha = FichaTecnica.IdFicha;

-- 3. Consultar atletas e seus gêneros
SELECT Atleta.nome_atleta, Genero.descricao
FROM Atleta
JOIN AtletaGenero ON Atleta.IdAtleta = AtletaGenero.IdAtleta
JOIN Genero ON AtletaGenero.idGenero = Genero.idGenero;

-- 4. Consultar todos os eventos e os locais onde serão realizados
SELECT nome_evento, Local, data_inicio, data_fim FROM Evento;

-- 5. Consultar provas de um determinado evento
SELECT Evento.nome_evento, Prova.nome_prova, Prova.Local_prova, Prova.data, Prova.hora, Prova.duracao, Prova.rodadas
FROM Prova
JOIN Prova_Evento ON Prova.IdProva = Prova_Evento.IdProva
JOIN Evento ON Prova_Evento.IdEvento = Evento.IdEvento
WHERE Evento.nome_evento = 'Torneio Internacional';

-- 6. Consultar classificação e ranking de uma determinada prova
SELECT Prova.nome_prova, Resultado.classificacao, Resultado.ranking
FROM Prova
JOIN ProvaResultado ON Prova.IdProva = ProvaResultado.IdProva
JOIN Resultado ON ProvaResultado.IdResultado = Resultado.IdResultado
WHERE Prova.nome_prova = 'Prova A';

-- 7. Consultar todos os atletas de uma determinada equipa
SELECT Equipa.nome_equipa, Atleta.nome_atleta
FROM Equipa
JOIN AtletaEquipa ON Equipa.IdEquipa = AtletaEquipa.IdEquipa
JOIN Atleta ON AtletaEquipa.IdAtleta = Atleta.IdAtleta
WHERE Equipa.nome_equipa = 'Time A';

-- 8. Consultar a ficha técnica de um determinado atleta
SELECT Atleta.nome_atleta, FichaTecnica.curriculo, FichaTecnica.historico
FROM Atleta
JOIN AtletaFicha ON Atleta.IdAtleta = AtletaFicha.IdAtleta
JOIN FichaTecnica ON AtletaFicha.IdFicha = FichaTecnica.IdFicha
WHERE Atleta.nome_atleta = 'Carlos Souza';
