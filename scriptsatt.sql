CREATE DATABASE ast;
USE ast;
-- Tabela onde cadastramos os dados de nossos clientes
Create Table clienteEmpresa(
    idCliente Int Primary Key Auto_increment,
    Cnpj Char(14) Not Null,
    Nome_fantasia Varchar(25) Not Null,
    Contato varchar(13) Not Null,
    Email Varchar(255) Not Null
);

Insert Into clienteEmpresa Values
(Null, '19773504000172', 'Headline Fish', '5561934522863', 'headline.fish@gmail.com'),
(Null, '19773504000172','Fish Eat', '556127844764', 'fish.eat@gmil.com'),
(Null, '19773504000172', 'Love Fish', '5567925498845', 'love.fish@gmail.com'),
(Null, '19773504000172', 'Want Fish', '551134347103','want.fish@gmail.com'),
(Null, '19773504000172', 'Fish Navio','556926165122', 'fish.navio@gmail.com'),
(Null, '19773504000172', 'Fish Bem','559623424576','fish.bem@gmail.com'),
(Null, '19773504000172', 'New Fish','5511935254692','new.fish@gmail.com');
SELECT * FROM clienteEmpresa;

-- Tabela de permissões no banco
Create Table permissionamento (
idPermissao INT PRIMARY KEY AUTO_INCREMENT,
permissoes VARCHAR(45),
check (permissoes in('Insert','Select','Alter')),
nivel CHAR(1)
);

Insert into permissionamento values
(null, 'Insert', '1'),
(null, 'Select', '2'),
(null, 'Alter', '3');

SELECT * FROM permissionamento;
SELECT * FROM permissionamento Join Usuario on fkPermissao = idUsuario;

-- Tabela onde a empresa cadastra os dados de seus colaboradores
Create Table Usuario( 
	idUsuario Int primary key auto_increment,
    Cpf Char(11) Not Null ,
    Nome Varchar(100) Not Null,
    Contato varchar(13) Not Null,
    Email Varchar(255) Not Null,
    Senha Varchar(120) Not Null,
    fkEmpresa Int,
    FOREIGN KEY (fkEmpresa) references clienteEmpresa(idCliente),
    fkPermissao Int,
    FOREIGN KEY (fkPermissao) references permissionamento(idPermissao)
   
);



-- Rever inserts (dando ERRO)
Insert Into Usuario Values 
(null,'08517408985','Pedro','5511939986443','pedro@newfish','128394', 1, 1),
(null,'77468787506','Inacio','5595995525645','inacio@fishbem','86245', 3, 2),
(null,'84942442800','Diogo','5546999785714','diogo@fishnavio','12746', 2, 3),
(null,'88283094580','Amanda','5551968928115','amanda@wantfish','92345', 4, 1),
(null,'52783362503','Abraao','5584988421486','abraao@fisheat','52345', 5, 2),
(null,'75478786365','Lucas','5522967167494','lucas@lovefish','84365', 1, 3);
SELECT * FROM Usuario;	
SELECT * FROM Usuario Join clienteEmpresa on fkEmpresa = idCliente;

select * from temperatura_por_transporte JOIN historicoLeitura
	on historicoLeitura.idLeitura = temperatura_por_transporte.fkLeitura
		where idTransporte = 7;

SELECT fkCliente as cliente_id, fkLeitura as leitura_id, fkSensor as sensor_id from temperatura_por_transporte
            WHERE idTransporte = 7
            order by idTransporte desc;
		
-- Tabela onde temos todos os permissionamentos dos úsuarios
create user 'insert'@'localhost' IDENTIFIED by 'insert';
grant insert on historicoLeitura to 'insert'@'localhost';

create user 'select'@'localhost' IDENTIFIED by 'select';
grant insert on historicoLeitura to 'select'@'localhost';

create user 'alter'@'localhost' IDENTIFIED by 'alter';
grant insert on historicoLeitura to 'alter'@'localhost';

-- Tabela onde registramos o sensor em si. Seja o tipo dele, seu valor e seu andamento.
Create Table Sensor(
    numero_serie Int Primary Key Auto_increment,
    tipo_sensor Varchar(25) Not Null,
    modelo_sensor Varchar(20) Not Null,
	valor_sensor Varchar(25) Not Null,
    status_sensor Varchar(8) Check(status_sensor in('Ativo', 'Inativo')) Not Null,
    fkCliente INT,
    FOREIGN KEY (fkCliente) references clienteEmpresa(idCliente)
) AUTO_INCREMENT = 10;

Insert Into Sensor Values
(12022003, 'Temperatura','LM35','R$20', 'Ativo', 1),
(07042019, 'Umidade e temperatura','DHT11','R$15', 'Inativo', 2),
(08032004, 'luminosidade','LDR5', 'R$23' , 'Inativo', 3),
(05032009, 'Bloqueio','TCRT5000', 'R$10' , 'Inativo', 4);
SELECT * FROM sensor;
SELECT * FROM sensor Join clienteEmpresa on fkCliente = idCliente;

-- Tabela N:N onde podemos ver os registros de cada sensor em cada transpoorte específico
Create table temperatura_por_transporte (
idTransporte Int PRIMARY KEY AUTO_INCREMENT,
fkCliente Int,
 FOREIGN KEY (fkCliente) references clienteEmpresa(idCliente)
  -- fkSensor int, -- este mesmo valor está sendo requisitado na historicoLeitura, possível redundancia
  -- Foreign Key (fkSensor) References sensor(numero_serie)
);

select * from temperatura_por_transporte;
Insert into temperatura_por_transporte values
(null, 1),
(null, 2),
(null, 3);

select * from historicoLeitura;


select * from usuario;

 select * from temperatura_por_transporte JOIN historicoLeitura
            on historicoLeitura.fkTemperaturaTransporte = temperatura_por_transporte.idTransporte
            WHERE idTransporte = 4
            order by data_hora desc;

-- Nessa tabela é onde fica os registros dos sensores juntamente com a situação do transporte.
Create Table historicoLeitura(
    idLeitura INT AUTO_INCREMENT,
    registro_sensor Double Not Null,
    status_transporte Varchar(40) Check(status_transporte in('Transporte parado', 'Em trânsito', 'Em manuntenção')) Not Null,
    data_hora Datetime Not Null,
    fkSensor Int,
    fkTemperaturaTransporte Int,
    Foreign Key (fkTemperaturaTransporte) References temperatura_por_transporte(idTransporte),
    Foreign Key (fkSensor) References Sensor(numero_serie),
    CONSTRAINT pkLeituraDiaria PRIMARY KEY (idLeitura, data_hora, fkSensor)
)auto_increment = 100;	
-- temperatura_sensor alterada para registro_sensor
INSERT INTO historicoLeitura (registro_sensor, status_transporte, data_hora, fkSensor, fkTemperaturaTransporte) VALUES (20, "Em trânsito", now(), 12022003, 4);

Insert Into historicoLeitura Values
(Null, 22.0, 'Transporte Parado' ,'2022-12-01 00:00:00', 12022003, 1),
(Null, 22.0, 'Em trânsito','2022-12-01 00:05:00', 07042019, 2),
(Null, 21.0, 'Em manuntenção' ,'2022-12-01 00:10:00', 08032004, 3),
(Null, 21.5, 'Transporte parado' ,'2022-12-01 00:15:00', 05032009, 1);

SELECT * FROM historicoLeitura;

select * from temperatura_por_transporte;

select * from sensor;
SELECT* FROM Sensor Join historicoLeitura on fkSensor = numero_serie;