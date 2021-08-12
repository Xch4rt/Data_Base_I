# Bases de Datos I

[1. Variables](#variables).
[2. Consultas](#consultas).

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
