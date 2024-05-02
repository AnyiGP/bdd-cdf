SELECT emarket;
use emarket;

#Queremos tener un listado de todas las categorías
SELECT * from categorias;

#Cómo las categorías no tienen imágenes, solamente interesa obtener un listado de CategoriaNombre y Descripcion.
select CategoriaNombre, descripcion from categorias;

#Obtener un listado de los productos.
SELECT * FROM productos;

#Obtener un listado de los productos.  (Discontinuado = 1)
SELECT * from productos WHERE discontinuado = 1; 

#Para el viernes hay que reunirse con el Proveedor 8. ¿Qué productos son los que nos provee?
select * from productos where proveedorid = 8;

#Queremos conocer todos los productos cuyo precio unitario se encuentre entre 10 y 22.
SELECT * from productos where preciounitario BETWEEN 10 and 22 ORDER BY preciounitario DESC;

#Se define que un producto hay que solicitarlo al proveedor si sus unidades en stock son menores al Nivel de Reorden. ¿Hay productos por solicitar?
SELECT * from productos where UnidadesStock < NivelReorden;

#Se quiere conocer todos los productos del listado anterior, pero que unidades pedidas sea igual a cero.
SELECT * from productos where UnidadesStock < NivelReorden and UnidadesPedidas = 0;

#Clientes
#Obtener un listado de todos los clientes con Contacto, Compania, Título, País. Ordenar el listado por País.
SELECT Contacto, Compania, Titulo, Pais from clientes ORDER BY pais;

#Queremos conocer a todos los clientes que tengan un título “Owner”.
SELECT * from clientes where titulo = "Owner";

#El operador telefónico que atendió a un cliente no recuerda su nombre. Solo sabe que comienza con “C”. ¿Lo ayudamos a obtener un listado con todos los contactos que inician con la letra “C”?
SELECT * from clientes where Contacto like "C%";

#Facturas
#Obtener un listado de todas las facturas, ordenado por fecha de factura ascendente.
SELECT * from facturas ORDER BY FechaFactura;

#Ahora se requiere un listado de las facturas con el país de envío “USA” y que su correo (EnvioVia) sea distinto de 3.
SELECT * from facturas where PaisEnvio like "USA" and EnvioVia != 3;

#¿El cliente 'GOURL' realizó algún pedido?
SELECT * from facturas WHERE ClienteID = 'gourl';

#Se quiere visualizar todas las facturas de los empleados 2, 3, 5, 8 y 9.
SELECT * from facturas WHERE EmpleadoID in (2, 3, 5, 8, 9);

#Consultas queries ML - Parte II. En esta segunda parte vamos a intensificar la práctica de consultas SELECT, añadiendo ALIAS, LIMIT y OFFSET.
#Productos
#Obtener el listado de todos los productos ordenados descendentemente por precio unitario.
select * from productos order by PrecioUnitario desc;

#Obtener el listado de top 5 de productos cuyo precio unitario es el más caro.
select ProductoNombre, PrecioUnitario from productos order by PrecioUnitario desc limit 5;

#Obtener un top 10 de los productos con más unidades en stock.
select ProductoNombre, CantidadPorUnidad from productos order by CantidadPorUnidad desc limit 10;

#FacturaDetalle
#Obtener un listado de FacturaID, ProductoID, Cantidad.
select FacturaID, ProductoID, Cantidad from 





