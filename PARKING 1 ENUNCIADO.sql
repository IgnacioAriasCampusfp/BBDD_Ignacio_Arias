-- 1) Crea una base de datos llamada PARKING y ponla en uso.
drop database if exists parking;
create database parking;
use parking;
-- 2) Crea la tabla CLIENTE con los siguientes campos:
	-- IDCLIENTE CLAVE PRINCIPAL. Queremos que sea de tipo autoincremental, es decir, que se rellene sólo, ¿Cómo lo haces? Busca la respuesta en w3schools
	-- NOMBRE VARCHAR(30). No debe admitir valores nulos.
	-- TLF VARCHAR(12)
create table cliente(

IdCliente int primary key auto_increment,
Nombre varchar(30) not null ,
Tlf varchar(12)

);

-- 3) Ejecuta las siguientes líneas para dar de alta los clientes:
	INSERT INTO CLIENTE (NOMBRE, TLF) VALUES ('MIGUEL PEREZ', '919.392.292');
	INSERT INTO CLIENTE (NOMBRE, TLF) VALUES ('GLORIA GONZALEZ', '912.354.929');
	INSERT INTO CLIENTE (NOMBRE, TLF) VALUES ('ROSA MONTERO', '915.242.224');
	INSERT INTO CLIENTE (NOMBRE, TLF) VALUES ('PEDRO TORRES', '915.424.345');
	INSERT INTO CLIENTE (NOMBRE, TLF) VALUES ('ISMAEL DELGADO', '912.212.235');


-- 4) Crea la tabla COCHE con la siguiente estructura:
	-- MATRICULA CHAR(12) CLAVE PRINCIPAL.
	-- MARCA VARCHAR(12)
	-- MODELO VARCHAR(12)
	-- IDCLIENTE INT. Es la FK que hace referencia a la tabla CLIENTE (propietario del vehículo).
create table coche(
Matricula char(12) primary key,
marca varchar(12),
modelo varchar(12),
idcliente int,
foreign key (idcliente) references cliente(IdCliente)
);

-- 5) Ejecuta las siguientes líneas para dar de alta los coches:
	INSERT INTO COCHE VALUES ('M-1111-AA','FORD','FIESTA',1);
	INSERT INTO COCHE VALUES ('M-2323-AA','OPEL','CORSA',2);
	INSERT INTO COCHE VALUES ('S-2524-BZ','CITROEN','AX',2);
	INSERT INTO COCHE VALUES ('M-2222-AA','RENAULT','12',3);
	INSERT INTO COCHE VALUES ('M-5542-AB','SEAT','600',4);
	INSERT INTO COCHE VALUES ('A-2211-AB','RENAULT','EXPRESS',5);
	INSERT INTO COCHE VALUES ('M-2522-AA','GOLF','GTI',5);
	INSERT INTO COCHE VALUES ('M-2522-AZ','CITROEN','ZX',5);


-- 6) Ejecuta una SELECT para obtener todos los coches junto al nombre del clientes ordenando las filas por el nombre del clliente y matricula del coche.
select coche.*, cliente.nombre from coche
inner join cliente
on cliente.idcliente = coche.idcliente
order by cliente.nombre, coche.matricula;



-- 7) Ejecuta una SELECT para obtener el número de coches que tiene cada cliente.
select cliente.nombre, count(coche.Matricula)
from cliente left join coche
on cliente.idcliente = coche.IdCliente
group by cliente.nombre;

-- 8) Ejecuta una SELECT para obtener todos los coches cuya matrícula comienza por M junto al nombre del cliente.
select coche.*, nombre from coche
inner join cliente
on coche.IdCliente = cliente.IdCliente
where matricula like "M%";


-- 9) Ejecuta una SELECT para obtener todos los coches que no sean RENAULT.
select*from coche
where marca != "RENAULT";
-- 10) Ejecuta una consulta para modificar la estructura de la tabla COCHES y añadir un nuevo campo llamado PRECIO_COMPRA. ¿Cómo lo haces? Busca la respuesta en w3schools
alter table coche
add precio_compra int;
-- 11) Modifica cada uno de los registros (UPDATE) para asignar el precio de compra de cada uno. ¿Cómo lo haces? Busca la respuesta en w3schools
update coche
set precio_compra="15000"
where matricula between "M" and "Mz";
update coche
set precio_compra="12000"
where matricula not between  "M" and "Mz";
-- 12) Aumenta un 10% el precio de todos los coches de la marca CITROEN.
set sql_safe_update = 0;
update coche
set precio_compra=(precio_compra*10)/100
where modelo != "CITROEN";
set sql_safe_update = 1;