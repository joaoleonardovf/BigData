CREATE TABLE aluno (
    matricula SERIAL PRIMARY KEY,
    curso VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    cre NUMERIC(4,2),
    disciplinas JSONB,
    data_ingresso TIMESTAMP NOT NULL DEFAULT now(),
    localizacao GEOMETRY(Point, 4326)
);

-- a) Busca por alunos com CRE igual a 5.0
-- Igualdade em campo numérico: índice B-TREE é eficiente
CREATE INDEX idx_aluno_cre ON aluno (cre);

-- b) Busca por alunos com idade menor que 70
-- Comparação com operador relacional (<): B-TREE otimiza bem esse tipo de filtro
CREATE INDEX idx_aluno_idade ON aluno (idade);

-- c) Alunos com idade maior que 27 E CRE menor que 3.0
-- Consulta com múltiplas condições: índice composto B-TREE ajuda a combinar os dois filtros
CREATE INDEX idx_aluno_idade_cre ON aluno (idade, cre);

-- d) Média de idade de todos os alunos
-- Consulta sem cláusula WHERE: não vale a pena criar índice, pois será feito scan completo
-- Nenhum índice sugerido para essa consulta

-- e) Agrupamento de idade dos alunos do curso de 'Computação'
-- Índice composto melhora performance do filtro (curso) e do GROUP BY (idade)
CREATE INDEX idx_aluno_curso_idade ON aluno (curso, idade);

-- f) Alunos que cursaram uma disciplina específica no JSONB
-- Para buscas com o operador @> (contém) em JSONB, usa-se índice GIN
CREATE INDEX idx_aluno_disciplinas ON aluno USING GIN (disciplinas);

-- g) Alunos ingressos em um determinado intervalo de datas
-- Índice B-TREE otimiza comparações de datas (BETWEEN)
CREATE INDEX idx_aluno_data_ingresso ON aluno (data_ingresso);

-- h) Alunos localizados até certa distância de um ponto (geoespacial)
-- Índice GIST é o mais indicado para buscas espaciais com ST_DWithin()
CREATE INDEX idx_aluno_localizacao ON aluno USING GIST (localizacao);