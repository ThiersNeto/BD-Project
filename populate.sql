USE Voleibol;

-- Adicionar atletas
CALL AddAtleta('Carlos Souza', '1988-03-05', 'Brasil', 'Rio de Janeiro', 'Copacabana', 'Atacante');
CALL AddAtleta('Ana Martins', '1992-07-10', 'Portugal', 'Lisboa', 'Bairro Alto', 'Libero');
CALL AddAtleta('Laura Mendes', '1995-11-22', 'Espanha', 'Madrid', 'Centro', 'Central');
CALL AddAtleta('Pedro Silva', '1989-09-15', 'Brasil', 'São Paulo', 'Moema', 'Oposto');
CALL AddAtleta('Maria Garcia', '1993-05-18', 'Portugal', 'Porto', 'Boavista', 'Ponteira');
CALL AddAtleta('João Silva', '1990-01-15', 'Portugal', NULL, NULL, NULL);
CALL AddAtleta('Maria Costa', '1985-03-22', 'Brasil', NULL, NULL, NULL);
CALL AddAtleta('Li Wei', '1992-07-08', 'China', NULL, NULL, NULL);
CALL AddAtleta('Ana Pereira', '1988-12-03', 'Portugal', NULL, NULL, NULL);
CALL AddAtleta('Carlos Mendes', '1991-11-10', 'Brasil', NULL, NULL, NULL);
CALL AddAtleta('Hiro Tanaka', '1984-04-18', 'Japão', NULL, NULL, NULL);
CALL AddAtleta('Laura Santos', '1993-09-25', 'Portugal', NULL, NULL, NULL);
CALL AddAtleta('David Oliveira', '1987-07-13', 'Brasil', NULL, NULL, NULL);
CALL AddAtleta('Chen Lee', '1990-05-20', 'China', NULL, NULL, NULL);
CALL AddAtleta('Lucia Garcia', '1994-03-29', 'Espanha', NULL, NULL, NULL);
CALL AddAtleta('Marco Antonio', '1991-06-14', 'Itália', NULL, NULL, NULL);
CALL AddAtleta('Sophia Rossi', '1989-11-21', 'Itália', NULL, NULL, NULL);
CALL AddAtleta('Miguel Fernandez', '1992-02-26', 'Espanha', NULL, NULL, NULL);
CALL AddAtleta('Rebecca Johnson', '1985-08-09', 'EUA', NULL, NULL, NULL);
CALL AddAtleta('James Smith', '1993-10-12', 'EUA', NULL, NULL, NULL);
CALL AddAtleta('Isabel Silva', '1991-02-14', 'Brasil', NULL, NULL, NULL);
CALL AddAtleta('Marcos Oliveira', '1987-06-23', 'Portugal', NULL, NULL, NULL);
CALL AddAtleta('Clara Lima', '1993-09-30', 'Espanha', NULL, NULL, NULL);

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

-- Associações entre atletas e equipas
-- Garantindo que não haja duplicatas
INSERT INTO AtletaEquipa (IdAtleta, IdEquipa) VALUES
(1, 1), (2, 2), (3, 3), (4, 1), (5, 2),
(6, 3), (7, 4), (8, 5), (9, 1), (10, 2),
(11, 3), (12, 4), (13, 5), (14, 1), (15, 2),
(16, 3), (17, 4), (18, 5), (19, 1), (20, 2);

-- Adicionar fichas técnicas
INSERT INTO FichaTecnica (curriculo, historico) VALUES
('Currículo A', 'Histórico A'),
('Currículo B', 'Histórico B'),
('Currículo C', 'Histórico C'),
('Currículo D', 'Histórico D'),
('Currículo E', 'Histórico E');

-- Associações entre atletas e fichas técnicas
-- Garantindo que não haja duplicatas
INSERT INTO AtletaFicha (IdAtleta, IdFicha) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 1), (7, 2), (8, 3), (9, 4), (10, 5),
(11, 1), (12, 2), (13, 3), (14, 4), (15, 5),
(16, 1), (17, 2), (18, 3), (19, 4), (20, 5);

-- Adicionar gêneros
INSERT INTO Genero (descricao) VALUES ('Masculino'), ('Feminino');

