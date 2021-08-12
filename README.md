# GestionUser

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
