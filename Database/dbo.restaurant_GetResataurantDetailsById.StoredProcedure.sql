USE [FoodDelivery]
GO
/****** Object:  StoredProcedure [dbo].[restaurant_GetResataurantDetailsById]    Script Date: 12-04-2024 23:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- Exec restaurant_GetFoodItemDetailsById 3,1
CREATE PROCEDURE [dbo].[restaurant_GetResataurantDetailsById]
@RestaurantID int
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
		ImageName as RestaurantImageName
	FROM dbo.Restaurant r
	WHERE RestaurantID=@RestaurantID
    
         
END




GO
