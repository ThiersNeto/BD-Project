-- Populando os dados

USE Voleibol;

-- Adicionar atletas
CALL AddAtleta('Carlos Souza', '1988-03-05', 'Brasil');
CALL AddAtleta('Ana Martins', '1992-07-10', 'Portugal');
CALL AddAtleta('Laura Mendes', '1995-11-22', 'Espanha');
CALL AddAtleta('Pedro Silva', '1989-09-15', 'Brasil');
CALL AddAtleta('Maria Garcia', '1993-05-18', 'Portugal');
CALL AddAtleta('João Silva', '1990-01-15', 'Portugal');
CALL AddAtleta('Maria Costa', '1985-03-22', 'Brasil');
CALL AddAtleta('Li Wei', '1992-07-08', 'China');
CALL AddAtleta('Ana Pereira', '1988-12-03', 'Portugal');
CALL AddAtleta('Carlos Mendes', '1991-11-10', 'Brasil');
CALL AddAtleta('Hiro Tanaka', '1984-04-18', 'Japão');
CALL AddAtleta('Laura Santos', '1993-09-25', 'Portugal');
CALL AddAtleta('David Oliveira', '1987-07-13', 'Brasil');
CALL AddAtleta('Chen Lee', '1990-05-20', 'China');
CALL AddAtleta('Lucia Garcia', '1994-03-29', 'Espanha');
CALL AddAtleta('Marco Antonio', '1991-06-14', 'Itália');
CALL AddAtleta('Sophia Rossi', '1989-11-21', 'Itália');
CALL AddAtleta('Miguel Fernandez', '1992-02-26', 'Espanha');
CALL AddAtleta('Rebecca Johnson', '1985-08-09', 'EUA');
CALL AddAtleta('James Smith', '1993-10-12', 'EUA');

INSERT INTO Atleta (nome_atleta, data_nasc, Nacionalidade) VALUES
('Carlos Souza', '1988-03-05', 'Brasil'),('Ana Martins', '1992-07-10', 'Portugal'),('Laura Mendes', '1995-11-22', 'Espanha'),('Pedro Silva', '1989-09-15', 'Brasil'),('Maria Garcia', '1993-05-18', 'Portugal'),
('João Silva', '1990-01-15', 'Portugal'),('Maria Costa', '1985-03-22', 'Brasil'),('Li Wei', '1992-07-08', 'China'),('Ana Pereira', '1988-12-03', 'Portugal'),('Carlos Mendes', '1991-11-10', 'Brasil'),
('Hiro Tanaka', '1984-04-18', 'Japão'),('Laura Santos', '1993-09-25', 'Portugal'),('David Oliveira', '1987-07-13', 'Brasil'),('Chen Lee', '1990-05-20', 'China'),('Lucia Garcia', '1994-03-29', 'Espanha'),
('Marco Antonio', '1991-06-14', 'Itália'),('Sophia Rossi', '1989-11-21', 'Itália'),('Miguel Fernandez', '1992-02-26', 'Espanha'),('Rebecca Johnson', '1985-08-09', 'EUA'),('James Smith', '1993-10-12', 'EUA'),
('Olivia Brown', '1991-04-12', 'Canadá'),('Liam Wilson', '1988-08-19', 'Austrália'),('Emma Thompson', '1995-01-23', 'Reino Unido'),('Noah Clark', '1992-06-07', 'Irlanda'),('Ava Robinson', '1987-09-30', 'EUA'),
('Elena Petrova', '1993-11-11', 'Rússia'),('Mason Martinez', '1990-02-14', 'México'),('Isabella Rossi', '1992-05-05', 'Itália'),('Ethan Lee', '1994-07-21', 'Coreia do Sul'),('Mia Lopez', '1989-10-17', 'Espanha'),
('Lucas Silva', '1993-12-29', 'Brasil'),('Charlotte White', '1990-03-03', 'Canadá'),('Amelia Harris', '1992-06-18', 'Austrália'),('Benjamin Walker', '1988-11-05', 'Reino Unido'),('Grace Lewis', '1995-04-27', 'Irlanda'),
('Alexander Young', '1991-09-09', 'EUA'),('Harper Hall', '1987-12-19', 'Canadá'),('Jack Allen', '1993-02-15', 'Austrália'),('Sophia Scott', '1990-06-25', 'Reino Unido'),('James King', '1992-03-08', 'Irlanda'),
('Charlotte Green', '1988-07-14', 'EUA'),('Henry Wright', '1994-05-26', 'Canadá'),('Ava Young', '1989-10-01', 'Austrália'),('Elijah Harris', '1993-11-20', 'Reino Unido'),('Mia Lee', '1991-04-07', 'Irlanda'),
('Lucas Brown', '1987-09-18', 'EUA'),('Olivia Wilson', '1995-12-06', 'Canadá'),('Noah Thompson', '1990-01-11', 'Austrália'),('Emma Clark', '1992-07-29', 'Reino Unido'),('Liam Robinson', '1988-02-20', 'Irlanda');

