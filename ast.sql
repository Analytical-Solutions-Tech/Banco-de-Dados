CREATE DATABASE ast;
USE ast;

-- Tabela de cadastro do cliente
CREATE TABLE cliente(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome_fantasia VARCHAR(100) NOT NULL,
    cnpj CHAR(14) NOT NULL,
    contato VARCHAR(50),
    email VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL
);

INSERT INTO cliente VALUES
(NULL, 'CaramicoFish', '12345678000160', '(11)99999-9999', 'caramico@gmail.com', '1234567senha');
INSERT INTO cliente (nome_fantasia,cnpj,contato,email,senha) VALUES
('fisheat', '12345678000190', '(11)98888-8888', 'fish_eat@gmil.com', '23092500senha'),
('lovefish','12345678000170', '(11)97777-7777', 'love_fish@gmail.com','1234senha'),
('wantfish', '12345678000188', '(11)96666-6666','want_fish@gmail.com','808987senha'),
('fishsaudavel','12345678000199', '(11)95555-5555', 'fish_saudavel@gmail.com', '202526senha'),
('queropeixe','12345678000129','(11)92222-2222','quero_peixe09@gmail.com','7475senha'),
('peixefeliz','12345678000100','(11)93333-3333','peixe_feliz19@gmail.com','606268senha');

UPDATE cliente SET nome_fantasia = 'Caralápia' WHERE id = 1;

SELECT * FROM cliente;

CREATE TABLE sensor(
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(255),
    valor DOUBLE,
    modelo VARCHAR(255)
);

INSERT INTO sensor VALUES
(DEFAULT, 'temperatura', 20, 'LM35'),
(DEFAULT, 'umidade e temperatura', 15, 'DHT11'),
(DEFAULT, 'luminosidade', 23, 'LDR5'),
(DEFAULT, 'bloqueio', 10, 'TCRT5000');

CREATE TABLE registro(
    id INT PRIMARY KEY AUTO_INCREMENT,
    sensor_id INT,
    temperatura DOUBLE,
    local varchar(255),
    data_hora DATETIME
);

INSERT INTO registro VALUES
(DEFAULT, 1, 22.0, 'caminhão','2022-12-01 00:00:00'),
(DEFAULT, 1, 22.0, 'caminhão','2022-12-01 00:50:00'),
(DEFAULT, 1, 21.0, 'caminhão','2022-12-01 00:10:00'),
(DEFAULT, 1, 21.5, 'caminhão','2022-12-01 00:15:00'),
(DEFAULT, 1, 22.5, 'caminhão','2022-12-01 00:20:00'),
(DEFAULT, 1, 21.0, 'caminhão','2022-12-01 00:25:00');