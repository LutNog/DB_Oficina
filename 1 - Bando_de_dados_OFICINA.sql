-- Criando Database
CREATE DATABASE OFICINA;

USE OFICINA;

-- Criando Tabelas
CREATE TABLE CLIENTE (
IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
NOME VARCHAR(45) NOT NULL,
CPF VARCHAR(11) NOT NULL UNIQUE,
SEXO ENUM('M', 'F') NOT NULL,
TEL CHAR(11),
ENDERECO VARCHAR(45) NOT NULL,
BAIRRO VARCHAR(30) NOT NULL
);


CREATE TABLE CARRO (
IDCARRO INT PRIMARY KEY AUTO_INCREMENT,
COR VARCHAR(10),
PLACA VARCHAR(10) NOT NULL,
IDCLIENTE INT
);


CREATE TABLE SERVICO (
IDSERVICO INT PRIMARY KEY AUTO_INCREMENT,
MECANICO VARCHAR(45) NOT NULL,
DATA_CHEGADA DATE NOT NULL,
DATA_SAIDA DATE NOT NULL,
IDCONSERTO INT,
IDCLIENTE INT
);

CREATE TABLE CONSERTO (
IDCONSERTO INT PRIMARY KEY AUTO_INCREMENT,
PECA VARCHAR(45) NOT NULL,
QUANTIDADE INT NOT NULL,
IDESTOQUE INT,
IDCARRO INT
);

CREATE TABLE ESTOQUE (
IDESTOQUE INT PRIMARY KEY AUTO_INCREMENT,
PECA VARCHAR(45) NOT NULL,
QUANTIDADE INT NOT NULL,
VALOR FLOAT(10, 2) NOT NULL
);

-- Criando Constraints
ALTER TABLE CARRO ADD CONSTRAINT FK_CARRO_CLIENTE
FOREIGN KEY (IDCLIENTE) REFERENCES CLIENTE(IDCLIENTE);

ALTER TABLE SERVICO ADD CONSTRAINT FK_SERVICO_CONSERTO
FOREIGN KEY (IDCONSERTO) REFERENCES CONSERTO(IDCONSERTO);

ALTER TABLE SERVICO ADD CONSTRAINT FK_SERVICO_CLIENTE
FOREIGN KEY (IDCLIENTE) REFERENCES CLIENTE(IDCLIENTE);

ALTER TABLE CONSERTO ADD CONSTRAINT FK_CONSERTO_ESTOQUE
FOREIGN KEY (IDESTOQUE) REFERENCES ESTOQUE(IDESTOQUE);

ALTER TABLE CONSERTO ADD CONSTRAINT FK_CONSERTO_CARRO
FOREIGN KEY (IDCARRO) REFERENCES CARRO(IDCARRO);


-- Alterando uma tabela
ALTER TABLE CARRO
ADD MARCA VARCHAR(20) NOT NULL;

DESC CARRO;

ALTER TABLE CONSERTO
DROP PECA;

DESC CONSERTO;

-- Apagando foreign key
ALTER TABLE SERVICO DROP FOREIGN KEY FK_SERVICO_CLIENTE;

ALTER TABLE SERVICO
DROP IDCLIENTE;

DESC SERVICO;

