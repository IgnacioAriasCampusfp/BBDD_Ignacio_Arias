	
-- Ver los detalles de los clientes que han alquilado un alojamiento en Sevilla.
SELECT c.idcliente, c.Nombre, c.Tlf, a.Lugar, al.Entrada, al.Salida
FROM cliente c
INNER JOIN alquiler al ON c.idcliente = al.idcliente
INNER JOIN alojamiento a ON al.idalojamiento = a.idalojamiento
WHERE a.Lugar = 'Sevilla';
-- Contar cuántos clientes han alquilado alojamientos en cada ciudad.
SELECT a.Lugar, COUNT(DISTINCT al.idcliente) AS num_clientes
FROM alquiler al
INNER JOIN alojamiento a ON al.idalojamiento = a.idalojamiento
GROUP BY a.Lugar;
-- Ver los alquileres cuyo precio sea mayor a 500.
SELECT al.idcliente, al.idalojamiento, al.Entrada, al.Salida, al.precio
FROM alquiler al
WHERE al.precio > 500;

-- Ver los clientes que han alquilado más de un alojamiento o uno
SELECT c.idcliente, c.Nombre, COUNT(al.idalojamiento) AS num_alquileres
FROM cliente c
INNER JOIN alquiler al ON c.idcliente = al.idcliente
GROUP BY c.idcliente
HAVING COUNT(al.idalojamiento) >= 1;

-- Ver los chalets alquilados en septiembre de 2024
SELECT a.Lugar, a.Tipo, al.Entrada, al.Salida, al.precio
FROM alquiler al
INNER JOIN alojamiento a ON al.idalojamiento = a.idalojamiento
WHERE a.Tipo = 'Chalet' AND al.Entrada BETWEEN '2024-09-01' AND '2024-09-30';


-- Ver el alquiler más barato y el más caro para cada tipo de alojamiento
SELECT a.Tipo, 
       MIN(al.precio) AS precio_minimo, 
       MAX(al.precio) AS precio_maximo
FROM alquiler al
INNER JOIN alojamiento a ON al.idalojamiento = a.idalojamiento
GROUP BY a.Tipo;

-- Ver los clientes que alquilaron alojamientos "Limpios" y cuyo alquiler costó más de 200
SELECT c.Nombre, a.Lugar, a.Tipo, al.precio
FROM cliente c
INNER JOIN alquiler al ON c.idcliente = al.idcliente
INNER JOIN alojamiento a ON al.idalojamiento = a.idalojamiento
WHERE a.condiciones = 'Limpio' AND al.precio > 200;

-- Ver los alojamientos y sus precios ordenados de menor a mayor precio
SELECT a.Lugar, a.Tipo, a.condiciones, al.precio
FROM alojamiento a
INNER JOIN alquiler al ON a.idalojamiento = al.idalojamiento
ORDER BY al.precio ASC;

-- Ver el número de clientes únicos que alquilaron cada tipo de alojamiento, excluyendo a aquellos que alquilaron más de una vez
SELECT a.Tipo, COUNT(DISTINCT al.idcliente) AS num_clientes
FROM alquiler al
INNER JOIN alojamiento a ON al.idalojamiento = a.idalojamiento
GROUP BY a.Tipo
HAVING COUNT(DISTINCT al.idcliente) = 1;

-- Ver los alquileres realizados en un intervalo de fechas específico, excluyendo los alojamientos en Madrid
SELECT al.idcliente, al.idalojamiento, al.Entrada, al.Salida, al.precio
FROM alquiler al
INNER JOIN alojamiento a ON al.idalojamiento = a.idalojamiento
WHERE al.Entrada BETWEEN '2024-10-01' AND '2024-10-15'
AND a.Lugar != 'Madrid';

--

--

--
