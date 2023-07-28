SELECT [DISTINCT] {*, COLUMN [alias], ...}
FROM nome_table;

/*
  Na sintaxe:
  SELECT = � uma lista de uma ou mais colunas
  DISTINCT = suprime duplicidades
  * = seleciona todas as colunas
  column = seleciona a coluna nomeada
  alias = fornece t�tulos diferentes para as colunas selecionadas
  FROM nome_table = especifica a tabela que cont�m as colunas
*/


-- Opera��es com colunas com valores NULL,
--  anulam a opera��o inteira


-- ALIAS
-- Com ou sem AS
SELECT cod_aluno codigo, nome AS aluno
FROM taluno;

-- Com espa�o no nome
SELECT nome "Nome de Aluno"
FROM taluno;


-- Concatena��o
-- Junta as colunas e nomeia a mesma
SELECT cod_aluno||nome AS "Aluno"
FROM taluno;

SELECT * FROM taluno


-- STRINGS de Caractere Literais: qualquer caractere,
--  express�o ou n�mero em aspas simples ''
SELECT nome || ' nasceu em ' || cidade AS "Nascimento do Aluno"
FROM taluno;


-- Na pr�tica:

-- Alias com "" for�a as letras a ficarem caixa baixa
SELECT cod_aluno AS "Codigo", nome AS "Nome do Aluno"
FROM taluno;


-- DISTINCT analisa a linha inteira, n�o apenas "c�lulas"
SELECT DISTINCT cidade, cod_aluno
FROM taluno
-- Ordena a coluna que ir� ser visualizada primeiro na listagem
ORDER BY cidade;

SELECT * FROM tcurso

ALTER TABLE tcurso RENAME COLUMN carga_horario TO carga_horaria;

SELECT nome AS curso,
       valor,
       -- Divis�o p/ saber valor da hora
       valor/carga_horaria,
       -- Arredondar para duas casas decimais
       Round(valor/carga_horaria,2) AS valor_hora
FROM tcurso
-- Alias s� funciona em ORDER BY
ORDER BY valor_hora


SELECT * FROM tcontrato;

UPDATE tcontrato SET
desconto = NULL
WHERE cod_contrato = 4;

-- C�lculo com coluna = NULL, retorna resultado = NULL
SELECT cod_contrato,
       total,
       desconto,
       -- Soma
       total+desconto
FROM tcontrato;


SELECT cod_contrato,
       desconto,
       -- Nvl: trata colunas nulas
       -- Se coluna for nula, retorna igual a 0
       Nvl(desconto,0),
       total,
       total + Nvl(desconto,0) AS Total_Mais_Desconto
FROM tcontrato;


-- Concatena��o
SELECT cod_aluno || ' - ' || nome || ' // ' || cidade AS aluno
FROM taluno
ORDER BY cod_aluno


-- Tipos de colunas:
INTEGER = 1, 2 -- n�mero inteiro -> atalho para NUMBER(38)
NUMBER(5,2) = 999,99 -- no m�ximo 3 d�gitos + 2 casas decimais
NUMBER(4,2) = 99,99 -- NUMBER = representar uma quantidade ou valor
NUMERIC(5,2) = 999,99 -- NUMERIC = adjetivo que descreve algo relacionado a n�meros ou valores num�ricos
DATE = '10/03/2011 00:00:00' -- sempre apresenta a jun��o de data e hora no retorno
VARCHAR -- sin�nimo de VARCHAR2
VARCHAR2(10) = 'MARCIO' -- se restringir em 10 caracteres e ter apenas 6 em uso, vai ocupar espa�o de somente 6 na mem�ria
CHAR(10) = 'MARCIO    ' -- se restringir em 10 caracteres e ter apenas 6 em uso, vai ocupar espa�o de 10 na mem�ria

COMMIT;


--
























