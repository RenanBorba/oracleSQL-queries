SELECT [DISTINCT] {*, COLUMN [alias], ...}
FROM nome_table;

/*
  Na sintaxe:
  SELECT = é uma lista de uma ou mais colunas
  DISTINCT = suprime duplicidades
  * = seleciona todas as colunas
  column = seleciona a coluna nomeada
  alias = fornece títulos diferentes para as colunas selecionadas
  FROM nome_table = especifica a tabela que contém as colunas
*/


-- Operações com colunas com valores NULL,
--  anulam a operação inteira


-- ALIAS
-- Com ou sem AS
SELECT cod_aluno codigo, nome AS aluno
FROM taluno;

-- Com espaço no nome
SELECT nome "Nome de Aluno"
FROM taluno;


-- Concatenação
-- Junta as colunas e nomeia a mesma
SELECT cod_aluno||nome AS "Aluno"
FROM taluno;

SELECT * FROM taluno


-- STRINGS de Caractere Literais: qualquer caractere,
--  expressão ou número em aspas simples ''
SELECT nome || ' nasceu em ' || cidade AS "Nascimento do Aluno"
FROM taluno;


-- Na prática:

-- Alias com "" força as letras a ficarem caixa baixa
SELECT cod_aluno AS "Codigo", nome AS "Nome do Aluno"
FROM taluno;


-- DISTINCT analisa a linha inteira, não apenas "células"
SELECT DISTINCT cidade, cod_aluno
FROM taluno
-- Ordena a coluna que irá ser visualizada primeiro na listagem
ORDER BY cidade;

SELECT * FROM tcurso

ALTER TABLE tcurso RENAME COLUMN carga_horario TO carga_horaria;

SELECT nome AS curso,
       valor,
       -- Divisão p/ saber valor da hora
       valor/carga_horaria,
       -- Arredondar para duas casas decimais
       Round(valor/carga_horaria,2) AS valor_hora
FROM tcurso
-- Alias só funciona em ORDER BY
ORDER BY valor_hora


SELECT * FROM tcontrato;

UPDATE tcontrato SET
desconto = NULL
WHERE cod_contrato = 4;

-- Cálculo com coluna = NULL, retorna resultado = NULL
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


-- Concatenação
SELECT cod_aluno || ' - ' || nome || ' // ' || cidade AS aluno
FROM taluno
ORDER BY cod_aluno


-- Tipos de colunas:
INTEGER = 1, 2 -- número inteiro -> atalho para NUMBER(38)
NUMBER(5,2) = 999,99 -- no máximo 3 dígitos + 2 casas decimais
NUMBER(4,2) = 99,99 -- NUMBER = representar uma quantidade ou valor
NUMERIC(5,2) = 999,99 -- NUMERIC = adjetivo que descreve algo relacionado a números ou valores numéricos
DATE = '10/03/2011 00:00:00' -- sempre apresenta a junção de data e hora no retorno
VARCHAR -- sinônimo de VARCHAR2
VARCHAR2(10) = 'MARCIO' -- se restringir em 10 caracteres e ter apenas 6 em uso, vai ocupar espaço de somente 6 na memória
CHAR(10) = 'MARCIO    ' -- se restringir em 10 caracteres e ter apenas 6 em uso, vai ocupar espaço de 10 na memória

COMMIT;


--
























