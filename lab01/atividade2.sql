SELECT essn AS ssn, nomedep, parentesco
FROM DEPENDENTE
ORDER BY essn ASC, parentesco DESC;

SELECT e.pnome, e.unome, e.endereco
FROM EMPREGADO e
JOIN DEPARTAMENTO d ON e.dno = d.dnumero
WHERE d.dnome = 'Pesquisa';

SELECT p.pjnome, d.dnome, e.unome, e.endereco, e.datanasc
FROM PROJETO p
JOIN DEPARTAMENTO d ON p.dnum = d.dnumero
JOIN EMPREGADO e ON d.gerssn = e.ssn
WHERE p.plocal = 'Araucaria';

SELECT DISTINCT e.pnome, e.unome
FROM EMPREGADO e
JOIN TRABALHA t ON e.ssn = t.essn
JOIN PROJETO p ON t.pno = p.pnumero
WHERE p.pjnome = 'Automatizacao' AND t.horas > 10;

SELECT pnome, unome, salario
FROM EMPREGADO
ORDER BY salario DESC
LIMIT 3;

SELECT e2.pnome, e2.unome, (e2.salario * 1.2) AS salario_reajustado
FROM EMPREGADO e1
JOIN EMPREGADO e2 ON e1.superssn = e2.ssn;

SELECT d.dnome, l.dlocalizacao
FROM DEPARTAMENTO d
JOIN LOCALIZACAO l ON d.dnumero = l.dnum;

SELECT d.dnome, p.pjnome
FROM DEPARTAMENTO d
JOIN PROJETO p ON d.dnumero = p.dnum;

SELECT pnome, unome, datanasc, salario
FROM EMPREGADO
WHERE sexo = 'F' AND salario > 30000;

SELECT p.pjnome
FROM EMPREGADO e
JOIN TRABALHA t ON e.ssn = t.essn
JOIN PROJETO p ON t.pno = p.pnumero
WHERE e.pnome = 'Fabio';