SELECT * FROM familia, animal;

-- La clausula ON filtra sobre el producto cartesiano.
Select * from familia inner join animal
	on familia.idfamilia = animal.idFamilia
    where cuantos > 3;
    
-- La relación de familias.
select*from familia;
-- La relación de animales en orden alfabético.
Select * from animal order by animal;
-- La relación de animales con más de 3 ejemplares.
select * from animal where cuantos > 3;
-- La relación de animales ordenado por número de ejemplares.
select*from animal order by cuantos;
-- La relación de animales incluyendo el nombre de la familia (INNER JOIN).
select animal, familia, cuantos from familia inner join animal
on familia.idfamilia = animal.idFamilia;


-- Acciones incorrectas

-- Inserta una nueva familia con idFamilia = 1.
insert into familia values (1, 'Felinos');

-- Inserta un animal asignado a la familia con id=7.
insert into animal values (10, 7, 'Lombrices', 10);


-- Intenta eliminar la familia con idFamilia = 1. Todavía no he explicado la sentencia DELETE, investiga por tu cuenta.
Delete from familia where idfamilia= 1;


-- Inserta un nuevo animal asignando un texto como valor del atributo cuantos.
    insert into animal values (10, 7, 'Lombrices', "Pepe");
    
    
    
    
