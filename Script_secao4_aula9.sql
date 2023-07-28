/*
  Aula 10

  Funções do tipo Single-Row
  - Manipulam itens de dados
  - Recebem argumentos e retornam um valor
  - Atuam sobre cada linha recuperada
  - Retornam um resultado por linha
  - Podem modificar o tipo de um dado
  - Podem ser aninhadas

  function_name (column|expression, [arg1, arg2, ...])

  As Multiple-Row Functions no Oracle são usadas para retornar
    um grupo de valores (ou) um único valor
*/

SELECT * FROM taluno

-- Junta valores de colunas
SELECT Concat(cod_aluno, nome) FROM taluno;

-- mesmo efeito
SELECT cod_aluno||nome FROM taluno;

SELECT cod_aluno||' '||nome FROM taluno;

-- Transforma a primeira letra em maiúscula de cada palavra
SELECT nome, InitCap(nome) FROM taluno;

SELECT InitCap('Mateus da Silva') FROM taluno;

-- Retornar apenas uma vez
SELECT InitCap('Mateus da Silva') FROM dual;

-- Verificar em qual posição a letra apareceu na palavra
SELECT nome, InStr(nome, 'r') FROM taluno;

-- Conta quantos caracteres têm
SELECT nome, Length(nome) FROM taluno

-- Transforma os valores em minúsculo
SELECT nome, Lower(nome) FROM taluno;

-- Transforma os valores em maiúsculo
SELECT nome, Upper(nome) FROM taluno;

-- L = Left - esquerda, preenche com o 'valor'
--  na quantidade à esquerda, até o valor preencher as casas
SELECT cod_aluno, LPad(cod_aluno, 5, '0') FROM taluno;

-- mesmo efeito à direita
SELECT nome, RPad(salario, 8, '0') AS Salario FROM taluno ;

SELECT nome, RPad(nome, 10, '@') FROM taluno;

-- Copia parte de um texto (valor, posição inicial, qtd. caractr)
SELECT nome, SubStr(nome, 1, 3) from taluno;

SELECT nome, SubStr(nome, 1, 1) from taluno;

SELECT nome, SubStr(nome, 3, 2) from taluno;

-- Substituir todos 'R' por '$' do campo
SELECT REPLACE(nome, 'R', '$') FROM taluno;

-- Funções aninhadas
SELECT REPLACE(Upper(nome), 'R', '$') FROM taluno;

-- Retornar a última letra
SELECT nome, SubStr(nome, Length(nome), 1) FROM taluno;

-- Retorna os dois últimos
SELECT nome, SubStr(nome, Length(nome)-1, 2) FROM taluno;

-- Copia a partir da posição 3 os 3 próximos caracteres
SELECT nome, SubStr(nome, 3, Length(nome)-3) FROM taluno;


-- Aula 11

-- Transforma em minúsculo
SELECT * FROM taluno
WHERE Lower(nome) = 'renan';

-- Transforma em maiúsculo
SELECT * FROM taluno
WHERE Upper(nome) = 'RENAN';

-- Copia as 3 primeiras letras e transformar em maiúsculo
--  e comparar com a string
SELECT * FROM taluno
WHERE Upper(SubStr(cidade, 1, 3)) = 'ITA'

UPDATE taluno SET
salario = 833.47
WHERE cod_aluno = 1;

SELECT
  salario,
  REPLACE(salario, '.' , ' '),
  RPad(salario, 10, '0'), -- Zeros à direita até 10 casas
  LPad(salario, 10, '0'), -- Zeros à esquerda até 10 casas
  LPad(REPLACE(salario, '.', ' '), 10, '0')
FROM taluno;

-- Round e Trunc
SELECT Round(45.925, 2), -- 45.93, arredondar em duas casas
       Trunc(45.929, 2), -- 45.92, trunca (arredonda para baixo) em duas casas
       Mod(10, 2) AS resto_divisao, -- divide 10 por 2 e retorna o resto
       Trunc(1.99),
       Trunc(1.99, 2)
FROM dual;


-- Aula 12: Data

SELECT * FROM dual;

-- SysDate retorna data/hora do Servidor
SELECT SYSDATE FROM dual;


-- Funções de Data/Hora

-- Somar + 5 dias
SELECT data, SYSDATE, data + 5 FROM tcontrato;

-- Data de hoje - valor da data
SELECT SYSDATE - data AS diferenca_dias FROM tcontrato;

-- Para não retornar a hora (valor muito grande)
SELECT Trunc(SYSDATE - data) AS diferenca_dias FROM tcontrato;

-- Somar horas em uma data
-- Data atual + 2 horas (dividido por 24 horas = 1 dia)
SELECT SYSDATE, SYSDATE + 2 / 24 AS add_horas FROM tcontrato;

-- Somar minutos em uma data
-- Data atual + 15 minutos (dividido pelos minutos em 1 dia = 1440)
SELECT SYSDATE, SYSDATE + 15 / 1440 AS add_minutos FROM tcontrato;

-- Somar segundos em uma data
-- Data atual + 30 segundos (dividido pelos segundos em 1 hora = 3600
--  multiplicado por 24 horas)
SELECT SYSDATE, SYSDATE + 30 / (3600 * 24) AS add_segundos FROM tcontrato


-- Hora fica 00:00:00
SELECT SYSDATE, Trunc(SYSDATE) FROM dual;

-- Diferença de meses entre datas
SELECT Months_Between(SYSDATE, SYSDATE-90) AS dif_mes FROM dual;

-- Adiciona meses
SELECT SYSDATE, Add_Months(SYSDATE, 5) AS add_mes_data FROM dual;

-- Proxima data a partir de um dia da semana
SELECT Next_Day(SYSDATE, 'Quarta-Feira') AS proxima_quarta_data FROM dual;
SELECT Next_Day(SYSDATE, 'Wednesday') AS proxima_quarta_data FROM dual;