-- Associações entre atletas e gêneros
-- Garantindo que não haja duplicatas
INSERT INTO AtletaGenero (IdAtleta, IdGenero) VALUES
(1, 1), (2, 2), (3, 2), (4, 1), (5, 2),
(6, 1), (7, 2), (8, 2), (9, 1), (10, 2),
(11, 1), (12, 2), (13, 2), (14, 1), (15, 2),
(16, 1), (17, 2), (18, 2), (19, 1), (20, 2);

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
-- Garantindo que não haja duplicatas
INSERT INTO Prova_Evento (IdProva, IdEvento) VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8), 
(9, 9), (10, 10), (11, 11), (12, 12), (13, 13), (14, 14), 
(15, 15), (16, 16), (17, 17), (18, 18), (19, 19), (20, 20);

-- Associações entre provas e resultados
-- Garantindo que não haja duplicatas
INSERT INTO ProvaResultado (IdProva, IdResultado) VALUES 
(1, 1), (2, 2), (3, 3), (4, 1), (5, 2), (6, 3), (7, 1), (8, 2), 
(9, 3), (10, 1), (11, 2), (12, 3), (13, 1), (14, 2), (15, 3), 
(16, 1), (17, 2), (18, 3), (19, 1), (20, 2);

-- Adicionar organizadoras
INSERT INTO Organizadora (Nome) VALUES
('Federação Portuguesa de Voleibol'),
('Confederação Brasileira de Voleibol'),
('Federação Espanhola de Voleibol'),
('Federação Italiana de Voleibol'),
('Federação Francesa de Voleibol');

-- Associações entre provas e organizadoras
-- Garantindo que não haja duplicatas
INSERT INTO ProvaOrganizadora (IdProva, IdOrganizadora) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 1), (7, 2), (8, 3),
(9, 4), (10, 5), (11, 1), (12, 2), (13, 3), (14, 4), (15, 5),
(16, 1), (17, 2), (18, 3), (19, 4), (20, 5);

-- Adicionar patrocinadores
INSERT INTO Patrocinador (Nome) VALUES
('Nike'), ('Adidas'), ('Puma'), ('Reebok'), ('Under Armour'), 
('Asics'), ('Mizuno'), ('New Balance'), ('Converse'), ('Fila'),
('Kappa'), ('Lotto'), ('Umbro'), ('Diadora'), ('Joma'),
('Le Coq Sportif'), ('Hummel'), ('Kelme'), ('Erreà'), ('Macron'),
('Craft'), ('Erima'), ('Patrick'), ('Zamst'), ('2XU'),
('Björn Borg'), ('Champion'), ('Columbia'), ('Lacoste'), ('Quiksilver'),
('Roxy'), ('Salomon'), ('Sergio Tacchini'), ('Speedo'), ('Teva'),
('Timberland'), ('Wilson'), ('Yonex'), ('Ellesse'), ('Descente'),
('Everlast'), ('Gola'), ('Haglöfs'), ('Head'), ('Helly Hansen'),
('Hi-Tec'), ('Jack Wolfskin'), ('Keen'), ('K-Swiss'), ('Levi Strauss');

-- Associações entre provas e patrocinadores
-- Garantindo que não haja duplicatas
INSERT INTO ProvaPatrocinador (IdProva, IdPatrocinador) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 1), (7, 2), (8, 3),
(9, 4), (10, 5), (11, 1), (12, 2), (13, 3), (14, 4), (15, 5),
(16, 1), (17, 2), (18, 3), (19, 4), (20, 5);

-- Adicionar 25 estádios usando CALL
CALL AddEstadio('Estádio Olímpico', 80000, 'Lisboa', 1);
CALL AddEstadio('Arena Nacional', 50000, 'Porto', 2);
CALL AddEstadio('Campo Regional', 20000, 'Madrid', 3);
CALL AddEstadio('Estádio Primavera', 30000, 'Barcelona', 4);
CALL AddEstadio('Estádio Inverno', 45000, 'Valencia', 5);
CALL AddEstadio('Estádio do Maracanã', 75000, 'Rio de Janeiro', 6);
CALL AddEstadio('Estádio da Luz', 65000, 'Lisboa', 7);
CALL AddEstadio('Allianz Arena', 70000, 'Munique', 8);
CALL AddEstadio('Camp Nou', 99000, 'Barcelona', 9);
CALL AddEstadio('Estádio San Siro', 80000, 'Milão', 10);
CALL AddEstadio('Parc des Princes', 47000, 'Paris', 11);
CALL AddEstadio('Wembley Stadium', 90000, 'Londres', 12);
CALL AddEstadio('Estádio Azteca', 87000, 'Cidade do México', 13);
CALL AddEstadio('Estádio Monumental', 70000, 'Buenos Aires', 14);
CALL AddEstadio('Estádio Centenário', 60000, 'Montevidéu', 15);
CALL AddEstadio('Estádio Olímpico de Tóquio', 68000, 'Tóquio', 16);
CALL AddEstadio('Estádio Nacional de Pequim', 91000, 'Pequim', 17);
CALL AddEstadio('Estádio Nacional de Brasília', 72000, 'Brasília', 18);
CALL AddEstadio('Estádio Nacional de Santiago', 48000, 'Santiago', 19);
CALL AddEstadio('Estádio Nacional de Lima', 45000, 'Lima', 20);
CALL AddEstadio('Estádio Nacional de Bogotá', 40000, 'Bogotá', 1);
CALL AddEstadio('Estádio Nacional de Caracas', 35000, 'Caracas', 2); 
CALL AddEstadio('Estádio Nacional de Quito', 30000, 'Quito', 3); 
CALL AddEstadio('Estádio Nacional de La Paz', 28000, 'La Paz', 4);
CALL AddEstadio('Estádio Nacional de Assunção', 25000, 'Assunção', 5); 

