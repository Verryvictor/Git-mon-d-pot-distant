USE [master]
GO
/****** Object:  Database [papyrus]    Script Date: Script Date: 21/06/2021  ******/
CREATE DATABASE [papyrus]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'papyrus', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\papyrus.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'papyrus_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\papyrus_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [papyrus] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [papyrus].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [papyrus] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [papyrus] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [papyrus] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [papyrus] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [papyrus] SET ARITHABORT OFF 
GO
ALTER DATABASE [papyrus] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [papyrus] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [papyrus] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [papyrus] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [papyrus] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [papyrus] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [papyrus] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [papyrus] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [papyrus] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [papyrus] SET  ENABLE_BROKER 
GO
ALTER DATABASE [papyrus] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [papyrus] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [papyrus] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [papyrus] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [papyrus] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [papyrus] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [papyrus] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [papyrus] SET RECOVERY FULL 
GO
ALTER DATABASE [papyrus] SET  MULTI_USER 
GO
ALTER DATABASE [papyrus] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [papyrus] SET DB_CHAINING OFF 
GO
ALTER DATABASE [papyrus] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [papyrus] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [papyrus] SET DELAYED_DURABILITY = DISABLED 
GO
USE [papyrus]
GO
/****** Object:  Schema [stg02]    Script Date: Script Date: 21/06/2021  ******/
CREATE SCHEMA [stg02]
GO
/****** Object:  Table [stg02].[ENTCOM]    Script Date: Script Date: 21/06/2021  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [stg02].[ENTCOM](
	[NUMCOM] [int] IDENTITY(1,1) NOT NULL,
	[OBSCOM] [varchar](50) NULL,
	[DATCOM] [smalldatetime] NOT NULL,
	[NUMFOU] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[NUMCOM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [stg02].[FOURNIS]    Script Date: 21/06/2021  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [stg02].[FOURNIS](
	[NUMFOU] [tinyint] IDENTITY(1,1) NOT NULL,
	[NOMFOU] [varchar](30) NOT NULL,
	[RUEFOU] [varchar](30) NOT NULL,
	[POSFOU] [varchar](5) NOT NULL,
	[VILFOU] [varchar](25) NOT NULL,
	[CONFOU] [varchar](15) NOT NULL,
	[SATISF] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[NUMFOU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [stg02].[LIGCOM]    Script Date: 21/06/2021  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [stg02].[LIGCOM](
	[NUMCOM] [int] NOT NULL,
	[CODART] [varchar](4) NULL,
	[NUMLIG] [tinyint] IDENTITY(1,1) NOT NULL,
	[QTECDE] [int] NULL,
	[PRIUNI] [smallmoney] NULL,
	[QTELIV] [int] NULL,
	[DERLIV] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NUMCOM] ASC,
	[NUMLIG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [stg02].[PRODUIT]    Script Date: 21/06/2021 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [stg02].[PRODUIT](
	[CODART] [varchar](4) NOT NULL,
	[LIBART] [varchar](25) NOT NULL,
	[STKALE] [smallint] NOT NULL,
	[STKPHY] [smallint] NOT NULL,
	[QTEANN] [smallint] NOT NULL,
	[UNIMES] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CODART] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [stg02].[VENTE]    Script Date: 21/06/2021  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [stg02].[VENTE](
	[CODART] [varchar](4) NOT NULL,
	[NUMFOU] [tinyint] NOT NULL,
	[DELLIV] [smallint] NOT NULL,
	[QTE1] [smallint] NOT NULL,
	[PRIX1] [numeric](5, 2) NOT NULL,
	[QTE2] [smallint] NULL,
	[PRIX2] [numeric](5, 2) NULL,
	[QTE3] [smallint] NULL,
	[PRIX3] [numeric](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[CODART] ASC,
	[NUMFOU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [index1]    Script Date: 21/06/2021 ******/
CREATE NONCLUSTERED INDEX [index1] ON [stg02].[ENTCOM]
(
	[NUMFOU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [stg02].[ENTCOM]  WITH CHECK ADD FOREIGN KEY([NUMFOU])
REFERENCES [stg02].[FOURNIS] ([NUMFOU])
GO
ALTER TABLE [stg02].[LIGCOM]  WITH CHECK ADD FOREIGN KEY([CODART])
REFERENCES [stg02].[PRODUIT] ([CODART])
GO
ALTER TABLE [stg02].[LIGCOM]  WITH CHECK ADD FOREIGN KEY([NUMCOM])
REFERENCES [stg02].[ENTCOM] ([NUMCOM])
GO
ALTER TABLE [stg02].[VENTE]  WITH CHECK ADD FOREIGN KEY([CODART])
REFERENCES [stg02].[PRODUIT] ([CODART])
GO
ALTER TABLE [stg02].[VENTE]  WITH CHECK ADD FOREIGN KEY([NUMFOU])
REFERENCES [stg02].[FOURNIS] ([NUMFOU])
GO
ALTER TABLE [stg02].[FOURNIS]  WITH CHECK ADD CHECK  (([SATISF]>=(1) AND [SATISF]<=(10)))
GO
USE [master]
GO
ALTER DATABASE [papyrus] SET  READ_WRITE 
GO
© 2021 GitHub, Inc.
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
Loading complete