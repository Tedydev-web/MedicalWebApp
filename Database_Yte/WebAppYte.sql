USE [master]
GO
/****** Object:  Database [WebAppYte]    Script Date: 6/25/2024 1:39:58 PM ******/
CREATE DATABASE [WebAppYte]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebAppYte', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQL\MSSQL\DATA\WebAppYte.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebAppYte_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQL\MSSQL\DATA\WebAppYte_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WebAppYte] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebAppYte].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebAppYte] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebAppYte] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebAppYte] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebAppYte] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebAppYte] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebAppYte] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebAppYte] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebAppYte] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebAppYte] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebAppYte] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebAppYte] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebAppYte] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebAppYte] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebAppYte] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebAppYte] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebAppYte] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebAppYte] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebAppYte] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebAppYte] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebAppYte] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebAppYte] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebAppYte] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebAppYte] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebAppYte] SET  MULTI_USER 
GO
ALTER DATABASE [WebAppYte] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebAppYte] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebAppYte] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebAppYte] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebAppYte] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebAppYte] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebAppYte', N'ON'
GO
ALTER DATABASE [WebAppYte] SET QUERY_STORE = OFF
GO
USE [WebAppYte]
GO
/****** Object:  Table [dbo].[BenhAn]    Script Date: 6/25/2024 1:39:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BenhAn](
	[IDBenhAn] [int] IDENTITY(1,1) NOT NULL,
	[KetQua] [nvarchar](max) NULL,
	[ThoiGian] [smalldatetime] NULL,
	[BacSyKham] [nvarchar](50) NULL,
	[DonThuoc] [nvarchar](200) NULL,
	[GhiChu] [nvarchar](max) NULL,
	[IDNguoiDung] [int] NULL,
	[IDLichKham] [int] NULL,
 CONSTRAINT [PK_BenhAn] PRIMARY KEY CLUSTERED 
(
	[IDBenhAn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAQ]    Script Date: 6/25/2024 1:39:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQ](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionKeywords] [nvarchar](max) NULL,
	[Answer] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioiTinh]    Script Date: 6/25/2024 1:39:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioiTinh](
	[IDGioiTinh] [int] IDENTITY(1,1) NOT NULL,
	[GioiTinh] [nvarchar](6) NULL,
 CONSTRAINT [PK_GioiTinh] PRIMARY KEY CLUSTERED 
(
	[IDGioiTinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoiDap]    Script Date: 6/25/2024 1:39:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoiDap](
	[IDHoidap] [int] IDENTITY(1,1) NOT NULL,
	[CauHoi] [nvarchar](max) NULL,
	[TraLoi] [nvarchar](max) NULL,
	[IDNguoiDung] [int] NULL,
	[IDQuanTri] [int] NULL,
	[NgayGui] [smalldatetime] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_HoiDap] PRIMARY KEY CLUSTERED 
(
	[IDHoidap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoSoSucKhoe]    Script Date: 6/25/2024 1:39:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoSoSucKhoe](
	[IDHoSoSucKhoe] [int] IDENTITY(1,1) NOT NULL,
	[CreateOn] [datetime] NOT NULL,
	[IDNguoiDung] [int] NULL,
	[IDQuanTri] [int] NULL,
	[age] [int] NULL,
	[sex] [int] NULL,
	[cp] [decimal](10, 2) NULL,
	[trestbps] [decimal](10, 2) NULL,
	[chol] [decimal](10, 2) NULL,
	[fbs] [decimal](10, 2) NULL,
	[restecg] [decimal](10, 2) NULL,
	[thalach] [decimal](10, 2) NULL,
	[exang] [decimal](10, 2) NULL,
	[oldpeak] [decimal](10, 2) NULL,
	[slope] [decimal](10, 2) NULL,
	[ca] [decimal](10, 2) NULL,
	[thal] [decimal](10, 2) NULL,
	[Glucose] [decimal](10, 2) NULL,
	[Total_Bilirubin] [decimal](10, 2) NULL,
	[Direct_Bilirubin] [decimal](10, 2) NULL,
	[Alkaline_Phosphotase] [decimal](10, 2) NULL,
	[Alamine_Aminotransferase] [decimal](10, 2) NULL,
	[Aspartate_Aminotransferase] [decimal](10, 2) NULL,
	[Total_Protiens] [decimal](10, 2) NULL,
	[Albumin] [decimal](10, 2) NULL,
	[Albumin_and_Globulin_Ratio] [decimal](10, 2) NULL,
	[BMI] [decimal](10, 2) NULL,
	[Bt] [decimal](10, 2) NULL,
	[hearingability] [decimal](10, 2) NULL,
	[Eyes] [decimal](10, 2) NULL,
	[skinpig] [decimal](10, 2) NULL,
	[ure] [decimal](10, 2) NULL,
	[creatinine] [decimal](10, 2) NULL,
	[Amylase] [decimal](10, 2) NULL,
	[Lipase] [decimal](10, 2) NULL,
	[Natri] [decimal](10, 2) NULL,
	[Kali] [decimal](10, 2) NULL,
	[triglycerides] [decimal](10, 2) NULL,
	[CRP] [decimal](10, 2) NULL,
	[ESR] [decimal](10, 2) NULL,
	[sp] [decimal](10, 2) NULL,
	[hp] [decimal](10, 2) NULL,
	[bodypain] [decimal](10, 2) NULL,
	[Skin] [decimal](10, 2) NULL,
	[Insulin] [decimal](10, 2) NULL,
	[KetQua] [nvarchar](max) NULL,
 CONSTRAINT [PK_HoSoSucKhoe] PRIMARY KEY CLUSTERED 
(
	[IDHoSoSucKhoe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khoa]    Script Date: 6/25/2024 1:39:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khoa](
	[IDKhoa] [int] IDENTITY(1,1) NOT NULL,
	[TenKhoa] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_Khoa] PRIMARY KEY CLUSTERED 
(
	[IDKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichKham]    Script Date: 6/25/2024 1:39:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichKham](
	[IDLichKham] [int] IDENTITY(1,1) NOT NULL,
	[ChuDe] [nvarchar](100) NULL,
	[MoTa] [nvarchar](300) NULL,
	[BatDau] [smalldatetime] NULL,
	[KetThuc] [smalldatetime] NULL,
	[TrangThai] [int] NULL,
	[ZoomInfo] [nvarchar](100) NULL,
	[KetQuaKham] [nvarchar](200) NULL,
	[IDNguoiDung] [int] NULL,
	[IDQuanTri] [int] NULL,
 CONSTRAINT [PK_LichKham] PRIMARY KEY CLUSTERED 
(
	[IDLichKham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichLamViec]    Script Date: 6/25/2024 1:39:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichLamViec](
	[IDLichLamViec] [int] IDENTITY(1,1) NOT NULL,
	[BatDau] [smalldatetime] NULL,
	[KetThuc] [smalldatetime] NULL,
	[IDQuanTri] [int] NULL,
 CONSTRAINT [PK_LichLamViec] PRIMARY KEY CLUSTERED 
(
	[IDLichLamViec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 6/25/2024 1:39:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[IDNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [nchar](100) NULL,
	[DienThoai] [nchar](20) NULL,
	[TaiKhoan] [nchar](50) NULL,
	[MatKhau] [nchar](20) NULL,
	[IDGioiTinh] [int] NULL,
	[DiaChiCuThe] [nvarchar](max) NULL,
	[SoCMND] [int] NULL,
	[IDTinh] [int] NULL,
	[NhomMau] [nchar](2) NULL,
	[ThongTinKhac] [nvarchar](max) NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[IDNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuanTri]    Script Date: 6/25/2024 1:39:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanTri](
	[IDQuanTri] [int] IDENTITY(1,1) NOT NULL,
	[TaiKhoan] [nchar](50) NULL,
	[MatKhau] [nchar](20) NULL,
	[ThongTinBacSi] [nvarchar](max) NULL,
	[TrinhDo] [nvarchar](50) NULL,
	[IDKhoa] [int] NULL,
	[HoTen] [nvarchar](max) NULL,
	[VaiTro] [int] NULL,
	[AnhBia] [nchar](50) NULL,
	[ThongtinZoom] [nvarchar](100) NULL,
 CONSTRAINT [PK_QuanTri] PRIMARY KEY CLUSTERED 
(
	[IDQuanTri] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Solieucovid]    Script Date: 6/25/2024 1:39:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Solieucovid](
	[IDThongkecovid] [int] IDENTITY(1,1) NOT NULL,
	[Quocgia] [nvarchar](50) NULL,
	[Socanhiem] [int] NULL,
	[Dangdieutri] [int] NULL,
	[Khoi] [int] NULL,
	[Tuvong] [int] NULL,
	[Ghichu] [nchar](10) NULL,
 CONSTRAINT [PK_Solieucovid] PRIMARY KEY CLUSTERED 
(
	[IDThongkecovid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinhThanh]    Script Date: 6/25/2024 1:39:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhThanh](
	[IDTinh] [int] IDENTITY(1,1) NOT NULL,
	[TenTinh] [nvarchar](30) NULL,
 CONSTRAINT [PK_TinhThanh] PRIMARY KEY CLUSTERED 
(
	[IDTinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tintuc]    Script Date: 6/25/2024 1:39:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tintuc](
	[IDTintuc] [int] IDENTITY(1,1) NOT NULL,
	[Tieude] [nvarchar](max) NULL,
	[Noidung] [nvarchar](max) NULL,
	[Hinhanh] [nvarchar](100) NULL,
	[Mota] [nvarchar](max) NULL,
	[Ngaydang] [smalldatetime] NULL,
	[TheLoai] [nchar](20) NULL,
 CONSTRAINT [PK_Tintuc] PRIMARY KEY CLUSTERED 
(
	[IDTintuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrungTamGanNhat]    Script Date: 6/25/2024 1:39:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrungTamGanNhat](
	[IDTrungTam] [int] IDENTITY(1,1) NOT NULL,
	[TenTrungTam] [nvarchar](100) NULL,
	[Mota] [nvarchar](max) NULL,
	[IDTinh] [int] NULL,
 CONSTRAINT [PK_TrungTamGanNhat] PRIMARY KEY CLUSTERED 
(
	[IDTrungTam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[FAQ] ON 

INSERT [dbo].[FAQ] ([ID], [QuestionKeywords], [Answer]) VALUES (1, N'dotuoi', N'16')
INSERT [dbo].[FAQ] ([ID], [QuestionKeywords], [Answer]) VALUES (2, N'mucdo', N'nghiemtrong')
SET IDENTITY_INSERT [dbo].[FAQ] OFF
GO
SET IDENTITY_INSERT [dbo].[GioiTinh] ON 

INSERT [dbo].[GioiTinh] ([IDGioiTinh], [GioiTinh]) VALUES (1, N'Nam')
INSERT [dbo].[GioiTinh] ([IDGioiTinh], [GioiTinh]) VALUES (2, N'Nữ')
INSERT [dbo].[GioiTinh] ([IDGioiTinh], [GioiTinh]) VALUES (3, N'Khác')
SET IDENTITY_INSERT [dbo].[GioiTinh] OFF
GO
SET IDENTITY_INSERT [dbo].[HoiDap] ON 

INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (3010, N'Cách phòng tránh dịch bệnh Côvid tại nơi làm việc', N'Nên rửa tay sát khuẩn thường xuyên', 1, 3, CAST(N'2020-07-04T09:04:00' AS SmallDateTime), NULL, 1)
INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (3014, N'Cách phòng tránh dịch bệnh Côvid', N'Thanh hóa có 10 bệnh nhân nhiễm cô vid', 1, 2, CAST(N'2020-07-03T16:39:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (3015, N'Vius lây bệnh qua người bằng con đường nào, thời gian lây bệnh đến phát bệnh trong thời gian bao lâu?', N'Virus này lây qua đường không khí, qua giọt bắn nước bọt, qua vật dụng, thời gian ủ bệnh là 14 ngày.', 1, 3, CAST(N'2020-07-03T17:17:00' AS SmallDateTime), NULL, 1)
INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (4009, N'Xin bác sĩ cho biết, biểu hiện sớm nhất của bệnh là gì, và phân biệt thế nào với các bệnh bình thường khác ạ?', N'Theo hiểu biết hiện nay, bệnh có thời gian ủ bệnh là 14 ngày, kể từ khi người bệnh nhiễm bệnh có thể sớm hơn hoặc nhiều nhất là 14 ngày mới có triệu chứng. Các triệu chứng điển hình giống người bệnh viêm đường hô hấp cấp tính, như sốt, ho, khó thở...', 1, 2, CAST(N'2020-07-04T09:04:00' AS SmallDateTime), NULL, 1)
INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (4010, N'Hỏi đáp Khẩu trang y tế bình thường có khả năng cản virus như thế nào?', N'Hiện nay khẩu trang y tế được sử dụng trong việc phòng chống bệnh truyền nhiễm, kể cả bệnh do nCoV. Bộ Y tế khuyến cáo khẩu trang y tế thông thường sử dụng tốt cho người có nguy cơ như làm việc ở cửa khẩu, làm việc ở bệnh viện, đi đến nơi đông người. Khẩu trang N95 sử dụng tốt cho người đi vào ổ dịch, người chăm sóc bệnh nhân tại ổ dịch.', 2, 2, CAST(N'2020-07-04T09:07:00' AS SmallDateTime), NULL, 1)
INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (4011, N'Nhóm độ tuổi nào dễ bị mắc chủng mới của virus corona?', N'Người dân ở mọi lứa tuổi đều có thể bị mắc chủng mới của virus corona. Tuy nhiên, người cao tuổi, người có bệnh mãn tính (như hen phế quản, tiểu đường, bệnh tim mạch,…) sẽ dễ bị mắc và bệnh thường nặng hơn. Nguồn: http://thanhtra.com.vn/', 2, 2, CAST(N'2020-07-04T09:09:00' AS SmallDateTime), NULL, 1)
INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (4012, N'Cơ chế nCoV lây lan như thế nào?     ', N'Vi-rút này ban đầu xuất hiện từ nguồn động vật nhưng có khả năng lây lan từ người sang người. Điều quan trọng cần lưu ý là sự lây lan từ người sang người có thể xảy ra liên tục. Ở người, virus lây từ người này sang người kia thông qua tiếp xúc với dịch cơ thể của người bệnh. Tùy thuộc vào mức độ lây lan của chủng virus, việc ho, hắt hơi hay bắt tay có thể khiến người xung quanh bị phơi nhiễm. Virus cũng có thể bị lây từ việc ai đó chạm tay vào một vật mà người bệnh chạm vào, sau đó đưa lên miệng, mũi, mắt họ. Những người chăm sóc bệnh nhân cũng có thể bị phơi nhiễm virus khi xử lý các chất thải của người bệnh. Nguồn: https://suckhoedoisong.vn/', 2, 2, CAST(N'2020-07-04T09:10:00' AS SmallDateTime), NULL, 1)
INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (7010, N'Tôi bị sốt liệu rằng có nhiễm CORONA không ?', N'            Không . Điều đó bình thuờng.', 1, NULL, CAST(N'2020-07-05T18:01:00' AS SmallDateTime), NULL, 1)
INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (7019, N'tôi thức khuya ảnh hưởng sức khỏe ko ?', NULL, 1, NULL, CAST(N'2020-07-05T23:49:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (7020, N'Tôi muốn hỏi khi nào có thể tới khám?', NULL, 1, NULL, CAST(N'2020-07-06T01:50:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (8020, N'tối muốn hỏi bác sĩ', NULL, 2005, NULL, CAST(N'2020-07-06T10:23:00' AS SmallDateTime), NULL, 0)
INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (8021, N'Tôi muốn tư vấn về sức khở.', N'Được mời bạn qua trung tâm hoặc để lại số điện thoại', 1, NULL, CAST(N'2020-07-06T12:02:00' AS SmallDateTime), NULL, 1)
INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (8022, N'Số liệu covid', N'400 người nhiễm covid .', 2, NULL, CAST(N'2020-07-06T12:12:00' AS SmallDateTime), NULL, 1)
INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (8051, N'toi co kha nang bi benh tim', N'Không chắc, bạn hãy liên hệ với chúng tôi để biết thêm thông tin chi tiết nhé', 2, NULL, CAST(N'2024-06-21T18:58:00' AS SmallDateTime), NULL, 1)
INSERT [dbo].[HoiDap] ([IDHoidap], [CauHoi], [TraLoi], [IDNguoiDung], [IDQuanTri], [NgayGui], [GhiChu], [TrangThai]) VALUES (8052, N'do tuoi', N'16', 2, NULL, CAST(N'2024-06-21T18:59:00' AS SmallDateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[HoiDap] OFF
GO
SET IDENTITY_INSERT [dbo].[HoSoSucKhoe] ON 

INSERT [dbo].[HoSoSucKhoe] ([IDHoSoSucKhoe], [CreateOn], [IDNguoiDung], [IDQuanTri], [age], [sex], [cp], [trestbps], [chol], [fbs], [restecg], [thalach], [exang], [oldpeak], [slope], [ca], [thal], [Glucose], [Total_Bilirubin], [Direct_Bilirubin], [Alkaline_Phosphotase], [Alamine_Aminotransferase], [Aspartate_Aminotransferase], [Total_Protiens], [Albumin], [Albumin_and_Globulin_Ratio], [BMI], [Bt], [hearingability], [Eyes], [skinpig], [ure], [creatinine], [Amylase], [Lipase], [Natri], [Kali], [triglycerides], [CRP], [ESR], [sp], [hp], [bodypain], [Skin], [Insulin], [KetQua]) VALUES (1, CAST(N'2024-06-24T21:10:06.747' AS DateTime), 2006, NULL, 45, 1, CAST(3.00 AS Decimal(10, 2)), CAST(150.00 AS Decimal(10, 2)), CAST(250.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(170.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(2.30 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(44.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(7.00 AS Decimal(10, 2)), CAST(7.00 AS Decimal(10, 2)), CAST(8.00 AS Decimal(10, 2)), N'Bệnh nhân có khả năng mắc bệnh về tim.')
INSERT [dbo].[HoSoSucKhoe] ([IDHoSoSucKhoe], [CreateOn], [IDNguoiDung], [IDQuanTri], [age], [sex], [cp], [trestbps], [chol], [fbs], [restecg], [thalach], [exang], [oldpeak], [slope], [ca], [thal], [Glucose], [Total_Bilirubin], [Direct_Bilirubin], [Alkaline_Phosphotase], [Alamine_Aminotransferase], [Aspartate_Aminotransferase], [Total_Protiens], [Albumin], [Albumin_and_Globulin_Ratio], [BMI], [Bt], [hearingability], [Eyes], [skinpig], [ure], [creatinine], [Amylase], [Lipase], [Natri], [Kali], [triglycerides], [CRP], [ESR], [sp], [hp], [bodypain], [Skin], [Insulin], [KetQua]) VALUES (2, CAST(N'2024-06-24T21:11:29.377' AS DateTime), 2005, NULL, 18, 1, CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), N'Bệnh nhân có khả năng mắc bệnh về thận.')
INSERT [dbo].[HoSoSucKhoe] ([IDHoSoSucKhoe], [CreateOn], [IDNguoiDung], [IDQuanTri], [age], [sex], [cp], [trestbps], [chol], [fbs], [restecg], [thalach], [exang], [oldpeak], [slope], [ca], [thal], [Glucose], [Total_Bilirubin], [Direct_Bilirubin], [Alkaline_Phosphotase], [Alamine_Aminotransferase], [Aspartate_Aminotransferase], [Total_Protiens], [Albumin], [Albumin_and_Globulin_Ratio], [BMI], [Bt], [hearingability], [Eyes], [skinpig], [ure], [creatinine], [Amylase], [Lipase], [Natri], [Kali], [triglycerides], [CRP], [ESR], [sp], [hp], [bodypain], [Skin], [Insulin], [KetQua]) VALUES (3, CAST(N'2024-06-24T21:23:04.417' AS DateTime), 1, NULL, 18, 1, CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), N'Bệnh nhân có khả năng mắc bệnh về thận.; Bệnh nhân có khả năng mắc bệnh về dạ dày.; Bệnh nhân có khả năng mắc bệnh về phổi.')
INSERT [dbo].[HoSoSucKhoe] ([IDHoSoSucKhoe], [CreateOn], [IDNguoiDung], [IDQuanTri], [age], [sex], [cp], [trestbps], [chol], [fbs], [restecg], [thalach], [exang], [oldpeak], [slope], [ca], [thal], [Glucose], [Total_Bilirubin], [Direct_Bilirubin], [Alkaline_Phosphotase], [Alamine_Aminotransferase], [Aspartate_Aminotransferase], [Total_Protiens], [Albumin], [Albumin_and_Globulin_Ratio], [BMI], [Bt], [hearingability], [Eyes], [skinpig], [ure], [creatinine], [Amylase], [Lipase], [Natri], [Kali], [triglycerides], [CRP], [ESR], [sp], [hp], [bodypain], [Skin], [Insulin], [KetQua]) VALUES (4, CAST(N'2024-06-24T21:54:01.797' AS DateTime), 1, 2, 18, 1, CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), N'Bệnh nhân có khả năng mắc bệnh về thận.; Bệnh nhân có khả năng mắc bệnh về dạ dày.; Bệnh nhân có khả năng mắc bệnh về phổi.')
INSERT [dbo].[HoSoSucKhoe] ([IDHoSoSucKhoe], [CreateOn], [IDNguoiDung], [IDQuanTri], [age], [sex], [cp], [trestbps], [chol], [fbs], [restecg], [thalach], [exang], [oldpeak], [slope], [ca], [thal], [Glucose], [Total_Bilirubin], [Direct_Bilirubin], [Alkaline_Phosphotase], [Alamine_Aminotransferase], [Aspartate_Aminotransferase], [Total_Protiens], [Albumin], [Albumin_and_Globulin_Ratio], [BMI], [Bt], [hearingability], [Eyes], [skinpig], [ure], [creatinine], [Amylase], [Lipase], [Natri], [Kali], [triglycerides], [CRP], [ESR], [sp], [hp], [bodypain], [Skin], [Insulin], [KetQua]) VALUES (5, CAST(N'2024-06-24T21:58:11.970' AS DateTime), 1, 2, 18, 1, CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), N'Bệnh nhân có khả năng mắc bệnh về thận.; Bệnh nhân có khả năng mắc bệnh về dạ dày.; Bệnh nhân có khả năng mắc bệnh về phổi.')
INSERT [dbo].[HoSoSucKhoe] ([IDHoSoSucKhoe], [CreateOn], [IDNguoiDung], [IDQuanTri], [age], [sex], [cp], [trestbps], [chol], [fbs], [restecg], [thalach], [exang], [oldpeak], [slope], [ca], [thal], [Glucose], [Total_Bilirubin], [Direct_Bilirubin], [Alkaline_Phosphotase], [Alamine_Aminotransferase], [Aspartate_Aminotransferase], [Total_Protiens], [Albumin], [Albumin_and_Globulin_Ratio], [BMI], [Bt], [hearingability], [Eyes], [skinpig], [ure], [creatinine], [Amylase], [Lipase], [Natri], [Kali], [triglycerides], [CRP], [ESR], [sp], [hp], [bodypain], [Skin], [Insulin], [KetQua]) VALUES (6, CAST(N'2024-06-24T21:59:56.253' AS DateTime), 2, 2, 18, 1, CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), N'Bệnh nhân có khả năng mắc bệnh về thận.; Bệnh nhân có khả năng mắc bệnh về dạ dày.; Bệnh nhân có khả năng mắc bệnh về phổi.')
INSERT [dbo].[HoSoSucKhoe] ([IDHoSoSucKhoe], [CreateOn], [IDNguoiDung], [IDQuanTri], [age], [sex], [cp], [trestbps], [chol], [fbs], [restecg], [thalach], [exang], [oldpeak], [slope], [ca], [thal], [Glucose], [Total_Bilirubin], [Direct_Bilirubin], [Alkaline_Phosphotase], [Alamine_Aminotransferase], [Aspartate_Aminotransferase], [Total_Protiens], [Albumin], [Albumin_and_Globulin_Ratio], [BMI], [Bt], [hearingability], [Eyes], [skinpig], [ure], [creatinine], [Amylase], [Lipase], [Natri], [Kali], [triglycerides], [CRP], [ESR], [sp], [hp], [bodypain], [Skin], [Insulin], [KetQua]) VALUES (7, CAST(N'2024-06-24T22:00:28.947' AS DateTime), 2, NULL, 18, 1, CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(1.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(2.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(4.00 AS Decimal(10, 2)), CAST(45.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(7.00 AS Decimal(10, 2)), CAST(7.00 AS Decimal(10, 2)), CAST(7.00 AS Decimal(10, 2)), CAST(7.00 AS Decimal(10, 2)), CAST(78.00 AS Decimal(10, 2)), CAST(8.00 AS Decimal(10, 2)), CAST(8.00 AS Decimal(10, 2)), CAST(8.00 AS Decimal(10, 2)), CAST(8.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), N'Bệnh nhân có khả năng mắc bệnh về gan.; Bệnh nhân có khả năng mắc bệnh về thận.; Bệnh nhân có khả năng mắc bệnh về xương khớp.; Bệnh nhân có khả năng mắc bệnh về phổi.')
SET IDENTITY_INSERT [dbo].[HoSoSucKhoe] OFF
GO
SET IDENTITY_INSERT [dbo].[Khoa] ON 

INSERT [dbo].[Khoa] ([IDKhoa], [TenKhoa], [MoTa]) VALUES (1, N'Hô hấp', NULL)
INSERT [dbo].[Khoa] ([IDKhoa], [TenKhoa], [MoTa]) VALUES (2, N'Tai - Mũi - Họng', NULL)
INSERT [dbo].[Khoa] ([IDKhoa], [TenKhoa], [MoTa]) VALUES (3, N'Mắt', NULL)
INSERT [dbo].[Khoa] ([IDKhoa], [TenKhoa], [MoTa]) VALUES (4, N'Da liễu', NULL)
INSERT [dbo].[Khoa] ([IDKhoa], [TenKhoa], [MoTa]) VALUES (5, N'Bệnh Nhiệt Đới', NULL)
INSERT [dbo].[Khoa] ([IDKhoa], [TenKhoa], [MoTa]) VALUES (6, N'Hỗ trợ COVID-19', NULL)
INSERT [dbo].[Khoa] ([IDKhoa], [TenKhoa], [MoTa]) VALUES (7, N'Quản lý', NULL)
SET IDENTITY_INSERT [dbo].[Khoa] OFF
GO
SET IDENTITY_INSERT [dbo].[LichKham] ON 

INSERT [dbo].[LichKham] ([IDLichKham], [ChuDe], [MoTa], [BatDau], [KetThuc], [TrangThai], [ZoomInfo], [KetQuaKham], [IDNguoiDung], [IDQuanTri]) VALUES (1, N'Tối muốn tư vấn về sức khỏe', NULL, CAST(N'2020-07-06T09:10:00' AS SmallDateTime), CAST(N'2020-07-06T09:20:00' AS SmallDateTime), 2, N'https://zoom.us/j/91107480790?pwd=MW9OQVhxVUI4eStmM1lpVUtaN1k3QT09                                  ', N'Bình thường                                                                                                                                                                                             ', 1, 3)
INSERT [dbo].[LichKham] ([IDLichKham], [ChuDe], [MoTa], [BatDau], [KetThuc], [TrangThai], [ZoomInfo], [KetQuaKham], [IDNguoiDung], [IDQuanTri]) VALUES (2, N'khám bệnh', NULL, CAST(N'2020-07-06T11:16:00' AS SmallDateTime), CAST(N'2020-07-06T11:20:00' AS SmallDateTime), 2, NULL, NULL, 1, 3)
INSERT [dbo].[LichKham] ([IDLichKham], [ChuDe], [MoTa], [BatDau], [KetThuc], [TrangThai], [ZoomInfo], [KetQuaKham], [IDNguoiDung], [IDQuanTri]) VALUES (11, N' Tôi muốn tư vấn sức khỏe.', NULL, CAST(N'2020-07-06T12:05:00' AS SmallDateTime), CAST(N'2020-07-06T12:10:00' AS SmallDateTime), 2, N'https://zoom.us/j/91107480790?pwd=MW9OQVhxVUI4eStmM1lpVUtaN1k3QT09                                  ', N'Trạng thái bình thường                                                                                                                                                                                  ', 1, 3)
INSERT [dbo].[LichKham] ([IDLichKham], [ChuDe], [MoTa], [BatDau], [KetThuc], [TrangThai], [ZoomInfo], [KetQuaKham], [IDNguoiDung], [IDQuanTri]) VALUES (12, N'Tôi muốn tư vấn sức khỏe.', NULL, CAST(N'2020-07-06T12:13:00' AS SmallDateTime), NULL, 1, N'https://zoom.us/j/91107480790?pwd=MW9OQVhxVUI4eStmM1lpVUtaN1k3QT09                                  ', NULL, 2, 3)
INSERT [dbo].[LichKham] ([IDLichKham], [ChuDe], [MoTa], [BatDau], [KetThuc], [TrangThai], [ZoomInfo], [KetQuaKham], [IDNguoiDung], [IDQuanTri]) VALUES (13, N'Khám tổng quát', NULL, CAST(N'2024-06-21T14:00:00' AS SmallDateTime), NULL, 1, NULL, NULL, 2, 3)
INSERT [dbo].[LichKham] ([IDLichKham], [ChuDe], [MoTa], [BatDau], [KetThuc], [TrangThai], [ZoomInfo], [KetQuaKham], [IDNguoiDung], [IDQuanTri]) VALUES (14, NULL, NULL, CAST(N'2024-06-21T18:27:00' AS SmallDateTime), NULL, 0, NULL, NULL, 2, 3)
INSERT [dbo].[LichKham] ([IDLichKham], [ChuDe], [MoTa], [BatDau], [KetThuc], [TrangThai], [ZoomInfo], [KetQuaKham], [IDNguoiDung], [IDQuanTri]) VALUES (15, NULL, NULL, CAST(N'2024-06-21T16:29:00' AS SmallDateTime), NULL, 0, NULL, NULL, 2, 3)
INSERT [dbo].[LichKham] ([IDLichKham], [ChuDe], [MoTa], [BatDau], [KetThuc], [TrangThai], [ZoomInfo], [KetQuaKham], [IDNguoiDung], [IDQuanTri]) VALUES (16, NULL, NULL, CAST(N'2024-06-22T22:15:00' AS SmallDateTime), NULL, 0, NULL, NULL, 2, 4)
INSERT [dbo].[LichKham] ([IDLichKham], [ChuDe], [MoTa], [BatDau], [KetThuc], [TrangThai], [ZoomInfo], [KetQuaKham], [IDNguoiDung], [IDQuanTri]) VALUES (20, NULL, NULL, CAST(N'2024-06-24T02:21:00' AS SmallDateTime), NULL, 0, NULL, NULL, 2, 1008)
INSERT [dbo].[LichKham] ([IDLichKham], [ChuDe], [MoTa], [BatDau], [KetThuc], [TrangThai], [ZoomInfo], [KetQuaKham], [IDNguoiDung], [IDQuanTri]) VALUES (21, NULL, NULL, CAST(N'2024-06-23T07:01:00' AS SmallDateTime), NULL, 0, NULL, NULL, 2, 1008)
INSERT [dbo].[LichKham] ([IDLichKham], [ChuDe], [MoTa], [BatDau], [KetThuc], [TrangThai], [ZoomInfo], [KetQuaKham], [IDNguoiDung], [IDQuanTri]) VALUES (22, NULL, NULL, CAST(N'2024-06-29T19:02:00' AS SmallDateTime), NULL, 0, NULL, NULL, 2, 1008)
INSERT [dbo].[LichKham] ([IDLichKham], [ChuDe], [MoTa], [BatDau], [KetThuc], [TrangThai], [ZoomInfo], [KetQuaKham], [IDNguoiDung], [IDQuanTri]) VALUES (23, NULL, NULL, CAST(N'2024-06-30T19:03:00' AS SmallDateTime), NULL, 0, NULL, NULL, 2, 1008)
INSERT [dbo].[LichKham] ([IDLichKham], [ChuDe], [MoTa], [BatDau], [KetThuc], [TrangThai], [ZoomInfo], [KetQuaKham], [IDNguoiDung], [IDQuanTri]) VALUES (1017, NULL, NULL, CAST(N'2024-07-02T19:26:00' AS SmallDateTime), NULL, 1, NULL, NULL, 2, 3)
INSERT [dbo].[LichKham] ([IDLichKham], [ChuDe], [MoTa], [BatDau], [KetThuc], [TrangThai], [ZoomInfo], [KetQuaKham], [IDNguoiDung], [IDQuanTri]) VALUES (2017, N'test LK', NULL, CAST(N'2024-06-28T15:45:00' AS SmallDateTime), NULL, 1, NULL, NULL, 2, 1008)
INSERT [dbo].[LichKham] ([IDLichKham], [ChuDe], [MoTa], [BatDau], [KetThuc], [TrangThai], [ZoomInfo], [KetQuaKham], [IDNguoiDung], [IDQuanTri]) VALUES (2018, NULL, NULL, CAST(N'2024-07-01T04:41:00' AS SmallDateTime), NULL, 1, NULL, NULL, 2005, 3)
INSERT [dbo].[LichKham] ([IDLichKham], [ChuDe], [MoTa], [BatDau], [KetThuc], [TrangThai], [ZoomInfo], [KetQuaKham], [IDNguoiDung], [IDQuanTri]) VALUES (2019, NULL, NULL, CAST(N'2024-07-01T19:04:00' AS SmallDateTime), NULL, 1, NULL, N'Bệnh nhân bi bệnh về đường tiêu hóa                                                                                                                                                                     ', 2, 3)
INSERT [dbo].[LichKham] ([IDLichKham], [ChuDe], [MoTa], [BatDau], [KetThuc], [TrangThai], [ZoomInfo], [KetQuaKham], [IDNguoiDung], [IDQuanTri]) VALUES (2020, N'Tôi muốn khám tổng quan', NULL, CAST(N'2024-06-26T11:17:00' AS SmallDateTime), NULL, 1, NULL, NULL, 2006, 1004)
SET IDENTITY_INSERT [dbo].[LichKham] OFF
GO
SET IDENTITY_INSERT [dbo].[LichLamViec] ON 

INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4026, CAST(N'2024-07-01T00:00:00' AS SmallDateTime), CAST(N'2024-07-01T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4027, CAST(N'2024-08-01T00:00:00' AS SmallDateTime), CAST(N'2024-08-01T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4028, CAST(N'2024-09-01T00:00:00' AS SmallDateTime), CAST(N'2024-09-01T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4029, CAST(N'2024-10-01T00:00:00' AS SmallDateTime), CAST(N'2024-10-01T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4030, CAST(N'2024-11-01T00:00:00' AS SmallDateTime), CAST(N'2024-11-01T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4031, CAST(N'2024-12-01T00:00:00' AS SmallDateTime), CAST(N'2024-12-01T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4032, CAST(N'2025-01-01T00:00:00' AS SmallDateTime), CAST(N'2025-01-01T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4033, CAST(N'2025-02-01T00:00:00' AS SmallDateTime), CAST(N'2025-02-01T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4034, CAST(N'2025-03-01T00:00:00' AS SmallDateTime), CAST(N'2025-03-01T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4035, CAST(N'2025-04-01T00:00:00' AS SmallDateTime), CAST(N'2025-04-01T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4036, CAST(N'2025-05-01T00:00:00' AS SmallDateTime), CAST(N'2025-05-01T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4037, CAST(N'2025-06-01T00:00:00' AS SmallDateTime), CAST(N'2025-06-01T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4038, CAST(N'2024-07-02T00:00:00' AS SmallDateTime), CAST(N'2024-07-02T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4039, CAST(N'2024-08-02T00:00:00' AS SmallDateTime), CAST(N'2024-08-02T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4040, CAST(N'2024-09-02T00:00:00' AS SmallDateTime), CAST(N'2024-09-02T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4041, CAST(N'2024-10-02T00:00:00' AS SmallDateTime), CAST(N'2024-10-02T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4042, CAST(N'2024-11-02T00:00:00' AS SmallDateTime), CAST(N'2024-11-02T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4043, CAST(N'2024-12-02T00:00:00' AS SmallDateTime), CAST(N'2024-12-02T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4044, CAST(N'2025-01-02T00:00:00' AS SmallDateTime), CAST(N'2025-01-02T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4045, CAST(N'2025-02-02T00:00:00' AS SmallDateTime), CAST(N'2025-02-02T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4046, CAST(N'2025-03-02T00:00:00' AS SmallDateTime), CAST(N'2025-03-02T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4047, CAST(N'2025-04-02T00:00:00' AS SmallDateTime), CAST(N'2025-04-02T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4048, CAST(N'2025-05-02T00:00:00' AS SmallDateTime), CAST(N'2025-05-02T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4049, CAST(N'2025-06-02T00:00:00' AS SmallDateTime), CAST(N'2025-06-02T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4050, CAST(N'2024-07-03T00:00:00' AS SmallDateTime), CAST(N'2024-07-03T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4051, CAST(N'2024-08-03T00:00:00' AS SmallDateTime), CAST(N'2024-08-03T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4052, CAST(N'2024-09-03T00:00:00' AS SmallDateTime), CAST(N'2024-09-03T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4053, CAST(N'2024-10-03T00:00:00' AS SmallDateTime), CAST(N'2024-10-03T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4054, CAST(N'2024-11-03T00:00:00' AS SmallDateTime), CAST(N'2024-11-03T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4055, CAST(N'2024-12-03T00:00:00' AS SmallDateTime), CAST(N'2024-12-03T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4056, CAST(N'2025-01-03T00:00:00' AS SmallDateTime), CAST(N'2025-01-03T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4057, CAST(N'2025-02-03T00:00:00' AS SmallDateTime), CAST(N'2025-02-03T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4058, CAST(N'2025-03-03T00:00:00' AS SmallDateTime), CAST(N'2025-03-03T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4059, CAST(N'2025-04-03T00:00:00' AS SmallDateTime), CAST(N'2025-04-03T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4060, CAST(N'2025-05-03T00:00:00' AS SmallDateTime), CAST(N'2025-05-03T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4061, CAST(N'2025-06-03T00:00:00' AS SmallDateTime), CAST(N'2025-06-03T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4062, CAST(N'2024-07-04T00:00:00' AS SmallDateTime), CAST(N'2024-07-04T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4063, CAST(N'2024-08-04T00:00:00' AS SmallDateTime), CAST(N'2024-08-04T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4064, CAST(N'2024-09-04T00:00:00' AS SmallDateTime), CAST(N'2024-09-04T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4065, CAST(N'2024-10-04T00:00:00' AS SmallDateTime), CAST(N'2024-10-04T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4066, CAST(N'2024-11-04T00:00:00' AS SmallDateTime), CAST(N'2024-11-04T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4067, CAST(N'2024-12-04T00:00:00' AS SmallDateTime), CAST(N'2024-12-04T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4068, CAST(N'2025-01-04T00:00:00' AS SmallDateTime), CAST(N'2025-01-04T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4069, CAST(N'2025-02-04T00:00:00' AS SmallDateTime), CAST(N'2025-02-04T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4070, CAST(N'2025-03-04T00:00:00' AS SmallDateTime), CAST(N'2025-03-04T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4071, CAST(N'2025-04-04T00:00:00' AS SmallDateTime), CAST(N'2025-04-04T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4072, CAST(N'2025-05-04T00:00:00' AS SmallDateTime), CAST(N'2025-05-04T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4073, CAST(N'2025-06-04T00:00:00' AS SmallDateTime), CAST(N'2025-06-04T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4074, CAST(N'2024-07-05T00:00:00' AS SmallDateTime), CAST(N'2024-07-05T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4075, CAST(N'2024-08-05T00:00:00' AS SmallDateTime), CAST(N'2024-08-05T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4076, CAST(N'2024-09-05T00:00:00' AS SmallDateTime), CAST(N'2024-09-05T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4077, CAST(N'2024-10-05T00:00:00' AS SmallDateTime), CAST(N'2024-10-05T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4078, CAST(N'2024-11-05T00:00:00' AS SmallDateTime), CAST(N'2024-11-05T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4079, CAST(N'2024-12-05T00:00:00' AS SmallDateTime), CAST(N'2024-12-05T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4080, CAST(N'2025-01-05T00:00:00' AS SmallDateTime), CAST(N'2025-01-05T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4081, CAST(N'2025-02-05T00:00:00' AS SmallDateTime), CAST(N'2025-02-05T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4082, CAST(N'2025-03-05T00:00:00' AS SmallDateTime), CAST(N'2025-03-05T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4083, CAST(N'2025-04-05T00:00:00' AS SmallDateTime), CAST(N'2025-04-05T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4084, CAST(N'2025-05-05T00:00:00' AS SmallDateTime), CAST(N'2025-05-05T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4085, CAST(N'2025-06-05T00:00:00' AS SmallDateTime), CAST(N'2025-06-05T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4086, CAST(N'2024-07-06T00:00:00' AS SmallDateTime), CAST(N'2024-07-06T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4087, CAST(N'2024-08-06T00:00:00' AS SmallDateTime), CAST(N'2024-08-06T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4088, CAST(N'2024-09-06T00:00:00' AS SmallDateTime), CAST(N'2024-09-06T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4089, CAST(N'2024-10-06T00:00:00' AS SmallDateTime), CAST(N'2024-10-06T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4090, CAST(N'2024-11-06T00:00:00' AS SmallDateTime), CAST(N'2024-11-06T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4091, CAST(N'2024-12-06T00:00:00' AS SmallDateTime), CAST(N'2024-12-06T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4092, CAST(N'2025-01-06T00:00:00' AS SmallDateTime), CAST(N'2025-01-06T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4093, CAST(N'2025-02-06T00:00:00' AS SmallDateTime), CAST(N'2025-02-06T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4094, CAST(N'2025-03-06T00:00:00' AS SmallDateTime), CAST(N'2025-03-06T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4095, CAST(N'2025-04-06T00:00:00' AS SmallDateTime), CAST(N'2025-04-06T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4096, CAST(N'2025-05-06T00:00:00' AS SmallDateTime), CAST(N'2025-05-06T23:59:00' AS SmallDateTime), 2)
INSERT [dbo].[LichLamViec] ([IDLichLamViec], [BatDau], [KetThuc], [IDQuanTri]) VALUES (4097, CAST(N'2025-06-06T00:00:00' AS SmallDateTime), CAST(N'2025-06-06T23:59:00' AS SmallDateTime), 2)
SET IDENTITY_INSERT [dbo].[LichLamViec] OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([IDNguoiDung], [HoTen], [Email], [DienThoai], [TaiKhoan], [MatKhau], [IDGioiTinh], [DiaChiCuThe], [SoCMND], [IDTinh], [NhomMau], [ThongTinKhac]) VALUES (1, N'Nguyễn Cường', N'Cuongyd196@gmail.com                                                                                ', N'0812883636          ', N'Cuongyd1                                          ', N'123456              ', 1, N'Định tân - Yên Định', 123456789, 1, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IDNguoiDung], [HoTen], [Email], [DienThoai], [TaiKhoan], [MatKhau], [IDGioiTinh], [DiaChiCuThe], [SoCMND], [IDTinh], [NhomMau], [ThongTinKhac]) VALUES (2, N'Bệnh nhân', NULL, NULL, N'benhnhan                                          ', N'123456              ', 1, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IDNguoiDung], [HoTen], [Email], [DienThoai], [TaiKhoan], [MatKhau], [IDGioiTinh], [DiaChiCuThe], [SoCMND], [IDTinh], [NhomMau], [ThongTinKhac]) VALUES (1003, N'Nguyễn Cường', N'Cuongyd1961@gmail.com                                                                               ', N'0812883636          ', N'admin                                             ', NULL, 1, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IDNguoiDung], [HoTen], [Email], [DienThoai], [TaiKhoan], [MatKhau], [IDGioiTinh], [DiaChiCuThe], [SoCMND], [IDTinh], [NhomMau], [ThongTinKhac]) VALUES (2003, N'Nguyễn Cường', N'Cuongyd1996@gmail.com                                                                               ', N'0812883636          ', N'khach1                                            ', N'123456              ', 1, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IDNguoiDung], [HoTen], [Email], [DienThoai], [TaiKhoan], [MatKhau], [IDGioiTinh], [DiaChiCuThe], [SoCMND], [IDTinh], [NhomMau], [ThongTinKhac]) VALUES (2004, N'Cường', N'admin1@gmail.com                                                                                    ', N'0812883636          ', N'Cuong111                                          ', N'123456              ', 1, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IDNguoiDung], [HoTen], [Email], [DienThoai], [TaiKhoan], [MatKhau], [IDGioiTinh], [DiaChiCuThe], [SoCMND], [IDTinh], [NhomMau], [ThongTinKhac]) VALUES (2005, N'test', N'Admin222@gmail.com                                                                                  ', N'0812883636          ', N'test                                              ', N'123456              ', 2, NULL, NULL, 1, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IDNguoiDung], [HoTen], [Email], [DienThoai], [TaiKhoan], [MatKhau], [IDGioiTinh], [DiaChiCuThe], [SoCMND], [IDTinh], [NhomMau], [ThongTinKhac]) VALUES (2006, N'Tân Nguyễn', N'tata@gmail.com                                                                                      ', NULL, N'tannd                                             ', N'123456              ', 1, NULL, NULL, 3, NULL, NULL)
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
GO
SET IDENTITY_INSERT [dbo].[QuanTri] ON 

INSERT [dbo].[QuanTri] ([IDQuanTri], [TaiKhoan], [MatKhau], [ThongTinBacSi], [TrinhDo], [IDKhoa], [HoTen], [VaiTro], [AnhBia], [ThongtinZoom]) VALUES (2, N'admin                                             ', N'123456              ', NULL, N'', 7, N'Nguyễn Văn Cường', 1, NULL, N'https://zoom.us/j/91107480790?pwd=MW9OQVhxVUI4eStmM1lpVUtaN1k3QT09')
INSERT [dbo].[QuanTri] ([IDQuanTri], [TaiKhoan], [MatKhau], [ThongTinBacSi], [TrinhDo], [IDKhoa], [HoTen], [VaiTro], [AnhBia], [ThongtinZoom]) VALUES (3, N'Bacsy                                             ', N'123456              ', N'Đang làm việc tại bệnh viện Đa khoa Tỉnh Thanh Hóa', N'Thạc sỹ', 6, N'BS CK I Nguyễn Văn Hòa', 2, NULL, NULL)
INSERT [dbo].[QuanTri] ([IDQuanTri], [TaiKhoan], [MatKhau], [ThongTinBacSi], [TrinhDo], [IDKhoa], [HoTen], [VaiTro], [AnhBia], [ThongtinZoom]) VALUES (4, N'Bacsy2                                            ', N'123456              ', N'Đang làm việc tại bệnh viện Đa khoa Tỉnh Thanh Hóa', N'Thạc Sỹ', 1, N'BS Hoa', 2, NULL, NULL)
INSERT [dbo].[QuanTri] ([IDQuanTri], [TaiKhoan], [MatKhau], [ThongTinBacSi], [TrinhDo], [IDKhoa], [HoTen], [VaiTro], [AnhBia], [ThongtinZoom]) VALUES (1004, N'Bacsy3                                            ', N'123456              ', N'Đang làm việc tại bệnh viện Đa khoa Tỉnh Thanh Hóa', N'Thạc sỹ', 2, N'BS Trang', 2, NULL, NULL)
INSERT [dbo].[QuanTri] ([IDQuanTri], [TaiKhoan], [MatKhau], [ThongTinBacSi], [TrinhDo], [IDKhoa], [HoTen], [VaiTro], [AnhBia], [ThongtinZoom]) VALUES (1005, N'Bacsy4                                            ', N'123456              ', N'Đang làm việc tại bệnh viện Đa khoa Tỉnh Thanh Hóa', N'Thạc sỹ', 3, N'BS Cường', 2, NULL, N'https://zoom.us/j/91107480790?pwd=MW9OQVhxVUI4eStmM1lpVUtaN1k3QT09')
INSERT [dbo].[QuanTri] ([IDQuanTri], [TaiKhoan], [MatKhau], [ThongTinBacSi], [TrinhDo], [IDKhoa], [HoTen], [VaiTro], [AnhBia], [ThongtinZoom]) VALUES (1008, N'BsTan                                             ', N'123456              ', N'Đang làm việc tại bệnh viện Đa khoa Tỉnh Thanh Hóa', N'Tiến sỹ', 6, N'Tân', 2, NULL, NULL)
INSERT [dbo].[QuanTri] ([IDQuanTri], [TaiKhoan], [MatKhau], [ThongTinBacSi], [TrinhDo], [IDKhoa], [HoTen], [VaiTro], [AnhBia], [ThongtinZoom]) VALUES (1009, N'tuvan                                             ', N'123456              ', N'Đang làm việc tại bệnh viện Đa khoa Tỉnh Thanh Hóa', N'middle', NULL, N'Tân', 3, NULL, NULL)
INSERT [dbo].[QuanTri] ([IDQuanTri], [TaiKhoan], [MatKhau], [ThongTinBacSi], [TrinhDo], [IDKhoa], [HoTen], [VaiTro], [AnhBia], [ThongtinZoom]) VALUES (1010, N'yta                                               ', N'123456              ', N'Đang làm việc tại bệnh viện Đa khoa Tỉnh Thanh Hóa', N'Sinh viên', NULL, N'Y tá', 4, NULL, NULL)
SET IDENTITY_INSERT [dbo].[QuanTri] OFF
GO
SET IDENTITY_INSERT [dbo].[Solieucovid] ON 

INSERT [dbo].[Solieucovid] ([IDThongkecovid], [Quocgia], [Socanhiem], [Dangdieutri], [Khoi], [Tuvong], [Ghichu]) VALUES (1, N'VIỆT NAM', 335, 25, 330, 0, NULL)
INSERT [dbo].[Solieucovid] ([IDThongkecovid], [Quocgia], [Socanhiem], [Dangdieutri], [Khoi], [Tuvong], [Ghichu]) VALUES (2, N'THẾ GIỚI', 10248232, 4187331, 5556439, 504462, NULL)
SET IDENTITY_INSERT [dbo].[Solieucovid] OFF
GO
SET IDENTITY_INSERT [dbo].[TinhThanh] ON 

INSERT [dbo].[TinhThanh] ([IDTinh], [TenTinh]) VALUES (1, N'Thanh Hóa')
INSERT [dbo].[TinhThanh] ([IDTinh], [TenTinh]) VALUES (2, N'Hà Nội')
INSERT [dbo].[TinhThanh] ([IDTinh], [TenTinh]) VALUES (3, N'Hồ Chí Minh')
SET IDENTITY_INSERT [dbo].[TinhThanh] OFF
GO
SET IDENTITY_INSERT [dbo].[Tintuc] ON 

INSERT [dbo].[Tintuc] ([IDTintuc], [Tieude], [Noidung], [Hinhanh], [Mota], [Ngaydang], [TheLoai]) VALUES (1, N'5 việc cần làm tốt để phòng chống dịch COVID-19', N'<p>(Thứ 4, 01/07/2020 17:10)</p>

<p><strong>Ng&agrave;y 20/4/2020, Bộ Y tế - B&aacute;o Sức khỏe &amp; Đời sống ch&iacute;nh thức ra mắt 2 clip viral với nội dung tuy&ecirc;n truyền khuyến c&aacute;o của Ban chỉ đạo Quốc gia ph&ograve;ng chống dịch COVID-19 về 5 việc cần l&agrave;m tốt v&agrave; 7 th&oacute;i quen cần thay đổi trong m&ugrave;a dịch.</strong></p>

<p>C&aacute;c cầu thủ b&oacute;ng đ&aacute; Đội tuyển Quốc gia Việt Nam: B&ugrave;i Tiến Dũng (thủ m&ocirc;n), Quế Ngọc Hải, C&ocirc;ng Phượng, Duy Mạnh, Tuấn Anh đ&atilde; c&ugrave;ng nhau truyền đi th&ocirc;ng điệp về 5 việc cần l&agrave;m tốt theo khuyến c&aacute;o của Ban Chỉ đạo Quốc gia ph&ograve;ng chống dịch COVID-19.</p>

<p>&nbsp;</p>

<p><img alt="" src="https://media.suckhoedoisong.vn/Images/phamquynh/2020/04/20/5.jpg" style="height:354px; width:800px" /></p>

<p>&nbsp;</p>

<p><strong>Nguồn: B&aacute;o Sức khỏe&amp;Đời sống</strong></p>
', N'/Images/images/phongtranh.jpg', N' Khuyến cáo của Ban chỉ đạo Quốc gia phòng chống dịch COVID-19 về 5 việc cần làm tốt và 7 thói quen cần thay đổi trong mùa dịch.', CAST(N'2020-07-01T00:00:00' AS SmallDateTime), N'new                 ')
INSERT [dbo].[Tintuc] ([IDTintuc], [Tieude], [Noidung], [Hinhanh], [Mota], [Ngaydang], [TheLoai]) VALUES (2, N'10 lời khuyên phòng chống virus corona của bác sĩ BV Việt Đức', N'<h3>10 lời khuy&ecirc;n ph&ograve;ng chống virus corona của b&aacute;c sĩ BV Việt Đức: Điều cuối c&ugrave;ng quan trọng nhất nhưng người Việt &iacute;t khi tạo th&agrave;nh th&oacute;i quen!</h3>

<p>(Thứ 4, 01/07/2020 20:29)</p>

<p><strong>Dịp Tết Nguy&ecirc;n đ&aacute;n năm nay, người d&acirc;n kh&ocirc;ng khỏi lo sợ trước sự xuất hiện của virus corona - nguy&ecirc;n nh&acirc;n g&acirc;y n&ecirc;n bệnh vi&ecirc;m phổi lạ đang l&acirc;y lan khắp nơi tr&ecirc;n thế giới. Việt Nam cũng đ&atilde; ghi nhận 2 ca dương t&iacute;nh với loại virus n&agrave;y tại BV Chợ Rẫy.</strong></p>

<p>B&aacute;c sĩ Trần Quốc Kh&aacute;nh cảnh b&aacute;o: &quot;D&ugrave; h&ocirc;m nay l&agrave; 30 tết rồi, nhưng dịch bệnh th&igrave; kh&ocirc;ng&hellip;.nghỉ tết&quot;</p>

<p>&nbsp;</p>

<p>Dịp Tết Nguy&ecirc;n đ&aacute;n năm nay, người d&acirc;n kh&ocirc;ng khỏi lo sợ trước sự xuất hiện của virus corona - nguy&ecirc;n nh&acirc;n g&acirc;y n&ecirc;n bệnh vi&ecirc;m phổi lạ đang l&acirc;y lan khắp nơi tr&ecirc;n thế giới. Việt Nam cũng đ&atilde; ghi nhận 2 ca dương t&iacute;nh với loại virus n&agrave;y tại BV Chợ Rẫy.&nbsp;</p>

<p>Được biết, bệnh nh&acirc;n l&agrave; 2 cha con người Trung Quốc di chuyển từ t&acirc;m dịch Vũ H&aacute;n sang Việt Nam qua đường h&agrave;ng kh&ocirc;ng. Sau khi hạ c&aacute;nh xuống H&agrave; Nội, họ đ&atilde; di chuyển tới Nha Trang, TP. HCM v&agrave; Long An. Hiện tại, t&igrave;nh h&igrave;nh sức khỏe của 2 bệnh nh&acirc;n n&agrave;y đ&atilde; c&oacute; chuyển biến t&iacute;ch cực v&agrave; c&oacute; thể sớm xuất viện</p>

<p>D&ugrave; Tổ chức Y tế Thế giới WHO cho rằng c&ograve;n qu&aacute; sớm để c&ocirc;ng bố đ&acirc;y l&agrave; vấn đề y tế khẩn cấp to&agrave;n cầu, người d&acirc;n tuyệt đối kh&ocirc;ng được chủ quan trước mức độ nguy hiểm của virus corona. Mới đ&acirc;y, b&aacute;c sĩ &quot;ngh&igrave;n like&quot; Trần Quốc Kh&aacute;nh - hiện đang c&ocirc;ng t&aacute;c tại BV Việt Đức - đ&atilde; l&ecirc;n tiếng nhắc nhở mọi người phải đề ph&ograve;ng dịch vi&ecirc;m phổi Vũ H&aacute;n th&ocirc;ng qua b&agrave;i đăng tr&ecirc;n trang c&aacute; nh&acirc;n của m&igrave;nh.&nbsp;</p>

<p><a href="http://cafefcdn.com/2020/1/24/goi-vong-o-ba-vang-bac-si-can-loi-voi-chuyen-nghiep-chua-dau-lun-22575a-1579853439911160174527.jpg" target="_blank" title="Bác sĩ Trần Quốc Khánh"><img alt="10 lời khuyên phòng chống virus corona của bác sĩ BV Việt Đức: Điều cuối cùng quan trọng nhất nhưng người Việt ít khi tạo thành thói quen! - Ảnh 1." id="img_05371260-3e81-11ea-a16d-7169e0724d02" src="http://cafefcdn.com/thumb_w/640/2020/1/24/goi-vong-o-ba-vang-bac-si-can-loi-voi-chuyen-nghiep-chua-dau-lun-22575a-1579853439911160174527.jpg" title="10 lời khuyên phòng chống virus corona của bác sĩ BV Việt Đức: Điều cuối cùng quan trọng nhất nhưng người Việt ít khi tạo thành thói quen! - Ảnh 1." /></a></p>

<p>B&aacute;c sĩ Trần Quốc Kh&aacute;nh</p>

<p><em>&quot;TH&Ocirc;NG B&Aacute;O KHẨN! Đại dịch đang trở lại????</em></p>

<p><em>Anh chị ơi, Việt Nam đ&atilde; c&oacute; 2 bệnh nh&acirc;n nghi ngờ nhiễm vi-r&uacute;t Corona, những người n&agrave;y đi từ Vũ H&aacute;n-Trung Quốc qua H&agrave; Nội, rồi v&agrave;o Nha Trang, S&agrave;i G&ograve;n, Long An v&agrave; hiện nay đang nhập viện c&aacute;ch ly tại th&agrave;nh phố Hồ Ch&iacute; Minh.</em></p>

<p><em>Tại Trung Quốc, rất nhiều bệnh nh&acirc;n tử vong v&agrave; bệnh dịch đ&atilde; vượt ra ngo&agrave;i tầm kiểm so&aacute;t rồi d&ugrave; ch&iacute;nh phủ phong toả th&agrave;nh phố Vũ H&aacute;n với 11 triệu d&acirc;n. Theo Tổ chức Y tế Thế giới, Trung Quốc đ&atilde; xử l&yacute; ban đầu với vir&uacute;t n&agrave;y v&ocirc; c&ugrave;ng chậm chạp v&agrave; kh&ocirc;ng chuy&ecirc;n nghiệp dẫn đến hi&ecirc;n nay, rất nhiều quốc gia tr&ecirc;n thế giới ghi nhận c&oacute; trường hợp nhiễm Corona Virus. Nguy cơ b&ugrave;ng ph&aacute;t th&agrave;nh đại dịch nghi&ecirc;m trọng hơn cả SARS c&aacute;ch đ&acirc;y 17 năm đang dần trở th&agrave;nh hiện thực&hellip;</em></p>

<p><em>TẤT CẢ CH&Uacute;NG TA đều c&oacute; thể nhiễm vi-r&uacute;t n&agrave;y =&gt; suy hố hấp, tử vong rất nhanh.</em></p>

<p><em>Vậy với người d&acirc;n, ch&uacute;ng ta cần lưu &yacute; những g&igrave;?</em></p>

<p><em>1. Giữ ấm cơ thể, vệ sinh c&aacute; nh&acirc;n, rửa tay thường xuy&ecirc;n bằng x&agrave; ph&ograve;ng, s&uacute;c họng bằng nước s&aacute;t khuẩn miệng trước khi đi ngủ, sau khi ngủ dậy cũng như trước v&agrave; sau khi tiếp x&uacute;c với cộng đồng cư d&acirc;n đ&ocirc;ng đ&uacute;c để dự ph&ograve;ng nhiễm bệnh. Anh chị n&ecirc;n mua lọ s&aacute;t khuẩn tay nhanh mang theo b&ecirc;n m&igrave;nh nh&eacute;!</em></p>

<p><em>2. D&ugrave; ng&agrave;y tết nhưng cũng n&ecirc;n hạn chế tham dự những sự kiện qu&aacute; đ&ocirc;ng người, đặc biệt những khu vực hai bệnh nh&acirc;n ở tr&ecirc;n đ&atilde; đi qua.</em></p>

<p><em>3. Tất cả những người trở về từ th&agrave;nh phố Vũ H&aacute;n, tỉnh Hồ Bắc, Trung Quốc hoặc c&aacute;c tỉnh/th&agrave;nh phố kh&aacute;c của Trung Quốc đang c&oacute; dịch hoặc c&oacute; tiếp x&uacute;c gần với người mắc bệnh vi&ecirc;m đường h&ocirc; hấp cấp t&iacute;nh do vi-r&uacute;t Corona trong v&ograve;ng 14 ng&agrave;y nếu c&oacute; dấu hiệu sốt, ho, kh&oacute; thở, cần đến ngay cơ sở y tế gần nhất để được tư vấn, kh&aacute;m, điều trị kịp thời.</em></p>

<p><a href="http://cafefcdn.com/2020/1/24/image-15798534674001252493098.jpg" title="Virus Corona đang trở thành "><img alt="10 lời khuyên phòng chống virus corona của bác sĩ BV Việt Đức: Điều cuối cùng quan trọng nhất nhưng người Việt ít khi tạo thành thói quen! - Ảnh 2." id="img_159808d0-3e81-11ea-8633-3b12238a3cae" src="http://cafefcdn.com/thumb_w/640/2020/1/24/image-15798534674001252493098.jpg" title="10 lời khuyên phòng chống virus corona của bác sĩ BV Việt Đức: Điều cuối cùng quan trọng nhất nhưng người Việt ít khi tạo thành thói quen! - Ảnh 2." /></a></p>

<p>Virus Corona đang trở th&agrave;nh &quot;cơn &aacute;c mộng&quot; của nhiều người d&acirc;n ch&acirc;u &Aacute; trong dịp Tết n&agrave;y.</p>

<p><em>4. Lu&ocirc;n lu&ocirc;n che miệng v&agrave; mũi khi ho hoặc hắt hơi bằng khăn vải hoặc khăn tay để l&agrave;m giảm ph&aacute;t t&aacute;n c&aacute;c dịch tiết đường h&ocirc; hấp. Mỗi người n&ecirc;n sắm cho m&igrave;nh 1 khăn m&ugrave;i soa để trong t&uacute;i quần khi đi&hellip;.chơi tết nh&eacute;! B&aacute;c sĩ n&oacute;i thật l&ograve;ng.</em></p>

<p><em>5. Hạn chế tiếp x&uacute;c với ch&oacute; m&egrave;o v&agrave; c&aacute;c động vật nu&ocirc;i kh&aacute;c, mấy ng&agrave;y tới cũng n&ecirc;n hạn chế v&agrave;o c&aacute;c vườn th&uacute;. C&aacute;c loại thịt v&agrave; trứng cần nấu chin kỹ, anh chị nh&eacute;!</em></p>

<p><em>6. Uống nhiều nước, tăng cường ăn tr&aacute;i c&acirc;y như cam-bưởi-chanh-v&agrave; những hoa quả nhiều VitaminC. Hoặc mua vi&ecirc;n sủi MultiVitamin về uống nh&eacute;!</em></p>

<p><em>7. Duy tr&igrave; tập thể dục mỗi ng&agrave;y để n&acirc;ng cao sức đề kh&aacute;ng.</em></p>

<p><em>8. Bất cứ ai c&oacute; dấu hiệu sốt (cặp nhiệt độ tr&ecirc;n 38 độ C), ho, tức ngực, kh&oacute; thở, đau nhức xương khớp....cần c&aacute;ch l&yacute; với người th&acirc;n v&agrave; bạn b&egrave; ngay (ở ph&ograve;ng ri&ecirc;ng, kh&ocirc;ng n&ecirc;n ra ngo&agrave;i v&agrave; tiếp x&uacute;c với mọi người). Đeo khẩu trang li&ecirc;n tục, uống nhiều nước, d&ugrave;ng thuốc giảm đau chống c&uacute;m (như Tylenol, Dayquil, Nightquil, Ibuprofen, ..) cũng như tăng cường ăn uống để kiểm so&aacute;t v&agrave; chữa triệu chứng. Song song đ&oacute; l&agrave; b&aacute;o ngay cơ quan y tế gần nhất để xin được tư vấn.</em></p>

<p><em>9. Bất cứ ai, ở nơi đ&acirc;u... khi ph&aacute;t hiện bệnh nh&acirc;n nghi ngờ (sốt-ho-kh&oacute; thở-đau nhức xương khớp) cần th&ocirc;ng tin cho cơ quan y tế, ch&iacute;nh quyền địa phương để gi&aacute;m s&aacute;t, xử l&yacute;, ứng ph&oacute;, kh&ocirc;ng để dịch b&ugrave;ng ph&aacute;t, l&acirc;y lan.</em></p>

<p><em>10. Hằng năm mỗi người n&ecirc;n đi ti&ecirc;m vắc xin để dự ph&ograve;ng những chủng c&uacute;m. Chắc rất &iacute;t trong số ch&uacute;ng ta tạo th&oacute;i quen đi ti&ecirc;m v&aacute;c xin ph&ograve;ng c&uacute;m hằng năm. Chủ quan của b&aacute;c sĩ dự đo&aacute;n vậy.</em></p>

<p><em>D&ugrave; h&ocirc;m nay l&agrave; 30 tết rồi, nhưng dịch bệnh th&igrave; kh&ocirc;ng&hellip;.nghỉ tết. Vậy n&ecirc;n b&aacute;c sĩ rất mong anh chị lưu &yacute; những th&ocirc;ng tin tr&ecirc;n nh&eacute;! Điều g&igrave; l&agrave;m được th&igrave; thực hiện lu&ocirc;n (mua khăn m&ugrave;i soa, uống Vitamin, tập thể dục, giữ ấm, hạn chế tiếp x&uacute;c chỗ đ&ocirc;ng người, che miệng kỹ khi ho&hellip;).</em></p>

<p><em>Ngo&agrave;i ra b&aacute;c sĩ cũng rất mong anh chị &#39;Share&#39; gi&uacute;p th&ocirc;ng b&aacute;o n&agrave;y tới cộng đồng với. Nguyện cầu &#39;đại dịch SARS&#39; phi&ecirc;n bản mới kh&ocirc;ng trở lại!</em></p>

<p><em>CH&Uacute;C MỪNG NĂM MỚI!</em></p>

<p><em>Bs Kh&aacute;nh,&quot;</em></p>
', N'/Images/images/10loi.jpg', N'10 lời khuyên phòng chống virus corona của bác sĩ BV Việt Đức: Điều cuối cùng quan trọng nhất nhưng người Việt ít khi tạo thành thói quen!', CAST(N'2020-01-07T00:00:00' AS SmallDateTime), N'hot                 ')
INSERT [dbo].[Tintuc] ([IDTintuc], [Tieude], [Noidung], [Hinhanh], [Mota], [Ngaydang], [TheLoai]) VALUES (1002, N'Chuyên gia chỉ cách tăng cường sức khỏe - Giữ vững tinh thần - Vượt qua đại dịch', N'<h3>Chuy&ecirc;n gia chỉ c&aacute;ch tăng cường sức khỏe - Giữ vững tinh thần - Vượt qua đại dịch</h3>

<p>(Thứ 4, 01/07/2020 22:08)</p>

<p><strong>B&aacute;o điện tử Sức khỏe&amp;Đời sống tổ chức buổi tư vấn truyền h&igrave;nh trực tuyến với chủ đề &ldquo;Tăng cường sức khỏe - Giữ vững tinh thần - Vượt qua đại dịch&rdquo; v&agrave;o 15h00, Thứ Hai, ng&agrave;y 13/04/2020. Chương tr&igrave;nh được ph&aacute;t trực tiếp tr&ecirc;n b&aacute;o điện tử Suckhoedoisong.vn, tr&ecirc;n k&ecirc;nh Youtube v&agrave; fanpage của b&aacute;o Sức khoẻ&amp;Đời sống.</strong></p>

<p>&nbsp;</p>

<p>C&oacute; một thực tế kh&ocirc;ng thể phủ nhận, đại dịch COVID-19 kh&ocirc;ng chỉ l&agrave; &ldquo;cơn lốc đen&rdquo; tấn c&ocirc;ng v&agrave;o hệ h&ocirc; hấp v&agrave; cướp đi sinh mạng của h&agrave;ng trăm ng&agrave;n người tr&ecirc;n thế giới, m&agrave; n&oacute; c&ograve;n mang đến rất nhiều hệ lụy. Một trong số những hệ lụy đ&oacute;, ch&iacute;nh l&agrave; đời sống t&acirc;m l&yacute;, tinh thần, sức khỏe t&acirc;m thần của nhiều người đ&atilde; đang v&agrave; sẽ bị tổn thương nghi&ecirc;m trọng.</p>

<p>Một cuộc khảo s&aacute;t của Hiệp hội T&acirc;m l&yacute; học Trung Quốc thực hiện v&agrave;o cuối th&aacute;ng 3/2020 cho thấy, 18.000 người được chẩn đo&aacute;n hội chứng lo lắng li&ecirc;n quan đến sự b&ugrave;ng ph&aacute;t dịch COVID -19, hơn 5.000 người được đ&aacute;nh gi&aacute; rối loạn căng thẳng sau sang chấn t&acirc;m l&yacute; (PTSD); trong đ&oacute; c&oacute; 21,5% c&oacute; biểu hiện rối loạn r&otilde; rệt.&nbsp; Tại H&agrave;n Quốc, khi đại dịch b&ugrave;ng ph&aacute;t, ch&iacute;nh quyền Seoul cũng đ&atilde; phải tăng cường c&aacute;c dịch vụ về hỗ trợ, tư vấn t&acirc;m l&yacute;.</p>

<p>Mới đ&acirc;y nhất, tại Việt Nam, kết quả nghi&ecirc;n cứu của nh&oacute;m t&aacute;c giả Việt Nam - Đ&agrave;i Loan khảo s&aacute;t, đ&aacute;nh gi&aacute; tr&ecirc;n 3.947 người mang biểu hiện ho, sốt v&agrave; triệu chứng nghi nhiễm COVID -19 tại c&aacute;c cơ sở y tế Th&aacute;i Nguy&ecirc;n, Thừa Thi&ecirc;n Huế, TP.HCM cho thấy 64,3% người c&oacute; dấu hiệu trầm cảm.</p>

<p>R&otilde; r&agrave;ng, đại dịch COVID-19 đ&atilde;, đang v&agrave; sẽ khiến tinh thần v&agrave; t&acirc;m l&yacute; rất nhiều người bị tổn thương.</p>

<p>Do đ&oacute;, nhằm cung cấp cho kh&aacute;n giả, bạn đọc của b&aacute;o Sức Khỏe v&agrave; Đời Sống, Cơ quan Ng&ocirc;n luận của Bộ Y tế, những th&ocirc;ng tin hữu &iacute;ch nhất về sự tấn c&ocirc;ng của COVID-19 đến tinh thần v&agrave; t&acirc;m l&yacute; của mọi người cũng như sự ảnh hưởng gi&aacute;n tiếp của COVID - 19 đến c&aacute;c bệnh nh&acirc;n tim mạch v&agrave; c&aacute;c bệnh l&yacute; kh&aacute;c, g&iacute;up họ giữ vững tinh thần, tăng cường sức khỏe to&agrave;n diện để vượt qua đại dịch COVD-19. B&aacute;o điện tử Sức khỏe &amp; Đời sống - suckhoedoisong.vn tổ chức buổi tư vấn truyền h&igrave;nh trực tuyến với chủ đề&nbsp;&ldquo;Tăng cường sức khỏe - Giữ vững tinh thần - Vượt qua đại dịch&rdquo;&nbsp;v&agrave;o 15h00, Thứ Hai ng&agrave;y 13/4/2020.</p>

<p>Kh&aacute;ch mời tham gia chương tr&igrave;nh gồm:</p>

<p><em>Thiếu tướng, PGS.TS.BS. Nguyễn Hồng Sơn - Gi&aacute;m đốc BV Qu&acirc;n y 175, Bộ Quốc Ph&ograve;ng</em></p>

<p><em><img alt="" src="https://media.suckhoedoisong.vn/Images/anquy/2020/04/11/Thiu_tng.PGS.TS.BS_NguyenHongSon.jpg" style="height:596px; width:700px" /></em></p>

<p><em>GS.TS.BS Đặng Vạn Phước - Trưởng khoa Y, Đại học Quốc gia TP. Hồ Ch&iacute; Minh; Chủ tịch Hội Tim mạch học Việt Nam</em></p>

<p>&nbsp;</p>

<p><em><img alt="" src="https://media.suckhoedoisong.vn/Images/anquy/2020/04/11/GS.TS.BS_ng_Vn_Phc.jpg" style="height:533px; width:700px" /></em></p>

<p><em>TSKH. Vũ C&ocirc;ng Lập - Nguy&ecirc;n Viện trưởng Viện Vật l&yacute; Y sinh</em></p>

<p><em><img alt="" src="https://media.suckhoedoisong.vn/Images/nguyenhong/2020/04/11/Nha_bao.TSKH_Vu_Cong_Lap_final.JPG" style="height:597px; width:700px" /></em></p>

<p><em>MC, ThS. BS. Nguyễn Hồ Vĩnh Phước</em></p>

<p><em><img alt="" src="https://media.suckhoedoisong.vn/Images/anquy/2020/03/19/BS.NguyenHoVinhPhuoc_NamKhoa.jpg" style="height:560px; width:373px" /></em></p>

<p>&nbsp;</p>

<p><a href="https://suckhoedoisong.vn/truyen-hinh-truc-tiep-tang-cuong-suc-khoe-giu-vung-tinh-than-vuot-qua-dai-dich-n172099.html">Nguồn: B&aacute;o Sức khỏe&amp;Đời sống</a></p>
', N'/Images/images/sk.jpg', N' Có một thực tế không thể phủ nhận, đại dịch COVID-19 không chỉ là “cơn lốc đen” tấn công vào hệ hô hấp và cướp đi sinh mạng của hàng trăm ngàn người trên thế giới, mà nó còn mang đến rất nhiều hệ lụy....', CAST(N'2020-02-07T00:00:00' AS SmallDateTime), N'hot                 ')
SET IDENTITY_INSERT [dbo].[Tintuc] OFF
GO
SET IDENTITY_INSERT [dbo].[TrungTamGanNhat] ON 

INSERT [dbo].[TrungTamGanNhat] ([IDTrungTam], [TenTrungTam], [Mota], [IDTinh]) VALUES (1, N'Bệnh viện huyện Yên Định', N'<table cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td>
			<p><strong>Bệnh viện đa khoa huyện Y&ecirc;n Định</strong></p>

			<p>Địa chỉ: Th&ocirc;n T&acirc;n Ngữ, x&atilde; Định Long, huyện Y&ecirc;n Định, tỉnh Thanh &nbsp;H&oacute;a</p>

			<p>Điện thoại: 0866.853.585 - 0966.131.212&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>

			<p>Email: benhviendkyendinh@gmail.com</p>
			</td>
		</tr>
	</tbody>
</table>

<p><span style="font-size:20px"><span style="color:#3498db"><strong>Xem tr&ecirc;n Google MAP&nbsp;&nbsp;&diams;</strong></span></span></p>

<p><iframe frameborder="0" height="450" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3749.7270731416497!2d105.6430828148657!3d19.977976986576884!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3136f31e9c2b2269%3A0x561141e2b3580c2c!2zQuG7h25oIFZp4buHbiDEkGEgS2hvYSBIdXnhu4duIFnDqm4gxJDhu4tuaA!5e0!3m2!1svi!2s!4v1593795438149!5m2!1svi!2s" style="border:0;" width="600"></iframe></p>
', 1)
INSERT [dbo].[TrungTamGanNhat] ([IDTrungTam], [TenTrungTam], [Mota], [IDTinh]) VALUES (3, N'Bệnh viện Thành phố Thanh HÓA', N'<table cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td>
			<p><strong>Bệnh viện đa khoa huyện Y&ecirc;n Định</strong></p>

			<p>Địa chỉ: Th&ocirc;n T&acirc;n Ngữ, x&atilde; Định Long, huyện Y&ecirc;n Định, tỉnh Thanh &nbsp;H&oacute;a</p>

			<p>Điện thoại: 0866.853.585 - 0966.131.212&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>

			<p>Email: benhviendkyendinh@gmail.com</p>
			</td>
		</tr>
	</tbody>
</table>

<p><span style="font-size:20px"><span style="color:#3498db"><strong>Xem tr&ecirc;n Google MAP&nbsp;&nbsp;&diams;</strong></span></span></p>

<p><iframe frameborder="0" height="450" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3749.7270731416497!2d105.6430828148657!3d19.977976986576884!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3136f31e9c2b2269%3A0x561141e2b3580c2c!2zQuG7h25oIFZp4buHbiDEkGEgS2hvYSBIdXnhu4duIFnDqm4gxJDhu4tuaA!5e0!3m2!1svi!2s!4v1593795438149!5m2!1svi!2s" style="border:0;" width="600"></iframe></p>
', 1)
INSERT [dbo].[TrungTamGanNhat] ([IDTrungTam], [TenTrungTam], [Mota], [IDTinh]) VALUES (4, N'Bệnh viện Bạch Mai', N'<p>&nbsp;</p>

<p>Địa chỉ: 78 Đường Giải Ph&oacute;ng, Phương Mai, Đống Đa, H&agrave; Nội - Tel: 844 3869 3731 - Fax : 844 3869 1607</p>

<p>GS.TS. Ng&ocirc; Qu&yacute; Ch&acirc;u - Ph&oacute; Gi&aacute;m đốc phụ tr&aacute;ch Bệnh viện Bạch Mai</p>

<p><span style="color:#3498db"><span style="font-size:20px"><strong>Xem tr&ecirc;n Google MAP&nbsp;&nbsp;&diams;</strong></span></span></p>

<p><iframe frameborder="0" height="450" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.7925292180416!2d105.83849671488298!3d21.000952086013474!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ac7a76c79c0f%3A0xa37d3ed4526ea954!2zQuG7h25oIFZp4buHbiBC4bqhY2ggTWFp!5e0!3m2!1svi!2s!4v1593797032006!5m2!1svi!2s" style="border:0;" width="600"></iframe></p>
', 2)
INSERT [dbo].[TrungTamGanNhat] ([IDTrungTam], [TenTrungTam], [Mota], [IDTinh]) VALUES (5, N'Bệnh viện Quân Y 108', N'<p><span style="font-size:16px">Địa chỉ: Số 1 Trần Hưng Đạo, Hai B&agrave; Trưng, H&agrave; Nội<br />
E-mail: bvtuqd108@benhvien108.vn<br />
Điện thoại: 069. 572400</span></p>

<p><span style="color:#3498db"><span style="font-size:20px"><strong>Xem tr&ecirc;n Google MAP&nbsp;&nbsp;&diams;</strong></span></span></p>

<p><iframe frameborder="0" height="450" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.3659395033696!2d105.85936401488325!3d21.018038986004203!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abee2cabbe6f%3A0xa87d18d26d9dc536!2zQuG7h25oIHZp4buHbiBUcnVuZyDGsMahbmcgUXXDom4gxJHhu5lpIDEwOA!5e0!3m2!1svi!2s!4v1593797143005!5m2!1svi!2s" style="border:0;" width="600"></iframe></p>
', 2)
INSERT [dbo].[TrungTamGanNhat] ([IDTrungTam], [TenTrungTam], [Mota], [IDTinh]) VALUES (1002, N'Bệnh viện Đa khoa tỉnh Thanh hóa', N'<p>Địa chỉ: Số 181 Hải Thượng L&atilde;n &Ocirc;ng- Phường Đ&ocirc;ng Vệ - TP Thanh H&oacute;a</p>

<p>Ph&ograve;ng Kế hoạch - Tổng hợp</p>

<p>Điện thoại:&nbsp;<strong>0237.3951467</strong></p>

<p>lienhe@bvdktinhthanhhoa.com.vn</p>

<p><span style="color:#3498db"><span style="font-size:20px"><strong>Xem tr&ecirc;n Google MAP&nbsp;&nbsp;&diams;</strong></span></span></p>

<p><iframe frameborder="0" height="450" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3754.484405229686!2d105.76961681486254!3d19.777048786689587!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3136f8700bffffff%3A0x787356e80997f10a!2zQsOqzKNuaCB2acOqzKNuIMSQYSBraG9hIHThu4luaCBUaGFuaCBIb2HMgQ!5e0!3m2!1svi!2s!4v1593764068983!5m2!1svi!2s" style="border:0;" width="600"></iframe></p>
', 1)
INSERT [dbo].[TrungTamGanNhat] ([IDTrungTam], [TenTrungTam], [Mota], [IDTinh]) VALUES (2002, N'Bệnh viện Đại học Y dược TP.HCM', N'<h4>215 Hồng B&agrave;ng, P.11, Q.5,TP.HCM</h4>

<p>Điện thoại: (84.28) 3855 4269</p>

<p>Fax: (84.28) 3950 6126</p>

<p>Email:&nbsp;<a href="mailto:bvdhyd@umc.edu.vn">bvdhyd@umc.edu.vn</a></p>

<p>Website:&nbsp;<a href="http://www.bvdaihoc.com.vn/" target="_blank">www.bvdaihoc.com.vn</a></p>

<p><span style="font-size:20px"><span style="color:#3498db"><strong>Xem tr&ecirc;n Google MAP&nbsp;&nbsp;&diams;</strong></span></span></p>
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.7305199538746!2d106.66228201474868!3d10.755239892335908!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752efa87dc6d6d%3A0x4feb0a1e755b6d62!2zQuG7h25oIHZp4buHbiDEkOG6oWkgaOG7jWMgWSBkxrDhu6NjIFRQLkhDTQ!5e0!3m2!1svi!2s!4v1593797261694!5m2!1svi!2s" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>', 3)
SET IDENTITY_INSERT [dbo].[TrungTamGanNhat] OFF
GO
ALTER TABLE [dbo].[HoiDap] ADD  CONSTRAINT [DF_HoiDap_NgayGui]  DEFAULT (getdate()) FOR [NgayGui]
GO
ALTER TABLE [dbo].[HoiDap] ADD  CONSTRAINT [DF_HoiDap_TrangThai]  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[HoSoSucKhoe] ADD  DEFAULT (getdate()) FOR [CreateOn]
GO
ALTER TABLE [dbo].[Tintuc] ADD  CONSTRAINT [DF_Tintuc_Ngaydang]  DEFAULT (getdate()) FOR [Ngaydang]
GO
ALTER TABLE [dbo].[BenhAn]  WITH CHECK ADD  CONSTRAINT [FK_BenhAn_LichKham] FOREIGN KEY([IDLichKham])
REFERENCES [dbo].[LichKham] ([IDLichKham])
GO
ALTER TABLE [dbo].[BenhAn] CHECK CONSTRAINT [FK_BenhAn_LichKham]
GO
ALTER TABLE [dbo].[BenhAn]  WITH CHECK ADD  CONSTRAINT [FK_BenhAn_NguoiDung] FOREIGN KEY([IDNguoiDung])
REFERENCES [dbo].[NguoiDung] ([IDNguoiDung])
GO
ALTER TABLE [dbo].[BenhAn] CHECK CONSTRAINT [FK_BenhAn_NguoiDung]
GO
ALTER TABLE [dbo].[HoiDap]  WITH CHECK ADD  CONSTRAINT [FK_HoiDap_NguoiDung] FOREIGN KEY([IDNguoiDung])
REFERENCES [dbo].[NguoiDung] ([IDNguoiDung])
GO
ALTER TABLE [dbo].[HoiDap] CHECK CONSTRAINT [FK_HoiDap_NguoiDung]
GO
ALTER TABLE [dbo].[HoiDap]  WITH CHECK ADD  CONSTRAINT [FK_HoiDap_QuanTri] FOREIGN KEY([IDQuanTri])
REFERENCES [dbo].[QuanTri] ([IDQuanTri])
GO
ALTER TABLE [dbo].[HoiDap] CHECK CONSTRAINT [FK_HoiDap_QuanTri]
GO
ALTER TABLE [dbo].[HoSoSucKhoe]  WITH NOCHECK ADD  CONSTRAINT [FK_HoSoSucKhoe_NguoiDung] FOREIGN KEY([IDNguoiDung])
REFERENCES [dbo].[NguoiDung] ([IDNguoiDung])
GO
ALTER TABLE [dbo].[HoSoSucKhoe] CHECK CONSTRAINT [FK_HoSoSucKhoe_NguoiDung]
GO
ALTER TABLE [dbo].[HoSoSucKhoe]  WITH NOCHECK ADD  CONSTRAINT [FK_HoSoSucKhoe_QuanTri] FOREIGN KEY([IDQuanTri])
REFERENCES [dbo].[QuanTri] ([IDQuanTri])
GO
ALTER TABLE [dbo].[HoSoSucKhoe] CHECK CONSTRAINT [FK_HoSoSucKhoe_QuanTri]
GO
ALTER TABLE [dbo].[LichKham]  WITH CHECK ADD  CONSTRAINT [FK_LichKham_NguoiDung] FOREIGN KEY([IDNguoiDung])
REFERENCES [dbo].[NguoiDung] ([IDNguoiDung])
GO
ALTER TABLE [dbo].[LichKham] CHECK CONSTRAINT [FK_LichKham_NguoiDung]
GO
ALTER TABLE [dbo].[LichKham]  WITH CHECK ADD  CONSTRAINT [FK_LichKham_QuanTri] FOREIGN KEY([IDQuanTri])
REFERENCES [dbo].[QuanTri] ([IDQuanTri])
GO
ALTER TABLE [dbo].[LichKham] CHECK CONSTRAINT [FK_LichKham_QuanTri]
GO
ALTER TABLE [dbo].[LichLamViec]  WITH CHECK ADD  CONSTRAINT [FK_LichLamViec_QuanTri] FOREIGN KEY([IDQuanTri])
REFERENCES [dbo].[QuanTri] ([IDQuanTri])
GO
ALTER TABLE [dbo].[LichLamViec] CHECK CONSTRAINT [FK_LichLamViec_QuanTri]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NguoiDung_GioiTinh] FOREIGN KEY([IDGioiTinh])
REFERENCES [dbo].[GioiTinh] ([IDGioiTinh])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_NguoiDung_GioiTinh]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NguoiDung_TinhThanh] FOREIGN KEY([IDTinh])
REFERENCES [dbo].[TinhThanh] ([IDTinh])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_NguoiDung_TinhThanh]
GO
ALTER TABLE [dbo].[QuanTri]  WITH CHECK ADD  CONSTRAINT [FK_QuanTri_Khoa] FOREIGN KEY([IDKhoa])
REFERENCES [dbo].[Khoa] ([IDKhoa])
GO
ALTER TABLE [dbo].[QuanTri] CHECK CONSTRAINT [FK_QuanTri_Khoa]
GO
ALTER TABLE [dbo].[TrungTamGanNhat]  WITH CHECK ADD  CONSTRAINT [FK_TrungTamGanNhat_TinhThanh] FOREIGN KEY([IDTinh])
REFERENCES [dbo].[TinhThanh] ([IDTinh])
GO
ALTER TABLE [dbo].[TrungTamGanNhat] CHECK CONSTRAINT [FK_TrungTamGanNhat_TinhThanh]
GO
USE [master]
GO
ALTER DATABASE [WebAppYte] SET  READ_WRITE 
GO
