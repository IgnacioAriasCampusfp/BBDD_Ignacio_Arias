--Crear procedimiento--
CREATE OR REPLACE PROCEDURE crear_triangulos()
LANGUAGE plpgsql
AS $$
BEGIN
    -- Si la tabla ya existe, se elimina
    DROP TABLE IF EXISTS triangulo;
    
    -- Se crea la tabla triangulo con un único campo de tipo array
    CREATE TABLE triangulo (
		id_triangulo serial,
        lados INTEGER[]
    );
    
    -- Insertar 20 filas con valores aleatorios entre 1 y 5 para cada lado
    FOR i IN 1..20 LOOP
        INSERT INTO triangulo (lados)
        VALUES (ARRAY[
            (floor(random()*5)+1)::int,
            (floor(random()*5)+1)::int,
            (floor(random()*5)+1)::int
        ]);
    END LOOP;
END;
$$;



call crear_triangulos();
select * from triangulo;


--Funcion tipo de triangulo--
create or replace function tipo_triangulo(lados integer[])
returns text
language plpgsql
as $$
begin
	if lados[1] = lados[2] and lados[1] = lados[3] then
		return 'Equilatero';
	elseif lados[1] = lados[2] or lados[2] = lados[3] or lados[1] = lados[3] then
		return 'Isosceles';
	else
		return 'Escaleno';
	end if;
end;
$$

select id_triangulo, tipo_triangulo(lados) as tipos from triangulo;

--Funcion perimetro--

create or replace function perimetro_triangulo(lados integer[])
returns integer
language plpgsql
as $$
begin
	return lados[1] + lados[2] + lados[3];
end;
$$

select id_triangulo,lados[1],lados[2],lados[3], tipo_triangulo(lados) as tipos,
perimetro_triangulo(lados) as perimetro from triangulo;



