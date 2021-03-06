USE [master]
GO
/****** Object:  Database [tuurs]    Script Date: 22.01.2022 23:20:42 ******/
CREATE DATABASE [tuurs]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tuurs', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\tuurs.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tuurs_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\tuurs_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [tuurs] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tuurs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tuurs] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tuurs] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tuurs] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tuurs] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tuurs] SET ARITHABORT OFF 
GO
ALTER DATABASE [tuurs] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tuurs] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tuurs] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tuurs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tuurs] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tuurs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tuurs] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tuurs] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tuurs] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tuurs] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tuurs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tuurs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tuurs] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tuurs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tuurs] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tuurs] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tuurs] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tuurs] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [tuurs] SET  MULTI_USER 
GO
ALTER DATABASE [tuurs] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tuurs] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tuurs] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tuurs] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tuurs] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tuurs] SET QUERY_STORE = OFF
GO
USE [tuurs]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 22.01.2022 23:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Code] [nchar](2) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 22.01.2022 23:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CountOfStars] [int] NOT NULL,
	[CountryCode] [nchar](2) NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelComment]    Script Date: 22.01.2022 23:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelComment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Hotelid] [int] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](100) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_HotelComment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelImage]    Script Date: 22.01.2022 23:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelImage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Hotelid] [int] NOT NULL,
	[ImageSource] [varbinary](max) NULL,
 CONSTRAINT [PK_HotelImage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelOfTour]    Script Date: 22.01.2022 23:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelOfTour](
	[TourId] [int] NOT NULL,
	[HotelId] [int] NOT NULL,
 CONSTRAINT [PK_HotelOfTour] PRIMARY KEY CLUSTERED 
(
	[TourId] ASC,
	[HotelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 22.01.2022 23:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TicketCount] [int] NOT NULL,
	[Description] [nvarchar](50) NULL,
	[ImagePreview] [nvarchar](max) NULL,
	[Price] [money] NOT NULL,
	[IsActual] [bit] NOT NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TupeOfTours]    Script Date: 22.01.2022 23:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TupeOfTours](
	[TourId] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
 CONSTRAINT [PK_TupeOfTours] PRIMARY KEY CLUSTERED 
(
	[TourId] ASC,
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 22.01.2022 23:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([id], [Name], [Description]) VALUES (1, N'type1', NULL)
INSERT [dbo].[Type] ([id], [Name], [Description]) VALUES (2, N'type2', NULL)
INSERT [dbo].[Type] ([id], [Name], [Description]) VALUES (3, N'type3', NULL)
INSERT [dbo].[Type] ([id], [Name], [Description]) VALUES (4, N'type4', NULL)
SET IDENTITY_INSERT [dbo].[Type] OFF
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([Code])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Country]
GO
ALTER TABLE [dbo].[HotelComment]  WITH CHECK ADD  CONSTRAINT [FK_HotelComment_Hotel] FOREIGN KEY([Hotelid])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelComment] CHECK CONSTRAINT [FK_HotelComment_Hotel]
GO
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_Hotel] FOREIGN KEY([Hotelid])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Tour]
GO
ALTER TABLE [dbo].[TupeOfTours]  WITH CHECK ADD  CONSTRAINT [FK_TupeOfTours_Tour] FOREIGN KEY([TourId])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[TupeOfTours] CHECK CONSTRAINT [FK_TupeOfTours_Tour]
GO
ALTER TABLE [dbo].[TupeOfTours]  WITH CHECK ADD  CONSTRAINT [FK_TupeOfTours_Type] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Type] ([id])
GO
ALTER TABLE [dbo].[TupeOfTours] CHECK CONSTRAINT [FK_TupeOfTours_Type]
GO
USE [master]
GO
ALTER DATABASE [tuurs] SET  READ_WRITE 
GO
