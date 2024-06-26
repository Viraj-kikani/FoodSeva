USE [FoodDelivery]
GO
/****** Object:  StoredProcedure [dbo].[restaurant_GetFoodItemDetailsById]    Script Date: 12-04-2024 23:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Exec restaurant_GetFoodItemDetailsById 3,1
CREATE PROCEDURE [dbo].[restaurant_GetFoodItemDetailsById]
@FoodID int,
@RestaurantID int
AS 
BEGIN  

	SELECT 
		FoodID,
		FoodName, 
		Price, 
		Ingredient, 
		IsJainAvailable, 
		IsBestSeller,
		IsVegetarian,
		ImageName as FoodImageName,
		DiscountInPercentage,
		DisplayOrder,
		IsAvailable
	FROM dbo.Food f
	WHERE ISNULL(f.IsDeleted,0)=0 AND f.FoodID=@FoodID AND RestaurantID=@RestaurantID
    
         
END


GO
