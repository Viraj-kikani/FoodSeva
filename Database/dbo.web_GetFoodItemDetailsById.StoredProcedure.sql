USE [FoodDelivery]
GO
/****** Object:  StoredProcedure [dbo].[web_GetFoodItemDetailsById]    Script Date: 12-04-2024 23:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- Exec web_GetFoodItemDetailsById 3,1
CREATE PROCEDURE [dbo].[web_GetFoodItemDetailsById]
@FoodID int
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
		IsAvailable,
		ISNULL(IsTrusted,0) AS IsTrusted
	FROM dbo.Food f
	WHERE ISNULL(f.IsDeleted,0)=0 AND f.FoodID=@FoodID
    
         
END




GO
