drop database if exists escuela;
create database escuela;
use escuela;

create table alumnos(
NIF char(9) primary key,
Nombre varchar(50),
Trabaja bool,
Estudios enum("ESO", "BACHILLERATO", "FP MEDIO", "FP SUPERIOR", "GRADO UNIVERSITARIO"),
Ingresos float,
FechaNacimiento date

);

Insert into alumnos values
("23492347J","Ignacio Arias",false,"FP MEDIO","0","2002-07-11");
Insert into alumnos values
("90178237A","Juan Ramon Garcia Romero",true,"GRADO UNIVERSITARIO","1520","1964-08-24");
Insert into alumnos values
("89172389Y","Lucia Batista Lopez",false,"FP SUPERIOR","0","1998-02-03");
Insert into alumnos values
("09091283T","Pedro Corrales Juristo",false,"BACHILLERATO","0","2001-09-11");

select * from alumnos;