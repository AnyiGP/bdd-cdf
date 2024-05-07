use emarket;
#Consultas queries XL parte II - JOIN
#Generar un listado de todas las facturas del empleado 'Buchanan'. 
select e.apellido, f.FacturaID from facturas as f
inner join empleados as e
on f.EmpleadoID = e.EmpleadoID
where e.Apellido = 'Buchanan';

#Generar un listado con todos los campos de las facturas del correo 'Speedy Express'. f.EnvioVia, c.CorreoID, c.Compania
select * from  facturas as f
inner join correos as c
on f.EnvioVia = c.CorreoID  
where c.Compania = 'Speedy Express';

#Generar un listado de todas las facturas con el nombre y apellido de los empleados.
select e.Apellido, e.Nombre, f.FacturaID
from empleados as e
inner join facturas as f
on f.EmpleadoID = e.EmpleadoID