-- Inserindo dados
INSERT INTO CLIENTE (IDCLIENTE, CPF, SEXO, TEL, ENDERECO, BAIRRO) VALUES (NULL, 'JOSE', 45689789561, 'M', 11989958971, 'RUA UM', 'BRAS');
INSERT INTO CLIENTE VALUES (NULL, 'JUCA', 48795632481, 'M', 11963547895, 'RUA TREZE', 'MOOCA');
INSERT INTO CLIENTE VALUES (NULL, 'MARIA', 59863245781, 'F', 11597423358, 'RUA CINCO', 'PAULISTA');
INSERT INTO CLIENTE VALUES (NULL, 'ISABELA', 16587459345, 'F', 11986523148, 'RUA CINCO', 'PAULISTA');
INSERT INTO CLIENTE VALUES (NULL, 'MARCELO', 59874632548, 'M', 11987456214, 'RUA DOZE', 'JABAQUARA');
INSERT INTO CLIENTE VALUES (NULL, 'CESAR', 12568945231, 'M', NULL, 'RUA DOIS', 'BRAS');
INSERT INTO CLIENTE VALUES (NULL, 'NADIA', 15698745698, 'F', NULL, 'RUA CINCO', 'MOOCA');
INSERT INTO CLIENTE VALUES (NULL, 'LUCAS', 45698745698, 'M', 11398754223, 'RUA DEZ', 'GRAJAU');
INSERT INTO CLIENTE VALUES (NULL, 'ALFREDO', 84698745698, 'M', 11389754223, 'RUA CINCO', 'MOOCA');
INSERT INTO CLIENTE VALUES (NULL, 'LUIZ', 77655745698, 'M', 11354854223, 'RUA VINTE', 'SANTO AMARO');
INSERT INTO CLIENTE VALUES (NULL, 'CELIA', 96698745698, 'F', 11354442123, 'RUA UM', 'GRAJAU');
INSERT INTO CLIENTE VALUES (NULL, 'BEATRIZ', 44698745698, 'F', 11198754223, 'RUA SEIS', 'BRAS');
INSERT INTO CLIENTE VALUES (NULL, 'GENARO', 11698745698, 'M', 11448754223, 'RUA UM', 'JABAQUARA');
INSERT INTO CLIENTE VALUES (NULL, 'PABLO', 45698744498, 'M', 11398756223, 'RUA SETE', 'MOOCA');
INSERT INTO CLIENTE VALUES (NULL, 'JORGE', 55698745698, 'M', 11399654223, 'RUA VINTE', 'SANTO AMARO');
INSERT INTO CLIENTE VALUES (NULL, 'CALISTO', 48698745698, 'M', 11398754223, 'RUA DOIS', 'GRAJAU');
INSERT INTO CLIENTE VALUES (NULL, 'VERA', 55694245698, 'M', 11398845223, 'RUA DEZ', 'BRAS');
INSERT INTO CLIENTE VALUES (NULL, 'MARCIA', 55598745698, 'F', NULL, 'RUA VINTE', 'JABAQUARAU');
INSERT INTO CLIENTE VALUES (NULL, 'LUCAS', 45611745698, 'M', NULL, 'RUA OITO', 'BRAS');
INSERT INTO CLIENTE VALUES (NULL, 'MARCELO', 15698745632, 'M', 11398774223, 'RUA UM', 'SANTO AMARO');

SELECT * FROM CLIENTE;

