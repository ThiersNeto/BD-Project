
-- Inserir dados na tabela Pais
INSERT INTO Pais (Nome) VALUES 
('Brasil'),
('Portugal'),
('Espanha'),
('Argentina'),
('Itália'),
('França'),
('Alemanha'),
('Holanda'),
('Rússia'),
('China'),
('Japão'),
('Austrália'),
('Estados Unidos'),
('Canadá'),
('México'),
('Chile'),
('Peru'),
('Colômbia'),
('Uruguai'),
('Paraguai');

-- Inserir dados na tabela Entidade_Organizadora
CALL PopularEntidadeOrganizadora('Confederação Brasileira de Voleibol', 1);
CALL PopularEntidadeOrganizadora('Federação Portuguesa de Voleibol', 2);
CALL PopularEntidadeOrganizadora('Federación Española de Voleibol', 3);
CALL PopularEntidadeOrganizadora('Federación Argentina de Voleibol', 4);
CALL PopularEntidadeOrganizadora('Federazione Italiana Pallavolo', 5);
CALL PopularEntidadeOrganizadora('Fédération Française de Volleyball', 6);
CALL PopularEntidadeOrganizadora('Deutscher Volleyball-Verband', 7);
CALL PopularEntidadeOrganizadora('Nederlandse Volleybalbond', 8);
CALL PopularEntidadeOrganizadora('Всероссийская федерация волейбола', 9);
CALL PopularEntidadeOrganizadora('Chinese Volleyball Association', 10);
CALL PopularEntidadeOrganizadora('日本バレーボール協会', 11);
CALL PopularEntidadeOrganizadora('Volleyball Australia', 12);
CALL PopularEntidadeOrganizadora('USA Volleyball', 13);
CALL PopularEntidadeOrganizadora('Volleyball Canada', 14);
CALL PopularEntidadeOrganizadora('Federación Mexicana de Voleibol', 15);
CALL PopularEntidadeOrganizadora('Federación de Voleibol de Chile', 16);
CALL PopularEntidadeOrganizadora('Federación Peruana de Voleibol', 17);
CALL PopularEntidadeOrganizadora('Federación Colombiana de Voleibol', 18);
CALL PopularEntidadeOrganizadora('Federación Uruguaya de Voleibol', 19);
CALL PopularEntidadeOrganizadora('Federación Paraguaya de Voleibol', 20);


-- Inserir dados na tabela Estadio
CALL PopularEstadio('Ginásio do Maracanãzinho', 12000);
CALL PopularEstadio('Pavilhão Atlântico', 20000);
CALL PopularEstadio('Palácio dos Desportos de Madri', 15000);
CALL PopularEstadio('Estadio Luna Park', 10000);
CALL PopularEstadio('PalaLottomatica', 11000);
CALL PopularEstadio('AccorHotels Arena', 16000);
CALL PopularEstadio('Max-Schmeling-Halle', 14000);
CALL PopularEstadio('Ahoy Rotterdam', 16000);
CALL PopularEstadio('Olimpiyskiy Stadium', 35000);
CALL PopularEstadio('Beijing Gymnasium', 19000);
CALL PopularEstadio('Yoyogi National Gymnasium', 13500);
CALL PopularEstadio('Qudos Bank Arena', 21000);
CALL PopularEstadio('Staples Center', 20000);
CALL PopularEstadio('Rogers Centre', 50000);
CALL PopularEstadio('Arena Monterrey', 17500);
CALL PopularEstadio('Movistar Arena', 17000);
CALL PopularEstadio('Estadio Nacional', 25000);
CALL PopularEstadio('Coliseo El Campín', 14000);
CALL PopularEstadio('Antel Arena', 15000);
CALL PopularEstadio('Arena SND', 10000);

-- Inserir dados na tabela Resultado
INSERT INTO Resultado (Descricao) VALUES 
('Vitória por 3-0'),
('Vitória por 3-1'),
('Vitória por 3-2'),
('Derrota por 0-3'),
('Derrota por 1-3'),
('Derrota por 2-3'),
('Empate 2-2'),
('Empate 1-1'),
('Sem resultado'),
('Adiado');

-- Inserir dados na tabela Pessoa

