USE Voleibol;

-- Adicionar atletas
CALL AddAtleta('Carlos Souza', '1988-03-05', 'Brasil');
CALL AddAtleta('Ana Martins', '1992-07-10', 'Portugal');
CALL AddAtleta('Laura Mendes', '1995-11-22', 'Espanha');
CALL AddAtleta('Pedro Silva', '1989-09-15', 'Brasil');
CALL AddAtleta('Maria Garcia', '1993-05-18', 'Portugal');

-- Adicionar equipas
CALL AddEquipa('Time A', 85);
CALL AddEquipa('Time B', 90);
CALL AddEquipa('Time C', 80);

-- Adicionar eventos
CALL AddEvento('Torneio Internacional', 'Lisboa', '2024-07-01', '2024-07-10');
CALL AddEvento('Campeonato Nacional', 'Porto', '2024-08-05', '2024-08-15');

-- Adicionar provas
CALL AddProva('Prova A', 'Lisboa', '2024-07-02', '10:00:00', '02:00:00', 3);
CALL AddProva('Prova B', 'Porto', '2024-08-06', '14:00:00', '03:00:00', 5);

-- Associar provas aos eventos
-- Corrigir duplicação de entrada para chave primária
INSERT INTO Prova_Evento (IdProva, IdEvento) VALUES (1, 1);
INSERT INTO Prova_Evento (IdProva, IdEvento) VALUES (2, 2);

-- Adicionar resultados
CALL AddResultado('Primeiro', 1);
CALL AddResultado('Segundo', 2);
CALL AddResultado('Terceiro', 3);

-- Associar resultados às provas
-- Corrigir duplicação de entrada para chave primária
INSERT INTO ProvaResultado (IdProva, IdResultado) VALUES (1, 1);
INSERT INTO ProvaResultado (IdProva, IdResultado) VALUES (2, 2);

-- Registrar resultados para um participante em uma prova
-- Assegurar que os IDs de atleta e prova sejam válidos e correspondam às tabelas
CALL sp_registar_resultado(1, 1, 'Primeiro', 1);
CALL sp_registar_resultado(2, 2, 'Segundo', 2);

-- Consultar resultados das provas
SELECT * FROM ResultadosProvas;

-- Adicionar participantes às provas
-- Assegurar que os IDs de atleta e prova sejam válidos e correspondam às tabelas
CALL sp_adicionar_participante(1, 1);
CALL sp_adicionar_participante(2, 2);

-- Consultar participantes das provas
SELECT * FROM AtletaEquipa;

-- Clonar uma prova
CALL sp_clonar_prova(1);

-- Consultar provas clonadas
SELECT * FROM Prova WHERE nome_prova LIKE '%COPIA%';

-- Verificar a atualização de total_provas no Evento após inserção de prova
SELECT nome_evento, total_provas FROM Evento WHERE IdEvento = 1;

-- Consultar novamente as provas após a remoção
SELECT * FROM Prova;
