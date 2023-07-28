-- Restringindo e limitando dados

SELECT [DISTINCT] {*, COLUMN [alias], ...}
FROM name_table
[WHERE condition(s)];

/*
  Na sintaxe:
  WHERE restringe a consulta para as linhas
        que satisfazem a condição
  condition é composta de nomes de colunas, expressões,
        constantes, e operadores de comparação
*/


-- Strings de Caractere e Data são inclusos entre aspas simples
-- Valores caractere fazem distinção entre maiúsculas e minúsculas,
--  e valores tipo data são sensíveis ao formato
SELECT cod_aluno, nome
FROM taluno
WHERE estado = 'RS';

SELECT * FROM tcontrato


/*
  Operadores:

  = igual a
  > maior que
  >= maior que ou igual a
  < menor que
  <= menor que ou igual a
  <> ou != diferente de

  WHERE expr operator value
*/

-- Utilizando os Operadores de Comparação:
SELECT cod_contrato, data, total, desconto + 10
FROM tcontrato
WHERE total <= desconto + 10;

/*
  Outros Operadores de Comparação:
  BETWEEN...AND... Entre dois valores (inclusive)
  IN(list) Igual a um dos valores da lista
  LIKE Igual a um padrão de caracteres
  IS NULL Possui um valor nulo
  IS NOT NULL Não possui um valor nulo
*/


SELECT * FROM taluno;

-- ALTER TABLE

-- Se executar o comando sem a restrição WHERE, irá afetar todas as linhas
-- DEFAULT = valor padrão na coluna
ALTER TABLE taluno ADD estado CHAR(2) DEFAULT 'RS';
ALTER TABLE taluno ADD salario NUMBER(8,2) DEFAULT 620;

UPDATE taluno SET
estado = 'AC',
salario = 250
WHERE cod_aluno = 1;

UPDATE taluno SET
estado = 'MT',
salario = 2000
WHERE cod_aluno = 2;

UPDATE taluno SET
estado = 'SP',
salario = 800
WHERE cod_aluno = 4;

COMMIT;

SELECT * FROM taluno;

SELECT * FROM taluno
WHERE estado <> 'RS'
AND salario <= 800
-- Ordenar decrescentemente
ORDER BY salario DESC;

-- Inserir sem passar as colunas CEP, Estado e Salario,
--  onde Estado e Salario foram alteradas para valores padrão default
INSERT INTO taluno (cod_aluno, nome, cidade)
VALUES (seq_aluno.NEXTVAL, 'Valdo', 'Dois Irmaos');

INSERT INTO taluno (cod_aluno, nome, cidade)
VALUES (seq_aluno.NEXTVAL, 'Aldo', 'Quatro Irmaos');

SELECT * FROM taluno;

UPDATE taluno SET
estado = 'SP',
salario = 900,
nome = 'Jonatan'
WHERE cod_aluno = 7

-- Quando utilizar o ORDER BY com mais de uma coluna,
--  vai obedecer o critério de grupo da primeira coluna,
--   ordenando a próxima coluna a partir da coluna anterior
SELECT estado, salario, nome
FROM taluno
ORDER BY estado, salario DESC;


-- 31/12/1899 - DATA Zero
-- 01/01/1990 - DATA 1

-- Data de hoje - 1000 dias como padrão na coluna
ALTER TABLE taluno ADD nascimento DATE DEFAULT SYSDATE - 1000;

ALTER TABLE taluno
DROP COLUMN nascimento

SELECT * FROM taluno;

-- Cálculo com a data do servidor
SELECT SYSDATE - SYSDATE - 100 FROM dual;

UPDATE taluno SET
nascimento = '10/08/2000'
WHERE cod_aluno = 2

UPDATE taluno SET
nascimento = '10/10/2001'
WHERE cod_aluno = 1

--  Alterar o padrão de máscara de data da sua sessão
ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY HH24:MI';

-- Trunc: Truncamento(corte) de números p/ qtd de casas determinadas
SELECT cod_aluno, Trunc(nascimento) Nascimento, nome
FROM taluno
WHERE Trunc(nascimento) = '23/10/2020';

