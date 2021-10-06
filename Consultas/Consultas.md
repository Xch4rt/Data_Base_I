### Consultas
#### Select:
Esta sentencia nos permitirá seleccionar los cambios de una o varias tablas, si deseamos toda la información, colocaremos asterisco  * de lo contrario, mencionamos los campos. Si estamos utilizando varias tablas y el mismo nombre del campo, tenemos que especificar a que tabla pertenece el campo que queremos para no generar una ambiguedad.

#### From
Con esta sentencia indicaremos en que tabla buscamos información.
```
select * from Employees
select * from Products
```
### Where
Esta sentencia filtra registros que cumplan la condición dada, verdadera o falsa. Si quisieramos unir más condiciones utilizaremos los operadores logicos *AND*  u *OR*, esto será de acuerdo a la informacion de lo que se desea obtener.

** Ejemplos **
* Con una condicion
```
select * from Products
where CategoryID = 2
```
* Con dos condiciones
```
select * from Products
where CategoryID = 6  and ProductID = 1
```
```
select * from Products
where CategoryID = 6 or CategoryID = 4
```
Cuando tenemos varias condiciones con mas de un *OR* utilizaremos la sentencia *IN*
	**IN** Reduce el codigo 
Ejemplos
```
select * from Products
where CategoryID in (4,6,8,2)
```
```
select * from Customers
# where country in ('USA','NIC')
```

#### OrderDate
Permite seleccionar una parte de la fecha de un registro y establecer un valor de comparacion a este, estableciendo **verdadero** o **falso**
Ejemplo:
```
select * 
from dbo.Orders
where year(OrderDate) = '1996'
```

#### DATEPART
Permite establecer argumentos de comparacion de un determinado campo, siendo este dia (dd), mes (mm), año (yyyy), etc
Ejemplo:
```
select  *
from Orders
where EmployeeID in (2,3,4,5) and
DATEPART (mm, OrderDate) = '07' and
DATEPART (dd, OrderDate) = '31'
```

#### ORDER BY
Si queremos ordenar la informacion tiene que estar explicito en el **SELECT**. Como ya mencionamos sirve para ordenar uno o mas campos, ya sea en forma ascendente como descendente. Cuando ordenamos y no lo aclaremos la forma como queremos que se ordene por defecto lo hace ascendente.
Ejemplos:
```
select ProductID, ProductName, UnitPrice, UnitStock
from Products
where UnitsInStock between 0 and 10
order by ProductName
```
Forma ascendente
```
select ProductID, ProductName, UnitPrice, UnitStock
from Products
where UnitsInStock between 0 and 10
order by ProductName asc
```
Forma descendente
```
select ProductID, ProductName, UnitPrice, UnitStock
from Products
where UnitsInStock between 0 and 10
order by ProductName desc
```

#### LIKE
```
select ProductID, ProductName
from Products
where ProductName = 'chang'
```
Se utiliza para comparar una expresion de cadena
```
select ProductID, ProductName
from Products
where ProductName like 'chang'
```

Si queremos buscar por una palabra, letra o frase; debemos de poner un comodin que es el signo %
```
select ProductID, ProductName
from Products
where ProductName like '%P'
```

* Que empiecen con C
```
select ProductID, ProductName
from Products
where ProductName like 'C%'
```
* Que contenga la palabra C
```
select ProductID, ProductName
from Products
where ProductName like '%C%
```
* Que termine con C
```
select ProductID, ProductName
from Products
where ProductName like 'C%'
```
