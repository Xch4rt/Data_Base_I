# Bases de Datos I

[1. Variables](#variables).<br/>
[2. Consultas y Funciones](#consultas).<br/>
[3. Modelo Relacional](#modelo_relacional)<br/>
[4. Arquitectura](#arquitectura).<br/>
## Variables
Tipos de variables numericas exactas:

* bigInt -> 8 bytes
* Int -> 4
* smallInt ->1
* tinyInt ->1

*decimal(p,s) ->p: precision, s: numero de decimales que recibira
* money -> dinero 8bytes
* smallmoney -> 4bytes

Tipos de variables numericas aproximadas

* float depende de los valores que ocupe
* real 4bytes

Fecha y hora
* datetime inicia desde 1/1/753 hasta 31/12/1999
* smalldateti inicia desde 31/12/199 hasta 2/12/2999

Cadena de caracteres
* char(n) -> n es la cantidad de bytes, solo recibe un caracter
* varchar(n) -> recibe varios caracteres
* text -> en desuso

Cadena de caracteres unicode
* nchar(n) doble de un char normal en memoria
* nvarchar(n) doble de un nvarchar en memoria
ambos pueden recibir simobolos especiales

Cadenas binarias
* binary(n) n: cantidad de bits, 1-8000
* varbinary(n) longitud variable que ocupa dependiendo los parametros n bytes



## Consultas
### Consulta Select
`SELECT ListaColumnas FROM Nombre_Tabla`

### En donde
**SELECT** es el comando para obtener registros de la base de datos.

**ListaColumnas** será el espacio en el que debemos especificar los nombres de las columnas de las cuales queremos recibir la información.

**From** es el comando que permite que indiquemos la tabla de la cual vamos a consultar los registros.

**Nombre_Tabla** Indicaremos el nombre de la tabla a consultar los datos.

Ejemplos:
`
SELECT Nombre, Apellido, Direccion, Fecha_nacimiento FROM Alumnos
`
`
SELECT * FROM Alumnos
`
Donde * nos devolverá toda la información de la tabla **Alumnos**

### Consulta WHERE
Nos permite especificar una condición que tiene que cumplirse con los registros de uno o varios campos que especifiquemos, de tal manera que los datos encontrados en la condición serán devueltos. Devuelve un resultado booleano

Al devolver un valor booleando podemos hacer uso de las siguientes expresiones:

**>** Mayor

**>=** Mayor o igual

**<** Menor

**<=** Menor o igual

**=** Igual <> o **!=** Dif 

Ejemplo
`
SELECT * FROM Alumnos where Nombre="Pablo"
`
### Consulta INSERT INTO
 
La instrucción INSERT INTO se utiliza para insertar nuevos registros en una tabla.

**1. Especifique tanto los nombres de las columnas como los valores que se insertarán:**
<br/>
Sintaxis
`
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...)
`
<br/>
**2. Si agrega valores para todas las columnas de la tabla, no es necesario que especifique los nombres de las columnas en la consulta SQL. Sin embargo, asegúrese de que el orden de los valores esté en el mismo orden que las columnas de la tabla. Aquí, la sintaxis INSERT INTO sería la siguiente:**
`
INSERT INTO table_name 
VALUES (value1, value2, value3, ...)
`
<br/>
## Ejemplo

|CustomerID 	|CustomerName 	|ContactName 	|Address 	|City 	|PostalCode 	|Country |
|-------------|---------------|-------------|---------|-------|-------------|--------|
|89 	        |White Clover Markets 	|Karl Jablonski 	|305 - 14th Ave. S. Suite 3B 	|Seattle 	|98128 	|USA
|90           |Wilman Kala 	|Matti Karttunen 	|Keskuskatu 45 	|Helsinki 	|21240 	|Finland
|91           |Wolski 	|Zbyszek 	|ul. Filtrowa 68 	|Walla 	|01-012 	|Poland


`
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
`
<br/>
`
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');
`
<br/>
|CustomerID 	|CustomerName 	|ContactName 	|Address 	|City 	|PostalCode 	|Country |
|-------------|---------------|-------------|---------|-------|-------------|--------|
|89 	        |White Clover Markets 	|Karl Jablonski 	|305 - 14th Ave. S. Suite 3B 	|Seattle 	|98128 	|USA |
|90           |Wilman Kala 	|Matti Karttunen 	|Keskuskatu 45 	|Helsinki 	|21240 	|Finland |
|91           |Wolski 	|Zbyszek 	|ul. Filtrowa 68 	|Walla 	|01-012 	|Poland |
|92           |Cardinal |Tom B. Erichsen |Skagen 21 |Stavanger |4006 |Norway |


# Arquitectura

## Arquitectura Centralizada

Una base de datos centralizada es aquella que esta totalmente en un solo
lugar fisico, es decir que esta almacenada en una sola maquina, en una sola CPU
en la cual los usuarios trabajan en terminales que solo muestran resultados-


### Caracteristicas

* Se almacena completamente en una localidad central
* No posee multiples elementos de procesamiento ni mecanismos de intercomunicacion
como las bases de datos distribuidas
* Los componentes de estas son : **Los datos**, **Software de gestion** y **dispositivos de almacenamiento secundarios**
* El problema de seguridad es facil de manejar en estas.

### Ventajas:
* Se evita la redundancia
* Se evita la inconsistencia
* Pueden aplicarse restricciones de seguridad
* Puede conservarse la integridad
* El procesamiento de los datos ofrece un mejor rendimiento y resulta mas confiable que los sistemas distribuidos

### Desventajas
* Si el sistema de base de datos falla, se pierde la disponibilidad y procesamiento de la informacion que posee el sistema
* Dificil sincronizacion para su recuperacion
* Las cargas de trabajo no se pueden difundir entre varias computadoras

## Arquitecturas Paralelas

La particion de la BD para poder procesar de forma paralela en distintos discos y con distintos procesadores una sola operacion sobre la base de datos.
El paralelismo se usa para mejorar la velocidad en la ejecucion de consultas. 

### Existen 4 arquitecturas de sistemas paralelos
* De memoria compartida
* De discos duros compartidos
* Sin compartimiento
* Jerarquica

## Cliente/Servidor
Primero identifiquemos lo que es cliente y servidor:

Conocemos como cliente al programa ejecutable que participa activamente en el establecimiento de las conexiones. Envia peticiones al servidor y se queda esperando por una respuesta.

Servidor es un programa que ofrece un servicio que se puede obtener en una red. Acepta la peticion desde la red, realiza el servicio y devuelve el resultado al solicitante. Al ser posible implantarlo como aplicaciones de programas, puede ejecutarse en cualquier sistema donde existe TCP/IP y junto con otos programas de aplicacion

*Tecnologia Cliente/Servidor*
Es el procesamiento cooperativo de la informacion por medio de un conjunto de procesadores, en el cual multiples clientes, distribuidos geograficamente solicitan requerimientos a uno o mas servidores centrales.

*MODELO*

El cliente envia un mensaje solicitando un determinado servicio a un servidor, y este envia uno o varios mensajes con la respuesta. En un sistema distribuido cada maquina puede cumplir el rol de seridor para algunas tareas y el rol de cliente para otras


**Niveles de modelos**

**Nivel de usuario**
Los componentes del nivel de usuario, proporcionan la interfaz visual que los clientes utilizarán para ver la información y los datos. 

**Nivel de negocios**
Como los servicios de usuario no pueden contactar directamente con el nivel de servicios de datos, es responsabilidad de los servicios de negocio hacer de puente entre estos.

**Nivel de datos**
El nivel de datos se encarga de las típicas tareas que realizamos con los datos: Inserción, modificación, consulta y borrado (CRUD). 


# Modelo_Relacional
***Modelo Relacional***

Definimos el Modelo Relacional consiste en un conjunto de relaciones( tablas ), relacion de datos compuestas por filas, o tuplas, y columnas o campos.

### Clave Primaria
Es el atributo que me permite identificar al registro, la clave primaria puede ser sencilla o compuesta
* Clave primaria sencilla -> Hace referencia a una sola tabla
* Clave compuesta -> Hace referencia a 2 tablas
* Llave foranea -> Es la referencia de una clave primaria a otra tabla
* Relaciones -> Puede haber relaciones (1,1), (1,m), (m,1) (tercera tabla)


***Normalizacion***
¿Que es?
<br/>
La normalizacion es el proceso de simplificacion de datos y que nos ayuda a tener almacenado con el menor espacio posible, eliminar datos repetidos, eliminar errores logicos y poder tener datos ordenados.

### Normalizacion
<br/>
1. Primera forma normal: Los atributos de una tabla deben ser atomicos y poseer una clave primaria (cada atributo debe contener un valor sencillo)
<br/>
2. Segunda forma normal: Debe estar en primera forma normal y no podran existir dependencias parciales por la clave primaria
<br/>
3. Tercera forma norma: Debera estar en segunda forma normal y no podran existir dependecias transitivas
<br/>

Con la tercera forma ya tenemos una base de datos bien estructurada y optimizada.

Un valor sencillo para cada tupla (atomico) significa que no se puede dividir

Ejemplificando
<br/>
Esta tabla no cumple con la primera forma normal 
<br/>
|IdPedido	|FechaPedido	|IdCliente	|NombreCompañia	     |IdEmpleado	|Nombre	  |FechaEnvio	|idproducto	|nombreProducto	            |preciounidad	|cantidad	|descuento|
|---------|------------|----------|--------------------|-----------|---------|-----------|-----------|---------------------------|-------------|---------|---------|
|10248	   |4/8/1994	   |WILMK	    |Wilman Kala	        |5          |Steven	  |16/8/1994	 |11	        |Queso Cabrales	            |14	          |12	      |0        |
|10248	   |4/8/1994	   |WILMK	    |Wilman Kala	        |5	         |Steven	  |16/8/1994	 |42	        |Tallarines de Singapur	    |10	          |10	      |0|
|10248	   |4/8/1994	   |WILMK	    |Wilman Kala	        |5         	|Steven	  |16/8/1994	 |72	        |Queso Mozzarella Giovanni	 |35	          |5	       |0|
|10249	   |5/8/1994	   |TOMSP	    |Toms Spezialitäten	 |6	         |Michael	 |10/8/1994	 |10249	     |Cuajada de judías	         |19	          |9	       |0|
|10249	   |5/8/1994	   |TOMSP	    |Toms Spezialitäten	 |6	         |Michael	 |10/8/1994	 |10249	     |Manzanas secas Manjimup    |42	          |40	      |0|
|10250	   |8/8/1994	   |HANAR	    |Hanari Carnes	      |4	         |Margaret	|12/8/1994	 |10250	     |Crema de almejas estilo Nueva Inglaterra	|8	|10	   |0|
|10250	   |8/8/1994	   |HANAR	    |Hanari Carnes	      |4	         |Margaret	|12/8/1994	 |10250	     |Manzanas secas Manjimup	   |42	          |35	      |0|
|10250	   |8/8/1994	   |HANAR	    |Hanari Carnes	      |4	         |Margaret	|12/8/1994	 |10250	     |Salsa de pimiento picante de Luisiana	|17|15	      |0|
|10251   	|8/8/1994	   |VICTE	    |Victuailles en stock|3	         |Janet	   |15/8/1994	 |10251	     |Pan de centeno crujiente estilo Gustaf's	|17	|6	|0|
|10251	   |8/8/1994	   |VICTE	    |Victuailles en stock|3	         |Janet   	|15/8/1994	 |10251	     |Raviolis Angelo	           |16	          |15	|0|
|10251	   |8/8/1994	   |VICTE	    |Victuailles en stock|3	         |Janet	   |15/8/1994	 |10251	     |Salsa de pimiento picante de Luisiana	|17	|20	|0|
|10252	   |9/8/1994	   |SUPRD	    |Suprêmes délices 	  |4	         |Margaret	|11/8/1994	 |10252	     |Mermelada de Sir Rodney's	 |65	          |40	|0|
|10252	   |9/8/1994	   |SUPRD	    |Suprêmes délices	   |4	         |Margaret	|11/8/1994	 |10252	    	|Queso de cabra	            |2	           |25	|0|
|10252	   |9/8/1994	   |SUPRD	    |Suprêmes délices	   |4	         |Margaret	|11/8/1994	 |10252	     |Camembert Pierrot	         |27	          |40	|0|
|10253	   |10/8/1994	  |HANAR	    |Hanari Carnes	      |3	         |Janet	   |16/8/1994	 |10253	     |Queso gorgonzola Telino	   |10	          |20	|0|

<br/>
<br/>
Esta tabla si cumple con la primera forma normal
<br/>
<br/>

|IdPedido	|FechaPedido	|IdCliente	|NombreCompañia	|IdEmpleado	|Nombre	|FechaEnvio|
|---------|------------|----------|---------------|-----------|-------|----------|
|10248	|4/8/1994	|WILMK	|Wilman Kala	|5	|Steven	|16/8/1994|
|10249	|5/8/1994	|TOMSP	|Toms Spezialitäten	|6	|Michael	|10/8/1994|
|10250	|8/8/1994	|HANAR	|Hanari Carnes	|4	|Margaret	|12/8/1994|
|10251	|8/8/1994	|VICTE	|Victuailles en stock	|3	|Janet	|15/8/1994|
|10252	|9/8/1994	|SUPRD	|Suprêmes délices	|4	|Margaret	|11/8/1994|
|10253	|10/8/1994	|HANAR	|Hanari Carnes	|3	|Janet	|16/8/1994|



Explicacion de porque viola la primera norma: Porque los clientes pueden llevar varios pedidos y no se deberia de repetir un registro por cada producto que un cliente lleve

Clave compuesta: Es cuando esta se conforma por dos atributos o mas



sp_detach_db
sp_attach_db

tipos de backups

nombre fisico de una base de datos
