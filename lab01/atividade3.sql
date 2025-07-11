SELECT e.ssn, e.pnome, e.unome
FROM EMPREGADO e
JOIN EMPREGADO s ON e.superssn = s.ssn
WHERE e.dno <> s.dno;

SELECT essn AS ssn, nomedep, parentesco
FROM DEPENDENTE
ORDER BY essn ASC, parentesco DESC;

SELECT e.pnome, e.unome
FROM EMPREGADO e
WHERE e.superssn = (
    SELECT ssn
    FROM EMPREGADO
    WHERE pnome = 'Joaquim' AND inicialm = 'E' AND unome = 'Brito'
);

SELECT DISTINCT p.pnumero, p.pjnome
FROM PROJETO p
LEFT JOIN TRABALHA t ON p.pnumero = t.pno
LEFT JOIN EMPREGADO e1 ON t.essn = e1.ssn
LEFT JOIN DEPARTAMENTO d ON p.dnum = d.dnumero
LEFT JOIN EMPREGADO e2 ON d.gerssn = e2.ssn
WHERE e1.unome = 'Will' OR e2.unome = 'Will';

SELECT DISTINCT e.pnome, e.unome
FROM EMPREGADO e
JOIN TRABALHA t ON e.ssn = t.essn
JOIN PROJETO p ON t.pno = p.pnumero
WHERE p.dnum = '5';

SELECT DISTINCT e.pnome, e.unome, e.endereco
FROM EMPREGADO e
JOIN TRABALHA t ON e.ssn = t.essn
JOIN PROJETO p ON t.pno = p.pnumero
WHERE p.plocal = 'Curitiba'
  AND e.dno NOT IN (
      SELECT dnum FROM LOCALIZACAO WHERE dlocalizacao = 'Curitiba'
  );
