create database SFCI
use SFCI

create table Dptos(
Id_Dpto int identity (1,1) primary key not null,
NombreDepto nvarchar (40) not null,
)

create table Municipios(
IdM int identity(1,1) primary key not null,
NombreMun nvarchar (40) not null,
Id_Dpto int foreign key references Dptos(Id_Dpto)not null,
)

create table Clientes(
Id_Cliente char(4) primary key not null,
DirC nvarchar (70) not null,
TelC char(8) check (TelC like '[2|8|7|8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
Email nvarchar(50),
IdM int foreign key references Municipios(IdM)not null,
)

create table CJur(
NRuc char(12) primary key not null,
NombreCJ nvarchar(50)not null,
TipoCJ nvarchar(25) not null,
RLegal nvarchar(45) not null,
Id_Cliente char(4) foreign key references Clientes(Id_Cliente)not null,

)

create table CNat(
NCedula char(16) check (NCedula like '[0-9][0-9][0-9]-[0-3][0-9][0-1][0-9][0-2][0-9]-[0-9][0-9][0-9][0-9][A-Z]')primary key not null,
PNCN nvarchar(15) not null,
SNCN NVARCHAR(15),
PACN nvarchar(15) not null,
SACN NVARCHAR(15),
Id_Cliente char(4) foreign key references Clientes(Id_Cliente)not null,
)

create table Empleados(
NEmp char(4) primary key not null,
PNE nvarchar(15) not null,
SNE nvarchar (15),
PAE nvarchar(15) not null,
SAE nvarchar (15),
DirE nvarchar (70)not null,
TelE char(8) check (TelE like '[2|8|7|8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
CorreoE nvarchar(50),
Cargo nvarchar(45) not null,
IdM int foreign key references Municipios(IdM) not null,
)

create table Proveedores(
Id_Prov char(5) primary key not null,
NombreProv nvarchar(45) not null,
DirProv nvarchar(70)not null,
TelProv char(8) check (TelProv like '[2|8|7|8][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
URLProv nvarchar(50)
)

create table Productos(
IdProd char(5) primary key not null,
NProd nvarchar(50) not null,
DescProd nvarchar (70)not null,
precioP float not null,
existP int not null,
tipoP char(2) check(tipoP like 'G|NG'),
Id_Prov char (5) foreign key references Proveedores(Id_Prov)not null,
)
create table Ventas(
NVenta int identity(1,1) primary key not null,
FechaVenta datetime default getDate(),
TotalV float,
Id_Cliente char(4) foreign key references Clientes(Id_Cliente) not null
)

create rule EntP
as
@V>0

sp_bindrule 'EntP','Productos.precioP'
sp_bindrule 'EntP','Productos.existP'

create rule NN
as
@X>=0

sp_bindrule 'NN','Ventas.TotalV'

create table DatalleV(
NVenta int foreign key references Ventas(NVenta) not null,
IdProd char(5) foreign key references Productos(IdProd) not null,
cantV int not null,
subtp float,
primary key (NVenta,IdProd)
)

--Nota: agregar tabla de Compras y devolucion Puede ser -> Farm ->Proveedor y Cliente -> Farm

create table Compras(
NCompra int identity(1,1) primary key not null,
FechaCompra datetime default getDate(),
TotalC float,
Id_Prov char(5) foreign key references Proveedores(Id_Prov) not null
)

create table DatalleC(
NCompra int foreign key references Compras (NCompra) not null,
IdProd char(5) foreign key references Productos(IdProd) not null,
cantC int not null,
subtp float,
primary key (NCompra,IdProd)
)

--Devoluciones

create table DevolucionesCF(
NVenta int foreign key references Ventas(NVenta) not null,
IdProd char(5) foreign key references Productos(IdProd) not null,
primary key (NVenta,IdProd)
)

create table DevolucionesFP(
NCompra int foreign key references Compras (NCompra) not null,
IdProd char(5) foreign key references Productos(IdProd) not null,
primary key (NCompra,IdProd)
)


 --Para crear una copia de seguridad
backup database SFCI to disk ='E: \SFCI.bak'

 --Para restaurar la copia de seguridad
restore database SFCI from disc = 'E: \SFCI.bak' with replace

--Obtener hora actual al instante
select GETDATE()