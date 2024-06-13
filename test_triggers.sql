USE Volei;

-- Teste para o trigger de atualização de resultados
UPDATE Partida 
SET totalPoints = 25 
WHERE idPartida = 1;

-- Verifique a tabela de logs para confirmar a atualização
SELECT * FROM tbl_logs;

-- Teste para o trigger de remoção de resultados
DELETE FROM Partida 
WHERE idPartida = 2;

-- Verifique a tabela de logs para confirmar a remoção
SELECT * FROM tbl_logs;
