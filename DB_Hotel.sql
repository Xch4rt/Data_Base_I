-- Creando bases de datos
create database Hotel

use Hotel

-- creando tabla Habitacion
create table Habitacion(
	NoHabitacion int primary key identity (1,1),
	Descripcion varchar (50),
	Capacidad int,
	CodigoTipoHab int foreign key references TipoHabitacion(CodigoTipoHab),
	Estado varchar(50)
)

-- creando tabla Tipo Habitacion
create table TipoHabitacion(
	CodigoTipoHab int primary key identity (1,1),
	Tipo varchar (50),
	Precio money
)

-- creando tabla Cliente
create table Cliente(
	NoCliente int primary key identity (1,1),
	Nombres varchar(50),
	Apellidos varchar (50),
	Direccion varchar (50),
	Telefono varchar (50),
	Correo varchar (50)
)
-- creando tabla Empleado
create table Empleado(
	NoEmpleado int primary key identity (1,1),
	Nombres varchar (50),
	Apellidos varchar (50),
	Direccion varchar (50),
	Salario money
)
-- creando tabla Huesped
create table Huespued(
	IDHuesped int primary key identity (1,1),
	Nombre varchar (50),
	Apellido varchar (50),
	Direccion varchar (50),
	Telefono varchar (50),
	Correo varchar (50)
)
-- creando tabla Servicio
create table Servicio(
	NoServicio int primary key identity (1,1),
	Descripcion varchar (50),
	Precio money
)

-- SERVICIOS Y DETALLES
-- creando tabla reserva habitacion
create table Reserva_Habitacion(
	IDReservaHab int primary key identity (1,1),
	FechaEntrada datetime,
	FechaSalida datetime,
	NoHabitacion int foreign key references Habitacion(NoHabitacion),
	IdReserva int foreign key references Reserva(IdReserva),
	Precio money
)
-- creando tabla reserva
create table Reserva(
	IdReserva int primary key identity (1,1),
	Fecha datetime,
	NoEmpleado int foreign key references Empleado(NoEmpleado),
	NoCliente int foreign key references Cliente(NoCliente),
	Estado varchar (50),
	FormaPago varchar(50),
	Pais varchar (50),
	Moneda varchar (50)
)
-- creando tabla reserva habitacion servicio
create table ReservaHab_Servicio(
	Cantidad int,
	Precio money,
	NoServicio int foreign key references Servicio(NoServicio),
	IdReservaHab int foreign key references Reserva_Habitacion(IdReservaHab)
)