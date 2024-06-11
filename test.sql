
-- Script para testar todas as funcionalidades desenvolvidas

-- Configurar o uso do banco de dados
USE Volei;

-- Teste para Views

-- Detalhes dos Jogadores
SELECT * FROM DetalhesJogador;

-- Detalhes dos Treinadores
SELECT * FROM DetalhesTreinador;

-- Times e seus jogadores
SELECT * FROM TimesJogadores;

-- Campeonatos e seus times participantes
SELECT * FROM CampeonatosTimes;

-- Partidas e detalhes dos times participantes
SELECT * FROM PartidasDetalhadas;

-- Teste para Stored Procedures

-- Adicionar um novo jogador
CALL AdicionarJogador('Teste Jogador', 'teste@exemplo.com', '999999999', 'Rua Teste', 'Bairro Teste', 'Cidade Teste', 1.90, 85, 'Central', 'Teste', 'Jogador', 'Brasileiro', 1, @novoJogadorId);
SELECT @novoJogadorId;

-- Verificar o novo jogador adicionado
SELECT * FROM Jogador WHERE idJogador = @novoJogadorId;

-- Adicionar um novo treinador
CALL AdicionarTreinador('Teste Treinador', 'treinador@exemplo.com', '888888888', 'Rua Treinador', 'Bairro Treinador', 'Cidade Treinador', 'Treinador', 'Teste', 'Brasileiro', 1, @novoTreinadorId);
SELECT @novoTreinadorId;

-- Verificar o novo treinador adicionado
SELECT * FROM Treinador WHERE idTreinador = @novoTreinadorId;

-- Adicionar um novo time
CALL AdicionarTime('Time Teste', @novoTimeId);
SELECT @novoTimeId;

-- Verificar o novo time adicionado
SELECT * FROM Time WHERE idTeam = @novoTimeId;

-- Adicionar uma nova partida
CALL AdicionarPartida(1, 100, 1, '2024-06-11', '01:30:00', @novaPartidaId);
SELECT @novaPartidaId;

-- Verificar a nova partida adicionada
SELECT * FROM Partida WHERE idPartida = @novaPartidaId;

-- Adicionar um novo patrocinador
CALL AdicionarPatrocinador('Patrocinador Teste', @novoPatrocinadorId);
SELECT @novoPatrocinadorId;

-- Verificar o novo patrocinador adicionado
SELECT * FROM Patrocinador WHERE idPatrocinador = @novoPatrocinadorId;

-- Inscrever um time em um campeonato
CALL InscreverTimeEmCampeonato(@novoTimeId, 1);

-- Verificar a inscrição do time no campeonato
SELECT * FROM TimeCampeonato WHERE idTeam = @novoTimeId AND idCampeonato = 1;

-- Registrar um time em uma partida
CALL RegistrarPartidaTime(@novaPartidaId, @novoTimeId);

-- Verificar o registro do time na partida
SELECT * FROM PartidaTime WHERE idPartida = @novaPartidaId AND idTeam = @novoTimeId;

-- Atualizar dados de uma pessoa
CALL AtualizarDadosPessoa(1, 'Pessoa Atualizada', 'atualizado@exemplo.com', '777777777', 'Nova Rua', 'Novo Bairro', 'Nova Cidade');

-- Verificar a atualização dos dados da pessoa
SELECT * FROM Pessoa WHERE idPessoa = 1;

-- Excluir um jogador
CALL ExcluirJogador(@novoJogadorId);

-- Verificar a exclusão do jogador
SELECT * FROM Jogador WHERE idJogador = @novoJogadorId;

-- Adicionar um novo país
CALL AdicionarPais('País Teste', @novoPaisId);
SELECT @novoPaisId;

-- Verificar o novo país adicionado
SELECT * FROM Pais WHERE idPais = @novoPaisId;

-- Adicionar um novo estádio
CALL AdicionarEstadio('Estádio Teste', 30000, 'Localização Teste', @novoEstadioId);
SELECT @novoEstadioId;

-- Verificar o novo estádio adicionado
SELECT * FROM Estadio WHERE idEstadio = @novoEstadioId;

-- Adicionar uma nova inscrição de time em campeonato
CALL AdicionarInscricaoTimeCampeonato(@novoTimeId, 1);

-- Verificar a nova inscrição de time em campeonato
SELECT * FROM TimeCampeonato WHERE idTeam = @novoTimeId AND idCampeonato = 1;

-- Adicionar um novo registro de time em partida
CALL AdicionarRegistroPartidaTime(@novaPartidaId, @novoTimeId);

-- Verificar o novo registro de time em partida
SELECT * FROM PartidaTime WHERE idPartida = @novaPartidaId AND idTeam = @novoTimeId;

-- Adicionar uma Ficha Tecnica
CALL AdicionarFichaTecnica(1.90, 85, 'Central', 'Nome', 'Sobrenome', 'Brasileiro', @novoIdJogador);
SELECT @novoIdJogador;

-- Verificar a nova Ficha Tecnica adicionada
SELECT * FROM FichaTecnica WHERE id_Jogador = @novoIdJogador;

-- Testes para sp_criar_prova
CALL sp_criar_prova(1, 'Prova Exemplo', '2024-06-11', 'Localização Exemplo', @idProva);
SELECT @idProva;

-- Verificar a nova prova criada
SELECT * FROM Prova WHERE idProva = @idProva;

-- Teste para sp_adicionar_participante
CALL sp_adicionar_participante(@idProva, @novoJogadorId, 'Atleta');

-- Verificar a participação do atleta na prova
SELECT * FROM ParticipacaoProvaAtleta WHERE idProva = @idProva AND idAtleta = @novoJogadorId;

-- Teste para sp_registar_resultado
CALL sp_registar_resultado(@idProva, @novoJogadorId, 12.34);

-- Verificar o resultado registrado
SELECT * FROM Resultado WHERE idProva = @idProva AND idParticipante = @novoJogadorId;

-- Teste para sp_remover_prova
CALL sp_remover_prova(@idProva, FALSE);

-- Verificar se a prova foi removida
SELECT * FROM Prova WHERE idProva = @idProva;

-- Teste para sp_clonar_prova
CALL sp_clonar_prova(@idProva, @novoIdProva);
SELECT @novoIdProva;

-- Verificar a prova clonada
SELECT * FROM Prova WHERE idProva = @novoIdProva;

-- Testes para Funções

-- Teste para MediaAlturaPorTime
SELECT MediaAlturaPorTime(1);

-- Teste para MediaPontosPorPartida
SELECT MediaPontosPorPartida();

-- Teste para ListarJogadoresPorNacionalidade
SELECT ListarJogadoresPorNacionalidade('Brasileiro');

-- Teste para ListarTimesPorCampeonato
SELECT ListarTimesPorCampeonato(1);

-- Testes para Triggers

-- Atualizar o resultado da partida
UPDATE Partida SET totalPoints = 15 WHERE idPartida = 1;

-- Verificar o log após atualização
SELECT * FROM tbl_logs WHERE operacao = 'ALTERACAO';

-- Remover a partida
DELETE FROM Partida WHERE idPartida = 1;

-- Verificar o log após remoção
SELECT * FROM tbl_logs WHERE operacao = 'REMOCAO';
