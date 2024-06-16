-- Desativando temporariamente o safe update mode
SET SQL_SAFE_UPDATES = 0;

USE Voleibol;

-- Testando Views
-- Verificando View AtletasNacionalidade
SELECT * FROM AtletasNacionalidade;

-- Verificando View EquipasDesempenho
SELECT * FROM EquipasDesempenho;

-- Verificando View ProvasEventos
SELECT * FROM ProvasEventos;

-- Verificando View ResultadosProvas
SELECT * FROM ResultadosProvas;

-- Verificando View AtletasEquipas
SELECT * FROM AtletasEquipas;

-- Testando Funções
-- Verificando Função TotalAtletasEquipa
SELECT TotalAtletasEquipa(1) AS Total_Atletas_Time_A;

-- Testando Procedures

-- Procedure 1: Adiciona um novo atleta à tabela Atleta.
CALL AddAtleta('Carlos Souza', '1988-03-05', 'Brasil');
SELECT * FROM Atleta WHERE nome_atleta = 'Carlos Souza';

-- Procedure 2: Adiciona uma nova equipa à tabela Equipa.
CALL AddEquipa('Time E', 90);
SELECT * FROM Equipa WHERE nome_equipa = 'Time E';

-- Procedure 3: Adiciona um novo evento à tabela Evento.
CALL AddEvento('Campeonato Nacional', 'Porto', '2024-08-05', '2024-08-15');
SELECT * FROM Evento WHERE nome_evento = 'Campeonato Nacional';

-- Procedure 4: Adiciona uma nova prova à tabela Prova.
CALL AddProva('Prova E', 'Porto', '2024-08-06', '14:00:00', '03:00:00', 5);
SELECT * FROM Prova WHERE nome_prova = 'Prova E';

-- Procedure 5: Adiciona um novo resultado à tabela Resultado.
CALL AddResultado('Quarto', 4);
SELECT * FROM Resultado WHERE classificacao = 'Quarto';

-- Procedure 6: Cria uma nova prova/evento em um evento determinado.
CALL sp_criar_prova('Prova F', 'Madrid', '2024-09-05', '12:00:00', '01:30:00', 3, 1);
SELECT * FROM Prova WHERE nome_prova = 'Prova F';

-- Procedure 7: Adiciona um atleta à prova/evento.
CALL sp_adicionar_participante(1, 1);
SELECT * FROM AtletaEquipa WHERE IdAtleta = 1 AND IdEquipa = (SELECT IdEquipa FROM Prova WHERE IdProva = 1);

-- Procedure 8: Registra o resultado de um participante na prova/evento.
CALL sp_registar_resultado(1, 1, 'Primeiro', 1);
SELECT * FROM ProvaResultado WHERE IdProva = 1;

-- Procedure 9: Remove uma prova/evento.
CALL sp_remover_prova(2, TRUE);
SELECT * FROM Prova WHERE IdProva = 2;

-- Procedure 10: Clona uma prova/evento.
CALL sp_clonar_prova(1);
SELECT * FROM Prova WHERE nome_prova LIKE '%Copia%';

-- Testando Triggers
-- Trigger 1: Verifica se a nacionalidade do atleta é válida antes de inserir.
INSERT INTO Atleta (nome_atleta, data_nasc, Nacionalidade) VALUES ('Teste Invalido', '1990-01-01', 'Invalido');

-- Trigger 2: Atualiza o campo total_provas no Evento após inserir uma nova Prova.
CALL AddProva('Prova G', 'Lisboa', '2024-07-10', '10:00:00', '02:00:00', 3);
SELECT total_provas FROM Evento WHERE IdEvento = 1;

-- Limpeza dos dados de teste
DELETE FROM Atleta WHERE nome_atleta IN ('Carlos Souza', 'Teste Invalido');
DELETE FROM Equipa WHERE nome_equipa = 'Time E';
DELETE FROM Evento WHERE nome_evento = 'Campeonato Nacional';
DELETE FROM Prova WHERE nome_prova IN ('Prova E', 'Prova F', 'Prova G', 'Prova F --- COPIA (a preencher)');
DELETE FROM Resultado WHERE classificacao = 'Quarto';

-- Reativando o safe update mode
SET SQL_SAFE_UPDATES = 1;
