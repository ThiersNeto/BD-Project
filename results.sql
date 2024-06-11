-- Testes para Views
SELECT * FROM DetalhesJogador;
SELECT * FROM DetalhesTreinador;
SELECT * FROM TimesJogadores;
SELECT * FROM CampeonatosTimes;
SELECT * FROM PartidasDetalhadas;

-- Teste para AdicionarJogador
CALL AdicionarJogador('Nome Jogador', 'email@exemplo.com', '999999999', 'Rua Exemplo', 'Bairro Exemplo', 'Cidade Exemplo', 1.80, 75, 'Ponta', 'First', 'Last', 'Brasileiro', 1, @novoJogadorId);
SELECT @novoJogadorId;

-- Teste para AdicionarTreinador
CALL AdicionarTreinador('Nome Treinador', 'email@exemplo.com', '999999999', 'Rua Exemplo', 'Bairro Exemplo', 'Cidade Exemplo', 'First', 'Last', 'Brasileiro', 1, @novoTreinadorId);
SELECT @novoTreinadorId;

-- Teste para AdicionarTime
CALL AdicionarTime('Time Exemplo', @novoTimeId);
SELECT @novoTimeId;

-- Teste para AdicionarPartida
CALL AdicionarPartida(1, 100, 1, '2023-06-10', '02:00:00', @novaPartidaId);
SELECT @novaPartidaId;

-- Teste para AdicionarPatrocinador
CALL AdicionarPatrocinador('Patrocinador Exemplo', @novoPatrocinadorId);
SELECT @novoPatrocinadorId;

-- Teste para InscreverTimeEmCampeonato
CALL InscreverTimeEmCampeonato(1, 1);

-- Teste para RegistrarPartidaTime
CALL RegistrarPartidaTime(1, 1);

-- Teste para AtualizarDadosPessoa
CALL AtualizarDadosPessoa(1, 'Novo Nome', 'novoemail@exemplo.com', '888888888', 'Nova Rua', 'Novo Bairro', 'Nova Cidade');

-- Teste para ExcluirJogador
CALL ExcluirJogador(1);

-- Teste para AdicionarPais
CALL AdicionarPais('País Exemplo', @novoPaisId);
SELECT @novoPaisId;

-- Teste para AdicionarEstadio
CALL AdicionarEstadio('Estádio Exemplo', 50000, 'Localização Exemplo', @novoEstadioId);
SELECT @novoEstadioId;

-- Teste para AdicionarInscricaoTimeCampeonato
CALL AdicionarInscricaoTimeCampeonato(1, 1);

-- Teste para AdicionarRegistroPartidaTime
CALL AdicionarRegistroPartidaTime(1, 1);

-- Teste para AdicionarFichaTecnica
CALL AdicionarFichaTecnica(1.90, 80, 'Central', 'First', 'Last', 'Brasileiro', @novoIdJogador);
SELECT @novoIdJogador;

-- Teste para sp_criar_prova
CALL sp_criar_prova(1, 'Prova Exemplo', '2023-06-10', 'Localização Exemplo', @idProva);
SELECT @idProva;

-- Teste para sp_adicionar_participante
CALL sp_adicionar_participante(1, 1, 'Atleta');
CALL sp_adicionar_participante(1, 2, 'Equipe');

-- Teste para sp_registar_resultado
CALL sp_registar_resultado(1, 1, 10.5);

-- Teste para sp_remover_prova
CALL sp_remover_prova(1, FALSE);
CALL sp_remover_prova(2, TRUE);


-- Teste para sp_clonar_prova
CALL sp_clonar_prova(1, @novoIdProva);
SELECT @novoIdProva;

-- Teste para MediaAlturaPorTime
SELECT MediaAlturaPorTime(1);

-- Teste para MediaPontosPorPartida
SELECT MediaPontosPorPartida();

-- Teste para ListarJogadoresPorNacionalidade
SELECT ListarJogadoresPorNacionalidade('Brasileiro');

-- Teste para ListarTimesPorCampeonato
SELECT ListarTimesPorCampeonato(1);
