USE [FoodDelivery]
GO
/****** Object:  StoredProcedure [dbo].[restaurant_GetFoodItemGrid]    Script Date: 12-04-2024 23:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
Declare @noOfRecords int  
Exec [restaurant_GetFoodItemGrid] 1,NULL,NULL,-1,-1,-1,0,10,NULL,'DESC',@noOfRecords out
Select @noOfRecords 
*/
CREATE PROCEDURE [dbo].[restaurant_GetFoodItemGrid]
@RestaurantID int,
@Search NVARCHAR(50) = NULL,    
@DiscountInPercentage int=0, 
@IsAvailable INT=-1, -- -1: ALL, 0: InActive 1:Active   
@IsVegetarian INT=-1,
@IsBestSeller INT=-1,
@DisplayStart INT,    
@PageSize INT,    
@SortColumnName VARCHAR(50)=NULL,    
@SortOrder VARCHAR(50)='asc',    
@noOfRecords INT Out     
As    
BEGIN    
	DECLARE @QRY NVARCHAR(MAX)= '';      
    DECLARE @QRYStatus NVARCHAR(MAX)= '';    
    DECLARE @QRYWHERE NVARCHAR(MAX)= '';    
    DECLARE @PAGINATION NVARCHAR(MAX)= '';    
    DECLARE @CountRecord NVARCHAR(MAX)= '';     

    SET @QRY = 'SELECT  FoodID,
						FoodName,
						Price,
						DiscountInPercentage,
						IsJainAvailable,
						IsBestSeller,
						IsVegetarian,
						IsAvailable
                FROM(    
                    Select     
                        FoodID,
						FoodName,
						Price,
						DiscountInPercentage,
						IsJainAvailable,
						IsBestSeller,
						IsVegetarian,
						IsAvailable
                    FROM FOOD';     

    SET @QRYWHERE = ' WHERE ISNULL(IsDeleteD,0)=0 AND RestaurantID='+cast(@RestaurantID as nvarchar(MAX) ); 

	IF(@Search IS NOT NULL AND @Search<>'' AND LEN(@Search)>0)
    BEGIN    
        SET @QRYWHERE+=' AND FoodName like ''%'+COALESCE(@Search, '')+'%'''+'';    
    END;
    IF @DiscountInPercentage IS NOT NULL AND @DiscountInPercentage > 0
    BEGIN 
        SET @QRYWHERE+=' AND DiscountInPercentage=' + cast(@DiscountInPercentage as nvarchar(20))
    END   
    
    IF @IsAvailable IS NOT NULL AND @IsAvailable > -1
    BEGIN 
        SET @QRYWHERE+=' AND IsAvailable=' + cast(@IsAvailable as nvarchar(20))
    END 
	IF @IsVegetarian IS NOT NULL AND @IsVegetarian > -1
    BEGIN 
        SET @QRYWHERE+=' AND IsVegetarian=' + cast(@IsVegetarian as nvarchar(20))
    END 
	IF @IsBestSeller IS NOT NULL AND @IsBestSeller > -1
    BEGIN 
        SET @QRYWHERE+=' AND IsBestSeller=' + cast(@IsBestSeller as nvarchar(20))
    END 

    SET @QRYWHERE += ')TempTable'    
    SET @CountRecord = 'SELECT @noOfRecord=COUNT(*) FROM ('+(@QRY  + @QRYWHERE)+') countRecord';    
    SET @PAGINATION = ' ORDER BY '+@SortColumnName+' '+@SortOrder+' OFFSET '+CONVERT(VARCHAR, @DisplayStart)+' ROWS FETCH NEXT '+CONVERT(VARCHAR, @PageSize)+' ROWS ONLY'; 
    EXECUTE sp_executesql    
    @CountRecord,    
    N'@noOfRecord int OUTPUT',    
    @noOfRecord = @noOfRecords OUTPUT;    
    PRINT (@QRY+@QRYWHERE+@PAGINATION);  
    EXEC (@QRY+@QRYWHERE+@PAGINATION);   
END



GO
