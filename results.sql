-- Teste para sp_criar_prova
CALL sp_criar_prova('Prova de Teste', 'Evento de Teste', '1ª Jornada', '10:00:00', 'Corrida', 1, 1, 1, 1);

-- Verifica se a prova foi criada corretamente
SELECT * FROM Evento WHERE Nome = 'Prova de Teste';

SELECT * FROM Evento WHERE IdEvento = 1;
SELECT * FROM Evento WHERE IdEvento = 2;

CALL sp_clonar_prova(1);
SELECT * FROM Evento WHERE NomeEvento LIKE '%COPIA do Evento%';



