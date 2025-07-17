-- Letra a)
SELECT AVG(salario) AS media_salario_feminino
FROM EMPREGADO
WHERE sexo = 'F';

-- Letra b)
SELECT superssn, COUNT(*) AS numero_empregados
FROM EMPREGADO
WHERE superssn IS NOT NULL
GROUP BY superssn;

-- Letra c)
SELECT MAX(horas) AS max_horas
FROM TRABALHA;

-- Letra d)
SELECT p.pjnome, SUM(t.horas) AS total_horas
FROM PROJETO p
JOIN TRABALHA t ON p.pnumero = t.pno
GROUP BY p.pjnome;

-- Letra e)
SELECT d.dnome, AVG(e.salario) AS media_salarial
FROM DEPARTAMENTO d
JOIN EMPREGADO e ON d.dnumero = e.dno
GROUP BY d.dnome;

-- Letra f)
SELECT e.pnome, e.unome
FROM EMPREGADO e
JOIN DEPENDENTE d ON e.ssn = d.essn
GROUP BY e.ssn, e.pnome, e.unome
HAVING COUNT(*) >= 2;

-- Letra g)
SELECT d.dnome
FROM DEPARTAMENTO d
JOIN PROJETO p ON d.dnumero = p.dnum
GROUP BY d.dnome
ORDER BY COUNT(*) ASC
LIMIT 1;

-- Letra h)
SELECT pnome, unome, SUBSTRING(endereco FROM 10 FOR 13) AS trecho_endereco
FROM EMPREGADO;

-- Letra i)
SELECT pnome, unome, EXTRACT(MONTH FROM datanasc) AS mes_nascimento
FROM EMPREGADO;

-- Letra j)
SELECT e.pnome, e.unome,
       EXTRACT(YEAR FROM d.datanascdep) - EXTRACT(YEAR FROM e.datanasc) AS idade_quando_filho_nasceu
FROM EMPREGADO e
JOIN DEPENDENTE d ON e.ssn = d.essn
WHERE d.parentesco ILIKE 'filh%';

-- Letra k)
SELECT EXTRACT(YEAR FROM datanascdep) AS ano_nascimento, COUNT(*) AS total_dependentes
FROM DEPENDENTE
GROUP BY EXTRACT(YEAR FROM datanascdep)
ORDER BY ano_nascimento;

-- Letra l)
SELECT s.pnome, s.unome, COUNT(*) AS total_supervisionados
FROM EMPREGADO s
JOIN EMPREGADO e ON s.ssn = e.superssn
GROUP BY s.ssn, s.pnome, s.unome
HAVING COUNT(*) >= 2;

-- Letra m)
SELECT p.pjnome, SUM(e.salario * (t.horas / 160.0)) AS custo_mensal
FROM PROJETO p
JOIN TRABALHA t ON p.pnumero = t.pno
JOIN EMPREGADO e ON t.essn = e.ssn
GROUP BY p.pjnome;
