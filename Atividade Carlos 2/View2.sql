CREATE DATABASE View2;

USE View2;

CREATE TABLE produtos ( id_produto INT PRIMARY KEY, nome VARCHAR(255), preco_unitario DECIMAL(10, 2), categoria VARCHAR(255) );

CREATE TABLE estoque ( id_produto INT PRIMARY KEY, quantidade INT, FOREIGN KEY (id_produto) REFERENCES produtos(id_produto) );

CREATE VIEW estoque_critico AS SELECT p.nome AS nome_produto, e.quantidade AS quantidade_em_estoque FROM produtos p JOIN estoque e ON p.id_produto = e.id_produto WHERE e.quantidade < 10;

INSERT INTO produtos (id_produto, nome, preco_unitario, categoria) VALUES (1, 'Produto 1', 30.00, 'Eletronica'), (2, 'Produto 2', 52.20, 'Vestidos'), (3, 'Produto 3', 35.85, 'Calças');

INSERT INTO estoque (id_produto, quantidade) VALUES (2, 3), (3, 15), (1, 8);

SELECT * FROM estoque_critico;