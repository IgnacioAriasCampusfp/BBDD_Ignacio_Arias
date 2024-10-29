select cia, contacto, cargo, pais from cliente;

SELECT nombre, medida, precio, stock, precio*stock as recaudación
from producto;


select distinct pais from cliente
order by pais;

select cia, contacto, cargo, pais from cliente
order by cargo desc, contacto asc;

SELECT nombre, medida, precio, stock, precio*stock as recaudación
from producto
where stock%2=0;

select*from producto
where precio>=50 and precio<=100;

select*from cliente
where cia between "c" and "Hz"
order by cia;

select *from cliente
where pais="Alemania" or pais="Francia"
or pais = "España" or pais = "Reino Unido";

select *from cliente
where pais in ("Alemania","Francia","España","Reino Unido");

select*from producto
where not precio < 100;


select *from cliente
where region is null;

select *from cliente
where region is not null;



select  cia, contacto, cargo, ciudad, pais from cliente
where ciudad = 'Buenos Aires' or ciudad = "Campinas" or ciudad = "Caracas";


select *from producto
where nombre like "%queso%";

select*from cliente
where region like "W_";

select pais, count(idcliente) as cantidad
from cliente
group by pais;

select idcategoria, count(idproducto) from producto
group by idcategoria;

select idcategoria, avg(precio) from producto
group by idcategoria;

select idcategoria, max(precio) from producto
group by idcategoria;

select detalle.idpedido, sum(precio*unidades) as importe, fechapedido, cia, contacto
from detalle 
inner join pedido 
on pedido.idpedido = detalle.idpedido
inner join cliente 
on cliente.idcliente = pedido.idcliente
group by idpedido
order by idpedido;



select categoria, avg(precio) as promedio from producto
inner join categoria
on producto.idcategoria = categoria.idcategoria
group by categoria 
having promedio > 20;

select detalle.idpedido, sum(precio*unidades) as importe
from detalle 
where idpedido>10999
group by idpedido
having importe < 1000
order by idpedido;

