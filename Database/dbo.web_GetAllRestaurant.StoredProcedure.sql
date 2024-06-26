USE [FoodDelivery]
GO
/****** Object:  StoredProcedure [dbo].[web_GetAllRestaurant]    Script Date: 12-04-2024 23:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/*
--EXEC web_GetAllRestaurant 
*/
CREATE PROCEDURE [dbo].[web_GetAllRestaurant]
AS 
BEGIN  

	Select 
		RestaurantID
		,RestaurantName
		,ShopPlotNumber +Floor +BuildingName as Address
		,ZipCode
		,ImageName
		,Isnull(IsTiffinServices,0) as IsTiffinServices
	 from Restaurant
	where IsActive=1 AND Isnull(IsDelete,0)=0 AND RestaurantStatus=1

 end



GO
