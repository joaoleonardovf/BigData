-- Letra a)
SELECT pnome, unome
FROM EMPREGADO
WHERE EXISTS (
    SELECT 1
    FROM DEPENDENTE
    WHERE essn = EMPREGADO.ssn
      AND nomedep = EMPREGADO.pnome
      AND sexodep = EMPREGADO.sexo
);

-- Letra b)
SELECT pnome, unome
FROM EMPREGADO
WHERE salario > (
    SELECT AVG(salario)
    FROM EMPREGADO
    WHERE dno = '5'
);

-- Letra c)
SELECT DISTINCT essn
FROM TRABALHA
WHERE (pno, horas) IN (
    SELECT pno, horas
    FROM TRABALHA
    WHERE essn = '333445555'
)
AND essn <> '333445555';

-- Letra d)
SELECT ssn, pnome, unome
FROM EMPREGADO
WHERE ssn NOT IN (
    SELECT essn FROM TRABALHA
);

-- Letra e)
SELECT ssn, pnome, unome
FROM EMPREGADO
WHERE ssn NOT IN (
    SELECT essn FROM DEPENDENTE
);

-- Letra f)
SELECT DISTINCT e.unome
FROM EMPREGADO e
JOIN DEPARTAMENTO d ON e.ssn = d.gerssn
WHERE e.ssn NOT IN (
    SELECT essn FROM DEPENDENTE
);

-- Letra g)
SELECT DISTINCT e.pnome, e.unome
FROM EMPREGADO e
JOIN DEPARTAMENTO d ON e.ssn = d.gerssn
WHERE e.ssn IN (
    SELECT essn FROM DEPENDENTE
);
