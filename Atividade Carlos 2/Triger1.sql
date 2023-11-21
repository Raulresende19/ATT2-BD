CREATE DATABASE Triger1;
use Triger1;

CREATE TABLE livros (
    id_livro INT PRIMARY KEY,
    titulo VARCHAR(255),
    autor VARCHAR(255),
    quantidade_estoque INT
);


CREATE TABLE Emprestimos (
    id_emprestimo INT PRIMARY KEY,
    id_livro INT,
    data_emprestimo DATETIME,
    data_devolucao DATETIME,
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
);
CREATE TRIGGER atualizar_estoque
AFTER INSERT ON emprestimos
FOR EACH ROW
UPDATE livros
SET quantidade_estoque = quantidade_estoque - 1
WHERE id_livro = NEW.id_livro;

INSERT INTO livros (id_livro, titulo, autor, quantidade_estoque)
VALUES
    (1, 'Livro 1', 'Autor 1', 3),
    (2, 'Livro 2', 'Autor 2', 7),
    (3, 'Livro 3', 'Autor 3', 5);

select * from livros;

INSERT INTO emprestimos (id_emprestimo, id_livro, data_emprestimo, data_devolucao)
VALUES
    (4, 3, '2023-11-09 10:00:00', '2023-11-22 10:00:00');