
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<YARELIS LIGDENIA ESCALANTE>
-- Create date: <2023-08-16>
-- Description:	<MODIFICAR DATOS DEL EMPLEADO>
-- =============================================
CREATE PROCEDURE [dbo].[MODIF_PERSONAS]
	@p6_idPersona int,
	@p7_primNom varchar (45),
	@p_segNom varchar (45),
	@p_primApe varchar (45),
	@p_segApe varchar (45),
	@p_Genero varchar (1),
	@p_Fecha_Nacimi date,
	@p_correo varchar (45),
	@p_celular int
AS
BEGIN
	UPDATE [dbo].[Personas]
			SET
				P_Nombre = @p7_primNom,
				S_Nombre = @p_segNom,
				P_Apellido = @p_primApe,
				S_Apellido = @p_segApe,
				Genero = @p_Genero,
				Fecha_Nacimiento = @p_Fecha_Nacimi,
				Correo = @p_correo,
				Celular = @p_celular
			WHERE ID_Persona = @p6_idPersona;


		SELECT @p6_idPersona AS PersonaID ,@@ROWCOUNT AS FilasAfectadas
END
GO
