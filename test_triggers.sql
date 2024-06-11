USE volei;

-- Supondo que existe um registro na tabela Partida com idPartida = 1
-- Atualizar o resultado da partida
UPDATE Partida SET totalPoints = 15 WHERE idPartida = 1;

-- Verificar o log após atualização
SELECT * FROM tbl_logs WHERE operacao = 'ALTERACAO';


-- Supondo que existe um registro na tabela Partida com idPartida = 1
-- Remover a partida
DELETE FROM Partida WHERE idPartida = 1;

-- Verificar o log após remoção
SELECT * FROM tbl_logs WHERE operacao = 'REMOCAO';