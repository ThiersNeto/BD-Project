USE Voleibol;

-- Inserir dados de exemplo

-- Atletas
INSERT INTO Atleta (nome_atleta, data_nasc, Nacionalidade) VALUES
('Carlos Souza', '1988-03-05', 'Brasil'),
('Ana Martins', '1992-07-10', 'Portugal'),
('Laura Mendes', '1995-11-22', 'Espanha'),
('Pedro Silva', '1989-09-15', 'Brasil'),
('Maria Garcia', '1993-05-18', 'Portugal'),
('João Silva', '1990-01-15', 'Portugal'),
('Maria Costa', '1985-03-22', 'Brasil'),
('Li Wei', '1992-07-08', 'China'),
('Ana Pereira', '1988-12-03', 'Portugal'),
('Carlos Mendes', '1991-11-10', 'Brasil'),
('Hiro Tanaka', '1984-04-18', 'Japão'),
('Laura Santos', '1993-09-25', 'Portugal'),
('David Oliveira', '1987-07-13', 'Brasil'),
('Chen Lee', '1990-05-20', 'China'),
('Lucia Garcia', '1994-03-29', 'Espanha'),
('Marco Antonio', '1991-06-14', 'Itália'),
('Sophia Rossi', '1989-11-21', 'Itália'),
('Miguel Fernandez', '1992-02-26', 'Espanha'),
('Rebecca Johnson', '1985-08-09', 'EUA'),
('James Smith', '1993-10-12', 'EUA');

-- Equipas
INSERT INTO Equipa (nome_equipa, desempenho_global) VALUES
('Time A', 85),
('Time B', 90),
('Time C', 80),
('Time D', 88),
('Time E', 92);

-- Eventos
INSERT INTO Evento (nome_evento, Local, data_inicio, data_fim) VALUES
('Torneio Internacional', 'Lisboa', '2024-07-01', '2024-07-10'),
('Campeonato Nacional', 'Porto', '2024-08-05', '2024-08-15'),
('Copa Regional', 'Madrid', '2024-09-01', '2024-09-10');

-- Provas
INSERT INTO Prova (nome_prova, Local_prova, data, hora, duracao, rodadas) VALUES
('Prova A', 'Lisboa', '2024-07-02', '10:00:00', '02:00:00', 3),
('Prova B', 'Porto', '2024-08-06', '14:00:00', '03:00:00', 5),
('Prova C', 'Madrid', '2024-09-03', '11:00:00', '02:30:00', 4);

-- Prova_Evento
INSERT INTO Prova_Evento (IdProva, IdEvento) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Resultados
INSERT INTO Resultado (classificacao, ranking) VALUES
('Primeiro', 1),
('Segundo', 2),
('Terceiro', 3);

-- ProvaResultado
INSERT INTO ProvaResultado (IdProva, IdResultado) VALUES
(1, 1),
(2, 2),
(3, 3);

-- AtletaEquipa
INSERT INTO AtletaEquipa (IdAtleta, IdEquipa) VALUES
(1, 1),(2, 2),(3, 3),(4, 1),(5, 2),(6, 3),(7, 4),(8, 5),(9, 1),(10, 2),
(11, 3),(12, 4),(13, 5),(14, 1),(15, 2),(16, 3),(17, 4),(18, 5),(19, 1),(20, 2);

-- Fichas Técnicas
INSERT INTO FichaTecnica (curriculo, historico) VALUES
('Currículo A', 'Histórico A'),
('Currículo B', 'Histórico B'),
('Currículo C', 'Histórico C'),
('Currículo D', 'Histórico D'),
('Currículo E', 'Histórico E');

-- AtletaFicha
INSERT INTO AtletaFicha (IdAtleta, IdFicha) VALUES
(1, 1),(2, 2),(3, 3),(4, 4),(5, 5),(6, 1),(7, 2),(8, 3),(9, 4),
(10, 5),(11, 1),(12, 2),(13, 3),(14, 4),(15, 5),(16, 1),(17, 2),
(18, 3),(19, 4),(20, 5);

-- Genero
INSERT INTO Genero (descricao) VALUES
('Masculino'),
('Feminino');

-- AtletaGenero
INSERT INTO AtletaGenero (IdAtleta, idGenero) VALUES
(1, 1),(2, 2),(3, 2),(4, 1),(5, 2),(6, 1),(7, 2),(8, 2),(9, 1),(10, 2),
(11, 1),(12, 2),(13, 2),(14, 1),(15, 2),(16, 1),(17, 2),(18, 2),(19, 1),(20, 2);
