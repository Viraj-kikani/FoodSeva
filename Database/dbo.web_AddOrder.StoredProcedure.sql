USE [FoodDelivery]
GO
/****** Object:  StoredProcedure [dbo].[web_AddOrder]    Script Date: 12-04-2024 23:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Exec web_AddOrder 1,'9,11'
CREATE PROCEDURE [dbo].[web_AddOrder]                  
	@UserId INT =0,
    @FoodIds  NVARCHAR(MAX)=''
AS
    BEGIN
        DECLARE @RateStatus INT = 0
        DECLARE @OrderId INT=0
        
		IF OBJECT_ID('tempdb..#TempFood') IS NOT NULL  -- Create Manually New Table [#TempDesign]
        BEGIN
            DROP TABLE #TempFood;
        END;

        CREATE TABLE #TempFood
        (
            [RowNo] [int] Identity(1,1),
            [FoodID] INT NULL,
        );
        INSERT INTO #TempFood(FoodID)
        SELECT Items from dbo.Split(@FoodIds,',')


		INSERT INTO dbo.[Order](UserId,OrderDate,CreatedDate,CreatedBy)
		Values(@UserId,GETDATE(),GETDATE(),@UserId)

		SET @OrderId = SCOPE_IDENTITY()  

		INSERT INTO OrderDetail
		(OrderId,FoodId,RestaurantId,Qauntity,OrderDate,OrderStatus)
		SELECT
			@OrderId,
			tf.FoodID,
			f.RestaurantID,
			uc.Qauntity,
			GETDATE(),
			1
		FROM #TempFood tf
		JOIN dbo.Food f ON f.FoodID=tf.FoodID
		JOIN UserCart uc ON uc.FoodID=f.FoodID


        SET @RateStatus = 1
		DELETE FROM UserCart WHERE UserID = @UserId

        SELECT @RateStatus AS RateStatus
        
    END


GO
