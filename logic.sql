USE voleibd;

-- Views

-- View 1: Listar todas as pessoas e suas informações básicas
CREATE VIEW Pessoas AS
SELECT idPessoa, Nome, Email, Telemovel, Rua, Bairro, Cidade, Genero, Data_Nascimento
FROM Pessoa;

-- View 2: Listar todos os jogadores com informações detalhadas
CREATE VIEW Jogadores AS
SELECT j.id_Jogador, p.Nome, j.Altura, j.Peso, j.Posicao, 
(SELECT p2.Nome FROM Jogador j2 JOIN Pessoa p2 ON j2.idPessoa = p2.idPessoa WHERE j2.id_Jogador = j.Capitao) AS Capitao
FROM Jogador j
JOIN Pessoa p ON j.idPessoa = p.idPessoa;

-- View 3: Listar todas as equipes e seus treinadores
CREATE VIEW Equipes AS
SELECT e.id_Equipe, e.Nome AS "Nome da Equipe", p.Nome AS "Nome do Treinador"
FROM Equipe e
JOIN Treinador t ON e.id_Treinador = t.id_Treinador
JOIN Pessoa p ON t.idPessoa = p.idPessoa;

-- View 4: Listar todas as partidas e os estádios onde ocorreram
CREATE VIEW Partidas AS
SELECT p.id_Partida, p.Total_Points, p.Rodada, p.Data_da_Partida, p.Duracao_da_Partida, e.Nome AS "Nome do Estadio"
FROM Partida p
JOIN Estadio e ON p.id_Estadio = e.id_Estadio;

-- View 5: Listar todos os campeonatos e os países onde são realizados
CREATE VIEW Campeonatos AS
SELECT c.id_Campeonato, c.Nome, c.Ano, c.Titulo, p.Nome AS "Nome do Pais"
FROM Campeonato c
JOIN Pais p ON c.id_Pais = p.id_Pais;

-- View 6: Listar jogadores de cada equipe
CREATE VIEW Jogadores_Por_Equipe AS
SELECT e.Nome AS "Nome da Equipe", p.Nome AS "Nome do Jogador", j.Posicao
FROM Jogador j
JOIN Pessoa p ON j.idPessoa = p.idPessoa
JOIN Jogador_Equipe je ON j.id_Jogador = je.id_Jogador
JOIN Equipe e ON je.id_Equipe = e.id_Equipe;

-- View 7: Listar todos os patrocinadores com seus países
CREATE VIEW Patrocinadores AS
SELECT pa.id_Patrocinador, pa.Nome AS "Nome do Patrocinador", p.Nome AS "Nome do Pais"
FROM Patrocinador pa
JOIN Pais p ON pa.id_Pais = p.id_Pais;

-- View 8: Listar todas as equipes com seus patrocinadores
CREATE VIEW Equipes_Patrocinadores AS
SELECT e.id_Equipe, e.Nome AS "Nome da Equipe", pa.Nome AS "Nome do Patrocinador"
FROM Equipe e
JOIN Patrocinador pa ON e.id_Patrocinador = pa.id_Patrocinador;

-- View 9: Lista campeonatos e as equipes que participaram
CREATE VIEW Campeonatos_Equipes AS
SELECT c.id_Campeonato, c.Nome AS NomeCampeonato, c.Ano, e.Nome AS NomeEquipe
FROM Campeonato c
JOIN Equipe e ON c.id_Campeonato = e.id_Campeonato;

-- View 10: Lista todos os estádios e as partidas que ocorreram neles
CREATE VIEW Estadios_Partidas AS
SELECT es.id_Estadio, es.Nome AS NomeEstadio, es.Capacidade, es.Localizacao, p.id_Partida, p.Data_da_Partida, p.Rodada
FROM Estadio es
JOIN Partida p ON es.id_Estadio = p.id_Estadio;

-- View 11: Lista treinadores e as equipes que eles treinam
CREATE VIEW Treinadores_Equipes AS
SELECT t.id_Treinador, p.Nome AS NomeTreinador, e.Nome AS NomeEquipe
FROM Treinador t
JOIN Equipe e ON t.id_Treinador = e.id_Treinador
JOIN Pessoa p ON t.idPessoa = p.idPessoa;

