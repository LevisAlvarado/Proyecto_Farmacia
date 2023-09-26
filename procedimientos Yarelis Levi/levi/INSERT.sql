-- ================================================

select*from Medicamento
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
USE FARMACIA
GO


	-- Definición del procedimiento almacenado INSERTAR MEDICAMENTO 
CREATE PROCEDURE InsertarMedicamento 
	@ID_Medicamentos INT,
    @Nombre_Medicamento VARCHAR(150),
    @No_Lote NVARCHAR(50),
    @ID_Producto INT,
    @ID_Tipo_Medicamento INT,
    @im NVARCHAR(100)
AS
BEGIN
    INSERT INTO Medicamentos (Nombre_Medicamento, No_Lote, ID_Producto, ID_Tipo_Medicamento, img)
	VALUES (@Nombre_Medicamento, @No_Lote, @ID_Producto, @ID_Tipo_Medicamento, @img);
END;

EXEC InsertarMedicamentos
    @ID_Medicamentos = 5,
    @Nombre_Medicamento = 'ACIDO FOLICO',
    @No_Lote = 'a45',
    @ID_Producto = 5,
    @ID_Tipo_Medicamento = 5;
    @img = '';


	select*from Medicamento
	select*from Empleados

--=======INSERTAR EMPLEADO

CREATE PROCEDURE InsertarEmpleado 
    @Usuario VARCHAR(150),
    @Password VARCHAR(50),
    @Jornada_Laboral VARCHAR(50),
    @Salario INT,
    @Fecha_Ingreso DATE,
    @ID_Persona INT
AS
BEGIN
SET IDENTITY_INSERT Empleados ON;
    INSERT INTO Empleados (Usuario, Password, Jornada_Laboral, Salario, Fecha_Ingreso, ID_Persona)
    VALUES (@Usuario, @Password, @Jornada_Laboral, @Salario, @Fecha_Ingreso, @ID_Persona);
	SET IDENTITY_INSERT Empleados OFF;
END;

EXEC InsertarEmpleado '3434','43RR','MATUTINA',4555,'2010-12-04',1; 

   DROP PROCEDURE IF EXISTS InsertarEmpleado;



   ---- INSERTAR suplementos
   CREATE PROCEDURE InsertarSuplementos 
	@ID_Suplementos INT,
    @Descripcion VARCHAR(150),
    @ID_Producto INT

AS
BEGIN
    INSERT INTO Suplementos (Descripcion, ID_Producto)
VALUES (@Descripcion, @ID_Producto);


END;
EXEC InsertarSuplementos  1,'Vitamina b6',1;
SELECT*FROM Suplementos


 DROP PROCEDURE IF EXISTS InsertarEmpleados;
    