CALL PopularPessoa('Carlos Silva', 'Cidade A', 'Rua A', 'Bairro A');
CALL PopularPessoa('Ana Pereira', 'Cidade B', 'Rua B', 'Bairro B');
CALL PopularPessoa('Marcos Almeida', 'Cidade C', 'Rua C', 'Bairro C');
CALL PopularPessoa('Joana Costa', 'Cidade D', 'Rua D', 'Bairro D');
CALL PopularPessoa('Luis Santos', 'Cidade E', 'Rua E', 'Bairro E');
CALL PopularPessoa('Maria Gomez', 'Cidade F', 'Rua F', 'Bairro F');
CALL PopularPessoa('Pedro Martinez', 'Cidade G', 'Rua G', 'Bairro G');
CALL PopularPessoa('Lucia Fernandez', 'Cidade H', 'Rua H', 'Bairro H');
CALL PopularPessoa('Antonio Rossi', 'Cidade I', 'Rua I', 'Bairro I');
CALL PopularPessoa('Sofia Bianchi', 'Cidade J', 'Rua J', 'Bairro J');
CALL PopularPessoa('Jean Dupont', 'Cidade K', 'Rua K', 'Bairro K');
CALL PopularPessoa('Isabelle Martin', 'Cidade L', 'Rua L', 'Bairro L');
CALL PopularPessoa('Hans Müller', 'Cidade M', 'Rua M', 'Bairro M');
CALL PopularPessoa('Klaus Schmidt', 'Cidade N', 'Rua N', 'Bairro N');
CALL PopularPessoa('Jan Jansen', 'Cidade O', 'Rua O', 'Bairro O');
CALL PopularPessoa('Emma de Vries', 'Cidade P', 'Rua P', 'Bairro P');
CALL PopularPessoa('Ivan Ivanov', 'Cidade Q', 'Rua Q', 'Bairro Q');
CALL PopularPessoa('Olga Smirnova', 'Cidade R', 'Rua R', 'Bairro R');
CALL PopularPessoa('Li Wei', 'Cidade S', 'Rua S', 'Bairro S');
CALL PopularPessoa('Wang Fang', 'Cidade T', 'Rua T', 'Bairro T');
CALL PopularPessoa('Carlos Silva', 'Cidade U', 'Rua U', 'Bairro U');
CALL PopularPessoa('Ana Pereira', 'Cidade V', 'Rua V', 'Bairro V');
CALL PopularPessoa('Marcos Almeida', 'Cidade W', 'Rua W', 'Bairro W');
CALL PopularPessoa('Joana Costa', 'Cidade X', 'Rua X', 'Bairro X');
CALL PopularPessoa('Luis Santos', 'Cidade Y', 'Rua Y', 'Bairro Y');
CALL PopularPessoa('Maria Gomez', 'Cidade Z', 'Rua Z', 'Bairro Z');
CALL PopularPessoa('Pedro Martinez', 'Cidade AA', 'Rua AA', 'Bairro AA');
CALL PopularPessoa('Lucia Fernandez', 'Cidade AB', 'Rua AB', 'Bairro AB');
CALL PopularPessoa('Antonio Rossi', 'Cidade AC', 'Rua AC', 'Bairro AC');
CALL PopularPessoa('Sofia Bianchi', 'Cidade AD', 'Rua AD', 'Bairro AD');
CALL PopularPessoa('Jean Dupont', 'Cidade AE', 'Rua AE', 'Bairro AE');
CALL PopularPessoa('Isabelle Martin', 'Cidade AF', 'Rua AF', 'Bairro AF');
CALL PopularPessoa('Hans Müller', 'Cidade AG', 'Rua AG', 'Bairro AG');
CALL PopularPessoa('Klaus Schmidt', 'Cidade AH', 'Rua AH', 'Bairro AH');
CALL PopularPessoa('Jan Jansen', 'Cidade AI', 'Rua AI', 'Bairro AI');
CALL PopularPessoa('Emma de Vries', 'Cidade AJ', 'Rua AJ', 'Bairro AJ');
CALL PopularPessoa('Ivan Ivanov', 'Cidade AK', 'Rua AK', 'Bairro AK');
CALL PopularPessoa('Olga Smirnova', 'Cidade AL', 'Rua AL', 'Bairro AL');
CALL PopularPessoa('Li Wei', 'Cidade AM', 'Rua AM', 'Bairro AM');
CALL PopularPessoa('Wang Fang', 'Cidade AN', 'Rua AN', 'Bairro AN');
CALL PopularPessoa('Carlos Silva', 'Cidade AO', 'Rua AO', 'Bairro AO');
CALL PopularPessoa('Ana Pereira', 'Cidade AP', 'Rua AP', 'Bairro AP');
CALL PopularPessoa('Marcos Almeida', 'Cidade AQ', 'Rua AQ', 'Bairro AQ');
CALL PopularPessoa('Joana Costa', 'Cidade AR', 'Rua AR', 'Bairro AR');
CALL PopularPessoa('Luis Santos', 'Cidade AS', 'Rua AS', 'Bairro AS');
CALL PopularPessoa('Maria Gomez', 'Cidade AT', 'Rua AT', 'Bairro AT');
CALL PopularPessoa('Pedro Martinez', 'Cidade AU', 'Rua AU', 'Bairro AU');
CALL PopularPessoa('Lucia Fernandez', 'Cidade AV', 'Rua AV', 'Bairro AV');
CALL PopularPessoa('Antonio Rossi', 'Cidade AW', 'Rua AW', 'Bairro AW');
CALL PopularPessoa('Sofia Bianchi', 'Cidade AX', 'Rua AX', 'Bairro AX');
CALL PopularPessoa('Jean Dupont', 'Cidade AY', 'Rua AY', 'Bairro AY');
CALL PopularPessoa('Isabelle Martin', 'Cidade AZ', 'Rua AZ', 'Bairro AZ');
CALL PopularPessoa('Hans Müller', 'Cidade BA', 'Rua BA', 'Bairro BA');
CALL PopularPessoa('Klaus Schmidt', 'Cidade BB', 'Rua BB', 'Bairro BB');
CALL PopularPessoa('Jan Jansen', 'Cidade BC', 'Rua BC', 'Bairro BC');
CALL PopularPessoa('Emma de Vries', 'Cidade BD', 'Rua BD', 'Bairro BD');
CALL PopularPessoa('Ivan Ivanov', 'Cidade BE', 'Rua BE', 'Bairro BE');
CALL PopularPessoa('Olga Smirnova', 'Cidade BF', 'Rua BF', 'Bairro BF');
CALL PopularPessoa('Li Wei', 'Cidade BG', 'Rua BG', 'Bairro BG');
CALL PopularPessoa('Wang Fang', 'Cidade BH', 'Rua BH', 'Bairro BH');
CALL PopularPessoa('Carlos Silva', 'Cidade BI', 'Rua BI', 'Bairro BI');
CALL PopularPessoa('Ana Pereira', 'Cidade BJ', 'Rua BJ', 'Bairro BJ');
CALL PopularPessoa('Marcos Almeida', 'Cidade BK', 'Rua BK', 'Bairro BK');
CALL PopularPessoa('Joana Costa', 'Cidade BL', 'Rua BL', 'Bairro BL');
CALL PopularPessoa('Luis Santos', 'Cidade BM', 'Rua BM', 'Bairro BM');
CALL PopularPessoa('Maria Gomez', 'Cidade BN', 'Rua BN', 'Bairro BN');
CALL PopularPessoa('Pedro Martinez', 'Cidade BO', 'Rua BO', 'Bairro BO');
CALL PopularPessoa('Lucia Fernandez', 'Cidade BP', 'Rua BP', 'Bairro BP');
CALL PopularPessoa('Antonio Rossi', 'Cidade BQ', 'Rua BQ', 'Bairro BQ');
CALL PopularPessoa('Sofia Bianchi', 'Cidade BR', 'Rua BR', 'Bairro BR');
CALL PopularPessoa('Jean Dupont', 'Cidade BS', 'Rua BS', 'Bairro BS');
CALL PopularPessoa('Isabelle Martin', 'Cidade BT', 'Rua BT', 'Bairro BT');
CALL PopularPessoa('Hans Müller', 'Cidade BU', 'Rua BU', 'Bairro BU');
CALL PopularPessoa('Klaus Schmidt', 'Cidade BV', 'Rua BV', 'Bairro BV');
CALL PopularPessoa('Jan Jansen', 'Cidade BW', 'Rua BW', 'Bairro BW');
CALL PopularPessoa('Emma de Vries', 'Cidade BX', 'Rua BX', 'Bairro BX');
CALL PopularPessoa('Ivan Ivanov', 'Cidade BY', 'Rua BY', 'Bairro BY');
CALL PopularPessoa('Olga Smirnova', 'Cidade BZ', 'Rua BZ', 'Bairro BZ');
CALL PopularPessoa('Li Wei', 'Cidade CA', 'Rua CA', 'Bairro CA');
CALL PopularPessoa('Wang Fang', 'Cidade CB', 'Rua CB', 'Bairro CB');
CALL PopularPessoa('Carlos Silva', 'Cidade CC', 'Rua CC', 'Bairro CC');
CALL PopularPessoa('Ana Pereira', 'Cidade CD', 'Rua CD', 'Bairro CD');
CALL PopularPessoa('Marcos Almeida', 'Cidade CE', 'Rua CE', 'Bairro CE');
CALL PopularPessoa('Joana Costa', 'Cidade CF', 'Rua CF', 'Bairro CF');
CALL PopularPessoa('Luis Santos', 'Cidade CG', 'Rua CG', 'Bairro CG');
CALL PopularPessoa('Maria Gomez', 'Cidade CH', 'Rua CH', 'Bairro CH');
CALL PopularPessoa('Pedro Martinez', 'Cidade CI', 'Rua CI', 'Bairro CI');
CALL PopularPessoa('Lucia Fernandez', 'Cidade CJ', 'Rua CJ', 'Bairro CJ');
CALL PopularPessoa('Antonio Rossi', 'Cidade CK', 'Rua CK', 'Bairro CK');
CALL PopularPessoa('Sofia Bianchi', 'Cidade CL', 'Rua CL', 'Bairro CL');
CALL PopularPessoa('Jean Dupont', 'Cidade CM', 'Rua CM', 'Bairro CM');
CALL PopularPessoa('Isabelle Martin', 'Cidade CN', 'Rua CN', 'Bairro CN');
CALL PopularPessoa('Hans Müller', 'Cidade CO', 'Rua CO', 'Bairro CO');
CALL PopularPessoa('Klaus Schmidt', 'Cidade CP', 'Rua CP', 'Bairro CP');
CALL PopularPessoa('Jan Jansen', 'Cidade CQ', 'Rua CQ', 'Bairro CQ');
CALL PopularPessoa('Emma de Vries', 'Cidade CR', 'Rua CR', 'Bairro CR');
CALL PopularPessoa('Ivan Ivanov', 'Cidade CS', 'Rua CS', 'Bairro CS');
CALL PopularPessoa('Olga Smirnova', 'Cidade CT', 'Rua CT', 'Bairro CT');
CALL PopularPessoa('Li Wei', 'Cidade CU', 'Rua CU', 'Bairro CU');
CALL PopularPessoa('Wang Fang', 'Cidade CV', 'Rua CV', 'Bairro CV');
CALL PopularPessoa('Carlos Silva', 'Cidade CW', 'Rua CW', 'Bairro CW');
CALL PopularPessoa('Ana Pereira', 'Cidade CX', 'Rua CX', 'Bairro CX');
CALL PopularPessoa('Marcos Almeida', 'Cidade CY', 'Rua CY', 'Bairro CY');
CALL PopularPessoa('Joana Costa', 'Cidade CZ', 'Rua CZ', 'Bairro CZ');
CALL PopularPessoa('Luis Santos', 'Cidade DA', 'Rua DA', 'Bairro DA');
CALL PopularPessoa('Maria Gomez', 'Cidade DB', 'Rua DB', 'Bairro DB');
CALL PopularPessoa('Pedro Martinez', 'Cidade DC', 'Rua DC', 'Bairro DC');
CALL PopularPessoa('Lucia Fernandez', 'Cidade DD', 'Rua DD', 'Bairro DD');
CALL PopularPessoa('Antonio Rossi', 'Cidade DE', 'Rua DE', 'Bairro DE');
CALL PopularPessoa('Sofia Bianchi', 'Cidade DF', 'Rua DF', 'Bairro DF');
CALL PopularPessoa('Jean Dupont', 'Cidade DG', 'Rua DG', 'Bairro DG');
CALL PopularPessoa('Isabelle Martin', 'Cidade DH', 'Rua DH', 'Bairro DH');
CALL PopularPessoa('Hans Müller', 'Cidade DI', 'Rua DI', 'Bairro DI');
CALL PopularPessoa('Klaus Schmidt', 'Cidade DJ', 'Rua DJ', 'Bairro DJ');
CALL PopularPessoa('Jan Jansen', 'Cidade DK', 'Rua DK', 'Bairro DK');
CALL PopularPessoa('Emma de Vries', 'Cidade DL', 'Rua DL', 'Bairro DL');
CALL PopularPessoa('Ivan Ivanov', 'Cidade DM', 'Rua DM', 'Bairro DM');
CALL PopularPessoa('Olga Smirnova', 'Cidade DN', 'Rua DN', 'Bairro DN');
CALL PopularPessoa('Li Wei', 'Cidade DO', 'Rua DO', 'Bairro DO');
CALL PopularPessoa('Wang Fang', 'Cidade DP', 'Rua DP', 'Bairro DP');