-- Adicionar equipas
CALL AddEquipa('Time A', 85);
CALL AddEquipa('Time B', 90);
CALL AddEquipa('Time C', 80);
CALL AddEquipa('Time D', 88);
CALL AddEquipa('Time E', 92);
CALL AddEquipa('Time F', 87);
CALL AddEquipa('Time G', 89);
CALL AddEquipa('Time H', 86);
CALL AddEquipa('Time I', 83);
CALL AddEquipa('Time J', 91);
CALL AddEquipa('Time K', 84);
CALL AddEquipa('Time L', 93);
CALL AddEquipa('Time M', 79);
CALL AddEquipa('Time N', 82);
CALL AddEquipa('Time O', 88);
CALL AddEquipa('Time P', 85);
CALL AddEquipa('Time Q', 80);
CALL AddEquipa('Time R', 90);
CALL AddEquipa('Time S', 92);
CALL AddEquipa('Time T', 81);

-- Adicionar eventos
CALL AddEvento('Torneio Internacional', 'Lisboa', '2024-07-01', '2024-07-10');
CALL AddEvento('Campeonato Nacional', 'Porto', '2024-08-05', '2024-08-15');
CALL AddEvento('Copa Regional', 'Madrid', '2024-09-01', '2024-09-10');
CALL AddEvento('Torneio Primavera', 'Barcelona', '2024-03-20', '2024-03-25');
CALL AddEvento('Campeonato de Inverno', 'Valencia', '2024-12-10', '2024-12-20');
CALL AddEvento('Torneio de Verão', 'Sevilha', '2024-06-15', '2024-06-25');
CALL AddEvento('Campeonato Europeu', 'Paris', '2024-05-10', '2024-05-20');
CALL AddEvento('Copa América', 'Buenos Aires', '2024-04-01', '2024-04-10');
CALL AddEvento('Torneio Ásia', 'Tóquio', '2024-11-05', '2024-11-15');
CALL AddEvento('Campeonato Mundial', 'Nova York', '2024-10-01', '2024-10-10');
CALL AddEvento('Torneio Oceania', 'Sydney', '2024-02-15', '2024-02-25');
CALL AddEvento('Campeonato Africano', 'Cidade do Cabo', '2024-01-10', '2024-01-20');
CALL AddEvento('Torneio de Outono', 'Lisboa', '2024-09-15', '2024-09-25');
CALL AddEvento('Campeonato Brasileiro', 'Rio de Janeiro', '2024-11-20', '2024-11-30');
CALL AddEvento('Torneio Mediterrâneo', 'Atenas', '2024-08-10', '2024-08-20');
CALL AddEvento('Copa Pacífico', 'Vancouver', '2024-07-20', '2024-07-30');
CALL AddEvento('Torneio Alpino', 'Zurique', '2024-05-25', '2024-06-05');
CALL AddEvento('Campeonato do Norte', 'Estocolmo', '2024-04-15', '2024-04-25');
CALL AddEvento('Copa dos Campeões', 'Berlim', '2024-03-01', '2024-03-10');
CALL AddEvento('Torneio das Nações', 'Roma', '2024-01-25', '2024-02-05');

-- Adicionar provas
CALL AddProva('Prova A', 'Lisboa', '2024-07-02', '10:00:00', '02:00:00', 3);
CALL AddProva('Prova B', 'Porto', '2024-08-06', '14:00:00', '03:00:00', 5);
CALL AddProva('Prova C', 'Madrid', '2024-09-03', '11:00:00', '02:30:00', 4);
CALL AddProva('Prova D', 'Barcelona', '2024-03-21', '09:00:00', '01:30:00', 2);
CALL AddProva('Prova E', 'Valencia', '2024-12-11', '13:00:00', '02:15:00', 3);
CALL AddProva('Prova F', 'Sevilha', '2024-06-16', '08:30:00', '01:45:00', 4);
CALL AddProva('Prova G', 'Paris', '2024-05-11', '14:30:00', '03:00:00', 5);
CALL AddProva('Prova H', 'Buenos Aires', '2024-04-02', '10:00:00', '02:00:00', 3);
CALL AddProva('Prova I', 'Tóquio', '2024-11-06', '16:00:00', '03:30:00', 6);
CALL AddProva('Prova J', 'Nova York', '2024-10-02', '15:00:00', '02:45:00', 4);
CALL AddProva('Prova K', 'Sydney', '2024-02-16', '12:00:00', '01:30:00', 2);
CALL AddProva('Prova L', 'Cidade do Cabo', '2024-01-11', '09:30:00', '02:00:00', 3);
CALL AddProva('Prova M', 'Lisboa', '2024-09-16', '10:00:00', '01:45:00', 3);
CALL AddProva('Prova N', 'Rio de Janeiro', '2024-11-21', '14:00:00', '02:15:00', 4);
CALL AddProva('Prova O', 'Atenas', '2024-08-11', '11:00:00', '01:30:00', 2);
CALL AddProva('Prova P', 'Vancouver', '2024-07-21', '17:00:00', '02:00:00', 3);
CALL AddProva('Prova Q', 'Zurique', '2024-05-26', '13:30:00', '02:30:00', 4);
CALL AddProva('Prova R', 'Estocolmo', '2024-04-16', '09:00:00', '01:45:00', 2);
CALL AddProva('Prova S', 'Berlim', '2024-03-02', '15:30:00', '02:15:00', 3);
CALL AddProva('Prova T', 'Roma', '2024-01-26', '08:00:00', '01:30:00', 2);

