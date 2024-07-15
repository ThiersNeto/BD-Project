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
CALL PopularAtleta('Profissional', 'Teste Atleta', 'Central', 99, FALSE, 1, 1);
CALL PopularTreinador('Teste Treinador', 'Especialidade Teste', 3, 1);
CALL PopularPatrocinador('Teste Patrocinador');
CALL LigarPatrocinadorEquipa('Teste Patrocinador', 1);
CALL LigarPatrocinadorEvento('Teste Patrocinador', 1);
CALL PopularEntidadeOrganizadora('Teste Entidade', 1);
CALL PopularFichaTecnica('1990-01-01', 1.80, 75, 133);

-- Testar views
SELECT * FROM EquipePorPais;
SELECT * FROM AtletasStatus;
SELECT * FROM MediaIdadeEquipa;
SELECT * FROM MediaAlturaDeTodasEquipa;

-- Inserir dados na tabela Entidade_Organizadora
CALL PopularEntidadeOrganizadora('Federação Brasileira', 1);
CALL PopularEntidadeOrganizadora('Federação Portuguesa', 2);

-- Inserir dados na tabela Estadio
CALL PopularEstadio('RNG Arena', 50000);
CALL PopularEstadio('BLG Arena', 30000);

-- Inserir dados na tabela Resultado
INSERT INTO Resultado (Descricao) VALUES ('1º Lugar'), ('2º Lugar'), ('3º Lugar');

-- Inserir dados na tabela Pessoa
CALL PopularPessoa('João Silva', 'São Paulo', 'Rua A', 'Bairro B');
CALL PopularPessoa('Maria Oliveira', 'Lisboa', 'Rua C', 'Bairro D');

-- Inserir dados na tabela FichaTecnica
CALL PopularFichaTecnica('2003-01-01', 2.11, 75, 134);
CALL PopularFichaTecnica('2005-02-02', 1.70, 65, 135);

-- Inserir dados na tabela Atleta
CALL PopularAtleta('Profissional', 'João Silva', 'Atacante', 10, TRUE, 1, 1);
CALL PopularAtleta('Amador', 'Maria Oliveira', 'Defensor', 5, FALSE, 2, 2);

-- Inserir dados na tabela Treinador
CALL PopularTreinador('Carlos Souza', 'Técnico', 10, 1);
CALL PopularTreinador('Ana Santos', 'Assistente', 5, 2);

-- Inserir dados na tabela Patrocinador
CALL PopularPatrocinador('KABUM');
CALL PopularPatrocinador('FURIA');

-- Inserir dados na tabela Evento para teste do sp_clonar_prova
CALL sp_criar_prova('Evento Original', 'Prova Original', '1ª Jornada', '10:00:00', 'Volei Feminino', 1, 1, 1, 1);


-- Teste para sp_criar_prova
CALL sp_criar_prova(
    'Prova de Teste',
    'Evento de Teste',
    '1ª Jornada',
    '10:00:00',
    'Volei de Praia',
    1, 1, 1, 1
);

-- Verifica se a prova foi criada corretamente
SELECT * FROM Evento WHERE Nome = 'Prova de Teste';

-- Verifica se a prova foi removida corretamente
SELECT * FROM Evento WHERE IdEvento = 1;

-- Verifica se a prova foi removida corretamente
SELECT * FROM Evento WHERE IdEvento = 2;

-- Teste para sp_clonar_prova
CALL sp_clonar_prova(1);

-- Verifica se a prova foi clonada corretamente
SELECT * FROM Evento WHERE NomeEvento LIKE '%COPIA do Evento%';

