
SELECT * FROM Pais; -- Tabela Pais
SELECT * FROM Entidade_Organizadora; -- Tabela Entidade_Organizadora
SELECT * FROM Estadio; -- Tabela Estadio
SELECT * FROM Resultado; -- Tabela Resultado
SELECT * FROM Evento; -- Tabela Evento
SELECT * FROM Pessoa; -- Tabela Pessoa
SELECT * FROM FichaTecnica; -- Tabela FichaTecnica
SELECT * FROM Treinador; -- Tabela Treinador
SELECT * FROM Atleta; -- Tabela Atleta
SELECT * FROM Equipa; -- Tabela Equipa
SELECT * FROM Participa; -- Tabela Participa
SELECT * FROM Patrocinador;  -- Tabela Patrocinador
SELECT * FROM Patrocina; -- Tabela Patrocina

-- View 1: EquipePorPais
SELECT * FROM EquipePorPais;

-- View 2: ListaPatrocinadores
SELECT * FROM ListaPatrocinadores;

-- View 3: AtletasStatus
SELECT * FROM AtletasStatus;

-- View 4: MediaIdadeEquipa
SELECT * FROM MediaIdadeEquipa;

-- View 5: Media Altura de todas as Equipa
SELECT * FROM MediaAlturaDeTodasEquipa;

-- Stored Function 1: Function MediaAlturaEquipa
SELECT MediaAlturaEquipa(1) AS "Media de Altura";
SELECT MediaAlturaEquipa(2) AS "Media de Altura da Equipe 2";
SELECT MediaAlturaEquipa(3) AS "Media de Altura da Equipe 3";

-- Stored Function 2: Function TotalAtletasEquipa
SELECT TotalAtletasEquipa(1) AS "Total de Atletas";

-- Stored Procedure 1: ListarAtletasPorEquipa
CALL ListarAtletasPorEquipa(1);

-- Stored Procedure 2: MostrarMediaAlturaEquipa
CALL MostrarMediaAlturaEquipa(1);

-- Stored Procedure 3: ListarEventosPorEntidade
CALL ListarEventosPorEntidade(1);

-- Stored Procedure 4: Verificar a Stored Procedure e dispara um Trigger
CALL InserirNovoEstadio('Novo Estadio', 30000);

-- Stored Procedure 4: Verificar a Stored Procedure e retorna mensagem de erro
CALL InserirNovoTreinador('Treinador Teste', 'Especialidade Teste', 10, 1);

-- Trigger 1: Tentar ADD um registro na tabela Atleta com um IdPessoa inexistente:
-- Isso aqui tem falha ID(999) nao Existe
INSERT INTO Atleta (Nome, Posicao, NumeroCamiseta, Capitao, IdPessoa, IdEquipa)
VALUES ('Teste', 'Central', 12, FALSE, 999, 1);

-- Trigger 1:
INSERT INTO Estadio (Nome, Capacidade) VALUES ('Estadio Teste Negativo', -50000); -- Tenta inserir capacidade Negativa
INSERT INTO Estadio (Nome, Capacidade) VALUES ('Estadio Teste Positivo', 50000); -- Tenta inserir capacidade Positiva