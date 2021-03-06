USE [master]
GO
/****** Object:  Database [StockManagementSystemDB_EXE]    Script Date: 3/25/2019 1:16:11 PM ******/
CREATE DATABASE [StockManagementSystemDB_EXE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StockManagementSystemDB_EXE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\StockManagementSystemDB_EXE.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StockManagementSystemDB_EXE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\StockManagementSystemDB_EXE_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StockManagementSystemDB_EXE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET ARITHABORT OFF 
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET  MULTI_USER 
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [StockManagementSystemDB_EXE]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/25/2019 1:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Company]    Script Date: 3/25/2019 1:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item]    Script Date: 3/25/2019 1:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ReorderLevel] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockIn]    Script Date: 3/25/2019 1:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockIn](
	[StockInId] [int] IDENTITY(1,1) NOT NULL,
	[AvailableQuantity] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
 CONSTRAINT [PK_StockIn] PRIMARY KEY CLUSTERED 
(
	[StockInId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockOut]    Script Date: 3/25/2019 1:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockOut](
	[StockOutId] [int] IDENTITY(1,1) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[StockOutQuantity] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[ActionType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_StockOut] PRIMARY KEY CLUSTERED 
(
	[StockOutId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[GetItemInfo]    Script Date: 3/25/2019 1:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetItemInfo]
AS
SELECT dbo.Item.ItemId, dbo.Item.Name, dbo.Item.ReorderLevel, dbo.StockIn.AvailableQuantity, dbo.Item.CompanyId
FROM     dbo.Item INNER JOIN
                  dbo.StockIn ON dbo.Item.ItemId = dbo.StockIn.ItemId

GO
/****** Object:  View [dbo].[SearchItem]    Script Date: 3/25/2019 1:16:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SearchItem] AS
SELECT       dbo.Item.ItemId AS ItemIde, dbo.Item.Name AS ItemName, dbo.Company.CompanyId AS CompanyId,dbo.Company.Name AS CompanyName,dbo.Category.CategoryId AS CategoryId, dbo.Category.Name AS CategoryName, dbo.Item.ReorderLevel, 
                         dbo.StockIn.AvailableQuantity AS AvailableQuantity
FROM            dbo.Item FULL OUTER JOIN
                         dbo.Company ON dbo.Item.CompanyId = dbo.Company.CompanyId FULL OUTER JOIN
                         dbo.Category ON dbo.Item.CategoryId = dbo.Category.CategoryId FULL OUTER JOIN
                         dbo.StockIn ON dbo.StockIn.ItemId = dbo.Item.ItemId
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (3, N'biscuitelskdjaf')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (1, N'chanachur')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (2, N'chips')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (4, N'chocholate')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (5, N'Nodles')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([CompanyId], [Name]) VALUES (1, N'Pran')
INSERT [dbo].[Company] ([CompanyId], [Name]) VALUES (3, N'RFL')
INSERT [dbo].[Company] ([CompanyId], [Name]) VALUES (2, N'Uniliver')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([ItemId], [Name], [ReorderLevel], [CategoryId], [CompanyId]) VALUES (1, N'Jhal Chanachur', 10, 1, 1)
INSERT [dbo].[Item] ([ItemId], [Name], [ReorderLevel], [CategoryId], [CompanyId]) VALUES (2, N'Bombay Seets', 5, 2, 1)
INSERT [dbo].[Item] ([ItemId], [Name], [ReorderLevel], [CategoryId], [CompanyId]) VALUES (3, N'Lexus', 30, 3, 1)
INSERT [dbo].[Item] ([ItemId], [Name], [ReorderLevel], [CategoryId], [CompanyId]) VALUES (4, N'Creamy Pie', 460, 3, 1)
INSERT [dbo].[Item] ([ItemId], [Name], [ReorderLevel], [CategoryId], [CompanyId]) VALUES (5, N'BarBQQ', 50, 3, 1)
INSERT [dbo].[Item] ([ItemId], [Name], [ReorderLevel], [CategoryId], [CompanyId]) VALUES (6, N'BarBQ', 200, 1, 1)
INSERT [dbo].[Item] ([ItemId], [Name], [ReorderLevel], [CategoryId], [CompanyId]) VALUES (7, N'Meggi', 100, 5, 3)
SET IDENTITY_INSERT [dbo].[Item] OFF
SET IDENTITY_INSERT [dbo].[StockIn] ON 

INSERT [dbo].[StockIn] ([StockInId], [AvailableQuantity], [ItemId], [CompanyId]) VALUES (1, 320, 1, 1)
INSERT [dbo].[StockIn] ([StockInId], [AvailableQuantity], [ItemId], [CompanyId]) VALUES (2, 1780, 2, 1)
INSERT [dbo].[StockIn] ([StockInId], [AvailableQuantity], [ItemId], [CompanyId]) VALUES (3, 210, 3, 1)
INSERT [dbo].[StockIn] ([StockInId], [AvailableQuantity], [ItemId], [CompanyId]) VALUES (4, 500, 5, 1)
INSERT [dbo].[StockIn] ([StockInId], [AvailableQuantity], [ItemId], [CompanyId]) VALUES (5, 90, 7, 3)
SET IDENTITY_INSERT [dbo].[StockIn] OFF
SET IDENTITY_INSERT [dbo].[StockOut] ON 

INSERT [dbo].[StockOut] ([StockOutId], [ItemName], [CompanyName], [StockOutQuantity], [Date], [ActionType]) VALUES (1, N'Jhal Chanachur', N'Pran', 80, CAST(0x0000AA1700000000 AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([StockOutId], [ItemName], [CompanyName], [StockOutQuantity], [Date], [ActionType]) VALUES (2, N'Bombay Seets', N'Pran', 300, CAST(0x0000AA1700000000 AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([StockOutId], [ItemName], [CompanyName], [StockOutQuantity], [Date], [ActionType]) VALUES (3, N'Jhal Chanachur', N'Pran', 200, CAST(0x0000AA1700000000 AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([StockOutId], [ItemName], [CompanyName], [StockOutQuantity], [Date], [ActionType]) VALUES (4, N'Lexus', N'Pran', 220, CAST(0x0000AA1700000000 AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([StockOutId], [ItemName], [CompanyName], [StockOutQuantity], [Date], [ActionType]) VALUES (5, N'Bombay Seets', N'Pran', 20, CAST(0x0000AA1700000000 AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([StockOutId], [ItemName], [CompanyName], [StockOutQuantity], [Date], [ActionType]) VALUES (6, N'Meggi', N'RFL', 10, CAST(0x0000AA1B00D5B9E5 AS DateTime), N'Sell')
INSERT [dbo].[StockOut] ([StockOutId], [ItemName], [CompanyName], [StockOutQuantity], [Date], [ActionType]) VALUES (7, N'Lexus', N'Pran', 70, CAST(0x0000AA1B00D5B9FD AS DateTime), N'Sell')
SET IDENTITY_INSERT [dbo].[StockOut] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Category_Name]    Script Date: 3/25/2019 1:16:12 PM ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [UK_Category_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Company_Name]    Script Date: 3/25/2019 1:16:12 PM ******/
ALTER TABLE [dbo].[Company] ADD  CONSTRAINT [UK_Company_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Item_Name]    Script Date: 3/25/2019 1:16:12 PM ******/
ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [UK_Item_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Category]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Company]
GO
ALTER TABLE [dbo].[StockIn]  WITH CHECK ADD  CONSTRAINT [FK_StockIn_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[StockIn] CHECK CONSTRAINT [FK_StockIn_Company]
GO
ALTER TABLE [dbo].[StockIn]  WITH CHECK ADD  CONSTRAINT [FK_StockIn_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemId])
GO
ALTER TABLE [dbo].[StockIn] CHECK CONSTRAINT [FK_StockIn_Item]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = -15
      End
      Begin Tables = 
         Begin Table = "Item"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "StockIn"
            Begin Extent = 
               Top = 2
               Left = 277
               Bottom = 165
               Right = 490
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetItemInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'GetItemInfo'
GO
USE [master]
GO
ALTER DATABASE [StockManagementSystemDB_EXE] SET  READ_WRITE 
GO
