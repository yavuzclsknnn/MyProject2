USE [master]
GO
/****** Object:  Database [MyProject_1]    Script Date: 9.04.2026 23:40:02 ******/
CREATE DATABASE [MyProject_1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyProject_1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\MyProject_1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyProject_1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL17.SQLEXPRESS\MSSQL\DATA\MyProject_1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [MyProject_1] SET COMPATIBILITY_LEVEL = 170
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyProject_1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyProject_1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyProject_1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyProject_1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyProject_1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyProject_1] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyProject_1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyProject_1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyProject_1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyProject_1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyProject_1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyProject_1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyProject_1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyProject_1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyProject_1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyProject_1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyProject_1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyProject_1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyProject_1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyProject_1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyProject_1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyProject_1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyProject_1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyProject_1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyProject_1] SET  MULTI_USER 
GO
ALTER DATABASE [MyProject_1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyProject_1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyProject_1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyProject_1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyProject_1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyProject_1] SET OPTIMIZED_LOCKING = OFF 
GO
ALTER DATABASE [MyProject_1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MyProject_1] SET QUERY_STORE = ON
GO
ALTER DATABASE [MyProject_1] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [MyProject_1]
GO
/****** Object:  Table [dbo].[AppVersion]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppVersion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VersionNo] [nvarchar](20) NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategori]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategori](
	[KategoriID] [int] IDENTITY(1,1) NOT NULL,
	[Tanim] [varchar](150) NULL,
	[Silindi] [bit] NULL,
 CONSTRAINT [PK_Kategori] PRIMARY KEY CLUSTERED 
(
	[KategoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanici]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanici](
	[KullaniciID] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [nvarchar](50) NULL,
	[Email] [nvarchar](150) NULL,
	[Sifre] [nvarchar](50) NULL,
	[Aktif] [bit] NULL,
	[Silindi] [bit] NULL,
 CONSTRAINT [PK_Kullanici] PRIMARY KEY CLUSTERED 
(
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogTable]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Mesaj] [nvarchar](max) NULL,
	[Tarih] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MuhafazaKosulu]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MuhafazaKosulu](
	[MuhafazaKosuluID] [int] IDENTITY(1,1) NOT NULL,
	[Tanim] [nvarchar](50) NULL,
	[Silindi] [bit] NULL,
 CONSTRAINT [PK_MuhafazaKosulu] PRIMARY KEY CLUSTERED 
(
	[MuhafazaKosuluID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resim]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resim](
	[ResimID] [int] IDENTITY(1,1) NOT NULL,
	[UrunID] [int] NULL,
	[SiraNo] [int] NULL,
	[ResimAdi] [nvarchar](150) NULL,
	[DosyaYolu] [nvarchar](1500) NULL,
	[AnaResimMi] [bit] NULL,
	[Silindi] [bit] NULL,
	[Aktif] [bit] NULL,
 CONSTRAINT [PK_Resimler] PRIMARY KEY CLUSTERED 
(
	[ResimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urun]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urun](
	[UrunID] [int] IDENTITY(1,1) NOT NULL,
	[KategoriID] [int] NULL,
	[MuhafazaKosuluID] [int] NULL,
	[Tanim] [nvarchar](150) NULL,
	[Barkod] [nvarchar](150) NULL,
	[SKTGunSayisi] [int] NULL,
	[Silindi] [bit] NULL,
 CONSTRAINT [PK_Urun] PRIMARY KEY CLUSTERED 
(
	[UrunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Kategori] ON 

INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (1, N'Gıda', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (2, N'İçecek', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (3, N'Temizlik', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (4, N'Kozmetik', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (5, N'Elektronik', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (6, N'Kırtasiye', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (7, N'Ev Gereçleri', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (8, N'Giyim', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (9, N'Ayakkabı', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (10, N'Oyuncak', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (11, N'Mutfak', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (12, N'Bahçe', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (13, N'Hırdavat', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (14, N'Spor', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (15, N'Kitap', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (16, N'Müzik', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (17, N'Film', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (18, N'Otomotiv', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (19, N'Evcil Hayvan', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (20, N'Sağlık', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (21, N'Bebek', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (22, N'Ofis', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (23, N'Aksesuar', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (24, N'Takı', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (25, N'Mobilya', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (26, N'Banyo', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (27, N'Dekorasyon', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (28, N'Bilgisayar', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (29, N'Telefon', 0)
INSERT [dbo].[Kategori] ([KategoriID], [Tanim], [Silindi]) VALUES (30, N'Fotoğraf', 0)
SET IDENTITY_INSERT [dbo].[Kategori] OFF
GO
SET IDENTITY_INSERT [dbo].[Kullanici] ON 

INSERT [dbo].[Kullanici] ([KullaniciID], [KullaniciAdi], [Email], [Sifre], [Aktif], [Silindi]) VALUES (5, N'fgfgfdg', NULL, N'gfgfd', 1, NULL)
INSERT [dbo].[Kullanici] ([KullaniciID], [KullaniciAdi], [Email], [Sifre], [Aktif], [Silindi]) VALUES (6, N'edfdds', NULL, N'fdsfds', 1, 1)
INSERT [dbo].[Kullanici] ([KullaniciID], [KullaniciAdi], [Email], [Sifre], [Aktif], [Silindi]) VALUES (7, N'hgfhfghfh', NULL, N'hfgf', 0, NULL)
INSERT [dbo].[Kullanici] ([KullaniciID], [KullaniciAdi], [Email], [Sifre], [Aktif], [Silindi]) VALUES (8, N'yavuz', NULL, N'1234', 1, 0)
SET IDENTITY_INSERT [dbo].[Kullanici] OFF
GO
SET IDENTITY_INSERT [dbo].[LogTable] ON 

INSERT [dbo].[LogTable] ([ID], [Mesaj], [Tarih]) VALUES (1, N'dfdsfds', CAST(N'2026-03-20T17:10:59.517' AS DateTime))
INSERT [dbo].[LogTable] ([ID], [Mesaj], [Tarih]) VALUES (2, N'Resim Insert Error (SqlException): Procedure or function sp_Resim_Insert has too many arguments specified.', CAST(N'2026-03-25T13:53:39.547' AS DateTime))
INSERT [dbo].[LogTable] ([ID], [Mesaj], [Tarih]) VALUES (3, N'Urun Insert Error (SqlException): Could not find stored procedure ''sp_InsertUrun''.', CAST(N'2026-03-26T13:35:04.857' AS DateTime))
INSERT [dbo].[LogTable] ([ID], [Mesaj], [Tarih]) VALUES (4, N'Urun Insert Error (SqlException): Could not find stored procedure ''sp_InsertUrun''.', CAST(N'2026-03-26T13:36:42.680' AS DateTime))
INSERT [dbo].[LogTable] ([ID], [Mesaj], [Tarih]) VALUES (5, N'Urun Insert Error (Exception): Bağlantı kapatılmadı. Bağlantının geçerli durumu: açık.', CAST(N'2026-03-26T13:37:53.860' AS DateTime))
INSERT [dbo].[LogTable] ([ID], [Mesaj], [Tarih]) VALUES (6, N'MuhafazaKosulu GetAllPaged_Filtered Error (SqlException): @Search is not a parameter for procedure sp_MuhafazaKosulu_Filtered.', CAST(N'2026-03-30T12:06:28.047' AS DateTime))
INSERT [dbo].[LogTable] ([ID], [Mesaj], [Tarih]) VALUES (7, N'MuhafazaKosulu GetAllPaged_Filtered Error (SqlException): @Search is not a parameter for procedure sp_MuhafazaKosulu_Filtered.', CAST(N'2026-03-30T12:06:41.173' AS DateTime))
INSERT [dbo].[LogTable] ([ID], [Mesaj], [Tarih]) VALUES (8, N'MuhafazaKosulu GetAllPaged_Filtered Error (SqlException): @Search is not a parameter for procedure sp_MuhafazaKosulu_Filtered.', CAST(N'2026-03-30T12:06:52.410' AS DateTime))
INSERT [dbo].[LogTable] ([ID], [Mesaj], [Tarih]) VALUES (9, N'MuhafazaKosulu GetAllPaged_Filtered Error (SqlException): @Search is not a parameter for procedure sp_MuhafazaKosulu_Filtered.', CAST(N'2026-03-30T12:07:43.940' AS DateTime))
INSERT [dbo].[LogTable] ([ID], [Mesaj], [Tarih]) VALUES (10, N'MuhafazaKosulu GetAllPaged_Filtered Error (SqlException): @Search is not a parameter for procedure sp_MuhafazaKosulu_Filtered.', CAST(N'2026-03-30T12:08:21.457' AS DateTime))
INSERT [dbo].[LogTable] ([ID], [Mesaj], [Tarih]) VALUES (11, N'Urun GetByKategori Error (Exception): ID', CAST(N'2026-04-01T11:03:45.993' AS DateTime))
INSERT [dbo].[LogTable] ([ID], [Mesaj], [Tarih]) VALUES (12, N'Urun GetByKategori Error (Exception): ID', CAST(N'2026-04-01T11:04:34.603' AS DateTime))
INSERT [dbo].[LogTable] ([ID], [Mesaj], [Tarih]) VALUES (13, N'Urun GetByID Error: @ID is not a parameter for procedure sp_Urun_GetByID.', CAST(N'2026-04-01T11:06:25.313' AS DateTime))
INSERT [dbo].[LogTable] ([ID], [Mesaj], [Tarih]) VALUES (14, N'Urun GetByID Error: KategoriTanim', CAST(N'2026-04-01T11:06:55.817' AS DateTime))
SET IDENTITY_INSERT [dbo].[LogTable] OFF
GO
SET IDENTITY_INSERT [dbo].[MuhafazaKosulu] ON 

INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (1, N'Oda Sıcaklığı', 0)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (2, N'Buzdolabı', 0)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (3, N'Derin Dondurucu', 0)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (4, N'Kuru ve Serin', 0)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (5, N'Nemli Ortam', 0)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (6, N'Güneş Görmeyen Yer', 0)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (7, N'Havalandırmalı Alan11', 0)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (8, N'Vakumlu Paket11', 0)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (9, N'Açıkta', 0)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (10, N'Özel Saklama', 0)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (11, NULL, NULL)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (12, NULL, NULL)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (13, NULL, NULL)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (14, NULL, NULL)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (15, N'jkhkhjk', NULL)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (16, N'jkhkhjk', NULL)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (17, N'tyrytryrt', NULL)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (18, N'tyrytryrt', NULL)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (19, N'fvdfgdfg', NULL)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (20, N'hgjhgjhg', NULL)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (21, N'uuu', NULL)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (22, N'gfhfdgfdgdfg', NULL)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (23, N'hgfhgfhf', NULL)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (24, N'gfgfdgd', 0)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (25, N'gfdgfdgdf', NULL)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (26, N'ııııııııııı', NULL)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (27, N'ytrytrytr', NULL)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (28, N'dsadsa', 0)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (29, N'dsadsadas', 0)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (30, N'dsadsadsa', 1)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (31, N'dsadsada', 0)
INSERT [dbo].[MuhafazaKosulu] ([MuhafazaKosuluID], [Tanim], [Silindi]) VALUES (32, N'dddddd', 0)
SET IDENTITY_INSERT [dbo].[MuhafazaKosulu] OFF
GO
SET IDENTITY_INSERT [dbo].[Resim] ON 

INSERT [dbo].[Resim] ([ResimID], [UrunID], [SiraNo], [ResimAdi], [DosyaYolu], [AnaResimMi], [Silindi], [Aktif]) VALUES (38, 397, 1, N'Resim 1', N'b7446b4c-efca-464e-91ee-f0a7d86c74c8.PNG', 0, 0, 1)
SET IDENTITY_INSERT [dbo].[Resim] OFF
GO
SET IDENTITY_INSERT [dbo].[Urun] ON 

INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (1, 29, 1, N'Urun 1', N'1277759707', 3, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (2, 20, 2, N'Urun 2', N'1224192412', 119, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (3, 8, 1, N'Urun 3', N'0347256889', 177, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (4, 22, 5, N'Urun 4', N'1739975725', 285, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (5, 28, 10, N'Urun 5', N'1093588722', 120, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (6, 6, 7, N'Urun 6', N'1100080822', 27, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (7, 5, 9, N'Urun 7', N'0378510725', 347, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (8, 5, 10, N'Urun 8', N'0106085813', 289, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (9, 17, 10, N'Urun 9', N'0074069476', 162, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (10, 4, 5, N'Urun 10', N'1996136755', 287, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (11, 14, 5, N'Urun 11', N'0693763929', 153, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (12, 30, 1, N'Urun 12', N'1751690864', 290, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (13, 11, 4, N'Urun 13', N'2036563060', 127, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (14, 12, 10, N'Urun 14', N'0293262427', 55, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (15, 19, 6, N'Urun 15', N'0496310394', 242, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (16, 7, 1, N'Urun 16', N'1226759865', 244, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (17, 28, 3, N'Urun 17', N'0781538456', 352, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (18, 8, 10, N'Urun 18', N'1674916656', 300, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (19, 30, 8, N'Urun 19', N'0038730447', 162, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (20, 29, 10, N'Urun 20', N'1961411905', 134, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (21, 27, 2, N'Urun 21', N'0862383704', 364, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (22, 19, 10, N'Urun 22', N'0095475210', 132, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (23, 1, 9, N'Urun 23', N'1928761350', 15, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (24, 3, 4, N'Urun 24', N'1077339153', 92, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (25, 12, 5, N'Urun 25', N'0397926169', 280, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (26, 5, 2, N'Urun 26', N'2018527800', 153, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (27, 3, 9, N'Urun 27', N'1178526729', 72, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (28, 1, 7, N'Urun 28', N'0355233403', 67, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (29, 30, 6, N'Urun 29', N'2121744024', 313, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (30, 22, 1, N'Urun 30', N'1242369353', 151, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (31, 3, 3, N'Urun 31', N'0905912017', 183, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (32, 12, 6, N'Urun 32', N'0477628091', 357, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (33, 13, 7, N'Urun 33', N'1948510485', 208, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (34, 25, 8, N'Urun 34', N'2021476410', 276, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (35, 12, 6, N'Urun 35', N'0259995833', 242, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (36, 19, 2, N'Urun 36', N'2053831780', 183, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (37, 26, 10, N'Urun 37', N'0364335149', 197, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (38, 8, 3, N'Urun 38', N'1215094925', 46, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (39, 15, 7, N'Urun 39', N'0362409984', 89, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (40, 12, 9, N'Urun 40', N'1756296679', 14, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (41, 3, 5, N'Urun 41', N'1346914177', 193, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (42, 4, 4, N'Urun 42', N'0125503330', 283, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (43, 15, 4, N'Urun 43', N'0640951320', 132, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (44, 20, 8, N'Urun 44', N'1645961552', 267, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (45, 13, 10, N'Urun 45', N'0195325240', 120, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (46, 23, 1, N'Urun 46', N'1748974391', 144, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (47, 26, 3, N'Urun 47', N'2058675475', 272, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (48, 30, 3, N'Urun 48', N'1562686505', 85, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (49, 29, 3, N'Urun 49', N'1110229707', 349, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (50, 23, 8, N'Urun 50', N'0877009607', 140, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (51, 10, 8, N'Urun 51', N'1303102019', 170, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (52, 5, 6, N'Urun 52', N'0916786243', 243, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (53, 29, 3, N'Urun 53', N'0494733962', 216, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (54, 21, 5, N'Urun 54', N'1556245966', 143, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (55, 16, 4, N'Urun 55', N'0751128462', 305, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (56, 18, 3, N'Urun 56', N'0319417857', 144, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (57, 1, 1, N'Urun 57', N'0552272148', 265, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (58, 11, 6, N'Urun 58', N'0622460163', 232, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (59, 6, 8, N'Urun 59', N'2022128697', 276, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (60, 20, 9, N'Urun 60', N'1447576069', 18, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (61, 17, 8, N'Urun 61', N'0847458245', 261, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (62, 4, 1, N'Urun 62', N'0424006366', 119, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (63, 3, 7, N'Urun 63', N'1418144989', 28, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (64, 5, 4, N'Urun 64', N'1008545209', 28, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (65, 22, 9, N'Urun 65', N'1591678263', 150, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (66, 21, 5, N'Urun 66', N'0049391259', 166, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (67, 13, 3, N'Urun 67', N'0103336598', 243, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (68, 28, 7, N'Urun 68', N'0067183621', 99, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (69, 7, 1, N'Urun 69', N'0896286431', 168, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (70, 24, 2, N'Urun 70', N'0916977492', 50, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (71, 26, 7, N'Urun 71', N'0582478187', 206, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (72, 24, 10, N'Urun 72', N'0235387596', 280, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (73, 9, 8, N'Urun 73', N'2137557552', 15, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (74, 5, 5, N'Urun 74', N'0690534925', 354, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (75, 19, 4, N'Urun 75', N'0915115058', 259, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (76, 5, 7, N'Urun 76', N'1392924205', 197, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (77, 5, 2, N'Urun 77', N'0450644569', 102, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (78, 30, 7, N'Urun 78', N'2046904978', 128, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (79, 27, 10, N'Urun 79', N'1797572754', 113, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (80, 21, 5, N'Urun 80', N'0299481521', 293, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (81, 10, 3, N'Urun 81', N'1032112375', 329, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (82, 14, 7, N'Urun 82', N'0269351592', 84, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (83, 28, 4, N'Urun 83', N'0746630936', 122, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (84, 23, 1, N'Urun 84', N'1412500668', 337, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (85, 6, 7, N'Urun 85', N'2110337567', 349, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (86, 17, 4, N'Urun 86', N'1850276076', 64, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (87, 24, 8, N'Urun 87', N'1536849544', 150, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (88, 14, 4, N'Urun 88', N'1025639337', 35, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (89, 23, 8, N'Urun 89', N'1988803718', 232, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (90, 16, 8, N'Urun 90', N'1995711857', 60, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (91, 28, 6, N'Urun 91', N'1367542891', 17, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (92, 14, 1, N'Urun 92', N'0023712241', 284, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (93, 24, 6, N'Urun 93', N'0085386343', 217, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (94, 6, 3, N'Urun 94', N'0591449346', 33, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (95, 15, 9, N'Urun 95', N'0170399077', 164, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (96, 20, 7, N'Urun 96', N'0994858109', 282, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (97, 12, 1, N'Urun 97', N'1480812457', 273, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (98, 10, 10, N'Urun 98', N'0653096238', 110, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (99, 8, 7, N'Urun 99', N'1013493372', 18, 0)
GO
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (100, 24, 1, N'Urun 100', N'1647545190', 225, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (101, 15, 3, N'Urun 101', N'1970220827', 28, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (102, 8, 4, N'Urun 102', N'0141550573', 264, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (103, 2, 8, N'Urun 103', N'1921352739', 21, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (104, 22, 4, N'Urun 104', N'1080135163', 179, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (105, 14, 4, N'Urun 105', N'1218181460', 338, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (106, 7, 8, N'Urun 106', N'1788086085', 142, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (107, 28, 6, N'Urun 107', N'0902973861', 156, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (108, 24, 2, N'Urun 108', N'1646972249', 25, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (109, 27, 8, N'Urun 109', N'1787149602', 323, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (110, 30, 5, N'Urun 110', N'0086578674', 144, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (111, 16, 5, N'Urun 111', N'1381499181', 263, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (112, 11, 2, N'Urun 112', N'1565902722', 149, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (113, 24, 2, N'Urun 113', N'1355150532', 69, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (114, 29, 4, N'Urun 114', N'0957044274', 275, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (115, 15, 9, N'Urun 115', N'1985249007', 266, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (116, 7, 9, N'Urun 116', N'0603289117', 255, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (117, 9, 9, N'Urun 117', N'1471751222', 144, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (118, 26, 4, N'Urun 118', N'1406232152', 207, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (119, 15, 9, N'Urun 119', N'0262939936', 20, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (120, 4, 10, N'Urun 120', N'0366352803', 41, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (121, 14, 2, N'Urun 121', N'1034256814', 116, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (122, 5, 4, N'Urun 122', N'1939228545', 154, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (123, 2, 2, N'Urun 123', N'0287268046', 36, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (124, 13, 3, N'Urun 124', N'1723766739', 330, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (125, 21, 9, N'Urun 125', N'1052725795', 236, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (126, 25, 10, N'Urun 126', N'1317651680', 98, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (127, 23, 3, N'Urun 127', N'0298347816', 218, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (128, 27, 4, N'Urun 128', N'2141465513', 243, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (129, 29, 5, N'Urun 129', N'0496510138', 148, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (130, 27, 6, N'Urun 130', N'1276885063', 269, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (131, 16, 3, N'Urun 131', N'1444715598', 81, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (132, 4, 3, N'Urun 132', N'1318054078', 172, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (133, 3, 1, N'Urun 133', N'0464383071', 37, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (134, 11, 3, N'Urun 134', N'1879332261', 337, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (135, 21, 3, N'Urun 135', N'1738858098', 121, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (136, 12, 5, N'Urun 136', N'1492246648', 214, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (137, 10, 5, N'Urun 137', N'1383323054', 146, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (138, 13, 5, N'Urun 138', N'0289425802', 122, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (139, 3, 2, N'Urun 139', N'1631908078', 329, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (140, 20, 9, N'Urun 140', N'1189657403', 86, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (141, 27, 1, N'Urun 141', N'1261740931', 144, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (142, 11, 9, N'Urun 142', N'1015265505', 38, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (143, 6, 6, N'Urun 143', N'0506331260', 45, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (144, 27, 2, N'Urun 144', N'1920769823', 79, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (145, 29, 6, N'Urun 145', N'0789384271', 45, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (146, 27, 1, N'Urun 146', N'0912367887', 248, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (147, 7, 3, N'Urun 147', N'1387380951', 321, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (148, 11, 3, N'Urun 148', N'1205808409', 45, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (149, 21, 6, N'Urun 149', N'0274228036', 278, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (150, 5, 6, N'Urun 150', N'2047777731', 39, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (151, 25, 7, N'Urun 151', N'1477413456', 136, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (152, 28, 1, N'Urun 152', N'0920792564', 216, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (153, 21, 4, N'Urun 153', N'2095374359', 203, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (154, 4, 3, N'Urun 154', N'1041125901', 254, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (155, 30, 8, N'Urun 155', N'0666121944', 229, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (156, 8, 8, N'Urun 156', N'0709147667', 4, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (157, 26, 4, N'Urun 157', N'1967635804', 357, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (158, 12, 4, N'Urun 158', N'1950257667', 323, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (159, 20, 9, N'Urun 159', N'0730702952', 184, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (160, 22, 8, N'Urun 160', N'1487776195', 200, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (161, 20, 10, N'Urun 161', N'0246831600', 132, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (162, 20, 8, N'Urun 162', N'0029724023', 139, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (163, 29, 5, N'Urun 163', N'0983701710', 163, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (164, 1, 6, N'Urun 164', N'1504192639', 163, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (165, 28, 2, N'Urun 165', N'0054133617', 347, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (166, 5, 10, N'Urun 166', N'1711892465', 228, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (167, 24, 6, N'Urun 167', N'2092892684', 207, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (168, 20, 3, N'Urun 168', N'1954067300', 157, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (169, 18, 2, N'Urun 169', N'1088747809', 292, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (170, 2, 4, N'Urun 170', N'0683141294', 72, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (171, 19, 3, N'Urun 171', N'1049544803', 96, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (172, 12, 9, N'Urun 172', N'0475366356', 184, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (173, 30, 5, N'Urun 173', N'0653541231', 360, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (174, 10, 10, N'Urun 174', N'0871800379', 296, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (175, 16, 5, N'Urun 175', N'2020628456', 205, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (176, 23, 8, N'Urun 176', N'0447873076', 344, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (177, 7, 4, N'Urun 177', N'2073076526', 360, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (178, 13, 10, N'Urun 178', N'0427187785', 85, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (179, 9, 9, N'Urun 179', N'1713091578', 121, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (180, 28, 9, N'Urun 180', N'0761977609', 290, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (181, 25, 5, N'Urun 181', N'1177329053', 59, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (182, 11, 4, N'Urun 182', N'1368496937', 84, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (183, 29, 6, N'Urun 183', N'0950384244', 79, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (184, 30, 2, N'Urun 184', N'2074935487', 275, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (185, 17, 10, N'Urun 185', N'0956852156', 170, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (186, 20, 4, N'Urun 186', N'1699784560', 22, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (187, 3, 1, N'Urun 187', N'0812011538', 272, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (188, 17, 3, N'Urun 188', N'0856329155', 357, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (189, 24, 2, N'Urun 189', N'1456633959', 159, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (190, 17, 8, N'Urun 190', N'0003312659', 23, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (191, 9, 1, N'Urun 191', N'1208105727', 171, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (192, 1, 5, N'Urun 192', N'2005355744', 219, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (193, 14, 7, N'Urun 193', N'1528479672', 269, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (194, 15, 8, N'Urun 194', N'1909220363', 161, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (195, 9, 2, N'Urun 195', N'1299832261', 174, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (196, 10, 1, N'Urun 196', N'0276185242', 12, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (197, 29, 5, N'Urun 197', N'0691646013', 149, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (198, 25, 4, N'Urun 198', N'1000833678', 358, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (199, 14, 3, N'Urun 199', N'0314338988', 341, 0)
GO
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (200, 18, 2, N'Urun 200', N'0948432665', 159, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (201, 19, 7, N'Urun 201', N'1715385153', 348, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (202, 25, 6, N'Urun 202', N'1158026395', 139, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (203, 29, 5, N'Urun 203', N'1833546839', 288, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (204, 6, 6, N'Urun 204', N'0201703455', 303, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (205, 3, 8, N'Urun 205', N'1313493112', 363, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (206, 8, 2, N'Urun 206', N'0513050418', 311, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (207, 18, 2, N'Urun 207', N'0558521396', 158, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (208, 11, 9, N'Urun 208', N'2107563567', 71, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (209, 20, 4, N'Urun 209', N'0684220778', 63, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (210, 9, 5, N'Urun 210', N'0065857547', 103, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (211, 17, 9, N'Urun 211', N'0638762288', 208, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (212, 7, 5, N'Urun 212', N'1958887573', 47, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (213, 17, 7, N'Urun 213', N'1529308443', 28, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (214, 4, 10, N'Urun 214', N'0517622345', 65, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (215, 26, 2, N'Urun 215', N'0397961659', 258, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (216, 25, 7, N'Urun 216', N'1454423633', 17, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (217, 1, 6, N'Urun 217', N'0932263289', 188, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (218, 8, 2, N'Urun 218', N'0416111937', 273, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (219, 11, 1, N'Urun 219', N'1118545602', 253, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (220, 12, 1, N'Urun 220', N'1992699031', 237, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (221, 24, 7, N'Urun 221', N'2055861455', 313, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (222, 25, 10, N'Urun 222', N'1601198290', 349, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (223, 8, 3, N'Urun 223', N'0071394623', 276, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (224, 12, 2, N'Urun 224', N'1958680234', 41, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (225, 25, 9, N'Urun 225', N'1730766044', 29, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (226, 24, 7, N'Urun 226', N'1178835675', 342, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (227, 7, 6, N'Urun 227', N'1920009802', 297, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (228, 3, 3, N'Urun 228', N'1248892059', 14, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (229, 30, 9, N'Urun 229', N'0040155689', 140, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (230, 5, 5, N'Urun 230', N'1510283175', 187, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (231, 17, 10, N'Urun 231', N'0255833864', 206, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (232, 17, 1, N'Urun 232', N'2034972790', 285, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (233, 24, 5, N'Urun 233', N'1557697955', 125, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (234, 10, 6, N'Urun 234', N'0507775933', 21, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (235, 20, 7, N'Urun 235', N'0127424838', 180, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (236, 23, 5, N'Urun 236', N'0714816617', 146, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (237, 27, 5, N'Urun 237', N'1325707314', 94, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (238, 11, 2, N'Urun 238', N'0394269833', 152, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (239, 22, 8, N'Urun 239', N'0028197464', 98, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (240, 26, 6, N'Urun 240', N'0676261004', 240, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (241, 17, 6, N'Urun 241', N'0058025728', 342, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (242, 24, 4, N'Urun 242', N'1310092727', 111, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (243, 16, 4, N'Urun 243', N'1855334032', 75, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (244, 21, 6, N'Urun 244', N'1876073987', 98, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (245, 6, 10, N'Urun 245', N'0201941205', 19, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (246, 8, 10, N'Urun 246', N'0194530115', 305, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (247, 3, 2, N'Urun 247', N'1857326237', 96, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (248, 4, 10, N'Urun 248', N'0194534105', 256, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (249, 25, 3, N'Urun 249', N'0874008611', 301, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (250, 17, 8, N'Urun 250', N'0346513731', 225, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (251, 2, 2, N'Urun 251', N'0438817804', 178, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (252, 3, 3, N'Urun 252', N'0297887222', 188, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (253, 1, 7, N'Urun 253', N'0963128369', 87, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (254, 8, 8, N'Urun 254', N'1950862043', 123, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (255, 14, 1, N'Urun 255', N'0248353205', 120, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (256, 27, 1, N'Urun 256', N'1273473015', 311, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (257, 7, 7, N'Urun 257', N'1981270053', 192, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (258, 20, 3, N'Urun 258', N'0462457486', 61, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (259, 10, 10, N'Urun 259', N'0681085303', 255, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (260, 8, 3, N'Urun 260', N'0818006152', 315, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (261, 24, 1, N'Urun 261', N'0645831564', 158, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (262, 25, 8, N'Urun 262', N'1476636692', 301, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (263, 1, 9, N'Urun 263', N'1146573203', 209, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (264, 29, 7, N'Urun 264', N'2000650912', 6, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (265, 1, 6, N'Urun 265', N'0809716230', 17, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (266, 6, 3, N'Urun 266', N'0103567994', 227, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (267, 14, 4, N'Urun 267', N'1809696255', 354, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (268, 1, 6, N'Urun 268', N'2084071154', 154, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (269, 15, 3, N'Urun 269', N'2043845521', 25, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (270, 7, 3, N'Urun 270', N'1312203720', 283, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (271, 6, 3, N'Urun 271', N'2097613599', 45, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (272, 18, 7, N'Urun 272', N'0439077392', 211, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (273, 25, 1, N'Urun 273', N'0299886834', 24, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (274, 19, 3, N'Urun 274', N'1644390436', 279, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (275, 1, 8, N'Urun 275', N'0576711441', 300, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (276, 7, 8, N'Urun 276', N'1106307860', 344, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (277, 13, 3, N'Urun 277', N'0482479975', 114, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (278, 29, 9, N'Urun 278', N'0432077030', 288, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (279, 12, 2, N'Urun 279', N'0487738061', 253, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (280, 4, 9, N'Urun 280', N'0159530431', 230, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (281, 14, 9, N'Urun 281', N'0598281494', 48, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (282, 4, 6, N'Urun 282', N'0669614293', 164, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (283, 8, 1, N'Urun 283', N'1511564604', 204, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (284, 13, 6, N'Urun 284', N'1752857235', 102, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (285, 5, 3, N'Urun 285', N'2054415027', 59, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (286, 9, 6, N'Urun 286', N'0193029229', 253, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (287, 16, 10, N'Urun 287', N'0149460093', 19, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (288, 22, 8, N'Urun 288', N'0348042764', 256, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (289, 23, 3, N'Urun 289', N'0508634426', 82, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (290, 19, 2, N'Urun 290', N'1104669039', 72, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (291, 17, 1, N'Urun 291', N'0258533684', 280, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (292, 24, 8, N'Urun 292', N'0971878380', 241, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (293, 20, 10, N'Urun 293', N'0548122013', 91, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (294, 22, 8, N'Urun 294', N'0996694364', 256, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (295, 6, 7, N'Urun 295', N'1328874929', 113, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (296, 17, 7, N'Urun 296', N'1495901078', 75, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (297, 10, 9, N'Urun 297', N'2131207154', 234, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (298, 11, 8, N'Urun 298', N'2053509311', 191, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (299, 4, 9, N'Urun 299', N'0144958261', 128, 0)
GO
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (300, 5, 9, N'Urun 300', N'1946130194', 254, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (301, 18, 1, N'Urun 301', N'0616703344', 62, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (302, 2, 9, N'Urun 302', N'1073457210', 332, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (303, 9, 6, N'Urun 303', N'2113486185', 200, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (304, 9, 1, N'Urun 304', N'2100119582', 35, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (305, 8, 8, N'Urun 305', N'0815064878', 138, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (306, 9, 4, N'Urun 306', N'0892014785', 267, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (307, 20, 8, N'Urun 307', N'2053094009', 208, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (308, 18, 10, N'Urun 308', N'0148365737', 121, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (309, 25, 3, N'Urun 309', N'1591194690', 282, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (310, 5, 8, N'Urun 310', N'0217422962', 120, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (311, 16, 9, N'Urun 311', N'1335766742', 43, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (312, 28, 1, N'Urun 312', N'1723223166', 187, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (313, 12, 9, N'Urun 313', N'1334391878', 36, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (314, 22, 2, N'Urun 314', N'0262720584', 91, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (315, 14, 4, N'Urun 315', N'0733244634', 124, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (316, 19, 5, N'Urun 316', N'1890873476', 247, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (317, 28, 8, N'Urun 317', N'1211620280', 169, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (318, 8, 5, N'Urun 318', N'0810750941', 90, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (319, 28, 6, N'Urun 319', N'1229637709', 288, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (320, 14, 1, N'Urun 320', N'1121617732', 309, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (321, 30, 9, N'Urun 321', N'0921125062', 146, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (322, 19, 10, N'Urun 322', N'0136704673', 337, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (323, 8, 2, N'Urun 323', N'1703878462', 53, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (324, 10, 9, N'Urun 324', N'2027735282', 342, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (325, 26, 1, N'Urun 325', N'1046558670', 228, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (326, 7, 10, N'Urun 326', N'2071356505', 202, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (327, 6, 3, N'Urun 327', N'0726608976', 358, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (328, 18, 8, N'Urun 328', N'0470238547', 159, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (329, 27, 5, N'Urun 329', N'1495915659', 327, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (330, 25, 1, N'Urun 330', N'1074656596', 79, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (331, 6, 10, N'Urun 331', N'0111894101', 362, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (332, 17, 3, N'Urun 332', N'1158054428', 329, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (333, 20, 1, N'Urun 333', N'1675442297', 330, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (334, 23, 3, N'Urun 334', N'0311285782', 167, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (335, 30, 3, N'Urun 335', N'1641863815', 116, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (336, 8, 8, N'Urun 336', N'1832795027', 324, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (337, 27, 7, N'Urun 337', N'1449783005', 120, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (338, 11, 7, N'Urun 338', N'2041069287', 154, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (339, 25, 2, N'Urun 339', N'1753516887', 33, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (340, 2, 6, N'Urun 340', N'0607047061', 255, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (341, 23, 8, N'Urun 341', N'0951379155', 188, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (342, 27, 1, N'Urun 342', N'0463576337', 199, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (343, 29, 5, N'Urun 343', N'1528724114', 324, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (344, 25, 2, N'Urun 344', N'1850201937', 78, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (345, 22, 4, N'Urun 345', N'2041063145', 353, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (346, 12, 8, N'Urun 346', N'1009608925', 124, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (347, 26, 9, N'Urun 347', N'1331658698', 332, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (348, 19, 3, N'Urun 348', N'0417158905', 327, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (349, 14, 3, N'Urun 349', N'0012399224', 352, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (350, 14, 2, N'Urun 350', N'0570221707', 241, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (351, 14, 5, N'Urun 351', N'0731994993', 357, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (352, 14, 8, N'Urun 352', N'0011443579', 29, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (353, 28, 3, N'Urun 353', N'1507889032', 297, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (354, 9, 7, N'Urun 354', N'0791108540', 80, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (355, 27, 9, N'Urun 355', N'0463638030', 233, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (356, 23, 2, N'Urun 356', N'0663140702', 25, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (357, 13, 6, N'Urun 357', N'1612954060', 9, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (358, 19, 2, N'Urun 358', N'1196640446', 288, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (359, 24, 3, N'Urun 359', N'1224869218', 355, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (360, 8, 2, N'Urun 360', N'0595106001', 339, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (361, 3, 1, N'Urun 361', N'0564213488', 159, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (362, 26, 6, N'Urun 362', N'0010936670', 156, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (363, 22, 10, N'Urun 363', N'0937038444', 179, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (364, 25, 10, N'Urun 364', N'2118755795', 193, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (365, 8, 4, N'Urun 365', N'1748801690', 239, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (366, 7, 1, N'Urun 366', N'2061490653', 54, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (367, 6, 2, N'Urun 367', N'1285094221', 256, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (368, 2, 6, N'Urun 368', N'0071133274', 356, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (369, 13, 8, N'Urun 369', N'0209233882', 61, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (370, 22, 3, N'Urun 370', N'1118471343', 142, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (371, 24, 5, N'Urun 371', N'0835999152', 126, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (372, 7, 7, N'Urun 372', N'1105250077', 44, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (373, 11, 6, N'Urun 373', N'0145069599', 139, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (374, 24, 9, N'Urun 374', N'0549964506', 340, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (375, 6, 7, N'Urun 375', N'1085240978', 164, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (376, 11, 10, N'Urun 376', N'1007844771', 310, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (377, 3, 6, N'Urun 377', N'0134749008', 296, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (378, 18, 10, N'Urun 378', N'1902370131', 81, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (379, 4, 10, N'Urun 379', N'1963506112', 296, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (380, 16, 2, N'Urun 380', N'0974060508', 6, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (381, 21, 5, N'Urun 381', N'1440528437', 199, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (382, 27, 2, N'Urun 382', N'0670026622', 215, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (383, 4, 9, N'Urun 383', N'2142885649', 286, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (384, 19, 7, N'Urun 384', N'0156083150', 341, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (385, 4, 1, N'Urun 385', N'2130462883', 108, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (386, 7, 7, N'Urun 386', N'1612272284', 364, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (387, 4, 6, N'Urun 387', N'1666361707', 221, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (388, 30, 9, N'Urun 388', N'2099066917', 276, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (389, 28, 9, N'Urun 389', N'0017334333', 162, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (390, 9, 8, N'Urun 390', N'0367059121', 21, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (391, 14, 7, N'Urun 391', N'2091287544', 160, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (392, 23, 8, N'Urun 392', N'0737951755', 15, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (393, 21, 7, N'Urun 393', N'0391917089', 110, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (394, 4, 6, N'Urun 394', N'1102239632', 121, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (395, 21, 4, N'Urun 395', N'1369543030', 89, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (396, 1, 8, N'Urun 396', N'1891218233', 209, 1)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (397, 26, 5, N'Urun 397', N'0446805452', 256, 0)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (398, 6, 2, N'Urun 398', N'1275258475', 225, 1)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (399, 28, 5, N'Urun 39975', N'0404972374', 116, 1)
GO
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (400, 3, 1, N'Urun 400', N'1059163389', 247, 1)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (401, 30, 10, N'jjhgjghjg', NULL, NULL, NULL)
INSERT [dbo].[Urun] ([UrunID], [KategoriID], [MuhafazaKosuluID], [Tanim], [Barkod], [SKTGunSayisi], [Silindi]) VALUES (402, 30, 10, N'jjhgjghjg', N'trete', 0, 1)
SET IDENTITY_INSERT [dbo].[Urun] OFF
GO
ALTER TABLE [dbo].[AppVersion] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[LogTable] ADD  DEFAULT (getdate()) FOR [Tarih]
GO
/****** Object:  StoredProcedure [dbo].[sp_AppVersion_GetLast]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AppVersion_GetLast]
AS
BEGIN
    SELECT TOP 1 * 
    FROM AppVersion
    ORDER BY ID DESC
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AppVersion_Insert]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AppVersion_Insert]
    @VersionNo NVARCHAR(20),
    @Description NVARCHAR(500)
AS
BEGIN
    INSERT INTO AppVersion (VersionNo, Description)
    VALUES (@VersionNo, @Description)

    SELECT 1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Kategori_Delete]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Kategori_Delete]
    @KategoriID INT = NULL
AS
BEGIN
    SET NOCOUNT ON; 
    BEGIN TRY

         UPDATE Kategori SET Silindi = 1 WHERE KategoriID = @KategoriID;
          
         SELECT 1 AS Success;

    END TRY
    BEGIN CATCH
 
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();


        DECLARE @LogMesaj NVARCHAR(4000) = CONCAT('sp_Kategori_Delete Hata: ', @ErrorMessage);

        EXEC sp_Log_Add @Mesaj = @LogMesaj;


        SELECT 0 AS Success;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Kategori_GetAll]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Kategori_GetAll]
AS
BEGIN
    SELECT * FROM Kategori  WHERE  (Silindi = 0) ORDER BY KategoriID DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Kategori_GetByID]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Kategori_GetByID]
    @ID INT = NULL
AS
BEGIN
    SELECT * FROM Kategori WHERE ID = @ID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Kategori_GetPagedAll]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Kategori_GetPagedAll]
    @Page INT = NULL,
    @PageSize INT = NULL,
    @Kategori NVARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH CTE AS
    (
        SELECT 
            k.KategoriID,
            k.Tanim,
            k.Silindi,

            ROW_NUMBER() OVER (ORDER BY k.KategoriID DESC) AS RowNum
        FROM Kategori k
        WHERE 
            k.Silindi = 0
            AND (
                @Kategori IS NULL 
                OR @Kategori = '' 
                OR k.Tanim LIKE '%' + @Kategori + '%'
            )
    )

    SELECT *
    FROM CTE
    WHERE RowNum BETWEEN ((@Page - 1) * @PageSize + 1)
                     AND (@Page * @PageSize);

    -- 🔥 TOTAL COUNT
    SELECT COUNT(1)
    FROM Kategori k
    WHERE 
        k.Silindi = 0
        AND (
            @Kategori IS NULL 
            OR @Kategori = '' 
            OR k.Tanim LIKE '%' + @Kategori + '%'
        );
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Kategori_Insert]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[sp_Kategori_Insert]
    @Tanim VARCHAR(150) = NULL
AS
BEGIN

     SET NOCOUNT ON;

    DECLARE @NewID INT;
    BEGIN TRY
        INSERT INTO Kategori (Tanim)
        VALUES (@Tanim);
       
        SET @NewID = SCOPE_IDENTITY();

        -- Başarılı insert, yeni ID döndür 
        SELECT @NewID AS NewID;
    END TRY
    BEGIN CATCH
         
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE(); 

        DECLARE @LogMesaj NVARCHAR(4000) = CONCAT('sp_Kategori_Insert Hata: ', @ErrorMessage);

        EXEC sp_Log_Add @Mesaj = @LogMesaj;

         
       SELECT 0;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Kategori_Update]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Kategori_Update]
      @KategoriID INT = NULL,
      @Tanim NVARCHAR(50)= NULL 
AS
BEGIN

     SET NOCOUNT ON; 
    BEGIN TRY

         UPDATE Kategori 
         SET 
         Tanim = @Tanim 
         WHERE KategoriID = @KategoriID;
          
         SELECT 1 AS Success; -- Güncelleme başarılı

    END TRY
    BEGIN CATCH
       
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();

        DECLARE @LogMesaj NVARCHAR(4000) = CONCAT('sp_Kategori_Update Hata: ', @ErrorMessage);

        EXEC sp_Log_Add @Mesaj = @LogMesaj;

        SELECT 0 AS Success;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Kullanici_Delete]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Kullanici_Delete]
    @KullaniciID INT = NULL 
AS
BEGIN
    SET NOCOUNT ON; 
    BEGIN TRY

         UPDATE Kullanici SET Silindi = 1 WHERE KullaniciID = @KullaniciID;
          
         SELECT 1 AS Success;

    END TRY
    BEGIN CATCH
    
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE(); 

        DECLARE @LogMesaj NVARCHAR(4000) = CONCAT('sp_Kullanici_Delete Hata: ', @ErrorMessage);

        EXEC sp_Log_Add @Mesaj = @LogMesaj;

        SELECT 0 AS Success;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Kullanici_Filtered]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [dbo].[sp_Kullanici_Filtered]
    @Page INT = NULL,
    @PageSize INT = NULL,
    @Arama NVARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH CTE AS
    (
        SELECT 
            m.KullaniciID,
            m.KullaniciAdi,
            m.Email,
            m.Sifre,
            m.Aktif,
            m.Silindi,

            ROW_NUMBER() OVER (ORDER BY m.KullaniciID DESC) AS RowNum
        FROM Kullanici m
        WHERE 
            m.Silindi = 0
            AND (
                @Arama IS NULL 
                OR @Arama = '' 
                OR m.KullaniciAdi LIKE '%' + @Arama + '%'
            )
    )

    SELECT *
    FROM CTE
    WHERE RowNum BETWEEN ((@Page - 1) * @PageSize + 1)
                     AND (@Page * @PageSize);

    -- 🔥 TOTAL COUNT
    SELECT COUNT(1)
    FROM Kullanici k
    WHERE 
        k.Silindi = 0
        AND (
            @Arama IS NULL 
            OR @Arama = '' 
            OR k.KullaniciAdi LIKE '%' + @Arama + '%'
        );
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Kullanici_GetAll]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Kullanici_GetAll]
AS
BEGIN
    SELECT * FROM Kullanici  WHERE  (Silindi = 0) ORDER BY KullaniciID DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Kullanici_GetByID]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Kullanici_GetByID]
    @KullaniciID INT = NULL 
AS
BEGIN
    SELECT * FROM Kullanici WHERE KullaniciID = @KullaniciID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Kullanici_Insert]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [dbo].[sp_Kullanici_Insert] 
            @KullaniciAdi NVARCHAR(50) = NULL,
            @Email NVARCHAR(150) = NULL,
            @Sifre NVARCHAR(50) = NULL,
            @Aktif BIT = NULL 
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewID INT;

    BEGIN TRY
        INSERT INTO Kullanici (
         KullaniciAdi,
         Email,
         Sifre,
         Aktif,
         Silindi
        )
        VALUES (
        @KullaniciAdi,
        @Email,
        @Sifre,
        @Aktif,
        0
        );

        SET @NewID = SCOPE_IDENTITY();

        -- Başarılı insert, yeni ID döndür
        SELECT @NewID AS NewID;

    END TRY
    BEGIN CATCH
   
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();
          
        DECLARE @LogMesaj NVARCHAR(4000) = CONCAT('Kullanici_Insert Hata: ', @ErrorMessage);

        EXEC sp_Log_Add @Mesaj = @LogMesaj;


        RETURN -1; -- hata kodu
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Kullanici_Update]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Kullanici_Update]
            @KullaniciID INT, 
            @KullaniciAdi NVARCHAR(50) = NULL,
            @Email NVARCHAR(150) = NULL,
            @Sifre NVARCHAR(50) = NULL,
            @Aktif BIT = NULL 
AS
BEGIN
    SET NOCOUNT ON; 
    BEGIN TRY

         UPDATE Kullanici 
         SET
            KullaniciAdi = @KullaniciAdi,
            Email = @Email,
            Sifre = @Sifre,
            Aktif = @Aktif,
            Silindi = 0 
        WHERE KullaniciID = @KullaniciID;

         SELECT 1 AS Success;

    END TRY
    BEGIN CATCH
    
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();
          
        DECLARE @LogMesaj NVARCHAR(4000) = CONCAT('sp_Kullanici_Update Hata: ', @ErrorMessage);

        EXEC sp_Log_Add @Mesaj = @LogMesaj;


        SELECT 0 AS Success;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Log_Add]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Log_Add]
    @Mesaj NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO LogTable(Mesaj) VALUES(@Mesaj)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Login]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [dbo].[sp_Login]
     @KullaniciAdi NVARCHAR(50),
    @Sifre NVARCHAR(50) 
AS
BEGIN
     SELECT *
    FROM Kullanici
    WHERE KullaniciAdi = @KullaniciAdi
      AND Sifre = @Sifre
      AND Aktif = 1
      AND Silindi = 0
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MuhafazaKosulu_Delete]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_MuhafazaKosulu_Delete]
    @MuhafazaKosuluID INT  = NULL 
AS
BEGIN 
     SET NOCOUNT ON;
      
    BEGIN TRY

        UPDATE MuhafazaKosulu SET Silindi = 1 WHERE MuhafazaKosuluID = @MuhafazaKosuluID;
          
        SELECT 1 AS Success; -- Güncelleme başarılı

    END TRY
    BEGIN CATCH
  
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();
         
        DECLARE @LogMesaj NVARCHAR(4000) = CONCAT('sp_MuhafazaKosulu_Delete Hata: ', @ErrorMessage);

        EXEC sp_Log_Add @Mesaj = @LogMesaj;
         
        SELECT 0 AS Success;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MuhafazaKosulu_Filtered]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [dbo].[sp_MuhafazaKosulu_Filtered]
    @Page INT = NULL,
    @PageSize INT = NULL,
    @Arama NVARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH CTE AS
    (
        SELECT 
            m.MuhafazaKosuluID,
            m.Tanim,
            m.Silindi,

            ROW_NUMBER() OVER (ORDER BY m.MuhafazaKosuluID DESC) AS RowNum
        FROM MuhafazaKosulu m
        WHERE 
            m.Silindi = 0
            AND (
                @Arama IS NULL 
                OR @Arama = '' 
                OR m.Tanim LIKE '%' + @Arama + '%'
            )
    )

    SELECT *
    FROM CTE
    WHERE RowNum BETWEEN ((@Page - 1) * @PageSize + 1)
                     AND (@Page * @PageSize);

    -- 🔥 TOTAL COUNT
    SELECT COUNT(1)
    FROM MuhafazaKosulu k
    WHERE 
        k.Silindi = 0
        AND (
            @Arama IS NULL 
            OR @Arama = '' 
            OR k.Tanim LIKE '%' + @Arama + '%'
        );
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MuhafazaKosulu_GetAll]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_MuhafazaKosulu_GetAll]
AS
BEGIN
   SELECT * FROM  MuhafazaKosulu WHERE  (Silindi = 0) ORDER BY MuhafazaKosuluID DESC;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MuhafazaKosulu_GetByID]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_MuhafazaKosulu_GetByID]
    @MuhafazaKosuluID INT = NULL 
AS
BEGIN
    SELECT * FROM MuhafazaKosulu WHERE MuhafazaKosuluID = @MuhafazaKosuluID;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_MuhafazaKosulu_GetPagedAll]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_MuhafazaKosulu_GetPagedAll]
    @Page INT = NULL,
    @PageSize INT = NULL,
    @Arama NVARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH CTE AS
    (
        SELECT 
            k.MuhafazaKosuluID,
            k.Tanim,
            k.Silindi,

            ROW_NUMBER() OVER (ORDER BY k.MuhafazaKosuluID DESC) AS RowNum
        FROM MuhafazaKosulu k
        WHERE 
            k.Silindi = 0
            AND (
                @Arama IS NULL 
                OR @Arama = '' 
                OR k.Tanim LIKE '%' + @Arama + '%'
            )
    )

    SELECT *
    FROM CTE
    WHERE RowNum BETWEEN ((@Page - 1) * @PageSize + 1)
                     AND (@Page * @PageSize);

    -- 🔥 TOTAL COUNT
    SELECT COUNT(1)
    FROM Kategori k
    WHERE 
        k.Silindi = 0
        AND (
            @Arama IS NULL 
            OR @Arama = '' 
            OR k.Tanim LIKE '%' + @Arama + '%'
        );
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MuhafazaKosulu_Insert]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE  [dbo].[sp_MuhafazaKosulu_Insert]
    @Tanim NVARCHAR(50) = NULL 
AS
BEGIN

     SET NOCOUNT ON;

    DECLARE @NewID INT;
    BEGIN TRY
            INSERT INTO MuhafazaKosulu (Tanim,Silindi)
        VALUES (@Tanim,0);

         SET @NewID = SCOPE_IDENTITY();

        -- Başarılı insert, yeni ID döndür
        SELECT @NewID AS NewID;
    END TRY
    BEGIN CATCH
         
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE(); 

        DECLARE @LogMesaj NVARCHAR(4000) = CONCAT('sp_MuhafazaKosulu_Insert Hata: ', @ErrorMessage);

        EXEC sp_Log_Add @Mesaj = @LogMesaj;

        SELECT 0 AS Success;

    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_MuhafazaKosulu_Update]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_MuhafazaKosulu_Update]
      @MuhafazaKosuluID INT = NULL ,
      @Tanim NVARCHAR(50) = NULL 
AS
BEGIN

     SET NOCOUNT ON; 
    BEGIN TRY

         UPDATE MuhafazaKosulu 
         SET 
         Tanim = @Tanim 
         WHERE MuhafazaKosuluID = @MuhafazaKosuluID;
          
        SELECT 1 AS Success;-- Güncelleme başarılı

    END TRY
    BEGIN CATCH
         
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();
         
        DECLARE @LogMesaj NVARCHAR(4000) = CONCAT('sp_MuhafazaKosulu_Update Hata: ', @ErrorMessage);

        EXEC sp_Log_Add @Mesaj = @LogMesaj;


        SELECT 0 AS Success; 

    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Resim_AktifUpdate]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [dbo].[sp_Resim_AktifUpdate]
    @ResimID INT = NULL,  
    @Aktif Bit = NULL  
AS
BEGIN
    SET NOCOUNT ON; 

    BEGIN TRY
        UPDATE Resim
        SET  
        Aktif = @Aktif
        WHERE ResimID = @ResimID

         SELECT 1;
    END TRY
    BEGIN CATCH
   
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();
         

        DECLARE @LogMesaj NVARCHAR(4000) = CONCAT('sp_Resim_AktifUpdate Hata: ', @ErrorMessage);

        EXEC sp_Log_Add @Mesaj = @LogMesaj;


        RETURN -1; -- hata kodu
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Resim_Delete]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
creaTE   PROCEDURE [dbo].[sp_Resim_Delete]
    @ResimID INT = NULL 
AS
BEGIN
    SET NOCOUNT ON; 

    BEGIN TRY
        UPDATE Resim
        SET Silindi = 1
        WHERE ResimID = @ResimID

         SELECT 1;
    END TRY
    BEGIN CATCH
   
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();
         

        DECLARE @LogMesaj NVARCHAR(4000) = CONCAT('sp_Resim_Delete Hata: ', @ErrorMessage);

        EXEC sp_Log_Add @Mesaj = @LogMesaj;


        RETURN -1; -- hata kodu
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Resim_GetByID]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [dbo].[sp_Resim_GetByID]
    @ResimID INT = NULL  
AS
BEGIN
    SET NOCOUNT ON; 
        select * from Resim where ResimID=@ResimID 
   
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Resim_GetUrunResimler]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [dbo].[sp_Resim_GetUrunResimler]
    @UrunID INT = NULL  
AS
BEGIN
    SET NOCOUNT ON; 
        select * from Resim where UrunID=@UrunID and Silindi=0; 
   
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Resim_Insert]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Resim_Insert]
    @UrunID INT = NULL,
    @SiraNo INT = NULL,
    @ResimAdi NVARCHAR(150) = NULL,
    @DosyaYolu NVARCHAR(1500) = NULL,
    @AnaResimMi Bit = NULL, 
    @Aktif Bit = NULL 
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewID INT;

    BEGIN TRY
        INSERT INTO Resim (
        UrunID,
        SiraNo,
        ResimAdi,
        DosyaYolu,
        AnaResimMi,
        Aktif,
        Silindi
        )
        VALUES (
        @UrunID, 
        @SiraNo,
        @ResimAdi,
        @DosyaYolu,
        @AnaResimMi,
        @Aktif, 
        0
        );

         SELECT SCOPE_IDENTITY();
    END TRY
    BEGIN CATCH
   
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();
         

        DECLARE @LogMesaj NVARCHAR(4000) = CONCAT('sp_Resim_Insert Hata: ', @ErrorMessage);

        EXEC sp_Log_Add @Mesaj = @LogMesaj;


        RETURN -1; -- hata kodu
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Resim_Update]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Resim_Update]
    @ResimID INT = NULL,
    @UrunID INT = NULL,
    @SiraNo INT = NULL,
    @ResimAdi NVARCHAR(150) = NULL,
    @DosyaYolu NVARCHAR(1500) = NULL,
    @AnaResimMi Bit = NULL, 
    @Aktif Bit = NULL  
AS
BEGIN
    SET NOCOUNT ON; 

    BEGIN TRY
        UPDATE Resim
        SET 
        UrunID = @UrunID,
        SiraNo = @SiraNo,
        ResimAdi = @ResimAdi,
        DosyaYolu = @DosyaYolu,
        AnaResimMi = @AnaResimMi,
        Aktif = @Aktif
        WHERE ResimID = @ResimID

         SELECT 1;
    END TRY
    BEGIN CATCH
   
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();
         

        DECLARE @LogMesaj NVARCHAR(4000) = CONCAT('sp_Resim_Update Hata: ', @ErrorMessage);

        EXEC sp_Log_Add @Mesaj = @LogMesaj;


        RETURN -1; -- hata kodu
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Urun_AllFiltered]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_Urun_AllFiltered]
    @Page INT,
    @PageSize INT,

    @Search NVARCHAR(200) = NULL,

    @UrunID NVARCHAR(50) = NULL,
    @Kategori NVARCHAR(100) = NULL,
    @Tanim NVARCHAR(200) = NULL,
    @Barkod NVARCHAR(100) = NULL,
    @SKT NVARCHAR(50) = NULL,
    @Muhafaza NVARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH CTE AS
    (
        SELECT 
            u.UrunID,
            u.KategoriID,
            k.Tanim AS KategoriTanim,
            u.MuhafazaKosuluID,
            m.Tanim AS MuhafazaTanim,
            u.Tanim, 
            u.Barkod,
            u.SKTGunSayisi,
            ROW_NUMBER() OVER (ORDER BY u.UrunID DESC) AS RowNum
        FROM Urun u
        LEFT JOIN Kategori k ON k.KategoriID = u.KategoriID
        LEFT JOIN MuhafazaKosulu m ON m.MuhafazaKosuluID = u.MuhafazaKosuluID 
        WHERE 
            u.Silindi = 0

            -- GLOBAL SEARCH
            AND (
                @Search IS NULL OR @Search = '' OR
                u.Tanim LIKE '%' + @Search + '%' OR
                u.Barkod LIKE '%' + @Search + '%'
            )

            -- COLUMN FILTERS
            AND (@UrunID IS NULL OR CAST(u.UrunID AS NVARCHAR) LIKE '%' + @UrunID + '%')
            AND (@Kategori IS NULL OR k.Tanim LIKE '%' + @Kategori + '%')
            AND (@Tanim IS NULL OR u.Tanim LIKE '%' + @Tanim + '%')
            AND (@Barkod IS NULL OR u.Barkod LIKE '%' + @Barkod + '%')
            AND (@SKT IS NULL OR CAST(u.SKTGunSayisi AS NVARCHAR) LIKE '%' + @SKT + '%')
            AND (@Muhafaza IS NULL OR m.Tanim LIKE '%' + @Muhafaza + '%')
    )

    SELECT *
    FROM CTE
    WHERE RowNum BETWEEN ((@Page - 1) * @PageSize + 1)
                     AND (@Page * @PageSize);

    SELECT COUNT(1)
    FROM Urun u
    LEFT JOIN Kategori k ON k.KategoriID = u.KategoriID
    LEFT JOIN MuhafazaKosulu m ON m.MuhafazaKosuluID = u.MuhafazaKosuluID 
    WHERE 
        u.Silindi = 0

        AND (
            @Search IS NULL OR @Search = '' OR
            u.Tanim LIKE '%' + @Search + '%' OR
            u.Barkod LIKE '%' + @Search + '%'
        )

        AND (@UrunID IS NULL OR CAST(u.UrunID AS NVARCHAR) LIKE '%' + @UrunID + '%')
        AND (@Kategori IS NULL OR k.Tanim LIKE '%' + @Kategori + '%')
        AND (@Tanim IS NULL OR u.Tanim LIKE '%' + @Tanim + '%')
        AND (@Barkod IS NULL OR u.Barkod LIKE '%' + @Barkod + '%')
        AND (@SKT IS NULL OR CAST(u.SKTGunSayisi AS NVARCHAR) LIKE '%' + @SKT + '%')
        AND (@Muhafaza IS NULL OR m.Tanim LIKE '%' + @Muhafaza + '%');
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Urun_Delete]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Urun_Delete]
    @UrunID INT = NULL 
AS
BEGIN
    SET NOCOUNT ON; 
    BEGIN TRY

         UPDATE Urun SET Silindi = 1 WHERE UrunID = @UrunID;
          
         SELECT 1 AS Success;

    END TRY
    BEGIN CATCH
    
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();
         

        DECLARE @LogMesaj NVARCHAR(4000) = CONCAT('sp_Urun_Delete Hata: ', @ErrorMessage);

        EXEC sp_Log_Add @Mesaj = @LogMesaj;

        SELECT 0 AS Success;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Urun_Filtered_MultiColumun]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Urun_Filtered_MultiColumun]
@Page INT,
@PageSize INT,
@UrunID NVARCHAR(50) = NULL,
@Kategori NVARCHAR(50) = NULL,
@Tanim NVARCHAR(200) = NULL,
@Barkod NVARCHAR(200) = NULL,
@SKT NVARCHAR(50) = NULL,
@Muhafaza NVARCHAR(50) = NULL
AS
BEGIN

;WITH CTE AS
(
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY UrunID DESC) AS RowNum
    FROM Urun
    WHERE Silindi = 0
    AND (@UrunID IS NULL OR CAST(UrunID AS NVARCHAR) LIKE '%' + @UrunID + '%')
    AND (@Kategori IS NULL OR CAST(KategoriID AS NVARCHAR) LIKE '%' + @Kategori + '%')
    AND (@Tanim IS NULL OR Tanim LIKE '%' + @Tanim + '%')
    AND (@Barkod IS NULL OR Barkod LIKE '%' + @Barkod + '%')
    AND (@SKT IS NULL OR CAST(SKTGunSayisi AS NVARCHAR) LIKE '%' + @SKT + '%')
    AND (@Muhafaza IS NULL OR CAST(MuhafazaKosuluID AS NVARCHAR) LIKE '%' + @Muhafaza + '%')
)

SELECT *
FROM CTE
WHERE RowNum BETWEEN ((@Page - 1) * @PageSize + 1)
                 AND (@Page * @PageSize);

SELECT COUNT(1)
FROM Urun
WHERE Silindi = 0
AND (@UrunID IS NULL OR CAST(UrunID AS NVARCHAR) LIKE '%' + @UrunID + '%')
AND (@Kategori IS NULL OR CAST(KategoriID AS NVARCHAR) LIKE '%' + @Kategori + '%')
AND (@Tanim IS NULL OR Tanim LIKE '%' + @Tanim + '%')
AND (@Barkod IS NULL OR Barkod LIKE '%' + @Barkod + '%')
AND (@SKT IS NULL OR CAST(SKTGunSayisi AS NVARCHAR) LIKE '%' + @SKT + '%')
AND (@Muhafaza IS NULL OR CAST(MuhafazaKosuluID AS NVARCHAR) LIKE '%' + @Muhafaza + '%');

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Urun_Filtered_Urun]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Urun_Filtered_Urun]
    @Page INT,
    @PageSize INT,
    @Search NVARCHAR(200) = NULL
AS
BEGIN

    SET NOCOUNT ON;

    ;WITH CTE AS
    (
        SELECT 
            u.UrunID,
            u.KategoriID,
            k.Tanim AS KategoriTanim,
            u.MuhafazaKosuluID,
            m.Tanim AS MuhafazaTanim,
            u.Tanim, 
            u.Barkod,
            u.SKTGunSayisi,
            ROW_NUMBER() OVER (ORDER BY u.UrunID DESC) AS RowNum
        FROM Urun u
        LEFT JOIN Kategori k ON k.KategoriID = u.KategoriID
        LEFT JOIN MuhafazaKosulu m ON m.MuhafazaKosuluID = u.MuhafazaKosuluID 
        WHERE 
         u.Silindi = 0
         AND
            (@Search IS NULL OR @Search = '')
            OR u.Tanim LIKE '%' + @Search + '%'
            OR u.Barkod LIKE '%' + @Search + '%'
    )

    SELECT *
    FROM CTE
    WHERE RowNum BETWEEN ((@Page - 1) * @PageSize + 1)
                     AND (@Page * @PageSize);

    -- total count
    SELECT COUNT(1)
    FROM Urun u
    WHERE 
        (@Search IS NULL OR @Search = '')
        OR u.Tanim LIKE '%' + @Search + '%'
        OR u.Barkod LIKE '%' + @Search + '%';

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Urun_GetAll]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Urun_GetAll]
AS
BEGIN
    SELECT 
        u.UrunID,
        u.KategoriID,
        k.Tanim AS KategoriTanim,
        u.MuhafazaKosuluID,
        m.Tanim AS MuhafazaTanim,
        u.Tanim, 
        u.Barkod,
        u.SKTGunSayisi,
        COUNT(*) OVER() AS TotalCount

        FROM Urun u
        LEFT JOIN Kategori k ON k.KategoriID = u.KategoriID
        LEFT JOIN MuhafazaKosulu m ON m.MuhafazaKosuluID = u.MuhafazaKosuluID
        WHERE u.Silindi = 0

        ORDER BY u.UrunID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Urun_GetAll_Paged]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Urun_GetAll_Paged]
    @Page INT = NULL ,
    @PageSize INT = NULL 
AS
BEGIN

    SET NOCOUNT ON;
    SELECT 
        u.UrunID,
        u.KategoriID,
        k.Tanim AS KategoriTanim,
        u.MuhafazaKosuluID,
        m.Tanim AS MuhafazaTanim,
        u.Tanim, 
        u.Barkod,
        u.SKTGunSayisi,

        COUNT(*) OVER() AS TotalCount

    FROM Urun u
    LEFT JOIN Kategori k ON k.KategoriID = u.KategoriID
    LEFT JOIN MuhafazaKosulu m ON m.MuhafazaKosuluID = u.MuhafazaKosuluID
    WHERE u.Silindi = 0

    ORDER BY u.UrunID
    OFFSET (@Page - 1) * @PageSize ROWS
    FETCH NEXT @PageSize ROWS ONLY

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Urun_GetByID]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Urun_GetByID]
    @UrunID INT = NULL 
AS
BEGIN
    SELECT 
        u.UrunID,
        u.KategoriID,
        k.Tanim AS KategoriTanim,
        u.MuhafazaKosuluID,
        m.Tanim AS MuhafazaTanim,
        u.Tanim, 
        u.Barkod,
        u.SKTGunSayisi 
        FROM Urun u
        LEFT JOIN Kategori k ON k.KategoriID = u.KategoriID
        LEFT JOIN MuhafazaKosulu m ON m.MuhafazaKosuluID = u.MuhafazaKosuluID
        WHERE 
        u.Silindi = 0 AND 
        u.UrunID = @UrunID;
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Urun_GetByKategori_WithResim]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_Urun_GetByKategori_WithResim]
    @KategoriID INT
AS
BEGIN
    SELECT 
        u.UrunID,
        u.KategoriID,
        k.Tanim AS KategoriTanim,
        u.MuhafazaKosuluID,
        m.Tanim AS MuhafazaTanim,
        u.Tanim, 
        u.Barkod,
        u.SKTGunSayisi,

        r.ResimID,
        r.DosyaYolu

    FROM Urun u

    LEFT JOIN Kategori k ON k.KategoriID = u.KategoriID
    LEFT JOIN MuhafazaKosulu m ON m.MuhafazaKosuluID = u.MuhafazaKosuluID

    OUTER APPLY (
        SELECT TOP 1 *
        FROM Resim r
        WHERE 
            r.UrunID = u.UrunID
            AND r.Silindi = 0
            AND r.Aktif = 1
        ORDER BY r.AnaResimMi DESC, r.SiraNo ASC
    ) r

    WHERE 
        u.Silindi = 0
        AND u.KategoriID = @KategoriID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Urun_GetByKategoriID]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [dbo].[sp_Urun_GetByKategoriID] 
    @KategoriID INT = NULL
AS
BEGIN
    SELECT 
        u.UrunID,
        u.KategoriID,
        k.Tanim AS KategoriTanim,
        u.MuhafazaKosuluID,
        m.Tanim AS MuhafazaTanim,
        u.Tanim, 
        u.Barkod,
        u.SKTGunSayisi,
        COUNT(*) OVER() AS TotalCount

        FROM Urun u
        LEFT JOIN Kategori k ON k.KategoriID = u.KategoriID
        LEFT JOIN MuhafazaKosulu m ON m.MuhafazaKosuluID = u.MuhafazaKosuluID
        WHERE 
        u.Silindi = 0 AND 
        u.KategoriID=@KategoriID

        ORDER BY u.UrunID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Urun_Insert]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Urun_Insert]
    @KategoriID INT = NULL,
    @MuhafazaKosuluID INT = NULL,
    @Tanim NVARCHAR(150) = NULL, 
    @Barkod NVARCHAR(150) = NULL,
    @SKTGunSayisi INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewID INT;

    BEGIN TRY
        INSERT INTO Urun (
        KategoriID, 
        MuhafazaKosuluID, 
        Tanim,  
        Barkod, 
        SKTGunSayisi,
        Silindi
        )
        VALUES (
        @KategoriID, 
        @MuhafazaKosuluID, 
        @Tanim,  
        @Barkod, 
        @SKTGunSayisi,
        0
        );

        SET @NewID = SCOPE_IDENTITY();

        -- Başarılı insert, yeni ID döndür
        SELECT @NewID AS NewID;
    END TRY
    BEGIN CATCH
   
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();
         

        DECLARE @LogMesaj NVARCHAR(4000) = CONCAT('sp_Urun_Insert Hata: ', @ErrorMessage);

        EXEC sp_Log_Add @Mesaj = @LogMesaj;


        RETURN -1; -- hata kodu
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Urun_Update]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Urun_Update]
            @UrunID INT,
            @KategoriID INT = NULL,
            @MuhafazaKosuluID INT = NULL,
            @Tanim NVARCHAR(150) = NULL, 
            @Barkod NVARCHAR(150) = NULL,
            @SKTGunSayisi INT = NULL 
AS
BEGIN
    SET NOCOUNT ON; 
    BEGIN TRY

         UPDATE Urun 
         SET
            KategoriID = @KategoriID,
            MuhafazaKosuluID = @MuhafazaKosuluID,
            Tanim = @Tanim, 
            Barkod = @Barkod,
            SKTGunSayisi = @SKTGunSayisi,
            Silindi = 0
        WHERE UrunID = @UrunID;

         SELECT 1 AS Success;

    END TRY
    BEGIN CATCH
    
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
        DECLARE @ErrorState INT = ERROR_STATE();
          
        DECLARE @LogMesaj NVARCHAR(4000) = CONCAT('sp_Urun_Update Hata: ', @ErrorMessage);

        EXEC sp_Log_Add @Mesaj = @LogMesaj;


        SELECT 0 AS Success;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UrunSilinmis_ResimleriGetir]    Script Date: 9.04.2026 23:40:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UrunSilinmis_ResimleriGetir]
AS
BEGIN
    SELECT 
        u.UrunID,
        r.ResimID,
        r.Silindi AS ResimSilindi
    FROM Urun u
    INNER JOIN Resim r ON u.UrunID = r.UrunID
    WHERE u.Silindi = 1
END
GO
USE [master]
GO
ALTER DATABASE [MyProject_1] SET  READ_WRITE 
GO
