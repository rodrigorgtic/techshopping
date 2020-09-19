USE [master]
GO
/****** Object:  Database [techshopping]    Script Date: 19/09/2020 11:48:17 ******/
CREATE DATABASE [techshopping]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'techshopping', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\techshopping.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'techshopping_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\techshopping_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [techshopping] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [techshopping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [techshopping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [techshopping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [techshopping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [techshopping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [techshopping] SET ARITHABORT OFF 
GO
ALTER DATABASE [techshopping] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [techshopping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [techshopping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [techshopping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [techshopping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [techshopping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [techshopping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [techshopping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [techshopping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [techshopping] SET  DISABLE_BROKER 
GO
ALTER DATABASE [techshopping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [techshopping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [techshopping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [techshopping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [techshopping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [techshopping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [techshopping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [techshopping] SET RECOVERY FULL 
GO
ALTER DATABASE [techshopping] SET  MULTI_USER 
GO
ALTER DATABASE [techshopping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [techshopping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [techshopping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [techshopping] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [techshopping] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'techshopping', N'ON'
GO
ALTER DATABASE [techshopping] SET QUERY_STORE = OFF
GO
USE [techshopping]
GO
/****** Object:  Schema [EMPLOYEES]    Script Date: 19/09/2020 11:48:17 ******/
CREATE SCHEMA [EMPLOYEES]
GO
/****** Object:  Schema [SALES]    Script Date: 19/09/2020 11:48:17 ******/
CREATE SCHEMA [SALES]
GO
/****** Object:  Schema [STOCK]    Script Date: 19/09/2020 11:48:17 ******/
CREATE SCHEMA [STOCK]
GO
/****** Object:  Table [EMPLOYEES].[USERS]    Script Date: 19/09/2020 11:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [EMPLOYEES].[USERS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[email] [varchar](max) NOT NULL,
	[password] [varchar](max) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_USERS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [SALES].[HISTORY]    Script Date: 19/09/2020 11:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SALES].[HISTORY](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NOT NULL,
	[date] [date] NOT NULL,
	[hour] [time](7) NOT NULL,
	[total_sale] [decimal](10, 2) NOT NULL,
	[discount] [decimal](10, 2) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_HISTORY_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [SALES].[ITEMS]    Script Date: 19/09/2020 11:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [SALES].[ITEMS](
	[id_sale] [int] NOT NULL,
	[id_product] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](10, 2) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [STOCK].[HISTORY]    Script Date: 19/09/2020 11:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STOCK].[HISTORY](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_user] [int] NOT NULL,
	[id_product] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[date] [date] NOT NULL,
	[hour] [time](7) NOT NULL,
	[reason] [varchar](max) NOT NULL,
	[action] [bit] NOT NULL,
 CONSTRAINT [PK_HISTORY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [STOCK].[PRODUCT]    Script Date: 19/09/2020 11:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STOCK].[PRODUCT](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[barcode] [varchar](max) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[unit_type] [int] NOT NULL,
	[minimum_quantity] [int] NOT NULL,
	[maximum_quantity] [int] NOT NULL,
	[current_quantity] [int] NOT NULL,
	[unit_cost] [decimal](10, 2) NOT NULL,
	[percentage_profit] [decimal](3, 1) NOT NULL,
	[sale_price] [decimal](10, 2) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_PRODUCT] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [STOCK].[UNIT_TYPE]    Script Date: 19/09/2020 11:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STOCK].[UNIT_TYPE](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](20) NOT NULL,
 CONSTRAINT [PK_UNIT_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [EMPLOYEES].[USERS] ADD  CONSTRAINT [DF_USERS_active]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [SALES].[HISTORY] ADD  CONSTRAINT [DF_HISTORY_active]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [STOCK].[PRODUCT] ADD  CONSTRAINT [DF_PRODUCT_active]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [SALES].[HISTORY]  WITH CHECK ADD  CONSTRAINT [FK_HISTORY_USERS] FOREIGN KEY([id_user])
REFERENCES [EMPLOYEES].[USERS] ([id])
GO
ALTER TABLE [SALES].[HISTORY] CHECK CONSTRAINT [FK_HISTORY_USERS]
GO
ALTER TABLE [SALES].[ITEMS]  WITH CHECK ADD  CONSTRAINT [FK_ITEMS_HISTORY] FOREIGN KEY([id_sale])
REFERENCES [SALES].[HISTORY] ([id])
GO
ALTER TABLE [SALES].[ITEMS] CHECK CONSTRAINT [FK_ITEMS_HISTORY]
GO
ALTER TABLE [SALES].[ITEMS]  WITH CHECK ADD  CONSTRAINT [FK_ITEMS_PRODUCT] FOREIGN KEY([id_product])
REFERENCES [STOCK].[PRODUCT] ([id])
GO
ALTER TABLE [SALES].[ITEMS] CHECK CONSTRAINT [FK_ITEMS_PRODUCT]
GO
ALTER TABLE [STOCK].[HISTORY]  WITH CHECK ADD  CONSTRAINT [FK_HISTORY_USERS] FOREIGN KEY([id_user])
REFERENCES [EMPLOYEES].[USERS] ([id])
GO
ALTER TABLE [STOCK].[HISTORY] CHECK CONSTRAINT [FK_HISTORY_USERS]
GO
ALTER TABLE [STOCK].[HISTORY]  WITH CHECK ADD  CONSTRAINT [Stock have a product] FOREIGN KEY([id_product])
REFERENCES [STOCK].[PRODUCT] ([id])
GO
ALTER TABLE [STOCK].[HISTORY] CHECK CONSTRAINT [Stock have a product]
GO
ALTER TABLE [STOCK].[PRODUCT]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCT_UNIT_TYPE] FOREIGN KEY([unit_type])
REFERENCES [STOCK].[UNIT_TYPE] ([id])
GO
ALTER TABLE [STOCK].[PRODUCT] CHECK CONSTRAINT [FK_PRODUCT_UNIT_TYPE]
GO
/****** Object:  StoredProcedure [dbo].[spEmployeesUserSignIn]    Script Date: 19/09/2020 11:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEmployeesUserSignIn]
@email VARCHAR(MAX),
@password VARCHAR(MAX)
AS
BEGIN
	SELECT 
		name, email 
	FROM 
		EMPLOYEES.USERS
	WHERE
		email = @email AND password = @password	
END
GO
/****** Object:  StoredProcedure [dbo].[spStockProductCreate]    Script Date: 19/09/2020 11:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spStockProductCreate]
@barcode VARCHAR(MAX),
@description VARCHAR(MAX),
@unit_type INT,
@minimum_quantity INT,
@maximum_quantity INT,
@current_quantity INT,
@unit_cost DECIMAL(10,2),
@percentage_profit DECIMAl(3,1),
@sale_price  DECIMAL(10,2)
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
			INSERT INTO STOCK.PRODUCT
				(barcode, description, unit_type, minimum_quantity, maximum_quantity, 
				current_quantity, unit_cost, percentage_profit, sale_price)
			VALUES
				(@barcode, @description, @unit_type, @minimum_quantity, @maximum_quantity,
				@current_quantity, @unit_cost, @percentage_profit, @sale_price)

			SELECT @@IDENTITY AS id
		COMMIT TRAN	
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		SELECT ERROR_MESSAGE() AS error
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spStockProductListActive]    Script Date: 19/09/2020 11:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spStockProductListActive]
AS
BEGIN
	SELECT 
		id,
		barcode, 
		description, 
		unit_type, 
		minimum_quantity, 
		maximum_quantity, 
		current_quantity, 
		unit_cost, 
		percentage_profit, 
		sale_price		
	FROM 
		STOCK.PRODUCT 
	WHERE 
		active = 1
END
GO
/****** Object:  StoredProcedure [dbo].[spStockProductListAll]    Script Date: 19/09/2020 11:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spStockProductListAll]
AS
BEGIN
	SELECT 
		id,
		barcode, 
		description, 
		unit_type, 
		minimum_quantity, 
		maximum_quantity, 
		current_quantity, 
		unit_cost, 
		percentage_profit, 
		sale_price,
		active
	FROM STOCK.PRODUCT
END
GO
/****** Object:  StoredProcedure [dbo].[spStockProductShow]    Script Date: 19/09/2020 11:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spStockProductShow]
@id INT
AS
BEGIN
	SELECT 
		id,
		barcode, 
		description, 
		unit_type, 
		minimum_quantity, 
		maximum_quantity, 
		current_quantity, 
		unit_cost, 
		percentage_profit, 
		sale_price,
		active
	FROM 
		STOCK.PRODUCT 
	WHERE 
		id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spStockProductUpdate]    Script Date: 19/09/2020 11:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spStockProductUpdate]
@id INT,
@barcode VARCHAR(MAX),
@description VARCHAR(MAX),
@unit_type INT,
@minimum_quantity INT,
@maximum_quantity INT,
@current_quantity INT,
@unit_cost DECIMAL(10,2),
@percentage_profit DECIMAl(3,1),
@sale_price DECIMAL(10,2),
@active BIT
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN
			UPDATE STOCK.PRODUCT SET
				barcode = @barcode, 
				description = @description, 
				unit_type = @unit_type, 
				minimum_quantity = @minimum_quantity, 
				maximum_quantity = @maximum_quantity, 
				current_quantity = @current_quantity, 
				unit_cost = @unit_cost, 
				percentage_profit = @percentage_profit, 
				sale_price = @sale_price,
				active = @active
			WHERE
			 id = @id

			SELECT @id AS id
		COMMIT TRAN	
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN
		SELECT ERROR_MESSAGE() AS error
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spStockUnitTypeListAll]    Script Date: 19/09/2020 11:48:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spStockUnitTypeListAll]
AS
BEGIN
	SELECT  
		id, description
	FROM 
		STOCK.UNIT_TYPE
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 - Active is false (user not have permission to login) 
1 - Active is true (user have permission to login)' , @level0type=N'SCHEMA',@level0name=N'EMPLOYEES', @level1type=N'TABLE',@level1name=N'USERS', @level2type=N'COLUMN',@level2name=N'active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 - Active is false (sale is canceled) 
1 - Active is true (sale is confirmed)' , @level0type=N'SCHEMA',@level0name=N'SALES', @level1type=N'TABLE',@level1name=N'HISTORY', @level2type=N'COLUMN',@level2name=N'active'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 - When the product to exit stock.
1 - When  the product to entry stock.' , @level0type=N'SCHEMA',@level0name=N'STOCK', @level1type=N'TABLE',@level1name=N'HISTORY', @level2type=N'COLUMN',@level2name=N'action'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 - Active is false (product not available for sale)
1 - Active is true (product available for sale)' , @level0type=N'SCHEMA',@level0name=N'STOCK', @level1type=N'TABLE',@level1name=N'PRODUCT', @level2type=N'COLUMN',@level2name=N'active'
GO
USE [master]
GO
ALTER DATABASE [techshopping] SET  READ_WRITE 
GO
