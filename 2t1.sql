use northwind
/*
Calcular las recaudaciones por empleado y cantidad de órdenes atendidas.  
Columnas a presentar: 
(IdEmpleado – Nombre del Empleado -Cantidad de órdenes- Recaudación) 
*/
select e.EmployeeID IdEmpleado, 
concat(e.FirstName,' ',e.LastName) [Nombre del Empleado],
count(od.OrderID) [Cantiad de ordenes],
round(sum((od.Quantity * od.UnitPrice) - (od.Quantity * od.UnitPrice * od.Discount)), 2) Recaudacion
from [Order Details] od
inner join Orders o
on o.OrderID = od.OrderID
inner join Employees e
on e.EmployeeID = o.EmployeeID
--where o.EmployeeID = 5
group by e.EmployeeID, concat(e.FirstName,' ',e.LastName)
order by e.EmployeeID desc


/*
Realizar  un  procedimiento  almacenado  que  reciba  como  parámetro  el  año  y 
Presentar el producto más vendido (sumatoria) por cada mes. 
Columnas a presentar: 
(Nombre del Mes – Nombre del Producto Top – Cantidad Vendida) 
*/

select  datename(month, o.OrderDate),
count(p.ProductID) as ProductID, 
sum( od.UnitPrice) as Precio
from Products p
inner join [Order Details] od
on od.ProductID = p.ProductID
inner join Orders o 
on o.OrderID = od.OrderID
where datename(month, o.OrderDate) = 'April' and year(o.OrderDate) = 1997
group by p.ProductID, datename(month, o.orderdate)
order by count(p.ProductID) desc

select * from Orders

