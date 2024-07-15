
USE Volei;

-- Testes para Trigger 1: BeforeInsertAtleta
-- Tente inserir um atleta com uma IdPessoa que não existe na tabela Pessoa
INSERT INTO Atleta (TipoParticipante, Nome, Posicao, NumeroCamiseta, Capitao, IdPessoa, IdEquipa)
VALUES ('Federado', 'Carlos Silva', 'Levantador', 1, TRUE, 1, 1);

-- Verifique se a inserção foi bloqueada pelo trigger
SELECT * FROM Atleta WHERE Nome = 'Teste Invalido';

-- Insira uma pessoa válida
CALL PopularPessoa('Teste Valido', 'Cidade Teste', 'Rua Teste', 'Bairro Teste');


-- Testes para Trigger 2: BeforeInsertEstadio
-- Tente inserir um atleta com uma IdPessoa válida
INSERT INTO Atleta (TipoParticipante, Nome, Posicao, NumeroCamiseta, Capitao, IdPessoa, IdEquipa)
VALUES ('Profissional', 'Teste Valido', 'Atacante', 10, TRUE, @id_pessoa_valido, 1);

-- Verifique se a inserção foi bem-sucedida
SELECT * FROM Atleta WHERE Nome = 'Teste Valido';

-- Tente inserir um estádio com capacidade negativa
INSERT INTO Estadio (Nome, Capacidade) VALUES ('Estadio Invalido', -5000);

-- Verifique se a inserção foi bloqueada pelo trigger
SELECT * FROM Estadio WHERE Nome = 'Estadio Valido';

-- Tente inserir um estádio com capacidade válida
CALL PopularEstadio('Estadio Valido', 5000);

-- Verifique se a inserção foi bem-sucedida
SELECT * FROM Estadio WHERE Nome = 'Estadio Valido';