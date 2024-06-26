USE [FoodDelivery]
GO
/****** Object:  StoredProcedure [dbo].[admin_GetRestaurantDetailByRestaurantId]    Script Date: 12-04-2024 23:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




--Exec admin_GetRestaurantDetailByRestaurantId  2
CREATE PROCEDURE [dbo].[admin_GetRestaurantDetailByRestaurantId]
@RestaurantID INT=0
AS 
BEGIN  
	 SELECT
        RestaurantID,
		OwnerName,
		RestaurantName,
		MobileNo,
		Email,
		ShopPlotNumber,
		Floor,
		BuildingName,
		ZipCode,
		RestaurantStatus,
		ImageName as RestaurantImageName
    FROM [Restaurant] r
	Where r.RestaurantID=@RestaurantID
END






GO
