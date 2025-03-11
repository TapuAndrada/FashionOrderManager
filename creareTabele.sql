create database db_proiect_bun
go
use db_proiect_bun
go
CREATE TABLE [dbo].[customer](
	[CustomerID] [nchar](5) PRIMARY KEY,
	[Customer_Name] [nvarchar](40) NULL,
	[City] [nvarchar](15) NULL,
	[Country] [nvarchar](15) NULL )
GO
CREATE TABLE [dbo].[appoitments](
	[AppoitmentID] [int] IDENTITY(1,1)PRIMARY KEY,
	[Date] [datetime] NULL, 
	[AppointmentTime] [time] NULL)
GO	
CREATE TABLE [dbo].[measurements](
	[MeasurementsID] [int] IDENTITY(1,1) PRIMARY KEY,
	[CustomerID] [nchar](5) FOREIGN KEY REFERENCES customer(CustomerID),
	[BustSize] [real] NULL,
	[LengthSize] [real] NULL,
	[WaistSize] [real] NULL)
GO
CREATE TABLE [dbo].[garments](
	[GarmentID] [int] IDENTITY(1,1) PRIMARY KEY,
	[Name][nvarchar](50) NULL,
	[Material][nvarchar](50) NULL,
	)
GO
CREATE TABLE [dbo].[services](
	[ServiceID] [int] IDENTITY(1,1) PRIMARY KEY,
	--[GarmentID] [int] FOREIGN KEY REFERENCES garments(GarmentID),
	[ServiceName][nvarchar](40) NULL,
	--[PriceService][money] NOT NULL,
	[ManufacturingDuration] [int] NULL )
GO
CREATE TABLE [dbo].[service_garment](
    [ServiceGarmentID][int] IDENTITY(1,1) PRIMARY KEY,
	[ServiceID] [int] FOREIGN KEY REFERENCES services(ServiceID),
	[GarmentID] [int] FOREIGN KEY REFERENCES garments(GarmentID),
	[Price][money] NULL)
GO
CREATE TABLE [dbo].[orders](
	[OrderID] [int] IDENTITY(1,1) PRIMARY KEY,
	[CustomerID] [nchar](5) FOREIGN KEY REFERENCES customer(CustomerID),
	[AppoitmentID] [int] FOREIGN KEY REFERENCES appoitments(AppoitmentID),
	[ServiceGarmentID] [int] FOREIGN KEY REFERENCES service_garment(ServiceGarmentID),
	[OrderDate] [datetime] NULL,
	[ShipCity] [nvarchar](15) NULL,
	[ShipCountry] [nvarchar](15) NULL,
	[Quantity][int] NULL,
	[FinalPrice][money] NULL)
GO