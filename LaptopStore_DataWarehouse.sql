USE [hpLaptopStore]
GO

/****** Object:  Table [hp].[hpCustomers]    Script Date: 18-01-2024 10:15:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [hp].[hpCustomers](
	[CustomerId] [int] IDENTITY(1000,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](150) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
 CONSTRAINT [PK_hpCustomers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [hpLaptopStore]
GO

/****** Object:  Table [hp].[hpInvoice]    Script Date: 18-01-2024 10:16:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [hp].[hpInvoice](
	[InvoiceId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ProdId] [int] NOT NULL,
	[InvoiceDate] [datetime] NULL,
	[BillingAddress] [nvarchar](100) NULL,
	[BillingCity] [nvarchar](50) NULL,
	[BillingState] [nvarchar](50) NULL,
	[Price] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [hp].[hpInvoice]  WITH CHECK ADD  CONSTRAINT [fk_InvoiceCustomerId] FOREIGN KEY([CustomerId])
REFERENCES [hp].[hpCustomers] ([CustomerId])
GO

ALTER TABLE [hp].[hpInvoice] CHECK CONSTRAINT [fk_InvoiceCustomerId]
GO

ALTER TABLE [hp].[hpInvoice]  WITH CHECK ADD  CONSTRAINT [fk_InvoiceProdId] FOREIGN KEY([ProdId])
REFERENCES [hp].[hpProducts] ([ProdId])
GO

ALTER TABLE [hp].[hpInvoice] CHECK CONSTRAINT [fk_InvoiceProdId]
GO


USE [hpLaptopStore]
GO

/****** Object:  Table [hp].[hpProdCategory]    Script Date: 18-01-2024 10:16:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [hp].[hpProdCategory](
	[ProdCategoryId] [int] NOT NULL,
	[ProdSubCategoryId] [int] NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProdCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [hp].[hpProdCategory]  WITH CHECK ADD  CONSTRAINT [fk_ProdCatSubCatId] FOREIGN KEY([ProdSubCategoryId])
REFERENCES [hp].[hpProdSubCategory] ([ProdSubCategoryId])
GO

ALTER TABLE [hp].[hpProdCategory] CHECK CONSTRAINT [fk_ProdCatSubCatId]
GO


USE [hpLaptopStore]
GO

/****** Object:  Table [hp].[hpProducts]    Script Date: 18-01-2024 10:16:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [hp].[hpProducts](
	[ProdId] [int] NOT NULL,
	[ProdCategoryId] [int] NOT NULL,
	[ProdSubCategoryId] [int] NOT NULL,
	[ProdName] [nvarchar](50) NOT NULL,
	[ProdPrice] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [hp].[hpProducts]  WITH CHECK ADD  CONSTRAINT [fk_ProdCatId] FOREIGN KEY([ProdCategoryId])
REFERENCES [hp].[hpProdCategory] ([ProdCategoryId])
GO

ALTER TABLE [hp].[hpProducts] CHECK CONSTRAINT [fk_ProdCatId]
GO

ALTER TABLE [hp].[hpProducts]  WITH CHECK ADD  CONSTRAINT [fk_ProdSubCatId] FOREIGN KEY([ProdSubCategoryId])
REFERENCES [hp].[hpProdSubCategory] ([ProdSubCategoryId])
GO

ALTER TABLE [hp].[hpProducts] CHECK CONSTRAINT [fk_ProdSubCatId]
GO


