create table pais(
	idpais int auto_increment primary key,
    pais varchar(25)
);

select distinct pais from cliente order by pais;

insert into pais(pais)
select distinct pais from cliente order by pais;

-- Insertar un nuevo pais en la tabla pais
insert into pais(pais) values ("Chad");

-- Introducir un nuevo producto
insert into producto(idproducto, nombre, idcategoria, medida, precio, stock) values ("78","Chocapics","2","10 cajas","2.50","8");

-- Busqueda donde el maximo precio de la tabla detalle
select*from detalle
where precio = (select max(precio) from detalle);

-- Busqueda de los pedidos con descuento donde no sea 0 ordenado por descuento

select*from detalle
where descuento > (select min(descuento) from detalle)
order by descuento;


-- Actualizar los Chocapics a 4.20 euros
update producto 
set idcategoria = "3", precio = "4.20"
where idpedido = "78";


-- Cambiar el primer pais a gibraltar
update pais 
set pais = "Gibraltar"
where idpais = "1";


-- Intentar eliminar el producto con id 50
DELETE FROM Producto
WHERE idproducto = 50;

-- Intentar insertar un pais que no existe con un id ya existente
Insert into pais values ("2", "Ecuador");

-- Hacer un cambio de un producto cambiando su id por otro
UPDATE Producto
SET idproducto = 200
WHERE idproducto = 5;










SELECT*FROM PRODUCTO
where IDPRODUCTO IN(SELECT distinct IDPRODUCTO from DETALLE);

-- Clientes que han comprado
SELECT * from CLIENTE
where idcliente in(select distinct idcliente from pedido);

-- Clientes que no han comprado
SELECT * from CLIENTE
where idcliente not in(select distinct idcliente from pedido);






create table agenda(
	idcliente char(5) primary key,
    cia varchar(150),
    contacto varchar(100),
    tlf varchar(25)

);

insert into agenda (select idcliente, cia, contacto, tlf from cliente);


select*from detalle
where precio < all (select precio from producto);

select*from producto order by precio;

-- Clientes que han realizado algun pedido
select*from cliente
where idcliente = any(select idcliente from pedido);


-- Clientes que no han realizado algun pedido
select*from cliente
where not idcliente = any(select idcliente from pedido);
