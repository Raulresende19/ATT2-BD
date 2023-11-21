CREATE DATABASE View5;
use View5;
CREATE TABLE Alunos (
    id_aluno INT PRIMARY KEY,
    nome VARCHAR(255),
    data_nascimento DATE,
    serie INT
);


CREATE TABLE Matriculas (
    id_matricula INT PRIMARY KEY,
    id_aluno INT,
    data_matricula DATE,
    status VARCHAR(255),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno)
);


CREATE VIEW relatorio_idade_serie AS
SELECT
    a.nome AS nome_aluno,
    a.data_nascimento AS data_nascimento,
    a.serie AS serie,
    m.data_matricula AS data_matricula,
    m.status AS status
FROM
    alunos a
    JOIN matriculas m ON a.id_aluno = m.id_aluno;

INSERT INTO alunos (id_aluno, nome, data_nascimento, serie)
VALUES
    (1, 'Aluno 1', '2006-10-15', 8),
    (2, 'Aluno 2', '2007-08-22', 9),
    (3, 'Aluno 3', '2010-11-10', 7);

INSERT INTO matriculas (id_matricula, id_aluno, data_matricula, status)
VALUES
    (1, 1, '2023-09-10', 'Ativo'),
    (2, 2, '2023-05-05', 'Ativo'),
    (3, 3, '2023-03-20', 'Inativo');


SELECT * FROM relatorio_idade_serie;