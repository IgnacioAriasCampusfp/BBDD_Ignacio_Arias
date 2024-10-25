-- Modifica la estructura de la tabla Empleado para añadir un nuevo campo llamado FechaIngreso.
Alter table empleados
add fechaDeIngreso date;

-- Ejecuta una SELECT para obtener una relación con todos los empleados que 
-- trabajan en el departamento de Recursos Humanos ordenada por orden alfabético de nombre.
select * from empleados inner join departamento
on departamento.idDepartamento = empleados.idDepartamento
where departamento="RRHH";

-- Ejecuta una SELECT para obtener una relación con todos los empleados que 
-- no trabajen en el departamento de Recursos Humanos ordenada por orden alfabético de nombre.
select * from empleados inner join departamento
on departamento.idDepartamento = empleados.idDepartamento
where departamento!="RRHH" order by nombre;

-- Ejecuta una SELECT para obtener una relación 
-- con todos los empleados que tienen menos de 2 hijos.
select * from empleados inner join departamento
on departamento.idDepartamento = empleados.idDepartamento
where Hijos<2;

-- Intenta dar de alta un empleado con un código
 -- de departamento que no exista en la tabla DEPARTAMENTO
insert into empleados values(7,4,"Junji Ito", 0);

-- Añade 2 restricciones que consideres de interés. 
-- Luego comprueba cómo están funcionando dichas restricciones 
-- intentando ingresar filas que las incumplan.
insert into empleados values(7,3,"" ,0);