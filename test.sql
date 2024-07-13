
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

-- Stored Function 1: Function MediaAlturaEquipa
SELECT MediaAlturaEquipa(1) AS "Media de Altura";

-- Stored Function 2: Function TotalAtletasEquipa
SELECT TotalAtletasEquipa(1) AS "Total de Atletas";

-- Stored Procedure 1: ListarAtletasPorEquipa
CALL ListarAtletasPorEquipa(1);

-- Stored Procedure 2: MostrarMediaAlturaEquipa
CALL MostrarMediaAlturaEquipa(1);

-- Stored Procedure 3: ListarEventosPorEntidade
CALL ListarEventosPorEntidade(1);