-- Adicionar 25 estádios usando INSERT INTO
INSERT INTO Estadio (Nome, Capacidade, Localizacao, IdProva) VALUES
('Estádio Nacional de Montevidéu', 22000, 'Montevidéu', 6),
('Estádio Nacional de São Paulo', 21000, 'São Paulo', 7), 
('Estádio Nacional de Salvador', 20000, 'Salvador', 8), 
('Estádio Nacional de Fortaleza', 19000, 'Fortaleza', 9), 
('Estádio Nacional de Manaus', 18000, 'Manaus', 10), 
('Estádio Nacional de Belém', 17000, 'Belém', 11), 
('Estádio Nacional de Recife', 16000, 'Recife', 12), 
('Estádio Nacional de Natal', 15000, 'Natal', 13), 
('Estádio Nacional de Aracaju', 14000, 'Aracaju', 14), 
('Estádio Nacional de João Pessoa', 13000, 'João Pessoa', 15), 
('Estádio Nacional de Maceió', 12000, 'Maceió', 16), 
('Estádio Nacional de Teresina', 11000, 'Teresina', 17), 
('Estádio Nacional de São Luís', 10000, 'São Luís', 18),
('Estádio Nacional de Porto Alegre', 9000, 'Porto Alegre', 19), 
('Estádio Nacional de Curitiba', 8000, 'Curitiba', 20),
('Estádio Nacional de Florianópolis', 7000, 'Florianópolis', 1), 
('Estádio Nacional de Vitória', 6000, 'Vitória', 2), 
('Estádio Nacional de Cuiabá', 5000, 'Cuiabá', 3),
('Estádio Nacional de Campo Grande', 4000, 'Campo Grande', 4), 
('Estádio Nacional de Palmas', 3000, 'Palmas', 5),
('Estádio Nacional de Macapá', 2000, 'Macapá', 6), 
('Estádio Nacional de Rio Branco', 1000, 'Rio Branco', 7),
('Estádio Nacional de Boa Vista', 500, 'Boa Vista', 8), 
('Estádio Nacional de Porto Velho', 300, 'Porto Velho', 9), 
('Estádio Nacional de Salvador', 100, 'Salvador', 10); 




