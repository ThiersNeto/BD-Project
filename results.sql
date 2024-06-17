USE Voleibol;

-- Limpar tabelas para testes
DELETE FROM Resultado WHERE IdResultado IN (1, 2, 3);
DELETE FROM Evento WHERE IdEvento = 1;

-- Adicionar resultados
CALL AddResultado('Primeiro Lugar', 1);
CALL AddResultado('Segundo Lugar', 2);
CALL AddResultado('Terceiro Lugar', 3);

-- Adicionar eventos e provas
CALL AddEvento('Torneio Internacional', 'Lisboa', '2024-07-01', '2024-07-10');
CALL AddProva('Prova Teste 1', 'Lisboa', '2024-07-03', '11:00:00', '02:00:00', 3);
CALL AddProva('Prova Teste 2', 'Porto', '2024-08-10', '14:00:00', '03:00:00', 5);


-- Verificar os resultados registrados
SELECT * FROM ProvaResultado;
SELECT P.nome_prova AS 'Nome da Prova', R.classificacao AS 'Classificação', R.ranking AS 'Ranking'
FROM Prova P
JOIN ProvaResultado PR ON P.IdProva = PR.IdProva
JOIN Resultado R ON PR.IdResultado = R.IdResultado;
