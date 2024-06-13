USE Volei;

-- População de Países
CALL AdicionarPais('Brasil', @novoPaisId);
CALL AdicionarPais('Portugal', @novoPaisId);
CALL AdicionarPais('Estados Unidos', @novoPaisId);
CALL AdicionarPais('Itália', @novoPaisId);
CALL AdicionarPais('França', @novoPaisId);

-- População de Estádios
CALL AdicionarEstadio('Madison Square Garden', 20789, 'Nova York, EUA', @novoEstadioId);
CALL AdicionarEstadio('Staples Center', 19060, 'Los Angeles, EUA', @novoEstadioId);

-- População de Times
CALL AdicionarTime('Zenit Kazan', @novoTimeId);
CALL AdicionarTime('Lokomotiv Novosibirsk', @novoTimeId);
CALL AdicionarTime('Dinamo Moscow', @novoTimeId);
CALL AdicionarTime('Belogorie Belgorod', @novoTimeId);
CALL AdicionarTime('Cucine Lube Civitanova', @novoTimeId);

-- População de Jogadores
CALL AdicionarJogador('João Pedro', 'joao.pedro@example.com', '111111111', 'Rua C', 'Bairro 3', 'Cidade Z', 1.85, 75, 'Central', 'João', 'Pedro', 'Brasileira', 1, 10, @novoJogadorId);
CALL AdicionarJogador('Ana Silva', 'ana.silva@example.com', '222222222', 'Rua D', 'Bairro 4', 'Cidade W', 1.75, 65, 'Ponta', 'Ana', 'Silva', 'Portuguesa', 2, 11, @novoJogadorId);
CALL AdicionarJogador('Pedro Santos', 'pedro.santos@example.com', '333333333', 'Rua E', 'Bairro 5', 'Cidade X', 1.90, 85, 'Libero', 'Pedro', 'Santos', 'Brasileira', 1, 12, @novoJogadorId);
CALL AdicionarJogador('Maria Costa', 'maria.costa@example.com', '444444444', 'Rua F', 'Bairro 6', 'Cidade Y', 1.70, 60, 'Central', 'Maria', 'Costa', 'Portuguesa', 2, 13, @novoJogadorId);
CALL AdicionarJogador('Lucas Lima', 'lucas.lima@example.com', '555555555', 'Rua G', 'Bairro 7', 'Cidade V', 1.88, 80, 'Oposto', 'Lucas', 'Lima', 'Brasileira', 3, 14, @novoJogadorId);

-- População de Treinadores
CALL AdicionarTreinador('Carlos Oliveira', 'carlos.oliveira@example.com', '555555555', 'Rua G', 'Bairro 7', 'Cidade Z', 'Carlos', 'Oliveira', 'Brasileira', 1, @novoTreinadorId);
CALL AdicionarTreinador('Beatriz Lima', 'beatriz.lima@example.com', '666666666', 'Rua H', 'Bairro 8', 'Cidade W', 'Beatriz', 'Lima', 'Portuguesa', 2, @novoTreinadorId);
CALL AdicionarTreinador('Rafael Nunes', 'rafael.nunes@example.com', '777777777', 'Rua I', 'Bairro 9', 'Cidade X', 'Rafael', 'Nunes', 'Brasileira', 1, @novoTreinadorId);
CALL AdicionarTreinador('Fernanda Azevedo', 'fernanda.azevedo@example.com', '888888888', 'Rua J', 'Bairro 10', 'Cidade Y', 'Fernanda', 'Azevedo', 'Portuguesa', 2, @novoTreinadorId);
CALL AdicionarTreinador('Lucas Almeida', 'lucas.almeida@example.com', '999999999', 'Rua K', 'Bairro 11', 'Cidade V', 'Lucas', 'Almeida', 'Brasileira', 3, @novoTreinadorId);

-- População de Campeonatos
INSERT INTO Campeonato (titulo) VALUES ('Campeonato Nacional');
INSERT INTO Campeonato (titulo) VALUES ('Campeonato Internacional');

-- População de Partidas
CALL AdicionarPartida(1, 30, 1, '2024-06-03', '01:40:00', @novaPartidaId);
CALL AdicionarPartida(2, 25, 2, '2024-06-10', '01:30:00', @novaPartidaId);
CALL AdicionarPartida(3, 28, 3, '2024-06-17', '01:45:00', @novaPartidaId);
CALL AdicionarPartida(4, 22, 4, '2024-06-24', '01:20:00', @novaPartidaId);


-- População de Patrocinadores
CALL AdicionarPatrocinador('Nike', @novoPatrocinadorId);
CALL AdicionarPatrocinador('Adidas', @novoPatrocinadorId);
CALL AdicionarPatrocinador('Puma', @novoPatrocinadorId);
CALL AdicionarPatrocinador('Under Armour', @novoPatrocinadorId);
CALL AdicionarPatrocinador('Reebok', @novoPatrocinadorId);

-- Inscrição de Times em Campeonatos
CALL AdicionarInscricaoTimeCampeonato(1, 1);
CALL AdicionarInscricaoTimeCampeonato(2, 1);
CALL AdicionarInscricaoTimeCampeonato(3, 1);
CALL AdicionarInscricaoTimeCampeonato(4, 1);
CALL AdicionarInscricaoTimeCampeonato(5, 1);

-- Registro de Times em Partidas
CALL AdicionarRegistroPartidaTime(1, 1);
CALL AdicionarRegistroPartidaTime(2, 2);
CALL AdicionarRegistroPartidaTime(3, 3);
CALL AdicionarRegistroPartidaTime(4, 4);
CALL AdicionarRegistroPartidaTime(5, 5);

-- Atualização de Dados de Pessoa
CALL AtualizarDadosPessoa(1, 'João Silva', 'joao.silva@example.com', '123456789', 'Rua A', 'Bairro 1', 'Cidade X');
CALL AtualizarDadosPessoa(2, 'Maria Oliveira', 'maria.oliveira@example.com', '987654321', 'Rua B', 'Bairro 2', 'Cidade Y');
CALL AtualizarDadosPessoa(3, 'Ana Costa', 'ana.costa@example.com', '555555555', 'Rua C', 'Bairro 3', 'Cidade Z');
CALL AtualizarDadosPessoa(4, 'Carlos Santos', 'carlos.santos@example.com', '666666666', 'Rua D', 'Bairro 4', 'Cidade W');
CALL AtualizarDadosPessoa(5, 'Lucas Lima', 'lucas.lima@example.com', '777777777', 'Rua E', 'Bairro 5', 'Cidade V');

-- População de Ficha Técnica
CALL AdicionarFichaTecnica(1.85, 80.0, 'Atacante', 'João', 'Silva', 'Brasileira', @novoIdJogador);
CALL AdicionarFichaTecnica(1.75, 90.0, 'Defensor', 'Maria', 'Oliveira', 'Portuguesa', @novoIdJogador);
CALL AdicionarFichaTecnica(1.82, 85.0, 'Atacante', 'Carlos', 'Santos', 'Brasileira', @novoIdJogador);
CALL AdicionarFichaTecnica(1.78, 75.0, 'Defensor', 'Ana', 'Costa', 'Portuguesa', @novoIdJogador);
CALL AdicionarFichaTecnica(1.88, 78.0, 'Atacante', 'Luiz', 'Lima', 'Brasileira', @novoIdJogador);
