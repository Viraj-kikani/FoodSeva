USE [FoodDelivery]
GO
/****** Object:  Table [dbo].[FoodRating]    Script Date: 12-04-2024 23:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FoodRating](
	[FoodRateID] [int] IDENTITY(1,1) NOT NULL,
	[FoodID] [int] NULL,
	[UserID] [int] NULL,
	[Rate] [decimal](18, 6) NULL,
	[Comment] [nvarchar](max) NULL,
	[RateDate] [datetime2](7) NULL,
	[ModifyDate] [datetime2](7) NULL,
 CONSTRAINT [PK_FoodRating] PRIMARY KEY CLUSTERED 
(
	[FoodRateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