-- Inserir dados na tabela FichaTecnica
CALL PopularFichaTecnica('1990-01-01', 1.85, 80, 1);
CALL PopularFichaTecnica('1992-02-02', 1.78, 65, 2);
CALL PopularFichaTecnica('1988-03-03', 1.90, 75, 3);
CALL PopularFichaTecnica('1991-04-04', 1.82, 70, 4);
CALL PopularFichaTecnica('1993-05-05', 1.75, 68, 5);
CALL PopularFichaTecnica('1987-06-06', 1.88, 77, 6);
CALL PopularFichaTecnica('1990-07-07', 1.84, 72, 7);
CALL PopularFichaTecnica('1991-08-08', 1.76, 69, 8);
CALL PopularFichaTecnica('1989-09-09', 1.92, 80, 9);
CALL PopularFichaTecnica('1994-10-10', 1.78, 66, 10);
CALL PopularFichaTecnica('1986-11-11', 1.85, 74, 11);
CALL PopularFichaTecnica('1992-12-12', 1.81, 70, 12);
CALL PopularFichaTecnica('1989-01-13', 1.90, 78, 13);
CALL PopularFichaTecnica('1993-02-14', 1.77, 67, 14);
CALL PopularFichaTecnica('1990-03-15', 1.82, 71, 15);
CALL PopularFichaTecnica('1987-04-16', 1.88, 76, 16);
CALL PopularFichaTecnica('1991-05-17', 1.84, 73, 17);
CALL PopularFichaTecnica('1992-06-18', 1.79, 68, 18);
CALL PopularFichaTecnica('1990-07-19', 1.86, 75, 19);
CALL PopularFichaTecnica('1993-08-20', 1.80, 69, 20);
CALL PopularFichaTecnica('1990-01-01', 1.85, 80, 21);
CALL PopularFichaTecnica('1992-02-02', 1.78, 65, 22);
CALL PopularFichaTecnica('1988-03-03', 1.90, 75, 23);
CALL PopularFichaTecnica('1991-04-04', 1.82, 70, 24);
CALL PopularFichaTecnica('1993-05-05', 1.75, 68, 25);
CALL PopularFichaTecnica('1987-06-06', 1.88, 77, 26);
CALL PopularFichaTecnica('1990-07-07', 1.84, 72, 27);
CALL PopularFichaTecnica('1991-08-08', 1.76, 69, 28);
CALL PopularFichaTecnica('1989-09-09', 1.92, 80, 29);
CALL PopularFichaTecnica('1994-10-10', 1.78, 66, 30);
CALL PopularFichaTecnica('1986-11-11', 1.85, 74, 31);
CALL PopularFichaTecnica('1992-12-12', 1.81, 70, 32);
CALL PopularFichaTecnica('1989-01-13', 1.90, 78, 33);
CALL PopularFichaTecnica('1993-02-14', 1.77, 67, 34);
CALL PopularFichaTecnica('1990-03-15', 1.82, 71, 35);
CALL PopularFichaTecnica('1987-04-16', 1.88, 76, 36);
CALL PopularFichaTecnica('1991-05-17', 1.84, 73, 37);
CALL PopularFichaTecnica('1992-06-18', 1.79, 68, 38);
CALL PopularFichaTecnica('1990-07-19', 1.86, 75, 39);
CALL PopularFichaTecnica('1993-08-20', 1.80, 69, 40);
CALL PopularFichaTecnica('1990-01-01', 1.85, 80, 41);
CALL PopularFichaTecnica('1992-02-02', 1.78, 65, 42);
CALL PopularFichaTecnica('1988-03-03', 1.90, 75, 43);
CALL PopularFichaTecnica('1991-04-04', 1.82, 70, 44);
CALL PopularFichaTecnica('1993-05-05', 1.75, 68, 45);
CALL PopularFichaTecnica('1987-06-06', 1.88, 77, 46);
CALL PopularFichaTecnica('1990-07-07', 1.84, 72, 47);
CALL PopularFichaTecnica('1991-08-08', 1.76, 69, 48);
CALL PopularFichaTecnica('1989-09-09', 1.92, 80, 49);
CALL PopularFichaTecnica('1994-10-10', 1.78, 66, 50);
CALL PopularFichaTecnica('1986-11-11', 1.85, 74, 51);
CALL PopularFichaTecnica('1992-12-12', 1.81, 70, 52);
CALL PopularFichaTecnica('1989-01-13', 1.90, 78, 53);
CALL PopularFichaTecnica('1993-02-14', 1.77, 67, 54);
CALL PopularFichaTecnica('1990-03-15', 1.82, 71, 55);
CALL PopularFichaTecnica('1987-04-16', 1.88, 76, 56);
CALL PopularFichaTecnica('1991-05-17', 1.84, 73, 57);
CALL PopularFichaTecnica('1992-06-18', 1.79, 68, 58);
CALL PopularFichaTecnica('1990-07-19', 1.86, 75, 59);
CALL PopularFichaTecnica('1993-08-20', 1.80, 69, 60);
CALL PopularFichaTecnica('1990-01-01', 1.85, 80, 61);
CALL PopularFichaTecnica('1992-02-02', 1.78, 65, 62);
CALL PopularFichaTecnica('1988-03-03', 1.90, 75, 63);
CALL PopularFichaTecnica('1991-04-04', 1.82, 70, 64);
CALL PopularFichaTecnica('1993-05-05', 1.75, 68, 65);
CALL PopularFichaTecnica('1987-06-06', 1.88, 77, 66);
CALL PopularFichaTecnica('1990-07-07', 1.84, 72, 67);
CALL PopularFichaTecnica('1991-08-08', 1.76, 69, 68);
CALL PopularFichaTecnica('1989-09-09', 1.92, 80, 69);
CALL PopularFichaTecnica('1994-10-10', 1.78, 66, 70);
CALL PopularFichaTecnica('1986-11-11', 1.85, 74, 71);
CALL PopularFichaTecnica('1992-12-12', 1.81, 70, 72);
CALL PopularFichaTecnica('1989-01-13', 1.90, 78, 73);
CALL PopularFichaTecnica('1993-02-14', 1.77, 67, 74);
CALL PopularFichaTecnica('1990-03-15', 1.82, 71, 75);
CALL PopularFichaTecnica('1987-04-16', 1.88, 76, 76);
CALL PopularFichaTecnica('1991-05-17', 1.84, 73, 77);
CALL PopularFichaTecnica('1992-06-18', 1.79, 68, 78);
CALL PopularFichaTecnica('1990-07-19', 1.86, 75, 79);
CALL PopularFichaTecnica('1993-08-20', 1.80, 69, 80);
CALL PopularFichaTecnica('1990-01-01', 1.85, 80, 81);
CALL PopularFichaTecnica('1992-02-02', 1.78, 65, 82);
CALL PopularFichaTecnica('1988-03-03', 1.90, 75, 83);
CALL PopularFichaTecnica('1991-04-04', 1.82, 70, 84);
CALL PopularFichaTecnica('1993-05-05', 1.75, 68, 85);
CALL PopularFichaTecnica('1987-06-06', 1.88, 77, 86);
CALL PopularFichaTecnica('1990-07-07', 1.84, 72, 87);
CALL PopularFichaTecnica('1991-08-08', 1.76, 69, 88);
CALL PopularFichaTecnica('1989-09-09', 1.92, 80, 89);
CALL PopularFichaTecnica('1994-10-10', 1.78, 66, 90);
CALL PopularFichaTecnica('1986-11-11', 1.85, 74, 91);
CALL PopularFichaTecnica('1992-12-12', 1.81, 70, 92);
CALL PopularFichaTecnica('1989-01-13', 1.90, 78, 93);
CALL PopularFichaTecnica('1993-02-14', 1.77, 67, 94);
CALL PopularFichaTecnica('1990-03-15', 1.82, 71, 95);
CALL PopularFichaTecnica('1987-04-16', 1.88, 76, 96);
CALL PopularFichaTecnica('1991-05-17', 1.84, 73, 97);
CALL PopularFichaTecnica('1992-06-18', 1.79, 68, 98);
CALL PopularFichaTecnica('1990-07-19', 1.86, 75, 99);
CALL PopularFichaTecnica('1993-08-20', 1.80, 69, 100);
CALL PopularFichaTecnica('1990-01-01', 1.85, 80, 101);
CALL PopularFichaTecnica('1992-02-02', 1.78, 65, 102);
CALL PopularFichaTecnica('1988-03-03', 1.90, 75, 103);
CALL PopularFichaTecnica('1991-04-04', 1.82, 70, 104);
CALL PopularFichaTecnica('1993-05-05', 1.75, 68, 105);
CALL PopularFichaTecnica('1987-06-06', 1.88, 77, 106);
CALL PopularFichaTecnica('1990-07-07', 1.84, 72, 107);
CALL PopularFichaTecnica('1991-08-08', 1.76, 69, 108);
CALL PopularFichaTecnica('1989-09-09', 1.92, 80, 109);
CALL PopularFichaTecnica('1994-10-10', 1.78, 66, 110);
CALL PopularFichaTecnica('1986-11-11', 1.85, 74, 111);
CALL PopularFichaTecnica('1992-12-12', 1.81, 70, 112);
CALL PopularFichaTecnica('1989-01-13', 1.90, 78, 113);
CALL PopularFichaTecnica('1993-02-14', 1.77, 67, 114);
CALL PopularFichaTecnica('1990-03-15', 1.82, 71, 115);
CALL PopularFichaTecnica('1987-04-16', 1.88, 76, 116);
CALL PopularFichaTecnica('1991-05-17', 1.84, 73, 117);
CALL PopularFichaTecnica('1992-06-18', 1.79, 68, 118);
CALL PopularFichaTecnica('1990-07-19', 1.86, 75, 119);
CALL PopularFichaTecnica('1993-08-20', 1.80, 69, 120);


