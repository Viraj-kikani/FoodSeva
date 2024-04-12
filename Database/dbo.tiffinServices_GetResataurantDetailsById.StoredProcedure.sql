USE [FoodDelivery]
GO
/****** Object:  StoredProcedure [dbo].[tiffinServices_GetResataurantDetailsById]    Script Date: 12-04-2024 23:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- Exec restaurant_GetFoodItemDetailsById 3,1
CREATE PROCEDURE [dbo].[tiffinServices_GetResataurantDetailsById]
@TiffinServicesID int
AS 
BEGIN  

	SELECT 
		RestaurantID as TiffinServicesID,
		OwnerName, 
		RestaurantName as TiffinServicesName, 
		MobileNo, 
		Email, 
		ShopPlotNumber,
		Floor,
		BuildingName,
		ZipCode,
		ImageName as TiffinServicesImageName
	FROM dbo.Restaurant r
	WHERE RestaurantID=@TiffinServicesID 
    
         
END







GO
