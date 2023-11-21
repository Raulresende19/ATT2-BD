
CREATE DATABASE Triger3;
use Triger3;
CREATE TABLE Funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(255),
    data_admissao DATE
);


DELIMITER //

CREATE TRIGGER verificar_admissao
BEFORE INSERT ON Funcionarios
FOR EACH ROW
BEGIN
    IF NEW.data_admissao <= CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A data de admissão tem que ser maior que a data atual';
    END IF;
END;

//

DELIMITER ;


DELIMITER //

CREATE PROCEDURE inserir_funcionario(IN nome_funcionario VARCHAR(255), IN data_admissao DATE)
BEGIN
    INSERT INTO funcionarios (nome, data_admissao) VALUES (nome_funcionario, data_admissao);
END //

DELIMITER ;

CALL inserir_funcionario('Raul resende', '2023-11-17');