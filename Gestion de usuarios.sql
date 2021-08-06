-- Creando BD
create database Sistemas

-- Abriendo BD
use Sistemas

-- Crear tabla
create table Clientes(
Id_Cliente char(4) primary key not null,
PNombreC nvarchar(15) not null,
SNombreC nvarchar(15),
PApellC nvarchar(15) not null,
SApellC nvarchar(15),
DirC nvarchar(70) not null,
TelC char(8) check(TelC like '[2|5|7|8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)

-- Insertar Registro
insert into Clientes values('0001','Evelyn','del carmen','Espinoza',
'Aragon','Managua','87451254')

-- Visualizar registros
select * from Clientes

-- Crear Cuenta Administrador
sp_addlogin 'Administrador','Administrador2021','Sistemas'

-- Asociar role
sp_addsrvrolemember 'Administrador','sysadmin'

-- Crear usuario
sp_adduser 'Administrador','Pepito'

-- asociar privilegios
sp_addrolemember 'db_ddladmin','Pepito'

insert into Clientes values('0002','Yaoska','','Zuniga',
'Espinoza','Managua','86525414')

select * from Clientes

-- Crear usuario de solo lectura
sp_addlogin 'Alumno','Alumno2021','Sistemas'
sp_addsrvrolemember 'Alumno','dbcreator'
sp_adduser 'Alumno','Alumno'
sp_addrolemember 'db_datareader','Alumno'
sp_addrolemember 'db_denydatawriter','Alumno'

deny create table, create view, create procedure
to Alumno

revoke insert, delete, update on Clientes to Alumno

-- Probando usuario de solo lectura
create table Proveedor(
Id_Prov int identity(1,1) primary key not null,
NombreProv nvarchar(35) not null
)

insert into clientes values('0003','Angel','Eduardo',
'Zuniga','Espinoza','Managua','85742154')

select * from Clientes

-- Crear usuario de solo escritura
sp_addlogin 'Profesor','Profesor2021','Sistemas'
sp_addsrvrolemember 'Profesor','dbcreator'
use Sistemas
sp_adduser 'Profesor','Docente'
sp_addrolemember 'db_datawriter','Docente'
sp_addrolemember 'db_denydatareader','Docente'

deny create table, create view, create procedure
to Docente

revoke select on Clientes to Docente

-- Crear usuario de lectura/escritura
sp_addlogin 'Secretaria','Sec2021','Sistemas'
sp_addsrvrolemember 'Secretaria','dbcreator'
use Sistemas
sp_adduser 'Secretaria','Secretaria'
sp_addrolemember 'db_datawriter','Secretaria'
sp_addrolemember 'db_datareader','Secretaria'

deny create table, create view, create procedure
to Secretaria


