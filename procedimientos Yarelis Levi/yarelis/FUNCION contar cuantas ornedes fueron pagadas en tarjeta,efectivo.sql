-- ================================================
-- Template generated from Template Explorer using:
-- Create Multi-Statement Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<YARELIS LIGDENIA ESCALANTE>
-- Create date: <2023-08-17>
-- Description:	<contar cuantas ornedes fueron pagadas en tarjeta o efectivo>
-- =============================================
CREATE FUNCTION [dbo].[Forma_Pago_ToE]
(
	@p_formaPago VARCHAR(20)
)
RETURNS @Result TABLE 
(
	Descripcion VARCHAR(20),
	TotalOrders INT, 
	Totalmonto MONEY 
)
AS
BEGIN
		INSERT INTO @Result (Descripcion,TotalOrders, Totalmonto)
		SELECT FP.Descripcion,
				COUNT(OP.ID_Orden_Pedidos) AS TotalOrders,
				SUM(F.Total) AS Totalmonto
			FROM [dbo].[Orden_Pedidos] OP
			INNER JOIN Facturas F ON OP.ID_Factura = F.ID_Factura
			INNER JOIN (Formas_Pagos FP JOIN Factura_FormaPagos FFP ON FP.ID_Formas_Pago = FFP.ID_Formas_Pago) ON F.ID_Factura = FFP.ID_Factura
			WHERE FP.ID_Formas_Pago = @p_formaPago 
			AND FP.Descripcion IN ('Efectivo','Tarjeta de Debito','Tarjeta de Credito')
			GROUP BY FP.Descripcion
	
	RETURN ;
END	
GO