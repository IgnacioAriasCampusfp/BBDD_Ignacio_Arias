-- Obtén la información de todos los clientes de Madrid.

SELECT * FROM CLIENTE WHERE CIUDAD = 'MADRID';

-- Obtén la información de todos los clientes que no son de Madrid.
SELECT * FROM CLIENTE WHERE CIUDAD != 'MADRID';

-- Obtén la información de todos los clientes cuyo nombre comience con una de las letras entre B y G.
SELECT * FROM CLIENTE WHERE NOMBRE between 'B%' and 'G%';


-- Obtén la información de todos los clientes cuyo nombre comience con la letra R.
SELECT * FROM CLIENTE WHERE NOMBRE LIKE 'R%';

-- Obtén toda la información del producto con código BAB5.
SELECT * FROM PRODUCTO WHERE CODIGO = 'BAB5';

-- Obtén una relación con los productos a reponer y el dinero que hay que invertir en
-- reponerlo. Un producto necesita reposición si cumple la condición stock &lt; mínimo.
-- Mostrar código, descripción, stock, unidades a reponer y dinero.
SELECT CODIGO, DESCRIPCION, STOCK, (MINIMO - STOCK) AS REPONER, (MINIMO - STOCK) * PRECIO AS INVERTIR
FROM PRODUCTO
WHERE STOCK < MINIMO;

-- Obtén todas las líneas de detalle de todas las facturas incluyendo también la
-- descripción del artículo y el precio de la venta (unidades*precio). Deberás unir las
-- tablas detalle y producto.
SELECT DETALLE.NUMERO, DETALLE.CODIGO, DETALLE.UNIDADES, DETALLE.PRECIO, PRODUCTO.DESCRIPCION,
(DETALLE.UNIDADES * DETALLE.PRECIO) AS PVP
FROM DETALLE
JOIN PRODUCTO ON DETALLE.CODIGO = PRODUCTO.CODIGO;

-- Realiza una copia de la consulta 7 y establece un criterio para ver las líneas de
-- detalle de la factura 5000.
SELECT DETALLE.NUMERO, DETALLE.CODIGO, DETALLE.UNIDADES, DETALLE.PRECIO,
PRODUCTO.DESCRIPCION, (DETALLE.UNIDADES * DETALLE.PRECIO) AS PVP
FROM DETALLE
JOIN PRODUCTO ON DETALLE.CODIGO = PRODUCTO.CODIGO
WHERE DETALLE.NUMERO = 5000;

-- Realiza una copia de la consulta 7 y establece un criterio para ver las ventas del
-- artículo con código BAB5.
SELECT DETALLE.NUMERO, DETALLE.CODIGO, DETALLE.UNIDADES, DETALLE.PRECIO, PRODUCTO.DESCRIPCION, (DETALLE.UNIDADES * DETALLE.PRECIO) AS PVP
FROM DETALLE
JOIN PRODUCTO ON DETALLE.CODIGO = PRODUCTO.CODIGO
WHERE DETALLE.CODIGO = 'BAB5';

-- Obtén una relación con todas las facturas incluyendo también el nombre y teléfono
-- del cliente. Deberás unir las tablas factura y cliente.
SELECT FACTURA.NUMERO, FACTURA.FECHA, FACTURA.PAGADO, CLIENTE.NOMBRE, CLIENTE.TLF
FROM FACTURA 
JOIN CLIENTE  ON FACTURA.NIF = CLIENTE.NIF;

-- Obtén una relación con todas las facturas incluyendo también el nombre y teléfono
-- del cliente, así como el importe total de la factura (suma de unidades*precio para
-- cada factura). Deberás unir las tablas cliente, factura y detalle.
SELECT FACTURA.NUMERO, FACTURA.FECHA, FACTURA.PAGADO, CLIENTE.NOMBRE, CLIENTE.TLF, SUM(DETALLE.UNIDADES * DETALLE.PRECIO) AS TOTAL
FROM FACTURA
JOIN CLIENTE ON FACTURA.NIF = CLIENTE.NIF
JOIN DETALLE ON FACTURA.NUMERO = DETALLE.NUMERO
GROUP BY FACTURA.NUMERO, FACTURA.FECHA, FACTURA.PAGADO, CLIENTE.NOMBRE, CLIENTE.TLF;


