-- Creando base de datos Taller
create database Taller

use Taller

-- Crando tabla Cliente con atributos basicos
create table Cliente(
	NoCliente int primary key identity (1,1),
	PrimerNombre varchar(50) not null,
	SegundoNombre varchar(50) not null,
	PrimerApellido varchar(50) not null,
	SegundoApellido varchar(50) not null
)
-- Creando tabla mantenimiento, estado es char porque se puede representar con un caracter
create table Mantenimiento(
	NoMantenimiento int primary key identity(1,1),
	Novehiculo int foreign key references Vehiculo(NoVehiculo),
	FechaIngreso date,
	FechaSalida date,
	Estado char(1)
)
-- Creando Tabla vehiculo
create table Vehiculo(
	NoVehiculo int primary key identity(1,1),
	NoCliente int foreign key references Cliente(NoCliente),
	Marca varchar(50),
	Modelo varchar(50),
	year_ date
)
-- Creando tabla Servicio
create table Servicio(
	NoServicio int primary key identity(1,1),
	Descripcion varchar(70),
	Precio money,
	TipoMantenimiento varchar(30)
)
-- Creando tabla Repuesto
create table Repuesto(
	NoRepuesto int primary key identity(1,1),
	Marcha varchar(50),
	Modelo varchar(50),
	Cantidad int,
)
-- Creando Tabla mecanico
create table Mecanico(
	NoMecanico int primary key identity(1,1),
	PrimerNombre varchar(50) not null,
	SegundoNombre varchar(50) not null,
)

-- DETALLES
create table DetalleMantenimiento(
	NoDetalleMantenimiento int primary key identity(1,1),
	NoMantenimiento int foreign key references Mantenimiento(NoMantenimiento),
	NoMecanico int foreign key references Mecanico(NoMecanico),
	NoServicio int foreign key references Servicio(NoServicio),
	Precio money
)


create table DetalleRepuesto(
	NoDetalleMantenimiento int foreign key references DetalleMantenimiento(NoDetalleMantenimiento),
	NoRepuesto int foreign key references Repuesto(NoRepuesto),
	Precio money,
	Cantidad int
)

