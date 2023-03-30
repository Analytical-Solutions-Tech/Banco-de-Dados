CREATE DATABASE ast;
USE ast;
-- Tabela de cadastro do cliente
CREATE TABLE cliente(
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    Cnpj char(14) NOT NULL,
    Nome_fantasia VARCHAR(100) NOT NULL,
    Contato VARCHAR(50),
    Email VARCHAR(255) NOT NULL,
    Senha VARCHAR(255) NOT NULL
);

INSERT INTO cliente VALUES
(DEFAULT, '19773504000172', 'Headline Fish', '(61) 3452-2863', 'headline.fish@gmail.com', '6Ll3h9*JZ6m6'),
(DEFAULT, '19773504000172','Fish Eat', '(61) 2784-4764', 'fish.eat@gmil.com', 'U!mA4DpG22%i'),
(DEFAULT, '19773504000172', 'Love Fish', '(67) 2549-8845', 'love.fish@gmail.com','Oe3s21r1*jx*'),
(DEFAULT, '19773504000172', 'Want Fish', '(11) 3434-7103','want.fish@gmail.com','jT999!hXTSOD'),
(DEFAULT, '19773504000172', 'Fish Navio','(69) 2616-5122', 'fish.navio@gmail.com', '8oC7u8%u4A1^'),
(DEFAULT, '19773504000172', 'Fish Bem','(96) 2342-4576','fish.bem@gmail.com','6D^z121qIWOp'),
(DEFAULT, '19773504000172', 'New Fish','(63) 3525-4692','new.fish@gmail.com','6D^z121qIWOp');
SELECT * FROM cliente;

CREATE TABLE sensor(
    numero_serie INT PRIMARY KEY NOT NULL,
    tipo VARCHAR(255),
    modelo VARCHAR(255),
     valor DOUBLE
);


INSERT INTO sensor VALUES
(12022003, 'temperatura','LM35', 20),
(07042019, 'umidade e temperatura','DHT11', 15),
(08032004, 'luminosidade','LDR5', 23),
(05032009, 'bloqueio','TCRT5000', 10);
SELECT * FROM sensor;

CREATE TABLE registro(
    idRegistro INT PRIMARY KEY AUTO_INCREMENT,
    temperatura DOUBLE,
    local varchar(255), -- Mudar para geolocalizacao||Algo melhor
    data_hora DATETIME
);

INSERT INTO registro VALUES
(DEFAULT, 22.0, 'caminhão','2022-12-01 00:00:00'),
(DEFAULT, 22.0, 'caminhão','2022-12-01 12:50:00'),
(DEFAULT, 21.0, 'caminhão','2022-12-01 14:10:56'),
(DEFAULT, 21.5, 'caminhão','2022-12-01 16:15:43'),
(DEFAULT, 22.5, 'caminhão','2022-12-01 18:20:03'),
(DEFAULT, 21.0, 'caminhão','2022-12-01 19:25:08');
SELECT * FROM registro;