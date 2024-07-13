-- Trigger 1: Tentar ADD um registro na tabela Atleta com um IdPessoa inexistente:
-- Isso aqui tem falha ID(999) nao Existe
INSERT INTO Atleta (Nome, Posicao, NumeroCamiseta, Capitao, IdPessoa, IdEquipa)
VALUES ('Teste', 'Central', 12, FALSE, 999, 1);

-- Trigger 1:
INSERT INTO Estadio (Nome, Capacidade) VALUES ('Estadio Teste Negativo', -50000); -- Tenta inserir capacidade Negativa
INSERT INTO Estadio (Nome, Capacidade) VALUES ('Estadio Teste Positivo', 50000); -- Tenta inserir capacidade Positiva