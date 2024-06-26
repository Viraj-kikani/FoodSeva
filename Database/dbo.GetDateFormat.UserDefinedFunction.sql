USE [FoodDelivery]
GO
/****** Object:  UserDefinedFunction [dbo].[GetDateFormat]    Script Date: 12-04-2024 23:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


							CREATE FUNCTION [dbo].[GetDateFormat](@DatetoFormat datetime)
RETURNS VARCHAR(200)
AS
BEGIN  
    RETURN (CONVERT(varchar(20),@DatetoFormat, 103) + ' ' + SUBSTRING(CONVERT(varchar(20), @DatetoFormat , 100), Len(CONVERT(varchar(20), @DatetoFormat, 100)) - 6 , 7 ))
END

GO
