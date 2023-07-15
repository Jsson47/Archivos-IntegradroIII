create database BDSICOP3
USE BDSICOP3
--DROP DATABASE BDSICOP

--Tabla de Login--
CREATE TABLE UsuariosRoles(
IdUsuario int identity primary key,
Usuario varchar (30),
Contraseña varchar(30),
Privilegio varchar (30)
Constraint unique_Usuario unique (Usuario)
)

Insert Into UsuariosRoles values (21051161,'diego','Coordinador')
Insert Into UsuariosRoles values (22062272,'4r3rr3x','Maestrante')
Insert Into UsuariosRoles values (23051263,'Rer4334y','Maestrante')
Insert Into UsuariosRoles values (24015623,'t5c5c5','Maestrante')
Insert Into UsuariosRoles values (23056423,'66vv66','Maestrante')
Insert Into UsuariosRoles values (24156511,'5vv65h','Maestrante')
Insert Into UsuariosRoles values (27085639,'65vhvh','Maestrante')
Insert Into UsuariosRoles values (29065689,'56hfh','Maestrante')
Insert Into UsuariosRoles values (20254536,'6565ggf','Maestrante')
Insert Into UsuariosRoles values (27456389,'654gjgdfgj','Maestrante')

select * from UsuariosRoles

--Tabla de los Coordinadores--
create table Coordinador(
id int identity primary key,
NumeroCarnet int,
Nombres varchar(50),
Apellidos varchar(50),
FechaInicioCorte date,
FechaFinCorte date,
Estado varchar(10),
Constraint unique_NumCarnet unique(NumeroCarnet)
)
drop table Coordinador

Insert Into Coordinador values (23052161,'Luis','Reins','2023-05-24','2023-5-24','Activo')
Insert Into Coordinador values (23051161,'Luis','Martirez','2023-5-24','2023-5-24','Activo')
Insert Into Coordinador values (24051161,'Jose','Mendez','2023-6-24','2023-4-24','Activo')
Insert Into Coordinador values (25051161,'edward','Dias','2023-7-24','2023-3-24','Activo')
Insert Into Coordinador values (26051161,'angie','Vanegas','2023-8-24','2023-2-24','Activo')
Insert Into Coordinador values (27051161,'Josepo','Lopez','2023-9-24','2023-1-24','Activo')
Insert Into Coordinador values (28051161,'ryan','Linfr','2023-1-24','2023-2-24','Activo')
Insert Into Coordinador values (29051161,'pol','Polis','2023-2-24','2023-6-24','Activo')
Insert Into Coordinador values (22151161,'enry','Martinez','2023-3-24','2023-7-24','Activo')
Insert Into Coordinador values (23351161,'lou','Mirabda','2023-4-24','2023-8-24','Activo')

DBCC CHECKIDENT('Coordinador', RESEED, 0)
select * from Coordinador
Delete Coordinador
--drop table Coordinador

--Tabla de los Maestrantes

create table Maestrante(
id int identity primary key,
NumeroCarnet int,
Nombres varchar(50),
Apellidos varchar(50),
Ingresos$ double precision,
Estado varchar(10),
ID_Coordinador int Foreign key (ID_Coordinador) References Coordinador (id),
Constraint unique_NumeroCarnet unique (NumeroCarnet)
)

delete Maestrante

Insert Into Maestrante values (22062003,'Leon','Martinez',450,'Activo',1)
Insert Into Maestrante values (21062003,'Paul','Loud',550,'Activo',2)
Insert Into Maestrante values (23062003,'Lucas','Hernandez',650,'Activo',3)
Insert Into Maestrante values (24062003,'Juana','Valentin',600,'Activo',4)
Insert Into Maestrante values (25062003,'Juan','Rodriguez',650,'Activo',5)
Insert Into Maestrante values (26062003,'Ezequiel','Gundogan',350,'Activo',6)
Insert Into Maestrante values (27062003,'Mauricio','Mane',400,'Activo',7)
Insert Into Maestrante values (28062003,'Guligan','Brunyn',435,'Activo',8)
Insert Into Maestrante values (29062003,'Martin','Lens',560,'Activo',9)
Insert Into Maestrante values (30062003,'Jean','Obryan',560,'Activo',10)

DBCC CHECKIDENT('Maestrante', RESEED, 0)
select * from Maestrante

--delete Maestrante
--drop table Maestrante

