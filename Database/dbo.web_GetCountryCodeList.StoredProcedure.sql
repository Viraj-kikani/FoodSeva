USE [FoodDelivery]
GO
/****** Object:  StoredProcedure [dbo].[web_GetCountryCodeList]    Script Date: 12-04-2024 23:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- EXEC [web_GetCountryCodeList]
-- =============================================
CREATE PROCEDURE [dbo].[web_GetCountryCodeList] 
AS
BEGIN  	
    SELECT 
        CountryID as CountryId,
        (ISO2Code+','+CAST(DialCode as nvarchar(10)) +','+Name) as Name,
        IsBanned,
        CurrencyISOCode,
        ISO2Code
    FROM Country
END

GO
