USE [FoodDelivery]
GO
/****** Object:  StoredProcedure [dbo].[tiffinServices_ChangeOrderStatus]    Script Date: 12-04-2024 23:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[tiffinServices_ChangeOrderStatus]
@OrderDetailID INT=0, -- 0 then Add mode
@OrderStatusID INT=0
AS 
BEGIN  
	UPDATE OrderDetail SET OrderStatus=@OrderStatusID WHERE OrderDetailID=@OrderDetailID
	Select 200 as status
END





GO
