
-- Relacion de facturas incluyendo cia y contacto del Cliente
SELECT factura.numero, cliente.NOMBRE, cliente.TLF FROM tienda.factura
inner join cliente
on cliente.NIF = factura.NIF;

-- Incluye la relacion asignada que no tengan factua
SELECT factura.numero, cliente.NOMBRE, cliente.TLF FROM tienda.factura
right join cliente
on cliente.NIF = factura.NIF
where factura.numero is null;


-- Muestra la relacion de detalle(venta) incluyendo el producto comprado
SELECT numero, detalle.CODIGO, DESCRIPCION, detalle.PRECIO, unidades, detalle.PRECIO* unidades as Total FROM detalle
inner join producto
on detalle.CODIGO = producto.CODIGO ;
