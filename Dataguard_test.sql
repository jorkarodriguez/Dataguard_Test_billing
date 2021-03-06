USE [master]
GO
/****** Object:  Database [Dataguard_test]    Script Date: 23/06/2020 15:29:11 ******/
CREATE DATABASE [Dataguard_test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Dataguard_test', FILENAME = N'C:\Users\jorkaef\Dataguard_test.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Dataguard_test_log', FILENAME = N'C:\Users\jorkaef\Dataguard_test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Dataguard_test] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Dataguard_test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Dataguard_test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Dataguard_test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Dataguard_test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Dataguard_test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Dataguard_test] SET ARITHABORT OFF 
GO
ALTER DATABASE [Dataguard_test] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Dataguard_test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Dataguard_test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Dataguard_test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Dataguard_test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Dataguard_test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Dataguard_test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Dataguard_test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Dataguard_test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Dataguard_test] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Dataguard_test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Dataguard_test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Dataguard_test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Dataguard_test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Dataguard_test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Dataguard_test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Dataguard_test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Dataguard_test] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Dataguard_test] SET  MULTI_USER 
GO
ALTER DATABASE [Dataguard_test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Dataguard_test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Dataguard_test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Dataguard_test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Dataguard_test] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Dataguard_test] SET QUERY_STORE = OFF
GO
USE [Dataguard_test]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Dataguard_test]
GO
/****** Object:  Table [dbo].[Tb_cliente]    Script Date: 23/06/2020 15:29:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_cliente](
	[Idusuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](10) NULL,
	[Apellido] [nchar](10) NULL,
	[NIT] [nchar](10) NULL,
 CONSTRAINT [PK_Tb_cliente] PRIMARY KEY CLUSTERED 
(
	[Idusuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tb_Factura]    Script Date: 23/06/2020 15:29:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tb_Factura](
	[FacturaId] [int] IDENTITY(1,1) NOT NULL,
	[Encabezado] [varchar](50) NULL,
	[Cliente] [int] NOT NULL,
	[Detalle] [int] NOT NULL,
	[fecha] [datetime] NULL,
 CONSTRAINT [PK_Tb_Factura] PRIMARY KEY CLUSTERED 
(
	[FacturaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detalle_factura]    Script Date: 23/06/2020 15:29:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_factura](
	[DetallID] [int] IDENTITY(1,1) NOT NULL,
	[Factura] [int] NULL,
	[Productos] [int] NULL,
 CONSTRAINT [PK_Detalle_factura] PRIMARY KEY CLUSTERED 
(
	[DetallID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 23/06/2020 15:29:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[ProductoId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Precio] [float] NULL,
	[Descripcion] [varchar](50) NULL,
	[Detalle] [int] NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[ProductoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Detallefactura]    Script Date: 23/06/2020 15:29:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Detallefactura]
AS
SELECT        dbo.Tb_cliente.Idusuario, dbo.Tb_cliente.Nombre, dbo.Producto.Nombre AS productos, dbo.Producto.Precio, dbo.Producto.Descripcion
FROM            dbo.Detalle_factura INNER JOIN
                         dbo.Producto ON dbo.Detalle_factura.DetallID = dbo.Producto.Detalle INNER JOIN
                         dbo.Tb_Factura ON dbo.Detalle_factura.Factura = dbo.Tb_Factura.FacturaId INNER JOIN
                         dbo.Tb_cliente ON dbo.Tb_Factura.Cliente = dbo.Tb_cliente.Idusuario
GO
/****** Object:  View [dbo].[View_TOTAL_A_PAGAR]    Script Date: 23/06/2020 15:29:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_TOTAL_A_PAGAR]
AS
SELECT        SUM(dbo.Producto.Precio) AS total, dbo.Tb_cliente.Idusuario
FROM            dbo.Detalle_factura INNER JOIN
                         dbo.Producto ON dbo.Detalle_factura.DetallID = dbo.Producto.Detalle INNER JOIN
                         dbo.Tb_Factura ON dbo.Detalle_factura.Factura = dbo.Tb_Factura.FacturaId INNER JOIN
                         dbo.Tb_cliente ON dbo.Tb_Factura.Cliente = dbo.Tb_cliente.Idusuario
GROUP BY dbo.Tb_cliente.Idusuario
GO
ALTER TABLE [dbo].[Detalle_factura]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_factura_Tb_Factura] FOREIGN KEY([Factura])
REFERENCES [dbo].[Tb_Factura] ([FacturaId])
GO
ALTER TABLE [dbo].[Detalle_factura] CHECK CONSTRAINT [FK_Detalle_factura_Tb_Factura]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Detalle_factura] FOREIGN KEY([Detalle])
REFERENCES [dbo].[Detalle_factura] ([DetallID])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Detalle_factura]
GO
ALTER TABLE [dbo].[Tb_Factura]  WITH CHECK ADD  CONSTRAINT [FK_Tb_Factura_Tb_cliente] FOREIGN KEY([Cliente])
REFERENCES [dbo].[Tb_cliente] ([Idusuario])
GO
ALTER TABLE [dbo].[Tb_Factura] CHECK CONSTRAINT [FK_Tb_Factura_Tb_cliente]
GO
/****** Object:  StoredProcedure [dbo].[ShowDetalleFactura]    Script Date: 23/06/2020 15:29:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ShowDetalleFactura]	
as 
select * from View_Detallefactura
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
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Detalle_factura"
            Begin Extent = 
               Top = 68
               Left = 279
               Bottom = 181
               Right = 449
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Producto"
            Begin Extent = 
               Top = 44
               Left = 73
               Bottom = 174
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Tb_Factura"
            Begin Extent = 
               Top = 22
               Left = 546
               Bottom = 152
               Right = 716
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tb_cliente"
            Begin Extent = 
               Top = 53
               Left = 838
               Bottom = 183
               Right = 1008
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
         Or = 13' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Detallefactura'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'50
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Detallefactura'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Detallefactura'
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
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Detalle_factura"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Producto"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tb_cliente"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tb_Factura"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 136
               Right = 832
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
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
 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_TOTAL_A_PAGAR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'     End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_TOTAL_A_PAGAR'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_TOTAL_A_PAGAR'
GO
USE [master]
GO
ALTER DATABASE [Dataguard_test] SET  READ_WRITE 
GO