--Tabla de Beca de los Maestrantes
create table Beca(
id int identity primary key,
codigo int,
PatrocinadorBeca varchar(300),
TotalBeca int,
ID_Maestrante int Foreign Key (ID_Maestrante) References Maestrante (id)
Constraint unique_CodigoBeca unique (codigo)
)

Insert Into Beca values (1,'Unan-Managua',50,1)
Insert Into Beca values (2,'Unan-Managua',60,2)
Insert Into Beca values (3,'Unan-Managua',55,3)
Insert Into Beca values (4,'Unan-Managua',45,4)
Insert Into Beca values (5,'Unan-Managua',20,5)
Insert Into Beca values (6,'Unan-Managua',35,6)
Insert Into Beca values (7,'Unan-Managua',15,7)
Insert Into Beca values (8,'Unan-Managua',25,8)
Insert Into Beca values (9,'Unan-Managua',90,9)
Insert Into Beca values (10,'Unan-Managua',60,10)

select * from Beca 
delete Beca
DBCC CHECKIDENT('Beca', RESEED, 0)

--Tabla de la Deuda de los Maestrantes
Create table Deuda(
id int identity primary key,
codigo int,
PlazosMeses varchar(10),
DeudaTotal double precision,
ID_Maestrante int Foreign Key (ID_Maestrante) References Maestrante (id)
Constraint unique_CodigoDeuda unique (codigo)
)

Insert Into Deuda values (1,'24 Meses',2100,1)
Insert Into Deuda values (2,'12 Meses',3100,2)
Insert Into Deuda values (3,'24 Meses',2500,3)
Insert Into Deuda values (4,'12 Meses',1500,4)
Insert Into Deuda values (5,'12 Meses',1200,5)
Insert Into Deuda values (6,'12 Meses',2200,6)
Insert Into Deuda values (7,'12 Meses',3000,7)
Insert Into Deuda values (8,'12 Meses',1500,8)
Insert Into Deuda values (9,'12 Meses',900,9)
Insert Into Deuda values (10,'12 Meses',4000,10)

DBCC CHECKIDENT('Deuda', RESEED, 0)
select * from Deuda
delete Deuda
--Tabla de los Abonos de los Maestrantes
Create table Comprobante(
id int identity primary key,
Fecha date,
Monto double precision,
NumeroComprobante int,
ID_Maestrante int Foreign Key (ID_Maestrante) References Maestrante (id)
Constraint unique_NumeroComprobante unique (NumeroComprobante)
)

Insert into Comprobante values ('2023-04-12',300,0001,1)
Insert into Comprobante values ('2023-05-21',150,0002,2)
Insert into Comprobante values ('2023-03-23',200,0003,3)
Insert into Comprobante values ('2023-06-16',400,0004,4)
Insert into Comprobante values ('2023-07-17',500,0005,5)
Insert into Comprobante values ('2023-08-18',200,0006,6)
Insert into Comprobante values ('2023-11-23',100,0007,7)
Insert into Comprobante values ('2023-12-01',250,0008,8)
Insert into Comprobante values ('2023-02-05',450,0009,9)
Insert into Comprobante values ('2023-03-08',4000,0010,10)

DBCC CHECKIDENT('Comprobante', RESEED, 0)
select * from Comprobante
delete Comprobante

--Almacenados Coordinador


	create procedure [Insertar Coordinador](
	@NumCarnet int,
	@Nombres varchar (30),
	@Apellidos varchar (30),
	@FechaInicio Date,
	@FechaFin Date,
	@Estado varchar (10)
	)
	as
	begin

			begin try 
				insert into Coordinador (NumeroCarnet,Nombres,Apellidos,FechaInicioCorte,FechaFinCorte,Estado)
				values (@NumCarnet,@Nombres,@Apellidos,@FechaInicio,@FechaFin,@Estado)

				print'Se a realizado correctamentamente el insert'

			end try
			begin catch
				select ERROR_NUMBER() [Codigo de Error],ERROR_MESSAGE() [Error],ERROR_LINE() [Linea en consulta],
				ERROR_PROCEDURE() [Procedimiento almacenado]

				print'A ocurrido un Error al ejecutar la consulta'

			end catch
	end

	exec [Insertar Coordinador]  '11145688','Angel Valentin','Jalinas Lopez','01/01/23','01/01/24','Activo'

	select * from Coordinador


create view [VistaCoordinador] 
 as