-- Inserir dados na tabela Treinador
CALL PopularTreinador('Carlos Silva', 'Técnico Principal', 10, 1);
CALL PopularTreinador('Ana Pereira', 'Auxiliar Técnico', 8, 2);
CALL PopularTreinador('Marcos Almeida', 'Preparador Físico', 12, 3);
CALL PopularTreinador('Joana Costa', 'Analista de Desempenho', 5, 4);
CALL PopularTreinador('Luis Santos', 'Técnico Principal', 15, 5);
CALL PopularTreinador('Maria Gomez', 'Auxiliar Técnico', 9, 6);
CALL PopularTreinador('Pedro Martinez', 'Preparador Físico', 10, 7);
CALL PopularTreinador('Lucia Fernandez', 'Analista de Desempenho', 6, 8);
CALL PopularTreinador('Antonio Rossi', 'Técnico Principal', 14, 9);
CALL PopularTreinador('Sofia Bianchi', 'Auxiliar Técnico', 7, 10);
CALL PopularTreinador('Jean Dupont', 'Preparador Físico', 11, 11);
CALL PopularTreinador('Isabelle Martin', 'Analista de Desempenho', 4, 12);
CALL PopularTreinador('Hans Müller', 'Técnico Principal', 13, 13);
CALL PopularTreinador('Klaus Schmidt', 'Auxiliar Técnico', 8, 14);
CALL PopularTreinador('Jan Jansen', 'Preparador Físico', 9, 15);
CALL PopularTreinador('Emma de Vries', 'Analista de Desempenho', 5, 16);
CALL PopularTreinador('Ivan Ivanov', 'Técnico Principal', 12, 17);
CALL PopularTreinador('Olga Smirnova', 'Auxiliar Técnico', 6, 18);
CALL PopularTreinador('Li Wei', 'Preparador Físico', 10, 19);
CALL PopularTreinador('Wang Fang', 'Analista de Desempenho', 7, 20);

