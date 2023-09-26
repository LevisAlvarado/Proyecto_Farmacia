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



   CREATE PROCEDURE [dbo].[AgregarMedicamento]
	
	@Nombre_Medicamento VARCHAR(45),
    @No_Lote VARCHAR(45),
    @ID_Producto INT,
    @ID_Tipo_Medicamento INT
AS
BEGIN
	INSERT INTO Medicamento ( Nombre_Medicamento, No_Lote, ID_Producto, ID_Tipo_Medicamento)
		 VALUES (@Nombre_Medicamento, @No_Lote, @ID_Producto, @ID_Tipo_Medicamento);
		 SELECT @@IDENTITY AS ID_Medicamento
		  SELECT @@IDENTITY AS  ID_Producto
		   SELECT @@IDENTITY AS ID_Tipo_Medicamento
END





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



CREATE PROCEDURE [dbo].[ObtenerEmpleadosPorTipo]
    @ID_Tipo_Empleado INT
AS
BEGIN
    SELECT (P.P_Apellido+' '+P.P_Apellido) Nombre, E.Jornada_Laboral
    FROM Empleados E
	INNER JOIN Persona P ON E.ID_Persona=P.ID_Persona
	INNER JOIN Tipo_Empleado TP ON E.ID_Empleado=E.ID_Empleado
    WHERE ID_Tipo_Empleado = @ID_Tipo_Empleado;
END



CREATE PROCEDURE [dbo].[SeleccionarMedicamento]
    @NombreMedicamento VARCHAR(45)
AS
BEGIN
    SELECT *
    FROM Medicamento
    WHERE Nombre_Medicamento = @NombreMedicamento;
END;
