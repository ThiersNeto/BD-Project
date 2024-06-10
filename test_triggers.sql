-- Trigger para monitorar alterações nos resultados

DELIMITER //

CREATE TRIGGER result_change
AFTER UPDATE ON Partida_Equipe
FOR EACH ROW
BEGIN
    INSERT INTO tbl_logs (
        DataHora,
        idAtleta,
        idEquipe,
        idProva,
        ResultadoAnterior,
        NovoResultado,
        Classificacao,
        Operacao
    ) VALUES (
        NOW(),
        NULL,
        NEW.id_Equipe,
        NEW.id_Partida,
        OLD.Total_Points, -- Verifique se esta coluna existe na sua tabela
        NEW.Total_Points, -- Verifique se esta coluna existe na sua tabela
        'Classificação a ser definida', -- Substitua pela lógica de classificação adequada
        'UPDATE'
    );
END //

DELIMITER ;

-- Trigger para monitorar remoção de resultados

DELIMITER //

CREATE TRIGGER result_delete
AFTER DELETE ON Partida_Equipe
FOR EACH ROW
BEGIN
    INSERT INTO tbl_logs (
        DataHora,
        idAtleta,
        idEquipe,
        idProva,
        ResultadoAnterior,
        NovoResultado,
        Classificacao,
        Operacao
    ) VALUES (
        NOW(),
        NULL,
        OLD.id_Equipe,
        OLD.id_Partida,
        OLD.Total_Points, -- Verifique se esta coluna existe na sua tabela
        NULL,
        'Classificação a ser definida', -- Substitua pela lógica de classificação adequada
        'DELETE'
    );
END //

DELIMITER ;