select 
*
from Coordinador where NumeroCarnet= '21051161';
select * from  [VistaCoordinador]

drop  view [VistaCoordinador]

create procedure [Actualizar Coordinador](
@Nombres varchar (30),
@Apellidos varchar (30),
@FechaInicio Date,
@FechaFin Date,
@NumCarnet varchar(8)
 )as 
 begin
	begin try
	update Coordinador
	set Nombres=@Nombres,Apellidos = @Apellidos, FechaInicioCorte = @FechaInicio, FechaFinCorte = @FechaFin
	where NumeroCarnet = @NumCarnet

	print 'Todo salio bien chele'
	end try
	begin catch
	select ERROR_NUMBER() [Codigo de Error],ERROR_MESSAGE() [Error],ERROR_LINE() [Linea en consulta],ERROR_PROCEDURE() [Procedimiento almacenado]

				print'Todo lo que podia salir mal, salio mal'
	end catch
 end

 exec [Actualizar Coordinador] 1,'12345679','Angel Valentin','Jalinas López','01/02/23','01/03/24','Activo'



 create procedure [BajaCoordinador]--Borrado logico
  (
 @Estado varchar(10),
 @Numeroarnet varchar (8)) 
 as
 begin
	begin try
		 update Coordinador
		 set Estado = @Estado
		 where NumeroCarnet= @Numeroarnet

		print 'Todo salio bien chele'
	end try
	begin catch
	select ERROR_NUMBER() [Codigo de Error],ERROR_MESSAGE() [Error],ERROR_LINE() [Linea en consulta],ERROR_PROCEDURE() [Procedimiento almacenado]

				print'Todo lo que podia salir mal, salio mal'
	end catch
end
 exec [Baja Coordinador] 'Inactivo',1




 --Almacenados Maestrantes
 select * from Maestrante

 create procedure [AgregarMaestrante](
 @Carnet varchar (8),
 @Nombres varchar(30),
 @Apellidos varchar (30),
 @Ingresos double precision,
 @Estado varchar (10),
 @IdCoordinador int
 )as
 begin
	begin try
			insert into Maestrante (NumeroCarnet, Nombres, Apellidos, Ingresos$,Estado, ID_Coordinador)
			values (@Carnet,@Nombres,@Apellidos,@Ingresos,@Estado,@IdCoordinador)
		print 'Todo salio bien chele'
	end try
	begin catch
	select ERROR_NUMBER() [Codigo de Error],ERROR_MESSAGE() [Error],ERROR_LINE() [Linea en consulta],ERROR_PROCEDURE() [Procedimiento almacenado]

				print'Todo lo que podia salir mal, salio mal'
	end catch
end

exec [Agregar Maestrante] '12345678','Jharod Israel','Martinez Suazo',2500,'Activo',1
exec [Agregar Maestrante] '22345678','Jharod ',' Suazo',3500,'Activo',1


create view [VistaMaestrante] 
 as
select 
*
from Maestrante where NumeroCarnet= '21051161';
select * from  [VistaMaestrante] 


create procedure [Actualizar Maestrante](
 @Nombres varchar(30),
 @Apellidos varchar (30),
 @Ingresos double precision,
 @IdCoordinador int,
 @Carnet varchar (8)
 )as
 begin
	begin try
		update Maestrante
		set  Nombres= @Nombres, Apellidos= @Apellidos, Ingresos$= @Ingresos,ID_Coordinador=@IdCoordinador
		where NumeroCarnet = @Carnet
		print 'Todo salio bien chele'

	end try
	begin catch
	select ERROR_NUMBER() [Codigo de Error],ERROR_MESSAGE() [Error],ERROR_LINE() [Linea en consulta],ERROR_PROCEDURE() [Procedimiento almacenado]

				print'Todo lo que podia salir mal, salio mal'
	end catch
end

exec [Actualizar Maestrante] '87654321','Jharod Israel','Martinez Martinez',2500,'Activo',1,1


create procedure [Baja Maestrante]
(@Estado varchar (10),
@NumeroCarnet varchar (8))
as
begin
	begin try
		update Maestrante
		set Estado = @Estado
		where NumeroCarnet = @NumeroCarnet
		print 'Todo salio bien chele'

	end try
	begin catch
	select ERROR_NUMBER() [Codigo de Error],ERROR_MESSAGE() [Error],ERROR_LINE() [Linea en consulta],ERROR_PROCEDURE() [Procedimiento almacenado]

				print'Todo lo que podia salir mal, salio mal'
	end catch
