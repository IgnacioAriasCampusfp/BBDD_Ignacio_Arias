select animal, familia,cuantos from familia 
inner join animal
on Familia.idfamilia = animal.idfamilia;

select animal, familia,cuantos from familia 
left join animal
on Familia.idfamilia = animal.idfamilia;

-- lo mismo que arriba
select animal, familia,cuantos from animal 
right join familia
on Familia.idfamilia = animal.idfamilia;

-- Familia sin animales
select animal, familia from familia 
left join animal
on Familia.idfamilia = animal.idfamilia
where animal is null;

-- insert into familia values (4,"Felinos");
