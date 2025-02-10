create database Triangulos;
use Triangulos;
-- Procedimiento--
CREATE PROCEDURE Crear_Triangulos ()
BEGIN
	drop table if exists triangulo;
    create table triangulo(
		id_triangulo int auto_increment primary key,
		lado1 int,
		lado2 int,
		lado3 int
    );
    
    while i<20 do
		insert into triangulo(lado1, lado2, lado3) values
		(floor(1 + rand()*5), floor(1+rand()*5), floor(1 + rand()* 5 ));
		set i = i +1;
    end while;
END

select*from triangulo;
call Crear_Triangulos();

-- Funcion tipos de triangulo --
CREATE DEFINER=`root`@`localhost` FUNCTION `tipo_triangulo`(lado1 int, lado2 int, lado3 int) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	declare tipo_triangulo varchar(20);
    
    if lado1 = lado2 and lado1 = lado3 then
		set tipo_triangulo = "Equilatero";
	elseif lado1 = lado2 or lado1 = lado3 or lado2 = lado3 then
		set tipo_triangulo = "Isosceles";
	else
		set tipo_triangulo = "Escaleno";
	end if;
		
    
RETURN tipo_triangulo;
END


select id_triangulo, tipo_triangulo(lado1,lado2,lado3) as tipo_triangulo 
from triangulo;

-- Funcion perimetro --
CREATE DEFINER=`root`@`localhost` FUNCTION `Perimetro`(lado1 int, lado2 int, lado3 int) RETURNS int
    DETERMINISTIC
BEGIN

RETURN (lado1+lado2+lado3);
END


select id_triangulo, Perimetro(lado1,lado2,lado3) as perimetro_triangulo
from triangulo;



select id_triangulo, tipo_triangulo(lado1,lado2,lado3) as tipo_triangulo, 
Perimetro(lado1,lado2,lado3) as perimetro_triangulo from triangulo;