-- Inserir dados na tabela Equipa
INSERT INTO Equipa (NomeEquipa, IdadeDaEquipa, IdPais) VALUES 
('Equipe A', 10, 1),
('Equipe B', 8, 2),
('Equipe C', 12, 3),
('Equipe D', 5, 4),
('Equipe E', 15, 5),
('Equipe F', 9, 6),
('Equipe G', 10, 7),
('Equipe H', 6, 8),
('Equipe I', 14, 9),
('Equipe J', 7, 10),
('Equipe K', 11, 11),
('Equipe L', 4, 12),
('Equipe M', 13, 13),
('Equipe N', 8, 14),
('Equipe O', 9, 15),
('Equipe P', 5, 16),
('Equipe Q', 12, 17),
('Equipe R', 6, 18),
('Equipe S', 10, 19),
('Equipe T', 7, 20);

-- Inserir dados na tabela Atleta
CALL PopularAtleta('Carlos Silva', 'Levantador', 1, TRUE, 1, 1);
CALL PopularAtleta('Ana Pereira', 'Oposto', 2, FALSE, 2, 1);
CALL PopularAtleta('Marcos Almeida', 'Ponteiro', 3, FALSE, 3, 1);
CALL PopularAtleta('Joana Costa', 'Central', 4, FALSE, 4, 1);
CALL PopularAtleta('Luis Santos', 'Líbero', 5, TRUE, 5, 1);
CALL PopularAtleta('Maria Gomez', 'Ponteiro', 6, FALSE, 6, 1);
CALL PopularAtleta('Pedro Martinez', 'Levantador', 7, TRUE, 7, 2);
CALL PopularAtleta('Lucia Fernandez', 'Oposto', 8, FALSE, 8, 2);
CALL PopularAtleta('Antonio Rossi', 'Ponteiro', 9, FALSE, 9, 2);
CALL PopularAtleta('Sofia Bianchi', 'Central', 10, FALSE, 10, 2);
CALL PopularAtleta('Jean Dupont', 'Líbero', 11, TRUE, 11, 2);
CALL PopularAtleta('Isabelle Martin', 'Ponteiro', 12, FALSE, 12, 2);
CALL PopularAtleta('Hans Müller', 'Levantador', 13, TRUE, 13, 3);
CALL PopularAtleta('Klaus Schmidt', 'Oposto', 14, FALSE, 14, 3);
CALL PopularAtleta('Jan Jansen', 'Ponteiro', 15, FALSE, 15, 3);
CALL PopularAtleta('Emma de Vries', 'Central', 16, FALSE, 16, 3);
CALL PopularAtleta('Ivan Ivanov', 'Líbero', 17, TRUE, 17, 3);
CALL PopularAtleta('Olga Smirnova', 'Ponteiro', 18, FALSE, 18, 3);
CALL PopularAtleta('Li Wei', 'Levantador', 19, TRUE, 19, 4);
CALL PopularAtleta('Wang Fang', 'Oposto', 20, FALSE, 20, 4);
CALL PopularAtleta('Carlos Silva', 'Ponteiro', 21, FALSE, 21, 4);
CALL PopularAtleta('Ana Pereira', 'Central', 22, FALSE, 22, 4);
CALL PopularAtleta('Marcos Almeida', 'Líbero', 23, TRUE, 23, 4);
CALL PopularAtleta('Joana Costa', 'Ponteiro', 24, FALSE, 24, 4);
CALL PopularAtleta('Luis Santos', 'Levantador', 25, TRUE, 25, 5);
CALL PopularAtleta('Maria Gomez', 'Oposto', 26, FALSE, 26, 5);
CALL PopularAtleta('Pedro Martinez', 'Ponteiro', 27, FALSE, 27, 5);
CALL PopularAtleta('Lucia Fernandez', 'Central', 28, FALSE, 28, 5);
CALL PopularAtleta('Antonio Rossi', 'Líbero', 29, TRUE, 29, 5);
CALL PopularAtleta('Sofia Bianchi', 'Ponteiro', 30, FALSE, 30, 5);
CALL PopularAtleta('Jean Dupont', 'Levantador', 31, TRUE, 31, 6);
CALL PopularAtleta('Isabelle Martin', 'Oposto', 32, FALSE, 32, 6);
CALL PopularAtleta('Hans Müller', 'Ponteiro', 33, FALSE, 33, 6);
CALL PopularAtleta('Klaus Schmidt', 'Central', 34, FALSE, 34, 6);
CALL PopularAtleta('Jan Jansen', 'Líbero', 35, TRUE, 35, 6);
CALL PopularAtleta('Emma de Vries', 'Ponteiro', 36, FALSE, 36, 6);
CALL PopularAtleta('Ivan Ivanov', 'Levantador', 37, TRUE, 37, 7);
CALL PopularAtleta('Olga Smirnova', 'Oposto', 38, FALSE, 38, 7);
CALL PopularAtleta('Li Wei', 'Ponteiro', 39, FALSE, 39, 7);
CALL PopularAtleta('Wang Fang', 'Central', 40, FALSE, 40, 7);
CALL PopularAtleta('Carlos Silva', 'Líbero', 41, TRUE, 41, 7);
CALL PopularAtleta('Ana Pereira', 'Ponteiro', 42, FALSE, 42, 7);
CALL PopularAtleta('Marcos Almeida', 'Levantador', 43, TRUE, 43, 8);
CALL PopularAtleta('Joana Costa', 'Oposto', 44, FALSE, 44, 8);
CALL PopularAtleta('Luis Santos', 'Ponteiro', 45, FALSE, 45, 8);
CALL PopularAtleta('Maria Gomez', 'Central', 46, FALSE, 46, 8);
CALL PopularAtleta('Pedro Martinez', 'Líbero', 47, TRUE, 47, 8);
CALL PopularAtleta('Lucia Fernandez', 'Ponteiro', 48, FALSE, 48, 8);
CALL PopularAtleta('Antonio Rossi', 'Levantador', 49, TRUE, 49, 9);
CALL PopularAtleta('Sofia Bianchi', 'Oposto', 50, FALSE, 50, 9);
CALL PopularAtleta('Jean Dupont', 'Ponteiro', 51, FALSE, 51, 9);
CALL PopularAtleta('Isabelle Martin', 'Central', 52, FALSE, 52, 9);
CALL PopularAtleta('Hans Müller', 'Líbero', 53, TRUE, 53, 9);
CALL PopularAtleta('Klaus Schmidt', 'Ponteiro', 54, FALSE, 54, 9);
CALL PopularAtleta('Jan Jansen', 'Levantador', 55, TRUE, 55, 10);
CALL PopularAtleta('Emma de Vries', 'Oposto', 56, FALSE, 56, 10);
CALL PopularAtleta('Ivan Ivanov', 'Ponteiro', 57, FALSE, 57, 10);
CALL PopularAtleta('Olga Smirnova', 'Central', 58, FALSE, 58, 10);
CALL PopularAtleta('Li Wei', 'Líbero', 59, TRUE, 59, 10);
CALL PopularAtleta('Wang Fang', 'Ponteiro', 60, FALSE, 60, 10);
CALL PopularAtleta('Carlos Silva', 'Levantador', 61, TRUE, 61, 11);
CALL PopularAtleta('Ana Pereira', 'Oposto', 62, FALSE, 62, 11);
CALL PopularAtleta('Marcos Almeida', 'Ponteiro', 63, FALSE, 63, 11);
CALL PopularAtleta('Joana Costa', 'Central', 64, FALSE, 64, 11);
CALL PopularAtleta('Luis Santos', 'Líbero', 65, TRUE, 65, 11);
CALL PopularAtleta('Maria Gomez', 'Ponteiro', 66, FALSE, 66, 11);
CALL PopularAtleta('Pedro Martinez', 'Levantador', 67, TRUE, 67, 12);
CALL PopularAtleta('Lucia Fernandez', 'Oposto', 68, FALSE, 68, 12);
CALL PopularAtleta('Antonio Rossi', 'Ponteiro', 69, FALSE, 69, 12);
CALL PopularAtleta('Sofia Bianchi', 'Central', 70, FALSE, 70, 12);
CALL PopularAtleta('Jean Dupont', 'Líbero', 71, TRUE, 71, 12);
CALL PopularAtleta('Isabelle Martin', 'Ponteiro', 72, FALSE, 72, 12);
CALL PopularAtleta('Hans Müller', 'Levantador', 73, TRUE, 73, 13);
CALL PopularAtleta('Klaus Schmidt', 'Oposto', 74, FALSE, 74, 13);
CALL PopularAtleta('Jan Jansen', 'Ponteiro', 75, FALSE, 75, 13);
CALL PopularAtleta('Emma de Vries', 'Central', 76, FALSE, 76, 13);
CALL PopularAtleta('Ivan Ivanov', 'Líbero', 77, TRUE, 77, 13);
CALL PopularAtleta('Olga Smirnova', 'Ponteiro', 78, FALSE, 78, 13);
CALL PopularAtleta('Li Wei', 'Levantador', 79, TRUE, 79, 14);
CALL PopularAtleta('Wang Fang', 'Oposto', 80, FALSE, 80, 14);
CALL PopularAtleta('Carlos Silva', 'Ponteiro', 81, FALSE, 81, 14);
CALL PopularAtleta('Ana Pereira', 'Central', 82, FALSE, 82, 14);
CALL PopularAtleta('Marcos Almeida', 'Líbero', 83, TRUE, 83, 14);
CALL PopularAtleta('Joana Costa', 'Ponteiro', 84, FALSE, 84, 14);
CALL PopularAtleta('Luis Santos', 'Levantador', 85, TRUE, 85, 15);
CALL PopularAtleta('Maria Gomez', 'Oposto', 86, FALSE, 86, 15);
CALL PopularAtleta('Pedro Martinez', 'Ponteiro', 87, FALSE, 87, 15);
CALL PopularAtleta('Lucia Fernandez', 'Central', 88, FALSE, 88, 15);
CALL PopularAtleta('Antonio Rossi', 'Líbero', 89, TRUE, 89, 15);
CALL PopularAtleta('Sofia Bianchi', 'Ponteiro', 90, FALSE, 90, 15);
CALL PopularAtleta('Jean Dupont', 'Levantador', 91, TRUE, 91, 16);
CALL PopularAtleta('Isabelle Martin', 'Oposto', 92, FALSE, 92, 16);
CALL PopularAtleta('Hans Müller', 'Ponteiro', 93, FALSE, 93, 16);
CALL PopularAtleta('Klaus Schmidt', 'Central', 94, FALSE, 94, 16);
CALL PopularAtleta('Jan Jansen', 'Líbero', 95, TRUE, 95, 16);
CALL PopularAtleta('Emma de Vries', 'Ponteiro', 96, FALSE, 96, 16);
CALL PopularAtleta('Ivan Ivanov', 'Levantador', 97, TRUE, 97, 17);
CALL PopularAtleta('Olga Smirnova', 'Oposto', 98, FALSE, 98, 17);
CALL PopularAtleta('Li Wei', 'Ponteiro', 99, FALSE, 99, 17);
CALL PopularAtleta('Wang Fang', 'Central', 100, FALSE, 100, 17);
CALL PopularAtleta('Carlos Silva', 'Líbero', 101, TRUE, 101, 17);
CALL PopularAtleta('Ana Pereira', 'Ponteiro', 102, FALSE, 102, 17);
CALL PopularAtleta('Marcos Almeida', 'Levantador', 103, TRUE, 103, 18);
CALL PopularAtleta('Joana Costa', 'Oposto', 104, FALSE, 104, 18);
CALL PopularAtleta('Luis Santos', 'Ponteiro', 105, FALSE, 105, 18);
CALL PopularAtleta('Maria Gomez', 'Central', 106, FALSE, 106, 18);
CALL PopularAtleta('Pedro Martinez', 'Líbero', 107, TRUE, 107, 18);
CALL PopularAtleta('Lucia Fernandez', 'Ponteiro', 108, FALSE, 108, 18);
CALL PopularAtleta('Antonio Rossi', 'Levantador', 109, TRUE, 109, 19);
CALL PopularAtleta('Sofia Bianchi', 'Oposto', 110, FALSE, 110, 19);
CALL PopularAtleta('Jean Dupont', 'Ponteiro', 111, FALSE, 111, 19);
CALL PopularAtleta('Isabelle Martin', 'Central', 112, FALSE, 112, 19);
CALL PopularAtleta('Hans Müller', 'Líbero', 113, TRUE, 113, 19);
CALL PopularAtleta('Klaus Schmidt', 'Ponteiro', 114, FALSE, 114, 19);
CALL PopularAtleta('Jan Jansen', 'Levantador', 115, TRUE, 115, 20);
CALL PopularAtleta('Emma de Vries', 'Oposto', 116, FALSE, 116, 20);
CALL PopularAtleta('Ivan Ivanov', 'Ponteiro', 117, FALSE, 117, 20);
CALL PopularAtleta('Olga Smirnova', 'Central', 118, FALSE, 118, 20);
CALL PopularAtleta('Li Wei', 'Líbero', 119, TRUE, 119, 20);
CALL PopularAtleta('Wang Fang', 'Ponteiro', 120, FALSE, 120, 20);


