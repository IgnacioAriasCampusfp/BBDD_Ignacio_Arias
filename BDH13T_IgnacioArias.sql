-- Ejercicio 1
CREATE OR REPLACE TYPE tSocio AS OBJECT (
    nif VARCHAR2(10),
    nombre VARCHAR2(100),
    tlf VARCHAR2(15),

    
    MEMBER FUNCTION getSocio RETURN VARCHAR2
);

CREATE OR REPLACE TYPE BODY tSocio AS
    MEMBER FUNCTION getSocio RETURN VARCHAR2 IS
    BEGIN
        RETURN 'NIF: ' || nif || ' - Nombre: ' || nombre || ' - Telefono: ' || tlf;
    END;
END;

--Ejercicio 2

create table Socio of tSocio(
nif primary key);

--Ejercicio 3
insert into Socio values(tSocio('11111111A','Fernando Alonso','689512456'));
insert into Socio values(tSocio('22222222B','Marc Marquez','678412154'));

--Ejercicio 4

CREATE OR REPLACE TYPE tLibro AS OBJECT (
    referencia number,
    titulo VARCHAR2(200),
    autor VARCHAR2(100),
    editorial VARCHAR2(100),
    fechaprestamo date,
    nif VARCHAR2(9),
    
    MEMBER FUNCTION getLibro RETURN VARCHAR2,
    MEMBER FUNCTION diasPrestamo RETURN number,
    MEMBER FUNCTION diasMulta RETURN number

);

create or replace type body tLibro as
    member function getLibro return varchar2 is  
    begin
        return referencia || ' - ' || titulo || ' - ' || autor || ' - ' || editorial;
    end;
    member function diasPrestamo return number is
    begin
        return trunc(sysdate - fechaprestamo);
    end;
    
    member function diasMulta return number is
    begin
        return greatest(trunc(sysdate - fechaprestamo) - 7,0);
    end;
end;


--Ejercicio 5

create table libro of tLibro(
    referencia primary key,
    nif references socio(nif)
);

--Ejercicio 6

insert into libro values(tLibro(1,'El camino de los reyes','Brandon Sanderson','NOVA',to_date('2025-03-20','YYYY-MM-DD'),'11111111A'));
insert into libro values(tLibro(2,'El nombre del Viento','Patrick Rothfuss','PLAZA Y JANES',to_date('2025-03-25','YYYY-MM-DD'),'22222222B'));
insert into libro values(tLibro(3,'Amanecer Rojo','Pierce Brown','RBA Libros',to_date('2025-04-02','YYYY-MM-DD'),'11111111A'));
insert into libro values(tLibro(4,'El problema de los tres cuerpo','Cixin Liu','NOVA',to_date('2025-04-04','YYYY-MM-DD'),'22222222B'));



--Selects
-- Libros del cliente con nif 11111111A
select * from libro where nif = '11111111A';

--Cuantos dias han sido prestados los libros
select referencia, titulo, T.diasPrestamo() as DiasPrestados from Libro T;


-- Obtener los dias de multa de los libros
select referencia, titulo, T.diasMulta() as DiasMulta from Libro T where T.diasMulta() > 0;

--Obtener los datos completos de los libros con getLibro()
select T.getLibro() as DatosLibros from Libro T ;

--Cantidad de Libros registrados

Select count(*) as CantidadLibros from Libro;

-- Nombre de socios con libros prestados

select distinct s.nombre from socio s join libro l on s.nif = l.nif;

--Nombre y Libro de los socios

select l.titulo, s.nombre from libro l join socio s on l.nif = s.nif;

-- Obtener Todos los libros

select * from libro;