end
exec [Baja Maestrante] 'Inactivo',1


alter procedure [Listar](--Este no (ya lo tenes)
@Estado varchar (50)
)as
	begin
		Select *
		from Maestrante
		where Estado = @Estado
	end

	exec Listar 'Inactivo'

select * from Maestrante


create procedure [BorrarMaestrante] ---Borrardo Logico
(@Estado varchar(10),
@Carnet varchar (8)
)as
begin
	begin try
	update Maestrante
	set Estado = @Estado
	where NumeroCarnet = @Carnet

	print 'Todo ha salido bien chele'

	end try
	begin catch
	select ERROR_NUMBER() [Codigo de Error],ERROR_MESSAGE() [Error],ERROR_LINE() [Linea en consulta],ERROR_PROCEDURE() [Procedimiento almacenado]

				print'Todo lo que podia salir mal salio mal'
	end catch
end

select * from Maestrante

exec BorrarMaestrante 'Inactivo',22345678




--Almacenados Beca

Create procedure [Agregar Beca](
@Codigo int,
@Patrocinador varchar (300),
@TotalBeca int,
@IdMaestrante int
)as
begin
	BEGIN Try
		insert into Beca (codigo,PatrocinadorBeca,TotalBeca,ID_Maestrante)
		values (@Codigo,@Patrocinador,@TotalBeca,@IdMaestrante)

		print 'Todo ha salido bien chele'

	end try
	begin catch
	select ERROR_NUMBER() [Codigo de Error],ERROR_MESSAGE() [Error],ERROR_LINE() [Linea en consulta],ERROR_PROCEDURE() [Procedimiento almacenado]

				print'Todo lo que podia salir mal salio mal'
	end catch
end

exec [Agregar Beca] 1234578,'Microsoft por que soy pobre',75,1
exec [Agregar Beca] 1234579,'Microsoft por que soy pobre',75,1

create view [VistaCodigo] 
 as
select 
*
from Beca where codigo = '1';
select * from  [VistaCodigo]

create procedure [ActualizaBeca](
@Patrocinador varchar (300),
@TotalBeca int,
@IdMaestrante int,
@Codigo int
)as
begin
	begin try
		update Beca
		set PatrocinadorBeca= @Patrocinador, TotalBeca= @TotalBeca, ID_Maestrante= @IdMaestrante
		WHERE  Codigo= @Codigo
		print 'Todo ha salido bien chele'

	end try
	begin catch
	select ERROR_NUMBER() [Codigo de Error],ERROR_MESSAGE() [Error],ERROR_LINE() [Linea en consulta],ERROR_PROCEDURE() [Procedimiento almacenado]

	print'Todo lo que podia salir mal salio mal'
	end catch
end

exec [ActualizaBeca] 'uni',60,1,1
select* from Beca

alter procedure [Borrar Beca](
@Id int
)as
begin  
	begin try
		Delete Beca
		where Id = @Id
		print 'Todo ha salido bien chele'

	end try
	begin catch
	select ERROR_NUMBER() [Codigo de Error],ERROR_MESSAGE() [Error],ERROR_LINE() [Linea en consulta],ERROR_PROCEDURE() [Procedimiento almacenado]

	print'Todo lo que podia salir mal salio mal'
	end catch
end

exec [Borrar Beca] 3


select * from Beca 

--Almacenados Deuda
create procedure [Agregar_Deuda](
@Codigo int,
@Plazos int,
@Deuda double precision,
@Id_Maestrante int
)as
begin
	begin try
		insert into Deuda (codigo,PlazosMeses,DeudaTotal,ID_Maestrante)
		values (@Codigo,@Plazos,@Deuda,@Id_Maestrante)
	print 'Todo ha salido bien chele'

	end try
	begin catch
	select ERROR_NUMBER() [Codigo de Error],ERROR_MESSAGE() [Error],ERROR_LINE() [Linea en consulta],ERROR_PROCEDURE() [Procedimiento almacenado]

	print'Todo lo que podia salir mal salio mal'
	end catch
end
insert into Deuda values 
exec [Agregar Deuda] 12345678,24,2100,1
exec [Agregar Deuda] 12345679,24,2000,1

create view [VistaDeuda] 
 as
