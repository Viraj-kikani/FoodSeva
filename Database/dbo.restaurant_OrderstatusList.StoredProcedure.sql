USE [FoodDelivery]
GO
/****** Object:  StoredProcedure [dbo].[restaurant_OrderstatusList]    Script Date: 12-04-2024 23:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--Exec restaurant_OrderstatusList
CREATE PROCEDURE [dbo].[restaurant_OrderstatusList]
AS 
BEGIN  
	 SELECT
		o.OrderStatusID,
		o.OrderStatusName
    FROM [OrderStatus] o
END





GO
