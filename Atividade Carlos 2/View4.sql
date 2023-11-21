CREATE DATABASE View4;
use View4;
CREATE TABLE Categorias (
    id_categoria INT PRIMARY KEY,
    nome_categoria VARCHAR(255),
    descricao VARCHAR(255)
);


CREATE TABLE Coisas (
    id_coisa INT PRIMARY KEY,
    nome VARCHAR(255),
    preco_unitario DECIMAL(10, 2),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE VIEW relatorio_coisas_categoria AS
SELECT
    c.nome_categoria AS nome_categoria,
    COUNT(co.id_coisa) AS quantidade_coisas
FROM
    categorias c
    LEFT JOIN coisas co ON c.id_categoria = co.id_categoria
GROUP BY
    c.id_categoria;


INSERT INTO categorias (id_categoria, nome_categoria, descricao)
VALUES
    (1, 'Moto', 'Carro'),
    (2, 'Parafusos', 'Caixas de parafusos'),
    (3, 'Relógio', 'Caixas de Relógio');

INSERT INTO coisas (id_coisa, nome, preco_unitario, id_categoria)
VALUES
    (1, 'Coisa 1', 50.50, 1),
    (2, 'Coisa 2', 15.15, 2),
    (3, 'Coisa 3', 30.30, 3);


SELECT * FROM relatorio_coisas_categoria;