-- Adicionar resultados
CALL AddResultado('Primeiro', 1);
CALL AddResultado('Segundo', 2);
CALL AddResultado('Terceiro', 3);

-- Associações entre provas e eventos
INSERT INTO Prova_Evento (IdProva, IdEvento) VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), 
(9, 9), (10, 10), (11, 11), (12, 12), (13, 13), (14, 14), 
(15, 15), (16, 16), (17, 17), (18, 18), (19, 19), (20, 20);

-- Associações entre provas e resultados
INSERT INTO ProvaResultado (IdProva, IdResultado) VALUES 
(1, 1), (2, 2), (3, 3), (4, 1), (5, 2), (6, 3), (7, 1), (8, 2), 
(9, 3), (10, 1), (11, 2), (12, 3), (13, 1), (14, 2), (15, 3), 
(16, 1), (17, 2), (18, 3), (19, 1), (20, 2);

-- Associações entre atletas e equipas
INSERT INTO AtletaEquipa (IdAtleta, IdEquipa) VALUES
(1, 1), (2, 2), (3, 3), (4, 1), (5, 2), (6, 3), (7, 4), (8, 5),
(9, 1), (10, 2), (11, 3), (12, 4), (13, 5), (14, 1), (15, 2),
(16, 3), (17, 4), (18, 5), (19, 1), (20, 2), (21, 3), (22, 4), 
(23, 5), (24, 1), (25, 2), (26, 3), (27, 4), (28, 5), (29, 1), 
(30, 2), (31, 3), (32, 4), (33, 5), (34, 1), (35, 2), (36, 3), 
(37, 4), (38, 5), (39, 1), (40, 2), (41, 3), (42, 4), (43, 5), 
(44, 1), (45, 2), (46, 3), (47, 4), (48, 5), (49, 1), (50, 2);

-- Adicionar fichas técnicas
INSERT INTO FichaTecnica (curriculo, historico) VALUES
('Currículo A', 'Histórico A'),
('Currículo B', 'Histórico B'),
('Currículo C', 'Histórico C'),
('Currículo D', 'Histórico D'),
('Currículo E', 'Histórico E');

-- Associações entre atletas e fichas técnicas
INSERT INTO AtletaFicha (IdAtleta, IdFicha) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 1), (7, 2), (8, 3),
(9, 4), (10, 5), (11, 1), (12, 2), (13, 3), (14, 4), (15, 5),
(16, 1), (17, 2), (18, 3), (19, 4), (20, 5), (21, 1), (22, 2), 
(23, 3), (24, 4), (25, 5), (26, 1), (27, 2), (28, 3), (29, 4), 
(30, 5), (31, 1), (32, 2), (33, 3), (34, 4), (35, 5), (36, 1), 
(37, 2), (38, 3), (39, 4), (40, 5), (41, 1), (42, 2), (43, 3), 
(44, 4), (45, 5), (46, 1), (47, 2), (48, 3), (49, 4), (50, 5);

-- Adicionar gêneros
INSERT INTO Genero (descricao) VALUES ('Masculino'), ('Feminino');

-- Associações entre atletas e gêneros
INSERT INTO AtletaGenero (IdAtleta, idGenero) VALUES
(1, 1), (2, 2), (3, 2), (4, 1), (5, 2), (6, 1), (7, 2), (8, 2),
(9, 1), (10, 2), (11, 1), (12, 2), (13, 2), (14, 1), (15, 2),
(16, 1), (17, 2), (18, 2), (19, 1), (20, 2), (21, 1), (22, 2), 
(23, 2), (24, 1), (25, 2), (26, 1), (27, 2), (28, 2), (29, 1), 
(30, 2), (31, 1), (32, 2), (33, 2), (34, 1), (35, 2), (36, 1), 
(37, 2), (38, 2), (39, 1), (40, 2), (41, 1), (42, 2), (43, 2), 
(44, 1), (45, 2), (46, 1), (47, 2), (48, 2), (49, 1), (50, 2);