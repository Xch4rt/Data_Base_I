
USE Northwind

--======================================
--  Create T-SQL Trigger Template
--======================================

CREATE TRIGGER ActualizaProducto 
   ON  [Order Details]
   AFTER INSERT
AS 
DECLARE @idProducto INT, @Cantidad INT
SET @idProducto = (SELECT ProductID FROM inserted)
SET @Cantidad = (SELECT quantity FROM inserted)

UPDATE Products SET UnitsInStock = UnitsInStock - @Cantidad
WHERE ProductID = @idProducto
GO

SELECT * FROM [Order Details] WHERE OrderID = 10248

INSERT INTO [Order Details] VALUES (10248, 16, 17.45, 5,0)
SELECT * FROM Products

-----------------------------------------------------------------------------
create procedure insertar_detalle_factura
@orderId int,
@productId int,
@cantidad int,
@descuento float
as
declare @precio float

if (@cantidad > (select unitsinstock from products where ProductID = @productId))
begin
	select 'No disponible' as Mensaje,
	(select unitsinstock from products where ProductID = @productId) as 'Disponible'
end
else
begin
	set @precio = (select unitprice from products where ProductID = @productId)
	insert into [Order Details] values (@orderId, @productId, @precio, @cantidad, @descuento)
end
/*
Logica de factura:
- obtener el ultimo orderid
- # de orden sera = orderid + 1
- agregar los items que se llevara el cliente
- obtener el usuario conectado que realizara la venta
- obtener el nombre del usuario que llevara la compra
- si no esta registrado:
	registrar
- si lo esta
- ejecutar el proc facturar
- logica del facturar: ejectuar el procedimiento factura con un foreach
- ejecutar trigger actualizar_producto
*/
select top 1 orderID from [Order Details] order by OrderID desc

begin transaction
insert into Region
values
(8, 'Sur America')
commit transaction

select * from Region