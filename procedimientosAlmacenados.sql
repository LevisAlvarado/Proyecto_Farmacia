USE [FARMACIA]
GO
/****** Object:  StoredProcedure [dbo].[LISTAR_USUARIOS]    Script Date: 20/8/2023 05:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<LIGDENIA ESCALANTE >
-- Create date: <2023-08-19>
-- Description:	<LISTAR USUARIOS>
-- =============================================
ALTER PROCEDURE [dbo].[LISTAR_USUARIOS]

AS
BEGIN
	SELECT name
    FROM sys.database_principals
    WHERE type_desc = 'SQL_USER';
END


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<LIGDENIA ESCALANTE >
-- Create date: <2023-08-19>
-- Description:	<CREAR USUARIOS DE PERMISO PUBLICO>
-- =============================================
ALTER PROCEDURE [dbo].[Crear_Usuario_Con_PermisoPublico]
	    @p_NombreUsuario NVARCHAR(50),
		@p_Contraseña NVARCHAR(50)
AS
BEGIN

    /*BEGIN
		 DECLARE @v_LoginSQL NVARCHAR(MAX)
        SET @v_LoginSQL = 'CREATE LOGIN ' + QUOTENAME(@p_NombreUsuario) + ' WITH PASSWORD = ' + QUOTENAME('"' + @p_Contraseña + '"')
        EXEC sp_executesql @v_LoginSQL

        -- Crear usuario en la base de datos
        DECLARE @UserSQL NVARCHAR(MAX)
        SET @UserSQL = 'CREATE USER ' + QUOTENAME(@p_NombreUsuario) + ' FOR LOGIN ' + QUOTENAME(@p_NombreUsuario)
        EXEC sp_executesql @UserSQL

        -- Asignar permisos de solo lectura
        DECLARE @GrantSQL NVARCHAR(MAX)
        SET @GrantSQL = 'GRANT SELECT TO ' + QUOTENAME(@p_NombreUsuario)
        EXEC sp_executesql @GrantSQL
    END*/
	  BEGIN
		 DECLARE @v_LoginSQL NVARCHAR(MAX)
        SET @v_LoginSQL = 'CREATE LOGIN ' + QUOTENAME(@p_NombreUsuario) + ' WITH PASSWORD = ' + '''' + @p_Contraseña + ''''
        EXEC sp_executesql @v_LoginSQL

        -- Crear usuario en la base de datos
        DECLARE @UserSQL NVARCHAR(MAX)
        SET @UserSQL = 'CREATE USER ' + QUOTENAME(@p_NombreUsuario) + ' FOR LOGIN ' + QUOTENAME(@p_NombreUsuario)
        EXEC sp_executesql @UserSQL

        -- Asignar permisos de solo lectura
        DECLARE @GrantSQL NVARCHAR(MAX)
        SET @GrantSQL = 'GRANT SELECT TO ' + QUOTENAME(@p_NombreUsuario)
        EXEC sp_executesql @GrantSQL
    END

END






USE [FARMACIA]
GO
/****** Object:  StoredProcedure [dbo].[LISTAR_USUARIOS]    Script Date: 20/8/2023 05:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<LIGDENIA ESCALANTE >
-- Create date: <2023-08-19>
-- Description:	<LISTAR USUARIOS>
-- =============================================
ALTER PROCEDURE [dbo].[LISTAR_USUARIOS]

AS
BEGIN
	SELECT name
    FROM sys.database_principals
    WHERE type_desc = 'SQL_USER';
END

use FARMACIA


CREATE PROCEDURE [dbo].[ActualizarCliente]
    @ID_Cliente INT,
    @ID_Persona INT,
    @ID_Tipo_Cliente INT,
    @Fecha_Ingreso DATE
AS
BEGIN
    UPDATE Clientes
    SET ID_Persona = @ID_Persona,
        ID_Tipo_Cliente = @ID_Tipo_Cliente,
        Fecha_Ingreso = @Fecha_Ingreso
    WHERE ID_Cliente = @ID_Cliente;
END


-- Llamada al procedimiento pasando los parámetros necesarios
EXEC [dbo].[ActualizarCliente]
    @ID_Cliente = 123,               -- Reemplaza con el valor adecuado
    @ID_Persona = 456,               -- Reemplaza con el valor adecuado
    @ID_Tipo_Cliente = 789,          -- Reemplaza con el valor adecuado
    @Fecha_Ingreso = '2023-08-20';   -- Reemplaza con la fecha adecuada

	select*from Clientes




	CREATE PROCEDURE [dbo].[CrearCliente]
    @ID_Persona INT,
    @ID_Tipo_Cliente INT,
    @Fecha_Ingreso DATE
AS
BEGIN
    INSERT INTO Clientes (ID_Persona, ID_Tipo_Cliente, Fecha_Ingreso)
    VALUES (@ID_Persona, @ID_Tipo_Cliente, @Fecha_Ingreso);

    SELECT SCOPE_IDENTITY() AS ID_Cliente; -- Devuelve el ID del nuevo cliente
END

EXEC [dbo].[CrearCliente]
   @ID_Persona = 1,
   @ID_Tipo_Cliente = 2,
   @Fecha_Ingreso = '2023-04-19';

   SELECT*FROM Clientes


   CREATE PROCEDURE [dbo].[ObtenerEmpleadosPorTipo]
    @ID_Tipo_Empleado INT
AS
BEGIN
    SELECT (P.P_Nombre + ' ' + P.P_Apellido) AS Nombre, E.Jornada_Laboral
FROM Empleados E
INNER JOIN Personas P ON E.ID_Persona = P.ID_Persona
INNER JOIN Tipo_Empleados TP ON E.ID_Empleado = TP.ID_Tipo_Empleado
WHERE TP.ID_Tipo_Empleado = @ID_Tipo_Empleado;

END;
-- Llamada al procedimiento pasando el parámetro necesario
EXEC [dbo].[ObtenerEmpleadosPorTipo]
    @ID_Tipo_Empleado = 123;  -- Reemplaza con el valor adecuado





