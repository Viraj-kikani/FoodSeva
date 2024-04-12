USE [FoodDelivery]
GO
/****** Object:  StoredProcedure [dbo].[admin_ChangeRestaurantStatus]    Script Date: 12-04-2024 23:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[admin_ChangeRestaurantStatus]
@RestaurantID INT=0, -- 0 then Add mode
@RestaurantStatus bit=0
AS 
BEGIN  
	UPDATE Restaurant SET RestaurantStatus=@RestaurantStatus WHERE RestaurantID=@RestaurantID
	Select 200 as status
END





GO
