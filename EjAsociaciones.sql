drop database if exists alquiler;
create database alquiler;
use alquiler;

create table cliente(
idcliente tinyint auto_increment primary key,
Nombre varchar(25) not null,
Tlf int not null,
edad int
);
create table alojamiento(
idalojamiento tinyint auto_increment primary key,
Lugar enum("Sevilla","A Coruña","Leon","Barcelona","Madrid"),
Tipo enum("Bungalo","Chalet","Piso"),
condiciones enum("Limpio","Sucio")
);

create table alquiler(
idcliente tinyint,
idalojamiento tinyint,
Entrada date not null,
Salida date not null,
precio int not null,
check(Entrada<Salida),
foreign key (idalojamiento) references alojamiento(idalojamiento),
foreign key (idcliente) references cliente(idcliente)
);

INSERT INTO cliente (Nombre, Tlf, edad) VALUES
('Carlos García', 123456789, 30),
('Ana López', 987654321, 25),
('Luis Fernández', 555123456, 40),
('María Martínez', 666789123, 35),
('Juan Pérez', 444321987, 28);


INSERT INTO alojamiento (Lugar, Tipo, condiciones) VALUES
('Sevilla', 'Bungalo', 'Limpio'),
('A Coruña', 'Chalet', 'Sucio'),
('Leon', 'Piso', 'Limpio'),
('Barcelona', 'Bungalo', 'Limpio'),
('Madrid', 'Chalet', 'Sucio');



INSERT INTO alquiler (idcliente, idalojamiento, Entrada, Salida, precio) VALUES
(1, 1, '2024-10-01', '2024-10-07', 500),  -- Carlos alquila un Bungalo en Sevilla
(2, 3, '2024-10-05', '2024-10-10', 350),  -- Ana alquila un Piso en León
(3, 2, '2024-09-15', '2024-09-20', 700),  -- Luis alquila un Chalet en A Coruña
(4, 5, '2024-08-01', '2024-08-10', 900),  -- María alquila un Chalet en Madrid
(5, 4, '2024-11-01', '2024-11-05', 450);  -- Juan alquila un Bungalo en Barcelona

