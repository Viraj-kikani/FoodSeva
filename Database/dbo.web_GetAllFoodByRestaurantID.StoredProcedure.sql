USE [FoodDelivery]
GO
/****** Object:  StoredProcedure [dbo].[web_GetAllFoodByRestaurantID]    Script Date: 12-04-2024 23:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





/*
--EXEC web_GetAllFoodByRestaurantID 1
*/
CREATE PROCEDURE [dbo].[web_GetAllFoodByRestaurantID]
@RestaurantID INT=0
AS 
BEGIN  

	 SELECT 
		 RestaurantID
		 ,f.FoodID
		 ,FoodName
		 ,Price
		 ,ImageName
		 ,Ingredient
		 ,DiscountInPercentage
		 ,IsBestSeller
		 ,IsVegetarian 
		 ,(SELECT ROUND((ISNULL(SUM(Rate),0)/COUNT(UserID)),2) FROM FoodRating fr where fr.FoodID=f.FoodID GROUP BY FoodID) Rate
		 ,ISNULL(IsTiffin,0) AS IsTiffin
		 ,ISNULL(IsTrusted,0) AS IsTrusted
	 FROM Food f
	 WHERE RestaurantID=@RestaurantID AND IsAvailable=1 AND ISNULL(IsDeleted,0)=0
	 ORDER BY DisplayOrder,IsBestSeller

 END




GO
