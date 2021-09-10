create database Consultorio

use Consultorio

create table Paciente
(noPaciente int primary key identity(1,1),
PrimerNombr varchar(50),
SegundoNombre varchar(50),
Primerapellido varchar(50),
SegundoApellido varchar(50),
FechaNacimiento date,
Cedula varchar(15) check (Cedula like '[0-9][0-9][0-9]-[0-3][0-9][0-1][0-9][0-2][0-9]-[0-9][0-9][0-9][0-9][A-Z]')
)

create table Medico
(noMedico int primary key identity(1,1),
PrimerNombr varchar(50),
SegundoNombre varchar(50),
Primerapellido varchar(50),
SegundoApellido varchar(50),
FechaNacimiento date,
Cedula varchar(15)  check (Cedula like '[0-9][0-9][0-9]-[0-3][0-9][0-1][0-9][0-2][0-9]-[0-9][0-9][0-9][0-9][A-Z]')	
)

create table Consulta
(NoConsulta int primary key identity(1,1),
NoMedico int, 
NoPaciente int,
FechaConsulta date
)

Alter table Consulta
add foreign key (NoMedico) references Medico(NoMedico)
alter table Consulta
add foreign key (NoPaciente) references Paciente(NoPaciente)

create table Medicamento
(NoMedicamento int primary key identity(1,1),
Nombre varchar(50),
Componentes varchar(50))

create table [Detalle Consulta]
(NoConsulta int,
NoMedicamento int,
Cantidad int,
Dosis int,
Descripcion varchar(100)
)

Alter table [Detalle Consulta]
add foreign key (NoConsulta) references Consulta(NoConsulta)

alter table [Detalle Consulta]
add foreign key (NoMedicamento) references Medicamento(NoMedicamento)





alter table [Detalle Consulta]
alter column NoConsulta int not null
alter table [Detalle Consulta]
Alter column NoMedicamento int not null

