USE [FoodDelivery]
GO
/****** Object:  StoredProcedure [dbo].[admin_GetRestaurantList]    Script Date: 12-04-2024 23:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*
Declare @noOfRecords int  
Exec admin_GetRestaurantList '',0,10,'RestaurantID','DESC',@noOfRecords out
Select @noOfRecords 
*/
CREATE PROCEDURE [dbo].[admin_GetRestaurantList]
@Search NVARCHAR(50) = '',         
@DisplayStart INT,    
@PageSize INT,    
@SortColumnName VARCHAR(50)=NULL,    
@SortOrder VARCHAR(50)='ASC',
@noOfRecords INT Out     
As    
BEGIN
    SET @Search= REPLACE (@Search,'''','');

    DECLARE @QRY NVARCHAR(MAX)= '';
    DECLARE @QRYTABLE NVARCHAR(MAX)= '';      
    DECLARE @QRYStatus NVARCHAR(MAX)= '';    
    DECLARE @QRYWHERE NVARCHAR(MAX)= '';    
    DECLARE @PAGINATION NVARCHAR(MAX)= '';    
    DECLARE @CountRecord NVARCHAR(MAX)= ''; 
        
    DECLARE @CurrencyRate NVARCHAR(MAX) = '';

    SET @QRY = '    SELECT
                        RestaurantID,
						OwnerName,
						RestaurantName,
						Email,
						MobileNo,
                        Address,
						ZipCode,
						RestaurantStatus
                    FROM(
                    select 
						RestaurantID,
						OwnerName,
						RestaurantName,
						Email,
						MobileNo,
						ShopPlotNumber+ '', ''+Floor+'' ''+BuildingName as Address,
						ZipCode,
						RestaurantStatus
                         ';

    SET @QRYTABLE = ' from Restaurant ';

    SET @QRYWHERE += ' WHERE 1=1 AND ISNULL(IsTiffinServices,0)=0 '; 

    SET @QRYWHERE += ')TempTable where 1=1' 

    IF(@Search IS NOT NULL AND len(@Search) > 0)        
    BEGIN        
        SET @QRYWHERE +=' AND (LOWER( Price)  like N''%' + LOWER(@Search) + '%'''+ '
        OR LOWER(Name) like N''%' +LOWER(@Search) + '%'')';
    END   
    SET @CountRecord = 'SELECT @noOfRecord=COUNT(*) FROM ('+(@QRY+ @QRYTABLE + @QRYWHERE)+') countRecord';    
    SET @PAGINATION = ' ORDER BY '+@SortColumnName+' '+@SortOrder+' OFFSET '+CONVERT(VARCHAR, @DisplayStart)+' ROWS FETCH NEXT '+CONVERT(VARCHAR, @PageSize)+' ROWS ONLY'; 
    EXECUTE sp_executesql    
    @CountRecord,    
    N'@noOfRecord int OUTPUT',    
    @noOfRecord = @noOfRecords OUTPUT;    

    --SELECT (@QRY+@QRYTABLE+@QRYWHERE+@PAGINATION);    
    EXEC (@QRY+@QRYTABLE+@QRYWHERE+@PAGINATION);    
END







GO