-- Stored Functions

-- Stored Function 1: Obtem o número total de jogadores em uma equipe
DELIMITER //

CREATE FUNCTION Total_de_Jogadores_Equipe(equipe_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_jogadores INT;
    SELECT COUNT(*) INTO total_jogadores
    FROM Jogador_Equipe
    WHERE id_Equipe = equipe_id;
    RETURN total_jogadores;
END //

DELIMITER ;

-- Stored Function 2: Obtem o nome do treinador de uma equipe
DELIMITER //

CREATE FUNCTION Nome_Treinador(equipe_id INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE nome_treinador VARCHAR(100);
    SELECT p.Nome INTO nome_treinador
    FROM Equipe e
    JOIN Treinador t ON e.id_Treinador = t.id_Treinador
    JOIN Pessoa p ON t.idPessoa = p.idPessoa
    WHERE e.id_Equipe = equipe_id;
    RETURN nome_treinador;
END //

DELIMITER ;

-- Stored Function 3: Calcular a pontuação total de uma equipe em todas as partidas
DELIMITER //

CREATE FUNCTION Pontuacao_Total_Equipe(equipe_id INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_pontos INT;
    SELECT SUM(p.Total_Points) INTO total_pontos
    FROM Partida p
    JOIN Partida_Equipe pe ON p.id_Partida = pe.id_Partida
    WHERE pe.id_Equipe = equipe_id;
    RETURN total_pontos;
END //

DELIMITER ;

-- Stored Function 4: Calcular a capacidade total dos estádios de um país
DELIMITER //

CREATE FUNCTION Capacidade_Estadios(paisID INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE totalCapacidade INT;
    SELECT SUM(es.Capacidade) INTO totalCapacidade
    FROM Estadio es
    JOIN Pais p ON es.Localizacao = p.Nome
    WHERE p.id_Pais = paisID;
    RETURN totalCapacidade;
END //

DELIMITER ;

-- Stored Function 5: Obtem o nome do campeonato em que uma equipe está inscrita
DELIMITER //

CREATE FUNCTION Nome_Campeonato_Equipe(equipeID INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE nomeCampeonato VARCHAR(100);
    SELECT c.Nome INTO nomeCampeonato
    FROM Equipe e
    JOIN Campeonato c ON e.id_Campeonato = c.id_Campeonato
    WHERE e.id_Equipe = equipeID;
    RETURN nomeCampeonato;
END //

DELIMITER ;

-- Stored Function 6: Obtem o nome do país da equipe
DELIMITER //

CREATE FUNCTION Nome_Equipe(jogadorID INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE nome VARCHAR(100);
    SELECT p.Nome INTO nome
    FROM Jogador_Equipe je
    JOIN Equipe e ON je.id_Equipe = e.id_Equipe
    JOIN Pais p ON e.id_Pais = p.id_Pais
    WHERE je.id_Jogador = jogadorID;
    RETURN nome;
END //

DELIMITER ;

-- Stored Function 7: Obtem o nome do país do jogador
DELIMITER //

CREATE FUNCTION Pais_Jogador(jogadorID INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE nome VARCHAR(100);
    SELECT p.Nome INTO nome
    FROM Pessoa pe
    JOIN Jogador j ON pe.idPessoa = j.idPessoa
    JOIN Pais p ON pe.id_Pais = p.id_Pais
    WHERE j.id_Jogador = jogadorID;
    RETURN nome;
END //

DELIMITER ;

-- Stored Function 8: Obtem o nome do jogador
DELIMITER //

CREATE FUNCTION Nome_Jogador(jogadorID INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE nome VARCHAR(100);
    SELECT p.Nome INTO nome
    FROM Jogador j
    JOIN Pessoa p ON j.idPessoa = p.idPessoa
    WHERE j.id_Jogador = jogadorID;
    RETURN nome;
END //

DELIMITER ;

-- Stored Function 9: Obtem o nome do campeonato
DELIMITER //

CREATE FUNCTION Nome_Campeonato(jogadorID INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE nome VARCHAR(100);
    SELECT c.Nome INTO nome
    FROM Jogador_Equipe je
    JOIN Equipe e ON je.id_Equipe = e.id_Equipe
    JOIN Campeonato c ON e.id_Campeonato = c.id_Campeonato
    WHERE je.id_Jogador = jogadorID;
    RETURN nome;
END //

DELIMITER ;

-- Stored Function 10: Obtem todos os dados pessoais do Jogador
DELIMITER //

CREATE FUNCTION Dados_Jogador(jogadorID INT)
RETURNS VARCHAR(500)
DETERMINISTIC
BEGIN
    DECLARE dadosPessoais VARCHAR(500);
    SELECT CONCAT(
        'Nome: ', p.Nome, ', ',
        'Email: ', p.Email, ', ',
        'Telemovel: ', p.Telemovel, ', ',
        'Rua: ', p.Rua, ', ',
        'Bairro: ', p.Bairro, ', ',
        'Cidade: ', p.Cidade, ', ',
        'Altura: ', j.Altura, ', ',
        'Peso: ', j.Peso, ', ',
        'Posição: ', j.Posicao, ', ',
        'Capitão: ', (SELECT p2.Nome FROM Jogador j2 JOIN Pessoa p2 ON j2.idPessoa = p2.idPessoa WHERE j2.id_Jogador = j.Capitao)
    ) INTO dadosPessoais
    FROM Jogador j
    JOIN Pessoa p ON j.idPessoa = p.idPessoa
    WHERE j.id_Jogador = jogadorID;
    RETURN dadosPessoais;
END //

DELIMITER ;

-- Stored Function 11: Obtem todos os dados pessoais do Treinador
DELIMITER //

CREATE FUNCTION Dados_Treinador(treinadorID INT)
RETURNS VARCHAR(500)
DETERMINISTIC
BEGIN
    DECLARE dadosPessoais VARCHAR(500);
    SELECT CONCAT(
        'Nome: ', p.Nome, ', ',
        'Email: ', p.Email, ', ',
        'Telemovel: ', p.Telemovel, ', ',
        'Rua: ', p.Rua, ', ',
        'Bairro: ', p.Bairro, ', ',
        'Cidade: ', p.Cidade
    ) INTO dadosPessoais
    FROM Treinador t
    JOIN Pessoa p ON t.idPessoa = p.idPessoa
    WHERE t.id_Treinador = treinadorID;
    RETURN dadosPessoais;
END //

DELIMITER ;

-- Stored Procedures

-- Stored Procedure 1: Adicionar um novo jogador
DELIMITER //

CREATE PROCEDURE ADDJogador(
    IN nome VARCHAR(100),
    IN email VARCHAR(100),
    IN telemovel VARCHAR(15),
    IN rua VARCHAR(100),
    IN bairro VARCHAR(100),
    IN cidade VARCHAR(100),
    IN altura DECIMAL(4,2),
    IN peso DECIMAL(5,2),
    IN posicao VARCHAR(50),
    IN genero VARCHAR(10),
    IN data_nascimento DATE
)
BEGIN
    DECLARE idPessoa INT;
    INSERT INTO Pessoa (Nome, Email, Telemovel, Rua, Bairro, Cidade, Genero, Data_Nascimento)
    VALUES (nome, email, telemovel, rua, bairro, cidade, genero, data_nascimento);
    SET idPessoa = LAST_INSERT_ID();
    INSERT INTO Jogador (idPessoa, Altura, Peso, Posicao)
    VALUES (idPessoa, altura, peso, posicao);
END //

DELIMITER ;

-- Stored Procedure 2: Adicionar um novo Treinador
DELIMITER //

CREATE PROCEDURE ADDTreinador(
    IN nome VARCHAR(100),
    IN email VARCHAR(100),
    IN telemovel VARCHAR(15),
    IN rua VARCHAR(100),
    IN bairro VARCHAR(100),
    IN cidade VARCHAR(100),
    IN genero VARCHAR(10),
    IN data_nascimento DATE
)
BEGIN
    DECLARE idPessoa INT;
    INSERT INTO Pessoa (Nome, Email, Telemovel, Rua, Bairro, Cidade, Genero, Data_Nascimento)
    VALUES (nome, email, telemovel, rua, bairro, cidade, genero, data_nascimento);
    SET idPessoa = LAST_INSERT_ID();
    INSERT INTO Treinador (idPessoa)
    VALUES (idPessoa);
END //

DELIMITER ;

-- Stored Procedure 3: Adicionar uma nova Equipe
DELIMITER //

CREATE PROCEDURE ADDEquipe(
    IN nome VARCHAR(100),
    IN idPatrocinador INT,
    IN idCampeonato INT,
    IN idPais INT,
    IN idTreinador INT
)
BEGIN
    INSERT INTO Equipe (Nome, id_Patrocinador, id_Campeonato, id_Pais, id_Treinador)
    VALUES (nome, idPatrocinador, idCampeonato, idPais, idTreinador);
END //

DELIMITER ;

-- Stored Procedure 4: Registrar resultado de uma partida
DELIMITER //

CREATE PROCEDURE Registar_Resultado(
    IN idPartida INT,
    IN idEquipe INT,
    IN pontos INT
)
BEGIN
    INSERT INTO Partida_Equipe (id_Partida, id_Equipe, Total_Points)
    VALUES (idPartida, idEquipe, pontos);
END //

DELIMITER ;

-- Stored Procedure 5: Atualizar informações de um jogador
DELIMITER //

CREATE PROCEDURE Atualizar_Jogador(
    IN jogadorID INT,
    IN nome VARCHAR(100),
    IN email VARCHAR(100),
    IN telemovel VARCHAR(15),
    IN rua VARCHAR(100),
    IN bairro VARCHAR(100),
    IN cidade VARCHAR(100),
    IN altura DECIMAL(4,2),
    IN peso DECIMAL(5,2),
    IN posicao VARCHAR(50),
    IN genero VARCHAR(10),
    IN data_nascimento DATE
)
BEGIN
    DECLARE idPessoa INT;
    SELECT idPessoa INTO idPessoa FROM Jogador WHERE id_Jogador = jogadorID;
    UPDATE Pessoa
    SET Nome = nome, Email = email, Telemovel = telemovel, Rua = rua, Bairro = bairro, Cidade = cidade, Genero = genero, Data_Nascimento = data_nascimento
    WHERE idPessoa = idPessoa;
    UPDATE Jogador
    SET Altura = altura, Peso = peso, Posicao = posicao
    WHERE id_Jogador = jogadorID;
END //

DELIMITER ;

-- Stored Procedure 6: Adicionar um novo patrocinador
DELIMITER //

CREATE PROCEDURE ADDPatrocinador(
    IN nome VARCHAR(100),
    IN idPais INT
)
BEGIN
    INSERT INTO Patrocinador (Nome, id_Pais)
    VALUES (nome, idPais);
END //

DELIMITER ;

-- Stored Procedure 7: Adicionar um novo Estadio
DELIMITER //

CREATE PROCEDURE ADDEstadio(
    IN nome VARCHAR(100),
    IN capacidade INT,
    IN localizacao VARCHAR(100)
)
BEGIN
    INSERT INTO Estadio (Nome, Capacidade, Localizacao)
    VALUES (nome, capacidade, localizacao);
END //

DELIMITER ;

-- Stored Procedure 8: Adicionar uma nova Partida
DELIMITER //

CREATE PROCEDURE ADDPartida(
    IN totalPoints INT,
    IN rodada INT,
    IN dataPartida DATE,
    IN duracaoPartida TIME,
    IN idEstadio INT,
    IN idCampeonato INT
)
BEGIN
    INSERT INTO Partida (Total_Points, Rodada, Data_da_Partida, Duracao_da_Partida, id_Estadio, id_Campeonato)
    VALUES (totalPoints, rodada, dataPartida, duracaoPartida, idEstadio, idCampeonato);
END //

DELIMITER ;

-- Stored Procedure 9: Remover um jogador
DELIMITER //

CREATE PROCEDURE Remover_Jogador(
    IN jogadorID INT
)
BEGIN
    DECLARE idPessoa INT;
    SELECT idPessoa INTO idPessoa FROM Jogador WHERE id_Jogador = jogadorID;
    DELETE FROM Jogador WHERE id_Jogador = jogadorID;
    DELETE FROM Pessoa WHERE idPessoa = idPessoa;
END //

DELIMITER ;

