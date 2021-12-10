use northwind


--Calcular las recaudaciones por año y por trimestre. 

create function getFunds(@year int, @trimester int)
returns float
as
begin
declare @res float
set @res =
(select 
round(sum((od.unitprice * od.quantity)*(1 - od.discount)),2) RECAUDACION
from [Order Details] od
inner join Orders o 
on o.OrderID = od.OrderID
where YEAR(o.orderdate) = @year and DATEPART(qq, o.OrderDate) = @trimester)
return @res
end


select distinct year(o.orderdate) as 'YEAR',  
datepart(qq, o.orderdate) as 'TRIMESTRE',
dbo.getFunds(year(o.orderdate), datepart(qq, o.OrderDate)) as RECAUDACION
from [Order Details] od
inner join Orders o
on o.OrderID = od.OrderID
order by year(o.orderdate) , datepart(qq, o.orderdate)

-- Tomando de referencia el ejercicio 1, presentar únicamente los trimestres cuya 
-- recaudación sea mayor a 140,000.00

select distinct year(o.orderdate) as 'YEAR',  
datepart(qq, o.orderdate) as 'TRIMESTRE',
dbo.getFunds(year(o.orderdate), datepart(qq, o.OrderDate)) as RECAUDACION
from [Order Details] od
inner join Orders o
on o.OrderID = od.OrderID
where dbo.getFunds(year(o.orderdate), datepart(qq, o.OrderDate)) > 140000
order by year(o.orderdate) , datepart(qq, o.orderdate)

-- Calcular las recaudaciones por año y por mes.


create function getFundsMonth(@year int, @month int)
returns float
as
begin
declare @res float
set @res =
(select 
round(sum((od.unitprice * od.quantity)*(1 - od.discount)),2) RECAUDACION
from [Order Details] od
inner join Orders o 
on o.OrderID = od.OrderID
where YEAR(o.orderdate) = @year and DATEPART(mm, o.OrderDate) = @month)
return @res
end

select distinct year(o.orderdate) 'YEAR',
datename(month,o.OrderDate) 'MONTH',
dbo.getFundsMonth(year(o.orderdate), datepart(mm, o.orderdate)) 'RECAUDACION'
from Orders o
order by year(o.orderdate)

/*
Calcular el promedio de recaudación por año. Consistirá en la sumatoria de 
recaudaciones por mes divididas entre el número de meses en las que hubo 
recaudación. 
*/

select distinct
o.año as año,
round(sum(o.Recaudacion)/count(o.meses),2) [Promedio Recaudacion anual]
from(
select distinct o.année as año,
o.mes as meses,
round(sum((od.Quantity * od.UnitPrice) - (od.Quantity * od.UnitPrice * od.Discount)),2)as Recaudacion
from[Order Details] od
inner join (select oym.orderid, oym.année, oym.mes from ordenyearmonth oym)o on o.OrderID=od.OrderID
group by o.mes,o.année) o
group by o.año


create view ordenyearmonth
as
Select distinct o.OrderID, year(o.OrderDate)  as année, DATENAME(Month,o.OrderDate) as mes from Orders o

select * from ordenyearmonth


select 
			year(o.OrderDate) as Año,
			round(sum(round((od.Quantity*od.UnitPrice)*(1-od.Discount),2)) /
			(
			select 
			count(r1.Año)
			from
			(select 
			year(o.OrderDate) as Año
			from Orders o 
			group by year(o.OrderDate), MONTH(O.oRDERdATE))r1
			where r1.Año = YEAR(o.OrderDate)
			group by r1.Año
			),2) as [Recaudación promedio anual]
			from Orders o 
			inner join [Order Details] od on o.OrderID = od.OrderID
			group by YEAR(o.OrderDate)
			order by YEAR(o.OrderDate)


/*
Utilizando SubConsulta Escalar, presentar la siguiente información: 
o IdProducto 
o ProductName 
o CantidadVendida: Sumatoria de las cantidades vendidas del producto 
o CantidadÓrdenes:  Cantidad  de  órdenes  en  la  que  el  producto  ha  sido 
vendido 
o CantidadDescuento:  Cantidad  de  órdenes  en  la  que  el  producto  ha 
recibido descuento 
o CantidadSinDescuento: Cantidad de órdenes en la que el producto no ha 
recibido descuento
*/

select 
distinct p.ProductID [CANTIDAD VENDIDA],
p.ProductName [NOMBRE PRODUCTO],
sum(od.Quantity) [CANTIDAD VENDIDAS],
count(od.productid) [CANTIDAD ORDENES],
dbo.discount(p.ProductID) [CON DESCUENTO],
dbo.undiscount(p.ProductID) [SIN DESCUENTO]
from [Order Details] od
inner join Orders o
on o.OrderID = od.OrderID
inner join Products p
on p.ProductID = od.ProductID
--WHERE P.ProductID = 60
group by p.ProductID, p.ProductName


create function discount(@idproduct int)
returns int 
as
begin
declare @res float
set @res =(
select count(o.OrderID) from [Order Details] od 
	inner join Orders o 
	on o.OrderID = od.OrderID
	inner join Products p
	on p.ProductID = od.ProductID
	where od.Discount > 0 and p.ProductID = @idproduct)
return @res
end
alter function undiscount(@idproduct int)
returns int 
as
begin
declare @res float
set @res =(
select count(o.OrderID) from [Order Details] od 
	inner join Orders o 
	on o.OrderID = od.OrderID
	inner join Products p
	on p.ProductID = od.ProductID
	where od.Discount = 0 and p.ProductID = @idproduct)
return @res
end


/*
Utilizando Inner Join establecer un análisis de venta por cada uno de los empleados  
de la organización: 
EmployeeID 
NombreCompleto: Nombre + Apellido 
EdadEmpleado 
Cantidad: Cantidad de órdenes atendidas 
CantidadPaíses: Cantidad de Países atendidos  
CantidadClientes: CantidadClientes 
VentasEmpleado: Monto por ventas incluyendo descuentos por empleado
*/
select * from orders

select distinct o.EmployeeID,
e.FirstName+' '+e.LastName [NOMBRE COMPLETO],
DATEDIFF(yy,e.BirthDate, GETDATE()) [EDAD],
dbo.cantidad(o.EmployeeID) [CANTIDAD],
dbo.paises(o.EmployeeID) [CANTIDAD PAISES]
from [Order Details] od
inner join Orders o 
on o.OrderID = od.OrderID
inner join Employees e
on e.EmployeeID = o.EmployeeID
where e.EmployeeID = 5


create function cantidad(@idempleado int)
returns int
as
begin
declare @res int
set @res = (
select count(o.orderid) total
from orders o 
inner join Employees e on o.EmployeeID = e.EmployeeID
where o.EmployeeID = @idempleado
)
return @res
end

alter function paises(@idempleado int)
returns int
as
begin
declare @res int
set @res =(
select 
count(distinct ShipCountry) cantidadpaises
from [Order Details] od
inner join Orders o 
on o.OrderID = od.OrderID
where o.EmployeeID = @idempleado
)
return @res
end



