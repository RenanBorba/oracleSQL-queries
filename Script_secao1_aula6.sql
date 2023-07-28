-- Criar tabela
CREATE TABLE taluno
(
  cod_aluno INTEGER NOT NULL,
  nome VARCHAR(30),
  cidade VARCHAR2(20),
  CEP VARCHAR(10),
  -- Chave identificadora da tabela
  PRIMARY KEY (cod_aluno)
);

-- SELECT básico
SELECT * FROM taluno;

-- Inserir dados na tabela
INSERT INTO taluno(cod_aluno, nome, cidade, cep)
VALUES (1, 'Renan', 'Novo Hamburgo', '93000000');

INSERT INTO taluno(cod_aluno, nome, cidade, cep)
VALUES (2, 'Paulo', 'Itapira', '94000000');

INSERT INTO taluno(cod_aluno, nome, cidade, cep)
VALUES (3, 'Paulo', 'Sinop', '95000000')

INSERT INTO taluno(cod_aluno, nome, cidade, cep)
VALUES (4, 'Igor', 'Sinop', '95000000');

INSERT INTO taluno(cod_aluno, nome, cidade, cep)
VALUES (5, 'Marcelo', 'Bebedouro', '96000000');


CREATE TABLE tcurso
(
  cod_curso INTEGER NOT NULL PRIMARY KEY,
  nome VARCHAR2(30),
  -- 8: precisão é o número de dígitos em um número
  -- 2: escala é o número de dígitos à direita do ponto decimal
  valor NUMBER(8,2),
  carga_horario INTEGER
)

SELECT * FROM tcurso

-- ; Permite executar mais de uma linha no mesmo comando
INSERT INTO tcurso VALUES(1, 'Oracle SQL e PL/SQL', 500, 25);
INSERT INTO tcurso VALUES(2, 'Oracle DBA', 499, 25);
INSERT INTO tcurso VALUES(3, 'JAVA Fundamentos e OO', 1500, 100);
INSERT INTO tcurso VALUES(4, 'JAVASERVER FACES', 1600, 100);


CREATE TABLE tcontrato
(
  cod_contrato INTEGER NOT NULL PRIMARY KEY,
  data DATE,
  cod_aluno INTEGER,
  total NUMBER(8,2),
  desconto NUMBER(5,2)
);

SELECT * FROM tcontrato

-- SYSDATE: Função Data/Hora da máquina
INSERT INTO tcontrato VALUES(1, SYSDATE,   1, 500, 10);
INSERT INTO tcontrato VALUES(2, SYSDATE,   2, 500, 10);
INSERT INTO tcontrato VALUES(3, SYSDATE,   3, 1500, 05);
-- SYSDATE-5: Menos 5 dias
INSERT INTO tcontrato VALUES(4, SYSDATE-5, 2, 1600, 10);
INSERT INTO tcontrato VALUES(5, SYSDATE-4, 5, 800, 10);
INSERT INTO tcontrato VALUES(6, SYSDATE-3, 5, 445, 0);
INSERT INTO tcontrato VALUES(7, SYSDATE-2, 5, 445, 20);

-- Alterar tabela e adicionar coluna
ALTER TABLE tcontrato ADD col_teste VARCHAR(50)

-- Alterar tabela e excluir coluna
ALTER TABLE tcontrato DROP COLUMN col_teste

-- Alterar nome da coluna
ALTER TABLE taluno RENAME COLUMN nome TO nome2;
ALTER TABLE taluno RENAME COLUMN nome2 TO nome

/*
Clicar em cima do nome da tabela e apertar F12: abre o painel Object Viewer,
com as estruturas da tabela, como colunas e referências
*/

-- Excluir tabela
DROP TABLE nome_tabela


-- Criar sequência para inserção, no caso começando com 4
CREATE SEQUENCE seq_aluno START WITH 4;

-- Excluir sequência
DROP SEQUENCE seq_aluno

CREATE SEQUENCE seq_aluno START WITH 6;

INSERT INTO taluno(cod_aluno, nome, cidade, cep)
-- Inserir o valor 6 na coluna "cod_aluno"
VALUES (seq_aluno.NEXTVAL, 'Valdo', 'Canoas', '11000000');

INSERT INTO taluno(cod_aluno, nome, cidade, cep)
-- Inserir o próximo valor ao número "6"
VALUES (seq_aluno.NEXTVAL, 'André', 'Ivoti', '12000000');

SELECT * FROM taluno


/*
Data/hora atual do servidor/computador
  DUAL: Tabela fictícia para executar funções, sem abstrair dados,
    apenas para validação do comando
*/
SELECT SYSDATE FROM DUAL;

-- Valor atual da sequência
SELECT seq_aluno.CURRVAL FROM DUAL


-- Controle de Transação (COMMIT e ROLLBACK)
-- Confirmar alterações realizadas (insert, update e delete)
COMMIT;

SELECT * FROM taluno;

-- Apagar apenas dados, diferente de "DROP"
DELETE FROM taluno;


-- Desfazer alterações realizadas (insert, update e delete)
ROLLBACK;


-- Excluir registro da tabela com condição
DELETE FROM taluno
-- Onde
WHERE cod_aluno = 7

ROLLBACK;

-- Consulta com filtro
SELECT * FROM taluno
WHERE nome = 'Valdo';

DELETE FROM taluno
WHERE nome = 'Valdo';

-- Após realizar o COMMIT,
COMMIT;

-- Não será possível desfazer alterações via ROLLBACK
ROLLBACK;


CREATE TABLE titem
(
  cod_item INTEGER NOT NULL PRIMARY KEY,
  cod_curso INTEGER,
  cod_contrato INTEGER,
  valor NUMBER(8,2)
);

INSERT INTO titem VALUES (1,1,1,500);
INSERT INTO titem VALUES (2,1,2,500);
INSERT INTO titem VALUES (3,3,3,1500);
INSERT INTO titem VALUES (4,4,4,1600);
INSERT INTO titem VALUES (5,1,5,500);
INSERT INTO titem VALUES (6,1,6,500);
INSERT INTO titem VALUES (7,2,6,500);
INSERT INTO titem VALUES (8,3,7,500);

COMMIT;

SELECT * FROM titem

SELECT * FROM tcontrato
WHERE cod_contrato = 2;


-- Alterar registro da tabela
UPDATE tcontrato SET
  desconto = 18
WHERE cod_contrato = 2;

UPDATE tcontrato SET
  desconto = 20,
  data = '05/06/2013',
  total = 750
WHERE cod_contrato = 2;


SELECT * FROM taluno

INSERT INTO taluno(cod_aluno, nome, cidade, cep)
VALUES (seq_aluno.NEXTVAL, 'Carlos', 'BEBEDOURO', '14000000');

UPDATE taluno SET
  cidade = 'Guariba'
-- Compara a coluna por letras maiúsculas
WHERE Upper(cidade) = 'BEBEDOURO';

UPDATE taluno SET
  nome = 'Frida'
WHERE cod_aluno = 3;

SELECT * FROM tcurso

UPDATE tcurso SET
  valor = 499.99
WHERE cod_curso = 1;

COMMIT;


-- ALT + 3 = abre lista de tabelas e estruturas



























































































