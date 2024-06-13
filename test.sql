USE Volei;

-- Testes para as funcionalidades desenvolvidas

-- Testar a adição de jogadores
CALL AdicionarJogador('Carlos Oliveira', 'carlos.oliveira@example.com', '555555555', 'Rua G', 'Bairro 7', 'Cidade Z', 1.90, 85, 'Central', 'Carlos', 'Oliveira', 'Brasileira', 1, 10, @novoJogadorId);

-- Verificar se o jogador foi adicionado corretamente
SELECT * FROM Jogador WHERE idJogador = @novoJogadorId;

-- Testar a adição de treinadores
CALL AdicionarTreinador('Beatriz Lima', 'beatriz.lima@example.com', '666666666', 'Rua H', 'Bairro 8', 'Cidade W', 'Beatriz', 'Lima', 'Portuguesa', 2, @novoTreinadorId);

-- Verificar se o treinador foi adicionado corretamente
SELECT * FROM Treinador WHERE idTreinador = @novoTreinadorId;

-- Testar a inscrição de times em campeonatos
CALL AdicionarInscricaoTimeCampeonato(1, 1);
CALL AdicionarInscricaoTimeCampeonato(2, 1);

-- Verificar se a inscrição foi adicionada corretamente
SELECT * FROM TimeCampeonato WHERE idCampeonato = 1;

-- Testar o registro de times em partidas
CALL AdicionarRegistroPartidaTime(1, 1);
CALL AdicionarRegistroPartidaTime(2, 2);

-- Verificar se o registro foi adicionado corretamente
SELECT * FROM PartidaTime WHERE idPartida = 1;

-- Testar a atualização dos dados de pessoa
CALL AtualizarDadosPessoa(1, 'João Silva', 'joao.silva@example.com', '123456789', 'Rua A', 'Bairro 1', 'Cidade X');

-- Verificar se os dados foram atualizados corretamente
SELECT * FROM Pessoa WHERE idPessoa = 1;

-- Testar a adição de ficha técnica
CALL AdicionarFichaTecnica(1.85, 80.0, 'Atacante', 'João', 'Silva', 'Brasileira', @novoIdJogador);

-- Verificar se a ficha técnica foi adicionada corretamente
SELECT * FROM FichaTecnica WHERE id_Jogador = @novoIdJogador;

-- Testar os resultados das queries
-- Query 2.1: Equipas que participam em um campeonato específico
SELECT 
    t.nome AS 'Nome da Equipa', 
    p.nome AS 'Nome do Jogador', 
    j.peso AS 'Peso', 
    c.titulo AS 'Campeonato'
FROM 
    Time t
JOIN JogadorTime jt ON t.idTeam = jt.idTeam
JOIN Jogador j ON jt.idJogador = j.idJogador
JOIN Pessoa p ON j.idPessoa = p.idPessoa
JOIN TimeCampeonato tc ON t.idTeam = tc.idTeam
JOIN Campeonato c ON tc.idCampeonato = c.idCampeonato
WHERE c.titulo = 'Campeonato Nacional';

-- Query 2.2: Equipas que têm jogadores com peso maior que 75kg
SELECT 
    t.nome AS 'Nome da Equipa', 
    p.nome AS 'Nome do Jogador', 
    j.peso AS 'Peso'
FROM 
    Time t
JOIN JogadorTime jt ON t.idTeam = jt.idTeam
JOIN Jogador j ON jt.idJogador = j.idJogador
JOIN Pessoa p ON j.idPessoa = p.idPessoa
WHERE j.peso > 75;

-- Query 8: Lista dos elementos de uma equipa com identificação do role de cada elemento na prova/evento e respetiva características de cada elemento
SELECT 
    t.nome AS 'Nome da Equipe',
    p.idPessoa AS 'ID do Participante',
    p.nome AS 'Nome do Participante',
    'Jogador' AS 'Papel',
    j.altura AS 'Altura',
    j.peso AS 'Peso',
    j.posicao AS 'Posição',
    j.nacionalidade AS 'Nacionalidade'
FROM Time t
JOIN JogadorTime jt ON t.idTeam = jt.idTeam
JOIN Jogador j ON jt.idJogador = j.idJogador
JOIN Pessoa p ON j.idPessoa = p.idPessoa
WHERE t.idTeam = 1
UNION ALL
SELECT 
    t.nome AS 'Nome da Equipe',
    p.idPessoa AS 'ID do Participante',
    p.nome AS 'Nome do Participante',
    'Treinador' AS 'Papel',
    NULL AS 'Altura',
    NULL AS 'Peso',
    NULL AS 'Posição',
    tr.nacionalidade AS 'Nacionalidade'
FROM Time t
JOIN TreinadorTime tt ON t.idTeam = tt.idTeam
JOIN Treinador tr ON tt.idTreinador = tr.idTreinador
JOIN Pessoa p ON tr.idPessoa = p.idPessoa
WHERE t.idTeam = 1;

-- Query 9: Top 5 Provas com maior número de participantes nos últimos três anos, com restrições de faixa etária e categoria
SELECT 
    YEAR(p.dataDaPartida) AS 'Ano',
    p.idPartida AS 'ID da Prova',
    (SELECT COUNT(jt.idJogador) 
     FROM JogadorTime jt
     WHERE jt.idTeam IN (SELECT pt.idTeam FROM PartidaTime pt WHERE pt.idPartida = p.idPartida)) AS 'Número de Participantes'
FROM Partida p
WHERE p.dataDaPartida >= DATE_SUB(CURDATE(), INTERVAL 3 YEAR)
GROUP BY YEAR(p.dataDaPartida), p.idPartida
HAVING 'Número de Participantes' > 0
ORDER BY 'Número de Participantes' DESC
LIMIT 5;

-- Query 10: Lista de partidas com informações sobre o Estádio, os Times Participantes e os Jogadores
SELECT 
    p.idPartida AS 'ID da Partida',
    e.nome AS 'Nome do Estádio',
    t.nome AS 'Nome do Time',
    j.idJogador AS 'ID do Jogador',
    ps.nome AS 'Nome do Jogador'
FROM Partida p
JOIN Estadio e ON p.idEstadio = e.idEstadio
JOIN PartidaTime pt ON p.idPartida = pt.idPartida
JOIN Time t ON pt.idTeam = t.idTeam
JOIN JogadorTime jt ON t.idTeam = jt.idTeam
JOIN Jogador j ON jt.idJogador = j.idJogador
JOIN Pessoa ps ON j.idPessoa = ps.idPessoa
ORDER BY p.idPartida, t.nome, j.idJogador;

-- Query 13: Times e número total de jogadores em cada time
SELECT 
    t.idTeam AS 'ID do Time',
    t.nome AS 'Nome do Time',
    (SELECT COUNT(jt.idJogador)
     FROM JogadorTime jt
     WHERE jt.idTeam = t.idTeam) AS 'Número de Jogadores'
FROM 
    Time t
ORDER BY 
    t.nome;