SELECT cod_aluno, Trunc(nascimento) AS Nascimento, nome
FROM taluno
WHERE nascimento
  -- BETWEEN: Filtrar dentro de um período
  -- To_Date: Converter para data
  -- 'DD/MM/YYYY HH24:MI': Formato de máscara de dia, mês, ano, hora e minutos
    -- HH24: Formato de 24H (AM/PM)
  BETWEEN To_Date('23/10/2020 00:01', 'DD/MM/YYYY HH24:MI')
    AND To_Date('23/10/2020 12:00', 'DD/MM/YYYY HH24:MI')

SELECT * FROM taluno;


SELECT cod_contrato, data, total, desconto,
       -- Cálculo de soma
       desconto + 1000 AS Calculo
FROM tcontrato
-- Condição: total for menor ou igual a desconto + 1000, por ex., 10 + 1000
WHERE total <= desconto + 1000;

SELECT * FROM tcontrato

UPDATE tcontrato SET
desconto = NULL
WHERE cod_contrato = 2;

SELECT * FROM tcontrato
-- Onde o desconto for nulo
WHERE desconto IS NULL;

SELECT * FROM tcontrato
-- Onde o desconto não for nulo
WHERE desconto IS NOT NULL;

SELECT * FROM tcontrato
-- Onde o desconto for entre 0 e 10
WHERE desconto BETWEEN 0 AND 10;

-- Nvl 0> Colunar com valor null -> substitui o null por 0
-- BETWEEN = Entre
SELECT cod_contrato, total, desconto, Nvl(desconto, 0)
FROM tcontrato
WHERE Nvl(desconto, 0) BETWEEN 0 AND 10;

-- Mesmo efeito do BETWEEN
SELECT * FROM tcontrato
WHERE desconto >= 0
AND desconto <= 10
OR desconto IS NULL;


-- IN /// NOT IN
-- Valor na(em) listagem
SELECT * FROM titem
WHERE cod_curso IN (1, 2, 4);

-- Valor não está(em) na listagem
SELECT * FROM titem
WHERE cod_curso NOT IN (1, 2, 3);


SELECT * FROM tcurso

INSERT INTO tcurso VALUES (5, 'Windows 11', 1000, 50);

-- Cursos não vendidos
SELECT * FROM tcurso
-- Subselect/Subquery
WHERE cod_curso NOT IN (SELECT cod_curso FROM titem)

-- Cursos vendidos
SELECT * FROM tcurso
WHERE cod_curso IN (SELECT cod_curso FROM titem)

-- Equivalente ao SELECT IN
SELECT * FROM titem
WHERE cod_curso = 1
OR cod_curso = 2
OR cod_curso = 4;

-- Registros que iniciam com M
SELECT * FROM taluno WHERE nome LIKE 'M%'

-- Registros que contenham a palavra "JAVA"
SELECT * FROM tcurso WHERE nome LIKE '%JAVA%'

-- Registros que terminam com a palavra "FACES"
SELECT * FROM tcurso WHERE nome LIKE '%FACES'

-- Somente onde a segunda letra seja A
SELECT * FROM tcurso WHERE nome LIKE '_A%'

COMMIT;


ALTER TABLE tcurso ADD pre_req INTEGER;

UPDATE tcurso SET
pre_req = 1
WHERE cod_curso = 2;

UPDATE tcurso SET
pre_req = 3
WHERE cod_curso = 4;

SELECT * FROM tcurso

-- Cursos sem pre-requisitos
SELECT * FROM tcurso WHERE pre_req IS NULL

-- Cursos com pre-requisitos
SELECT * FROM tcurso WHERE pre_req IS NOT NULL


-- Precedência de Operadores
-- ()
-- AND
-- OR

--Incorreto
SELECT * FROM tcurso
WHERE valor > 750
OR valor < 1000
AND carga_horaria = 25;

-- Correto
SELECT * FROM tcurso
WHERE (valor > 750
OR valor < 1000)
AND carga_horaria = 25;






























































ROLLBACK;























































