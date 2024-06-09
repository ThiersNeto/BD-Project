USE voleibd;

SELECT * FROM Pais;
SELECT * FROM Patrocinador;
SELECT * FROM Pessoa;
SELECT * FROM Campeonato;
SELECT * FROM Jogador;
SELECT * FROM Treinador;
SELECT * FROM Estadio;
SELECT * FROM Equipe;


INSERT INTO Pais (Nome) VALUES
('Brasil'), ('Argentina'), ('Itália'), ('França'), ('Rússia'), 
('Polônia'), ('Japão'), ('China'), ('Turquia'), ('Alemanha'),
('Espanha'), ('Canadá'), ('Estados Unidos'), ('México'), ('Portugal'),
('Holanda'), ('Bélgica'), ('Suíça'), ('Suécia'), ('Noruega'),
('Dinamarca'), ('Finlândia'), ('Áustria'), ('Grécia'), ('Hungria'),
('República Tcheca'), ('Austrália'), ('Nova Zelândia'), ('África do Sul'), ('Egito');


INSERT INTO Patrocinador (Nome, id_Pais) VALUES
('Banco do Brasil', 1), ('Petrobras', 1), ('Natura', 1), ('Embraer', 1),
('Ambev', 1), ('Bradesco', 1), ('Itaú', 1), ('Santander', 1),
('Caixa Econômica Federal', 1), ('Magazine Luiza', 1), 
('Adidas', 2), ('Nike', 3), ('Puma', 4), ('Reebok', 5), 
('Coca Cola', 6), ('Pepsi', 7), ('Sony', 8), ('Samsung', 9), 
('LG', 10), ('HP', 11), ('Dell', 12), ('Apple', 13), 
('Microsoft', 14), ('Google', 15), ('Amazon', 16), 
('Facebook', 17), ('Twitter', 18), ('Uber', 19), 
('Airbnb', 20), ('Netflix', 21);


INSERT INTO Pessoa (Nome, Email, Telemovel, Rua, Bairro, Cidade) VALUES
('Giba', 'giba@example.com', '11912345678', 'Rua Engenheiro Rebouças', 'Rebouças', 'Curitiba'),
('Murilo Endres', 'murilo@example.com', '11923456789', 'Avenida Paulista', 'Bela Vista', 'São Paulo'),
('Bruno Rezende', 'bruno@example.com', '21934567890', 'Rua Visconde de Pirajá', 'Ipanema', 'Rio de Janeiro'),
('Serginho', 'serginho@example.com', '11945678901', 'Rua da Consolação', 'Consolação', 'São Paulo'),
('Wallace de Souza', 'wallace@example.com', '11956789012', 'Rua Oscar Freire', 'Jardins', 'São Paulo'),
('Ricardo Lucarelli', 'lucarelli@example.com', '31967890123', 'Avenida Afonso Pena', 'Centro', 'Belo Horizonte'),
('Lucão', 'lucao@example.com', '11978901234', 'Avenida Brigadeiro Faria Lima', 'Itaim Bibi', 'São Paulo'),
('Maurício Borges', 'mauricio@example.com', '11989012345', 'Rua Frei Caneca', 'Consolação', 'São Paulo'),
('Douglas Souza', 'douglas@example.com', '11990123456', 'Rua Bela Cintra', 'Consolação', 'São Paulo'),
('Rodrigo Santana', 'rodrigo@example.com', '11901234567', 'Avenida 23 de Maio', 'Paraíso', 'São Paulo'),
('Fernando Garay', 'fernando@example.com', '31987654321', 'Rua Amazonas', 'Savassi', 'Belo Horizonte'),
('Thiago Santos', 'thiago@example.com', '21987654321', 'Avenida Atlântica', 'Copacabana', 'Rio de Janeiro'),
('Carlos Nogueira', 'carlos@example.com', '11987654321', 'Rua Vergueiro', 'Vila Mariana', 'São Paulo'),
('Pedro Henrique', 'pedro@example.com', '31976543210', 'Avenida Cristiano Machado', 'Cidade Nova', 'Belo Horizonte'),
('Felipe Araújo', 'felipe@example.com', '21976543210', 'Rua Jardim Botânico', 'Jardim Botânico', 'Rio de Janeiro'),
('Marcelo Silva', 'marcelo@example.com', '11965432109', 'Rua Augusta', 'Consolação', 'São Paulo'),
('Andre Lima', 'andre@example.com', '31965432109', 'Avenida do Contorno', 'Funcionários', 'Belo Horizonte'),
('Victor Hugo', 'victor@example.com', '21965432109', 'Rua da Glória', 'Glória', 'Rio de Janeiro'),
('Lucas Costa', 'lucas@example.com', '11954321098', 'Avenida São João', 'Centro', 'São Paulo'),
('Gabriel Souza', 'gabriel@example.com', '31954321098', 'Avenida Amazonas', 'Centro', 'Belo Horizonte'),
('Rafael Santos', 'rafael@example.com', '21954321098', 'Rua Barata Ribeiro', 'Copacabana', 'Rio de Janeiro'),
('Mateus Oliveira', 'mateus@example.com', '11943210987', 'Avenida Ipiranga', 'República', 'São Paulo'),
('Arthur Almeida', 'arthur@example.com', '31943210987', 'Rua dos Timbiras', 'Centro', 'Belo Horizonte'),
('Igor Mendes', 'igor@example.com', '21943210987', 'Avenida Presidente Vargas', 'Centro', 'Rio de Janeiro'),
('Diego Ferreira', 'diego@example.com', '11932109876', 'Avenida Paulista', 'Bela Vista', 'São Paulo'),
('Bruno Alves', 'bruno.alves@example.com', '31932109876', 'Avenida Afonso Pena', 'Centro', 'Belo Horizonte'),
('José Pereira', 'jose@example.com', '21932109876', 'Rua Voluntários da Pátria', 'Botafogo', 'Rio de Janeiro'),
('Daniel Martins', 'daniel@example.com', '11921098765', 'Rua Haddock Lobo', 'Consolação', 'São Paulo'),
('Eduardo Lima', 'eduardo@example.com', '31921098765', 'Avenida Amazonas', 'Centro', 'Belo Horizonte'),
('Henrique Souza', 'henrique@example.com', '21921098765', 'Avenida Rio Branco', 'Centro', 'Rio de Janeiro');