INSERT INTO CARRO (IDCARRO, COR, PLACA, IDCLIENTE, MARCA) VALUES (NULL, 'PRETO', 'ASD1020', 1, 'FIAT');
INSERT INTO CARRO VALUES (NULL, 'PRETO', 'EWW2020', 2, 'FIAT');
INSERT INTO CARRO VALUES (NULL, 'VERMELHO', 'RTT3020', 3, 'CHEVROLET');
INSERT INTO CARRO VALUES (NULL, 'PRETO', 'ETT1120', 4, 'FIAT');
INSERT INTO CARRO VALUES (NULL, 'VERMELHO', 'FGH2120', 5, 'VOLKSWAGEM');
INSERT INTO CARRO VALUES (NULL, 'CINZA', 'POP1220', 6, 'TOYOTA');
INSERT INTO CARRO  VALUES (NULL, 'PRETO', 'ETT1330', 7, 'FIAT');
INSERT INTO CARRO  VALUES (NULL, NULL, 'XXC1120', 8, 'TOYOTA');
INSERT INTO CARRO VALUES (NULL, 'CINZA', 'ERR1020', 9, 'VOLKSWAGEM');
INSERT INTO CARRO  VALUES (NULL, 'VERMELHO', 'OPP6620', 10, 'VOLKSWAGEM');
INSERT INTO CARRO  VALUES (NULL, 'PRETO', 'ASD1111', 11, 'TOYOTA');
INSERT INTO CARRO  VALUES (NULL, 'BRANCO', 'AER2110', 12, 'VOLKSWAGEM');
INSERT INTO CARRO  VALUES (NULL, 'PRETO', 'PRT1020', 13, 'CHEVROLET');
INSERT INTO CARRO  VALUES (NULL, 'BRANCO', 'XTZ9920', 14, 'VOLKSWAGEM');
INSERT INTO CARRO  VALUES (NULL, 'CINZA', 'DAR1069', 15, 'FIAT');
INSERT INTO CARRO  VALUES (NULL, 'PRETO', 'PAR1660', 16, 'FIAT');
INSERT INTO CARRO  VALUES (NULL, 'CINZA', 'TER3120', 1, 'VOLKSWAGEM');
INSERT INTO CARRO  VALUES (NULL, NULL, 'LOO1120', 18, 'CHEVROLET');
INSERT INTO CARRO  VALUES (NULL, 'VERMELHO', 'LII2120', 19, 'VOLKSWAGEM');
INSERT INTO CARRO  VALUES (NULL, 'BRANCO', 'TEX4020', 5, 'TOYOTA');
INSERT INTO CARRO  VALUES (NULL, 'PRETO', 'GGH1020', 21, 'FIAT');
INSERT INTO CARRO  VALUES (NULL, 'PRETO', 'AXC1999', 22, 'CHEVROLET');

SELECT * FROM CARRO;

INSERT INTO ESTOQUE (IDESTOQUE, PECA, QUANTIDADE, VALOR) VALUES (NULL, 'RODAS', 30, 200.00);
INSERT INTO ESTOQUE VALUES (NULL, 'PARABRISA', 100, 60.50);
INSERT INTO ESTOQUE VALUES (NULL, 'FAROL', 10, 108.00);
INSERT INTO ESTOQUE VALUES (NULL, 'VIDROS', 15, 1050.00);
INSERT INTO ESTOQUE VALUES (NULL, 'EMBREAGEM', 7, 1540.00);
INSERT INTO ESTOQUE VALUES (NULL, 'PARALAMA', 115, 250.44);
INSERT INTO ESTOQUE VALUES (NULL, 'PARACHOQUE', 225, 510.00);

SELECT * FROM ESTOQUE;

INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 2, 1, 1);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 1, 7, 2);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 1, 5, 3);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 1, 4, 4);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 1, 4, 5);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 1, 4, 6);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 1, 6, 7);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 1, 6, 8);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 1, 2, 9);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 1, 3, 10);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 1, 2, 11);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 1, 4, 12);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 2, 2, 13);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 2, 1, 14);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 2, 5, 15);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 2, 6, 16);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 1, 1, 18);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 1, 6, 19);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 2, 1, 5);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 1, 6, 22);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 2, 4, 1);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 2, 7, 3);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 2, 1, 5);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 3, 3, 9);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 2, 1, 4);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 1, 4, 1);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 1, 7, 5);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 1, 4, 4);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 2, 1, 22);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 1, 6, 19);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 2, 1, 23);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 1, 7, 24);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 2, 1, 18);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 1, 2, 23);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 1, 2, 1);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 1, 6, 24);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 1, 6, 5);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 1, 7, 10);
INSERT INTO CONSERTO (IDCONSERTO, QUANTIDADE, IDESTOQUE, IDCARRO) VALUES (NULL, 2, 7, 22);

SELECT * FROM CONSERTO;

INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'JORGE', '2022-10-02', '2022-11-02', 1);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'ORLANDO', '2022-12-04', '2022-11-05', 2);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'JORGE', '2022-11-03', '2022-11-04', 3);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'TEODORO', '2022-07-16', '2022-09-11', 4);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'ORLANDO', '2022-03-10', '2022-04-11', 5);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'JORGE', '2022-02-10', '2022-02-11', 6);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'ORLANDO', '2022-02-20', '2022-03-21', 7);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'JORGE', '2022-02-21', '2022-03-05', 8);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'TEODORO', '2022-02-25', '2022-03-01', 9);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'ORLANDO', '2022-04-10', '2022-05-11', 10);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'TEODORO', '2022-05-31', '2022-06-15', 11);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'ORLANDO', '2022-11-10', '2022-12-21', 12);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'TEODORO', '2022-10-30', '2022-11-01', 13);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'JORGE', '2022-02-10', '2022-04-11', 14);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'ORLANDO', '2022-01-10', '2022-02-26', 15);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'TEODORO', '2022-04-15', '2022-05-23', 16);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'JORGE', '2022-02-16', '2022-02-14', 17);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'TEODORO', '2022-09-10', '2022-09-11', 18);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'JORGE', '2022-01-27', '2022-02-16', 19);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'JORGE', '2022-02-26', '2022-03-11', 20);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'ORLANDO', '2022-01-05', '2022-02-01', 21);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'ORLANDO', '2022-02-21', '2022-03-03', 23);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'ORLANDO', '2022-04-01', '2022-04-04', 24);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'TEODORO', '2022-06-07', '2022-07-05', 25);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'TEODORO', '2022-06-07', '2022-11-06', 26);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'JORGE', '2022-02-10', '2022-06-11', 27);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'TEODORO', '2022-07-05', '2022-05-09', 28);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'JORGE', '2022-07-10', '2022-09-07', 29);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'ORLANDO', '2022-08-03', '2022-10-07', 30);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'TEODORO', '2022-03-10', '2022-04-11', 31);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'JORGE', '2022-01-10', '2022-06-06', 32);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'JORGE', '2022-08-08', '2022-10-17', 35);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'ORLANDO', '2022-06-09', '2022-11-21', 36);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'TEODORO', '2022-08-10', '2022-12-25', 37);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'ORLANDO', '2022-02-11', '2022-04-30', 38);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'TEODORO', '2022-11-01', '2022-11-30', 39);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'ORLANDO', '2022-02-14', '2022-03-11', 40);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'TEODORO', '2022-10-10', '2022-11-06', 41);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'JORGE', '2022-11-03', '2022-11-27', 42);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'TEODORO', '2022-10-10', '2022-10-28', 43);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'TEODORO', '2022-02-08', '2022-03-24', 44);
INSERT INTO SERVICO (IDSERVICO, MECANICO, DATA_CHEGADA, DATA_SAIDA, IDCONSERTO) VALUES (NULL, 'JORGE', '2022-01-17', '2022-02-11', 45);

SELECT * FROM SERVICO;

-- Atualizando nome do mecânico
UPDATE SERVICO SET MECANICO = "MATHEUS"
WHERE MECANICO = "JORGE";

-- Atualizando nome dos clientes
UPDATE CLIENTE SET NOME = "CAIO"
WHERE IDCLIENTE = "22";

UPDATE CLIENTE SET NOME = "RODRIGO"
WHERE IDCLIENTE = "18";

UPDATE CLIENTE SET NOME = "BARTOLOMEU"
WHERE IDCLIENTE = "24";

-- Criando tabela de backup cliente

CREATE TABLE BACKUP_CLIENTE (
IDBKP INT PRIMARY KEY AUTO_INCREMENT,
IDCLIENTE INT,
NOME VARCHAR(45) NOT NULL,
CPF VARCHAR(11) NOT NULL UNIQUE,
SEXO ENUM('M', 'F') NOT NULL,
TEL CHAR(11),
ENDERECO VARCHAR(45) NOT NULL,
BAIRRO VARCHAR(30) NOT NULL,
DATA_EXCLUSAO DATETIME,
USUARIO VARCHAR(30),
EVENTO CHAR(8)
);