select 
*
from Deuda where codigo = '1';
select * from  [VistaDeuda]

create procedure [ActualizarDeuda](
@Plazos Varchar(8),
@Deuda double precision,
@Id_Maestrante int,
@Codigo int
)as
begin
	begin try 
		update Deuda
		set  PlazosMeses= @Plazos, DeudaTotal= @Deuda,ID_Maestrante = @Id_Maestrante
		where codigo = @Codigo
		print 'Todo ha salido bien chele'

	end try
	begin catch
	select ERROR_NUMBER() [Codigo de Error],ERROR_MESSAGE() [Error],ERROR_LINE() [Linea en consulta],ERROR_PROCEDURE() [Procedimiento almacenado]

	print'Todo lo que podia salir mal salio mal'
	end catch
end

exec [Actualizar Deuda] '24-Meses',2000,1,1

alter procedure [Borrar Deuda](
@Id int
)as
begin
	begin try
		delete Deuda where Id = @Id
		print 'Todo ha salido bien chele'

	end try
	begin catch
	select ERROR_NUMBER() [Codigo de Error],ERROR_MESSAGE() [Error],ERROR_LINE() [Linea en consulta],ERROR_PROCEDURE() [Procedimiento almacenado]

	print'Todo lo que podia salir mal salio mal'
	end catch
end

exec [Borrar Deuda] 1

select * from Deuda


--Almacenado Comprobante
create procedure [Agregar Comprobante](		--Solo a este le puse try catch por lo que solo se guarda los otros no los implementes
@Fecha date,
@Monto double precision,
@NumComprobante int,
@IdMaestrante int
)as
begin
	begin try
		insert into Comprobante (Fecha,Monto,NumeroComprobante,ID_Maestrante)
		values (@Fecha,@Monto,@NumComprobante,@IdMaestrante)
	print 'Todo ha salido bien chele'

	end try
	begin catch
	select ERROR_NUMBER() [Codigo de Error],ERROR_MESSAGE() [Error],ERROR_LINE() [Linea en consulta],ERROR_PROCEDURE() [Procedimiento almacenado]

	print'Todo lo que podia salir mal salio mal'
	end catch
end

exec [Agregar Comprobante] '01/01/23',250,159753,1
exec [Agregar Comprobante] '01/05/23',450,259753,1


alter procedure [Actualizar Comprobante](
@Fecha date,
@Monto double precision,
@NumComprobante int,
@IdMaestrante int,
@Id int
)as
begin
	begin try 
		update Comprobante
		set Fecha = @Fecha, Monto = @Monto, NumeroComprobante =@NumComprobante, ID_Maestrante = @IdMaestrante
		where Id = @Id
		print 'Todo ha salido bien chele'

	end try
	begin catch
	select ERROR_NUMBER() [Codigo de Error],ERROR_MESSAGE() [Error],ERROR_LINE() [Linea en consulta],ERROR_PROCEDURE() [Procedimiento almacenado]

	print'Todo lo que podia salir mal salio mal'
	end catch
end

exec [Actualizar Comprobante] '02/03/23',350,159753,1,1

create procedure [Borrar Comprobante](
@Id int
)as
begin
	delete Comprobante where Id = @Id
end


exec [Borrar Comprobante] 2
select * from Comprobante



---Vistas 


--Muestra el consolidado de pago

CREATE view [Consolidado]
as
select m.Nombres[Nombres],m.Apellidos[Apellidos],b.TotalBeca[Beca otorgada], d.DeudaTotal[Monto a pagar], d.PlazosMeses[Plazos en meses], m.Ingresos$[Ingresos por maestrantes], 
		c.Monto[Total de abono],(d.DeudaTotal-c.Monto)[Pago Pendiente]
		
from Maestrante as m
		inner join Deuda as d on m.id = d.ID_Maestrante
		inner join Beca as b  on b.ID_Maestrante = m.id
		inner join Comprobante AS c on c.ID_Maestrante = m.id

select * from [Consolidado]

-- Aqui podes poner las vistas que hicistes