-- Último dia do mês
SELECT Last_Day(SYSDATE) AS ultimo_dia_mes FROM dual;

-- Primeiro dia do próximo mês
-- Até dia 15 do mês: retorna o primeiro dia do mês atual
--  a partir do dia 16: retorna o primeiro dia do próximo mês
SELECT Round(SYSDATE, 'MONTH') AS primeiro_dia_proximo_mes FROM dual;

-- Primeiro dia do mês corrente
SELECT Trunc(SYSDATE, 'MONTH') AS primeiro_dia_mes_corrente FROM dual;


-- Aula 13: Formatação de data

-- Conversor to_char(data, formato)
--  converte para String

-- Formatar a Data em Dia -> DD
SELECT SYSDATE, To_Char(SYSDATE, 'DD') Dia FROM dual;

-- Formatar a Data em Mês -> MM
SELECT SYSDATE, To_Char(SYSDATE, 'MM') Mes FROM dual;

-- Formatar a Data em Ano -> YYYY
SELECT SYSDATE, To_Char(SYSDATE, 'YYYY') Ano FROM dual;

-- Formatar a Data em Ano -> YY
SELECT SYSDATE, To_Char(SYSDATE, 'YY') Ano FROM dual;

-- Formatar a Data em Dia/Mês/Ano -> DD/MM/YYYY
SELECT SYSDATE, To_Char(SYSDATE, 'DD/MM/YYYY') Data FROM dual;

-- Formatar a Data em Dia/Mês -> DD/MM
SELECT SYSDATE, To_Char(SYSDATE, 'DD/MM') Dia_mes FROM dual;

-- Retornar Mês atual
SELECT To_Char(SYSDATE, 'MONTH') Mes FROM dual;

-- Retornar Número do Dia da semana
SELECT To_Char(SYSDATE, 'D') Dia_semana FROM dual;

-- Retornar Número do Dia da semana
SELECT To_Char(SYSDATE, 'DY') Dia_semana FROM dual;  -- QUA -> WED

-- Retornar Número do Dia da semana
SELECT To_Char(SYSDATE, 'DAY') Dia_semana FROM dual;  -- QUARTA -> WEDNESDAY

-- Retornar Número do Dia da semana
SELECT To_Char(SYSDATE, 'YEAR') Dia_semana FROM dual;  -- Em Ingles

SELECT To_Char(SYSDATE, ' "PALMARES", fmDAY "," DD "de" fmMonth "de" YYYY') FROM dual
SELECT To_Char(SYSDATE, ' "PALMARES", DAY "," DD "de" Month "de" YYYY') FROM dual


-- Formatar em Hora/Minutos
SELECT To_Char(SYSDATE, 'HH24:MI') hora_min FROM dual;

-- Formatar em Hora/Minutos/Segundos
SELECT To_Char(SYSDATE, 'HH24:MI:SS') hora_min_seg FROM dual;

-- Formatar em Dia/Mês/hora/minutos
SELECT To_Char(SYSDATE, 'DD/MM HH24:MI') data_hora FROM dual;

-- Aula 14

-- L -> R$
-- G -> ponto
-- D -> casas decimais

SELECT To_Char(salario, 'L99999.99'), To_Char(salario, 'L99G999D99') FROM taluno;

SELECT Trim(To_Char(salario, 'L99999.99')),
       Trim(To_Char(salario, 'L99G999D99'))
FROM taluno;

SELECT 'R$'||(Round(Salario,2)) AS salario FROM taluno;


-- Nvl e Nvl2
SELECT total,
       desconto,
       desconto+total,
       -- Caso a coluna seja nula, atribui valor 0
       Nvl(Desconto,0),
       Nvl(Desconto,0) + total,
       -- Nvl2 = 2 colunas
       -- Se a coluna Desconto for nula atribui -1,
       --   senão atribui o valor de Total
       Nvl2(desconto, total, -1),
       -- Se a coluna Desconto for nula, o valor atribuído vai ser Total,
       --   senão atribui o valor -1
       Nvl2(desconto, -1, total),
       Nvl2(desconto, total, 0)
FROM tcontrato;


SELECT * FROM taluno

UPDATE taluno SET
nome = NULL
WHERE cod_aluno = 5;

SELECT cod_aluno,
       Nvl(nome, 'SEM NOME')
FROM TALUNO


-- CASE || WHEN || THEN

UPDATE taluno SET
estado = 'AC'
WHERE cod_aluno = 2;

UPDATE taluno SET
estado = 'SC'
WHERE cod_aluno = 4;

UPDATE taluno SET
estado = 'RJ'
WHERE cod_aluno = 5;

SELECT * FROM taluno

SELECT nome, estado,
       -- CASO
       CASE
        -- WHEN = QUANDO, THEN = ENTÃO
        WHEN estado = 'RS' THEN 'GAUCHO'
        WHEN estado = 'AC' THEN 'ACREANO'
        WHEN estado = 'RJ' THEN 'CARIOCA'
        -- WHEN estado = 'RJ' OR salario > 500 THEN 'CARIOCA'
        -- WHEN estado = 'RJ' AND salario > 500 THEN 'CARIOCA'
        ELSE 'OUTROS'
       END AS apelido -- CASE até END = 1 coluna
FROM taluno;

-- DECODE
SELECT nome, estado,
       -- Decodificar coluna -> efeito semelhante ao CASE
       --   Se 'RS', então atribua 'GAUCHO'
       Decode(estado, 'RS', 'GAUCHO',
                      'AC', 'ACREANO',
                      'SP', 'PAULISTA',
                            'OUTROS') AS apelido -- senão atribua 'OUTROS'
FROM taluno;











































































































































































