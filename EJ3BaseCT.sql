drop database if exists empresa;
create database empresa;
use empresa;

create table Departamento(
	idDepartamento int primary key,
    departamento varchar(10)
);

create table empleados(
	idempleados int primary key unique,
    idDepartamento int ,
    Nombre varchar(50) not null,
    Hijos int,
    foreign key (idDepartamento) references Departamento(idDepartamento)
);

insert into Departamento values (1, 'Ventas');
insert into Departamento values (2, 'Compras');
insert into Departamento values (3, 'RRHH');

insert into empleados values (1, 1, 'Juan Ramon', 0);
insert into empleados values (2, 1, 'Daniel Ceballos', 1);
insert into empleados values (3, 2, 'Juan Mata', 0);
insert into empleados values (4, 2, 'Guillermo del Toro', 0);
insert into empleados values (5, 3, 'Hideo Kojima', 2);
insert into empleados values (6, 3, 'Hideataka Miyazaki', 0);