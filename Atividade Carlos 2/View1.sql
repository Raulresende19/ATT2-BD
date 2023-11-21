CREATE DATABASE View1;
use View1;
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(255),
    email VARCHAR(255),
    telefone VARCHAR(20)
);

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATETIME,
    valor_total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);


CREATE VIEW relatorio_pedidos_cliente AS
SELECT
    c.nome AS nome_cliente,
    COUNT(p.id_pedido) AS numero_pedidos,
    SUM(p.valor_total) AS valor_total_gasto
FROM
    clientes c
    LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY
    c.id_cliente;

INSERT INTO clientes (id_cliente, nome, email, telefone)
VALUES
    (1, 'Cliente 1', 'Gente1@email.com', '562-6567'),
    (2, 'Cliente 1', 'Gente2@email.com', '456-8890'),
    (3, 'Cliente 2', 'GEnte3@email.com', '110-2234');

INSERT INTO pedidos (id_pedido, id_cliente, data_pedido, valor_total)
VALUES
    (1, 1, '2023-11-17 15:20:00', 90.00),
    (2, 1, '2023-11-18 11:55:00', 80.50),
    (3, 2, '2023-11-18 16:00:00', 150.20);

SELECT * FROM relatorio_pedidos_cliente;