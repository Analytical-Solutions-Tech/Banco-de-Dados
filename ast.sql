CREATE DATABASE ast;
USE ast;
-- ver se precisa da tabela produto
CREATE TABLE cliente(
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    Cnpj char(14) NOT NULL,
    Nome_fantasia VARCHAR(100) NOT NULL,
    Contato VARCHAR(50), -- char limitndo numero de celular
    Email VARCHAR(255) NOT NULL, 
    Senha VARCHAR(255) NOT NULL -- char senha
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

CREATE TABLE usuario( -- fkempresa
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    Cpf char (11) NOT NULL,
    Nome varchar(100),
    Contato varchar(50), -- char limitndo numero de celular
    Email varchar(100),
    Senha varchar(100)); -- char senha

INSERT INTO usuario VALUES -- add fks
(null,'00000000000','Pedro','199999999','pedro@newfish','12345'),
(null,'11111111111','Inacio','1188888888','inacio@fishbem','12345'),
(null,'22222222222','Diogo','1177777777','diogo@fishnavio','12345'),
(null,'33333333333','Amanda','1166666666','amanda@wantfish','12345'),
(null,'44444444444','Abraao','1155555555','abraao@fisheat','12345'),
(null,'55555555555','Lucas','11444444444','lucas@lovefish','12345');

CREATE TABLE sensor(
    numero_serie INT PRIMARY KEY NOT NULL,
    tipo VARCHAR(255),
    modelo VARCHAR(255),
     valor DOUBLE
);
ALTER TABLE sensor ADD COLUMN statusSensor VARCHAR(7); 
ALTER TABLE sensor ADD CONSTRAINT chk_statusSensor CHECK(statusSensor IN('Ativo', 'Inativo'));
-- constraint chk_statusSensor já criada, aceitando apenas valores ativo ou inativo na coluna statusSensor

INSERT INTO sensor VALUES
(12022003, 'temperatura','LM35', 20),
(07042019, 'umidade e temperatura','DHT11', 15),
(08032004, 'luminosidade','LDR5', 23),
(05032009, 'bloqueio','TCRT5000', 10);
SELECT * FROM sensor;


-- Colocar check se o transporte está parado ou em movimento, ou em manuntenção
CREATE TABLE registro(
    idRegistro INT PRIMARY KEY AUTO_INCREMENT,
    temperatura DOUBLE,
    transporte varchar(45),
    data_hora DATETIME
);

INSERT INTO registro VALUES
(DEFAULT, 22.0, null,'2022-12-01 00:00:00'),
(DEFAULT, 22.0, null,'2022-12-01 00:05:00'),
(DEFAULT, 21.0, null,'2022-12-01 00:10:00'),
(DEFAULT, 21.5, null,'2022-12-01 00:15:00'),
(DEFAULT, 22.5, null,'2022-12-01 00:20:00'),
(DEFAULT, 21.0, null,'2022-12-01 00:25:00');
SELECT * FROM registro;
-- Criar tabela pedido e colocar a localização, tipo_transporte
-- que vai ser relacionada com a tabela registro e empresa
