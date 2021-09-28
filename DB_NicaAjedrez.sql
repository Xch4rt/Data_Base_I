-- Creando Base de datos NicaAjedrez
create database NicaAjedrez

use NicaAjedrez
-- Creando tabla jugador
create table Jugador(
	IDJugador int primary key identity(1,1),
	PrimerNombre varchar(50),
	SegundoNombre varchar(50),
	PrimerApellido varchar(50),
	SegundoApellido varchar(50),
	-- ID PAIS
	IdPais int foreign key references Pais(IdPais),
	FechaNacimiento date,
	CantidadTorneos int,
	NivelJuevo int
)
-- creando tabla pais
create table Pais(
	IDPais int primary key identity(1,1),
	NombrePais varchar(50),
	CantidadClub int
)
-- creando tabla arbitro
create table Arbitro(
	IDArbitro int primary key identity (1,1),
	PrimerNombre varchar(50),
	SegundoNombre varchar(50),
	PrimerApellido varchar(50),
	SegundoApellido varchar(50),
	IdPais int foreign key references Pais(IdPais),
	Antiguedad int,
	CantidadPartidos int,
	Rango varchar (25)
)
-- creando tabla hotel
create table Hotel(
	IDHotel int primary key identity (1,1),
	Nombre varchar(50),
	Direccion varchar(70),
	Telefono varchar(12)
)
-- creando tabla Hotel - Jugador
create table Hotel_Jugador(
	IDHotelJugador int primary key identity (1,1),
	IdHotel int foreign key references Hotel(IdHotel),
	IdJugador int foreign key references Jugador(IdJugador),
	FechaEntrada date,
	FechaSalida date
)
-- creando tabla jornada
create table Jornada(
	IDJornada int primary key identity (1,1),
	IdHotel int foreign key references Hotel(IdHotel),
	Fecha date,
	Estado char(1), -- Jugando(J) or Esperando(E)
	HoraInicio time,
	HoraCierre time,
	Modalidad varchar(20)
)
-- Creando tabla Salon
create table Salon(
	IDSalon int primary key identity (1,1),
	IdHotel int foreign key references Hotel(IdHotel),
	Nombre varchar(50),
	Capacidad int
)
-- Creando tabla Partidos
create Table Partidos(
	IDPartido int primary key identity (1,1),
	IdJornada int foreign key references Jornada(IdJornada),
	IdSalon int foreign key references Salon(IdSalon),
	IdArbitro int foreign key references Arbitro(IdArbitro),
	HoraInicio time,
	HoraFinal time,
	Duracion time
)
-- creando table ventaBoletos
create table Venta_Boletos(
	IDVentaBoletos int primary key identity (1,1),
	IdJornada int foreign key references Jornada(IdJornada),
	Precio money,
	Cantidad int
)
-- creando tabla detalle jugador 
create table Detalle_Jugador(
	IdJugador int foreign key references Jugador(IdJugador),
	IdPartido int foreign key references Partidos(IdPartido),
	Color char(1), -- B or N || W or B
	Resultado char(1) -- G or P || W or L
)