INSERT INTO Campeonato (Nome, Ano, Titulo, id_Pais) VALUES
('Superliga Masculina', 2023, 'Superliga 2023', 1), 
('Campeonato Paulista', 2022, 'Paulista 2022', 1),
('Copa Brasil', 2021, 'Copa Brasil 2021', 1),
('Campeonato Carioca', 2020, 'Carioca 2020', 1),
('Campeonato Mineiro', 2019, 'Mineiro 2019', 1),
('Liga Nacional', 2018, 'Nacional 2018', 1),
('Campeonato Gaúcho', 2017, 'Gaúcho 2017', 1),
('Taça Paraná', 2016, 'Paraná 2016', 1),
('Liga Nordeste', 2015, 'Nordeste 2015', 1),
('Campeonato Centro-Oeste', 2014, 'Centro-Oeste 2014', 1),
('Campeonato Sul', 2013, 'Sul 2013', 1), ('Copa Rio', 2012, 'Rio 2012', 1),
('Campeonato Norte', 2011, 'Norte 2011', 1), ('Campeonato Leste', 2010, 'Leste 2010', 1),
('Campeonato Oeste', 2009, 'Oeste 2009', 1), ('Superliga Feminina', 2023, 'Superliga 2023', 1),
('Campeonato Paulista Feminino', 2022, 'Paulista 2022', 1), ('Copa Brasil Feminina', 2021, 'Copa Brasil 2021', 1),
('Campeonato Carioca Feminino', 2020, 'Carioca 2020', 1), ('Campeonato Mineiro Feminino', 2019, 'Mineiro 2019', 1),
('Liga Nacional Feminina', 2018, 'Nacional 2018', 1), ('Campeonato Gaúcho Feminino', 2017, 'Gaúcho 2017', 1),
('Taça Paraná Feminina', 2016, 'Paraná 2016', 1), ('Liga Nordeste Feminina', 2015, 'Nordeste 2015', 1),
('Campeonato Centro-Oeste Feminino', 2014, 'Centro-Oeste 2014', 1), ('Campeonato Sul Feminino', 2013, 'Sul 2013', 1),
('Copa Rio Feminina', 2012, 'Rio 2012', 1), ('Campeonato Norte Feminino', 2011, 'Norte 2011', 1),
('Campeonato Leste Feminino', 2010, 'Leste 2010', 1), ('Campeonato Oeste Feminino', 2009, 'Oeste 2009', 1);