-- Adicionar Treinadores
CALL AddTreinador('José Pereira', '1975-08-10', 'Lisboa', 'Alvalade', 15);
CALL AddTreinador('Ana Costa', '1978-11-25', 'Madrid', 'Salamanca', 12);
CALL AddTreinador('Pedro Lopes', '1968-07-15', 'Lisboa', 'Belém', 25);
CALL AddTreinador('Joana Almeida', '1982-09-30', 'Porto', 'Foz', 8);
CALL AddTreinador('Rafael Teixeira', '1975-11-20', 'São Paulo', 'Jardins', 14);
CALL AddTreinador('Bruno Dias', '1983-05-22', 'Rio de Janeiro', 'Ipanema', 10);
CALL AddTreinador('Sofia Mendes', '1979-03-10', 'Lisboa', 'Campo de Ourique', 13);
CALL AddTreinador('Paulo Silva', '1985-02-14', 'Porto', 'Boavista', 9);
CALL AddTreinador('Carla Freitas', '1972-01-05', 'São Paulo', 'Vila Olímpia', 22);
CALL AddTreinador('Ricardo Martins', '1981-06-30', 'Rio de Janeiro', 'Copacabana', 11);
CALL AddTreinador('Teresa Fernandes', '1984-10-25', 'Lisboa', 'Restelo', 7);
CALL AddTreinador('Miguel Ramos', '1976-09-19', 'Porto', 'Santo Ildefonso', 17);
CALL AddTreinador('Luciana Correia', '1983-08-21', 'São Paulo', 'Brooklin', 10);
CALL AddTreinador('Marcelo Andrade', '1977-05-13', 'Rio de Janeiro', 'Leblon', 16);
CALL AddTreinador('Patrícia Cardoso', '1980-12-01', 'Lisboa', 'Parque das Nações', 12);
CALL AddTreinador('Gustavo Moreira', '1973-07-09', 'Porto', 'Cedofeita', 23);
CALL AddTreinador('Mariana Antunes', '1982-04-18', 'São Paulo', 'Pinheiros', 11);
CALL AddTreinador('Renato Ferreira', '1981-09-15', 'Rio de Janeiro', 'Jardim Botânico', 14);
CALL AddTreinador('Fernanda Lima', '1985-11-03', 'Lisboa', 'Ajuda', 8);
CALL AddTreinador('Fábio Oliveira', '1974-06-07', 'Porto', 'Miragaia', 19);
CALL AddTreinador('Cláudia Sousa', '1983-01-26', 'São Paulo', 'Consolação', 10);
CALL AddTreinador('João Pires', '1978-12-20', 'Rio de Janeiro', 'Lagoa', 15);
CALL AddTreinador('Tatiana Ribeiro', '1981-08-16', 'Lisboa', 'Lumiar', 9);
CALL AddTreinador('Henrique Martins', '1982-11-05', 'Porto', 'Matosinhos', 12);
CALL AddTreinador('Andreia Costa', '1980-03-08', 'São Paulo', 'Aclimação', 15);

INSERT INTO Treinador (Nome, DataNasc, Cidade, Bairro, AnosExperiencia) VALUES
('Fernando Santos', '1965-04-22', 'Porto', 'Ribeira', 20),
('Carlos Nunes', '1970-06-18', 'Rio de Janeiro', 'Barra da Tijuca', 18),
('Paulo Silva', '1985-02-14', 'Porto', 'Boavista', 9),
('Ricardo Martins', '1981-06-30', 'Rio de Janeiro', 'Copacabana', 11),
('Teresa Fernandes', '1984-10-25', 'Lisboa', 'Restelo', 7),
('Miguel Ramos', '1976-09-19', 'Porto', 'Santo Ildefonso', 17),
('Luciana Correia', '1983-08-21', 'São Paulo', 'Brooklin', 10),
('Marcelo Andrade', '1977-05-13', 'Rio de Janeiro', 'Leblon', 16),
('Patrícia Cardoso', '1980-12-01', 'Lisboa', 'Parque das Nações', 12),
('Gustavo Moreira', '1973-07-09', 'Porto', 'Cedofeita', 23),
('Mariana Antunes', '1982-04-18', 'São Paulo', 'Pinheiros', 11),
('Renato Ferreira', '1981-09-15', 'Rio de Janeiro', 'Jardim Botânico', 14),
('Fernanda Lima', '1985-11-03', 'Lisboa', 'Ajuda', 8),
('Fábio Oliveira', '1974-06-07', 'Porto', 'Miragaia', 19),
('Cláudia Sousa', '1983-01-26', 'São Paulo', 'Consolação', 10),
('João Pires', '1978-12-20', 'Rio de Janeiro', 'Lagoa', 15),
('Tatiana Ribeiro', '1981-08-16', 'Lisboa', 'Lumiar', 9),
('Henrique Martins', '1982-11-05', 'Porto', 'Matosinhos', 12),
('Andreia Costa', '1980-03-08', 'São Paulo', 'Aclimação', 15),
('Vitor Almeida', '1977-07-22', 'Rio de Janeiro', 'Flamengo', 18),
('Camila Marques', '1984-02-02', 'Lisboa', 'Graça', 6),
('Leandro Gonçalves', '1979-04-14', 'Porto', 'Campanhã', 16),
('Júlia Rocha', '1983-05-19', 'São Paulo', 'Santana', 8),
('Mateus Cunha', '1980-09-01', 'Rio de Janeiro', 'Santa Teresa', 13),
('Helena Dias', '1978-01-30', 'Lisboa', 'Benfica', 17);