-- Realizar una copia de la consulta 11 y establecer el siguiente criterio: sólo las
-- facturas del cliente DELGADO PEREZ MARISA.
SELECT FACTURA.NUMERO, FACTURA.FECHA, FACTURA.PAGADO, CLIENTE.NOMBRE, CLIENTE.TLF, SUM(DETALLE.UNIDADES * DETALLE.PRECIO) AS TOTAL
FROM FACTURA
JOIN CLIENTE ON FACTURA.NIF = CLIENTE.NIF
JOIN DETALLE ON FACTURA.NUMERO = DETALLE.NUMERO
WHERE CLIENTE.NOMBRE = 'ROSA PEREZ DELGADO'
GROUP BY FACTURA.NUMERO, FACTURA.FECHA, FACTURA.PAGADO, CLIENTE.NOMBRE, CLIENTE.TLF;

-- Realizar una copia de la consulta 11 y establecer el siguiente criterio: sólo las
-- facturas pagadas.
SELECT FACTURA.NUMERO, FACTURA.FECHA, FACTURA.PAGADO, CLIENTE.NOMBRE, CLIENTE.TLF, SUM(DETALLE.UNIDADES * DETALLE.PRECIO) AS TOTAL
FROM FACTURA
JOIN CLIENTE ON FACTURA.NIF = CLIENTE.NIF
JOIN DETALLE ON FACTURA.NUMERO = DETALLE.NUMERO
WHERE FACTURA.PAGADO = true
GROUP BY FACTURA.NUMERO, FACTURA.FECHA, FACTURA.PAGADO, CLIENTE.NOMBRE, CLIENTE.TLF;
-- Realizar una copia de la consulta 11 y establecer el siguiente criterio: sólo las
-- facturas pendientes de pago.
SELECT FACTURA.NUMERO, FACTURA.FECHA, FACTURA.PAGADO, CLIENTE.NOMBRE, CLIENTE.TLF, SUM(DETALLE.UNIDADES * DETALLE.PRECIO) AS TOTAL
FROM FACTURA
JOIN CLIENTE ON FACTURA.NIF = CLIENTE.NIF
JOIN DETALLE ON FACTURA.NUMERO = DETALLE.NUMERO
WHERE FACTURA.PAGADO = false
GROUP BY FACTURA.NUMERO, FACTURA.FECHA, FACTURA.PAGADO, CLIENTE.NOMBRE, CLIENTE.TLF;

-- Realizar una copia de la consulta 11 y establecer el siguiente criterio: facturas de
-- septiembre.
SELECT FACTURA.NUMERO, FACTURA.FECHA, FACTURA.PAGADO, CLIENTE.NOMBRE, CLIENTE.TLF, SUM(DETALLE.UNIDADES * DETALLE.PRECIO) AS TOTAL
FROM FACTURA
JOIN CLIENTE ON FACTURA.NIF = CLIENTE.NIF
JOIN DETALLE ON FACTURA.NUMERO = DETALLE.NUMERO
WHERE month(FACTURA.FECHA) = 7
GROUP BY FACTURA.NUMERO, FACTURA.FECHA, FACTURA.PAGADO, CLIENTE.NOMBRE, CLIENTE.TLF;

-- Realizar una copia de la consulta 11 y establecer el siguiente criterio: facturas con
-- importe entre 10 y 20 euros.
SELECT FACTURA.NUMERO, FACTURA.FECHA, FACTURA.PAGADO, CLIENTE.NOMBRE, CLIENTE.TLF, SUM(DETALLE.UNIDADES * DETALLE.PRECIO) AS TOTAL
FROM FACTURA
JOIN CLIENTE ON FACTURA.NIF = CLIENTE.NIF
JOIN DETALLE ON FACTURA.NUMERO = DETALLE.NUMERO
GROUP BY FACTURA.NUMERO, FACTURA.FECHA, FACTURA.PAGADO, CLIENTE.NOMBRE, CLIENTE.TLF
HAVING SUM(DETALLE.UNIDADES * DETALLE.PRECIO) BETWEEN 10 AND 50;



-- Obtén el importe total de todas las facturas pagadas. Debe salir una sola cifra con la
-- suma de los importes de todas las facturas.
SELECT SUM(DETALLE.UNIDADES * DETALLE.PRECIO) AS Total
FROM FACTURA
JOIN DETALLE ON FACTURA.NUMERO = DETALLE.NUMERO
WHERE FACTURA.PAGADO = TRUE;

-- Obtén el importe total de todas las facturas de ROSA PEREZ DELGADO.

-- Obtén una relación de artículos junto a la suma de las unidades totales vendidas y
-- el importe recaudado de dichas ventas.

-- Obtén una relación de clientes junto con el número total de facturas que tiene cada
-- uno (cuenta de facturas de cada cliente).

-- Basándonos en el ejercicio 6, obtén el importe total a invertir en la reposición de
-- artículos.

-- Aumentar un 3% el precio del artículo BAF4.

-- Añade la factura 5010 con fecha de hoy.

-- Borra la factura 5010.

-- Obtén la relación de productos junto al número de unidades vendidas de cada uno.

