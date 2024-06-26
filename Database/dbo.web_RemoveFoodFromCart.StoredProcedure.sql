USE [FoodDelivery]
GO
/****** Object:  StoredProcedure [dbo].[web_RemoveFoodFromCart]    Script Date: 12-04-2024 23:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  Exec webApp_AddDesignToCart 5409,11
CREATE PROCEDURE [dbo].[web_RemoveFoodFromCart]
	@UserId INT =0,
    @FoodId INT =0,
    @IsDeleteFromCart BIT = 0
AS
    IF @IsDeleteFromCart = 1
    BEGIN
        IF EXISTS(SELECT 1 FROM UserCart u  WHERE UserID = @UserId AND FoodID = @FoodId)
        BEGIN
            DELETE FROM UserCart WHERE FoodID = @FoodId AND UserID = @UserId
            SELECT 1 AS result                                            
        END
        ELSE
        BEGIN
            SELECT 2 AS result                                            
        END
    END
    ELSE
    BEGIN
        IF EXISTS(SELECT 1 FROM UserCart u  WHERE UserID = @UserId AND FoodID = @FoodId)
        BEGIN
			DECLARE @Qauntity INT=(SELECT Qauntity FROM UserCart u  WHERE UserID = @UserId AND FoodID = @FoodId)
			IF(@Qauntity=1)
			BEGIN
				 DELETE FROM UserCart WHERE FoodID = @FoodId AND UserID = @UserId
			END
			ELSE
			BEGIN
				Update UserCart SET Qauntity=(Qauntity-1) WHERE UserID = @UserId AND FoodID = @FoodID
			END
           
            SELECT 3 AS result                                   
        END
        ELSE
        BEGIN
            SELECT 2 AS result                                            
        END
    END


GO