INSERT INTO Jogador (Altura, Peso, Posicao, idPessoa) VALUES
(1.90, 85, 'Ponteiro', 1), (1.85, 78, 'Oposto', 2), (1.98, 88, 'Levantador', 3),
(1.92, 80, 'Líbero', 4), (1.95, 90, 'Central', 5), (1.91, 85, 'Ponteiro', 6),
(2.00, 95, 'Central', 7), (1.88, 82, 'Levantador', 8), (1.87, 80, 'Oposto', 9),
(1.99, 93, 'Ponteiro', 10), (1.89, 84, 'Ponteiro', 11), (1.86, 79, 'Oposto', 12),
(1.97, 89, 'Levantador', 13), (1.93, 81, 'Líbero', 14), (1.96, 91, 'Central', 15),
(1.90, 85, 'Ponteiro', 16), (2.01, 96, 'Central', 17), (1.89, 83, 'Levantador', 18),
(1.86, 80, 'Oposto', 19), (1.98, 92, 'Ponteiro', 20), (1.91, 86, 'Ponteiro', 21),
(1.87, 81, 'Oposto', 22), (1.96, 90, 'Levantador', 23), (1.92, 82, 'Líbero', 24),
(1.95, 92, 'Central', 25), (1.90, 84, 'Ponteiro', 26), (2.02, 97, 'Central', 27),
(1.89, 82, 'Levantador', 28), (1.87, 79, 'Oposto', 29), (1.99, 94, 'Ponteiro', 30);


INSERT INTO Treinador (Nome, idPessoa) VALUES
('Bernardinho', 1), ('Renan Dal Zotto', 2), ('Giovanni Guidetti', 3), ('Karch Kiraly', 4),
('Julio Velasco', 5), ('Hugh McCutcheon', 6), ('Andrea Giani', 7), ('Vital Heynen', 8),
('Raul Lozano', 9), ('John Speraw', 10), ('Marcelo Mendez', 11), ('Philippe Blain', 12),
('Glenn Hoag', 13), ('Nikola Grbic', 14), ('Laurent Tillie', 15), ('Andrea Anastasi', 16),
('Slobodan Kovac', 17), ('Robertlandy Simon', 18), ('Antiga Stephane', 19), ('John Cook', 20),
('Mark Lebedew', 21), ('Stefano Lavarini', 22), ('Luciano De Cecco', 23), ('Nicolás Uriarte', 24),
('Rafael Redwitz', 25), ('Carlos Weber', 26), ('Fabio Soli', 27), ('Vladimir Alekno', 28),
('Tamas Nehme', 29), ('Daniel Castellani', 30);


INSERT INTO Estadio (Nome, Capacidade, Localizacao) VALUES
('Ginásio do Mineirinho', 25000, 'Belo Horizonte'), ('Ginásio do Maracanãzinho', 11000, 'Rio de Janeiro'),
('Ginásio da Vila Leopoldina', 3500, 'São Paulo'), ('Ginásio Poliesportivo Divino Braga', 5000, 'Betim'),
('Ginásio da Universidade Positivo', 4500, 'Curitiba'), ('Ginásio do Ibirapuera', 10500, 'São Paulo'),
('Arena da Barra', 16000, 'Rio de Janeiro'), ('Arena Multiuso Presidente Tancredo Neves', 8000, 'Belo Horizonte'),
('Ginásio Oscar Zelaya', 2000, 'Rio de Janeiro'), ('Ginásio do Tênis Clube', 4000, 'São José dos Campos'),
('Ginásio do SESI', 3500, 'São Paulo'), ('Ginásio do Colégio Santo Agostinho', 1500, 'Belo Horizonte'),
('Ginásio do Marista', 2500, 'Curitiba'), ('Ginásio do Minas Tênis Clube', 4500, 'Belo Horizonte'),
('Arena Pernambuco', 30000, 'Recife'), ('Ginásio da UFV', 2000, 'Viçosa'),
('Ginásio do Tijuca Tênis Clube', 3500, 'Rio de Janeiro'), ('Arena Castelão', 60000, 'Fortaleza'),
('Arena Fonte Nova', 50000, 'Salvador'), ('Ginásio da Unifor', 3000, 'Fortaleza'),
('Ginásio do Fluminense', 2000, 'Rio de Janeiro'), ('Arena da Baixada', 42000, 'Curitiba'),
('Ginásio do Palmeiras', 3000, 'São Paulo'), ('Arena Corinthians', 49000, 'São Paulo'),
('Ginásio do São Caetano', 2000, 'São Caetano do Sul'), ('Ginásio da Hebraica', 1000, 'São Paulo'),
('Ginásio do Banespa', 2000, 'São Paulo'), ('Ginásio do Pinheiros', 3000, 'São Paulo'),
('Ginásio do Botafogo', 2000, 'Rio de Janeiro'), ('Ginásio do Flamengo', 2000, 'Rio de Janeiro');


