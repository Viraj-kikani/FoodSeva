USE [FoodDelivery]
GO
/****** Object:  StoredProcedure [dbo].[web_GetCartsDetailsByUserId]    Script Date: 12-04-2024 23:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Exec web_GetCartsDetailsByUserId 1
CREATE PROCEDURE [dbo].[web_GetCartsDetailsByUserId] 
@UserId int=0 
AS
    BEGIN

        SELECT 
            u.UserCartID,
            f.FoodID,
            f.FoodName,
            f.Price,
            f.Ingredient,
            f.IsJainAvailable,
            f.IsBestSeller,
            f.IsVegetarian,
			f.ImageName as FoodImageName,
			f.DisplayOrder,
			f.IsAvailable,
            f.DiscountInPercentage,
			u.Qauntity
            FROM UserCart u
            LEFT JOIN Food f ON u.FoodID = f.FoodID
            WHERE u.UserID=@UserId

            SELECT 
                CONVERT(VARCHAR,COUNT(u.FoodID)) AS TotalCount,
                 CONVERT(DECIMAL(18,3), SUM(F.Price*u.Qauntity)) AS TotalPrice
            FROM UserCart u
             LEFT JOIN Food f ON u.FoodID = f.FoodID
            WHERE UserID=@UserId
    END




GO
