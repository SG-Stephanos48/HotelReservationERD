USE [master]
GO
/****** Object:  Database [HotelReservation]    Script Date: 12/07/2020 4:25:06 PM ******/
CREATE DATABASE HotelReservation;
GO
ALTER DATABASE [HotelReservation] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelReservation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelReservation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelReservation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelReservation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelReservation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelReservation] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelReservation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HotelReservation] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [HotelReservation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelReservation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelReservation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelReservation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelReservation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelReservation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelReservation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelReservation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelReservation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HotelReservation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelReservation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelReservation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelReservation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelReservation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelReservation] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HotelReservation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelReservation] SET RECOVERY FULL 
GO
ALTER DATABASE [HotelReservation] SET  MULTI_USER 
GO
ALTER DATABASE [HotelReservation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelReservation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelReservation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelReservation] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HotelReservation', N'ON'
GO
USE HotelReservation
GO
/****** Object:  Table [dbo].[AddOnPrice]    Script Date: 12/07/2020 4:25:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddOnPrice](
	[AddOnPriceId] [int] NOT NULL,
	[FromDateId] [int] NULL,
	[ToDateId] [int] NULL,
	[Price] [money] NULL,
	[AddOnId] [int] NULL,
 CONSTRAINT [PK_AddOnPrice] PRIMARY KEY CLUSTERED 
(
	[AddOnPriceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AddOns]    Script Date: 12/07/2020 4:25:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddOns](
	[AddOnId] [int] NOT NULL,
	[AddOnItem] [nvarchar](50) NULL,
 CONSTRAINT [PK_AddOns] PRIMARY KEY CLUSTERED 
(
	[AddOnId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Billing]    Script Date: 12/07/2020 4:25:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Billing](
	[BillingId] [int] NOT NULL,
	[ReservationRoomId] [int] NULL,
	[BillTotal] [money] NULL,
	[TaxTotal] [money] NULL,
 CONSTRAINT [PK_Billing] PRIMARY KEY CLUSTERED 
(
	[BillingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Guest]    Script Date: 12/07/2020 4:25:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guest](
	[GuestId] [int] NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
 CONSTRAINT [PK_Guest] PRIMARY KEY CLUSTERED 
(
	[GuestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PromotionCode]    Script Date: 12/07/2020 4:25:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromotionCode](
	[PromotionCodeId] [int] NOT NULL,
	[DateId] [int] NULL,
	[PromotionCode] [nvarchar](50) NULL,
	[PercentageOff] [float] NULL,
	[DollarsOff] [money] NULL,
 CONSTRAINT [PK_PromotionCode] PRIMARY KEY CLUSTERED 
(
	[PromotionCodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 12/07/2020 4:25:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[ReservationId] [int] NOT NULL,
	[RoomId] [int] NULL,
	[GuestId] [int] NULL,
	[FromDateId] [int] NULL,
	[ToDateId] [int] NULL,
	[PromotionCodeId] [int] NULL,
	[RoomRateId] [int] NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GuestReservation]    Script Date: 12/07/2020 4:25:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuestReservation](
	[GuestReservationId] [int] NOT NULL,
	[ReservationId] [int] NULL,
	[GuestId] [int] NULL,
 CONSTRAINT [PK_GuestReservation] PRIMARY KEY CLUSTERED 
(
	[GuestReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoomAmenity]    Script Date: 12/07/2020 4:25:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomAmenity](
	[RoomAmenityId] [int] NOT NULL,
	[RoomId] [int] NULL,
	[AmenityId] [int] NULL,
 CONSTRAINT [PK_RoomAmenity] PRIMARY KEY CLUSTERED 
(
	[RoomAmenityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO
/****** Object:  Table [dbo].[ReservationRoom]    Script Date: 12/07/2020 4:25:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationRoom](
	[ReservationRoomId] [int] NOT NULL,
	[ReservationId] [int] NULL,
	[AddOnPriceId] [int] NULL,
 CONSTRAINT [PK_ReservationRoom] PRIMARY KEY CLUSTERED 
(
	[ReservationRoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Room]    Script Date: 12/07/2020 4:25:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomId] [int] NOT NULL,
	[Floor] [nchar](10) NULL,
	[OccupancyLimit] [int] NULL,
	[RoomNo] [nchar](10) NULL,
	[RoomTypeId] [int] NULL,
	[RoomAmenityId] [int] NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoomAmenity]    Script Date: 12/07/2020 4:25:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amenity](
	[AmenityId] [int] NOT NULL,
	[AmenityName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Amenity] PRIMARY KEY CLUSTERED 
(
	[AmenityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoomRate]    Script Date: 12/07/2020 4:25:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomRate](
	[RoomRateId] [int] NOT NULL,
	[FromDateId] [int] NULL,
	[ToDateId] [int] NULL,
	[RoomId] [int] NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_RoomRate] PRIMARY KEY CLUSTERED 
(
	[RoomRateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 12/07/2020 4:25:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[RoomTypeId] [int] NOT NULL,
	[RoomType] [nvarchar](50) NULL,
	[RoomDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_RoomType] PRIMARY KEY CLUSTERED 
(
	[RoomTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[AddOnPrice]  WITH CHECK ADD  CONSTRAINT [FK_AddOnPrice_AddOns] FOREIGN KEY([AddOnId])
REFERENCES [dbo].[AddOns] ([AddOnId])
GO
ALTER TABLE [dbo].[AddOnPrice] CHECK CONSTRAINT [FK_AddOnPrice_AddOns]

GO
ALTER TABLE [dbo].[Billing]  WITH CHECK ADD  CONSTRAINT [FK_Billing_ReservationRoom] FOREIGN KEY([ReservationRoomId])
REFERENCES [dbo].[ReservationRoom] ([ReservationRoomId])
GO
ALTER TABLE [dbo].[Billing] CHECK CONSTRAINT [FK_Billing_ReservationRoom]

GO
ALTER TABLE [dbo].[GuestReservation]  WITH CHECK ADD  CONSTRAINT [FK_GuestReservation_Guest] FOREIGN KEY([GuestReservationId])
REFERENCES [dbo].[Guest] ([GuestId])
GO
ALTER TABLE [dbo].[GuestReservation] CHECK CONSTRAINT [FK_GuestReservation_Guest]

GO
ALTER TABLE [dbo].[GuestReservation]  WITH CHECK ADD  CONSTRAINT [FK_GuestReservation_Reservation] FOREIGN KEY([GuestReservationId])
REFERENCES [dbo].[Reservation] ([ReservationId])
GO
ALTER TABLE [dbo].[GuestReservation] CHECK CONSTRAINT [FK_GuestReservation_Reservation]

GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Guest] FOREIGN KEY([GuestId])
REFERENCES [dbo].[Guest] ([GuestId])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Guest]

GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_PromotionCode] FOREIGN KEY([PromotionCodeId])
REFERENCES [dbo].[PromotionCode] ([PromotionCodeId])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_PromotionCode]

GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Room]

GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_RoomRate] FOREIGN KEY([RoomRateId])
REFERENCES [dbo].[RoomRate] ([RoomRateId])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_RoomRate]

GO
ALTER TABLE [dbo].[ReservationRoom]  WITH CHECK ADD  CONSTRAINT [FK_ReservationRoom_AddOnPrice] FOREIGN KEY([AddOnPriceId])
REFERENCES [dbo].[AddOnPrice] ([AddOnPriceId])
GO
ALTER TABLE [dbo].[ReservationRoom] CHECK CONSTRAINT [FK_ReservationRoom_AddOnPrice]

GO
ALTER TABLE [dbo].[ReservationRoom]  WITH CHECK ADD  CONSTRAINT [FK_ReservationRoom_Reservation] FOREIGN KEY([ReservationId])
REFERENCES [dbo].[Reservation] ([ReservationId])
GO
ALTER TABLE [dbo].[ReservationRoom] CHECK CONSTRAINT [FK_ReservationRoom_Reservation]

GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_RoomType] FOREIGN KEY([RoomTypeId])
REFERENCES [dbo].[RoomType] ([RoomTypeId])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_RoomType]

GO
ALTER TABLE [dbo].[RoomAmenity]  WITH CHECK ADD  CONSTRAINT [FK_RoomAmenity_Amenity] FOREIGN KEY([AmenityId])
REFERENCES [dbo].[Amenity] ([AmenityId])
GO
ALTER TABLE [dbo].[RoomAmenity] CHECK CONSTRAINT [FK_RoomAmenity_Amenity]

GO
ALTER TABLE [dbo].[RoomAmenity]  WITH CHECK ADD  CONSTRAINT [FK_RoomAmenity_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
GO
ALTER TABLE [dbo].[RoomAmenity] CHECK CONSTRAINT [FK_RoomAmenity_Room]

GO
ALTER TABLE [dbo].[RoomRate]  WITH CHECK ADD  CONSTRAINT [FK_RoomRate_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
GO
ALTER TABLE [dbo].[RoomRate] CHECK CONSTRAINT [FK_RoomRate_Room]

GO
USE [master]
GO
ALTER DATABASE [HotelReservation] SET  READ_WRITE 
GO