--BUSCADOR

	create procedure [Buscar]
	@parametro varchar (50)
	as
	begin
		select m.Nombres[Nombres],m.Apellidos[Apellidos],b.TotalBeca[Beca otorgada], d.DeudaTotal[Monto a pagar], 
		d.PlazosMeses[Plazos en meses], m.Ingresos$[Ingresos por maestrantes], 
		c.Monto[Total de abono],(d.DeudaTotal-c.Monto)[Pago Pendiente]
		from Maestrante as m
						inner join Deuda as d on m.id = d.ID_Maestrante
						inner join Beca as b  on b.ID_Maestrante = m.id
						inner join Comprobante AS c on c.ID_Maestrante = m.id
		where m.Nombres like '%'+ @parametro +'%'
		end

		exec Buscar 'rod'


--Funciones 
-- Supongamos que deseas obtener los comprobantes de un maestrante con carnet = ?

create FUNCTION [TotalPagadoMaestrante](@Carnet int)
RETURNS DECIMAL(10,2)
AS
begin

   DECLARE @TotalPagado DECIMAL(10,2);

    SELECT @TotalPagado = sum(c.Monto) 
    FROM Maestrante AS m
    INNER JOIN Comprobante AS c ON c.ID_Maestrante = m.id
    WHERE m.NumeroCarnet = @Carnet

    RETURN ISNULL(@TotalPagado, 0);
END;

SELECT dbo.TotalPagadoMaestrante(21051161) AS [total pagado];



--Es la misma pero Retorna una tabla
alter FUNCTION [TotalPagado Maestrante](@Carnet int)

returns table
AS
return(

	select m.NumeroCarnet [Numero de Carnet], m.Nombres [Nombres], m.Apellidos [Apellidos],  SUM(c.Monto)  [Total Pagado]
    FROM Maestrante AS m
    INNER JOIN Comprobante AS c ON c.ID_Maestrante = m.id
    WHERE m.NumeroCarnet = @Carnet
	group by m.NumeroCarnet, m.Nombres, m.Apellidos

	);

	SELECT [Numero de Carnet], [Nombres],[Apellidos],[Total Pagado]
FROM [TotalPagado Maestrante](22345678);
 





--Calcula la suma de todos los pagos realizados en un rango de tiempo


alter function [Suma de Pagos](@fechainicio date, @fechaFin date ) 
returns int 
as
begin
 declare @resp int ;
 set @resp =(select sum(c.Monto) AS suma
				from Comprobante as c
				where c.Fecha  between @fechainicio and @fechaFin)
		return @resp;
end

select   dbo.[Suma de Pagos] ('01/01/23','05/10/23') [Pagos totales]
select *
from Comprobante as c

SELECT M.Ingresos$, M.Nombres, M.Apellidos, D.DeudaTotal, D.PlazosMeses, B.PatrocinadorBeca
FROM Maestrante M
JOIN Beca B ON B.ID_Maestrante = M.id
JOIN Deuda D ON D.ID_Maestrante = M.id
WHERE M.NumeroCarnet = 21051161;

select TotalBeca,PatrocinadorBeca from Beca B 
JOIN Maestrante M ON B.ID_Maestrante = M.id where NumeroCarnet = 21072003

select DeudaTotal,PlazosMeses from Deuda D 
inner JOIN Maestrante M ON D.ID_Maestrante = M.id where NumeroCarnet = 21072003

create view [Estado_DeCuenta] as
SELECT M.Nombres, M.Apellidos, M.Ingresos$, B.TotalBeca,B.PatrocinadorBeca, D.DeudaTotal, D.PlazosMeses, (D.DeudaTotal - C.Monto) AS DeudaRestante
FROM Maestrante M
INNER JOIN Beca B ON M.id = B.ID_Maestrante
INNER JOIN Deuda D ON M.id = D.ID_Maestrante
INNER JOIN Comprobante C ON M.id = C.ID_Maestrante where NumeroCarnet = 21072003;

select * from [Estado_DeCuenta] where NumeroCarnet = '21072003'

-- Crear la vista

CREATE VIEW VistaEstado AS
SELECT NumeroCarnet, SUM(c.Monto) - d.DeudaTotal AS Saldo
FROM Maestrante m
JOIN Deuda d ON m.id = d.ID_Maestrante
JOIN Comprobante c ON m.id = c.ID_Maestrante
WHERE m.NumeroCarnet = 21051161
GROUP BY m.NumeroCarnet, d.DeudaTotal;

SELECT * FROM VistaEstado WHERE NumeroCarnet = 21051161;

-- Ejemplo de uso de la vista
SELECT * FROM VistaDeuda;

select * fROM Maestrante
SELECT * FROM Deuda
sELECT * FROM Comprobante

dELETE Comprobante


