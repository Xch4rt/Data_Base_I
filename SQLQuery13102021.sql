
Use Northwind
go
/*12. Realizar un procedimiento almacenado que reciba como parámetro el año. Calcular el
promedio de recaudación basado en 12 meses y presente cual es la recaudación del
mes más cercana al promedio */


--1997

Execute dbo.Recaudacion_Intermedia 1998
Alter procedure Recaudacion_intermedia @Año int
as
Declare @Promedio float, @Contador int, @distancia float, @id int
set @Contador = 1
set @Promedio =
(Select 
round (sum((od.Quantity * od.UnitPrice ) - (od.Quantity * od.UnitPrice * od.Discount)),2)
from 
[Order Details] od
inner join Orders o
on o.orderID = od.OrderID
where year(o.orderdate) = @Año)/(
Select count( distinct month(orderdate)) as Cantidad
from orders where year(orderdate) =@Año)

Select @promedio
Create table #Ventas_Mensuales
(id int primary key identity(1,1),
 noMes int,
 nombreMes varchar(50),
 Recaudacion float)

insert into #Ventas_Mensuales
Select 
month(Orderdate) as NoMes,
datename(month, o.Orderdate) as NombreMes,
round (sum((od.Quantity * od.UnitPrice ) - (od.Quantity * od.UnitPrice * od.Discount)),2)
from 
[Order Details] od
inner join Orders o
on o.orderID = od.OrderID
where year(o.orderdate) = @Año
Group by
month(Orderdate),
datename(month, o.Orderdate) 
Order by noMes Asc
set  @distancia = abs(@Promedio - (Select Recaudacion from #Ventas_Mensuales where Id = 1))
while(@Contador < = (Select count(*) from #Ventas_Mensuales))
begin
if (@distancia > (abs(@Promedio - (Select Recaudacion from #Ventas_Mensuales where Id = @Contador))))
     begin
	 set @id = (Select ID from #Ventas_Mensuales where Id = @Contador)
	 set @distancia = (abs(@Promedio - (Select Recaudacion from #Ventas_Mensuales where Id = @Contador)))
	 end
	 set @Contador = @Contador +1
end
Select 
@Año as Año,
vm.noMes as [Número Mes],
vm.nombreMes as [Nombre Mes],
round(@Promedio,2) as Promedio,
round(vm.Recaudacion,2) as [Recaudación Intermedia]
from #Ventas_Mensuales vm where Id = @id
Drop table #Ventas_Mensuales