USE [master]
GO
/****** Object:  Database [QL_Laptop]    Script Date: 11/23/2022 2:48:27 PM ******/
CREATE DATABASE [QL_Laptop]
/****** Object:  UserDefinedFunction [dbo].[auto_idProducts2]    Script Date: 11/23/2022 2:48:28 PM ******/


GO
/****** Object:  Table [dbo].[Banner]    Script Date: 11/23/2022 2:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[image_] [nvarchar](1000) NULL,
	[active] [bit] NULL,
	[dateUpdate] [datetime] NULL DEFAULT (getdate()),
	[BannerType] [nvarchar](100) NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11/23/2022 2:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cart](
	[cartID] [int] IDENTITY(1,1) NOT NULL,
	[proID] [char](9) NULL,
	[proPrice] [int] NULL,
	[CartQuantity] [int] NULL,
	[CartMoney] [int] NULL,
	[cusID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietPhieuNhap]    Script Date: 11/23/2022 2:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietPhieuNhap](
	[PhieuNhap_id] [char](16) NOT NULL,
	[product_id] [char](9) NOT NULL,
	[quanlity] [int] NULL,
	[price_Import] [bigint] NULL,
	[ratio] [decimal](32, 0) NULL,
 CONSTRAINT [PK_CTPhieuNhap] PRIMARY KEY CLUSTERED 
(
	[PhieuNhap_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 11/23/2022 2:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comments](
	[comID] [int] IDENTITY(1,1) NOT NULL,
	[proID] [char](9) NULL,
	[cusID] [int] NULL,
	[comMessage] [nvarchar](max) NULL,
	[comDate] [date] NULL,
	[cusemail] [nchar](500) NULL,
	[cusName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[comID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerAddress]    Script Date: 11/23/2022 2:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAddress](
	[ID_address] [int] IDENTITY(1,1) NOT NULL,
	[cusID] [int] NULL,
	[Name_Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_CustomerAddress] PRIMARY KEY CLUSTERED 
(
	[ID_address] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 11/23/2022 2:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[cusID] [int] IDENTITY(1,1) NOT NULL,
	[cusName] [nvarchar](max) NULL,
	[cusEmail] [nvarchar](100) NULL,
	[cusPhone] [nchar](11) NULL,
	[cusPassword] [nchar](10) NULL,
	[cusAddress] [nvarchar](max) NULL,
	[cusType] [int] NULL,
	[cusStatus] [int] NULL,
	[cusPhoto] [char](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[cusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customertype]    Script Date: 11/23/2022 2:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customertype](
	[CusType] [int] NOT NULL,
	[CusTypeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customertype] PRIMARY KEY CLUSTERED 
(
	[CusType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Description]    Script Date: 11/23/2022 2:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Description](
	[product_id] [char](9) NOT NULL,
	[title] [nvarchar](1000) NULL,
	[content] [nvarchar](4000) NULL,
	[image_] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Description] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Detail]    Script Date: 11/23/2022 2:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [char](9) NULL,
	[CPU] [nvarchar](1000) NULL,
	[SoNhan] [nvarchar](100) NULL,
	[SoLuong] [nvarchar](100) NULL,
	[Speed] [nvarchar](1000) NULL,
	[MaxSpeed] [nvarchar](1000) NULL,
	[Cache] [nvarchar](1000) NULL,
	[RAM] [nvarchar](1000) NULL,
	[RAM_type] [nvarchar](1000) NULL,
	[BusRAM] [nvarchar](1000) NULL,
	[MaxRAM] [nvarchar](1000) NULL,
	[OCung] [nvarchar](1000) NULL,
	[ManHinh] [nvarchar](1000) NULL,
	[DoPhanGiai] [nvarchar](1000) NULL,
	[TanSoQuet] [nvarchar](1000) NULL,
	[CongNgheManHinh] [nvarchar](1000) NULL,
	[VGA] [nvarchar](1000) NULL,
	[AmThanh] [nvarchar](1000) NULL,
	[CongGiaoTiep] [nvarchar](1000) NULL,
	[KetNoiKhongDay] [nvarchar](1000) NULL,
	[Webcam] [nvarchar](1000) NULL,
	[TinhNangKhac] [nvarchar](1000) NULL,
	[DenBanPhim] [nvarchar](1000) NULL,
	[SizeAndWeight] [nvarchar](1000) NULL,
	[ChatLieu] [nvarchar](1000) NULL,
	[Pin] [nvarchar](1000) NULL,
	[HeDieuHanh] [nvarchar](1000) NULL,
	[RaMat] [nvarchar](1000) NULL,
 CONSTRAINT [PK_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetailsOrders]    Script Date: 11/23/2022 2:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetailsOrders](
	[DeOrderID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NOT NULL,
	[proID] [char](9) NULL,
	[orderAddress] [nvarchar](max) NULL,
	[proPrice] [int] NULL,
	[orderQuantity] [int] NULL,
	[orderMoney] [int] NULL,
	[cusID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DeOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 11/23/2022 2:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employees](
	[empID] [int] IDENTITY(1,1) NOT NULL,
	[empName] [nvarchar](50) NULL,
	[empDate] [date] NULL,
	[empPhoto] [char](100) NULL,
	[empAddress] [nvarchar](max) NULL,
	[empSalary] [int] NULL,
	[empBonus] [int] NULL,
	[empStartTime] [date] NULL,
	[empEmail] [char](100) NULL,
	[empPhone] [char](10) NULL,
	[empPassword] [nchar](100) NULL,
	[empRole] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[empID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployeesRole]    Script Date: 11/23/2022 2:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeesRole](
	[empRole] [int] IDENTITY(1,1) NOT NULL,
	[empRoleName] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[empRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Image]    Script Date: 11/23/2022 2:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Image](
	[product_id] [char](9) NOT NULL,
	[image_] [nvarchar](1000) NOT NULL,
	[active] [bit] NULL,
	[dateUpdate] [datetime] NULL CONSTRAINT [DF__Image__dateUpdat__7E02B4CC]  DEFAULT (getdate()),
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[image_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NameOrderStatus]    Script Date: 11/23/2022 2:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NameOrderStatus](
	[IDStatus] [int] NOT NULL,
	[NameOrderStatus] [nvarchar](50) NULL,
 CONSTRAINT [PK_NameOrderStatus] PRIMARY KEY CLUSTERED 
(
	[IDStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/23/2022 2:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[orderDate] [datetime] NULL,
	[orderStatus] [nvarchar](50) NULL,
	[empID] [int] NULL,
	[cusID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 11/23/2022 2:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[id] [char](16) NOT NULL,
	[employee_id] [int] NULL,
	[date_] [datetime] NULL CONSTRAINT [DF__PhieuNhap__date___3D2915A8]  DEFAULT (getdate()),
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/23/2022 2:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[id] [char](9) NOT NULL,
	[Name] [nvarchar](1000) NULL,
	[quanlity] [int] NULL CONSTRAINT [DF__Products__quanli__671F4F74]  DEFAULT ((0)),
	[purchase] [int] NULL CONSTRAINT [DF__Products__purcha__681373AD]  DEFAULT ((0)),
	[price] [decimal](32, 0) NULL CONSTRAINT [DF__Products__price__690797E6]  DEFAULT ((0)),
	[trademark_id] [int] NULL,
	[avatar] [nvarchar](1000) NULL,
	[productType_id] [int] NULL,
	[view_] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 11/23/2022 2:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[productType_id] [int] NOT NULL,
	[Name_ProductType] [nvarchar](1000) NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[productType_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[promotions]    Script Date: 11/23/2022 2:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[promotions](
	[product_id] [char](9) NOT NULL,
	[date_start] [date] NOT NULL,
	[date_end] [date] NULL,
	[price] [decimal](32, 0) NULL,
	[price_after] [decimal](32, 0) NULL,
 CONSTRAINT [PK_promotions] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC,
	[date_start] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PromotionsGift]    Script Date: 11/23/2022 2:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PromotionsGift](
	[product_id] [char](9) NOT NULL,
	[gift1] [nvarchar](1000) NULL,
	[gift2] [nvarchar](1000) NULL,
	[gift3] [nvarchar](1000) NULL,
	[gift4] [nvarchar](1000) NULL,
	[priceSum] [decimal](32, 0) NULL,
	[date_start] [date] NULL,
	[date_end] [date] NULL,
 CONSTRAINT [PK_PromotionsGift] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Trademark]    Script Date: 11/23/2022 2:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trademark](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](1000) NULL,
 CONSTRAINT [PK_trademark] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Banner] ON 

INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (1, N'header1.png', 1, CAST(N'2021-11-16 20:21:22.813' AS DateTime), N'Top')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (2, N'header2.png', 1, CAST(N'2021-11-16 20:21:22.813' AS DateTime), N'Top')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (3, N'header3.png', 1, CAST(N'2021-11-16 20:21:22.813' AS DateTime), N'Top')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (4, N'banner1.jpg', 1, CAST(N'2021-11-16 20:21:25.883' AS DateTime), N'Mid')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (5, N'banner2.jpg', 1, CAST(N'2021-11-16 20:21:25.883' AS DateTime), N'Mid')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (6, N'banner3.jpg', 1, CAST(N'2021-11-16 20:21:25.883' AS DateTime), N'Mid')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (7, N'banner4.jpg', 1, CAST(N'2021-11-16 20:21:25.883' AS DateTime), N'Mid')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (8, N'banner5.jpg', 1, CAST(N'2021-11-16 20:21:25.887' AS DateTime), N'Mid')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (9, N'banner6.jpg', 1, CAST(N'2021-11-16 20:21:25.887' AS DateTime), N'Mid')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (10, N'banner7.jpg', 1, CAST(N'2021-11-16 20:21:25.887' AS DateTime), N'Mid')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (11, N'QC1.jpg', 1, CAST(N'2021-11-16 20:21:28.650' AS DateTime), N'Adv')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (12, N'QC2.jpg', 1, CAST(N'2021-11-16 20:21:28.650' AS DateTime), N'Adv')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (13, N'QC3.jpg', 1, CAST(N'2021-11-16 20:21:28.650' AS DateTime), N'Adv')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (14, N'QC4.jpg', 1, CAST(N'2021-11-16 20:21:28.650' AS DateTime), N'Adv')
INSERT [dbo].[Banner] ([id], [image_], [active], [dateUpdate], [BannerType]) VALUES (16, N'Logo.png', 1, CAST(N'2021-11-16 21:57:54.017' AS DateTime), N'Logo')
SET IDENTITY_INSERT [dbo].[Banner] OFF
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([cartID], [proID], [proPrice], [CartQuantity], [CartMoney], [cusID]) VALUES (6, N'LAP000004', 40250000, 1, 40250000, 1004)
INSERT [dbo].[Cart] ([cartID], [proID], [proPrice], [CartQuantity], [CartMoney], [cusID]) VALUES (7, N'LAP000031', 55650000, 1, 55650000, 1003)
INSERT [dbo].[Cart] ([cartID], [proID], [proPrice], [CartQuantity], [CartMoney], [cusID]) VALUES (8, N'LAP000032', 34639500, 1, 34639500, 1003)
INSERT [dbo].[Cart] ([cartID], [proID], [proPrice], [CartQuantity], [CartMoney], [cusID]) VALUES (9, N'LAP000033', 37789500, 1, 37789500, 1003)
SET IDENTITY_INSERT [dbo].[Cart] OFF
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11172022PN000000', N'LAP000025', 10, 500000, CAST(12 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11172022PN000001', N'LAP000026', 20, 500000, CAST(10 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11172022PN000002', N'LAP000027', 50, 2540000, CAST(5 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11172022PN000003', N'LAP000028', 100, 3740000, CAST(5 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11172022PN000004', N'LAP000029', 100, 3900000, CAST(5 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11172022PN000005', N'LAP000030', 100, 295000, CAST(5 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11182022PN000006', N'LAP000031', 100, 53000000, CAST(5 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11182022PN000007', N'LAP000032', 100, 32990000, CAST(5 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11182022PN000008', N'LAP000033', 100, 35990000, CAST(5 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11182022PN000009', N'LAP000034', 100, 33000000, CAST(5 AS Decimal(32, 0)))
INSERT [dbo].[ChiTietPhieuNhap] ([PhieuNhap_id], [product_id], [quanlity], [price_Import], [ratio]) VALUES (N'11182022PN000010', N'LAP000035', 100, 41000000, CAST(5 AS Decimal(32, 0)))
SET IDENTITY_INSERT [dbo].[CustomerAddress] ON 

INSERT [dbo].[CustomerAddress] ([ID_address], [cusID], [Name_Address]) VALUES (4, 1003, N'Số 438A ,Phường 5,Thành phố Bến Tre,Tỉnh Bến Tre')
INSERT [dbo].[CustomerAddress] ([ID_address], [cusID], [Name_Address]) VALUES (5, 1003, N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh')
INSERT [dbo].[CustomerAddress] ([ID_address], [cusID], [Name_Address]) VALUES (7, 1004, N'Số 113,Phường 5,Thành phố Bến Tre,Tỉnh Bến Tre')
INSERT [dbo].[CustomerAddress] ([ID_address], [cusID], [Name_Address]) VALUES (8, 1004, N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh')
INSERT [dbo].[CustomerAddress] ([ID_address], [cusID], [Name_Address]) VALUES (9, 1004, N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh')
INSERT [dbo].[CustomerAddress] ([ID_address], [cusID], [Name_Address]) VALUES (10, 1004, N'Số 113,Phường 5,Thành phố Bến Tre,Tỉnh Bến Tre')
SET IDENTITY_INSERT [dbo].[CustomerAddress] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([cusID], [cusName], [cusEmail], [cusPhone], [cusPassword], [cusAddress], [cusType], [cusStatus], [cusPhoto]) VALUES (1003, N'Nguyễn Nam', N'nguyennhutnam@gmail.com', N'0339906489 ', N'123       ', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 1, 1, NULL)
INSERT [dbo].[Customers] ([cusID], [cusName], [cusEmail], [cusPhone], [cusPassword], [cusAddress], [cusType], [cusStatus], [cusPhoto]) VALUES (1004, N'Bùi Thị KimQuyên', N'quin.12177@gmail.com', N'0397495029 ', N'123       ', N'Số 113,Phường 5,Thành phố Bến Tre,Tỉnh Bến Tre', 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[Customers] OFF
INSERT [dbo].[Customertype] ([CusType], [CusTypeName]) VALUES (1, N'Khách hàng thường')
INSERT [dbo].[Customertype] ([CusType], [CusTypeName]) VALUES (2, N'Khách hàng thân thiết')
INSERT [dbo].[Customertype] ([CusType], [CusTypeName]) VALUES (3, N'Khách VIP')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000000', N'Macbook 12 inch - Hoàn hảo hơn với vỏ nhôm nguyên khối sang trọng, siêu mỏng và siêu nhẹ', N'Nhiều lúc, mọi người không biết họ muốn gì cho tới khi bạn chỉ cho họ” - Nhà sáng lập Apple Steve Jobs đã từng nói và làm như vậy. Kết quả là Apple luôn mang lại những sản phẩm đỉnh cao nhưng cũng cực kỳ tinh tế khiến người dùng không thể rời mắt. Macbook 12 inch là một minh chứng. Thiết kế khó có thể hoàn hảo hơn với vỏ nhôm nguyên khối sang trọng, siêu mỏng và siêu nhẹ, một màn hình với độ phân giải khủng cùng nhiều tính năng đặc trưng của dòng Macbook đầy thành công của Apple.', N'lap000000.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000001', N'Chắc chắn hơn bao giờ hết nhờ độ bền chuẩn quân đội, laptop Asus Zenbook UX325EA (KG363T) sở hữu kiểu dáng tinh tế cùng hiệu năng tối ưu nhờ CPU Intel thế hệ 11, giúp bạn xử lý nhanh gọn và chính xác mọi tác vụ.', N'Laptop được trang bị chip Intel Core i5 Tiger Lake 1135G7 giúp bạn hoàn thành công việc nhanh chóng, từ các tác vụ văn phòng như word, excel,... đến các công việc sáng tạo, đồ họa khác với tốc độ CPU 2.40 GHz và đạt tối đa đến 4.2 GHz nhờ Turbo Boost.Đem đến khả năng xử lý hình ảnh sắc nét lên đến chuẩn 8K nhờ card đồ họa tích hợp Intel Iris Xe Graphics, đáp ứng mọi nhu cầu của người dùng với những trải nghiệm chân thật cùng các tựa game hấp dẫn hay thỏa sức sáng tạo với các ứng dụng đồ họa như Photoshop, Ai, Lightroom,...RAM 8 GB LPDDR4X (On board) với tốc độ bus RAM 4267 MHz cho bạn sự đa nhiệm khi có thể mở nhiều ứng dụng cùng lúc và chuyển đổi qua lại một cách mượt mà.', N'lap000001.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000025', N'Vẻ ngoài đơn giản, màu sắc sang trọng', N'Cáp sạc Apple này sở hữu thiết kế khá gọn nhẹ, đầu cáp và lõi dây được chế tác từ vật liệu chất lượng, đảm bảo độ an toàn khi sử dụng. Phần vỏ bọc được phủ màu trắng trang nhã, chất liệu bền bỉ, mềm mại, sử dụng lâu dài.', N'mt_use_c_1m_white.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000026', N'Sạc pin nhanh chóng, truyền dữ liệu tiện lợi', N'Cáp sạc USB-C 1m MM093 sở hữu đầu nối USB-C ở cả hai đầu, lý tưởng để sạc, đồng bộ hóa và truyền dữ liệu giữa các thiết bị USB-C. Ghép nối cáp sạc USB-C với Adapter USB-C tương thích để sạc thiết bị của bạn một cách thuận tiện và tận dụng khả năng sạc nhanh.', N'cap-sac-usb-c-1m-mm093.png')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000027', N'Thiết kế mỏng nhẹ, vừa tay', N'Với khối lượng chỉ khoảng 80 g, bề mặt nhẵn mịn, chuột Apple này cho bạn cảm giác cầm cực kỳ nhẹ nhàng và êm ái. Phần đáy chuột được thiết kế tối ưu, cho phép di chuột dễ dàng trên mặt phẳng.

Khi lấy chuột ra, nó sẽ tự động ghép nối qua Bluetooth với chiếc iMac hoặc MacBook đã được kết nối trước đó.', N'mt-chuot-bluetooth-apple-mmmq3.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000028', N'Nội dung', N'Magic Keyboard nay có Touch ID, giúp xác thực nhanh chóng, dễ dàng và bảo mật mỗi lần đăng nhập và mua hàng. Magic Keyboard với Touch ID và Numeric Keypad đem lại trải nghiệm gõ phím thoải mái và chính xác ấn tượng. Bàn phím đặc biệt có cách bố trí mở rộng, với các nút điều khiển điều hướng tài liệu để kéo nhanh và các phím mũi tên kích thước chuẩn, cực kỳ phù hợp để chơi game. Numeric Keypad cũng rất hữu dụng khi thực hiện các bảng tính và sử dụng những ứng dụng tài chính. Bàn phím còn có thể kết nối không dây và sạc lại được, với thời lượng pin dài và bàn phím hoạt động trong một tháng hoặc lâu hơn sau mỗi lần sạc.1 Bàn phím tự động kết nối với Mac, để bạn có thể làm việc ngay lập tức. Ngoài ra, bàn phím còn có cáp chuyển đổi từ USB-C sang Lightning để bạn kết nối với cổng USB-C trên MacBook để sạc.', N'banphim-mk2c3.png')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000029', N'Nâng tầm trải nghiệm với chất lượng âm thanh sống động, chân thực', N'Tai nghe chống ồn WH-XB910N nâng cao chất lượng các âm ở tần số thấp để mang đến âm trầm vượt trội. Đường dẫn âm trầm riêng trên vỏ tai nghe cùng độ kín khí tốt hơn giữa bộ củ loa và màng nhĩ giúp tạo nên nhịp điệu chính xác và mạnh mẽ để mọi bản nhạc đều hay hơn.

Tai nghe không dây này còn giữ được độ rõ của giọng hát để mang lại cho bạn trải nghiệm nghe trọn vẹn, đong đầy cảm xúc. ', N'chup-tai-bluetooth-sony-wh.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000030', N'Nội dung', N'• Túi chống sốc được thiết kế tối giản, ôm trọn thiết bị cần bảo vệ.

• Có thể sử dụng túi cho laptop, máy tính bảng có kích thước 14 inch.

• Chất liệu bền bỉ, lớp lót với độ dày vừa phải giúp người dùng vừa không bị cấn khi mang đi vừa có độ đàn hồi tốt.

• Siêu nhẹ, siêu bền, túi chống sốc này chắc chắn có thể đồng hành cùng thiết bị của bạn một khoảng thời gian khá dài.', N'tui_chong_soc.png')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000031', N'Nội dung về tính năng', N'MacBook Pro mới mang đến hiệu năng cao ấn tượng cho người dùng pro. Lựa chọn M1 Pro mạnh mẽ hay M1 Max còn mạnh hơn thế để tăng tốc xử lý các luồng công việc đẳng cấp pro cùng thời lượng pin đáng kinh ngạc.1 Với màn hình Liquid Retina XDR 14 inch sống động và nhiều cổng kết nối chuyên nghiệp, bạn có thể làm được nhiều việc hơn bao giờ hết với MacBook Pro.', N'mac_pro_m1_2021_4.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000032', N'Nội dung về tính năng', N'Siêu mạnh mẽ với chip M2 thế hệ tiếp theo, MacBook Air được thiết kế mới, kết hợp giữa hiệu năng đáng kinh ngạc và thời lượng pin lên đến 18 giờ trong vỏ nhôm mỏng ấn tượng.', N'macbook-air-m2-2022-8-core-gpu-xám-650x650 - Copy.png')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000033', N'Nội dung về tính năng', N'MacBook Pro 13 inch nay đa năng hơn bao giờ hết. Siêu mạnh mẽ với chip M2 thế hệ tiếp theo, đây là chiếc máy tính xách tay chuyên nghiệp nhỏ gọn nhất của Apple, cùng thời lượng pin lên đến 20 giờ.', N'apple-macbook-pro-13-inch-m2-2022-1-1-650x650_2.jpg')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000034', N'Nội dung về tính năng', N'Chip Apple M1 định nghĩa lại MacBook Pro 13 inch. Sở hữu CPU 8 lõi xử lý siêu tốc các luồng công việc phức hợp trong lĩnh vực hình ảnh, mã hóa, biên tập video cùng nhiều việc khác. GPU 8 lõi siêu mạnh xử lý gọn các tác vụ đồ họa khủng và chạy game siêu mượt. Neural Engine 16 lõi tiên tiến tăng cường sức mạnh công nghệ máy học tích hợp trong các ứng dụng yêu thích của bạn. Bộ nhớ thống nhất siêu nhanh cho mọi hoạt động mượt mà. Và thời lượng pin dài nhất từng có trên máy Mac, lên đến 20 giờ.2 Đây chính là chiếc máy tính xách tay chuyên nghiệp thịnh hành nhất của Apple. Hiệu năng cao hơn hẳn, pro hơn hẳn.', N'macbook-pro-13-spgry-m1-thumb-650x650.png')
INSERT [dbo].[Description] ([product_id], [title], [content], [image_]) VALUES (N'LAP000035', N'Nội dung về tính năng', N'MacBook Pro 13 inch nay đa năng hơn bao giờ hết. Siêu mạnh mẽ với chip M2 thế hệ tiếp theo, đây là chiếc máy tính xách tay chuyên nghiệp nhỏ gọn nhất của Apple, cùng thời lượng pin lên đến 20 giờ.', N'apple-pro-m2-2022-10-core-gpu-xam-650x650.png')
SET IDENTITY_INSERT [dbo].[Detail] ON 

INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (20, N'LAP000000', N'Intel Core i7 Tiger Lake - 11800H', N'8', N'16', N'2.30 GHz', N'Turbo Boost 4.6 GHz', N'2424 MB', N'8 GB', N'DDR4 2 khe (1 khe 8GB + 1 khe rời)', N'3200 MHz', N'32 GB', N'Hỗ trợ khe cắm HDD SATA (nâng cấp tối đa 2TB)|Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng|512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)', N'15.6 inch', N'Full HD (1920 x 1080)', N'144 Hz', N'Acer ComfyView|LED Backlit|Tấm nền IPS', N'Card rời - NVIDIA GeForce RTX3050Ti, 4 GB', N'Acer TrueHarmony, DTS X:Ultra Audio', N'3 x USB 3.2|HDMI|Jack tai nghe 3.5 mm|LAN (RJ45)|USB Type-C', N'Bluetooth 5.1, Wi-Fi 6 (802.11ax)', N'HD webcam', N'Đèn bàn phím chuyển màu RGB', N'Có', N'Dài 363.4 mm - Rộng 255 mm - Dày 23.9 mm - Nặng 2.2 kg', N'Vỏ nhựa', N'4-cell Li-ion, 57 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (21, N'LAP000001', N'Intel Core i5 Tiger Lake - 1135G7', N'4', N'8', N'2.40 GHz', N'Turbo Boost 4.2 GHz', N' 8 MB', N' 8 GB', N'LPDDR4X (On board)', N'4267 MHz', N'Không hỗ trợ nâng cấp', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)', N'13.3 inch', N'Full HD (1920 x 1080) OLED', N'60 Hz', N'100% DCI-P3|400 nits|OLED', N'Card tích hợp - Intel Iris Xe Graphics', N'Audio by Harman/Kardon', N'1 x USB 3.2|2 x Thunderbolt 4 USB-C|HDMI', N'Bluetooth 5.0, Wi-Fi 6 (802.11ax)', N'Camera IR, HD webcam', N'Mở khóa khuôn mặt, Độ bền chuẩn quân đội MLT STD 810G', N'  Có', N'Dài 304.2 mm - Rộng 203 mm - Dày 13.9 mm - Nặng 1.14 kg', N'Vỏ kim loại nguyên khối', N'4-cell Li-ion, 67 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (22, N'LAP000002', N'Intel Core i7 Tiger Lake - 11370H', N'4', N'8', N'3.30 GHz', N'Turbo Boost 4.8 GHz', N'12 MB', N' 8 GB', N'DDR4 2 khe (1 khe 8GB onboard + 1 khe trống)', N'3200 MHz', N'32 GB', N'Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB), 512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB)', N'15.6 inch', N' Full HD (1920 x 1080)', N'144 Hz', N'250 nits|Adaptive-Sync|Chống chói Anti Glare|Tấm nền IPS', N'Card rời - NVIDIA GeForce RTX3050, 4 GB', N'DTS Audio', N'3 x USB 3.2| HDMI|Jack tai nghe 3.5 mm|LAN (RJ45)|Thunderbolt 4 USB-C', N'Bluetooth 5.1, Wi-Fi 6 (802.11ax)', N'Không tích hợp', N'Có', N'', N' Dài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg', N'Vỏ nhựa - nắp lưng bằng kim loại', N'4-cell Li-ion, 76 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (23, N'LAP000003', N'Intel Core i7 Tiger Lake - 11800H', N'8', N'16', N'2.30 GHz', N'Turbo Boost 4.6 GHz', N'24 MB', N'8 GB', N'DDR4 2 khe (1 khe 8GB + 1 khe rời)', N' 3200 MHz', N'32 GB', N'SSD 512 GB NVMe PCIe, Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng', N' 17.3 inch', N'Full HD (1920 x 1080)', N'144 Hz', N'Tấm nền IPS|Chống chói Anti Glare|250 nits', N'Card rời - NVIDIA GeForce RTX3050Ti, 4 GB', N'DTS Audio', N'Jack tai nghe 3.5 mm|Thunderbolt 4 USB-C|3 x USB 3.2 |HDMI|LAN (RJ45)', N' Bluetooth 5.2, Wi-Fi 6 (802.11ax)', N'HD webcam', N' Đèn bàn phím chuyển màu RGB', N'Có', N'Dài 399 mm - Rộng 269 mm - Dày 23.9 mm - Nặng 2.6 kg', N'Vỏ nhựa - nắp lưng bằng kim loại', N'3-cell Li-ion, 48 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (24, N'LAP000004', N'AMD Ryzen 9 - 5900HS', N'6', N'16', N'3.00 GHz', N'Turbo Boost 4.6 GHz', N'16 MB', N'16 GB', N'DDR4 2 khe (8GB onboard+ 1 khe 8GB)', N'3200 MHz', N'24 GB', N'Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe 3.0 mở rộng (nâng cấp dung lượng không giới hạn), 1 TB SSD M.2 PCIe 3.0 (Có thể tháo ra, lắp thanh khác dung lượng không giới hạn)', N'14 inch', N'QHD (2560 x 1440)', N'120 Hz', N'100% DCI-P3|Chống chói Anti Glare|Công nghệ IPS|Độ sáng 300 nits', N'Card rời - NVIDIA GeForce RTX3050Ti, 4 GB', N'Công nghệ Smart AMP, Dolby Atmos', N'1x USB 3.2 Gen 2 Type-C support DisplayPort / power delivery / G-SYNC|2 x USB 3.2|HDMI|Jack tai nghe 3.5 mm|USB Type-C', N'Bluetooth 5.1, Wi-Fi 6 (802.11ax)', N'Không tích hợp', N'Bảo mật vân tay', N'Có', N'Dài 324 mm - Rộng 220 mm - Dày 19.9 mm - Nặng 1.7 kg', N' Vỏ nhựa - nắp lưng bằng kim loại', N'4-cell Li-ion, 76 Wh', N'Windows 10 Home SL', N' 2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (25, N'LAP000005', N'Intel Core i7 Tiger Lake - 1165G7', N'4', N'8', N'2.80 GHz', N'Turbo Boost 4.7 GHz', N'12 MB', N'16 GB', N'LPDDR4X (On board)', N'4267 MHz', N'Không hỗ trợ nâng cấp', N'1 TB SSD M.2 PCIe', N'13.3 inch', N'4K/UHD (3840 x 2160), OLED', N'', N'100% DCI-P3|400 nits|OLED|Tấm nền IPS', N'Card tích hợp - Intel Iris Xe Graphics', N'Audio by Harman/Kardon', N'1 x USB 3.2|2 x Thunderbolt 4 USB-C|HDMI', N'Bluetooth 5.0,Wi-Fi 6 (802.11ax)', N'Camera IR', N'Mở khóa khuôn mặt|Tiêu chuẩn Nền Intel Evo|Độ bền chuẩn quân đội MLT STD 810G', N'Có', N'Dài 305 mm - Rộng 211 mm - Dày 13.9 mm - Nặng 1.2 kg', N'Vỏ kim loại nguyên khối', N'4-cell Li-ion, 67 Wh', N'Windows 10 Home SL + Office Home & Student 2019 vĩnh viễn', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (26, N'LAP000006', N'Intel Core i7 Tiger Lake - 1165G7', N'4', N'8', N'2.80 GHz', N'Turbo Boost 4.7 GHz', N'12 MB', N'16 GB', N'LPDDR4X (On board)', N'4267 MHz', N'Không hỗ trợ nâng cấp', N'1 TB SSD M.2 PCIe', N'14 inch', N'Full HD (1920 x 1080)', N'60 Hz', N'100% sRGB|400 nits|Chống chói Anti Glare|LED Backlit|Tấm nền IPS', N'Card tích hợp - Intel Iris Xe Graphics', N'Audio by Harman/Kardon', N'1 x USB 3.2|2 x Thunderbolt 4 USB-C|HDMI|Jack tai nghe 3.5 mm', N'Bluetooth 5.0,Wi-Fi 6 (802.11ax)', N'Camera IR,HD webcam', N'Mở khóa khuôn mặt|ScreenPad Plus 12.65 inch (1920 x 515 IPS Panel)|Độ bền chuẩn quân đội MLT STD 810H', N'Có', N'Dài 324 mm - Rộng 222 mm - Dày 17.3 mm - Nặng 1.62 kg', N'Vỏ kim loại', N'4-cell Li-ion, 70 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (27, N'LAP000007', N'Intel Core i7 Tiger Lake - 1165G7', N'4', N'8', N'2.80 GHz', N'Turbo Boost 4.7 GHz', N'12 MB', N'16 GB', N'LPDDR4X (On board)', N'4267 MHz', N'Không hỗ trợ nâng cấp', N'Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 2TB)1 TB SSD M.2 PCIe (Có thể tháo ra, lắp thanh khác tối đa 2TB)', N'14 inch', N'Full HD (1920 x 1080)', N'60 Hz', N'100% sRGB|400 nits|Chống chói Anti Glare|LED Backlit|Màn hình Wide View', N'Card tích hợp - Intel Iris Xe Graphics', N'Audio by Harman/Kardon', N'1 x USB 3.2|2 x Thunderbolt 4 USB-C|HDMI|Jack tai nghe 3.5 mm|Micro HDMI', N'Bluetooth 5.2,Wi-Fi 6 (802.11ax)', N'Camera IR,HD webcam', N'Bản lề mở 180 độ|Bảo mật vân tay|Mở khóa khuôn mặt|Numberpad|TPM 2.0|Độ bền chuẩn quân đội MLT STD 810H', N'Có', N'Dài 320 mm - Rộng 203 mm - Dày 14.9 mm - Nặng 1.01 kg', N'Hợp kim Lithium-Magie', N'không công bố', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (28, N'LAP000008', N'Intel Core i7 Tiger Lake - 1165G7', N'4', N'8', N'2.80 GHz', N'Turbo Boost 4.7 GHz', N'12 MB', N'16 GB', N'LPDDR4X (On board)', N'4267 MHz', N'Không hỗ trợ nâng cấp', N'SSD 512 GB NVMe PCIe', N'13.3 inch', N'Full HD (1920 x 1080) OLED', N'60 Hz', N'100% DCI-P3|400 nits|OLED', N'Card tích hợp - Intel Iris Xe Graphics', N'Audio by Harman/Kardon,SonicMaster audio', N'1 x USB 3.2|2 x Thunderbolt 4 USB-C|HDMI', N'Bluetooth 5.0,Wi-Fi 6 (802.11ax)', N'Camera IR,HD webcam', N'Mở khóa khuôn mặt|Numberpad|Độ bền chuẩn quân đội MLT STD 810G', N'Có', N'Dài 305 mm - Rộng 211 mm - Dày 11.9 mm - Nặng 1.3 kg', N'Vỏ kim loại nguyên khối', N'4-cell Li-ion, 67 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (30, N'LAP000010', N'Intel Core i7 Tiger Lake - 11370H', N'4', N'8', N'3.30 GHz', N'Turbo Boost 4.8 GHz', N'12 MB', N'16 GB', N'DDR4 2 khe (8GB onboard+ 1 khe 8GB)', N'3200 MHz', N'32 GB', N'Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng,SSD 512 GB NVMe PCIe', N'15.6 inch', N'Full HD (1920 x 1080)', N'144 Hz', N'Adaptive-Sync|Chống chói Anti Glare|Tấm nền IPS', N'Card rời - NVIDIA GeForce RTX 3060, 6 GB', N'DTS Audio', N'3 x USB 3.2|HDMI 2.0|Jack tai nghe 3.5 mm|LAN (RJ45)|Thunderbolt 4 USB-C', N'Bluetooth 5.1,Wi-Fi 6 (802.11ax)', N'Không tích hợp', N'', N'Có', N'Dài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg', N'Vỏ nhựa - nắp lưng bằng kim loại', N'4-cell Li-ion, 76 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (31, N'LAP000011', N'Intel Core i5 Tiger Lake - 1135G7', N'4', N'8', N'2.40 GHz', N'Turbo Boost 4.2 GHz', N'8 MB', N'8 GB', N'LPDDR4X (On board)', N'4267 MHz', N'Không hỗ trợ nâng cấp', N'SSD 512 GB NVMe PCIe', N'14 inch', N'Full HD (1920 x 1080)', N'60 Hz', N'100% sRGB|400 nits|Chống chói Anti Glare|LED Backlit|Tấm nền IPS', N'Card tích hợp - Intel Iris Xe Graphics', N'Audio by Harman/Kardon', N'1 x USB 3.2|2 x Thunderbolt 4 USB-C|HDMI |Jack tai nghe 3.5 mm', N'Bluetooth 5.0,Wi-Fi 6 (802.11ax)', N'Camera IR,HD webcam', N'Mở khóa khuôn mặt|ScreenPad Plus 12.65 inch (1920 x 515 IPS Panel)|Độ bền chuẩn quân đội MLT STD 810H', N'Có', N'Dài 324 mm - Rộng 222 mm - Dày 17.3 mm - Nặng 1.62 kg', N'Vỏ kim loại', N'4-cell Li-ion, 70 Wh', N'Windows 10 Home SL', N'Windows 10 Home SL')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (33, N'LAP000013', N'Intel Core i7 Tiger Lake - 11370H', N'4', N'8', N'3.30 GHz', N'Turbo Boost 4.8 GHz', N'12 MB', N'8 GB', N'DDR4 2 khe (1 khe 8GB onboard + 1 khe trống)', N'3200 MHz', N'32 GB', N'Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB) Màn hình', N'15.6 inch', N'Full HD (1920 x 1080)', N'144 Hz', N'Adaptive-Sync|Chống chói Anti Glare|Tấm nền IPS', N'Card rời - NVIDIA GeForce RTX 3060, 6 GB', N'DTS Audio', N'3 x USB 3.2|HDMI 2.0|Jack tai nghe 3.5 mm|LAN (RJ45)|Thunderbolt 4 USB-C', N'Bluetooth 5.1,Wi-Fi 6 (802.11ax)', N'Không tích hợp', N'', N'Có', N'Dài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg', N'Vỏ nhựa - nắp lưng bằng kim loại', N'4-cell Li-ion, 76 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (34, N'LAP000014', N'Intel Core i7 Tiger Lake - 1165G7', N'4', N'8', N'2.80 GHz', N'Turbo Boost 4.7 GHz', N'12 MB', N'16 GB', N'LPDDR4X (On board)', N'4267 MHz', N'Không hỗ trợ nâng cấp', N'SSD 512 GB NVMe PCIe', N'14 inch', N'Full HD (1920 x 1080)', N'60 Hz', N'Tấm nền IPS|Chống chói Anti Glare|LED Backlit|100% sRGB|400 nits', N'Card tích hợp - Intel Iris Xe Graphics', N'Audio by Harman/Kardon', N'2 x Thunderbolt 4 USB-C|1 x USB 3.2|HDMI', N'Bluetooth 5.0,Wi-Fi 6 (802.11ax)', N'HD webcam,Camera IR', N'Độ bền chuẩn quân đội MLT STD 810G,Mở khóa khuôn mặt', N'Có', N'Dài 319 mm - Rộng 208 mm - Dày 13.9 mm - Nặng 1.17 kg', N'Vỏ kim loại nguyên khối', N'4-cell Li-ion, 67 Wh', N'Windows 10 Home SL', N'2020')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (35, N'LAP000015', N'Intel Core i7 Tiger Lake - 11370H', N'4', N'8', N'3.30 GHz', N'Turbo Boost 4.8 GHz', N'12 MB', N'8 GB', N'DDR4 2 khe (1 khe 8GB onboard + 1 khe trống)', N'3200 MHz', N'32 GB', N'SSD 512 GB NVMe PCIe,Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng', N'15.6 inch', N'Full HD (1920 x 1080)', N'144 Hz', N'Tấm nền IPS|Chống chói Anti Glare|Adaptive-Sync|250 nits', N'Card rời - NVIDIA GeForce RTX3050Ti, 4 GB', N'Stereo speakers,DTS X:Ultra Audio', N'Jack tai nghe 3.5 mm|Thunderbolt 4 USB-C|3 x USB 3.2|HDMI|LAN (RJ45)', N'Bluetooth 5.1, Wi-Fi 6 (802.11ax)', N'Không tích hợp', N'', N'Có', N'Dài 360 mm - Rộng 252 mm - Dày 19.9 mm - Nặng 2 kg', N'Vỏ nhựa - nắp lưng bằng kim loại', N'4-cell Li-ion, 76 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (38, N'LAP000018', N'Intel Core i7 Tiger Lake - 11800H', N'8', N'16', N'2.30 GHz', N'Turbo Boost 4.6 GHz', N'24 MB', N'8 GB', N'DDR4 2 khe (1 khe 8GB + 1 khe rời)', N'3200 MHz', N'32 GB', N'512 GB SSD NVMe PCIe (Có thể tháo ra, lắp thanh khác tối đa 1TB),Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB)', N'17.3 inch', N'Full HD (1920 x 1080)', N'144 Hz', N'250 nits|Chống chói Anti Glare|Tấm nền IPS', N'Card rời - NVIDIA GeForce RTX3050, 4 GB', N'DTS Audio', N'3 x USB 3.2|HDMI|Jack tai nghe 3.5 mm|LAN (RJ45)|Thunderbolt 4 USB-C', N'Bluetooth 5.2,Wi-Fi 6 (802.11ax)', N'HD webcam', N'Đèn bàn phím chuyển màu RGB', N'Có', N'Dài 399 mm - Rộng 269 mm - Dày 23.9 mm - Nặng 2.6 kg', N'Vỏ nhựa - nắp lưng bằng kim loại', N'3-cell Li-ion, 48 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (39, N'LAP000019', N'AMD Ryzen 7 - 5800HS', N'8', N'16', N'3.00 GHz', N'Turbo Boost 4.3 GHz', N'16 MB', N'8 GB', N'DDR4 2 khe (1 khe 8GB onboard + 1 khe trống)', N'3200 MHz', N'24 GB', N'SSD 512 GB NVMe PCIe', N'14 inch', N'Full HD (1920 x 1080)', N'144 Hz', N'Tấm nền IPS|Chống chói Anti Glare|100% sRGB|Độ sáng 300 nits', N'Card rời - NVIDIA GeForce GTX 1650 4 GB', N'Dolby Atmos', N'Jack tai nghe 3.5 mm|1x USB 3.2 Gen 2 Type-C support DisplayPort / power delivery / G-SYNC|2 x USB 3.2|HDMI|USB Type-C', N'Bluetooth 5.1, Wi-Fi 6 (802.11ax)', N'Không tích hợp', N'Bảo mật vân tay', N'Có', N'Dài 324 mm - Rộng 220 mm - Dày 17.9 mm - Nặng 1.6 kg', N'Vỏ nhựa - nắp lưng bằng kim loại', N'4-cell Li-ion, 76 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (40, N'LAP000020', N'Intel Core i7 Tiger Lake - 11800H', N'8', N'16', N'2.30 GHz', N'Turbo Boost 4.6 GHz', N'24 MB', N'8 GB', N'DDR4 2 khe (1 khe 8GB + 1 khe rời)', N'3200 MHz', N'32 GB', N'Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB),SSD 512 GB NVMe PCIe', N'15.6 inch', N'Full HD (1920 x 1080)', N'144 Hz', N'Chống chói Anti Glare|LED Backlit|Tấm nền IPS', N'Card rời - NVIDIA GeForce RTX3050, 4 GB', N'DTS X:Ultra Audio', N'3 x USB 3.0|HDMI|Jack tai nghe 3.5 mm|LAN (RJ45)|USB Type-C', N'Bluetooth 5.2,Wi-Fi 6 (802.11ax)', N'HD webcam', N'Đèn bàn phím chuyển màu RGB', N'Có', N'Dài 359 mm - Rộng 256 mm - Dày 24.9 mm - Nặng 2.3 kg', N'Vỏ nhựa - nắp lưng bằng kim loại', N'3-cell Li-ion, 48 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (41, N'LAP000021', N'Intel Core i5 Tiger Lake - 11400H', N'6', N'12', N'2.70 GHz', N'Turbo Boost 4.5 GHz', N'12 MB', N'8 GB', N'DDR4 2 khe (1 khe 8GB + 1 khe rời)', N'3200 MHz', N'32 GB', N'SSD 512 GB NVMe PCIe,Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng', N'17.3 inch', N'Full HD (1920 x 1080)', N'144 Hz', N'Tấm nền IPS|Chống chói Anti Glare|250 nits', N'Card rời - NVIDIA GeForce RTX3050, 4 GB', N'DTS Audio', N'Jack tai nghe 3.5 mm|Thunderbolt 4 USB-C|3 x USB 3.0|HDMI|LAN (RJ45)', N'Bluetooth 5.2,Wi-Fi 6 (802.11ax)', N'HD webcam', N'Đèn bàn phím chuyển màu RGB', N'Có', N'Dài 399 mm - Rộng 269 mm - Dày 23.9 mm - Nặng 2.6 kg', N'Vỏ nhựa - nắp lưng bằng kim loại', N'3-cell Li-ion, 48 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (42, N'LAP000022', N'Intel Core i5 Tiger Lake - 11400H', N'6', N'12', N'2.70 GHz', N'Turbo Boost 4.5 GHz', N'12 MB', N'8 GB', N'DDR4 2 khe (1 khe 8GB + 1 khe rời)', N'3200 MHz', N'32 GB', N'Hỗ trợ thêm 1 khe cắm SSD M.2 PCIe mở rộng (nâng cấp tối đa 1TB), SSD 512 GB NVMe PCIe', N'15.6 inch', N'Full HD (1920 x 1080)', N'144 Hz', N'Chống chói Anti Glare|LED Backlit|Tấm nền IPS', N'Card rời - NVIDIA GeForce RTX3050, 4 GB', N'DTS X:Ultra Audio', N'3 x USB 3.2|HDMI|Jack tai nghe 3.5 mm|LAN (RJ45)|USB Type-C', N'Bluetooth 5.2,Wi-Fi 6 (802.11ax)', N'HD webcam', N'Đèn bàn phím chuyển màu RGB', N'Có', N'Dài 359 mm - Rộng 256 mm - Dày 24.9 mm - Nặng 2.3 kg', N'Vỏ nhựa - nắp lưng bằng kim loại', N'3-cell Li-ion, 48 Wh', N'Windows 10 Home SL', N'2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (43, N'LAP000023', N'Intel Core i7 Tiger Lake - 1165G7', N'4', N'8', N'2.80 GHz', N'Turbo Boost 4.7 GHz', N'12 MB', N'8 GB', N'LPDDR4X (On board)', N'2933 MHz', N'Không hỗ trợ nâng cấp', N'SSD 512 GB NVMe PCIe', N'13.3 inch', N'Full HD (1920 x 1080)', N'60 Hz', N'400 nits|Tấm nền IPS|Wled-backlit', N'Card tích hợp - Intel Iris Xe Graphics', N'Bang & Olufsen audio', N'2 x USB 3.1|Jack tai nghe 3.5 mm|Thunderbolt 4 USB-C', N'Bluetooth 5.0,Wi-Fi 6 (802.11ax)', N'HD webcam', N'Bảo mật vân tay|Công tắc khóa camera|Tiêu chuẩn Nền Intel Evo', N'Có', N'Dài 306.5 mm - Rộng 194.6 mm - Dày 16.9 mm - Nặng 1.236 kg', N'Vỏ kim loại nguyên khối', N'3-cell Li-ion', N'Windows 10 Home SL + Office Home & Student 2019 vĩnh viễn', N'2020')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (48, N'LAP000025', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (49, N'LAP000026', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (50, N'LAP000027', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (51, N'LAP000028', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (52, N'LAP000029', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (53, N'LAP000030', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (54, N'LAP000031', N'Apple M1 Pro', N'8', N'Hãng không công bố', N'200GB/s memory bandwidth', N'Hãng không công bố', N'Hãng không công bố', N'16 GB', N'Hãng không công bố', N'Hãng không công bố', N'Không hỗ trợ nâng cấp', N'SSD 512 GB', N'14.2 inch', N'Liquid Retina XDR display (3024 x 1964)', N'up to 120Hz', N'ProMotion Wide color (P3) Công nghệ True Tone 1 billion colors', N'Card tích hợp - 14 core-GPU', N'Wide stereo sound Hệ thống âm thanh 6 loa Dolby Atmos', N'3 x Thunderbolt 4 USB-C Jack tai nghe 3.5 mm HDMI', N'Bluetooth 5.0 Wi-Fi 6 (802.11ax)', N'1080p FaceTime HD camera', N'Sạc MagSafe Bảo mật vân tay', N'Có', N'Dài 312.6 mm - Rộng 221.2 mm - Dày 15.5 mm - Nặng 1.6 kg', N'Vỏ kim loại nguyên khối', N'Khoảng 10 tiếng', N'Mac OS', N'10/2021')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (55, N'LAP000032', N'Apple M2', N'8', N'Hãng không công bố', N'100GB/s memory bandwidth', N'Hãng không công bố', N'Hãng không công bố', N'8 GB', N'Hãng không công bố', N'Hãng không công bố', N'Không hỗ trợ nâng cấp', N'SSD 256 GB', N'13.6 inch', N'2560 x 1664', N'Hãng không công bố', N'Wide color (P3) Độ sáng 500 nits Công nghệ True Tone 1 billion colors', N'Card tích hợp - 8 nhân GPU', N'Spatial Audio 3 microphones 4 Loa Dolby Atmos', N'2 x Thunderbolt 3 Jack tai nghe 3.5 mm MagSafe 3', N'Bluetooth 5.0 Wi-Fi 6 (802.11ax)', N'1080p FaceTime HD camera', N'Sạc MagSafe Bảo mật vân tay', N'Có', N'Dài 304.1 mm - Rộng 215 mm - Dày 11.3 mm - Nặng 1.24 kg', N'Vỏ kim loại', N'Khoảng 10 tiếng', N'Mac OS', N'6/2022')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (56, N'LAP000033', N'Apple M2', N'8', N'Hãng không công bố', N'100GB/s memory bandwidth', N'Hãng không công bố', N'Hãng không công bố', N'8 GB', N'Hãng không công bố', N'Hãng không công bố', N'Không hỗ trợ nâng cấp', N'SSD 256 GB', N'13.3 inch', N'Retina (2560 x 1600)', N'Hãng không công bố', N'ProMotion Wide color (P3) Công nghệ True Tone 1 billion colors', N'Card tích hợp - 10 nhân GPU', N'Wide stereo sound 3 microphones Loa kép (2 kênh) Dolby Atmos', N'2 x Thunderbolt 3 Jack tai nghe 3.5 mm', N'Bluetooth 5.0 Wi-Fi 6 (802.11ax)', N'720p FaceTime Camera', N'Bảo mật vân tay', N'Có', N'Dài 304.1 mm - Rộng 212.4 mm - Dày 15.6 mm - Nặng 1.4 kg', N'Vỏ kim loại', N'Khoảng 10 tiếng', N'Mac OS', N'6/2022')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (57, N'LAP000034', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'', N'')
INSERT [dbo].[Detail] ([id], [product_id], [CPU], [SoNhan], [SoLuong], [Speed], [MaxSpeed], [Cache], [RAM], [RAM_type], [BusRAM], [MaxRAM], [OCung], [ManHinh], [DoPhanGiai], [TanSoQuet], [CongNgheManHinh], [VGA], [AmThanh], [CongGiaoTiep], [KetNoiKhongDay], [Webcam], [TinhNangKhac], [DenBanPhim], [SizeAndWeight], [ChatLieu], [Pin], [HeDieuHanh], [RaMat]) VALUES (58, N'LAP000035', N'Apple M2', N'8', N'Hãng không công bố', N'100GB/s memory bandwidth', N'Hãng không công bố', N'Hãng không công bố', N'8 GB', N'Hãng không công bố', N'Hãng không công bố', N'Không hỗ trợ nâng cấp', N'SSD 512 GB', N'13.3 inch', N'Retina (2560 x 1600)', N'Hãng không công bố', N'Wide color (P3) Độ sáng 500 nits Công nghệ True Tone 1 billion colors', N'Card tích hợp - 14 core-GPU', N'Wide stereo sound 3 microphones Loa kép (2 kênh) Dolby Atmos', N'3 x Thunderbolt 4 USB-C Jack tai nghe 3.5 mm HDMI', N'Bluetooth 5.0 Wi-Fi 6 (802.11ax)', N'1080p FaceTime HD camera', N'Sạc MagSafe Bảo mật vân tay', N'Có', N'Dài 304.1 mm - Rộng 212.4 mm - Dày 15.6 mm - Nặng 1.4 kg', N'Vỏ kim loại', N'Khoảng 10 tiếng', N'Mac OS', N'6/2022')
SET IDENTITY_INSERT [dbo].[Detail] OFF
SET IDENTITY_INSERT [dbo].[DetailsOrders] ON 

INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (1, 2, N'LAP000000', NULL, 21850000, 1, 21850000, 1003)
INSERT [dbo].[DetailsOrders] ([DeOrderID], [orderID], [proID], [orderAddress], [proPrice], [orderQuantity], [orderMoney], [cusID]) VALUES (2, 3, N'LAP000001', N'Số 65 Kinh xuôi,Xã Thanh Mỹ,Huyện Châu Thành,Tỉnh Trà Vinh', 24700000, 1, 24700000, 1004)
SET IDENTITY_INSERT [dbo].[DetailsOrders] OFF
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000000', N'lap000000.jpg', 1, CAST(N'2021-11-02 00:00:00.000' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000000', N'lap000000_1.jpg', 0, CAST(N'2021-11-13 20:49:10.107' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000000', N'lap000000_10.jpg', 0, CAST(N'2021-11-13 20:58:46.297' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000000', N'lap000000_11.jpg', 0, CAST(N'2021-11-13 20:58:51.983' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000000', N'lap000000_2.jpg', 0, CAST(N'2021-11-13 20:58:00.867' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000000', N'lap000000_3.jpg', 0, CAST(N'2021-11-13 20:58:08.270' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000000', N'lap000000_4.jpg', 0, CAST(N'2021-11-13 20:58:13.153' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000000', N'lap000000_5.jpg', 0, CAST(N'2021-11-13 20:58:16.717' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000000', N'lap000000_6.jpg', 0, CAST(N'2021-11-13 20:58:20.647' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000000', N'lap000000_7.jpg', 0, CAST(N'2021-11-13 20:58:27.797' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000000', N'lap000000_8.jpg', 0, CAST(N'2021-11-13 20:58:35.403' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000000', N'lap000000_9.jpg', 0, CAST(N'2021-11-13 20:58:41.623' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000000', N'mac_pro_m1_2021_1.jpg', 0, CAST(N'2022-11-18 14:29:49.837' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001.jpg', 1, CAST(N'2021-11-13 20:59:06.253' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001_1.jpg', 0, CAST(N'2021-11-13 20:59:15.313' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001_10.jpg', 0, CAST(N'2021-11-13 21:00:09.497' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001_11.jpg', 0, CAST(N'2021-11-13 21:00:16.013' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001_12.jpg', 0, CAST(N'2021-11-13 21:00:20.160' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001_13.jpg', 0, CAST(N'2021-11-13 21:00:26.427' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001_2.jpg', 0, CAST(N'2021-11-13 20:59:20.253' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001_3.jpg', 0, CAST(N'2021-11-13 20:59:28.563' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001_4.jpg', 0, CAST(N'2021-11-13 20:59:34.007' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001_5.jpg', 0, CAST(N'2021-11-13 20:59:38.603' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001_6.jpg', 0, CAST(N'2021-11-13 20:59:43.863' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001_7.jpg', 0, CAST(N'2021-11-13 20:59:49.667' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001_8.jpg', 0, CAST(N'2021-11-13 20:59:56.957' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000001', N'lap000001_9.jpg', 0, CAST(N'2021-11-13 21:00:04.087' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000002', N'lap000002.jpg', 1, CAST(N'2021-11-13 21:01:12.020' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000002', N'lap000002_1.jpg', 0, CAST(N'2021-11-13 21:01:30.730' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000002', N'lap000002_10.jpg', 0, CAST(N'2021-11-13 21:02:36.860' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000002', N'lap000002_11.jpg', 0, CAST(N'2021-11-13 21:02:42.323' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000002', N'lap000002_2.jpg', 0, CAST(N'2021-11-13 21:01:37.610' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000002', N'lap000002_3.jpg', 0, CAST(N'2021-11-13 21:01:43.367' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000002', N'lap000002_4.jpg', 0, CAST(N'2021-11-13 21:01:50.287' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000002', N'lap000002_5.jpg', 0, CAST(N'2021-11-13 21:02:02.933' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000002', N'lap000002_6.jpg', 0, CAST(N'2021-11-13 21:02:08.860' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000002', N'lap000002_7.jpg', 0, CAST(N'2021-11-13 21:02:15.150' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000002', N'lap000002_8.jpg', 0, CAST(N'2021-11-13 21:02:23.097' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000002', N'lap000002_9.jpg', 0, CAST(N'2021-11-13 21:02:31.870' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000003', N'lap000003.jpg', 1, CAST(N'2021-11-13 21:07:32.740' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000003', N'lap000003_1.jpg', 0, CAST(N'2021-11-13 21:08:28.217' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000003', N'lap000003_10.jpg', 0, CAST(N'2021-11-13 21:08:28.220' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000003', N'lap000003_11.jpg', 0, CAST(N'2021-11-13 21:08:28.220' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000003', N'lap000003_12.jpg', 0, CAST(N'2021-11-13 21:08:28.220' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000003', N'lap000003_2.jpg', 0, CAST(N'2021-11-13 21:08:28.220' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000003', N'lap000003_3.jpg', 0, CAST(N'2021-11-13 21:08:28.220' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000003', N'lap000003_4.jpg', 0, CAST(N'2021-11-13 21:08:28.220' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000003', N'lap000003_5.jpg', 0, CAST(N'2021-11-13 21:08:28.220' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000003', N'lap000003_6.jpg', 0, CAST(N'2021-11-13 21:08:28.220' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000003', N'lap000003_7.jpg', 0, CAST(N'2021-11-13 21:08:28.220' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000003', N'lap000003_8.jpg', 0, CAST(N'2021-11-13 21:08:28.220' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000003', N'lap000003_9.jpg', 0, CAST(N'2021-11-13 21:08:28.220' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004.jpg', 1, CAST(N'2021-11-13 21:09:47.750' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_1.jpg', 0, CAST(N'2021-11-13 21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_10.jpg', 0, CAST(N'2021-11-13 21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_11.jpg', 0, CAST(N'2021-11-13 21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_12.jpg', 0, CAST(N'2021-11-13 21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_13.jpg', 0, CAST(N'2021-11-13 21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_14.jpg', 0, CAST(N'2021-11-13 21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_15.jpg', 0, CAST(N'2021-11-13 21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_16.jpg', 0, CAST(N'2021-11-13 21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_17.jpg', 0, CAST(N'2021-11-13 21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_2.jpg', 0, CAST(N'2021-11-13 21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_3.jpg', 0, CAST(N'2021-11-13 21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_4.jpg', 0, CAST(N'2021-11-13 21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_5.jpg', 0, CAST(N'2021-11-13 21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_6.jpg', 0, CAST(N'2021-11-13 21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_7.jpg', 0, CAST(N'2021-11-13 21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_8.jpg', 0, CAST(N'2021-11-13 21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000004', N'lap000004_9.jpg', 0, CAST(N'2021-11-13 21:10:39.950' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_1.jpg', 0, CAST(N'2021-11-13 21:11:48.690' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_10.jpg', 0, CAST(N'2021-11-13 21:11:48.693' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_11.jpg', 0, CAST(N'2021-11-13 21:11:48.693' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_12.jpg', 0, CAST(N'2021-11-13 21:11:48.693' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_13.jpg', 0, CAST(N'2021-11-13 21:11:48.693' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_14.jpg', 0, CAST(N'2021-11-13 21:11:48.693' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_15.jpg', 0, CAST(N'2021-11-13 21:11:48.693' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_16.jpg', 0, CAST(N'2021-11-13 21:11:48.693' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_2.jpg', 0, CAST(N'2021-11-13 21:11:48.690' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_3.jpg', 0, CAST(N'2021-11-13 21:11:48.690' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_4.jpg', 0, CAST(N'2021-11-13 21:11:48.690' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_5.jpg', 0, CAST(N'2021-11-13 21:11:48.690' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_6.jpg', 0, CAST(N'2021-11-13 21:11:48.690' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_7.jpg', 0, CAST(N'2021-11-13 21:11:48.690' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_8.jpg', 0, CAST(N'2021-11-13 21:11:48.693' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000005', N'lap000005_9.jpg', 0, CAST(N'2021-11-13 21:11:48.693' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000025', N'use_c_1m_white.png', 1, CAST(N'2022-11-17 15:40:09.320' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000025', N'use_c_1m_white_2.jpg', 0, CAST(N'2022-11-17 15:44:40.027' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000025', N'use_c_1m_white_3.jpg', 0, CAST(N'2022-11-17 15:44:55.223' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000026', N'cap-sac-usb-c-1m-mm093.png', 1, CAST(N'2022-11-17 16:31:20.970' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000026', N'cap-sac-usb-c-1m-mm093_2.jpg', 0, CAST(N'2022-11-17 16:31:34.977' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000026', N'cap-sac-usb-c-1m-mm093_3.jpg', 0, CAST(N'2022-11-17 16:31:47.427' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000027', N'chuot-bluetooth-apple-mmmq3.png', 1, CAST(N'2022-11-17 16:37:49.457' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000027', N'chuot-bluetooth-apple-mmmq3_2.jpeg', 0, CAST(N'2022-11-17 16:38:01.800' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000027', N'chuot-bluetooth-apple-mmmq3_3.jpeg', 0, CAST(N'2022-11-17 16:38:13.733' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000027', N'mt-chuot-bluetooth-apple-mmmq3.jpg', 0, CAST(N'2022-11-17 16:38:39.297' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000028', N'banphim-mk2c3.png', 1, CAST(N'2022-11-17 16:53:11.387' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000028', N'banphim-mk2c3_2.png', 0, CAST(N'2022-11-17 16:54:09.053' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000028', N'banphim-mk2c3_3.jpg', 0, CAST(N'2022-11-17 16:53:52.603' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000029', N'chup-tai-bluetooth-sony-wh.jpg', 1, CAST(N'2022-11-17 17:01:13.047' AS DateTime))
GO
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000029', N'chup-tai-bluetooth-sony-wh-xb910.jpg', 0, CAST(N'2022-11-17 17:01:22.250' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000029', N'chup-tai-bluetooth-sony-wh-xb910n-3.jpg', 0, CAST(N'2022-11-17 17:01:31.847' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000030', N'mac_pro_m1_2021 - Copy.png', 0, CAST(N'2022-11-18 14:31:45.987' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000030', N'tui_chong_soc -2.png', 0, CAST(N'2022-11-17 17:11:01.233' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000030', N'tui_chong_soc.png', 1, CAST(N'2022-11-17 17:13:03.397' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000031', N'mac_pro_m1_2021 - Copy.png', 0, CAST(N'2022-11-18 14:33:36.387' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000031', N'mac_pro_m1_2021.png', 1, CAST(N'2022-11-18 14:29:32.337' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000031', N'mac_pro_m1_2021_1.jpg', 0, CAST(N'2022-11-18 14:33:49.720' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000031', N'mac_pro_m1_2021_2.jpg', 0, CAST(N'2022-11-18 14:34:08.343' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000031', N'mac_pro_m1_2021_3.jpg', 0, CAST(N'2022-11-18 14:34:24.370' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000031', N'mac_pro_m1_2021_4.jpg', 0, CAST(N'2022-11-18 14:34:38.077' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000032', N'macbook-air-m2-2022-8-core-gpu-xam-2-650x650_2.jpg', 0, CAST(N'2022-11-18 15:19:43.723' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000032', N'macbook-air-m2-2022-8-core-gpu-xam-4-650x650_3.jpg', 0, CAST(N'2022-11-18 15:19:55.443' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000032', N'macbook-air-m2-2022-8-core-gpu-xám-650x650 - Copy.png', 0, CAST(N'2022-11-18 15:16:07.290' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000032', N'macbook-air-m2-2022-8-core-gpu-xám-650x650.png', 1, CAST(N'2022-11-18 15:15:33.153' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000032', N'macbook-air-m2-2022-8-core-gpu-xam-9-650x650_4.jpg', 0, CAST(N'2022-11-18 15:20:06.907' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000033', N'apple-macbook-pro-13-inch-m2-2022-1-1-650x650_2.jpg', 0, CAST(N'2022-11-18 15:35:10.577' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000033', N'apple-macbook-pro-13-inch-m2-2022-2-1-650x650_3.jpg', 0, CAST(N'2022-11-18 15:35:19.413' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000033', N'apple-macbook-pro-13-inch-m2-2022-3-1-650x650_4.jpg', 0, CAST(N'2022-11-18 15:35:29.147' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000033', N'apple-macbook-pro-13-inch-m2-2022-4-1-650x650_5.jpg', 0, CAST(N'2022-11-18 15:35:41.403' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000033', N'apple-pro-m2-2022-bac-650x650.png', 1, CAST(N'2022-11-18 15:35:00.703' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000034', N'macbook-pro-13-spgry-m1-thumb-650x650.png', 1, CAST(N'2022-11-18 15:44:49.093' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000035', N'apple-macbook-pro-13-inch-m2-2022-1-1-650x650_2.jpg', 0, CAST(N'2022-11-18 17:02:13.373' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000035', N'apple-macbook-pro-13-inch-m2-2022-2-1-650x650_3.jpg', 0, CAST(N'2022-11-18 17:02:24.003' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000035', N'apple-macbook-pro-13-inch-m2-2022-3-1-650x650_4.jpg', 0, CAST(N'2022-11-18 17:02:32.270' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000035', N'apple-macbook-pro-13-inch-m2-2022-4-1-650x650_5.jpg', 0, CAST(N'2022-11-18 17:02:41.737' AS DateTime))
INSERT [dbo].[Image] ([product_id], [image_], [active], [dateUpdate]) VALUES (N'LAP000035', N'apple-pro-m2-2022-10-core-gpu-xam-650x650.png', 1, CAST(N'2022-11-18 17:01:53.610' AS DateTime))
INSERT [dbo].[NameOrderStatus] ([IDStatus], [NameOrderStatus]) VALUES (1, N'Đã xác nhận đơn hàng')
INSERT [dbo].[NameOrderStatus] ([IDStatus], [NameOrderStatus]) VALUES (2, N'Đang chuẩn bị hàng')
INSERT [dbo].[NameOrderStatus] ([IDStatus], [NameOrderStatus]) VALUES (3, N'Đang chờ vận chuyển')
INSERT [dbo].[NameOrderStatus] ([IDStatus], [NameOrderStatus]) VALUES (4, N'Đang giao hàng')
INSERT [dbo].[NameOrderStatus] ([IDStatus], [NameOrderStatus]) VALUES (5, N'Giao hàng thành công')
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (2, CAST(N'2022-11-15 00:00:00.000' AS DateTime), N'Giao hàng thành công', NULL, 1003)
INSERT [dbo].[Orders] ([orderID], [orderDate], [orderStatus], [empID], [cusID]) VALUES (3, CAST(N'2022-11-16 00:00:00.000' AS DateTime), N'Giao hàng thành công', NULL, 1004)
SET IDENTITY_INSERT [dbo].[Orders] OFF
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11172022PN000000', NULL, CAST(N'2022-11-17 15:38:40.563' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11172022PN000001', NULL, CAST(N'2022-11-17 16:27:41.517' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11172022PN000002', NULL, CAST(N'2022-11-17 16:37:02.340' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11172022PN000003', NULL, CAST(N'2022-11-17 16:49:19.750' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11172022PN000004', NULL, CAST(N'2022-11-17 16:57:20.007' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11172022PN000005', NULL, CAST(N'2022-11-17 17:08:12.243' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11182022PN000006', NULL, CAST(N'2022-11-18 14:27:50.383' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11182022PN000007', NULL, CAST(N'2022-11-18 15:17:59.717' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11182022PN000008', NULL, CAST(N'2022-11-18 15:33:45.170' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11182022PN000009', NULL, CAST(N'2022-11-18 15:42:27.487' AS DateTime))
INSERT [dbo].[PhieuNhap] ([id], [employee_id], [date_]) VALUES (N'11182022PN000010', NULL, CAST(N'2022-11-18 16:59:22.873' AS DateTime))
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000000', N'Laptop Apple MacBook Air M1 2020 8GB/256GB/7-core GPU (MGN93SA/A)', 10, 12, CAST(21850000 AS Decimal(32, 0)), 1, N'lap000000.png', 1, 58)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000001', N'Laptop Asus ZenBook UX325EA i5 1135G7/8GB/512GB/OLED/Cáp/Túi/Win10 (KG363T)', 44, 0, CAST(24700000 AS Decimal(32, 0)), 2, N'lap000001.jpg', 1, 17)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000002', N'Laptop Asus TUF Gaming FX516PC i7 11370H/8GB/512GB/4GB RTX3050/144Hz/Win10', 244, 0, CAST(28000000 AS Decimal(32, 0)), 2, N'lap000002.jpg', 1, 1)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000003', N'Laptop Asus TUF Gaming FX706HE i7 11800H/8GB/512GB/4GB RTX3050Ti/144Hz/Win10', 34, 0, CAST(35000000 AS Decimal(32, 0)), 2, N'lap000003.jpg', 1, 14)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000004', N'Laptop Asus ROG Zephyrus G14 Alan Walker GA401QEC R9 5900HS/16GB 1TB/4GB RTX3050Ti/120Hz/Túi/Win10', 67, 0, CAST(40250000 AS Decimal(32, 0)), 2, N'lap000004.jpg', 1, 1)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000005', N'Laptop Asus ZenBook UX371EA i7 1165G7/16GB/1TB SSD/Touch/Pen/Cáp/Túi/Office H&S2019/Win10', 19, 14, CAST(42000000 AS Decimal(32, 0)), 2, N'lap000005.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000006', N'Laptop Asus ZenBook UX482EA i7 1165G7/16GB/1TB SSD/Touch/Pen/Túi/Stand/Win10', 25, 0, CAST(34500000 AS Decimal(32, 0)), 2, N'lap000006.jpg', 1, 1)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000007', N'Laptop Asus ExpertBook B9400CEA i7 1165G7/16GB/1TB SSD/Cáp/Túi/Win10', 36, 0, CAST(36450000 AS Decimal(32, 0)), 2, N'lap000007.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000008', N'Laptop Asus ZenBook Flip UX363EA i7 1165G7/16GB/512GB/OLED/Touch/Pen/Cáp/Túi/Win10', 100, 0, CAST(32200000 AS Decimal(32, 0)), 2, N'lap000008.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000009', N'Laptop Asus ZenBook Flip UX363EA i7 1165G7/16GB/512GB/OLED/Touch/Pen/Cáp/Túi/Win10', 54, 0, CAST(32200000 AS Decimal(32, 0)), 2, N'lap000009.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000010', N'Laptop Asus TUF Gaming FX516PM i7 11370H/16GB/512GB/6GB RTX3060/144Hz/Win10', 78, 0, CAST(33750000 AS Decimal(32, 0)), 2, N'lap000010.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000011', N'Laptop Asus ZenBook Duo UX482EA i5 1135G7/8GB/512GB/Touch/Pen/Túi/Stand/Win10', 80, 0, CAST(33750000 AS Decimal(32, 0)), 2, N'lap000011.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000013', N'Laptop Asus TUF Gaming FX516PM i7 11370H/8GB/512GB/6GB RTX3060/144Hz/Win10', 112, 0, CAST(32400000 AS Decimal(32, 0)), 2, N'lap000013.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000014', N'Laptop Asus ZenBook UX425EA i7 1165G7/16GB/512GB/Cáp/Túi/Win10', 101, 0, CAST(27144000 AS Decimal(32, 0)), 2, N'lap000014.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000015', N'Laptop Asus TUF Gaming FX516PE i7 11370H/8GB/512GB/4GB RTX3050Ti/144Hz/Win10', 52, 0, CAST(30960000 AS Decimal(32, 0)), 2, N'lap000015.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000018', N'Laptop Asus TUF Gaming FX706HC i7 11800H/8GB/512GB/4GB RTX3050/144Hz/Win10', 73, 0, CAST(24780000 AS Decimal(32, 0)), 2, N'lap000018.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000019', N'Laptop Asus Rog Zephyrus Gaming G14 GA401QH R7 5800HS/8GB/512GB/4GB GTX1650/144Hz/Túi/Win10', 142, 0, CAST(28072000 AS Decimal(32, 0)), 2, N'lap000019.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000020', N'Laptop Asus TUF Gaming FX506HCB i7 11800H/8GB/512GB/4GB RTX3050/144Hz/Win10', 104, 0, CAST(26314000 AS Decimal(32, 0)), 2, N'lap000020.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000021', N'Laptop Asus TUF Gaming FX706HC i5 11400H/8GB/512GB/4GB RTX3050/144Hz/Win10', 50, 0, CAST(25800000 AS Decimal(32, 0)), 2, N'lap000021.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000022', N'Laptop Asus TUF Gaming FX506HCB i5 11400H/8GB/512GB/4GB RTX3050/144Hz/Win10', 132, 0, CAST(26666000 AS Decimal(32, 0)), 2, N'lap000022.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000023', N'Laptop HP Envy 13 ba1030TU i7 1165G7/8GB/512GB/Office H&S2019/Win10', 70, 0, CAST(30915000 AS Decimal(32, 0)), 2, N'lap000023.jpg', 1, 0)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000025', N'Cáp sạc USB-C 1m', 10, 0, CAST(1000000 AS Decimal(32, 0)), 10, N'use_c_1m_white.png', 6, 3)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000026', N'Cáp sạc USB-C MM093 1m', 20, 0, CAST(1000000 AS Decimal(32, 0)), 10, N'cap-sac-usb-c-1m-mm093.png', 6, 5)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000027', N'Chuột Bluetooth Apple MMMQ3', 50, 0, CAST(5080000 AS Decimal(32, 0)), 10, N'chuot-bluetooth-apple-mmmq3.png', 5, 1)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000028', N'Magic Keyboard với Touch ID và Numeric Keypad', 100, 0, CAST(7480000 AS Decimal(32, 0)), 10, N'banphim-mk2c3.png', 4, 1)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000029', N'Tai nghe chụp tai Bluetooth Sony WH-XB910N', 100, 0, CAST(7800000 AS Decimal(32, 0)), 10, N'chup-tai-bluetooth-sony-wh.jpg', 3, 19)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000030', N'Túi chống sốc Laptop 14 inch Targus Pulse Sleeve TSS94804EU-50', 100, 0, CAST(309750 AS Decimal(32, 0)), 10, N'tui_chong_soc.png', 7, 5)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000031', N'MacBook Pro 14 inch M1 Pro 2021 14-Core GPU', 100, 0, CAST(55650000 AS Decimal(32, 0)), 1, N'mac_pro_m1_2021.png', 1, 4)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000032', N'MacBook Air M2 2022 8-core GPU', 100, 0, CAST(34639500 AS Decimal(32, 0)), 1, N'macbook-air-m2-2022-8-core-gpu-xám-650x650.png', 1, 5)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000033', N'MacBook Pro 13 inch M2 2022', 100, 0, CAST(37789500 AS Decimal(32, 0)), 1, N'apple-pro-m2-2022-bac-650x650.png', 1, 3)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000034', N'MacBook Pro 13 inch M1 2020', 100, 0, CAST(34650000 AS Decimal(32, 0)), 1, N'macbook-pro-13-spgry-m1-thumb-650x650.png', 1, 9)
INSERT [dbo].[Products] ([id], [Name], [quanlity], [purchase], [price], [trademark_id], [avatar], [productType_id], [view_]) VALUES (N'LAP000035', N'MacBook Pro 13 inch M2 2022', 100, 0, CAST(43050000 AS Decimal(32, 0)), 1, N'apple-pro-m2-2022-10-core-gpu-xam-650x650.png', 1, 1)
INSERT [dbo].[ProductType] ([productType_id], [Name_ProductType]) VALUES (1, N'Máy tính')
INSERT [dbo].[ProductType] ([productType_id], [Name_ProductType]) VALUES (2, N'Điện thoại')
INSERT [dbo].[ProductType] ([productType_id], [Name_ProductType]) VALUES (3, N'Tai nghe')
INSERT [dbo].[ProductType] ([productType_id], [Name_ProductType]) VALUES (4, N'Bàn phím')
INSERT [dbo].[ProductType] ([productType_id], [Name_ProductType]) VALUES (5, N'Chuột')
INSERT [dbo].[ProductType] ([productType_id], [Name_ProductType]) VALUES (6, N'Cục sạc')
INSERT [dbo].[ProductType] ([productType_id], [Name_ProductType]) VALUES (7, N'Phụ Kiện máy tính')
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000000', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(10000000 AS Decimal(32, 0)), CAST(11850000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000001', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1300000 AS Decimal(32, 0)), CAST(23400000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000002', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1000000 AS Decimal(32, 0)), CAST(27000000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000003', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(900000 AS Decimal(32, 0)), CAST(34100000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000004', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1500000 AS Decimal(32, 0)), CAST(38750000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000005', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(2000000 AS Decimal(32, 0)), CAST(40000000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000006', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1400000 AS Decimal(32, 0)), CAST(33100000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000007', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1300000 AS Decimal(32, 0)), CAST(35150000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000008', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(990000 AS Decimal(32, 0)), CAST(31210000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000009', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1500000 AS Decimal(32, 0)), CAST(30700000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000010', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1600000 AS Decimal(32, 0)), CAST(32150000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000011', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1750000 AS Decimal(32, 0)), CAST(32000000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000013', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1450000 AS Decimal(32, 0)), CAST(30950000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000014', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1300000 AS Decimal(32, 0)), CAST(25844000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000015', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1800000 AS Decimal(32, 0)), CAST(29160000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000018', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(950000 AS Decimal(32, 0)), CAST(23830000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000019', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(750000 AS Decimal(32, 0)), CAST(27322000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000020', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1200000 AS Decimal(32, 0)), CAST(25114000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000021', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1200000 AS Decimal(32, 0)), CAST(24600000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000022', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1200000 AS Decimal(32, 0)), CAST(25466000 AS Decimal(32, 0)))
INSERT [dbo].[promotions] ([product_id], [date_start], [date_end], [price], [price_after]) VALUES (N'LAP000023', CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date), CAST(1200000 AS Decimal(32, 0)), CAST(29715000 AS Decimal(32, 0)))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000000', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'Thanh toán qua thẻ tín dụng Sacombank được hoàn tiền 500.000đ cho sản phẩm LAPTOP từ 15 triệu đồng', N'', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000001', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'Thanh toán qua thẻ tín dụng Sacombank được hoàn tiền 500.000đ cho sản phẩm LAPTOP từ 15 triệu đồng ', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000002', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021 ', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000003', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'Thanh toán qua thẻ tín dụng Sacombank được hoàn tiền 500.000đ cho sản phẩm LAPTOP từ 15 triệu đồng ', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000004', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000005', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000006', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000007', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000008', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000009', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'Thanh toán qua thẻ tín dụng Sacombank được hoàn tiền 500.000đ cho sản phẩm LAPTOP từ 15 triệu đồng ', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000010', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'Thanh toán qua thẻ tín dụng Sacombank được hoàn tiền 500.000đ cho sản phẩm LAPTOP từ 15 triệu đồng ', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000011', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000013', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'Thanh toán qua thẻ tín dụng Sacombank được hoàn tiền 500.000đ cho sản phẩm LAPTOP từ 15 triệu đồng ', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000014', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'Thanh toán qua thẻ tín dụng Sacombank được hoàn tiền 500.000đ cho sản phẩm LAPTOP từ 15 triệu đồng ', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000015', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'Thanh toán qua thẻ tín dụng Sacombank được hoàn tiền 500.000đ cho sản phẩm LAPTOP từ 15 triệu đồng ', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000018', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000019', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000020', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000021', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'Thanh toán qua thẻ tín dụng Sacombank được hoàn tiền 500.000đ cho sản phẩm LAPTOP từ 15 triệu đồng ', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000022', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'Thanh toán qua thẻ tín dụng Sacombank được hoàn tiền 500.000đ cho sản phẩm LAPTOP từ 15 triệu đồng ', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
INSERT [dbo].[PromotionsGift] ([product_id], [gift1], [gift2], [gift3], [gift4], [priceSum], [date_start], [date_end]) VALUES (N'LAP000023', N'Balo Laptop Asus (Hết quà hoàn tiền 100.000₫)', N'Tặng thẻ cào 200,000đ khi mua Combo Laptop/PC + Office H&S 2021', N'Giảm thêm 5% khi mua cùng sản phẩm bất kỳ có giá cao hơn', N'Thanh toán qua thẻ tín dụng Sacombank được hoàn tiền 500.000đ cho sản phẩm LAPTOP từ 15 triệu đồng ', CAST(500000 AS Decimal(32, 0)), CAST(N'2021-11-18' AS Date), CAST(N'2021-12-18' AS Date))
SET IDENTITY_INSERT [dbo].[Trademark] ON 

INSERT [dbo].[Trademark] ([id], [name]) VALUES (1, N'MacBook')
INSERT [dbo].[Trademark] ([id], [name]) VALUES (2, N'Asus')
INSERT [dbo].[Trademark] ([id], [name]) VALUES (3, N'HP')
INSERT [dbo].[Trademark] ([id], [name]) VALUES (4, N'Lenovo')
INSERT [dbo].[Trademark] ([id], [name]) VALUES (5, N'Acer')
INSERT [dbo].[Trademark] ([id], [name]) VALUES (6, N'DELL')
INSERT [dbo].[Trademark] ([id], [name]) VALUES (7, N'MSI')
INSERT [dbo].[Trademark] ([id], [name]) VALUES (8, N'LG')
INSERT [dbo].[Trademark] ([id], [name]) VALUES (9, N'GIGABYTE')
INSERT [dbo].[Trademark] ([id], [name]) VALUES (10, N'KHÁC')
SET IDENTITY_INSERT [dbo].[Trademark] OFF
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [fk_ca] FOREIGN KEY([cusID])
REFERENCES [dbo].[Customers] ([cusID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [fk_ca]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [fk_CartproID] FOREIGN KEY([proID])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [fk_CartproID]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_CTPN_PN] FOREIGN KEY([PhieuNhap_id])
REFERENCES [dbo].[PhieuNhap] ([id])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [FK_CTPN_PN]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_CTPN_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] CHECK CONSTRAINT [FK_CTPN_Products]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [fk_ComPr] FOREIGN KEY([proID])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [fk_ComPr]
GO
ALTER TABLE [dbo].[CustomerAddress]  WITH CHECK ADD  CONSTRAINT [fk_add] FOREIGN KEY([cusID])
REFERENCES [dbo].[Customers] ([cusID])
GO
ALTER TABLE [dbo].[CustomerAddress] CHECK CONSTRAINT [fk_add]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [fk_cusType] FOREIGN KEY([cusType])
REFERENCES [dbo].[Customertype] ([CusType])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [fk_cusType]
GO
ALTER TABLE [dbo].[Description]  WITH CHECK ADD  CONSTRAINT [FK_Description_Prod] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Description] CHECK CONSTRAINT [FK_Description_Prod]
GO
ALTER TABLE [dbo].[Detail]  WITH CHECK ADD  CONSTRAINT [FK_Detail_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Detail] CHECK CONSTRAINT [FK_Detail_Products]
GO
ALTER TABLE [dbo].[DetailsOrders]  WITH CHECK ADD  CONSTRAINT [fk_DeOrderCus] FOREIGN KEY([cusID])
REFERENCES [dbo].[Customers] ([cusID])
GO
ALTER TABLE [dbo].[DetailsOrders] CHECK CONSTRAINT [fk_DeOrderCus]
GO
ALTER TABLE [dbo].[DetailsOrders]  WITH CHECK ADD  CONSTRAINT [fk_DeOrderorderID] FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[DetailsOrders] CHECK CONSTRAINT [fk_DeOrderorderID]
GO
ALTER TABLE [dbo].[DetailsOrders]  WITH CHECK ADD  CONSTRAINT [fk_DeOrderProID] FOREIGN KEY([proID])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[DetailsOrders] CHECK CONSTRAINT [fk_DeOrderProID]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [fk_EmRole] FOREIGN KEY([empRole])
REFERENCES [dbo].[EmployeesRole] ([empRole])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [fk_EmRole]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_OrderCus] FOREIGN KEY([cusID])
REFERENCES [dbo].[Customers] ([cusID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_OrderCus]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [fk_OrderEmID] FOREIGN KEY([empID])
REFERENCES [dbo].[Employees] ([empID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [fk_OrderEmID]
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PN_Empl] FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employees] ([empID])
GO
ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PN_Empl]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_trademark] FOREIGN KEY([trademark_id])
REFERENCES [dbo].[Trademark] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_trademark]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_ProductType] FOREIGN KEY([productType_id])
REFERENCES [dbo].[ProductType] ([productType_id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_ProductType]
GO
ALTER TABLE [dbo].[promotions]  WITH CHECK ADD  CONSTRAINT [FK_promotions_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[promotions] CHECK CONSTRAINT [FK_promotions_Products]
GO
ALTER TABLE [dbo].[PromotionsGift]  WITH CHECK ADD  CONSTRAINT [FK_PromotionsGift_Prod] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[PromotionsGift] CHECK CONSTRAINT [FK_PromotionsGift_Prod]
GO
/****** Object:  StoredProcedure [dbo].[auto_idProducts]    Script Date: 11/23/2022 2:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[auto_idProducts]
@id char(16) out
AS
BEGIN
	IF (SELECT COUNT(id) FROM Products) = 0
		SET @id = '0'
	ELSE
		SELECT @id = MAX(RIGHT(id, 5)) FROM Products
		SELECT @id = CASE
			WHEN @id = 99999 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP00001'
			WHEN @id >= 0 and @id < 9 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP0000' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
			WHEN @id >= 9 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP000' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
			WHEN @id >= 99 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP00' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
			WHEN @id >= 999 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP0' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
			WHEN @id >= 9999 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
		END
END


GO
/****** Object:  StoredProcedure [dbo].[LayMa]    Script Date: 11/23/2022 2:48:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LayMa]
@ma varchar(50) out
AS
BEGIN
	Select @ma = id
	From Products
	
END
GO
CREATE FUNCTION [dbo].[auto_idProducts2]()
RETURNS VARCHAR(16)
AS
BEGIN
	DECLARE @id VARCHAR(16)
	IF (SELECT COUNT(id) FROM Products) = 0
		SET @id = '0'
	ELSE
		SELECT @id = MAX(RIGHT(id, 5)) FROM Products
		SELECT @id = CASE
			WHEN @id = 99999 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP00001'
			WHEN @id >= 0 and @id < 9 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP0000' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
			WHEN @id >= 9 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP000' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
			WHEN @id >= 99 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP00' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
			WHEN @id >= 999 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP0' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
			WHEN @id >= 9999 THEN CONVERT(VARCHAR,GETDATE(),112) + 'LAP' + CONVERT(CHAR, CONVERT(INT, @id) + 1)
		END
	RETURN @id
END


--Tự động cập nhật avatar sản phẩm khi thêm hình ảnh

GO
CREATE TRIGGER tg_AutoUpdAvaPro on Image
for insert,update
as
	if(select active from inserted) = 'true'
	Begin 
		Update Products
		set avatar = (select image_ from inserted)
		where id = (select product_id from inserted)
	END

GO
CREATE TRIGGER tg_AutoInsertDetails on Products
for insert
as
	declare @id char(9)
	set @id = (select id from inserted)

	Insert into Detail(product_id,CPU,SoNhan,SoLuong,Speed,MaxSpeed,Cache,RAM,RAM_type,BusRAM,MaxRAM,OCung,ManHinh,DoPhanGiai,TanSoQuet,CongNgheManHinh,
	VGA,AmThanh,CongGiaoTiep,KetNoiKhongDay,Webcam,TinhNangKhac,DenBanPhim,SizeAndWeight,ChatLieu,Pin,HeDieuHanh,RaMat)
	values(@id,'','','','','','','','','',N'','','',N'','',N'','',N'','',N'',N'',N'',N'',N'',N'','','','')
GO
CREATE TRIGGER tg_AutoUpdPricePromotion on promotions
for insert,update
as
	Declare @id char(9)
	set @id = (select product_id from inserted)
	update promotions
	set price_after = (select price From Products where id=@id) - (select price from inserted)
	where product_id = @id and date_start = (select date_start from inserted)
GO
CREATE TRIGGER tg_AutoUpdPrice on ChiTietPhieuNhap
for insert
as
	update Products
	set price = (select price_Import + (price_Import*ratio/100) from inserted)
	where id = (Select product_id from inserted)
GO
CREATE TRIGGER tg_AutoUpdQuanlity on ChiTietPhieuNhap
for insert
as
	Update Products
	set quanlity = quanlity + (select quanlity from inserted)
	where id = (select product_id from inserted)
GO
GO
USE [master]
GO
ALTER DATABASE [QL_Laptop] SET  READ_WRITE 
GO
