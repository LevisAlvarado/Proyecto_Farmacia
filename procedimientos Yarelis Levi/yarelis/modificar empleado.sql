
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<YARELIS LIGDENIA ESCALANTE>
-- Create date: <2023-08-16>
-- Description:	<MODIFICAR DATOS DEL EMPLEADO>
-- =============================================
CREATE PROCEDURE [dbo].[MODIF_EMPLEADO]
	@p_empleadoid int,
	@p1_usuarionuevo varchar (45),
	@p2_passwordnuevo varchar (45),
	@p3_jornadaLaboralN varchar(45),
	@p4_salarionuev int,
	@p5_fechaIngreso date,
	@p6_idPersona int
AS
BEGIN
	UPDATE [dbo].[Empleados]
		SET
			Usuario = @p1_usuarionuevo,
			Password = @p2_passwordnuevo,
			Jornada_Laboral = @p3_jornadaLaboralN,
			Salario = @p4_salarionuev,
			Fecha_Ingreso = @p5_fechaIngreso,
			ID_Persona = @p6_idPersona
		WHERE ID_Empleado = @p_empleadoid;

		SELECT @p_empleadoid AS EmpleadoID, @@ROWCOUNT AS FilasAfectadas
END
GO
