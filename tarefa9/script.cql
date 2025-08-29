-- Todos os comandos utilizados.

-- Criação das tabelas
CREATE TABLE IF NOT EXISTS tarefa9.usuarios (
    id UUID PRIMARY KEY,
    nome TEXT,
    emails LIST<TEXT>,
    telefones SET<TEXT>,
    enderecos MAP<TEXT, TEXT>,
    documento TUPLE<TEXT, TEXT>
);

CREATE TABLE IF NOT EXISTS tarefa9.produtos (
    codigo UUID PRIMARY KEY,
    nome TEXT,
    categorias LIST<TEXT>,
    tags SET<TEXT>,
    fornecedores MAP<TEXT, TEXT>,
    identificador TUPLE<TEXT, INT>
);

-- Inserções (exemplos para 5 registros cada)
-- USUÁRIOS
INSERT INTO tarefa9.usuarios (id, nome, emails, telefones, enderecos, documento) VALUES (...);
-- PRODUTOS
INSERT INTO tarefa9.produtos (codigo, nome, categorias, tags, fornecedores, identificador) VALUES (...);

-- Atualizações
UPDATE tarefa9.usuarios SET emails = emails + ['leo@gmail.com'] WHERE id = ...;
UPDATE tarefa9.usuarios SET categorias = categorias + ['Gamer'] WHERE codigo = ...;
UPDATE tarefa9.usuarios SET fornecedores = {'Dell': 'Estados Unidos'} WHERE codigo = ...;

-- Operações primitivas com coleções
UPDATE tarefa9.usuarios SET emails = ['novo@email.com', 'leo2@gmail.com'] WHERE id = ...;
UPDATE tarefa9.usuarios SET enderecos['trabalho'] = 'Avenida X, 222' WHERE id = ...;
UPDATE tarefa9.usuarios SET enderecos['casa'] = 'Rua Nova, 456' WHERE id = ...;
DELETE enderecos['trabalho'] FROM tarefa9.usuarios WHERE id = ...;

-- SELECTs
SELECT nome, emails FROM tarefa9.usuarios WHERE nome = 'João';
SELECT * FROM tarefa9.ordenacao_teste WHERE categoria = 'bebida' ORDER BY nome ASC;
SELECT nome, codigo FROM tarefa9.produtos WHERE nome > 'A' ALLOW FILTERING;

-- Índice secundário
CREATE INDEX IF NOT EXISTS idx_nome_usuarios ON tarefa9.usuarios (nome);