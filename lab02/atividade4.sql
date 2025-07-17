-- Letra a)
CREATE VIEW TRABALHA_EM AS
SELECT e.pnome, e.unome, p.pjnome, t.horas
FROM EMPREGADO e
JOIN TRABALHA t ON e.ssn = t.essn
JOIN PROJETO p ON t.pno = p.pnumero;

-- Letra b)
-- Consulta: empregados que trabalham no ProdutoX
SELECT pnome, unome
FROM TRABALHA_EM
WHERE pjnome = 'ProdutoX';

-- Alteração no nome de empregado para observar efeito na view
UPDATE EMPREGADO
SET pnome = 'Carlos'
WHERE ssn = '123456789';

-- Letra c)
DROP VIEW IF EXISTS TRABALHA_EM;

-- Letra d)
CREATE MATERIALIZED VIEW DEPTO_INFO AS
SELECT d.dnome,
       COUNT(e.ssn) AS total_empregados,
       SUM(e.salario) AS soma_salarios
FROM DEPARTAMENTO d
LEFT JOIN EMPREGADO e ON d.dnumero = e.dno
GROUP BY d.dnome;

-- Letra e)
-- Consulta ordenada por soma dos salários
SELECT * FROM DEPTO_INFO
ORDER BY soma_salarios DESC;

-- Inserção de novo empregado para testar REFRESH
INSERT INTO EMPREGADO VALUES (
  '111222333', 'Bruno', 'L', 'Novaes', 'M',
  'Rua Nova, 123 - JP', '1990-01-01',
  '888665555', '5', 50000
);

-- Atualização da view materializada após alteração
REFRESH MATERIALIZED VIEW DEPTO_INFO;

-- Letra f)
-- Views comuns refletem alterações automaticamente.
-- Views materializadas exigem uso de REFRESH.
-- Exemplo:
DELETE FROM EMPREGADO WHERE ssn = '111222333';
REFRESH MATERIALIZED VIEW DEPTO_INFO;

-- Letra g)
DROP MATERIALIZED VIEW IF EXISTS DEPTO_INFO;