INSERT INTO Partida (Total_Points, Rodada, Data_da_Partida, Duracao_da_Partida, id_Estadio) VALUES
(3, 1, '2023-01-01', '01:30:00', 1), (2, 2, '2023-02-01', '01:20:00', 2), 
(3, 3, '2023-03-01', '01:25:00', 3), (2, 4, '2023-04-01', '01:35:00', 4), 
(3, 5, '2023-05-01', '01:40:00', 5), (2, 6, '2023-06-01', '01:15:00', 6), 
(3, 7, '2023-07-01', '01:30:00', 7), (2, 8, '2023-08-01', '01:20:00', 8), 
(3, 9, '2023-09-01', '01:25:00', 9), (2, 10, '2023-10-01', '01:35:00', 10),
(3, 11, '2023-11-01', '01:30:00', 11), (2, 12, '2023-12-01', '01:20:00', 12),
(3, 13, '2023-11-01', '01:25:00', 13), (2, 14, '2023-12-01', '01:35:00', 14),
(3, 15, '2023-11-01', '01:40:00', 15), (2, 16, '2023-12-01', '01:15:00', 16),
(3, 17, '2023-11-01', '01:30:00', 17), (2, 18, '2023-12-01', '01:20:00', 18),
(3, 19, '2023-11-01', '01:25:00', 19), (2, 20, '2023-12-01', '01:35:00', 20),
(3, 21, '2023-11-01', '01:30:00', 21), (2, 22, '2023-12-01', '01:20:00', 22),
(3, 23, '2023-11-01', '01:25:00', 23), (2, 24, '2023-12-01', '01:35:00', 24),
(3, 25, '2023-11-01', '01:40:00', 25), (2, 26, '2023-12-01', '01:15:00', 26),
(3, 27, '2023-11-01', '01:30:00', 27), (2, 28, '2023-12-01', '01:20:00', 28),
(3, 29, '2023-11-01', '01:25:00', 29), (2, 30, '2023-12-01', '01:35:00', 30);


INSERT INTO Equipe (Nome, id_Patrocinador, id_Campeonato, id_Pais, id_Treinador) VALUES
('Sada Cruzeiro', 1, 1, 1, 1), ('SESI-SP', 2, 2, 1, 2), 
('Taubaté Funvic', 3, 3, 1, 3), ('Vôlei Renata', 4, 4, 1, 4), 
('Fiat/Minas', 5, 5, 1, 5), ('Vôlei UM Itapetininga', 6, 6, 1, 6), 
('Uberlândia/Gabarito/Start Química', 7, 7, 1, 7), ('Canoas Vôlei', 8, 8, 1, 8), 
('Vôlei Ribeirão', 9, 9, 1, 9), ('Ponta Grossa Vôlei', 10, 10, 1, 10),
('EMS Taubaté Funvic', 11, 11, 1, 11), ('Sesc-RJ', 12, 12, 1, 12),
('Corinthians/Guarulhos', 13, 13, 1, 13), ('Copel Telecom Maringá Vôlei', 14, 14, 1, 14),
('São Francisco Saúde/Vôlei Ribeirão', 15, 15, 1, 15), ('Ponta Grossa Caramuru', 16, 16, 1, 16),
('Apan/Blumenau', 17, 17, 1, 17), ('Vôlei Um Itapetininga', 18, 18, 1, 18),
('Maringá Vôlei', 19, 19, 1, 19), ('Juiz de Fora Vôlei', 20, 20, 1, 20),
('São José Vôlei', 21, 21, 1, 21), ('Montes Claros América Vôlei', 22, 22, 1, 22),
('Clube Jaó/Universo', 23, 23, 1, 23), ('Bento Vôlei', 24, 24, 1, 24),
('Upis/Brasília', 25, 25, 1, 25), ('Uberlândia/Gabarito', 26, 26, 1, 26),
('AVP-Palmas/Guarujá', 27, 27, 1, 27), ('Foz do Iguaçu Vôlei', 28, 28, 1, 28),
('Blumenau Vôlei', 29, 29, 1, 29), ('Natal Vôlei', 30, 30, 1, 30);








