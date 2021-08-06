-- Creando DB
create database Sistemas

--Abriendo BD
use Sistemas

-- Crear tabña
create table Clientes(
Id_Cliente char(4) primary key not null,
PNombreC nvarchar(15) not null,
SNombreC nvarchar(15),
PApellC nvarchar(15) not null,
SApellC nvarchar(15),
DirC nvarchar(70) not null,
TelC char(8) check(TelC like '[2|5|7|8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)

-- INSERTAR REGISTRO
insert into Clientes values ('0001', 'Pablo','Andres', 'Gutierrez', 'Almendarez', 'Managua', '85086456')

--Visualizar registros
select * from Clientes

-- CRAR CUENTA ADMINS

sp_addlogin 'Administrador', 'Administrador2021', 'Sistemas'

--Asociar rol

sp_addsrvrolemember 'Administrador', 'sysadmin'

-- Crear usuario
sp_adduser 'Administrador', 'Pepito'

-- asociar privilegios 
sp_addrolemember 'db_ddladmin', 'Pepito'