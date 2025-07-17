-- TABELA_A:
CREATE TABLE TABELA_A (
  id_empresa INT PRIMARY KEY,
  nome_empresa VARCHAR(50)
);

INSERT INTO TABELA_A VALUES 
(1, 'Empresa A1'),
(2, 'Empresa A2'),
(3, 'Empresa A3'),
(4, 'Empresa A4'),  
(5, 'Empresa A5');

-- TABELA_B:
CREATE TABLE TABELA_B (
  id INT PRIMARY KEY,
  id_empresa INT,
  info TEXT
);

INSERT INTO TABELA_B VALUES 
(1, 1, 'Registro 1 para Empresa 1'),
(2, 1, 'Registro 2 para Empresa 1'),
(3, 1, 'Registro 3 para Empresa 1'),
(4, 2, 'Registro 1 para Empresa 2'),
(5, 2, 'Registro 2 para Empresa 2'),
(6, 3, 'Registro 1 para Empresa 3'),
(7, 5, 'Registro 1 para Empresa 5'),
(8, 8, 'Registro 1 para Empresa 8');  

-- ======================================
-- CONSULTAS COM JOINs
-- ======================================

-- INNER JOIN: O resultado do SELECT com o INNER JOIN será os registros da tabela A que estão na tabela B também,
-- ou seja, somente os registros onde o id_empresa aparece nas duas tabelas.
-- Serão retornados os registros com os seguintes id_empresa: 1, 2, 3 e 5.
SELECT *
FROM TABELA_A
INNER JOIN TABELA_B
ON TABELA_A.id_empresa = TABELA_B.id_empresa;

-- LEFT JOIN: O resultado do SELECT com o LEFT JOIN será todos os registros da tabela A com os dados da tabela B apenas quando houver correspondência.
-- Serão retornados os registros com os seguintes id_empresa: 1, 2, 3 e 5.
SELECT *
FROM TABELA_A
LEFT JOIN TABELA_B
ON TABELA_A.id_empresa = TABELA_B.id_empresa;

-- RIGHT JOIN: O resultado do SELECT com o RIGHT JOIN será todos os registros da tabela B com os dados da tabela A apenas quando houver correspondência.
-- Serão retornados os registros com os seguintes id_empresa: 1, 2, 3, 5 e 8.
SELECT *
FROM TABELA_A
RIGHT JOIN TABELA_B
ON TABELA_A.id_empresa = TABELA_B.id_empresa;

-- FULL JOIN: O resultado do SELECT com o FULL OUTER JOIN será todos os registros de ambas as tabelas mesmo que não tenham correspondência entre si.
-- Serão retornados os registros com os seguintes id_empresa: 1, 2, 3, 4, 5 e 8.
SELECT *
FROM TABELA_A
FULL OUTER JOIN TABELA_B
ON TABELA_A.id_empresa = TABELA_B.id_empresa;