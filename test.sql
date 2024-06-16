-- Ativar o modo seguro do MySQL para operações de deleção em massa
SET SQL_SAFE_UPDATES = 0;

-- Limpar todas as tabelas para garantir um ambiente limpo para os testes
DELETE FROM ProvaResultado;
DELETE FROM Resultado WHERE IdResultado > 0;
DELETE FROM Prova_Evento WHERE IdEvento > 0;
DELETE FROM Evento WHERE IdEvento > 0;
DELETE FROM AtletaEquipa WHERE IdAtleta > 0;
DELETE FROM AtletaFicha WHERE IdFicha > 0;
DELETE FROM AtletaGenero WHERE IdGenero > 0;
DELETE FROM Atleta WHERE IdAtleta > 0;
DELETE FROM FichaTecnica WHERE IdFicha > 0;
DELETE FROM Genero WHERE IdGenero > 0;
DELETE FROM Estadio WHERE IdEstadio > 0;
DELETE FROM Treinador WHERE IdTreinador > 0;

-- Adicionar dados de teste
-- Adicionar Resultados
CALL AddResultado('Primeiro Lugar', 1);
CALL AddResultado('Segundo Lugar', 2);
CALL AddResultado('Terceiro Lugar', 3);

-- Adicionar Eventos
CALL AddEvento('Torneio Internacional', 'Lisboa', '2024-07-01', '2024-07-10');

-- Adicionar Provas
CALL AddProva('Prova Teste 1', 'Lisboa', '2024-07-05', '10:00:00', '02:00:00', 3);
CALL AddProva('Prova Teste 2', 'Porto', '2024-08-10', '14:00:00', '03:00:00', 5);

-- Relacionar Provas com Eventos
INSERT INTO Prova_Evento (IdProva, IdEvento) VALUES 
((SELECT IdProva FROM Prova WHERE nome_prova = 'Prova Teste 1' LIMIT 1), 
(SELECT IdEvento FROM Evento WHERE nome_evento = 'Torneio Internacional' LIMIT 1));
INSERT INTO Prova_Evento (IdProva, IdEvento) VALUES 
((SELECT IdProva FROM Prova WHERE nome_prova = 'Prova Teste 2' LIMIT 1), 
(SELECT IdEvento FROM Evento WHERE nome_evento = 'Torneio Internacional' LIMIT 1));

-- Adicionar Estádios
CALL AddEstadio('Estádio Olímpico', 80000, 'Lisboa', 
    (SELECT IdProva FROM Prova WHERE nome_prova = 'Prova Teste 1' LIMIT 1));
CALL AddEstadio('Arena Nacional', 50000, 'Porto', 
    (SELECT IdProva FROM Prova WHERE nome_prova = 'Prova Teste 2' LIMIT 1));

-- Adicionar Patrocinadores
INSERT INTO Patrocinador (Nome) VALUES
('Nike'), ('Adidas'), ('Puma'), ('Reebok'), ('Under Armour');

-- Adicionar Organizadoras
INSERT INTO Organizadora (Nome) VALUES
('Federação Portuguesa de Voleibol'), 
('Confederação Brasileira de Voleibol'), 
('Federação Espanhola de Voleibol');

-- Adicionar Treinadores
CALL AddTreinador('José Pereira', '1975-08-10', 'Lisboa', 'Alvalade', 15);
INSERT INTO Treinador (Nome, DataNasc, Cidade, Bairro, AnosExperiencia) VALUES
('Fernando Santos', '1965-04-22', 'Porto', 'Ribeira', 20),
('Laura Rodrigues', '1980-12-14', 'São Paulo', 'Vila Mariana', 10);

-- Adicionar Atletas
CALL AddAtleta('Carlos Souza', '1988-03-05', 'Brasil', 'Rio de Janeiro', 'Copacabana', 'Atacante');
CALL AddAtleta('Ana Martins', '1992-07-10', 'Portugal', 'Lisboa', 'Bairro Alto', 'Libero');
CALL AddAtleta('Laura Mendes', '1995-11-22', 'Espanha', 'Madrid', 'Centro', 'Central');
CALL AddAtleta('Pedro Silva', '1989-09-15', 'Brasil', 'São Paulo', 'Moema', 'Oposto');
CALL AddAtleta('Maria Garcia', '1993-05-18', 'Portugal', 'Porto', 'Boavista', 'Ponteira');

