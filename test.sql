USE Volei;

-- Testar inserção de dados nas tabelas
SELECT * FROM Pais;
SELECT * FROM Entidade_Organizadora;
SELECT * FROM Estadio;
SELECT * FROM Resultado;
SELECT * FROM Pessoa;
SELECT * FROM FichaTecnica;
SELECT * FROM Treinador;
SELECT * FROM Equipa;
SELECT * FROM Atleta;
SELECT * FROM Evento;
SELECT * FROM Patrocinador;

-- Testar funções armazenadas
SELECT MediaAlturaEquipa(1) AS MediaAlturaEquipa1;
SELECT TotalAtletasEquipa(1) AS TotalAtletasEquipa1;

-- Teste dos Procedures
CALL ListarAtletasPorEquipa(1);
CALL MostrarMediaAlturaEquipa(1);
CALL ListarEventosPorEntidade(1);
CALL InserirNovoEstadio('Novo Estádio', 15000);
CALL InserirNovoTreinador('Novo Treinador', 'Nova Especialidade', 5, 1);
CALL PopularEstadio('Estádio Teste', 5000);
CALL PopularPessoa('Teste Pessoa', 'Cidade Teste', 'Rua Teste', 'Bairro Teste');
CALL PopularAtleta('Teste Atleta', 'Central', 99, FALSE, 1, 1);
CALL PopularTreinador('Teste Treinador', 'Especialidade Teste', 3, 1);
CALL PopularPatrocinador('Teste Patrocinador');
CALL LigarPatrocinadorEquipa('Teste Patrocinador', 1);
CALL LigarPatrocinadorEvento('Teste Patrocinador', 1);
CALL PopularEntidadeOrganizadora('Teste Entidade', 1);
CALL PopularFichaTecnica('2000-01-01', 1.90, 80, 1);

-- Testar views
SELECT * FROM EquipePorPais;
SELECT * FROM AtletasStatus;
SELECT * FROM MediaIdadeEquipa;
SELECT * FROM MediaAlturaDeTodasEquipa;

