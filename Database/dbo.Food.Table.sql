USE [FoodDelivery]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 12-04-2024 23:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[FoodID] [int] IDENTITY(1,1) NOT NULL,
	[RestaurantID] [int] NULL,
	[FoodName] [nvarchar](200) NULL,
	[Price] [int] NULL,
	[Ingredient] [nvarchar](500) NULL,
	[IsJainAvailable] [bit] NULL,
	[IsVegetarian] [bit] NULL,
	[IsBestSeller] [bit] NULL,
	[ImageName] [nvarchar](500) NULL,
	[DisplayOrder] [int] NULL,
	[DiscountInPercentage] [int] NULL,
	[IsTiffin] [bit] NULL,
	[IsAvailable] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedDate] [datetime2](7) NULL,
	[ModifyDate] [datetime2](7) NULL,
	[IsTrusted] [bit] NULL,
 CONSTRAINT [PK_Food] PRIMARY KEY CLUSTERED 
(
	[FoodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
