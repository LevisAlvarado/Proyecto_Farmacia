-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[MODIF_SUPLEMENTOS]
		@p_Suplementoid INT,
		@p_Descripcion VARCHAR (45),
		@p_Productoid INT
AS
BEGIN
	----Empleados Modificar
	UPDATE [dbo].[Suplementos]
		SET
			Descripcion= @p_Descripcion ,
			ID_Producto = @p_Productoid
		WHERE ID_Suplemento = @p_Suplementoid;

		SELECT @p_Suplementoid AS SuplementoID,@@ROWCOUNT AS FilasAfectadas

END
GO