-- Relacionar Atletas com Equipes
INSERT INTO AtletaEquipa (IdAtleta, IdEquipa) VALUES
((SELECT IdAtleta FROM Atleta WHERE nome_atleta = 'Carlos Souza' LIMIT 1), 1),
((SELECT IdAtleta FROM Atleta WHERE nome_atleta = 'Ana Martins' LIMIT 1), 1),
((SELECT IdAtleta FROM Atleta WHERE nome_atleta = 'Laura Mendes' LIMIT 1), 1),
((SELECT IdAtleta FROM Atleta WHERE nome_atleta = 'Pedro Silva' LIMIT 1), 1),
((SELECT IdAtleta FROM Atleta WHERE nome_atleta = 'Maria Garcia' LIMIT 1), 1);

-- Adicionar Gêneros
INSERT INTO Genero (descricao) VALUES ('Masculino'), ('Feminino');

-- Relacionar Atletas com Gêneros
INSERT INTO AtletaGenero (IdAtleta, IdGenero) VALUES
((SELECT IdAtleta FROM Atleta WHERE nome_atleta = 'Carlos Souza' LIMIT 1), 
 (SELECT IdGenero FROM Genero WHERE descricao = 'Masculino' LIMIT 1)),
((SELECT IdAtleta FROM Atleta WHERE nome_atleta = 'Ana Martins' LIMIT 1), 
 (SELECT IdGenero FROM Genero WHERE descricao = 'Feminino' LIMIT 1));

-- Consultas para verificar os dados inseridos

-- Verificar Atletas
SELECT * FROM Atleta;

-- Verificar Eventos
SELECT * FROM Evento;

-- Verificar Provas
SELECT * FROM Prova;

-- Verificar Estádios
SELECT * FROM Estadio;

-- Verificar Patrocinadores
SELECT * FROM Patrocinador;

-- Verificar Organizadoras
SELECT * FROM Organizadora;

-- Verificar Treinadores
SELECT * FROM Treinador;

-- Verificar Gêneros
SELECT * FROM Genero;

-- Verificar Resultados
SELECT * FROM Resultado;

-- Verificar Relações AtletaEquipa
SELECT * FROM AtletaEquipa;

-- Verificar Relações AtletaGenero
SELECT * FROM AtletaGenero;

-- Verificar Relações ProvaEvento
SELECT * FROM Prova_Evento;

-- Verificar Relações ProvaResultado
SELECT * FROM ProvaResultado;

-- Verificar Visualizações
SELECT * FROM AtletasNacionalidade;
SELECT * FROM EquipasDesempenho;
SELECT * FROM ProvasEventos;
SELECT * FROM ResultadosProvas;
SELECT * FROM AtletasEquipas;

-- Testar funções

-- Função TotalAtletasEquipa
SELECT TotalAtletasEquipa(1) AS TotalAtletas;

-- Testar procedimentos armazenados

-- Adicionar novo Atleta e verificar
CALL AddAtleta('João Silva', '1990-01-15', 'Portugal', 'Porto', 'Boavista', 'Central');
SELECT * FROM Atleta WHERE nome_atleta = 'João Silva';

-- Adicionar nova Equipa e verificar
CALL AddEquipa('Time A', 85);
SELECT * FROM Equipa WHERE nome_equipa = 'Time A';

-- Adicionar novo Evento e verificar
CALL AddEvento('Campeonato Nacional', 'Porto', '2024-06-01', '2024-06-10');
SELECT * FROM Evento WHERE nome_evento = 'Campeonato Nacional';

-- Adicionar nova Prova e verificar
CALL AddProva('Prova B', 'Lisboa', '2024-06-05', '10:00:00', '02:00:00', 3);
SELECT * FROM Prova WHERE nome_prova = 'Prova B';

-- Adicionar novo Resultado e verificar
CALL AddResultado('Quarto Lugar', 4);
SELECT * FROM Resultado WHERE classificacao = 'Quarto Lugar';

-- Testar as visualizações
SELECT * FROM AtletasNacionalidade;
SELECT * FROM EquipasDesempenho;
SELECT * FROM ProvasEventos;
SELECT * FROM ResultadosProvas;
SELECT * FROM AtletasEquipas;

-- Reativar o modo seguro do MySQL
SET SQL_SAFE_UPDATES = 1;
