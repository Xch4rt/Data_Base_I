use northwind

-- 1 Calcular las recaudaciones por a�o y por trimestre.
select  year(o.OrderDate) as A�o, 
datepart(quarter, o.OrderDate) as Trimestre,
round(sum((od.Quantity * od.UnitPrice) - (od.Quantity * od.UnitPrice * od.Discount)),2) as Recaudacion
from Orders o 
inner join [Order Details] od
on od.OrderID = o.OrderID
group by year(o.OrderDate), datepart(quarter, o.OrderDate)
order by year(o.OrderDate) asc

-- 2 Tomando de referencia el ejercicio 1, presentar �nicamente los trimestres cuya 
-- recaudaci�n sea mayor a 140,000.00 
select  year(o.OrderDate) as A�o, 
datepart(quarter, o.OrderDate) as Trimestre,
round(sum((od.Quantity * od.UnitPrice) - (od.Quantity * od.UnitPrice * od.Discount)),2) as Recaudacion 
from Orders o 
inner join [Order Details] od
on od.OrderID = o.OrderID
group by year(o.OrderDate), datepart(quarter, o.OrderDate)
having 
round(sum((od.Quantity * od.UnitPrice) - (od.Quantity * od.UnitPrice * od.Discount)),2)>140000
order by year(o.OrderDate) asc

-- 3 Calcular las recaudaciones por a�o y por mes.
select  year(o.OrderDate) as A�o, 
datename(month, o.OrderDate) as Mes,
round(sum((od.Quantity * od.UnitPrice) - (od.Quantity * od.UnitPrice * od.Discount)),2) as Recaudacion
from Orders o 
inner join [Order Details] od
on od.OrderID = o.OrderID
group by year(o.OrderDate), datename(month, o.OrderDate)
order by year(o.OrderDate) asc
 
--4 Calcular el promedio de recaudaci�n por a�o. Consistir� en la sumatoria de 
--recaudaciones por mes divididas entre el n�mero de meses en las que hubo 
--recaudaci�n
select distinct year(o.OrderDate) , MONTH(o.OrderDate) as mes
from Orders o
where year(o.OrderDate) = 1996
group by year(o.OrderDate), month(o.OrderDate)


-- 6 Utilizando Inner Join establecer un an�lisis de venta por cada uno de los empleados  
-- de la organizaci�n: 
-- EmployeeID 
-- NombreCompleto: Nombre + Apellido 
-- EdadEmpleado 
-- Cantidad: Cantidad de �rdenes atendidas 
-- CantidadPa�ses: Cantidad de Pa�ses atendidos  
--CantidadClientes: CantidadClientes 
-- VentasEmpleado: Monto por ventas incluyendo descuentos por empleado 
select e.EmployeeID, 
concat(e.FirstName ,' ', e.LastName) as Nombre_Completo, 
datediff(year,e.BirthDate,getDate()) as Edad,
count(distinct o.OrderID) as Cantidad,
count(distinct o.ShipCountry) as Cantidad_Paises,
count(distinct o.CustomerID) as Cantidad_Clientes,
round(sum((od.Quantity * od.UnitPrice) - (od.Quantity * od.UnitPrice * od.Discount)),2) as Ventas_Empleado
from Employees e
inner join Orders o
on o.EmployeeID = e.EmployeeID
inner join [Order Details] od
on od.OrderID = o.OrderID
--where e.EmployeeID = 5
group by e.EmployeeID, e.FirstName, e.LastName, e.BirthDate
order by round(sum((od.Quantity * od.UnitPrice) - (od.Quantity * od.UnitPrice * od.Discount)),2) asc

-- 7 Establecer la cantidad de �rdenes por pa�s y su representaci�n en porcentaje respecto 
-- a la cantidad total de �rdenes. Nota: La Sumatoria en porcentaje tiene que ser 100. 
select distinct o.ShipCountry,
count(o.OrderID),
cast(round((count(o.OrderID)*100./ (select count(o.OrderID) from Orders o)), 2) as numeric(36,2))   as Porcentaje
from Orders o
group by o.ShipCountry


--- 8 Consultar  la  cantidad  de  �rdenes  realizadas  por  pa�s  y  ciudad,  ordenarlo  por  pa�s  y 
-- cantidad de �rdenes en forma descendente
select o.ShipCountry, o.ShipCity, count(o.OrderID) from Orders o
group by o.ShipCountry, o.ShipCity
order by o.ShipCountry,count(o.OrderID) desc

