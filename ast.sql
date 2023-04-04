CREATE DATABASE ast;
USE ast;

-- Tabela onde cadastramos os dados de nossos clientes
Create Table clienteEmpresa(
    idCliente Int Primary Key Auto_increment,
    Cnpj Char(14) Not Null,
    Nome_fantasia Varchar(25) Not Null,
    Contato Char(15) Not Null,
    Email Varchar(255) Not Null, 
    Senha Char(8) Not Null 
);

Insert Into clienteEmpresa Values
(Null, '19773504000172', 'Headline Fish', '(61) 3452-2863', 'headline.fish@gmail.com', '6Ll3h9*J'),
(Null, '19773504000172','Fish Eat', '(61) 2784-4764', 'fish.eat@gmil.com', 'U!mA4DpG'),
(Null, '19773504000172', 'Love Fish', '(67) 2549-8845', 'love.fish@gmail.com','Oe3s21r1'),
(Null, '19773504000172', 'Want Fish', '(11) 3434-7103','want.fish@gmail.com','jT999!hX'),
(Null, '19773504000172', 'Fish Navio','(69) 2616-5122', 'fish.navio@gmail.com', '8oC7u8%'),
(Null, '19773504000172', 'Fish Bem','(96) 2342-4576','fish.bem@gmail.com','6D^z121'),
(Null, '19773504000172', 'New Fish','(63) 3525-4692','new.fish@gmail.com','6D^z1293');
SELECT * FROM Cliente;

-- Tabela onde a empresa cadastra os dados de seus colaboradores
Create Table Usuario( 
	idUsuario Int Primary Key Auto_increment,
    Cpf Char(11) Not Null ,
    Nome Varchar(100) Not Null,
    Contato Char(15) Not Null,
    Email Varchar(255) Not Null,
    Senha Char(8) Not Null,
    fkEmpresa Int,
    Foreign Key (fkEmpresa) References clienteEmpresa(idCliente)
);

Insert Into Usuario Values 
(Null,'08517408985','Pedro','(93)998644378','pedro@newfish','128394', 1),
(Null,'77468787506','Inacio','(95)995525657','inacio@fishbem','86245', 3),
(Null,'84942442800','Diogo','(46)999785779','diogo@fishnavio','12746', 2),
(Null,'88283094580','Amanda','(51)968928134','amanda@wantfish','92345', 4),
(Null,'52783362503','Abraao','(84)988421486','abraao@fisheat','52345', 5),
(Null,'75478786365','Lucas','(22)967167494','lucas@lovefish','84365', 1);
SELECT * FROM Usuario;
SELECT * FROM Usuario Join clienteEmpresa on fkEmpresa = idCliente;


-- Tabela onde registramos o sensor em si. Seja o tipo dele, seu valor e seu andamento.
Create Table Sensor(
    numero_serie Int Primary Key Auto_increment,
    tipo_sensor Varchar(25) Not Null,
    modelo_sensor Varchar(20) Not Null,
	valor_sensor Varchar(25) Not Null,
    status_sensor Varchar(8) Check(status_sensor in('Ativo', 'Inativo')) Not Null
);

Insert Into Sensor Values
(12022003, 'Temperatura','LM35','R$20', 'Ativo'),
(07042019, 'Umidade e temperatura','DHT11','R$15', 'Inativo'),
(08032004, 'luminosidade','LDR5', 'R$23' , 'Inativo'),
(05032009, 'Bloqueio','TCRT5000', 'R$10' , 'Inativo');
SELECT * FROM sensor;


-- Nessa tabela é onde fica os registros dos sensores juntamente com a situação do transporte.
Create Table leituraDiaria(
    idLeitura Int Primary Key Auto_increment,
    temperatura_sensor Double Not Null,
    status_transporte Varchar(40) Check(status_transporte in('Transporte parado', 'Em trânsito', 'Em manuntenção')) Not Null,
    data_hora Datetime Not Null,
    fkSensor Int,
    Foreign Key (fkSensor) References Sensor(numero_serie)
)auto_increment = 100;

Insert Into leituraDiaria Values
(Null, 22.0, 'Transporte Parado' ,'2022-12-01 00:00:00', 12022003),
(Null, 22.0, 'Em trânsito','2022-12-01 00:05:00', 12022003),
(Null, 21.0, 'Em manuntenção' ,'2022-12-01 00:10:00', 12022003),
(Null, 21.5, 'Transporte parado' ,'2022-12-01 00:15:00', 12022003),
(Null, 22.5, 'Em manuntenção' ,'2022-12-01 00:20:00', 12022003),
(NUll, 21.0, 'Em trânsito' ,'2022-12-01 00:25:00', 12022003);
SELECT * FROM leituraDiaria;
SELECT* FROM Sensor Join leituraDiaria on fkSensor = numero_serie;
