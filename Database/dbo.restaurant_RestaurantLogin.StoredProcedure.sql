USE [FoodDelivery]
GO
/****** Object:  StoredProcedure [dbo].[restaurant_RestaurantLogin]    Script Date: 12-04-2024 23:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--EXEC restaurant_RestaurantLogin 'test4@gmail.com','123456@Aa'
CREATE PROCEDURE [dbo].[restaurant_RestaurantLogin]
@EmailOrMobileNo  NVARCHAR(100),
@Password NVARCHAR(50) 
AS
BEGIN
    DECLARE @IsRestaurantAvailable INT= 0, @MatchPassword INT= 0;
    DECLARE @Result INT =0

	SELECT @IsRestaurantAvailable = COUNT(1) FROM Restaurant WHERE ISNULL(IsTiffinServices,0)=0 AND (Email = @EmailOrMobileNo OR MobileNo = @EmailOrMobileNo) AND ISNULL(IsDelete,0)=0  Group By RestaurantID
		 
    IF(@IsRestaurantAvailable = 0)
    BEGIN
        SET @Result = 1; 
		SELECT @Result AS Result;
	END
	ELSE
    BEGIN 
        SELECT @MatchPassword = COUNT(1) FROM Restaurant WHERE ISNULL(IsTiffinServices,0)=0 AND (Email = @EmailOrMobileNo OR MobileNo = @EmailOrMobileNo) AND [Password] = @Password AND ISNULL(IsDelete,0)=0 ;

		IF(@MatchPassword = 0)
		BEGIN
			SET @Result = 4;
			SELECT @Result AS Result;
		END
		ELSE
		BEGIN
            DECLARE @IsRestaurantActive INT= (SELECT COUNT(1) FROM Restaurant WHERE ISNULL(IsTiffinServices,0)=0 AND (Email = @EmailOrMobileNo OR MobileNo = @EmailOrMobileNo) 
                AND [Password] = @Password AND ISNULL(IsDelete,0)=0 AND IsActive=1)

			DECLARE @RestaurantStatus INT= (SELECT RestaurantStatus FROM Restaurant WHERE ISNULL(IsTiffinServices,0)=0 AND (Email = @EmailOrMobileNo OR MobileNo = @EmailOrMobileNo) 
                AND [Password] = @Password AND ISNULL(IsDelete,0)=0 AND IsActive=1)
			
            IF(@IsRestaurantActive=1)
            BEGIN
				IF(@RestaurantStatus=1)
				BEGIN
					 SET @Result = 5;
					SELECT @Result AS Result;
					SELECT 
						r.RestaurantID,
						r.OwnerName,
						r.RestaurantName,
						r.Email as Email,
						r.MobileNo as MobileNo,
						r.ShopPlotNumber +' '+r.[Floor] +' '+ r.BuildingName as Address,
						r.ZipCode,
						r.RestaurantStatus
					FROM Restaurant AS r 
					WHERE ISNULL(IsTiffinServices,0)=0 AND (r.Email = @EmailOrMobileNo) OR (r.MobileNo = @EmailOrMobileNo)
				END
				ELSE
				BEGIN
					SET @Result = 3; 
					SELECT @Result AS Result;
				END				              
            END
            ELSE
            BEGIN
                SET @Result = 2; 
                SELECT @Result AS Result;
            END
		END
	END 
END



GO
