use Northwind

create proc MostrarData 
@Year int	
as
select * from [Order Details]
select * from Products
select * from Orders

select 
distinct p.ProductID as [ID PRODUCTO],
p.ProductName as [NOMBRE PRODUCTO],
sum(od.Quantity) as [CANTIDAD DE ORDENES VENDIDAS],
count(od.Discount) as [CANTIDAD DE ORDENES CON DESCUENTO],
round(sum((od.quantity * od.unitprice) - (od.quantity * od.unitprice * od.discount)),(2)) as [RECAUDACION],
round(sum((p.unitsinstock * p.unitprice)),2) / round(sum((od.quantity * od.unitprice) - (od.quantity * od.unitprice * od.discount)),(2)) as [PORCENTAJE]
from Products p
inner join [Order Details] od
on od.ProductID = p.ProductID
where od.Discount <> 0
group by p.ProductID, p.ProductName,od.Quantity,od.Discount


select @@SERVERNAME