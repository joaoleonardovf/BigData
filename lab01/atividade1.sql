INSERT INTO EMPREGADO
VALUES ('943775543', 'Roberto', 'F', 'Silva', 'M', 'Rua X, 22 – Araucária – PR', '1952-06-21', '888665555', '1', 58000);

INSERT INTO PROJETO
-- ERRO: Departamento '2' não existe na tabela DEPARTAMENTO (violação de chave estrangeira).
VALUES ('4', 'ProdutoA', 'Araucaria', '2');

INSERT INTO DEPARTAMENTO
-- ERRO: Departamento número '4' já existe (violação de chave primária).
VALUES ('4', 'Produção', '943775543', '1998-10-01');

INSERT INTO TRABALHA
-- ERRO: Valor NULL em pno e ESSN '677678989' não existe em EMPREGADO (violações de NOT NULL e chave estrangeira).
VALUES ('677678989', null, 40.0);

INSERT INTO DEPENDENTE
VALUES ('453453453', 'Joao', 'M', '1970-12-12', 'CONJUGE');

DELETE FROM TRABALHA
WHERE essn = '333445555';

DELETE FROM EMPREGADO
-- ERRO: O SSN '987654321' está sendo referenciado em outras tabelas (ex: DEPARTAMENTO.gerssn e TRABALHA.essn).
WHERE ssn = '987654321';

DELETE FROM PROJETO
-- ERRO: O projeto 'ProdutoX' está referenciado na tabela TRABALHA (violação de chave estrangeira).
WHERE pjnome = 'ProdutoX';

UPDATE DEPARTAMENTO
SET gerssn = '123456789',
    gerdatainicio = '1999-01-10'
WHERE dnumero = '5';

UPDATE EMPREGADO
SET superssn = '943775543'
WHERE ssn = '999887777';

UPDATE TRABALHA
SET horas = 5.0
WHERE essn = '999887777' AND pno = '10';