-- Inserir dados na tabela Evento
INSERT INTO Evento (Nome, NomeEvento, Jornada, Hora, Modalidade, IdEstadio, IdResultado, IdEntidade_Organizadora, IdPais) VALUES
('Evento 1', 'Torneio 1', '1', '12:00:00', 'Vôlei', 1, 1, 1, 1),
('Evento 2', 'Torneio 2', '2', '13:00:00', 'Vôlei', 2, 2, 2, 2),
('Evento 3', 'Torneio 3', '3', '14:00:00', 'Vôlei', 3, 3, 3, 3),
('Evento 4', 'Torneio 4', '4', '15:00:00', 'Vôlei', 4, 4, 4, 4),
('Evento 5', 'Torneio 5', '5', '16:00:00', 'Vôlei', 5, 5, 5, 5),
('Evento 6', 'Torneio 6', '6', '17:00:00', 'Vôlei', 6, 6, 6, 6),
('Evento 7', 'Torneio 7', '7', '18:00:00', 'Vôlei', 7, 7, 7, 7),
('Evento 8', 'Torneio 8', '8', '19:00:00', 'Vôlei', 8, 8, 8, 8),
('Evento 9', 'Torneio 9', '9', '20:00:00', 'Vôlei', 9, 9, 9, 9),
('Evento 10', 'Torneio 10', '10', '21:00:00', 'Vôlei', 10, 10, 10, 10),
('Evento 11', 'Torneio 11', '11', '12:00:00', 'Vôlei', 11, 1, 11, 11),
('Evento 12', 'Torneio 12', '12', '13:00:00', 'Vôlei', 12, 2, 12, 12),
('Evento 13', 'Torneio 13', '13', '14:00:00', 'Vôlei', 13, 3, 13, 13),
('Evento 14', 'Torneio 14', '14', '15:00:00', 'Vôlei', 14, 4, 14, 14),
('Evento 15', 'Torneio 15', '15', '16:00:00', 'Vôlei', 15, 5, 15, 15),
('Evento 16', 'Torneio 16', '16', '17:00:00', 'Vôlei', 16, 6, 16, 16),
('Evento 17', 'Torneio 17', '17', '18:00:00', 'Vôlei', 17, 7, 17, 17),
('Evento 18', 'Torneio 18', '18', '19:00:00', 'Vôlei', 18, 8, 18, 18),
('Evento 19', 'Torneio 19', '19', '20:00:00', 'Vôlei', 19, 9, 19, 19),
('Evento 20', 'Torneio 20', '20', '21:00:00', 'Vôlei', 20, 10, 20, 20);

-- Inserir dados na tabela Participa
INSERT INTO Participa (IdEquipa, IdEvento) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

-- Inserir dados na tabela Patrocinador
CALL PopularPatrocinador('Nike');
CALL PopularPatrocinador('Adidas');
CALL PopularPatrocinador('Puma');
CALL PopularPatrocinador('Asics');
CALL PopularPatrocinador('Mizuno');
CALL PopularPatrocinador('Under Armour');
CALL PopularPatrocinador('Reebok');
CALL PopularPatrocinador('Fila');
CALL PopularPatrocinador('Umbro');
CALL PopularPatrocinador('Diadora');
CALL PopularPatrocinador('New Balance');
CALL PopularPatrocinador('Joma');
CALL PopularPatrocinador('Kappa');
CALL PopularPatrocinador('Lotto');
CALL PopularPatrocinador('Topper');
CALL PopularPatrocinador('Penalty');
CALL PopularPatrocinador('Olympikus');
CALL PopularPatrocinador('Converse');
CALL PopularPatrocinador('Champion');
CALL PopularPatrocinador('Brooks');

-- Inserir dados na tabela Patrocina
INSERT INTO Patrocina (IdPatrocinador, IdEquipa) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);